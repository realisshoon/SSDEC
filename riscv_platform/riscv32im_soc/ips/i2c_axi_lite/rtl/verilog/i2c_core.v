//------------------------------------------------------------------------------
//  Copyright (c) 2024 by Ando Ki.
//  All right reserved.
//
// This program is distributed in the hope that it
// will be useful to understand Ando Ki's work,
// BUT WITHOUT ANY WARRANTY.
//------------------------------------------------------------------------------
// i2c_core.v - I2C Core Logic
//------------------------------------------------------------------------------
// VERSION = 2024.10.03.
//------------------------------------------------------------------------------
// I2C Protocol Implementation:
// - Master mode only
// - 7-bit addressing
// - Standard mode (100kHz) and Fast mode (400kHz)
// - Start/Stop conditions
// - Read/Write operations
//------------------------------------------------------------------------------

module i2c_core
     #(parameter CLK_FREQ=100_000_000) // Clock frequency in Hz
(
      input  wire        aresetn
    , input  wire        aclk
    , input  wire [7:0]  addr
    , input  wire [31:0] wdataD
    , output reg  [31:0] rdata
    , input  wire        rden
    , input  wire        wren
    , output wire        i2c_scl
    , output wire        i2c_sda
    , input  wire        i2c_sda_in
    , output wire        i2c_busy
    , output wire        i2c_error
    , output wire [7:0]  i2c_rx_data
    , output wire        i2c_rx_valid
    , input  wire [7:0]  i2c_tx_data
    , input  wire        i2c_tx_start
    , input  wire        i2c_tx_stop
    , input  wire        i2c_tx_write
    , input  wire        i2c_tx_read
    , input  wire [6:0]  i2c_slave_addr
    , input  wire [7:0]  i2c_clk_div
);

    //--------------------------------------------------------------------------
    // State machine definitions
    //--------------------------------------------------------------------------
    localparam IDLE        = 4'h0;
    localparam START       = 4'h1;
    localparam ADDR_WRITE  = 4'h2;
    localparam ADDR_ACK    = 4'h3;
    localparam DATA_WRITE  = 4'h4;
    localparam DATA_ACK    = 4'h5;
    localparam DATA_READ   = 4'h6;
    localparam DATA_NACK   = 4'h7;
    localparam STOP        = 4'h8;
    localparam ERROR       = 4'h9;
    
    //--------------------------------------------------------------------------
    // Internal signals
    //--------------------------------------------------------------------------
    reg [3:0]  state;
    reg [3:0]  next_state;
    reg [7:0]  bit_counter;
    reg [7:0]  data_shift;
    reg [6:0]  addr_shift;
    reg        scl_out;
    reg        sda_out;
    reg        sda_oe;      // SDA output enable
    reg        busy;
    reg        error;
    reg [7:0]  rx_data;
    reg        rx_valid;
    reg [15:0] clk_counter;
    reg        clk_div_en;
    reg        scl_edge;
    reg        sda_sample;
    reg        sda_setup;
    
    //--------------------------------------------------------------------------
    // Clock divider
    //--------------------------------------------------------------------------
    always @(posedge aclk or negedge aresetn) begin
        if (aresetn == 1'b0) begin
            clk_counter <= 16'h0000;
            clk_div_en <= 1'b0;
            scl_edge <= 1'b0;
        end else begin
            if (clk_div_en) begin
                if (clk_counter >= {i2c_clk_div, 8'h00}) begin // i2c_clk_div * 256
                    clk_counter <= 16'h0000;
                    scl_edge <= 1'b1;
                end else begin
                    clk_counter <= clk_counter + 1'b1;
                    scl_edge <= 1'b0;
                end
            end else begin
                clk_counter <= 16'h0000;
                scl_edge <= 1'b0;
            end
        end
    end
    
    //--------------------------------------------------------------------------
    // State machine
    //--------------------------------------------------------------------------
    always @(posedge aclk or negedge aresetn) begin
        if (aresetn == 1'b0) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end
    
    //--------------------------------------------------------------------------
    // Next state logic
    //--------------------------------------------------------------------------
    always @(*) begin
        next_state = state;
        case (state)
            IDLE: begin
                if (i2c_tx_start) begin
                    next_state = START;
                end
            end
            
            START: begin
                if (scl_edge) begin
                    next_state = ADDR_WRITE;
                end
            end
            
            ADDR_WRITE: begin
                if (bit_counter == 8'h07 && scl_edge) begin
                    next_state = ADDR_ACK;
                end
            end
            
            ADDR_ACK: begin
                if (scl_edge) begin
                    if (i2c_tx_write) begin
                        next_state = DATA_WRITE;
                    end else if (i2c_tx_read) begin
                        next_state = DATA_READ;
                    end else begin
                        next_state = STOP;
                    end
                end
            end
            
            DATA_WRITE: begin
                if (bit_counter == 8'h07 && scl_edge) begin
                    next_state = DATA_ACK;
                end
            end
            
            DATA_ACK: begin
                if (scl_edge) begin
                    if (i2c_tx_stop) begin
                        next_state = STOP;
                    end else begin
                        next_state = DATA_WRITE;
                    end
                end
            end
            
            DATA_READ: begin
                if (bit_counter == 8'h07 && scl_edge) begin
                    next_state = DATA_NACK;
                end
            end
            
            DATA_NACK: begin
                if (scl_edge) begin
                    if (i2c_tx_stop) begin
                        next_state = STOP;
                    end else begin
                        next_state = DATA_READ;
                    end
                end
            end
            
            STOP: begin
                if (scl_edge) begin
                    next_state = IDLE;
                end
            end
            
            ERROR: begin
                if (i2c_tx_start) begin
                    next_state = START;
                end
            end
            
            default: begin
                next_state = IDLE;
            end
        endcase
    end
    
    //--------------------------------------------------------------------------
    // Control logic
    //--------------------------------------------------------------------------
    always @(posedge aclk or negedge aresetn) begin
        if (aresetn == 1'b0) begin
            bit_counter <= 8'h00;
            data_shift <= 8'h00;
            addr_shift <= 7'h00;
            scl_out <= 1'b1;
            sda_out <= 1'b1;
            sda_oe <= 1'b0;
            busy <= 1'b0;
            error <= 1'b0;
            rx_data <= 8'h00;
            rx_valid <= 1'b0;
            clk_div_en <= 1'b0;
            sda_sample <= 1'b0;
            sda_setup <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    scl_out <= 1'b1;
                    sda_out <= 1'b1;
                    sda_oe <= 1'b0;
                    busy <= 1'b0;
                    error <= 1'b0;
                    clk_div_en <= 1'b0;
                    bit_counter <= 8'h00;
                    rx_valid <= 1'b0;
                end
                
                START: begin
                    busy <= 1'b1;
                    clk_div_en <= 1'b1;
                    scl_out <= 1'b1;
                    sda_out <= 1'b0;
                    sda_oe <= 1'b1;
                    addr_shift <= {i2c_slave_addr, 1'b0}; // R/W bit = 0 for write
                    bit_counter <= 8'h00;
                end
                
                ADDR_WRITE: begin
                    // Change SDA only while SCL is low; count bit at end of high
                    if (scl_edge) begin
                        if (scl_out == 1'b0) begin
                            // Prepare next bit during low period
                            sda_out <= addr_shift[7];
                        end else begin
                            // End of high period: shift/counter
                            if (bit_counter < 8'h07) begin
                                addr_shift <= {addr_shift[6:0], 1'b0};
                                bit_counter <= bit_counter + 1'b1;
                            end
                        end
                        scl_out <= ~scl_out;
                    end
                end
                
                ADDR_ACK: begin
                    sda_oe <= 1'b0; // Release SDA for ACK
                    if (scl_edge) begin
                        if (scl_out == 1'b1) begin
                            // Sample ACK during SCL high
                            if (i2c_sda_in == 1'b1) begin // NACK received
                                error <= 1'b1;
                            end
                            bit_counter <= 8'h00;
                            if (i2c_tx_read) begin
                                addr_shift <= {i2c_slave_addr, 1'b1};
                            end else begin
                                data_shift <= i2c_tx_data;
                            end
                        end
                        scl_out <= ~scl_out;
                    end
                end
                
                DATA_WRITE: begin
                    sda_oe <= 1'b1;
                    if (scl_edge) begin
                        if (scl_out == 1'b0) begin
                            // Drive next bit while SCL low
                            sda_out <= data_shift[7];
                        end else begin
                            // After SCL high completes, shift/counter
                            if (bit_counter < 8'h07) begin
                                data_shift <= {data_shift[6:0], 1'b0};
                                bit_counter <= bit_counter + 1'b1;
                            end
                        end
                        scl_out <= ~scl_out;
                    end
                end
                
                DATA_ACK: begin
                    sda_oe <= 1'b0; // Release SDA for ACK
                    if (scl_edge) begin
                        if (scl_out == 1'b1) begin
                            if (i2c_sda_in == 1'b1) begin // NACK
                                error <= 1'b1;
                            end
                            bit_counter <= 8'h00;
                            data_shift <= i2c_tx_data;
                        end
                        scl_out <= ~scl_out;
                    end
                end
                
                DATA_READ: begin
                    sda_oe <= 1'b0; // Release SDA for data
                    if (scl_edge) begin
                        if (scl_out == 1'b1) begin
                            // Sample data only while SCL high
                            if (bit_counter < 8'h07) begin
                                data_shift <= {data_shift[6:0], i2c_sda_in};
                                bit_counter <= bit_counter + 1'b1;
                            end else begin
                                rx_data <= {data_shift[6:0], i2c_sda_in};
                                rx_valid <= 1'b1;
                            end
                        end
                        scl_out <= ~scl_out;
                    end
                end
                
                DATA_NACK: begin
                    sda_oe <= 1'b1;
                    if (scl_edge) begin
                        if (scl_out == 1'b0) begin
                            sda_out <= 1'b1; // NACK while SCL low (will be held during high)
                        end else begin
                            bit_counter <= 8'h00;
                        end
                        scl_out <= ~scl_out;
                    end
                end
                
                STOP: begin
                    // Ensure STOP: SDA low->high while SCL high
                    scl_out <= 1'b1;
                    sda_oe <= 1'b1;
                    sda_out <= 1'b1;
                    clk_div_en <= 1'b0;
                end
                
                ERROR: begin
                    scl_out <= 1'b1;
                    sda_out <= 1'b1;
                    sda_oe <= 1'b0;
                    clk_div_en <= 1'b0;
                    busy <= 1'b0;
                end
            endcase
        end
    end
    
    //--------------------------------------------------------------------------
    // Output assignments
    //--------------------------------------------------------------------------
    assign i2c_scl = scl_out;
    assign i2c_sda = sda_oe ? sda_out : 1'bz;
    assign i2c_busy = busy;
    assign i2c_error = error;
    assign i2c_rx_data = rx_data;
    assign i2c_rx_valid = rx_valid;
    
    // Register read logic
    always @(*) begin
        case (addr[7:2])
            6'h00: rdata = {24'h000000, state, 4'h0, busy, error, rx_valid, 1'b0};
            6'h01: rdata = {24'h000000, rx_data};
            6'h02: rdata = {25'h0000000, i2c_slave_addr};
            6'h03: rdata = {24'h000000, i2c_clk_div};
            default: rdata = 32'h00000000;
        endcase
    end

endmodule
//------------------------------------------------------------------------------
// Revision history
//
// 2024.10.03: Started by Ando Ki (andoki@gmail.com)
//------------------------------------------------------------------------------
