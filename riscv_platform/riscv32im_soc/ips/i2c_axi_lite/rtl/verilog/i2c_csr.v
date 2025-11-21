//------------------------------------------------------------------------------
//  Copyright (c) 2024 by Ando Ki.
//  All right reserved.
//
// This program is distributed in the hope that it
// will be useful to understand Ando Ki's work,
// BUT WITHOUT ANY WARRANTY.
//------------------------------------------------------------------------------
// i2c_csr.v - I2C Control and Status Registers
//------------------------------------------------------------------------------
// VERSION = 2024.10.03.
//------------------------------------------------------------------------------
// I2C Register Map:
//  0x00: I2C_CTRL    - Control Register
//  0x04: I2C_STATUS  - Status Register  
//  0x08: I2C_DATA    - Data Register
//  0x0C: I2C_ADDR    - Address Register
//  0x10: I2C_CLK_DIV - Clock Divider Register
//------------------------------------------------------------------------------

module i2c_csr
     #(parameter ADD_WIDTH=8)
(
      input  wire        aresetn
    , input  wire        aclk
    , input  wire [ADD_WIDTH-1:0] addr
    , input  wire [31:0] wdata
    , output reg  [31:0] rdata
    , input  wire        rden
    , input  wire        wren
    , output wire        i2c_scl
    , output wire        i2c_sda
    , input  wire        i2c_sda_in
    , input  wire        core_i2c_scl
    , input  wire        core_i2c_sda
    , output wire        interrupt
    , input  wire        i2c_busy
    , input  wire        i2c_error
    , input  wire [7:0]  i2c_rx_data
    , input  wire        i2c_rx_valid
    , output reg  [7:0]  i2c_tx_data
    , output reg         i2c_tx_start
    , output reg         i2c_tx_stop
    , output reg         i2c_tx_write
    , output reg         i2c_tx_read
    , output reg  [6:0]  i2c_slave_addr
    , output reg  [7:0]  i2c_clk_div
);

    //--------------------------------------------------------------------------
    // Register definitions
    //--------------------------------------------------------------------------
    // I2C_CTRL Register (0x00)
    reg [31:0] i2c_ctrl;
    localparam CTRL_ENABLE     = 0;  // I2C Enable
    localparam CTRL_START      = 1;  // Start condition
    localparam CTRL_STOP       = 2;  // Stop condition
    localparam CTRL_WRITE      = 3;  // Write operation
    localparam CTRL_READ       = 4;  // Read operation
    localparam CTRL_ACK        = 5;  // Acknowledge
    localparam CTRL_INT_EN     = 6;  // Interrupt enable
    localparam CTRL_RESET      = 7;  // Reset I2C core
    
    // I2C_STATUS Register (0x04)
    reg [31:0] i2c_status;
    localparam STATUS_BUSY     = 0;  // I2C busy
    localparam STATUS_ERROR    = 1;  // I2C error
    localparam STATUS_RX_VALID = 2;  // RX data valid
    localparam STATUS_TX_READY = 3;  // TX ready
    localparam STATUS_ACK      = 4;  // Acknowledge received
    localparam STATUS_ARB_LOST = 5;  // Arbitration lost
    
    // I2C_DATA Register (0x08)
    reg [31:0] i2c_data;
    
    // I2C_ADDR Register (0x0C)
    reg [31:0] i2c_addr;
    
    // I2C_CLK_DIV Register (0x10)
    reg [31:0] i2c_clk_div_reg;
    
    //--------------------------------------------------------------------------
    // Internal signals
    //--------------------------------------------------------------------------
    reg [7:0] rx_data_reg;
    reg       rx_valid_reg;
    reg       tx_ready_reg;
    reg       ack_reg;
    reg       arb_lost_reg;
    
    //--------------------------------------------------------------------------
    // Register read/write logic
    //--------------------------------------------------------------------------
    always @(posedge aclk or negedge aresetn) begin
        if (aresetn == 1'b0) begin
            i2c_ctrl      <= 32'h0000_0000;
            i2c_status    <= 32'h0000_0000;
            i2c_data      <= 32'h0000_0000;
            i2c_addr      <= 32'h0000_0000;
            i2c_clk_div_reg <= 32'h0000_0064; // Default: 100 (100kHz at 10MHz)
            rx_data_reg   <= 8'h00;
            rx_valid_reg  <= 1'b0;
            tx_ready_reg  <= 1'b1;
            ack_reg       <= 1'b0;
            arb_lost_reg  <= 1'b0;
        end else begin
            // Write operations
            if (wren) begin
                case (addr[7:2])
                    6'h00: i2c_ctrl <= wdata;
                    6'h01: i2c_data <= wdata;
                    6'h02: i2c_addr <= wdata;
                    6'h03: i2c_clk_div_reg <= wdata;
                    default: begin end
                endcase
            end
            
            // Read operations
            if (rden) begin
                case (addr[7:2])
                    6'h00: rdata <= i2c_ctrl;
                    6'h01: rdata <= i2c_status;
                    6'h02: rdata <= i2c_data;
                    6'h03: rdata <= i2c_addr;
                    6'h04: rdata <= i2c_clk_div_reg;
                    default: rdata <= 32'h0000_0000;
                endcase
            end
            
            // Update status register
            i2c_status[STATUS_BUSY]     <= i2c_busy;
            i2c_status[STATUS_ERROR]    <= i2c_error;
            i2c_status[STATUS_RX_VALID] <= rx_valid_reg;
            i2c_status[STATUS_TX_READY] <= tx_ready_reg;
            i2c_status[STATUS_ACK]      <= ack_reg;
            i2c_status[STATUS_ARB_LOST] <= arb_lost_reg;
            
            // Update RX data
            if (i2c_rx_valid) begin
                rx_data_reg <= i2c_rx_data;
                rx_valid_reg <= 1'b1;
            end else if (rden && (addr[7:2] == 6'h02)) begin
                rx_valid_reg <= 1'b0; // Clear after read
            end
            
            // Update TX ready
            if (wren && (addr[7:2] == 6'h02)) begin
                tx_ready_reg <= 1'b0;
            end else if (!i2c_busy) begin
                tx_ready_reg <= 1'b1;
            end
            
            // Update acknowledge
            if (i2c_busy && !i2c_error) begin
                ack_reg <= 1'b1;
            end else if (i2c_error) begin
                ack_reg <= 1'b0;
            end
            
            // Update arbitration lost
            if (i2c_error) begin
                arb_lost_reg <= 1'b1;
            end else if (i2c_ctrl[CTRL_RESET]) begin
                arb_lost_reg <= 1'b0;
            end
        end
    end
    
    //--------------------------------------------------------------------------
    // Output assignments
    //--------------------------------------------------------------------------
    // Pass-through SCL/SDA from core with enable-controlled tri-state
    assign i2c_scl = i2c_ctrl[CTRL_ENABLE] ? core_i2c_scl : 1'bz;
    assign i2c_sda = i2c_ctrl[CTRL_ENABLE] ? core_i2c_sda : 1'bz;
    
    assign interrupt = i2c_status[STATUS_RX_VALID] && i2c_ctrl[CTRL_INT_EN];
    
    assign i2c_tx_data = i2c_data[7:0];
    assign i2c_tx_start = i2c_ctrl[CTRL_START];
    assign i2c_tx_stop = i2c_ctrl[CTRL_STOP];
    assign i2c_tx_write = i2c_ctrl[CTRL_WRITE];
    assign i2c_tx_read = i2c_ctrl[CTRL_READ];
    assign i2c_slave_addr = i2c_addr[6:0];
    assign i2c_clk_div = i2c_clk_div_reg[7:0];

endmodule
//------------------------------------------------------------------------------
// Revision history
//
// 2024.10.03: Started by Ando Ki (andoki@gmail.com)
//------------------------------------------------------------------------------
