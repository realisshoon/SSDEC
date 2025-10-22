//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
//Date        : Tue Oct 21 15:52:23 2025
//Host        : sogang-500TGA-500SGA running 64-bit Ubuntu 22.04.5 LTS
//Command     : generate_target design_riscv_cache_wrapper.bd
//Design      : design_riscv_cache_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_riscv_cache_wrapper
   (BOARD_CLK_IN,
    BOARD_RST_SW,
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
    SL_WR_N,
    gpio_dir,
    gpio_in,
    gpio_out,
    uart_cts_n,
    uart_rts_n,
    uart_rxd,
    uart_txd);
  input BOARD_CLK_IN;
  input BOARD_RST_SW;
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
  output [31:0]gpio_dir;
  input [31:0]gpio_in;
  output [31:0]gpio_out;
  input uart_cts_n;
  output uart_rts_n;
  input uart_rxd;
  output uart_txd;

  wire BOARD_CLK_IN;
  wire BOARD_RST_SW;
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
  wire [31:0]gpio_dir;
  wire [31:0]gpio_in;
  wire [31:0]gpio_out;
  wire uart_cts_n;
  wire uart_rts_n;
  wire uart_rxd;
  wire uart_txd;

  design_riscv_cache design_riscv_cache_i
       (.BOARD_CLK_IN(BOARD_CLK_IN),
        .BOARD_RST_SW(BOARD_RST_SW),
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
        .SL_WR_N(SL_WR_N),
        .gpio_dir(gpio_dir),
        .gpio_in(gpio_in),
        .gpio_out(gpio_out),
        .uart_cts_n(uart_cts_n),
        .uart_rts_n(uart_rts_n),
        .uart_rxd(uart_rxd),
        .uart_txd(uart_txd));
endmodule
