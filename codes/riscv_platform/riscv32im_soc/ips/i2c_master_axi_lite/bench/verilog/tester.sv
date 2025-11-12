//------------------------------------------------------------------------------
// Copyright (c) 2025 by Ando Ki
//------------------------------------------------------------------------------
// tester.v
//------------------------------------------------------------------------------
`timescale 1ns/1ps

`include "i2c_master_define.v"

module tester
(
      input  wire        axil_aresetn
    , input  wire        axil_aclk
    , output reg  [31:0] m_axi_lite_awaddr
    , output reg         m_axi_lite_awvalid
    , input  wire        m_axi_lite_awready
    , output reg  [31:0] m_axi_lite_wdata
    , output reg         m_axi_lite_wvalid
    , input  wire        m_axi_lite_wready
    , input  wire [ 1:0] m_axi_lite_bresp
    , input  wire        m_axi_lite_bvalid
    , output reg         m_axi_lite_bready
    , output reg  [31:0] m_axi_lite_araddr
    , output reg         m_axi_lite_arvalid
    , input  wire        m_axi_lite_arready
    , input  wire [31:0] m_axi_lite_rdata
    , input  wire [ 1:0] m_axi_lite_rresp
    , input  wire        m_axi_lite_rvalid
    , output reg         m_axi_lite_rready
    , input  wire        IRQ
    , output reg         done
);
    //--------------------------------------------------------------------------
    `include "tasks_axi_lite.sv"
    `include "tasks_i2c.sv"
    //--------------------------------------------------------------------------
    integer arg, num, error, cont;
    integer idx, idy;
    reg busy;
    reg [31:0] dataW, dataR;
    //--------------------------------------------------------------------------
    initial begin
       done               = 1'b0;
       m_axi_lite_awaddr  = 'h0;
       m_axi_lite_awvalid = 'h0;
       m_axi_lite_wdata   = 'h0;
       m_axi_lite_wvalid  = 'h0;
       m_axi_lite_bready  = 'h0;
       m_axi_lite_araddr  = 'h0;
       m_axi_lite_arvalid = 'h0;
       m_axi_lite_rready  = 'h0;
       wait (axil_aresetn==1'b0);
       wait (axil_aresetn==1'b1);
       repeat (10) @ (posedge axil_aclk);
       if ($value$plusargs("I2C_CSR=%d", arg) && (arg>0)) begin
          i2c_csr();
       end
       repeat (10) @ (posedge axil_aclk);
       //-----------------------------------------------------------------------
       if ($value$plusargs("I2C_D7R8=%d", arg) && (arg>0)) begin
           // Read-After-Write test 7-bit dev-addr, 8-bit reg-addr
           i2c_enable(0); i2c_rst(1); i2c_rst(0);
           i2c_config( 4'h2    //input [3:0]  pre ; // 1 by default
                     , 4'h2    //input [3:0]  mid ; // 1 by default
                     , 4'h2    //input [3:0]  post; // 1 by default
                     , 4'h2 ); //input [3:0]  gap ; // 1 by default
           i2c_init( 300_000  // i2c_freq
                   , 1 );     // enable
           num = 10;
           error = 0;
           for (idx=0; idx<num; idx=idx+1) begin
                dataW = idx+1;
                i2c_write_d7r8(`I2C_DEV_ADDR_D7R8, idx[7:0], dataW);
                i2c_read_d7r8 (`I2C_DEV_ADDR_D7R8, idx[7:0], dataR);
                if (dataW!==dataR) begin
                    error = error + 1;
                end
           end
           if (error>0) $display("%m mis-match %d out of %d", error, num);
           else         $display("%m match %d", num);
           busy = 1'b1;
           while (busy==1'b1) i2c_busy(busy);
           repeat (10) @ (posedge axil_aclk);
       end
       //-----------------------------------------------------------------------
       if ($value$plusargs("I2C_D7R8_CONT=%d", arg) && (arg>0)) begin
           // Read-After-Write test 7-bit dev-addr, 8-bit reg-addr
           i2c_enable(0);
           i2c_rst(1); i2c_rst(0);
           i2c_sel(0);
           i2c_config( 4'h1    //input [3:0]  pre ; // 1 by default
                     , 4'h1    //input [3:0]  mid ; // 1 by default
                     , 4'h1    //input [3:0]  post; // 1 by default
                     , 4'h1 ); //input [3:0]  gap ; // 1 by default
           i2c_init( 300_000  // i2c_freq
                   , 1 );     // enable
           cont = 4; // burst-length
           num  = 5;
           error = 0;
           for (idx=0; idx<num; idx=idx+1) begin
                for (idy=0; idy<cont; idy=idy+1) reg_data_cont[idy] = idx+1+idy;
                i2c_write_d7r8_cont(`I2C_DEV_ADDR_D7R8, idx[7:0], cont);
                for (idy=0; idy<cont; idy=idy+1) reg_data_cont[idy] =~(idx+1+idy);
                i2c_read_d7r8_cont (`I2C_DEV_ADDR_D7R8, idx[7:0], cont);
                for (idy=0; idy<cont; idy=idy+1) begin
                     if (reg_data_cont[idy]!==(idx+1+idy)) error = error + 1;
                end
           end
           if (error>0) $display("%m mis-match %d out of %d", error, cont*num);
           else         $display("%m match %d", cont*num);
           busy = 1'b1;
           while (busy==1'b1) i2c_busy(busy);
           repeat (10) @ (posedge axil_aclk);
       end
       //-----------------------------------------------------------------------
       if ($value$plusargs("I2C_D7R16=%d", arg) && (arg>0)) begin
           // Read-After-Write test 7-bit dev-addr, 16-bit reg-addr
           i2c_enable(0);
           i2c_rst(1); i2c_rst(0);
           i2c_sel(0);
           i2c_config( 4'h1    //input [3:0]  pre ; // 1 by default
                     , 4'h1    //input [3:0]  mid ; // 1 by default
                     , 4'h1    //input [3:0]  post; // 1 by default
                     , 4'h1    //input [3:0]  gap ; // 1 by default
                     );
           i2c_init( 300_000  // i2c_freq
                   , 1        // enable
                   );
           num = 10;
           error = 0;
           for (idx=0; idx<num; idx=idx+1) begin
                dataW = idx+1;
                i2c_write_d7r16(`I2C_DEV_ADDR_D7R16, idx[7:0], dataW);
                i2c_read_d7r16 (`I2C_DEV_ADDR_D7R16, idx[7:0], dataR);
                if (dataW!==dataR) begin
                    error = error + 1;
                end
           end
           if (error>0) $display("%m mis-match %d out of %d", error, num);
           else         $display("%m match %d", num);
           busy = 1'b1;
           while (busy==1'b1) i2c_busy(busy);
       end
       //-----------------------------------------------------------------------
       if ($value$plusargs("I2C_D7R16_CONT=%d", arg) && (arg>0)) begin
           // Read-After-Write test 7-bit dev-addr, 16-bit reg-addr
           i2c_enable(0);
           i2c_rst(1); i2c_rst(0);
           i2c_sel(0);
           i2c_config( 4'h1    //input [3:0]  pre ; // 1 by default
                     , 4'h1    //input [3:0]  mid ; // 1 by default
                     , 4'h1    //input [3:0]  post; // 1 by default
                     , 4'h1    //input [3:0]  gap ; // 1 by default
                     );
           i2c_init( 300_000  // i2c_freq
                   , 1        // enable
                   );
           cont = 3; // burst-length
           num  = 3;
           error = 0;
           for (idx=0; idx<num; idx=idx+1) begin
                for (idy=0; idy<cont; idy=idy+1) reg_data_cont[idy] = idx+1+idy;
                i2c_write_d7r16_cont(`I2C_DEV_ADDR_D7R16, idx[7:0], cont);
                for (idy=0; idy<cont; idy=idy+1) reg_data_cont[idy] =~(idx+1+idy);
                i2c_read_d7r16_cont (`I2C_DEV_ADDR_D7R16, idx[7:0], cont);
                for (idy=0; idy<cont; idy=idy+1) begin
                     if (reg_data_cont[idy]!==(idx+1+idy)) error = error + 1;
                end
           end
           if (error>0) $display("%m mis-match %d out of %d", error, cont*num);
           else         $display("%m match %d", cont*num);
           busy = 1'b1;
           while (busy==1'b1) i2c_busy(busy);
       end
       //-----------------------------------------------------------------------
       repeat (10) @ (posedge axil_aclk);
       done = 1'b1;
    end
    //--------------------------------------------------------------------------
endmodule
//------------------------------------------------------------------------------
// Revision History
//
// 2025.09.10: Started by Ando Ki (andoki@gmail.com)
//------------------------------------------------------------------------------
