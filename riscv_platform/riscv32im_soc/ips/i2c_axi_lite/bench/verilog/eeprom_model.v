//------------------------------------------------------------------------------
//  Copyright (c) 2024 by Ando Ki.
//  All right reserved.
//------------------------------------------------------------------------------
// eeprom_model.v - I2C EEPROM Model for Testing
//------------------------------------------------------------------------------
// VERSION = 2024.10.03.
//------------------------------------------------------------------------------
// Simple I2C EEPROM model for testing I2C controller
// Features:
// - 24C02 compatible (256 bytes)
// - 7-bit addressing
// - Write and read operations
// - Acknowledge generation
//------------------------------------------------------------------------------

module eeprom_model
     #(parameter EEPROM_SIZE = 256,
       parameter SLAVE_ADDR = 7'h50)
(
      input  wire        clk
    , input  wire        rst_n
    , inout  wire        sda
    , input  wire        scl
);

    //--------------------------------------------------------------------------
    // Internal signals
    //--------------------------------------------------------------------------
    reg [7:0] memory [0:EEPROM_SIZE-1];
    reg [7:0] addr_reg;
    reg [7:0] data_reg;
    reg [2:0] state;
    reg [3:0] bit_count;
    reg       sda_out;
    reg       sda_oe;
    reg       ack_out;
    reg       write_mode;
    reg       addr_received;
    
    //--------------------------------------------------------------------------
    // State definitions
    //--------------------------------------------------------------------------
    localparam IDLE        = 3'h0;
    localparam START       = 3'h1;
    localparam ADDR        = 3'h2;
    localparam ACK_ADDR    = 3'h3;
    localparam DATA        = 3'h4;
    localparam ACK_DATA    = 3'h5;
    localparam STOP        = 3'h6;
    
    //--------------------------------------------------------------------------
    // SDA control
    //--------------------------------------------------------------------------
    assign sda = sda_oe ? sda_out : 1'bz;
    
    //--------------------------------------------------------------------------
    // State machine
    //--------------------------------------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (rst_n == 1'b0) begin
            state <= IDLE;
            bit_count <= 4'h0;
            sda_out <= 1'b1;
            sda_oe <= 1'b0;
            ack_out <= 1'b0;
            write_mode <= 1'b0;
            addr_received <= 1'b0;
            addr_reg <= 8'h00;
            data_reg <= 8'h00;
        end else begin
            case (state)
                IDLE: begin
                    sda_oe <= 1'b0;
                    ack_out <= 1'b0;
                    if (scl == 1'b1 && sda == 1'b0) begin // Start condition
                        state <= START;
                    end
                end
                
                START: begin
                    if (scl == 1'b0) begin
                        state <= ADDR;
                        bit_count <= 4'h0;
                        addr_reg <= 8'h00;
                    end
                end
                
                ADDR: begin
                    if (scl == 1'b1) begin
                        addr_reg <= {addr_reg[6:0], sda};
                        bit_count <= bit_count + 1'b1;
                    end else if (bit_count == 4'h8) begin
                        state <= ACK_ADDR;
                        write_mode <= ~addr_reg[0]; // R/W bit
                    end
                end
                
                ACK_ADDR: begin
                    if (addr_reg[7:1] == SLAVE_ADDR) begin
                        sda_out <= 1'b0; // ACK
                        sda_oe <= 1'b1;
                        ack_out <= 1'b1;
                        if (scl == 1'b0) begin
                            state <= DATA;
                            bit_count <= 4'h0;
                            data_reg <= 8'h00;
                        end
                    end else begin
                        state <= IDLE; // Not our address
                    end
                end
                
                DATA: begin
                    if (scl == 1'b1) begin
                        if (write_mode) begin
                            data_reg <= {data_reg[6:0], sda};
                        end else begin
                            sda_out <= memory[addr_reg][7-bit_count];
                            sda_oe <= 1'b1;
                        end
                        bit_count <= bit_count + 1'b1;
                    end else if (bit_count == 4'h8) begin
                        state <= ACK_DATA;
                        if (write_mode) begin
                            memory[addr_reg] <= data_reg;
                            addr_reg <= addr_reg + 1'b1; // Auto-increment
                        end
                    end
                end
                
                ACK_DATA: begin
                    if (write_mode) begin
                        sda_out <= 1'b0; // ACK
                        sda_oe <= 1'b1;
                    end else begin
                        sda_oe <= 1'b0; // Release SDA for master ACK
                    end
                    
                    if (scl == 1'b0) begin
                        if (scl == 1'b1 && sda == 1'b1) begin // Stop condition
                            state <= STOP;
                        end else begin
                            state <= DATA;
                            bit_count <= 4'h0;
                            data_reg <= 8'h00;
                            if (write_mode) begin
                                addr_reg <= addr_reg + 1'b1; // Auto-increment
                            end
                        end
                    end
                end
                
                STOP: begin
                    sda_oe <= 1'b0;
                    ack_out <= 1'b0;
                    state <= IDLE;
                end
                
                default: begin
                    state <= IDLE;
                end
            endcase
        end
    end
    
    //--------------------------------------------------------------------------
    // Initialize memory with test data
    //--------------------------------------------------------------------------
    integer i;
    initial begin
        for (i = 0; i < EEPROM_SIZE; i = i + 1) begin
            memory[i] = i[7:0]; // Initialize with address value
        end
    end

endmodule
//------------------------------------------------------------------------------
// Revision history
//
// 2024.10.03: Started by Ando Ki (andoki@gmail.com)
//------------------------------------------------------------------------------
