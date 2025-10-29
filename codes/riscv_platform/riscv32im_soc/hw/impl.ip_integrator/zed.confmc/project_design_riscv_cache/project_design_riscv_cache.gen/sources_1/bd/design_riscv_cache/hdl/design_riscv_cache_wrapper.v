//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
//Date        : Wed Oct 29 17:28:55 2025
//Host        : sogang-500TGA-500SGA running 64-bit Ubuntu 22.04.5 LTS
//Command     : generate_target design_riscv_cache_wrapper.bd
//Design      : design_riscv_cache_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_riscv_cache_wrapper
   (BOARD_CLK_IN,
    BOARD_RST_SW,
    gpio_in,
    gpio_out,
    i2c_scl,
    i2c_sda,
    keypad_col,
    keypad_row,
    uart_cts_n,
    uart_rts_n,
    uart_rxd,
    uart_txd);
  input BOARD_CLK_IN;
  input BOARD_RST_SW;
  input [7:0]gpio_in;
  output [7:0]gpio_out;
  output i2c_scl;
  inout i2c_sda;
  output [3:0]keypad_col;
  input [3:0]keypad_row;
  input uart_cts_n;
  output uart_rts_n;
  input uart_rxd;
  output uart_txd;

  wire BOARD_CLK_IN;
  wire BOARD_RST_SW;
  wire [7:0]gpio_in;
  wire [7:0]gpio_out;
  wire i2c_scl;
  wire i2c_sda;
  wire [3:0]keypad_col;
  wire [3:0]keypad_row;
  wire uart_cts_n;
  wire uart_rts_n;
  wire uart_rxd;
  wire uart_txd;

  design_riscv_cache design_riscv_cache_i
       (.BOARD_CLK_IN(BOARD_CLK_IN),
        .BOARD_RST_SW(BOARD_RST_SW),
        .gpio_in(gpio_in),
        .gpio_out(gpio_out),
        .i2c_scl(i2c_scl),
        .i2c_sda(i2c_sda),
        .keypad_col(keypad_col),
        .keypad_row(keypad_row),
        .uart_cts_n(uart_cts_n),
        .uart_rts_n(uart_rts_n),
        .uart_rxd(uart_rxd),
        .uart_txd(uart_txd));
endmodule
