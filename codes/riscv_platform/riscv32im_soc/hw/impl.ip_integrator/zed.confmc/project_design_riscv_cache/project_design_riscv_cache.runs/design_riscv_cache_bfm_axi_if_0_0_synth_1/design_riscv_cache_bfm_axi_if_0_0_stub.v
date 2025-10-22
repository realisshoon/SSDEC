// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Tue Oct 21 15:55:20 2025
// Host        : sogang-500TGA-500SGA running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_riscv_cache_bfm_axi_if_0_0_stub.v
// Design      : design_riscv_cache_bfm_axi_if_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "bfm_axi_if,Vivado 2021.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(SYS_CLK_STABLE, SYS_CLK, SYS_RST_N, SL_RST_N, 
  SL_CS_N, SL_PCLK, SL_FLAGA, SL_FLAGB, SL_FLAGC, SL_FLAGD, SL_RD_N, SL_WR_N, SL_OE_N, SL_PKTEND_N, 
  SL_AD, SL_DT, SL_MODE, GPOUT, GPIN, m_axi_aclk, m_axi_aresetn, m_axi_awid, m_axi_awaddr, 
  m_axi_awlen, m_axi_awlock, m_axi_awsize, m_axi_awburst, m_axi_awcache, m_axi_awprot, 
  m_axi_awvalid, m_axi_awready, m_axi_awqos, m_axi_awregion, m_axi_wid, m_axi_wdata, 
  m_axi_wstrb, m_axi_wlast, m_axi_wvalid, m_axi_wready, m_axi_bid, m_axi_bresp, m_axi_bvalid, 
  m_axi_bready, m_axi_arid, m_axi_araddr, m_axi_arlen, m_axi_arlock, m_axi_arsize, 
  m_axi_arburst, m_axi_arcache, m_axi_arprot, m_axi_arvalid, m_axi_arready, m_axi_arqos, 
  m_axi_arregion, m_axi_rid, m_axi_rdata, m_axi_rresp, m_axi_rlast, m_axi_rvalid, m_axi_rready)
/* synthesis syn_black_box black_box_pad_pin="SYS_CLK_STABLE,SYS_CLK,SYS_RST_N,SL_RST_N,SL_CS_N,SL_PCLK,SL_FLAGA,SL_FLAGB,SL_FLAGC,SL_FLAGD,SL_RD_N,SL_WR_N,SL_OE_N,SL_PKTEND_N,SL_AD[1:0],SL_DT[31:0],SL_MODE[1:0],GPOUT[15:0],GPIN[15:0],m_axi_aclk,m_axi_aresetn,m_axi_awid[3:0],m_axi_awaddr[31:0],m_axi_awlen[7:0],m_axi_awlock,m_axi_awsize[2:0],m_axi_awburst[1:0],m_axi_awcache[3:0],m_axi_awprot[2:0],m_axi_awvalid,m_axi_awready,m_axi_awqos[3:0],m_axi_awregion[3:0],m_axi_wid[3:0],m_axi_wdata[31:0],m_axi_wstrb[3:0],m_axi_wlast,m_axi_wvalid,m_axi_wready,m_axi_bid[3:0],m_axi_bresp[1:0],m_axi_bvalid,m_axi_bready,m_axi_arid[3:0],m_axi_araddr[31:0],m_axi_arlen[7:0],m_axi_arlock,m_axi_arsize[2:0],m_axi_arburst[1:0],m_axi_arcache[3:0],m_axi_arprot[2:0],m_axi_arvalid,m_axi_arready,m_axi_arqos[3:0],m_axi_arregion[3:0],m_axi_rid[3:0],m_axi_rdata[31:0],m_axi_rresp[1:0],m_axi_rlast,m_axi_rvalid,m_axi_rready" */;
  input SYS_CLK_STABLE;
  input SYS_CLK;
  output SYS_RST_N;
  input SL_RST_N;
  output SL_CS_N;
  output SL_PCLK;
  input SL_FLAGA;
  input SL_FLAGB;
  input SL_FLAGC;
  input SL_FLAGD;
  output SL_RD_N;
  output SL_WR_N;
  output SL_OE_N;
  output SL_PKTEND_N;
  output [1:0]SL_AD;
  inout [31:0]SL_DT;
  input [1:0]SL_MODE;
  output [15:0]GPOUT;
  input [15:0]GPIN;
  input m_axi_aclk;
  input m_axi_aresetn;
  output [3:0]m_axi_awid;
  output [31:0]m_axi_awaddr;
  output [7:0]m_axi_awlen;
  output m_axi_awlock;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output m_axi_awvalid;
  input m_axi_awready;
  output [3:0]m_axi_awqos;
  output [3:0]m_axi_awregion;
  output [3:0]m_axi_wid;
  output [31:0]m_axi_wdata;
  output [3:0]m_axi_wstrb;
  output m_axi_wlast;
  output m_axi_wvalid;
  input m_axi_wready;
  input [3:0]m_axi_bid;
  input [1:0]m_axi_bresp;
  input m_axi_bvalid;
  output m_axi_bready;
  output [3:0]m_axi_arid;
  output [31:0]m_axi_araddr;
  output [7:0]m_axi_arlen;
  output m_axi_arlock;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output m_axi_arvalid;
  input m_axi_arready;
  output [3:0]m_axi_arqos;
  output [3:0]m_axi_arregion;
  input [3:0]m_axi_rid;
  input [31:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input m_axi_rvalid;
  output m_axi_rready;
endmodule
