//-----------------------------------------------------------------------------
// Copyright (c) 2024 by Ando Ki.
// All right reserved.
//------------------------------------------------------------------------------
// VERSION: 2024.10.03.
//------------------------------------------------------------------------------
// I2C AXI-Lite Test Tasks
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// I2C Register Addresses
//------------------------------------------------------------------------------
`define I2C_CTRL    8'h00
`define I2C_STATUS  8'h04
`define I2C_DATA    8'h08
`define I2C_ADDR    8'h0C
`define I2C_CLK_DIV 8'h10

//------------------------------------------------------------------------------
// I2C Control Register Bits
//------------------------------------------------------------------------------
`define CTRL_ENABLE     0
`define CTRL_START      1
`define CTRL_STOP       2
`define CTRL_WRITE      3
`define CTRL_READ       4
`define CTRL_ACK        5
`define CTRL_INT_EN     6
`define CTRL_RESET      7

//------------------------------------------------------------------------------
// I2C Status Register Bits
//------------------------------------------------------------------------------
`define STATUS_BUSY     0
`define STATUS_ERROR    1
`define STATUS_RX_VALID 2
`define STATUS_TX_READY 3
`define STATUS_ACK      4
`define STATUS_ARB_LOST 5

//------------------------------------------------------------------------------
// AXI-Lite Write Task
//------------------------------------------------------------------------------
task axi_lite_write;
    input [31:0] addr;
    input [31:0] data;
    begin
        @(posedge aclk);
        s_axi_awaddr <= addr;
        s_axi_awvalid <= 1'b1;
        s_axi_wdata <= data;
        s_axi_wvalid <= 1'b1;
        
        wait (s_axi_awready && s_axi_wready);
        @(posedge aclk);
        s_axi_awvalid <= 1'b0;
        s_axi_wvalid <= 1'b0;
        
        s_axi_bready <= 1'b1;
        wait (s_axi_bvalid);
        @(posedge aclk);
        s_axi_bready <= 1'b0;
    end
endtask

//------------------------------------------------------------------------------
// AXI-Lite Read Task
//------------------------------------------------------------------------------
task axi_lite_read;
    input [31:0] addr;
    output [31:0] data;
    begin
        @(posedge aclk);
        s_axi_araddr <= addr;
        s_axi_arvalid <= 1'b1;
        
        wait (s_axi_arready);
        @(posedge aclk);
        s_axi_arvalid <= 1'b0;
        
        s_axi_rready <= 1'b1;
        wait (s_axi_rvalid);
        data = s_axi_rdata;
        @(posedge aclk);
        s_axi_rready <= 1'b0;
    end
endtask

//------------------------------------------------------------------------------
// I2C Write Byte Task
//------------------------------------------------------------------------------
task i2c_write_byte;
    input [6:0] slave_addr;
    input [7:0] data;
    begin
        $display("[%t] I2C Write: Slave=0x%02X, Data=0x%02X", $time, slave_addr, data);
        
        // Set slave address
        axi_lite_write(`I2C_ADDR, {25'h0, slave_addr});
        
        // Set data to write
        axi_lite_write(`I2C_DATA, {24'h0, data});
        
        // Enable I2C and start write operation
        axi_lite_write(`I2C_CTRL, (1 << `CTRL_ENABLE) | (1 << `CTRL_START) | (1 << `CTRL_WRITE));
        
        // Wait for operation to complete
        wait_for_i2c_idle();
        
        // Send stop condition
        axi_lite_write(`I2C_CTRL, (1 << `CTRL_ENABLE) | (1 << `CTRL_STOP));
        
        wait_for_i2c_idle();
    end
endtask

//------------------------------------------------------------------------------
// I2C Read Byte Task
//------------------------------------------------------------------------------
task i2c_read_byte;
    input [6:0] slave_addr;
    output [7:0] data;
    reg [31:0] status;
    reg [31:0] read_data;
    begin
        $display("[%t] I2C Read: Slave=0x%02X", $time, slave_addr);
        
        // Set slave address
        axi_lite_write(`I2C_ADDR, {25'h0, slave_addr});
        
        // Enable I2C and start read operation
        axi_lite_write(`I2C_CTRL, (1 << `CTRL_ENABLE) | (1 << `CTRL_START) | (1 << `CTRL_READ));
        
        // Wait for operation to complete
        wait_for_i2c_idle();
        
        // Read data
        axi_lite_read(`I2C_DATA, read_data);
        data = read_data[7:0];
        
        // Send stop condition
        axi_lite_write(`I2C_CTRL, (1 << `CTRL_ENABLE) | (1 << `CTRL_STOP));
        
        wait_for_i2c_idle();
        
        $display("[%t] I2C Read: Data=0x%02X", $time, data);
    end
endtask

//------------------------------------------------------------------------------
// Wait for I2C Idle Task
//------------------------------------------------------------------------------
task wait_for_i2c_idle;
    reg [31:0] status;
    begin
        do begin
            axi_lite_read(`I2C_STATUS, status);
        end while (status[`STATUS_BUSY]);
    end
endtask

//------------------------------------------------------------------------------
// I2C Initialize Task
//------------------------------------------------------------------------------
task i2c_init;
    begin
        $display("[%t] I2C Initialize", $time);
        
        // Reset I2C controller
        axi_lite_write(`I2C_CTRL, (1 << `CTRL_RESET));
        
        // Set clock divider for 100kHz (assuming 100MHz system clock)
        axi_lite_write(`I2C_CLK_DIV, 32'd100);
        
        // Enable I2C controller
        axi_lite_write(`I2C_CTRL, (1 << `CTRL_ENABLE) | (1 << `CTRL_INT_EN));
        
        $display("[%t] I2C Initialize Complete", $time);
    end
endtask

//------------------------------------------------------------------------------
// I2C EEPROM Write Test Task
//------------------------------------------------------------------------------
task i2c_eeprom_write_test;
    input [6:0] slave_addr;
    input [7:0] start_addr;
    input [7:0] data;
    begin
        $display("[%t] EEPROM Write Test: Addr=0x%02X, Data=0x%02X", $time, start_addr, data);
        
        // Write address first
        i2c_write_byte(slave_addr, start_addr);
        
        // Write data
        i2c_write_byte(slave_addr, data);
        
        $display("[%t] EEPROM Write Test Complete", $time);
    end
endtask

//------------------------------------------------------------------------------
// I2C EEPROM Read Test Task
//------------------------------------------------------------------------------
task i2c_eeprom_read_test;
    input [6:0] slave_addr;
    input [7:0] addr;
    output [7:0] data;
    begin
        $display("[%t] EEPROM Read Test: Addr=0x%02X", $time, addr);
        
        // Write address first
        i2c_write_byte(slave_addr, addr);
        
        // Read data
        i2c_read_byte(slave_addr, data);
        
        $display("[%t] EEPROM Read Test: Data=0x%02X", $time, data);
    end
endtask

//------------------------------------------------------------------------------
// I2C Status Check Task
//------------------------------------------------------------------------------
task i2c_status_check;
    reg [31:0] status;
    begin
        axi_lite_read(`I2C_STATUS, status);
        $display("[%t] I2C Status: 0x%08X", $time, status);
        $display("  BUSY: %b", status[`STATUS_BUSY]);
        $display("  ERROR: %b", status[`STATUS_ERROR]);
        $display("  RX_VALID: %b", status[`STATUS_RX_VALID]);
        $display("  TX_READY: %b", status[`STATUS_TX_READY]);
        $display("  ACK: %b", status[`STATUS_ACK]);
        $display("  ARB_LOST: %b", status[`STATUS_ARB_LOST]);
    end
endtask

//------------------------------------------------------------------------------
// Revision history
//
// 2024.10.03: Started by Ando Ki (andoki@gmail.com)
//------------------------------------------------------------------------------
