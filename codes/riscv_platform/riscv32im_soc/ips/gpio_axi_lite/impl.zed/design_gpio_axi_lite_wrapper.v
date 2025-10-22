//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
//Date        : Mon Oct 20 13:10:20 2025
//Host        : sogang-500TGA-500SGA running 64-bit Ubuntu 22.04.5 LTS
//Command     : generate_target design_gpio_axi_lite_wrapper.bd
//Design      : design_gpio_axi_lite_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_gpio_axi_lite_wrapper
   (BOARD_CLK_IN,
    BOARD_RST_SW,
    BTND,
    BTNL,
    BTNR,
    BTNU,
    LED0,
    LED1,
    LED2,
    LED3,
    SL_AD,
    SL_CS_N,
    SL_DT,
    SL_FLAGA,
    SL_FLAGB,
    SL_FLAGC,
    SL_FLAGD,
    SL_MODE,
    SL_OE_N,
    SL_PCLK,
    SL_PKTEND_N,
    SL_RD_N,
    SL_RST_N,
    SL_WR_N);
  input BOARD_CLK_IN;
  input BOARD_RST_SW;
  input BTND;
  input BTNL;
  input BTNR;
  input BTNU;
  output [0:0]LED0;
  output [0:0]LED1;
  output [0:0]LED2;
  output [0:0]LED3;
  output [1:0]SL_AD;
  output SL_CS_N;
  inout [31:0]SL_DT;
  input SL_FLAGA;
  input SL_FLAGB;
  input SL_FLAGC;
  input SL_FLAGD;
  input [1:0]SL_MODE;
  output SL_OE_N;
  output SL_PCLK;
  output SL_PKTEND_N;
  output SL_RD_N;
  input SL_RST_N;
  output SL_WR_N;

  wire BOARD_CLK_IN;
  wire BOARD_RST_SW;
  wire BTND;
  wire BTNL;
  wire BTNR;
  wire BTNU;
  wire [0:0]LED0;
  wire [0:0]LED1;
  wire [0:0]LED2;
  wire [0:0]LED3;
  wire [1:0]SL_AD;
  wire SL_CS_N;
  wire [31:0]SL_DT;
  wire SL_FLAGA;
  wire SL_FLAGB;
  wire SL_FLAGC;
  wire SL_FLAGD;
  wire [1:0]SL_MODE;
  wire SL_OE_N;
  wire SL_PCLK;
  wire SL_PKTEND_N;
  wire SL_RD_N;
  wire SL_RST_N;
  wire SL_WR_N;

  design_gpio_axi_lite design_gpio_axi_lite_i
       (.BOARD_CLK_IN(BOARD_CLK_IN),
        .BOARD_RST_SW(BOARD_RST_SW),
        .BTND(BTND),
        .BTNL(BTNL),
        .BTNR(BTNR),
        .BTNU(BTNU),
        .LED0(LED0),
        .LED1(LED1),
        .LED2(LED2),
        .LED3(LED3),
        .SL_AD(SL_AD),
        .SL_CS_N(SL_CS_N),
        .SL_DT(SL_DT),
        .SL_FLAGA(SL_FLAGA),
        .SL_FLAGB(SL_FLAGB),
        .SL_FLAGC(SL_FLAGC),
        .SL_FLAGD(SL_FLAGD),
        .SL_MODE(SL_MODE),
        .SL_OE_N(SL_OE_N),
        .SL_PCLK(SL_PCLK),
        .SL_PKTEND_N(SL_PKTEND_N),
        .SL_RD_N(SL_RD_N),
        .SL_RST_N(SL_RST_N),
        .SL_WR_N(SL_WR_N));
endmodule
