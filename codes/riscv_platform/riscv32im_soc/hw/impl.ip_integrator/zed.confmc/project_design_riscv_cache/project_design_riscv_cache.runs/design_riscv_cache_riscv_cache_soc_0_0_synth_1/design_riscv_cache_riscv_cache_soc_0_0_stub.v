// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Wed Nov  5 18:58:42 2025
// Host        : sogang-500TGA-500SGA running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_riscv_cache_riscv_cache_soc_0_0_stub.v
// Design      : design_riscv_cache_riscv_cache_soc_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "riscv_cache_soc,Vivado 2021.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(uart_txd, uart_rxd, uart_rts_n, uart_cts_n, 
  gpio_in, gpio_out, keypad_col, keypad_row, i2c_sda, i2c_scl, cpu_resetn, axi_aresetn, axi_aclk, 
  s_axi_confmc_awid, s_axi_confmc_awaddr, s_axi_confmc_awlen, s_axi_confmc_awsize, 
  s_axi_confmc_awburst, s_axi_confmc_awvalid, s_axi_confmc_awready, s_axi_confmc_wdata, 
  s_axi_confmc_wstrb, s_axi_confmc_wlast, s_axi_confmc_wvalid, s_axi_confmc_wready, 
  s_axi_confmc_bid, s_axi_confmc_bresp, s_axi_confmc_bvalid, s_axi_confmc_bready, 
  s_axi_confmc_arid, s_axi_confmc_araddr, s_axi_confmc_arlen, s_axi_confmc_arsize, 
  s_axi_confmc_arburst, s_axi_confmc_arvalid, s_axi_confmc_arready, s_axi_confmc_rid, 
  s_axi_confmc_rdata, s_axi_confmc_rresp, s_axi_confmc_rlast, s_axi_confmc_rvalid, 
  s_axi_confmc_rready, m_axi_mem_awid, m_axi_mem_awaddr, m_axi_mem_awlen, m_axi_mem_awsize, 
  m_axi_mem_awburst, m_axi_mem_awvalid, m_axi_mem_awready, m_axi_mem_wdata, 
  m_axi_mem_wstrb, m_axi_mem_wlast, m_axi_mem_wvalid, m_axi_mem_wready, m_axi_mem_bid, 
  m_axi_mem_bresp, m_axi_mem_bvalid, m_axi_mem_bready, m_axi_mem_arid, m_axi_mem_araddr, 
  m_axi_mem_arlen, m_axi_mem_arsize, m_axi_mem_arburst, m_axi_mem_arvalid, 
  m_axi_mem_arready, m_axi_mem_rid, m_axi_mem_rdata, m_axi_mem_rresp, m_axi_mem_rlast, 
  m_axi_mem_rvalid, m_axi_mem_rready)
/* synthesis syn_black_box black_box_pad_pin="uart_txd,uart_rxd,uart_rts_n,uart_cts_n,gpio_in[7:0],gpio_out[7:0],keypad_col[3:0],keypad_row[3:0],i2c_sda,i2c_scl,cpu_resetn,axi_aresetn,axi_aclk,s_axi_confmc_awid[3:0],s_axi_confmc_awaddr[31:0],s_axi_confmc_awlen[7:0],s_axi_confmc_awsize[2:0],s_axi_confmc_awburst[1:0],s_axi_confmc_awvalid,s_axi_confmc_awready,s_axi_confmc_wdata[31:0],s_axi_confmc_wstrb[3:0],s_axi_confmc_wlast,s_axi_confmc_wvalid,s_axi_confmc_wready,s_axi_confmc_bid[3:0],s_axi_confmc_bresp[1:0],s_axi_confmc_bvalid,s_axi_confmc_bready,s_axi_confmc_arid[3:0],s_axi_confmc_araddr[31:0],s_axi_confmc_arlen[7:0],s_axi_confmc_arsize[2:0],s_axi_confmc_arburst[1:0],s_axi_confmc_arvalid,s_axi_confmc_arready,s_axi_confmc_rid[3:0],s_axi_confmc_rdata[31:0],s_axi_confmc_rresp[1:0],s_axi_confmc_rlast,s_axi_confmc_rvalid,s_axi_confmc_rready,m_axi_mem_awid[5:0],m_axi_mem_awaddr[31:0],m_axi_mem_awlen[7:0],m_axi_mem_awsize[2:0],m_axi_mem_awburst[1:0],m_axi_mem_awvalid,m_axi_mem_awready,m_axi_mem_wdata[31:0],m_axi_mem_wstrb[3:0],m_axi_mem_wlast,m_axi_mem_wvalid,m_axi_mem_wready,m_axi_mem_bid[5:0],m_axi_mem_bresp[1:0],m_axi_mem_bvalid,m_axi_mem_bready,m_axi_mem_arid[5:0],m_axi_mem_araddr[31:0],m_axi_mem_arlen[7:0],m_axi_mem_arsize[2:0],m_axi_mem_arburst[1:0],m_axi_mem_arvalid,m_axi_mem_arready,m_axi_mem_rid[5:0],m_axi_mem_rdata[31:0],m_axi_mem_rresp[1:0],m_axi_mem_rlast,m_axi_mem_rvalid,m_axi_mem_rready" */;
  output uart_txd;
  input uart_rxd;
  output uart_rts_n;
  input uart_cts_n;
  input [7:0]gpio_in;
  output [7:0]gpio_out;
  output [3:0]keypad_col;
  input [3:0]keypad_row;
  inout i2c_sda;
  output i2c_scl;
  input cpu_resetn;
  input axi_aresetn;
  input axi_aclk;
  input [3:0]s_axi_confmc_awid;
  input [31:0]s_axi_confmc_awaddr;
  input [7:0]s_axi_confmc_awlen;
  input [2:0]s_axi_confmc_awsize;
  input [1:0]s_axi_confmc_awburst;
  input s_axi_confmc_awvalid;
  output s_axi_confmc_awready;
  input [31:0]s_axi_confmc_wdata;
  input [3:0]s_axi_confmc_wstrb;
  input s_axi_confmc_wlast;
  input s_axi_confmc_wvalid;
  output s_axi_confmc_wready;
  output [3:0]s_axi_confmc_bid;
  output [1:0]s_axi_confmc_bresp;
  output s_axi_confmc_bvalid;
  input s_axi_confmc_bready;
  input [3:0]s_axi_confmc_arid;
  input [31:0]s_axi_confmc_araddr;
  input [7:0]s_axi_confmc_arlen;
  input [2:0]s_axi_confmc_arsize;
  input [1:0]s_axi_confmc_arburst;
  input s_axi_confmc_arvalid;
  output s_axi_confmc_arready;
  output [3:0]s_axi_confmc_rid;
  output [31:0]s_axi_confmc_rdata;
  output [1:0]s_axi_confmc_rresp;
  output s_axi_confmc_rlast;
  output s_axi_confmc_rvalid;
  input s_axi_confmc_rready;
  output [5:0]m_axi_mem_awid;
  output [31:0]m_axi_mem_awaddr;
  output [7:0]m_axi_mem_awlen;
  output [2:0]m_axi_mem_awsize;
  output [1:0]m_axi_mem_awburst;
  output m_axi_mem_awvalid;
  input m_axi_mem_awready;
  output [31:0]m_axi_mem_wdata;
  output [3:0]m_axi_mem_wstrb;
  output m_axi_mem_wlast;
  output m_axi_mem_wvalid;
  input m_axi_mem_wready;
  input [5:0]m_axi_mem_bid;
  input [1:0]m_axi_mem_bresp;
  input m_axi_mem_bvalid;
  output m_axi_mem_bready;
  output [5:0]m_axi_mem_arid;
  output [31:0]m_axi_mem_araddr;
  output [7:0]m_axi_mem_arlen;
  output [2:0]m_axi_mem_arsize;
  output [1:0]m_axi_mem_arburst;
  output m_axi_mem_arvalid;
  input m_axi_mem_arready;
  input [5:0]m_axi_mem_rid;
  input [31:0]m_axi_mem_rdata;
  input [1:0]m_axi_mem_rresp;
  input m_axi_mem_rlast;
  input m_axi_mem_rvalid;
  output m_axi_mem_rready;
endmodule
