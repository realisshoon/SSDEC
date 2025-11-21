//-----------------------------------------------------------------------------
// Copyright (c) 2024 by Ando Ki.
// All right reserved.
//------------------------------------------------------------------------------
// VERSION: 2024.10.03.
//------------------------------------------------------------------------------
// I2C AXI-Lite Testbench
//------------------------------------------------------------------------------

`timescale 1ns/1ps

module tester_i2c_axi_lite;
    //--------------------------------------------------------------------------
    // Clock and Reset
    //--------------------------------------------------------------------------
    reg         aclk;
    reg         aresetn;
    
    //--------------------------------------------------------------------------
    // AXI-Lite Interface
    //--------------------------------------------------------------------------
    reg  [31:0] s_axi_awaddr;
    reg         s_axi_awvalid;
    wire        s_axi_awready;
    reg  [31:0] s_axi_wdata;
    reg         s_axi_wvalid;
    wire        s_axi_wready;
    wire [ 1:0] s_axi_bresp;
    wire        s_axi_bvalid;
    reg         s_axi_bready;
    reg  [31:0] s_axi_araddr;
    reg         s_axi_arvalid;
    wire        s_axi_arready;
    wire [31:0] s_axi_rdata;
    wire [ 1:0] s_axi_rresp;
    wire        s_axi_rvalid;
    reg         s_axi_rready;
    
    //--------------------------------------------------------------------------
    // I2C Interface
    //--------------------------------------------------------------------------
    wire        i2c_scl;
    wire        i2c_sda;
    wire        i2c_sda_in;
    wire        interrupt;
    
    //--------------------------------------------------------------------------
    // Test variables
    //--------------------------------------------------------------------------
    reg [7:0]   test_data;
    reg [7:0]   read_data;
    reg [7:0]   eeprom_addr;
    reg [6:0]   slave_addr = 7'h50; // EEPROM slave address
    
    //--------------------------------------------------------------------------
    // Clock generation
    //--------------------------------------------------------------------------
    initial begin
        aclk = 1'b0;
        forever #5 aclk = ~aclk; // 100MHz clock
    end
    
    //--------------------------------------------------------------------------
    // Reset generation
    //--------------------------------------------------------------------------
    initial begin
        aresetn = 1'b0;
        #100;
        aresetn = 1'b1;
        $display("[%t] Reset released", $time);
    end
    
    //--------------------------------------------------------------------------
    // I2C AXI-Lite DUT
    //--------------------------------------------------------------------------
    i2c_axi_lite #(.CLK_FREQ(100_000_000))
    u_i2c_axi_lite (
          .aresetn       ( aresetn       )
        , .aclk          ( aclk          )
        , .s_axi_awaddr  ( s_axi_awaddr  )
        , .s_axi_awvalid ( s_axi_awvalid )
        , .s_axi_awready ( s_axi_awready )
        , .s_axi_wdata   ( s_axi_wdata   )
        , .s_axi_wvalid  ( s_axi_wvalid  )
        , .s_axi_wready  ( s_axi_wready  )
        , .s_axi_bresp   ( s_axi_bresp   )
        , .s_axi_bvalid  ( s_axi_bvalid  )
        , .s_axi_bready  ( s_axi_bready  )
        , .s_axi_araddr  ( s_axi_araddr  )
        , .s_axi_arvalid ( s_axi_arvalid )
        , .s_axi_arready ( s_axi_arready )
        , .s_axi_rdata   ( s_axi_rdata   )
        , .s_axi_rresp   ( s_axi_rresp   )
        , .s_axi_rvalid  ( s_axi_rvalid  )
        , .s_axi_rready  ( s_axi_rready  )
        , .i2c_scl       ( i2c_scl       )
        , .i2c_sda       ( i2c_sda       )
        , .i2c_sda_in    ( i2c_sda_in    )
        , .interrupt     ( interrupt     )
    );
    
    //--------------------------------------------------------------------------
    // EEPROM Model
    //--------------------------------------------------------------------------
    eeprom_model #(.SLAVE_ADDR(7'h50))
    u_eeprom (
          .clk   ( aclk   )
        , .rst_n ( aresetn )
        , .sda   ( i2c_sda )
        , .scl   ( i2c_scl )
    );
    
    //--------------------------------------------------------------------------
    // SDA input assignment
    //--------------------------------------------------------------------------
    assign i2c_sda_in = i2c_sda;
    
    //--------------------------------------------------------------------------
    // Test sequence
    //--------------------------------------------------------------------------
    initial begin
        // Initialize signals
        s_axi_awaddr  = 32'h0;
        s_axi_awvalid = 1'b0;
        s_axi_wdata   = 32'h0;
        s_axi_wvalid  = 1'b0;
        s_axi_bready  = 1'b0;
        s_axi_araddr  = 32'h0;
        s_axi_arvalid = 1'b0;
        s_axi_rready  = 1'b0;
        
        // Wait for reset release
        wait (aresetn);
        #100;
        
        $display("==========================================");
        $display("I2C AXI-Lite Testbench Started");
        $display("==========================================");
        
        // Test 1: Initialize I2C controller
        i2c_init();
        
        // Test 2: Check initial status
        i2c_status_check();
        
        // Test 3: Write test data to EEPROM
        $display("\n--- EEPROM Write Test ---");
        for (eeprom_addr = 8'h00; eeprom_addr < 8'h10; eeprom_addr = eeprom_addr + 1) begin
            test_data = eeprom_addr + 8'hA0; // Test pattern
            i2c_eeprom_write_test(slave_addr, eeprom_addr, test_data);
            #1000; // Wait between writes
        end
        
        // Test 4: Read test data from EEPROM
        $display("\n--- EEPROM Read Test ---");
        for (eeprom_addr = 8'h00; eeprom_addr < 8'h10; eeprom_addr = eeprom_addr + 1) begin
            i2c_eeprom_read_test(slave_addr, eeprom_addr, read_data);
            #1000; // Wait between reads
        end
        
        // Test 5: Check final status
        i2c_status_check();
        
        // Test 6: Interrupt test
        $display("\n--- Interrupt Test ---");
        if (interrupt) begin
            $display("[%t] Interrupt detected", $time);
        end else begin
            $display("[%t] No interrupt detected", $time);
        end
        
        $display("\n==========================================");
        $display("I2C AXI-Lite Testbench Completed");
        $display("==========================================");
        
        #10000;
        $finish;
    end
    
    //--------------------------------------------------------------------------
    // Include test tasks
    //--------------------------------------------------------------------------
    `include "tasks_i2c_axi_lite.sv"
    
    //--------------------------------------------------------------------------
    // Waveform dump
    //--------------------------------------------------------------------------
    initial begin
        $dumpfile("i2c_axi_lite_test.vcd");
        $dumpvars(0, tester_i2c_axi_lite);
    end

endmodule
//------------------------------------------------------------------------------
// Revision history
//
// 2024.10.03: Started by Ando Ki (andoki@gmail.com)
//------------------------------------------------------------------------------
