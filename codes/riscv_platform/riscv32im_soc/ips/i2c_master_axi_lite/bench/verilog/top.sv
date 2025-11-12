//------------------------------------------------------------------------------
// Copyright (c) 2025 by Ando Ki.
// All right reserved.
//------------------------------------------------------------------------------
// +--------+     +--------+
// |        |     |        |<=====================================>
// | tester |     | i2c    |     ||        ||       ||       ||   
// |        |<===>| master |  +------+  +------+ +------+ +------+
// |        |     | axi    |  |i2c   |  |i2c   | |i2c   | |i2c   |
// |        |     | lite   |  |slave |  |slave | |slave | |slave |
// +--------+     +--------+  +------+  +------+ +------+ +------+
//                            7b dev    7b dev   10b dev   10b dev
//                            8b reg    16b reg  8b reg    16b reg
//------------------------------------------------------------------------------
`timescale 1ns/1ps

`ifndef __ICARUS__
`define DELAY_LINE #(0.1)
`else
`define DELAY_LINE
`endif

module top ;
    localparam GPIO_WIDTH=32;
    //--------------------------------------------------------------------------
    // Oscillators
    localparam real CLOCK_FREQ =10_000_000.0;
    localparam real CLOCK_HALF =(1_000_000_000.0/CLOCK_FREQ/2.0);
    //--------------------------------------------------------------------------
    reg  axil_aclk=1'b0; always #(CLOCK_HALF) axil_aclk <= ~axil_aclk;
    reg  axil_aresetn=1'b0; initial begin #111; axil_aresetn=1'b1; end
    //--------------------------------------------------------------------------
    wire [31:0] `DELAY_LINE axi_lite_awaddr ;
    wire        `DELAY_LINE axi_lite_awvalid;
    wire        `DELAY_LINE axi_lite_awready;
    wire [31:0] `DELAY_LINE axi_lite_wdata  ;
    wire        `DELAY_LINE axi_lite_wvalid ;
    wire        `DELAY_LINE axi_lite_wready ;
    wire [ 1:0] `DELAY_LINE axi_lite_bresp  ;
    wire        `DELAY_LINE axi_lite_bvalid ;
    wire        `DELAY_LINE axi_lite_bready ;
    wire [31:0] `DELAY_LINE axi_lite_araddr ;
    wire        `DELAY_LINE axi_lite_arvalid;
    wire        `DELAY_LINE axi_lite_arready;
    wire [31:0] `DELAY_LINE axi_lite_rdata  ;
    wire [ 1:0] `DELAY_LINE axi_lite_rresp  ;
    wire        `DELAY_LINE axi_lite_rvalid ;
    wire        `DELAY_LINE axi_lite_rready ;
    wire        `DELAY_LINE IRQ;
    //--------------------------------------------------------------------------
    wire  `DELAY_LINE  SCL  ;
    wire  `DELAY_LINE  SCL_I;
    wire  `DELAY_LINE  SCL_O;
    wire  `DELAY_LINE  SCL_T;
    wire  `DELAY_LINE  SDA  ;
    wire  `DELAY_LINE  SDA_I;
    wire  `DELAY_LINE  SDA_O;
    wire  `DELAY_LINE  SDA_T;
    //--------------------------------------------------------------------------
    assign SCL   =(SCL_T==1'b0) ? SCL_O : 1'bZ;
    assign SCL_I = SCL;
    assign SDA   =(SDA_T==1'b0) ? SDA_O : 1'bZ;
    assign SDA_I = SDA;
    //---------------------------------------------------------------------------
    pullup u_scl(SCL);
    pullup u_sda(SDA);
    //---------------------------------------------------------------------------
    parameter P_CLK_FREQ    =CLOCK_FREQ // CLK frequency
            , P_I2C_SPEED   =1_000_000 // I2C SCLK frequency
            , P_I2C_BPW     =16
            , P_I2C_CPOL    =1'b0 // SCLK stay 0 by default
            , P_I2C_CPHA    =1'b1 // MOSI driven at rising edge, latched at falling edge
            , P_I2C_LSB_FIRST=1'b0 // LSB fisrt when 1
            , P_I2C_SS_HIGH  =1'b0 // SS_N active high when 1
            ;
    //--------------------------------------------------------------------------
    i2c_master_axi_lite #(.P_CLK_FREQ    (P_CLK_FREQ )
                         ,.P_I2C_SPEED   (P_I2C_SPEED))
    u_i2c_master (
          .aresetn            ( axil_aresetn       )
        , .aclk               ( axil_aclk          )
        , .s_axi_lite_awaddr  ( axi_lite_awaddr  )
        , .s_axi_lite_awvalid ( axi_lite_awvalid )
        , .s_axi_lite_awready ( axi_lite_awready )
        , .s_axi_lite_wdata   ( axi_lite_wdata   )
        , .s_axi_lite_wvalid  ( axi_lite_wvalid  )
        , .s_axi_lite_wready  ( axi_lite_wready  )
        , .s_axi_lite_bresp   ( axi_lite_bresp   )
        , .s_axi_lite_bvalid  ( axi_lite_bvalid  )
        , .s_axi_lite_bready  ( axi_lite_bready  )
        , .s_axi_lite_araddr  ( axi_lite_araddr  )
        , .s_axi_lite_arvalid ( axi_lite_arvalid )
        , .s_axi_lite_arready ( axi_lite_arready )
        , .s_axi_lite_rdata   ( axi_lite_rdata   )
        , .s_axi_lite_rresp   ( axi_lite_rresp   )
        , .s_axi_lite_rvalid  ( axi_lite_rvalid  )
        , .s_axi_lite_rready  ( axi_lite_rready  )
        , .IRQ     ( IRQ     )
        , .SCL_I   ( SCL_I   )
        , .SCL_O   ( SCL_O   )
        , .SCL_T   ( SCL_T   )
        , .SDA_I   ( SDA_I   )
        , .SDA_O   ( SDA_O   )
        , .SDA_T   ( SDA_T   )
    );
    //--------------------------------------------------------------------------
    wire done;
    //--------------------------------------------------------------------------
    tester
    u_tester (
          .axil_aresetn       ( axil_aresetn   )
        , .axil_aclk          ( axil_aclk      )
        , .m_axi_lite_awaddr  ( axi_lite_awaddr  )
        , .m_axi_lite_awvalid ( axi_lite_awvalid )
        , .m_axi_lite_awready ( axi_lite_awready )
        , .m_axi_lite_wdata   ( axi_lite_wdata   )
        , .m_axi_lite_wvalid  ( axi_lite_wvalid  )
        , .m_axi_lite_wready  ( axi_lite_wready  )
        , .m_axi_lite_bresp   ( axi_lite_bresp   )
        , .m_axi_lite_bvalid  ( axi_lite_bvalid  )
        , .m_axi_lite_bready  ( axi_lite_bready  )
        , .m_axi_lite_araddr  ( axi_lite_araddr  )
        , .m_axi_lite_arvalid ( axi_lite_arvalid )
        , .m_axi_lite_arready ( axi_lite_arready )
        , .m_axi_lite_rdata   ( axi_lite_rdata   )
        , .m_axi_lite_rresp   ( axi_lite_rresp   )
        , .m_axi_lite_rvalid  ( axi_lite_rvalid  )
        , .m_axi_lite_rready  ( axi_lite_rready  )
        , .IRQ      ( IRQ     )
        , .done     ( done    )
    );
   //---------------------------------------------------------------------------
   // device address 7-bit
   // register address 8-bit
   `ifndef I2C_DEV_ADDR_D7R8
   `define I2C_DEV_ADDR_D7R8 7'b1000001
   `endif
   i2c_slave #(.P_I2C_DEV_ADDR_LEN(7)
              ,.P_I2C_DEV_ADDR(`I2C_DEV_ADDR_D7R8)
              ,.P_I2C_REG_ADDR_LEN(8)
              ,.P_I2C_MEM_SIZE(10'h100))
   u_slave0 (
       .SCL(SCL )
     , .SDA(SDA )
   );
   //---------------------------------------------------------------------------
   // device address 7-bit
   // register address 16-bit
   `ifndef I2C_DEV_ADDR_D7R16
   `define I2C_DEV_ADDR_D7R16 7'b1000101
   `endif
   i2c_slave #(.P_I2C_DEV_ADDR_LEN(7)
              ,.P_I2C_DEV_ADDR(`I2C_DEV_ADDR_D7R16)
              ,.P_I2C_REG_ADDR_LEN(16)
              ,.P_I2C_MEM_SIZE(10'h100))
   u_slave1(
       .SCL(SCL)
     , .SDA(SDA)
   );
   //---------------------------------------------------------------------------
   // device address 7-bit
   // register address 8-bit
   `ifndef I2C_DEV_ADDR_D10R8
   `define I2C_DEV_ADDR_D10R8 10'b1000000001
   `endif
   i2c_slave #(.P_I2C_DEV_ADDR_LEN(7)
              ,.P_I2C_DEV_ADDR(`I2C_DEV_ADDR_D10R8)
              ,.P_I2C_REG_ADDR_LEN(8)
              ,.P_I2C_MEM_SIZE(10'h100))
   u_slave2 (
       .SCL(SCL)
     , .SDA(SDA)
   );
   //---------------------------------------------------------------------------
   `ifndef I2C_DEV_ADDR_D10R16
   `define I2C_DEV_ADDR_D10R16 10'b1000000_101
   `endif
   i2c_slave #(.P_I2C_DEV_ADDR_LEN(7)
              ,.P_I2C_DEV_ADDR(`I2C_DEV_ADDR_D10R16)
              ,.P_I2C_REG_ADDR_LEN(16)
              ,.P_I2C_MEM_SIZE(10'h100))
   u_slave3 (
       .SCL(SCL)
     , .SDA(SDA)
   );
    //--------------------------------------------------------------------------
    real stamp_x, stamp_y;
    //--------------------------------------------------------------------------
    initial begin
        axil_aclk    = 0;
        axil_aresetn = 0;
        repeat (20) @ (posedge axil_aclk);
        axil_aresetn = 1;
        repeat (10) @ (posedge axil_aclk);
        @ (posedge axil_aclk); stamp_x = $realtime;
        @ (posedge axil_aclk); stamp_y = $realtime;
        $display("%m PCLK %.2f-nsec %.2f-MHz", stamp_y - stamp_x, 1000.0/(stamp_y-stamp_x));
        repeat (10) @ (posedge axil_aclk);
        //-------------------------------------
        wait (done==1'b1);
        //-------------------------------------
        repeat (50) @ (posedge axil_aclk);
        $finish(2);
    end
    //--------------------------------------------------------------------------
    `ifdef VCD
    initial begin
        $dumpfile("wave.vcd"); //$dumplimit(1000000);
        $dumpvars(0);
    end
    `endif
endmodule
