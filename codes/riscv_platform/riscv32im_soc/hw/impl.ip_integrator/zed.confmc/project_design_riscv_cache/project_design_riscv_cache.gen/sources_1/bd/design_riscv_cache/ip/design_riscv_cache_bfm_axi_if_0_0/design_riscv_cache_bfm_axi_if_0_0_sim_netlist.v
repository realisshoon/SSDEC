// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Wed Oct 29 17:33:43 2025
// Host        : sogang-500TGA-500SGA running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/sogang/pjt/team2/codes/riscv_platform/riscv32im_soc/hw/impl.ip_integrator/zed.confmc/project_design_riscv_cache/project_design_riscv_cache.gen/sources_1/bd/design_riscv_cache/ip/design_riscv_cache_bfm_axi_if_0_0/design_riscv_cache_bfm_axi_if_0_0_sim_netlist.v
// Design      : design_riscv_cache_bfm_axi_if_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_riscv_cache_bfm_axi_if_0_0,bfm_axi_if,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "bfm_axi_if,Vivado 2021.2" *) 
(* NotValidForBitStream *)
module design_riscv_cache_bfm_axi_if_0_0
   (SYS_CLK_STABLE,
    SYS_CLK,
    SYS_RST_N,
    SL_RST_N,
    SL_CS_N,
    SL_PCLK,
    SL_FLAGA,
    SL_FLAGB,
    SL_FLAGC,
    SL_FLAGD,
    SL_RD_N,
    SL_WR_N,
    SL_OE_N,
    SL_PKTEND_N,
    SL_AD,
    SL_DT,
    SL_MODE,
    GPOUT,
    GPIN,
    m_axi_aclk,
    m_axi_aresetn,
    m_axi_awid,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awlock,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_awqos,
    m_axi_awregion,
    m_axi_wid,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bid,
    m_axi_bresp,
    m_axi_bvalid,
    m_axi_bready,
    m_axi_arid,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arlock,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_arqos,
    m_axi_arregion,
    m_axi_rid,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_rvalid,
    m_axi_rready);
  input SYS_CLK_STABLE;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 SYS_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SYS_CLK, ASSOCIATED_RESET SYS_RST_N, FREQ_HZ 80000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *) input SYS_CLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 SYS_RST_N RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SYS_RST_N, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) output SYS_RST_N;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 SL_RST_N RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SL_RST_N, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) (* xc_pullup = "1" *) input SL_RST_N;
  output SL_CS_N;
  output SL_PCLK;
  (* xc_pulldown = "1" *) input SL_FLAGA;
  (* xc_pulldown = "1" *) input SL_FLAGB;
  (* xc_pulldown = "1" *) input SL_FLAGC;
  (* xc_pulldown = "1" *) input SL_FLAGD;
  output SL_RD_N;
  output SL_WR_N;
  output SL_OE_N;
  output SL_PKTEND_N;
  output [1:0]SL_AD;
  inout [31:0]SL_DT;
  input [1:0]SL_MODE;
  output [15:0]GPOUT;
  input [15:0]GPIN;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 m_axi_aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_aclk, ASSOCIATED_BUSIF m_axi, ASSOCIATED_RESET m_axi_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *) input m_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 m_axi_aresetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input m_axi_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWID" *) output [3:0]m_axi_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWADDR" *) output [31:0]m_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWLEN" *) output [7:0]m_axi_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWLOCK" *) output m_axi_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWSIZE" *) output [2:0]m_axi_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWBURST" *) output [1:0]m_axi_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWCACHE" *) output [3:0]m_axi_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWPROT" *) output [2:0]m_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWVALID" *) output m_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWREADY" *) input m_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWQOS" *) output [3:0]m_axi_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWREGION" *) output [3:0]m_axi_awregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi WID" *) output [3:0]m_axi_wid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi WDATA" *) output [31:0]m_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi WSTRB" *) output [3:0]m_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi WLAST" *) output m_axi_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi WVALID" *) output m_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi WREADY" *) input m_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi BID" *) input [3:0]m_axi_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi BRESP" *) input [1:0]m_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi BVALID" *) input m_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi BREADY" *) output m_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARID" *) output [3:0]m_axi_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARADDR" *) output [31:0]m_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARLEN" *) output [7:0]m_axi_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARLOCK" *) output m_axi_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARSIZE" *) output [2:0]m_axi_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARBURST" *) output [1:0]m_axi_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARCACHE" *) output [3:0]m_axi_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARPROT" *) output [2:0]m_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARVALID" *) output m_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARREADY" *) input m_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARQOS" *) output [3:0]m_axi_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARREGION" *) output [3:0]m_axi_arregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi RID" *) input [3:0]m_axi_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi RDATA" *) input [31:0]m_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi RRESP" *) input [1:0]m_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi RLAST" *) input m_axi_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi RVALID" *) input m_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 4, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) output m_axi_rready;

  wire \<const0> ;
  wire [15:0]GPIN;
  wire [15:0]GPOUT;
  wire [1:0]SL_AD;
  wire SL_CS_N;
  (* DRIVE = "12" *) (* IBUF_LOW_PWR *) (* IOB = "TRUE" *) 
  (* SLEW = "SLOW" *) wire [31:0]SL_DT;
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
  wire SYS_CLK;
  wire SYS_CLK_STABLE;
  wire SYS_RST_N;
  wire m_axi_aclk;
  wire [31:0]m_axi_araddr;
  wire [1:0]m_axi_arburst;
  wire m_axi_aresetn;
  wire [3:0]m_axi_arid;
  wire [7:0]m_axi_arlen;
  wire m_axi_arlock;
  wire [3:0]m_axi_arqos;
  wire m_axi_arready;
  wire [3:0]m_axi_arregion;
  wire [2:0]m_axi_arsize;
  wire m_axi_arvalid;
  wire [31:0]m_axi_awaddr;
  wire [1:0]m_axi_awburst;
  wire [3:0]m_axi_awid;
  wire [7:0]m_axi_awlen;
  wire m_axi_awlock;
  wire [3:0]m_axi_awqos;
  wire m_axi_awready;
  wire [3:0]m_axi_awregion;
  wire [2:0]m_axi_awsize;
  wire m_axi_awvalid;
  wire [3:0]m_axi_bid;
  wire m_axi_bready;
  wire [1:0]m_axi_bresp;
  wire m_axi_bvalid;
  wire [31:0]m_axi_rdata;
  wire [3:0]m_axi_rid;
  wire m_axi_rlast;
  wire m_axi_rready;
  wire [1:0]m_axi_rresp;
  wire m_axi_rvalid;
  wire [31:0]m_axi_wdata;
  wire [3:0]m_axi_wid;
  wire m_axi_wlast;
  wire m_axi_wready;
  wire [3:0]m_axi_wstrb;
  wire m_axi_wvalid;

  assign m_axi_arcache[3] = \<const0> ;
  assign m_axi_arcache[2] = \<const0> ;
  assign m_axi_arcache[1] = \<const0> ;
  assign m_axi_arcache[0] = \<const0> ;
  assign m_axi_arprot[2] = \<const0> ;
  assign m_axi_arprot[1] = \<const0> ;
  assign m_axi_arprot[0] = \<const0> ;
  assign m_axi_awcache[3] = \<const0> ;
  assign m_axi_awcache[2] = \<const0> ;
  assign m_axi_awcache[1] = \<const0> ;
  assign m_axi_awcache[0] = \<const0> ;
  assign m_axi_awprot[2] = \<const0> ;
  assign m_axi_awprot[1] = \<const0> ;
  assign m_axi_awprot[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  design_riscv_cache_bfm_axi_if_0_0_bfm_axi_if inst
       (.GPIN(GPIN),
        .GPOUT(GPOUT),
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
        .SYS_CLK(SYS_CLK),
        .SYS_CLK_STABLE(SYS_CLK_STABLE),
        .SYS_RST_N(SYS_RST_N),
        .m_axi_aclk(m_axi_aclk),
        .m_axi_araddr(m_axi_araddr),
        .m_axi_arburst(m_axi_arburst),
        .m_axi_aresetn(m_axi_aresetn),
        .m_axi_arid(m_axi_arid),
        .m_axi_arlen(m_axi_arlen),
        .m_axi_arlock(m_axi_arlock),
        .m_axi_arqos(m_axi_arqos),
        .m_axi_arready(m_axi_arready),
        .m_axi_arregion(m_axi_arregion),
        .m_axi_arsize(m_axi_arsize),
        .m_axi_arvalid(m_axi_arvalid),
        .m_axi_awaddr(m_axi_awaddr),
        .m_axi_awburst(m_axi_awburst),
        .m_axi_awid(m_axi_awid),
        .m_axi_awlen(m_axi_awlen),
        .m_axi_awlock(m_axi_awlock),
        .m_axi_awqos(m_axi_awqos),
        .m_axi_awready(m_axi_awready),
        .m_axi_awregion(m_axi_awregion),
        .m_axi_awsize(m_axi_awsize),
        .m_axi_awvalid(m_axi_awvalid),
        .m_axi_bid(m_axi_bid),
        .m_axi_bready(m_axi_bready),
        .m_axi_bresp(m_axi_bresp),
        .m_axi_bvalid(m_axi_bvalid),
        .m_axi_rdata(m_axi_rdata),
        .m_axi_rid(m_axi_rid),
        .m_axi_rlast(m_axi_rlast),
        .m_axi_rready(m_axi_rready),
        .m_axi_rresp(m_axi_rresp),
        .m_axi_rvalid(m_axi_rvalid),
        .m_axi_wdata(m_axi_wdata),
        .m_axi_wid(m_axi_wid),
        .m_axi_wlast(m_axi_wlast),
        .m_axi_wready(m_axi_wready),
        .m_axi_wstrb(m_axi_wstrb),
        .m_axi_wvalid(m_axi_wvalid));
endmodule

(* AXI_WIDTH_AD = "32" *) (* AXI_WIDTH_CID = "4" *) (* AXI_WIDTH_DA = "32" *) 
(* AXI_WIDTH_DS = "4" *) (* AXI_WIDTH_DSB = "2" *) (* AXI_WIDTH_ID = "4" *) 
(* DEPTH_FIFO_CU2F = "512" *) (* DEPTH_FIFO_DF2U = "512" *) (* DEPTH_FIFO_DU2F = "512" *) 
(* FPGA_FAMILY = "ZYNQ7000" *) (* ORIG_REF_NAME = "bfm_axi" *) (* PCLK_FREQ = "80000000" *) 
(* PCLK_INV = "1'b1" *) (* TRANSACTOR_ID = "4'b0000" *) 
module design_riscv_cache_bfm_axi_if_0_0_bfm_axi
   (ACLK,
    ARESETn,
    ARLOCK,
    ARREADY,
    ARVALID,
    AWLOCK,
    AWREADY,
    AWVALID,
    BREADY,
    BVALID,
    FIQ,
    IRQ,
    RLAST,
    RREADY,
    RVALID,
    SL_CS_N,
    SL_DT_T,
    SL_FLAGA,
    SL_FLAGB,
    SL_FLAGC,
    SL_FLAGD,
    SL_OE_N,
    SL_PCLK,
    SL_PKTEND_N,
    SL_RD_N,
    SL_RST_N,
    SL_WR_N,
    SYS_CLK,
    SYS_CLK_STABLE,
    SYS_RST_N,
    WLAST,
    WREADY,
    WVALID,
    ARADDR,
    ARBURST,
    ARID,
    ARLEN,
    ARQOS,
    ARREGION,
    ARSIZE,
    AWADDR,
    AWBURST,
    AWID,
    AWLEN,
    AWQOS,
    AWREGION,
    AWSIZE,
    BID,
    BRESP,
    GPIN,
    GPOUT,
    MID,
    RDATA,
    RID,
    RRESP,
    SL_AD,
    SL_DT_I,
    SL_DT_O,
    SL_MODE,
    WDATA,
    WID,
    WSTRB);
  input ACLK;
  input ARESETn;
  output ARLOCK;
  input ARREADY;
  output ARVALID;
  output AWLOCK;
  input AWREADY;
  output AWVALID;
  output BREADY;
  input BVALID;
  input FIQ;
  input IRQ;
  input RLAST;
  output RREADY;
  input RVALID;
  output SL_CS_N;
  output SL_DT_T;
  (* xc_pullup = "1" *) input SL_FLAGA;
  (* xc_pullup = "1" *) input SL_FLAGB;
  (* xc_pullup = "1" *) input SL_FLAGC;
  (* xc_pullup = "1" *) input SL_FLAGD;
  output SL_OE_N;
  output SL_PCLK;
  output SL_PKTEND_N;
  output SL_RD_N;
  input SL_RST_N;
  output SL_WR_N;
  input SYS_CLK;
  (* xc_pulldown = "1" *) input SYS_CLK_STABLE;
  output SYS_RST_N;
  output WLAST;
  input WREADY;
  output WVALID;
  output [31:0]ARADDR;
  output [1:0]ARBURST;
  output [3:0]ARID;
  output [7:0]ARLEN;
  output [3:0]ARQOS;
  output [3:0]ARREGION;
  output [2:0]ARSIZE;
  output [31:0]AWADDR;
  output [1:0]AWBURST;
  output [3:0]AWID;
  output [7:0]AWLEN;
  output [3:0]AWQOS;
  output [3:0]AWREGION;
  output [2:0]AWSIZE;
  input [3:0]BID;
  input [1:0]BRESP;
  input [15:0]GPIN;
  output [15:0]GPOUT;
  input [3:0]MID;
  input [31:0]RDATA;
  input [3:0]RID;
  input [1:0]RRESP;
  output [1:0]SL_AD;
  input [31:0]SL_DT_I;
  output [31:0]SL_DT_O;
  input [1:0]SL_MODE;
  output [31:0]WDATA;
  output [3:0]WID;
  output [3:0]WSTRB;

  wire \<const0> ;
  wire ACLK;
  wire [31:0]ARADDR;
  wire [1:0]ARBURST;
  wire ARESETn;
  wire [3:0]ARID;
  wire [7:0]ARLEN;
  wire ARLOCK;
  wire ARREADY;
  wire [2:0]ARSIZE;
  wire ARVALID;
  wire [31:0]AWADDR;
  wire [1:0]AWBURST;
  wire [3:0]AWID;
  wire [7:0]AWLEN;
  wire AWLOCK;
  wire AWREADY;
  wire [2:0]AWSIZE;
  wire AWVALID;
  wire BREADY;
  wire BREADY1__0;
  wire [1:0]BRESP;
  wire BVALID;
  wire CMD1__2;
  wire FIQ;
  wire [15:0]GPIN;
  wire [15:0]GPOUT;
  wire IRQ;
  wire [3:0]MID;
  wire [31:0]RDATA;
  wire RREADY;
  wire [1:0]RRESP;
  wire RVALID;
  wire [1:0]\^SL_AD ;
  wire [31:0]SL_DT_I;
  wire [31:0]SL_DT_O;
  wire SL_DT_T;
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
  wire SYS_CLK;
  wire SYS_CLK_STABLE;
  wire SYS_RST_N;
  wire [31:0]WDATA;
  wire [3:0]WID;
  wire WLAST;
  wire WREADY;
  wire [3:0]WSTRB;
  wire WVALID;
  wire [31:0]cmd_rd_data;
  wire cmd_rd_ready;
  wire cmd_rd_valid;
  wire [31:0]f2u_wr_data;
  wire f2u_wr_ready;
  wire f2u_wr_valid;
  wire [31:0]u2f_rd_data;
  wire u2f_rd_ready;
  wire u2f_rd_valid;

  assign ARQOS[3] = \<const0> ;
  assign ARQOS[2] = \<const0> ;
  assign ARQOS[1] = \<const0> ;
  assign ARQOS[0] = \<const0> ;
  assign ARREGION[3] = \<const0> ;
  assign ARREGION[2] = \<const0> ;
  assign ARREGION[1] = \<const0> ;
  assign ARREGION[0] = \<const0> ;
  assign AWQOS[3] = \<const0> ;
  assign AWQOS[2] = \<const0> ;
  assign AWQOS[1] = \<const0> ;
  assign AWQOS[0] = \<const0> ;
  assign AWREGION[3] = \<const0> ;
  assign AWREGION[2] = \<const0> ;
  assign AWREGION[1] = \<const0> ;
  assign AWREGION[0] = \<const0> ;
  assign SL_AD[1] = \^SL_AD [1];
  assign SL_AD[0] = \<const0> ;
  assign SL_CS_N = \<const0> ;
  GND GND
       (.G(\<const0> ));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst u_gpif2mst
       (.ACLK(ACLK),
        .BREADY1__0(BREADY1__0),
        .CMD1__2(CMD1__2),
        .SL_AD(\^SL_AD [1]),
        .SL_DT_I(SL_DT_I),
        .SL_DT_O(SL_DT_O),
        .SL_DT_T(SL_DT_T),
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
        .SYS_CLK(SYS_CLK),
        .SYS_CLK_STABLE(SYS_CLK_STABLE),
        .SYS_RST_N(SYS_RST_N),
        .cmd_rd_data(cmd_rd_data),
        .cmd_rd_ready(cmd_rd_ready),
        .cmd_rd_valid(cmd_rd_valid),
        .f2u_wr_ready(f2u_wr_ready),
        .f2u_wr_valid(f2u_wr_valid),
        .rd_dout(f2u_wr_data),
        .u2f_rd_data(u2f_rd_data),
        .u2f_rd_ready(u2f_rd_ready),
        .u2f_rd_valid(u2f_rd_valid));
  design_riscv_cache_bfm_axi_if_0_0_trx_axi u_trx_axi
       (.ACLK(ACLK),
        .ACLK_0(f2u_wr_data),
        .ARADDR(ARADDR),
        .ARBURST(ARBURST),
        .ARESETn(ARESETn),
        .ARID(ARID),
        .ARLEN(ARLEN),
        .ARLOCK(ARLOCK),
        .ARREADY(ARREADY),
        .ARSIZE(ARSIZE),
        .ARVALID(ARVALID),
        .AWADDR(AWADDR),
        .AWBURST(AWBURST),
        .AWID(AWID),
        .AWLEN(AWLEN),
        .AWLOCK(AWLOCK),
        .AWREADY(AWREADY),
        .AWSIZE(AWSIZE),
        .AWVALID(AWVALID),
        .BREADY1__0(BREADY1__0),
        .BREADY_reg_0(BREADY),
        .BRESP(BRESP),
        .BVALID(BVALID),
        .CMD1__2(CMD1__2),
        .D({FIQ,IRQ,MID,GPIN}),
        .GPOUT(GPOUT),
        .RDATA(RDATA),
        .RREADY(RREADY),
        .RRESP(RRESP),
        .RVALID(RVALID),
        .WLAST(WLAST),
        .WREADY(WREADY),
        .WVALID(WVALID),
        .cmd_rd_data(cmd_rd_data),
        .cmd_rd_ready(cmd_rd_ready),
        .cmd_rd_valid(cmd_rd_valid),
        .f2u_wr_ready(f2u_wr_ready),
        .f2u_wr_valid(f2u_wr_valid),
        .rd_dout({WID,WSTRB,WDATA}),
        .u2f_rd_data(u2f_rd_data),
        .u2f_rd_ready(u2f_rd_ready),
        .u2f_rd_valid(u2f_rd_valid));
endmodule

(* ORIG_REF_NAME = "bfm_axi_if" *) 
module design_riscv_cache_bfm_axi_if_0_0_bfm_axi_if
   (SYS_RST_N,
    SL_CS_N,
    SL_PCLK,
    SL_AD,
    SL_RD_N,
    SL_WR_N,
    SL_OE_N,
    SL_PKTEND_N,
    m_axi_awid,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awlock,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awvalid,
    m_axi_awqos,
    m_axi_awregion,
    m_axi_wid,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wvalid,
    m_axi_bready,
    m_axi_arid,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arlock,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arvalid,
    m_axi_arqos,
    m_axi_arregion,
    m_axi_rready,
    GPOUT,
    SL_DT,
    SYS_CLK_STABLE,
    SYS_CLK,
    SL_RST_N,
    SL_FLAGA,
    SL_FLAGB,
    SL_FLAGC,
    SL_FLAGD,
    SL_MODE,
    m_axi_aresetn,
    m_axi_aclk,
    m_axi_awready,
    m_axi_wready,
    m_axi_bid,
    m_axi_bresp,
    m_axi_bvalid,
    m_axi_arready,
    m_axi_rid,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_rvalid,
    GPIN);
  output SYS_RST_N;
  output SL_CS_N;
  output SL_PCLK;
  output [1:0]SL_AD;
  output SL_RD_N;
  output SL_WR_N;
  output SL_OE_N;
  output SL_PKTEND_N;
  output [3:0]m_axi_awid;
  output [31:0]m_axi_awaddr;
  output [7:0]m_axi_awlen;
  output m_axi_awlock;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output m_axi_awvalid;
  output [3:0]m_axi_awqos;
  output [3:0]m_axi_awregion;
  output [3:0]m_axi_wid;
  output [31:0]m_axi_wdata;
  output [3:0]m_axi_wstrb;
  output m_axi_wlast;
  output m_axi_wvalid;
  output m_axi_bready;
  output [3:0]m_axi_arid;
  output [31:0]m_axi_araddr;
  output [7:0]m_axi_arlen;
  output m_axi_arlock;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output m_axi_arvalid;
  output [3:0]m_axi_arqos;
  output [3:0]m_axi_arregion;
  output m_axi_rready;
  output [15:0]GPOUT;
  inout [31:0]SL_DT;
  input SYS_CLK_STABLE;
  input SYS_CLK;
  input SL_RST_N;
  input SL_FLAGA;
  input SL_FLAGB;
  input SL_FLAGC;
  input SL_FLAGD;
  input [1:0]SL_MODE;
  input m_axi_aresetn;
  input m_axi_aclk;
  input m_axi_awready;
  input m_axi_wready;
  input [3:0]m_axi_bid;
  input [1:0]m_axi_bresp;
  input m_axi_bvalid;
  input m_axi_arready;
  input [3:0]m_axi_rid;
  input [31:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input m_axi_rvalid;
  input [15:0]GPIN;

  wire [15:0]GPIN;
  wire [15:0]GPOUT;
  wire [1:0]SL_AD;
  wire SL_CS_N;
  wire [31:0]SL_DT;
  wire [31:0]SL_DT_I;
  wire [31:0]SL_DT_O;
  wire SL_DT_T;
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
  wire SYS_CLK;
  wire SYS_CLK_STABLE;
  wire SYS_RST_N;
  wire m_axi_aclk;
  wire [31:0]m_axi_araddr;
  wire [1:0]m_axi_arburst;
  wire m_axi_aresetn;
  wire [3:0]m_axi_arid;
  wire [7:0]m_axi_arlen;
  wire m_axi_arlock;
  wire [3:0]m_axi_arqos;
  wire m_axi_arready;
  wire [3:0]m_axi_arregion;
  wire [2:0]m_axi_arsize;
  wire m_axi_arvalid;
  wire [31:0]m_axi_awaddr;
  wire [1:0]m_axi_awburst;
  wire [3:0]m_axi_awid;
  wire [7:0]m_axi_awlen;
  wire m_axi_awlock;
  wire [3:0]m_axi_awqos;
  wire m_axi_awready;
  wire [3:0]m_axi_awregion;
  wire [2:0]m_axi_awsize;
  wire m_axi_awvalid;
  wire [3:0]m_axi_bid;
  wire m_axi_bready;
  wire [1:0]m_axi_bresp;
  wire m_axi_bvalid;
  wire [31:0]m_axi_rdata;
  wire [3:0]m_axi_rid;
  wire m_axi_rlast;
  wire m_axi_rready;
  wire [1:0]m_axi_rresp;
  wire m_axi_rvalid;
  wire [31:0]m_axi_wdata;
  wire [3:0]m_axi_wid;
  wire m_axi_wlast;
  wire m_axi_wready;
  wire [3:0]m_axi_wstrb;
  wire m_axi_wvalid;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \IDX_SL_DT[0].IOPAD_SL_DT 
       (.I(SL_DT_O[0]),
        .IO(SL_DT[0]),
        .O(SL_DT_I[0]),
        .T(SL_DT_T));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \IDX_SL_DT[10].IOPAD_SL_DT 
       (.I(SL_DT_O[10]),
        .IO(SL_DT[10]),
        .O(SL_DT_I[10]),
        .T(SL_DT_T));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \IDX_SL_DT[11].IOPAD_SL_DT 
       (.I(SL_DT_O[11]),
        .IO(SL_DT[11]),
        .O(SL_DT_I[11]),
        .T(SL_DT_T));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \IDX_SL_DT[12].IOPAD_SL_DT 
       (.I(SL_DT_O[12]),
        .IO(SL_DT[12]),
        .O(SL_DT_I[12]),
        .T(SL_DT_T));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \IDX_SL_DT[13].IOPAD_SL_DT 
       (.I(SL_DT_O[13]),
        .IO(SL_DT[13]),
        .O(SL_DT_I[13]),
        .T(SL_DT_T));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \IDX_SL_DT[14].IOPAD_SL_DT 
       (.I(SL_DT_O[14]),
        .IO(SL_DT[14]),
        .O(SL_DT_I[14]),
        .T(SL_DT_T));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \IDX_SL_DT[15].IOPAD_SL_DT 
       (.I(SL_DT_O[15]),
        .IO(SL_DT[15]),
        .O(SL_DT_I[15]),
        .T(SL_DT_T));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \IDX_SL_DT[16].IOPAD_SL_DT 
       (.I(SL_DT_O[16]),
        .IO(SL_DT[16]),
        .O(SL_DT_I[16]),
        .T(SL_DT_T));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \IDX_SL_DT[17].IOPAD_SL_DT 
       (.I(SL_DT_O[17]),
        .IO(SL_DT[17]),
        .O(SL_DT_I[17]),
        .T(SL_DT_T));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \IDX_SL_DT[18].IOPAD_SL_DT 
       (.I(SL_DT_O[18]),
        .IO(SL_DT[18]),
        .O(SL_DT_I[18]),
        .T(SL_DT_T));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \IDX_SL_DT[19].IOPAD_SL_DT 
       (.I(SL_DT_O[19]),
        .IO(SL_DT[19]),
        .O(SL_DT_I[19]),
        .T(SL_DT_T));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \IDX_SL_DT[1].IOPAD_SL_DT 
       (.I(SL_DT_O[1]),
        .IO(SL_DT[1]),
        .O(SL_DT_I[1]),
        .T(SL_DT_T));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \IDX_SL_DT[20].IOPAD_SL_DT 
       (.I(SL_DT_O[20]),
        .IO(SL_DT[20]),
        .O(SL_DT_I[20]),
        .T(SL_DT_T));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \IDX_SL_DT[21].IOPAD_SL_DT 
       (.I(SL_DT_O[21]),
        .IO(SL_DT[21]),
        .O(SL_DT_I[21]),
        .T(SL_DT_T));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \IDX_SL_DT[22].IOPAD_SL_DT 
       (.I(SL_DT_O[22]),
        .IO(SL_DT[22]),
        .O(SL_DT_I[22]),
        .T(SL_DT_T));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \IDX_SL_DT[23].IOPAD_SL_DT 
       (.I(SL_DT_O[23]),
        .IO(SL_DT[23]),
        .O(SL_DT_I[23]),
        .T(SL_DT_T));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \IDX_SL_DT[24].IOPAD_SL_DT 
       (.I(SL_DT_O[24]),
        .IO(SL_DT[24]),
        .O(SL_DT_I[24]),
        .T(SL_DT_T));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \IDX_SL_DT[25].IOPAD_SL_DT 
       (.I(SL_DT_O[25]),
        .IO(SL_DT[25]),
        .O(SL_DT_I[25]),
        .T(SL_DT_T));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \IDX_SL_DT[26].IOPAD_SL_DT 
       (.I(SL_DT_O[26]),
        .IO(SL_DT[26]),
        .O(SL_DT_I[26]),
        .T(SL_DT_T));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \IDX_SL_DT[27].IOPAD_SL_DT 
       (.I(SL_DT_O[27]),
        .IO(SL_DT[27]),
        .O(SL_DT_I[27]),
        .T(SL_DT_T));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \IDX_SL_DT[28].IOPAD_SL_DT 
       (.I(SL_DT_O[28]),
        .IO(SL_DT[28]),
        .O(SL_DT_I[28]),
        .T(SL_DT_T));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \IDX_SL_DT[29].IOPAD_SL_DT 
       (.I(SL_DT_O[29]),
        .IO(SL_DT[29]),
        .O(SL_DT_I[29]),
        .T(SL_DT_T));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \IDX_SL_DT[2].IOPAD_SL_DT 
       (.I(SL_DT_O[2]),
        .IO(SL_DT[2]),
        .O(SL_DT_I[2]),
        .T(SL_DT_T));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \IDX_SL_DT[30].IOPAD_SL_DT 
       (.I(SL_DT_O[30]),
        .IO(SL_DT[30]),
        .O(SL_DT_I[30]),
        .T(SL_DT_T));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \IDX_SL_DT[31].IOPAD_SL_DT 
       (.I(SL_DT_O[31]),
        .IO(SL_DT[31]),
        .O(SL_DT_I[31]),
        .T(SL_DT_T));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \IDX_SL_DT[3].IOPAD_SL_DT 
       (.I(SL_DT_O[3]),
        .IO(SL_DT[3]),
        .O(SL_DT_I[3]),
        .T(SL_DT_T));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \IDX_SL_DT[4].IOPAD_SL_DT 
       (.I(SL_DT_O[4]),
        .IO(SL_DT[4]),
        .O(SL_DT_I[4]),
        .T(SL_DT_T));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \IDX_SL_DT[5].IOPAD_SL_DT 
       (.I(SL_DT_O[5]),
        .IO(SL_DT[5]),
        .O(SL_DT_I[5]),
        .T(SL_DT_T));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \IDX_SL_DT[6].IOPAD_SL_DT 
       (.I(SL_DT_O[6]),
        .IO(SL_DT[6]),
        .O(SL_DT_I[6]),
        .T(SL_DT_T));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \IDX_SL_DT[7].IOPAD_SL_DT 
       (.I(SL_DT_O[7]),
        .IO(SL_DT[7]),
        .O(SL_DT_I[7]),
        .T(SL_DT_T));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \IDX_SL_DT[8].IOPAD_SL_DT 
       (.I(SL_DT_O[8]),
        .IO(SL_DT[8]),
        .O(SL_DT_I[8]),
        .T(SL_DT_T));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \IDX_SL_DT[9].IOPAD_SL_DT 
       (.I(SL_DT_O[9]),
        .IO(SL_DT[9]),
        .O(SL_DT_I[9]),
        .T(SL_DT_T));
  (* BOX_TYPE = "black_box" *) 
  (* black_box = "1" *) 
  design_riscv_cache_bfm_axi_if_0_0_bfm_axi u_bfm_axi
       (.ACLK(m_axi_aclk),
        .ARADDR(m_axi_araddr),
        .ARBURST(m_axi_arburst),
        .ARESETn(m_axi_aresetn),
        .ARID(m_axi_arid),
        .ARLEN(m_axi_arlen),
        .ARLOCK(m_axi_arlock),
        .ARQOS(m_axi_arqos),
        .ARREADY(m_axi_arready),
        .ARREGION(m_axi_arregion),
        .ARSIZE(m_axi_arsize),
        .ARVALID(m_axi_arvalid),
        .AWADDR(m_axi_awaddr),
        .AWBURST(m_axi_awburst),
        .AWID(m_axi_awid),
        .AWLEN(m_axi_awlen),
        .AWLOCK(m_axi_awlock),
        .AWQOS(m_axi_awqos),
        .AWREADY(m_axi_awready),
        .AWREGION(m_axi_awregion),
        .AWSIZE(m_axi_awsize),
        .AWVALID(m_axi_awvalid),
        .BID(m_axi_bid),
        .BREADY(m_axi_bready),
        .BRESP(m_axi_bresp),
        .BVALID(m_axi_bvalid),
        .FIQ(1'b0),
        .GPIN(GPIN),
        .GPOUT(GPOUT),
        .IRQ(1'b0),
        .MID({1'b0,1'b0,1'b0,1'b1}),
        .RDATA(m_axi_rdata),
        .RID(m_axi_rid),
        .RLAST(m_axi_rlast),
        .RREADY(m_axi_rready),
        .RRESP(m_axi_rresp),
        .RVALID(m_axi_rvalid),
        .SL_AD(SL_AD),
        .SL_CS_N(SL_CS_N),
        .SL_DT_I(SL_DT_I),
        .SL_DT_O(SL_DT_O),
        .SL_DT_T(SL_DT_T),
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
        .SYS_CLK(SYS_CLK),
        .SYS_CLK_STABLE(SYS_CLK_STABLE),
        .SYS_RST_N(SYS_RST_N),
        .WDATA(m_axi_wdata),
        .WID(m_axi_wid),
        .WLAST(m_axi_wlast),
        .WREADY(m_axi_wready),
        .WSTRB(m_axi_wstrb),
        .WVALID(m_axi_wvalid));
endmodule

(* ORIG_REF_NAME = "gpif2mst" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst
   (ACLK,
    BREADY1__0,
    CMD1__2,
    SL_DT_T,
    SL_FLAGA,
    SL_FLAGB,
    SL_FLAGC,
    SL_FLAGD,
    SL_OE_N,
    SL_PCLK,
    SL_PKTEND_N,
    SL_RD_N,
    SL_RST_N,
    SL_WR_N,
    SYS_CLK,
    SYS_CLK_STABLE,
    SYS_RST_N,
    cmd_rd_ready,
    cmd_rd_valid,
    f2u_wr_ready,
    f2u_wr_valid,
    u2f_rd_ready,
    u2f_rd_valid,
    SL_AD,
    SL_DT_I,
    SL_DT_O,
    SL_MODE,
    cmd_rd_data,
    rd_dout,
    u2f_rd_data);
  input ACLK;
  output BREADY1__0;
  output CMD1__2;
  output SL_DT_T;
  input SL_FLAGA;
  input SL_FLAGB;
  input SL_FLAGC;
  input SL_FLAGD;
  output SL_OE_N;
  output SL_PCLK;
  output SL_PKTEND_N;
  output SL_RD_N;
  input SL_RST_N;
  output SL_WR_N;
  input SYS_CLK;
  input SYS_CLK_STABLE;
  output SYS_RST_N;
  input cmd_rd_ready;
  output cmd_rd_valid;
  output f2u_wr_ready;
  input f2u_wr_valid;
  input u2f_rd_ready;
  output u2f_rd_valid;
  output [0:0]SL_AD;
  input [31:0]SL_DT_I;
  output [31:0]SL_DT_O;
  input [1:0]SL_MODE;
  output [31:0]cmd_rd_data;
  input [31:0]rd_dout;
  output [31:0]u2f_rd_data;

  wire ACLK;
  wire BREADY1__0;
  wire CMD1__2;
  wire [0:0]SL_AD;
  wire \SL_AD[1]_i_1_n_0 ;
  wire \SL_AD[1]_i_2_n_0 ;
  wire \SL_AD[1]_i_3_n_0 ;
  wire [31:0]SL_DT_I;
  wire [31:0]SL_DT_O;
  wire \SL_DT_O[25]_i_2_n_0 ;
  wire \SL_DT_O[25]_i_3_n_0 ;
  wire \SL_DT_O[26]_i_2_n_0 ;
  wire \SL_DT_O[26]_i_3_n_0 ;
  wire \SL_DT_O[26]_i_4_n_0 ;
  wire \SL_DT_O[28]_i_2_n_0 ;
  wire \SL_DT_O[29]_i_2_n_0 ;
  wire \SL_DT_O[29]_i_3_n_0 ;
  wire \SL_DT_O[29]_i_4_n_0 ;
  wire \SL_DT_O[29]_i_5_n_0 ;
  wire \SL_DT_O[29]_i_6_n_0 ;
  wire \SL_DT_O[9]_i_2_n_0 ;
  wire SL_DT_T;
  wire SL_DT_T_i_1_n_0;
  wire SL_DT_T_i_2_n_0;
  wire SL_DT_T_i_3_n_0;
  wire SL_DT_T_i_4_n_0;
  wire SL_DT_T_i_5_n_0;
  (* RTL_KEEP = "true" *) wire SL_EMPTY_N;
  (* RTL_KEEP = "true" *) wire SL_FULL_N;
  wire [1:0]SL_MODE;
  wire SL_OE_N;
  wire SL_OE_N_i_3_n_0;
  wire SL_OE_N_i_4_n_0;
  wire SL_OE_N_i_5_n_0;
  wire SL_OE_N_i_6_n_0;
  wire SL_OE_N_i_7_n_0;
  wire SL_PCLK;
  wire SL_PKTEND_N;
  wire SL_PKTEND_N_i_4_n_0;
  wire SL_PKTEND_N_i_5_n_0;
  wire SL_PKTEND_N_i_6_n_0;
  wire SL_PKTEND_N_i_7_n_0;
  (* RTL_KEEP = "true" *) wire SL_PRE_EMPTY_N;
  (* RTL_KEEP = "true" *) wire SL_PRE_FULL_N;
  wire SL_RD_N;
  wire SL_RD_N00;
  wire SL_RD_N0_reg_n_0;
  wire SL_RD_N1;
  wire SL_RD_N_i_2_n_0;
  wire SL_RD_N_i_4_n_0;
  wire SL_RST_N;
  wire SL_WR_N;
  wire SL_WR_N_i_10_n_0;
  wire SL_WR_N_i_11_n_0;
  wire SL_WR_N_i_12_n_0;
  wire SL_WR_N_i_4_n_0;
  wire SL_WR_N_i_7_n_0;
  wire SL_WR_N_i_9_n_0;
  wire SYS_CLK;
  wire SYS_CLK_STABLE;
  wire SYS_RST_N;
  wire [31:0]cmd_rd_data;
  wire cmd_rd_ready;
  wire cmd_rd_valid;
  wire [31:0]cmd_wr_data;
  wire \cmd_wr_data[31]_i_1_n_0 ;
  wire cmd_wr_fullN;
  wire cmd_wr_valid;
  wire cmd_wr_valid_i_1_n_0;
  wire \cnt[0]_i_1_n_0 ;
  wire \cnt[0]_i_2_n_0 ;
  wire \cnt[0]_i_3_n_0 ;
  wire \cnt[10]_i_1_n_0 ;
  wire \cnt[11]_i_1_n_0 ;
  wire \cnt[12]_i_1_n_0 ;
  wire \cnt[13]_i_1_n_0 ;
  wire \cnt[14]_i_1_n_0 ;
  wire \cnt[15]_i_12_n_0 ;
  wire \cnt[15]_i_13_n_0 ;
  wire \cnt[15]_i_2_n_0 ;
  wire \cnt[15]_i_4_n_0 ;
  wire \cnt[15]_i_5_n_0 ;
  wire \cnt[15]_i_6_n_0 ;
  wire \cnt[15]_i_9_n_0 ;
  wire \cnt[1]_i_1_n_0 ;
  wire \cnt[2]_i_1_n_0 ;
  wire \cnt[3]_i_1_n_0 ;
  wire \cnt[4]_i_1_n_0 ;
  wire \cnt[5]_i_1_n_0 ;
  wire \cnt[6]_i_1_n_0 ;
  wire \cnt[7]_i_1_n_0 ;
  wire \cnt[8]_i_1_n_0 ;
  wire \cnt[9]_i_1_n_0 ;
  wire \cnt_reg[12]_i_2_n_0 ;
  wire \cnt_reg[12]_i_2_n_1 ;
  wire \cnt_reg[12]_i_2_n_2 ;
  wire \cnt_reg[12]_i_2_n_3 ;
  wire \cnt_reg[12]_i_2_n_4 ;
  wire \cnt_reg[12]_i_2_n_5 ;
  wire \cnt_reg[12]_i_2_n_6 ;
  wire \cnt_reg[12]_i_2_n_7 ;
  wire \cnt_reg[15]_i_10_n_2 ;
  wire \cnt_reg[15]_i_10_n_3 ;
  wire \cnt_reg[15]_i_10_n_5 ;
  wire \cnt_reg[15]_i_10_n_6 ;
  wire \cnt_reg[15]_i_10_n_7 ;
  wire \cnt_reg[4]_i_2_n_0 ;
  wire \cnt_reg[4]_i_2_n_1 ;
  wire \cnt_reg[4]_i_2_n_2 ;
  wire \cnt_reg[4]_i_2_n_3 ;
  wire \cnt_reg[4]_i_2_n_4 ;
  wire \cnt_reg[4]_i_2_n_5 ;
  wire \cnt_reg[4]_i_2_n_6 ;
  wire \cnt_reg[4]_i_2_n_7 ;
  wire \cnt_reg[8]_i_2_n_0 ;
  wire \cnt_reg[8]_i_2_n_1 ;
  wire \cnt_reg[8]_i_2_n_2 ;
  wire \cnt_reg[8]_i_2_n_3 ;
  wire \cnt_reg[8]_i_2_n_4 ;
  wire \cnt_reg[8]_i_2_n_5 ;
  wire \cnt_reg[8]_i_2_n_6 ;
  wire \cnt_reg[8]_i_2_n_7 ;
  wire [15:0]cnt_reg_n_0_;
  (* RTL_KEEP = "true" *) wire [31:0]control_flit;
  wire \control_flit[0]_i_1_n_0 ;
  wire \control_flit[10]_i_1_n_0 ;
  wire \control_flit[11]_i_1_n_0 ;
  wire \control_flit[12]_i_1_n_0 ;
  wire \control_flit[12]_i_2_n_0 ;
  wire \control_flit[13]_i_1_n_0 ;
  wire \control_flit[14]_i_1_n_0 ;
  wire \control_flit[15]_i_1_n_0 ;
  wire \control_flit[15]_i_2_n_0 ;
  wire \control_flit[16]_i_1_n_0 ;
  wire \control_flit[17]_i_1_n_0 ;
  wire \control_flit[18]_i_1_n_0 ;
  wire \control_flit[19]_i_1_n_0 ;
  wire \control_flit[1]_i_1_n_0 ;
  wire \control_flit[20]_i_1_n_0 ;
  wire \control_flit[21]_i_1_n_0 ;
  wire \control_flit[22]_i_1_n_0 ;
  wire \control_flit[23]_i_1_n_0 ;
  wire \control_flit[24]_i_1_n_0 ;
  wire \control_flit[25]_i_1_n_0 ;
  wire \control_flit[26]_i_1_n_0 ;
  wire \control_flit[27]_i_1_n_0 ;
  wire \control_flit[28]_i_1_n_0 ;
  wire \control_flit[29]_i_1_n_0 ;
  wire \control_flit[2]_i_1_n_0 ;
  wire \control_flit[30]_i_1_n_0 ;
  wire \control_flit[31]_i_1_n_0 ;
  wire \control_flit[31]_i_2_n_0 ;
  wire \control_flit[31]_i_3_n_0 ;
  wire \control_flit[3]_i_1_n_0 ;
  wire \control_flit[4]_i_1_n_0 ;
  wire \control_flit[5]_i_1_n_0 ;
  wire \control_flit[6]_i_1_n_0 ;
  wire \control_flit[7]_i_1_n_0 ;
  wire \control_flit[8]_i_1_n_0 ;
  wire \control_flit[9]_i_1_n_0 ;
  (* RTL_KEEP = "true" *) wire [3:0]ctl_cmd;
  (* RTL_KEEP = "true" *) wire [15:0]dat_leng;
  wire f2u_wr_ready;
  wire f2u_wr_valid;
  (* RTL_KEEP = "true" *) wire [1:0]fifo_sel;
  wire \fifo_sel[0]_i_1_n_0 ;
  wire \fifo_sel[0]_i_2_n_0 ;
  wire \fifo_sel[0]_i_3_n_0 ;
  wire \fifo_sel[0]_i_4_n_0 ;
  wire \fifo_sel[0]_i_5_n_0 ;
  wire \fifo_sel[0]_i_6_n_0 ;
  wire \fifo_sel[1]_i_1_n_0 ;
  wire \fifo_sel[1]_i_2_n_0 ;
  wire \fifo_sel[1]_i_3_n_0 ;
  wire \fifo_sel[1]_i_4_n_0 ;
  wire g0_b0__0_n_0;
  wire g0_b0__1_n_0;
  wire g0_b0_n_0;
  (* RTL_KEEP = "true" *) wire [1:0]mask;
  wire \mask[0]_i_1_n_0 ;
  wire \mask[1]_i_1_n_0 ;
  wire [4:0]p_0_in__0;
  (* RTL_KEEP = "true" *) wire [15:0]pushed;
  wire [31:0]rd_dout;
  (* RTL_KEEP = "true" *) wire reg_clk;
  wire reg_clk_i_1_n_0;
  wire [15:0]remain;
  wire remain_carry__0_i_1_n_0;
  wire remain_carry__0_i_2_n_0;
  wire remain_carry__0_i_3_n_0;
  wire remain_carry__0_i_4_n_0;
  wire remain_carry__0_n_0;
  wire remain_carry__0_n_1;
  wire remain_carry__0_n_2;
  wire remain_carry__0_n_3;
  wire remain_carry__1_i_1_n_0;
  wire remain_carry__1_i_2_n_0;
  wire remain_carry__1_i_3_n_0;
  wire remain_carry__1_i_4_n_0;
  wire remain_carry__1_n_0;
  wire remain_carry__1_n_1;
  wire remain_carry__1_n_2;
  wire remain_carry__1_n_3;
  wire remain_carry__2_i_1_n_0;
  wire remain_carry__2_i_2_n_0;
  wire remain_carry__2_i_3_n_0;
  wire remain_carry__2_i_4_n_0;
  wire remain_carry__2_n_1;
  wire remain_carry__2_n_2;
  wire remain_carry__2_n_3;
  wire remain_carry_i_1_n_0;
  wire remain_carry_i_2_n_0;
  wire remain_carry_i_3_n_0;
  wire remain_carry_i_4_n_0;
  wire remain_carry_n_0;
  wire remain_carry_n_1;
  wire remain_carry_n_2;
  wire remain_carry_n_3;
  (* RTL_KEEP = "true" *) wire [1:0]sl_ad_reg;
  wire \sl_ad_reg[0]_i_1_n_0 ;
  wire \sl_ad_reg[1]_i_1_n_0 ;
  wire \sl_ad_reg[1]_i_2_n_0 ;
  wire \sl_ad_reg[1]_i_3_n_0 ;
  (* RTL_KEEP = "true" *) wire [1:0]sl_mode_reg;
  wire \sl_mode_reg[1]_i_1_n_0 ;
  (* RTL_KEEP = "true" *) wire sl_oe_n_reg;
  wire sl_oe_n_reg_i_3_n_0;
  wire sl_oe_n_reg_i_4_n_0;
  wire sl_oe_n_reg_i_5_n_0;
  (* RTL_KEEP = "true" *) wire sl_pktend_n_reg;
  wire sl_pktend_n_reg_i_5_n_0;
  wire sl_pktend_n_reg_i_7_n_0;
  wire sl_pktend_n_reg_i_8_n_0;
  (* RTL_KEEP = "true" *) wire sl_rd_n_reg;
  wire sl_rd_n_reg_i_5_n_0;
  (* RTL_KEEP = "true" *) wire sl_wr_n_reg;
  wire sl_wr_n_reg_i_5_n_0;
  (* RTL_KEEP = "true" *) wire [4:0]state;
  wire \state[0]_i_10_n_0 ;
  wire \state[0]_i_11_n_0 ;
  wire \state[0]_i_16_n_0 ;
  wire \state[0]_i_3_n_0 ;
  wire \state[0]_i_6_n_0 ;
  wire \state[0]_i_8_n_0 ;
  wire \state[0]_i_9_n_0 ;
  wire \state[1]_i_10_n_0 ;
  wire \state[1]_i_11_n_0 ;
  wire \state[1]_i_12_n_0 ;
  wire \state[1]_i_13_n_0 ;
  wire \state[1]_i_14_n_0 ;
  wire \state[1]_i_16_n_0 ;
  wire \state[1]_i_17_n_0 ;
  wire \state[1]_i_8_n_0 ;
  wire \state[1]_i_9_n_0 ;
  wire \state[2]_i_11_n_0 ;
  wire \state[2]_i_12_n_0 ;
  wire \state[2]_i_13_n_0 ;
  wire \state[2]_i_2_n_0 ;
  wire \state[2]_i_6_n_0 ;
  wire \state[2]_i_7_n_0 ;
  wire \state[2]_i_8_n_0 ;
  wire \state[2]_i_9_n_0 ;
  wire \state[3]_i_10_n_0 ;
  wire \state[3]_i_11_n_0 ;
  wire \state[3]_i_12_n_0 ;
  wire \state[3]_i_13_n_0 ;
  wire \state[3]_i_14_n_0 ;
  wire \state[3]_i_15_n_0 ;
  wire \state[3]_i_16_n_0 ;
  wire \state[3]_i_17_n_0 ;
  wire \state[3]_i_19_n_0 ;
  wire \state[3]_i_20_n_0 ;
  wire \state[3]_i_22_n_0 ;
  wire \state[3]_i_24_n_0 ;
  wire \state[3]_i_5_n_0 ;
  wire \state[3]_i_8_n_0 ;
  wire \state[3]_i_9_n_0 ;
  wire \state[4]_i_10_n_0 ;
  wire \state[4]_i_11_n_0 ;
  wire \state[4]_i_13_n_0 ;
  wire \state[4]_i_14_n_0 ;
  wire \state[4]_i_15_n_0 ;
  wire \state[4]_i_16_n_0 ;
  wire \state[4]_i_18_n_0 ;
  wire \state[4]_i_19_n_0 ;
  wire \state[4]_i_4_n_0 ;
  wire \state[4]_i_5_n_0 ;
  wire \state[4]_i_9_n_0 ;
  wire \timeout[2]_i_2_n_0 ;
  wire [2:0]timeout_reg_n_0_;
  (* RTL_KEEP = "true" *) wire [3:0]transactor_sel;
  wire [31:0]u2f_rd_data;
  wire u2f_rd_ready;
  wire u2f_rd_valid;
  wire [31:0]u2f_wr_data;
  wire \u2f_wr_data[31]_i_1_n_0 ;
  (* RTL_KEEP = "true" *) wire u2f_wr_full;
  wire u2f_wr_fullN;
  wire u2f_wr_valid;
  wire u2f_wr_valid_i_1_n_0;
  wire u_cu2f_n_36;
  wire u_cu2f_n_37;
  wire u_cu2f_n_38;
  wire u_cu2f_n_39;
  wire u_df2u_n_1;
  wire u_df2u_n_10;
  wire u_df2u_n_11;
  wire u_df2u_n_12;
  wire u_df2u_n_13;
  wire u_df2u_n_14;
  wire u_df2u_n_15;
  wire u_df2u_n_16;
  wire u_df2u_n_17;
  wire u_df2u_n_18;
  wire u_df2u_n_19;
  wire u_df2u_n_2;
  wire u_df2u_n_20;
  wire u_df2u_n_21;
  wire u_df2u_n_22;
  wire u_df2u_n_23;
  wire u_df2u_n_24;
  wire u_df2u_n_25;
  wire u_df2u_n_26;
  wire u_df2u_n_27;
  wire u_df2u_n_28;
  wire u_df2u_n_29;
  wire u_df2u_n_3;
  wire u_df2u_n_30;
  wire u_df2u_n_31;
  wire u_df2u_n_32;
  wire u_df2u_n_33;
  wire u_df2u_n_34;
  wire u_df2u_n_35;
  wire u_df2u_n_36;
  wire u_df2u_n_37;
  wire u_df2u_n_38;
  wire u_df2u_n_39;
  wire u_df2u_n_4;
  wire u_df2u_n_40;
  wire u_df2u_n_41;
  wire u_df2u_n_42;
  wire u_df2u_n_43;
  wire u_df2u_n_44;
  wire u_df2u_n_5;
  wire u_df2u_n_6;
  wire u_df2u_n_7;
  wire u_df2u_n_8;
  wire u_df2u_n_9;
  wire u_du2f_n_35;
  wire u_du2f_n_37;
  wire u_du2f_n_38;
  wire u_du2f_n_39;
  wire u_du2f_n_40;
  wire u_du2f_n_41;
  wire u_du2f_n_42;
  wire u_du2f_n_43;
  wire u_du2f_n_44;
  wire u_du2f_n_45;
  wire u_du2f_n_46;
  wire u_du2f_n_47;
  wire u_du2f_n_48;
  wire u_du2f_n_49;
  wire u_du2f_n_50;
  wire u_du2f_n_51;
  wire u_du2f_n_52;
  wire u_du2f_n_53;
  wire u_du2f_n_54;
  wire u_du2f_n_55;
  wire u_du2f_n_56;
  (* RTL_KEEP = "true" *) wire [15:0]written;
  wire \written[0]_i_1_n_0 ;
  wire \written[10]_i_1_n_0 ;
  wire \written[11]_i_1_n_0 ;
  wire \written[12]_i_1_n_0 ;
  wire \written[13]_i_1_n_0 ;
  wire \written[14]_i_1_n_0 ;
  wire \written[15]_i_1_n_0 ;
  wire \written[15]_i_3_n_0 ;
  wire \written[1]_i_1_n_0 ;
  wire \written[2]_i_1_n_0 ;
  wire \written[3]_i_1_n_0 ;
  wire \written[3]_i_3_n_0 ;
  wire \written[4]_i_1_n_0 ;
  wire \written[5]_i_1_n_0 ;
  wire \written[6]_i_1_n_0 ;
  wire \written[7]_i_1_n_0 ;
  wire \written[8]_i_1_n_0 ;
  wire \written[9]_i_1_n_0 ;
  wire \written_reg[11]_i_2_n_0 ;
  wire \written_reg[11]_i_2_n_1 ;
  wire \written_reg[11]_i_2_n_2 ;
  wire \written_reg[11]_i_2_n_3 ;
  wire \written_reg[11]_i_2_n_4 ;
  wire \written_reg[11]_i_2_n_5 ;
  wire \written_reg[11]_i_2_n_6 ;
  wire \written_reg[11]_i_2_n_7 ;
  wire \written_reg[15]_i_2_n_1 ;
  wire \written_reg[15]_i_2_n_2 ;
  wire \written_reg[15]_i_2_n_3 ;
  wire \written_reg[15]_i_2_n_4 ;
  wire \written_reg[15]_i_2_n_5 ;
  wire \written_reg[15]_i_2_n_6 ;
  wire \written_reg[15]_i_2_n_7 ;
  wire \written_reg[3]_i_2_n_0 ;
  wire \written_reg[3]_i_2_n_1 ;
  wire \written_reg[3]_i_2_n_2 ;
  wire \written_reg[3]_i_2_n_3 ;
  wire \written_reg[3]_i_2_n_4 ;
  wire \written_reg[3]_i_2_n_5 ;
  wire \written_reg[3]_i_2_n_6 ;
  wire \written_reg[3]_i_2_n_7 ;
  wire \written_reg[7]_i_2_n_0 ;
  wire \written_reg[7]_i_2_n_1 ;
  wire \written_reg[7]_i_2_n_2 ;
  wire \written_reg[7]_i_2_n_3 ;
  wire \written_reg[7]_i_2_n_4 ;
  wire \written_reg[7]_i_2_n_5 ;
  wire \written_reg[7]_i_2_n_6 ;
  wire \written_reg[7]_i_2_n_7 ;
  wire \NLW_BLK_ZYNQ.u_sl_pclk_R_UNCONNECTED ;
  wire \NLW_BLK_ZYNQ.u_sl_pclk_S_UNCONNECTED ;
  wire [3:2]\NLW_cnt_reg[15]_i_10_CO_UNCONNECTED ;
  wire [3:3]\NLW_cnt_reg[15]_i_10_O_UNCONNECTED ;
  wire [3:3]NLW_remain_carry__2_CO_UNCONNECTED;
  wire [3:3]NLW_u_cu2f_state_reg_UNCONNECTED;
  wire [24:10]NLW_u_df2u_SL_DT_O_reg_UNCONNECTED;
  wire [3:3]\NLW_written_reg[15]_i_2_CO_UNCONNECTED ;

  assign SL_EMPTY_N = SL_FLAGA;
  assign SL_FULL_N = SL_FLAGC;
  assign SL_PRE_EMPTY_N = SL_FLAGB;
  assign SL_PRE_FULL_N = SL_FLAGD;
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "TRUE" *) 
  ODDR #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    \BLK_ZYNQ.u_sl_pclk 
       (.C(SYS_CLK),
        .CE(1'b1),
        .D1(1'b0),
        .D2(1'b1),
        .Q(SL_PCLK),
        .R(\NLW_BLK_ZYNQ.u_sl_pclk_R_UNCONNECTED ),
        .S(\NLW_BLK_ZYNQ.u_sl_pclk_S_UNCONNECTED ));
  LUT4 #(
    .INIT(16'h0002)) 
    \SL_AD[1]_i_1 
       (.I0(\SL_AD[1]_i_3_n_0 ),
        .I1(state[4]),
        .I2(state[0]),
        .I3(state[1]),
        .O(\SL_AD[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \SL_AD[1]_i_2 
       (.I0(SYS_CLK_STABLE),
        .I1(SL_RST_N),
        .O(\SL_AD[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8B888888BB888888)) 
    \SL_AD[1]_i_3 
       (.I0(\sl_ad_reg[1]_i_3_n_0 ),
        .I1(state[2]),
        .I2(mask[0]),
        .I3(mask[1]),
        .I4(sl_mode_reg[1]),
        .I5(sl_mode_reg[0]),
        .O(\SL_AD[1]_i_3_n_0 ));
  (* IOB = "TRUE" *) 
  FDCE #(
    .INIT(1'b0)) 
    \SL_AD_reg[1] 
       (.C(SYS_CLK),
        .CE(g0_b0_n_0),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\SL_AD[1]_i_1_n_0 ),
        .Q(SL_AD));
  LUT2 #(
    .INIT(4'h7)) 
    \SL_DT_O[25]_i_2 
       (.I0(timeout_reg_n_0_[1]),
        .I1(timeout_reg_n_0_[2]),
        .O(\SL_DT_O[25]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \SL_DT_O[25]_i_3 
       (.I0(\SL_DT_O[9]_i_2_n_0 ),
        .I1(cnt_reg_n_0_[0]),
        .I2(cnt_reg_n_0_[1]),
        .I3(SL_PKTEND_N_i_4_n_0),
        .O(\SL_DT_O[25]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \SL_DT_O[26]_i_2 
       (.I0(written[12]),
        .I1(written[13]),
        .I2(written[10]),
        .I3(written[11]),
        .I4(written[15]),
        .I5(written[14]),
        .O(\SL_DT_O[26]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \SL_DT_O[26]_i_3 
       (.I0(written[2]),
        .I1(written[3]),
        .I2(written[0]),
        .I3(written[1]),
        .I4(\SL_DT_O[26]_i_4_n_0 ),
        .O(\SL_DT_O[26]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \SL_DT_O[26]_i_4 
       (.I0(written[6]),
        .I1(written[7]),
        .I2(written[4]),
        .I3(written[5]),
        .I4(written[9]),
        .I5(written[8]),
        .O(\SL_DT_O[26]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \SL_DT_O[28]_i_2 
       (.I0(\SL_DT_O[9]_i_2_n_0 ),
        .I1(cnt_reg_n_0_[0]),
        .I2(cnt_reg_n_0_[1]),
        .I3(SL_PKTEND_N_i_4_n_0),
        .O(\SL_DT_O[28]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \SL_DT_O[29]_i_2 
       (.I0(state[3]),
        .I1(state[2]),
        .O(\SL_DT_O[29]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \SL_DT_O[29]_i_3 
       (.I0(pushed[12]),
        .I1(pushed[13]),
        .I2(pushed[10]),
        .I3(pushed[11]),
        .I4(pushed[15]),
        .I5(pushed[14]),
        .O(\SL_DT_O[29]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \SL_DT_O[29]_i_4 
       (.I0(pushed[2]),
        .I1(pushed[3]),
        .I2(pushed[0]),
        .I3(pushed[1]),
        .I4(\SL_DT_O[29]_i_6_n_0 ),
        .O(\SL_DT_O[29]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \SL_DT_O[29]_i_5 
       (.I0(SL_PKTEND_N_i_4_n_0),
        .I1(cnt_reg_n_0_[1]),
        .I2(\SL_DT_O[9]_i_2_n_0 ),
        .O(\SL_DT_O[29]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \SL_DT_O[29]_i_6 
       (.I0(pushed[6]),
        .I1(pushed[7]),
        .I2(pushed[4]),
        .I3(pushed[5]),
        .I4(pushed[9]),
        .I5(pushed[8]),
        .O(\SL_DT_O[29]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0000000100000000)) 
    \SL_DT_O[9]_i_2 
       (.I0(control_flit[0]),
        .I1(control_flit[1]),
        .I2(control_flit[2]),
        .I3(control_flit[3]),
        .I4(\SL_DT_O[29]_i_2_n_0 ),
        .I5(SL_FULL_N),
        .O(\SL_DT_O[9]_i_2_n_0 ));
  (* IOB = "TRUE" *) 
  FDCE #(
    .INIT(1'b0)) 
    \SL_DT_O_reg[0] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_41),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_32),
        .Q(SL_DT_O[0]));
  (* IOB = "TRUE" *) 
  FDCE #(
    .INIT(1'b0)) 
    \SL_DT_O_reg[10] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_41),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_22),
        .Q(SL_DT_O[10]));
  (* IOB = "TRUE" *) 
  FDCE #(
    .INIT(1'b0)) 
    \SL_DT_O_reg[11] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_41),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_21),
        .Q(SL_DT_O[11]));
  (* IOB = "TRUE" *) 
  FDCE #(
    .INIT(1'b0)) 
    \SL_DT_O_reg[12] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_41),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_20),
        .Q(SL_DT_O[12]));
  (* IOB = "TRUE" *) 
  FDCE #(
    .INIT(1'b0)) 
    \SL_DT_O_reg[13] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_41),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_19),
        .Q(SL_DT_O[13]));
  (* IOB = "TRUE" *) 
  FDCE #(
    .INIT(1'b0)) 
    \SL_DT_O_reg[14] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_41),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_18),
        .Q(SL_DT_O[14]));
  (* IOB = "TRUE" *) 
  FDCE #(
    .INIT(1'b0)) 
    \SL_DT_O_reg[15] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_41),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_17),
        .Q(SL_DT_O[15]));
  (* IOB = "TRUE" *) 
  FDCE #(
    .INIT(1'b0)) 
    \SL_DT_O_reg[16] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_41),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_16),
        .Q(SL_DT_O[16]));
  (* IOB = "TRUE" *) 
  FDCE #(
    .INIT(1'b0)) 
    \SL_DT_O_reg[17] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_41),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_15),
        .Q(SL_DT_O[17]));
  (* IOB = "TRUE" *) 
  FDCE #(
    .INIT(1'b0)) 
    \SL_DT_O_reg[18] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_41),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_14),
        .Q(SL_DT_O[18]));
  (* IOB = "TRUE" *) 
  FDCE #(
    .INIT(1'b0)) 
    \SL_DT_O_reg[19] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_41),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_13),
        .Q(SL_DT_O[19]));
  (* IOB = "TRUE" *) 
  FDCE #(
    .INIT(1'b0)) 
    \SL_DT_O_reg[1] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_41),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_31),
        .Q(SL_DT_O[1]));
  (* IOB = "TRUE" *) 
  FDCE #(
    .INIT(1'b0)) 
    \SL_DT_O_reg[20] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_41),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_12),
        .Q(SL_DT_O[20]));
  (* IOB = "TRUE" *) 
  FDCE #(
    .INIT(1'b0)) 
    \SL_DT_O_reg[21] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_41),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_11),
        .Q(SL_DT_O[21]));
  (* IOB = "TRUE" *) 
  FDCE #(
    .INIT(1'b0)) 
    \SL_DT_O_reg[22] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_41),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_10),
        .Q(SL_DT_O[22]));
  (* IOB = "TRUE" *) 
  FDCE #(
    .INIT(1'b0)) 
    \SL_DT_O_reg[23] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_41),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_9),
        .Q(SL_DT_O[23]));
  (* IOB = "TRUE" *) 
  FDCE #(
    .INIT(1'b0)) 
    \SL_DT_O_reg[24] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_41),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_8),
        .Q(SL_DT_O[24]));
  (* IOB = "TRUE" *) 
  FDCE #(
    .INIT(1'b0)) 
    \SL_DT_O_reg[25] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_41),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_7),
        .Q(SL_DT_O[25]));
  (* IOB = "TRUE" *) 
  FDCE #(
    .INIT(1'b0)) 
    \SL_DT_O_reg[26] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_41),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_6),
        .Q(SL_DT_O[26]));
  (* IOB = "TRUE" *) 
  FDCE #(
    .INIT(1'b0)) 
    \SL_DT_O_reg[27] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_41),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_5),
        .Q(SL_DT_O[27]));
  (* IOB = "TRUE" *) 
  FDCE #(
    .INIT(1'b0)) 
    \SL_DT_O_reg[28] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_41),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_4),
        .Q(SL_DT_O[28]));
  (* IOB = "TRUE" *) 
  FDCE #(
    .INIT(1'b0)) 
    \SL_DT_O_reg[29] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_41),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_3),
        .Q(SL_DT_O[29]));
  (* IOB = "TRUE" *) 
  FDCE #(
    .INIT(1'b0)) 
    \SL_DT_O_reg[2] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_41),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_30),
        .Q(SL_DT_O[2]));
  (* IOB = "TRUE" *) 
  FDCE #(
    .INIT(1'b0)) 
    \SL_DT_O_reg[30] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_41),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_2),
        .Q(SL_DT_O[30]));
  (* IOB = "TRUE" *) 
  FDCE #(
    .INIT(1'b0)) 
    \SL_DT_O_reg[31] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_41),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_1),
        .Q(SL_DT_O[31]));
  (* IOB = "TRUE" *) 
  FDCE #(
    .INIT(1'b0)) 
    \SL_DT_O_reg[3] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_41),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_29),
        .Q(SL_DT_O[3]));
  (* IOB = "TRUE" *) 
  FDCE #(
    .INIT(1'b0)) 
    \SL_DT_O_reg[4] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_41),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_28),
        .Q(SL_DT_O[4]));
  (* IOB = "TRUE" *) 
  FDCE #(
    .INIT(1'b0)) 
    \SL_DT_O_reg[5] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_41),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_27),
        .Q(SL_DT_O[5]));
  (* IOB = "TRUE" *) 
  FDCE #(
    .INIT(1'b0)) 
    \SL_DT_O_reg[6] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_41),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_26),
        .Q(SL_DT_O[6]));
  (* IOB = "TRUE" *) 
  FDCE #(
    .INIT(1'b0)) 
    \SL_DT_O_reg[7] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_41),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_25),
        .Q(SL_DT_O[7]));
  (* IOB = "TRUE" *) 
  FDCE #(
    .INIT(1'b0)) 
    \SL_DT_O_reg[8] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_41),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_24),
        .Q(SL_DT_O[8]));
  (* IOB = "TRUE" *) 
  FDCE #(
    .INIT(1'b0)) 
    \SL_DT_O_reg[9] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_41),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_23),
        .Q(SL_DT_O[9]));
  LUT6 #(
    .INIT(64'hFFEAFFFFFFEA0000)) 
    SL_DT_T_i_1
       (.I0(state[4]),
        .I1(ctl_cmd[1]),
        .I2(state[2]),
        .I3(SL_DT_T_i_2_n_0),
        .I4(SL_DT_T_i_3_n_0),
        .I5(SL_DT_T),
        .O(SL_DT_T_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFF8808BB3B)) 
    SL_DT_T_i_2
       (.I0(ctl_cmd[2]),
        .I1(state[2]),
        .I2(ctl_cmd[0]),
        .I3(SL_DT_T_i_4_n_0),
        .I4(\control_flit[15]_i_2_n_0 ),
        .I5(SL_DT_T_i_5_n_0),
        .O(SL_DT_T_i_2_n_0));
  LUT5 #(
    .INIT(32'hCCCC880B)) 
    SL_DT_T_i_3
       (.I0(state[2]),
        .I1(state[4]),
        .I2(state[0]),
        .I3(state[1]),
        .I4(state[3]),
        .O(SL_DT_T_i_3_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    SL_DT_T_i_4
       (.I0(ctl_cmd[3]),
        .I1(SL_OE_N_i_4_n_0),
        .O(SL_DT_T_i_4_n_0));
  LUT6 #(
    .INIT(64'h00007777F0FF7777)) 
    SL_DT_T_i_5
       (.I0(sl_mode_reg[1]),
        .I1(mask[1]),
        .I2(ctl_cmd[0]),
        .I3(ctl_cmd[3]),
        .I4(state[2]),
        .I5(ctl_cmd[2]),
        .O(SL_DT_T_i_5_n_0));
  FDPE #(
    .INIT(1'b1)) 
    SL_DT_T_reg
       (.C(SYS_CLK),
        .CE(1'b1),
        .D(SL_DT_T_i_1_n_0),
        .PRE(\SL_AD[1]_i_2_n_0 ),
        .Q(SL_DT_T));
  LUT5 #(
    .INIT(32'hFFFFEBFF)) 
    SL_OE_N_i_3
       (.I0(ctl_cmd[0]),
        .I1(ctl_cmd[1]),
        .I2(ctl_cmd[2]),
        .I3(SL_OE_N_i_4_n_0),
        .I4(ctl_cmd[3]),
        .O(SL_OE_N_i_3_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    SL_OE_N_i_4
       (.I0(SL_OE_N_i_5_n_0),
        .I1(dat_leng[1]),
        .I2(dat_leng[0]),
        .I3(dat_leng[3]),
        .I4(dat_leng[2]),
        .I5(SL_OE_N_i_6_n_0),
        .O(SL_OE_N_i_4_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    SL_OE_N_i_5
       (.I0(dat_leng[5]),
        .I1(dat_leng[4]),
        .I2(dat_leng[7]),
        .I3(dat_leng[6]),
        .O(SL_OE_N_i_5_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    SL_OE_N_i_6
       (.I0(dat_leng[10]),
        .I1(dat_leng[11]),
        .I2(dat_leng[8]),
        .I3(dat_leng[9]),
        .I4(SL_OE_N_i_7_n_0),
        .O(SL_OE_N_i_6_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    SL_OE_N_i_7
       (.I0(dat_leng[13]),
        .I1(dat_leng[12]),
        .I2(dat_leng[15]),
        .I3(dat_leng[14]),
        .O(SL_OE_N_i_7_n_0));
  (* IOB = "TRUE" *) 
  (* xc_pullup = "1" *) 
  FDPE #(
    .INIT(1'b1)) 
    SL_OE_N_reg
       (.C(SYS_CLK),
        .CE(g0_b0__1_n_0),
        .D(u_cu2f_n_39),
        .PRE(\SL_AD[1]_i_2_n_0 ),
        .Q(SL_OE_N));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    SL_PKTEND_N_i_4
       (.I0(SL_PKTEND_N_i_6_n_0),
        .I1(cnt_reg_n_0_[5]),
        .I2(cnt_reg_n_0_[4]),
        .I3(cnt_reg_n_0_[7]),
        .I4(cnt_reg_n_0_[6]),
        .I5(SL_PKTEND_N_i_7_n_0),
        .O(SL_PKTEND_N_i_4_n_0));
  LUT6 #(
    .INIT(64'h4444554444045544)) 
    SL_PKTEND_N_i_5
       (.I0(state[3]),
        .I1(state[2]),
        .I2(SL_FULL_N),
        .I3(state[1]),
        .I4(state[0]),
        .I5(SL_WR_N_i_7_n_0),
        .O(SL_PKTEND_N_i_5_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    SL_PKTEND_N_i_6
       (.I0(cnt_reg_n_0_[9]),
        .I1(cnt_reg_n_0_[8]),
        .I2(cnt_reg_n_0_[11]),
        .I3(cnt_reg_n_0_[10]),
        .O(SL_PKTEND_N_i_6_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    SL_PKTEND_N_i_7
       (.I0(cnt_reg_n_0_[14]),
        .I1(cnt_reg_n_0_[15]),
        .I2(cnt_reg_n_0_[12]),
        .I3(cnt_reg_n_0_[13]),
        .I4(cnt_reg_n_0_[3]),
        .I5(cnt_reg_n_0_[2]),
        .O(SL_PKTEND_N_i_7_n_0));
  (* IOB = "TRUE" *) 
  (* xc_pullup = "1" *) 
  FDPE #(
    .INIT(1'b1)) 
    SL_PKTEND_N_reg
       (.C(SYS_CLK),
        .CE(u_df2u_n_39),
        .D(u_df2u_n_43),
        .PRE(\SL_AD[1]_i_2_n_0 ),
        .Q(SL_PKTEND_N));
  LUT6 #(
    .INIT(64'hFFFFFFFF00000004)) 
    SL_RD_N0_i_1
       (.I0(state[1]),
        .I1(state[0]),
        .I2(state[3]),
        .I3(state[2]),
        .I4(state[4]),
        .I5(sl_rd_n_reg),
        .O(SL_RD_N00));
  FDPE #(
    .INIT(1'b1)) 
    SL_RD_N0_reg
       (.C(SYS_CLK),
        .CE(1'b1),
        .D(SL_RD_N00),
        .PRE(\SL_AD[1]_i_2_n_0 ),
        .Q(SL_RD_N0_reg_n_0));
  FDPE #(
    .INIT(1'b1)) 
    SL_RD_N1_reg
       (.C(SYS_CLK),
        .CE(1'b1),
        .D(SL_RD_N0_reg_n_0),
        .PRE(\SL_AD[1]_i_2_n_0 ),
        .Q(SL_RD_N1));
  LUT2 #(
    .INIT(4'hE)) 
    SL_RD_N_i_2
       (.I0(state[3]),
        .I1(state[4]),
        .O(SL_RD_N_i_2_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    SL_RD_N_i_4
       (.I0(sl_mode_reg[0]),
        .I1(sl_mode_reg[1]),
        .O(SL_RD_N_i_4_n_0));
  (* IOB = "TRUE" *) 
  (* xc_pullup = "1" *) 
  FDPE #(
    .INIT(1'b1)) 
    SL_RD_N_reg
       (.C(SYS_CLK),
        .CE(g0_b0__0_n_0),
        .D(u_du2f_n_56),
        .PRE(\SL_AD[1]_i_2_n_0 ),
        .Q(SL_RD_N));
  LUT4 #(
    .INIT(16'hFFFE)) 
    SL_WR_N_i_10
       (.I0(remain[13]),
        .I1(remain[12]),
        .I2(remain[15]),
        .I3(remain[14]),
        .O(SL_WR_N_i_10_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    SL_WR_N_i_11
       (.I0(remain[1]),
        .I1(remain[0]),
        .I2(remain[3]),
        .I3(remain[2]),
        .O(SL_WR_N_i_11_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    SL_WR_N_i_12
       (.I0(remain[5]),
        .I1(remain[4]),
        .I2(remain[7]),
        .I3(remain[6]),
        .O(SL_WR_N_i_12_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    SL_WR_N_i_4
       (.I0(state[3]),
        .I1(state[2]),
        .I2(state[4]),
        .I3(state[0]),
        .I4(state[1]),
        .O(SL_WR_N_i_4_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    SL_WR_N_i_7
       (.I0(SL_WR_N_i_9_n_0),
        .I1(SL_WR_N_i_10_n_0),
        .I2(SL_WR_N_i_11_n_0),
        .I3(SL_WR_N_i_12_n_0),
        .O(SL_WR_N_i_7_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    SL_WR_N_i_9
       (.I0(remain[9]),
        .I1(remain[8]),
        .I2(remain[11]),
        .I3(remain[10]),
        .O(SL_WR_N_i_9_n_0));
  (* IOB = "TRUE" *) 
  (* xc_pullup = "1" *) 
  FDPE #(
    .INIT(1'b1)) 
    SL_WR_N_reg
       (.C(SYS_CLK),
        .CE(u_df2u_n_40),
        .D(u_df2u_n_44),
        .PRE(\SL_AD[1]_i_2_n_0 ),
        .Q(SL_WR_N));
  LUT2 #(
    .INIT(4'h1)) 
    \cmd_wr_data[31]_i_1 
       (.I0(fifo_sel[0]),
        .I1(fifo_sel[1]),
        .O(\cmd_wr_data[31]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \cmd_wr_data_reg[0] 
       (.C(SYS_CLK),
        .CE(\cmd_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[0]),
        .Q(cmd_wr_data[0]));
  FDCE #(
    .INIT(1'b0)) 
    \cmd_wr_data_reg[10] 
       (.C(SYS_CLK),
        .CE(\cmd_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[10]),
        .Q(cmd_wr_data[10]));
  FDCE #(
    .INIT(1'b0)) 
    \cmd_wr_data_reg[11] 
       (.C(SYS_CLK),
        .CE(\cmd_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[11]),
        .Q(cmd_wr_data[11]));
  FDCE #(
    .INIT(1'b0)) 
    \cmd_wr_data_reg[12] 
       (.C(SYS_CLK),
        .CE(\cmd_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[12]),
        .Q(cmd_wr_data[12]));
  FDCE #(
    .INIT(1'b0)) 
    \cmd_wr_data_reg[13] 
       (.C(SYS_CLK),
        .CE(\cmd_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[13]),
        .Q(cmd_wr_data[13]));
  FDCE #(
    .INIT(1'b0)) 
    \cmd_wr_data_reg[14] 
       (.C(SYS_CLK),
        .CE(\cmd_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[14]),
        .Q(cmd_wr_data[14]));
  FDCE #(
    .INIT(1'b0)) 
    \cmd_wr_data_reg[15] 
       (.C(SYS_CLK),
        .CE(\cmd_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[15]),
        .Q(cmd_wr_data[15]));
  FDCE #(
    .INIT(1'b0)) 
    \cmd_wr_data_reg[16] 
       (.C(SYS_CLK),
        .CE(\cmd_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[16]),
        .Q(cmd_wr_data[16]));
  FDCE #(
    .INIT(1'b0)) 
    \cmd_wr_data_reg[17] 
       (.C(SYS_CLK),
        .CE(\cmd_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[17]),
        .Q(cmd_wr_data[17]));
  FDCE #(
    .INIT(1'b0)) 
    \cmd_wr_data_reg[18] 
       (.C(SYS_CLK),
        .CE(\cmd_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[18]),
        .Q(cmd_wr_data[18]));
  FDCE #(
    .INIT(1'b0)) 
    \cmd_wr_data_reg[19] 
       (.C(SYS_CLK),
        .CE(\cmd_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[19]),
        .Q(cmd_wr_data[19]));
  FDCE #(
    .INIT(1'b0)) 
    \cmd_wr_data_reg[1] 
       (.C(SYS_CLK),
        .CE(\cmd_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[1]),
        .Q(cmd_wr_data[1]));
  FDCE #(
    .INIT(1'b0)) 
    \cmd_wr_data_reg[20] 
       (.C(SYS_CLK),
        .CE(\cmd_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[20]),
        .Q(cmd_wr_data[20]));
  FDCE #(
    .INIT(1'b0)) 
    \cmd_wr_data_reg[21] 
       (.C(SYS_CLK),
        .CE(\cmd_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[21]),
        .Q(cmd_wr_data[21]));
  FDCE #(
    .INIT(1'b0)) 
    \cmd_wr_data_reg[22] 
       (.C(SYS_CLK),
        .CE(\cmd_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[22]),
        .Q(cmd_wr_data[22]));
  FDCE #(
    .INIT(1'b0)) 
    \cmd_wr_data_reg[23] 
       (.C(SYS_CLK),
        .CE(\cmd_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[23]),
        .Q(cmd_wr_data[23]));
  FDCE #(
    .INIT(1'b0)) 
    \cmd_wr_data_reg[24] 
       (.C(SYS_CLK),
        .CE(\cmd_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[24]),
        .Q(cmd_wr_data[24]));
  FDCE #(
    .INIT(1'b0)) 
    \cmd_wr_data_reg[25] 
       (.C(SYS_CLK),
        .CE(\cmd_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[25]),
        .Q(cmd_wr_data[25]));
  FDCE #(
    .INIT(1'b0)) 
    \cmd_wr_data_reg[26] 
       (.C(SYS_CLK),
        .CE(\cmd_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[26]),
        .Q(cmd_wr_data[26]));
  FDCE #(
    .INIT(1'b0)) 
    \cmd_wr_data_reg[27] 
       (.C(SYS_CLK),
        .CE(\cmd_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[27]),
        .Q(cmd_wr_data[27]));
  FDCE #(
    .INIT(1'b0)) 
    \cmd_wr_data_reg[28] 
       (.C(SYS_CLK),
        .CE(\cmd_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[28]),
        .Q(cmd_wr_data[28]));
  FDCE #(
    .INIT(1'b0)) 
    \cmd_wr_data_reg[29] 
       (.C(SYS_CLK),
        .CE(\cmd_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[29]),
        .Q(cmd_wr_data[29]));
  FDCE #(
    .INIT(1'b0)) 
    \cmd_wr_data_reg[2] 
       (.C(SYS_CLK),
        .CE(\cmd_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[2]),
        .Q(cmd_wr_data[2]));
  FDCE #(
    .INIT(1'b0)) 
    \cmd_wr_data_reg[30] 
       (.C(SYS_CLK),
        .CE(\cmd_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[30]),
        .Q(cmd_wr_data[30]));
  FDCE #(
    .INIT(1'b0)) 
    \cmd_wr_data_reg[31] 
       (.C(SYS_CLK),
        .CE(\cmd_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[31]),
        .Q(cmd_wr_data[31]));
  FDCE #(
    .INIT(1'b0)) 
    \cmd_wr_data_reg[3] 
       (.C(SYS_CLK),
        .CE(\cmd_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[3]),
        .Q(cmd_wr_data[3]));
  FDCE #(
    .INIT(1'b0)) 
    \cmd_wr_data_reg[4] 
       (.C(SYS_CLK),
        .CE(\cmd_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[4]),
        .Q(cmd_wr_data[4]));
  FDCE #(
    .INIT(1'b0)) 
    \cmd_wr_data_reg[5] 
       (.C(SYS_CLK),
        .CE(\cmd_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[5]),
        .Q(cmd_wr_data[5]));
  FDCE #(
    .INIT(1'b0)) 
    \cmd_wr_data_reg[6] 
       (.C(SYS_CLK),
        .CE(\cmd_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[6]),
        .Q(cmd_wr_data[6]));
  FDCE #(
    .INIT(1'b0)) 
    \cmd_wr_data_reg[7] 
       (.C(SYS_CLK),
        .CE(\cmd_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[7]),
        .Q(cmd_wr_data[7]));
  FDCE #(
    .INIT(1'b0)) 
    \cmd_wr_data_reg[8] 
       (.C(SYS_CLK),
        .CE(\cmd_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[8]),
        .Q(cmd_wr_data[8]));
  FDCE #(
    .INIT(1'b0)) 
    \cmd_wr_data_reg[9] 
       (.C(SYS_CLK),
        .CE(\cmd_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[9]),
        .Q(cmd_wr_data[9]));
  LUT3 #(
    .INIT(8'h01)) 
    cmd_wr_valid_i_1
       (.I0(SL_RD_N1),
        .I1(fifo_sel[1]),
        .I2(fifo_sel[0]),
        .O(cmd_wr_valid_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    cmd_wr_valid_reg
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(cmd_wr_valid_i_1_n_0),
        .Q(cmd_wr_valid));
  LUT6 #(
    .INIT(64'hFFFFFFFFAABBAAFB)) 
    \cnt[0]_i_1 
       (.I0(\cnt[0]_i_2_n_0 ),
        .I1(sl_mode_reg[1]),
        .I2(\cnt[0]_i_3_n_0 ),
        .I3(cnt_reg_n_0_[0]),
        .I4(state[0]),
        .I5(\fifo_sel[1]_i_4_n_0 ),
        .O(\cnt[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000440000004000)) 
    \cnt[0]_i_2 
       (.I0(cnt_reg_n_0_[0]),
        .I1(state[4]),
        .I2(state[1]),
        .I3(state[0]),
        .I4(state[3]),
        .I5(state[2]),
        .O(\cnt[0]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \cnt[0]_i_3 
       (.I0(state[2]),
        .I1(state[3]),
        .I2(state[4]),
        .O(\cnt[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[10]_i_1 
       (.I0(\cnt[15]_i_9_n_0 ),
        .I1(\cnt_reg[12]_i_2_n_6 ),
        .O(\cnt[10]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[11]_i_1 
       (.I0(\cnt[15]_i_9_n_0 ),
        .I1(\cnt_reg[12]_i_2_n_5 ),
        .O(\cnt[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[12]_i_1 
       (.I0(\cnt[15]_i_9_n_0 ),
        .I1(\cnt_reg[12]_i_2_n_4 ),
        .O(\cnt[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[13]_i_1 
       (.I0(\cnt[15]_i_9_n_0 ),
        .I1(\cnt_reg[15]_i_10_n_7 ),
        .O(\cnt[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[14]_i_1 
       (.I0(\cnt[15]_i_9_n_0 ),
        .I1(\cnt_reg[15]_i_10_n_6 ),
        .O(\cnt[14]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \cnt[15]_i_12 
       (.I0(state[3]),
        .I1(state[2]),
        .I2(state[4]),
        .O(\cnt[15]_i_12_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \cnt[15]_i_13 
       (.I0(state[2]),
        .I1(state[3]),
        .O(\cnt[15]_i_13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[15]_i_2 
       (.I0(\cnt[15]_i_9_n_0 ),
        .I1(\cnt_reg[15]_i_10_n_5 ),
        .O(\cnt[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0800FFFF08000800)) 
    \cnt[15]_i_4 
       (.I0(SL_FULL_N),
        .I1(state[2]),
        .I2(state[3]),
        .I3(u_df2u_n_38),
        .I4(SL_WR_N_i_4_n_0),
        .I5(\control_flit[12]_i_2_n_0 ),
        .O(\cnt[15]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFEFF)) 
    \cnt[15]_i_5 
       (.I0(state[4]),
        .I1(state[0]),
        .I2(state[1]),
        .I3(state[2]),
        .I4(state[3]),
        .O(\cnt[15]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h000302A0)) 
    \cnt[15]_i_6 
       (.I0(SL_OE_N_i_4_n_0),
        .I1(ctl_cmd[0]),
        .I2(ctl_cmd[2]),
        .I3(ctl_cmd[1]),
        .I4(ctl_cmd[3]),
        .O(\cnt[15]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFF5F5FFCFF77FFFC)) 
    \cnt[15]_i_9 
       (.I0(sl_mode_reg[1]),
        .I1(state[4]),
        .I2(state[3]),
        .I3(state[1]),
        .I4(state[0]),
        .I5(state[2]),
        .O(\cnt[15]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[1]_i_1 
       (.I0(\cnt[15]_i_9_n_0 ),
        .I1(\cnt_reg[4]_i_2_n_7 ),
        .O(\cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[2]_i_1 
       (.I0(\cnt[15]_i_9_n_0 ),
        .I1(\cnt_reg[4]_i_2_n_6 ),
        .O(\cnt[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[3]_i_1 
       (.I0(\cnt[15]_i_9_n_0 ),
        .I1(\cnt_reg[4]_i_2_n_5 ),
        .O(\cnt[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[4]_i_1 
       (.I0(\cnt[15]_i_9_n_0 ),
        .I1(\cnt_reg[4]_i_2_n_4 ),
        .O(\cnt[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[5]_i_1 
       (.I0(\cnt[15]_i_9_n_0 ),
        .I1(\cnt_reg[8]_i_2_n_7 ),
        .O(\cnt[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[6]_i_1 
       (.I0(\cnt[15]_i_9_n_0 ),
        .I1(\cnt_reg[8]_i_2_n_6 ),
        .O(\cnt[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[7]_i_1 
       (.I0(\cnt[15]_i_9_n_0 ),
        .I1(\cnt_reg[8]_i_2_n_5 ),
        .O(\cnt[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[8]_i_1 
       (.I0(\cnt[15]_i_9_n_0 ),
        .I1(\cnt_reg[8]_i_2_n_4 ),
        .O(\cnt[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[9]_i_1 
       (.I0(\cnt[15]_i_9_n_0 ),
        .I1(\cnt_reg[12]_i_2_n_7 ),
        .O(\cnt[9]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[0] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_42),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\cnt[0]_i_1_n_0 ),
        .Q(cnt_reg_n_0_[0]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[10] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_42),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\cnt[10]_i_1_n_0 ),
        .Q(cnt_reg_n_0_[10]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[11] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_42),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\cnt[11]_i_1_n_0 ),
        .Q(cnt_reg_n_0_[11]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[12] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_42),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\cnt[12]_i_1_n_0 ),
        .Q(cnt_reg_n_0_[12]));
  CARRY4 \cnt_reg[12]_i_2 
       (.CI(\cnt_reg[8]_i_2_n_0 ),
        .CO({\cnt_reg[12]_i_2_n_0 ,\cnt_reg[12]_i_2_n_1 ,\cnt_reg[12]_i_2_n_2 ,\cnt_reg[12]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[12]_i_2_n_4 ,\cnt_reg[12]_i_2_n_5 ,\cnt_reg[12]_i_2_n_6 ,\cnt_reg[12]_i_2_n_7 }),
        .S(cnt_reg_n_0_[12:9]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[13] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_42),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\cnt[13]_i_1_n_0 ),
        .Q(cnt_reg_n_0_[13]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[14] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_42),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\cnt[14]_i_1_n_0 ),
        .Q(cnt_reg_n_0_[14]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[15] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_42),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\cnt[15]_i_2_n_0 ),
        .Q(cnt_reg_n_0_[15]));
  CARRY4 \cnt_reg[15]_i_10 
       (.CI(\cnt_reg[12]_i_2_n_0 ),
        .CO({\NLW_cnt_reg[15]_i_10_CO_UNCONNECTED [3:2],\cnt_reg[15]_i_10_n_2 ,\cnt_reg[15]_i_10_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_cnt_reg[15]_i_10_O_UNCONNECTED [3],\cnt_reg[15]_i_10_n_5 ,\cnt_reg[15]_i_10_n_6 ,\cnt_reg[15]_i_10_n_7 }),
        .S({1'b0,cnt_reg_n_0_[15:13]}));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[1] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_42),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\cnt[1]_i_1_n_0 ),
        .Q(cnt_reg_n_0_[1]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[2] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_42),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\cnt[2]_i_1_n_0 ),
        .Q(cnt_reg_n_0_[2]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[3] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_42),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\cnt[3]_i_1_n_0 ),
        .Q(cnt_reg_n_0_[3]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[4] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_42),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\cnt[4]_i_1_n_0 ),
        .Q(cnt_reg_n_0_[4]));
  CARRY4 \cnt_reg[4]_i_2 
       (.CI(1'b0),
        .CO({\cnt_reg[4]_i_2_n_0 ,\cnt_reg[4]_i_2_n_1 ,\cnt_reg[4]_i_2_n_2 ,\cnt_reg[4]_i_2_n_3 }),
        .CYINIT(cnt_reg_n_0_[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[4]_i_2_n_4 ,\cnt_reg[4]_i_2_n_5 ,\cnt_reg[4]_i_2_n_6 ,\cnt_reg[4]_i_2_n_7 }),
        .S(cnt_reg_n_0_[4:1]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[5] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_42),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\cnt[5]_i_1_n_0 ),
        .Q(cnt_reg_n_0_[5]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[6] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_42),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\cnt[6]_i_1_n_0 ),
        .Q(cnt_reg_n_0_[6]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[7] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_42),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\cnt[7]_i_1_n_0 ),
        .Q(cnt_reg_n_0_[7]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[8] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_42),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\cnt[8]_i_1_n_0 ),
        .Q(cnt_reg_n_0_[8]));
  CARRY4 \cnt_reg[8]_i_2 
       (.CI(\cnt_reg[4]_i_2_n_0 ),
        .CO({\cnt_reg[8]_i_2_n_0 ,\cnt_reg[8]_i_2_n_1 ,\cnt_reg[8]_i_2_n_2 ,\cnt_reg[8]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[8]_i_2_n_4 ,\cnt_reg[8]_i_2_n_5 ,\cnt_reg[8]_i_2_n_6 ,\cnt_reg[8]_i_2_n_7 }),
        .S(cnt_reg_n_0_[8:5]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[9] 
       (.C(SYS_CLK),
        .CE(u_df2u_n_42),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\cnt[9]_i_1_n_0 ),
        .Q(cnt_reg_n_0_[9]));
  LUT3 #(
    .INIT(8'hB8)) 
    \control_flit[0]_i_1 
       (.I0(SL_DT_I[0]),
        .I1(state[1]),
        .I2(control_flit[0]),
        .O(\control_flit[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \control_flit[10]_i_1 
       (.I0(SL_DT_I[10]),
        .I1(state[1]),
        .I2(control_flit[10]),
        .O(\control_flit[10]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \control_flit[11]_i_1 
       (.I0(SL_DT_I[11]),
        .I1(state[1]),
        .I2(control_flit[11]),
        .O(\control_flit[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFAEEE0000AEEE)) 
    \control_flit[12]_i_1 
       (.I0(\control_flit[12]_i_2_n_0 ),
        .I1(ctl_cmd[0]),
        .I2(mask[0]),
        .I3(sl_mode_reg[0]),
        .I4(state[1]),
        .I5(SL_DT_I[12]),
        .O(\control_flit[12]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h40C0)) 
    \control_flit[12]_i_2 
       (.I0(mask[0]),
        .I1(mask[1]),
        .I2(sl_mode_reg[1]),
        .I3(sl_mode_reg[0]),
        .O(\control_flit[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA3FAA00AA00AA00)) 
    \control_flit[13]_i_1 
       (.I0(SL_DT_I[13]),
        .I1(mask[1]),
        .I2(sl_mode_reg[1]),
        .I3(state[1]),
        .I4(\control_flit[15]_i_2_n_0 ),
        .I5(ctl_cmd[1]),
        .O(\control_flit[13]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \control_flit[14]_i_1 
       (.I0(\control_flit[31]_i_3_n_0 ),
        .I1(ctl_cmd[2]),
        .I2(state[1]),
        .I3(SL_DT_I[14]),
        .O(\control_flit[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAA3FAA00AA00AA00)) 
    \control_flit[15]_i_1 
       (.I0(SL_DT_I[15]),
        .I1(mask[1]),
        .I2(sl_mode_reg[1]),
        .I3(state[1]),
        .I4(\control_flit[15]_i_2_n_0 ),
        .I5(ctl_cmd[3]),
        .O(\control_flit[15]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \control_flit[15]_i_2 
       (.I0(sl_mode_reg[0]),
        .I1(mask[0]),
        .O(\control_flit[15]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \control_flit[16]_i_1 
       (.I0(\control_flit[31]_i_3_n_0 ),
        .I1(dat_leng[0]),
        .I2(state[1]),
        .I3(SL_DT_I[16]),
        .O(\control_flit[16]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \control_flit[17]_i_1 
       (.I0(\control_flit[31]_i_3_n_0 ),
        .I1(dat_leng[1]),
        .I2(state[1]),
        .I3(SL_DT_I[17]),
        .O(\control_flit[17]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \control_flit[18]_i_1 
       (.I0(\control_flit[31]_i_3_n_0 ),
        .I1(dat_leng[2]),
        .I2(state[1]),
        .I3(SL_DT_I[18]),
        .O(\control_flit[18]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \control_flit[19]_i_1 
       (.I0(\control_flit[31]_i_3_n_0 ),
        .I1(dat_leng[3]),
        .I2(state[1]),
        .I3(SL_DT_I[19]),
        .O(\control_flit[19]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \control_flit[1]_i_1 
       (.I0(SL_DT_I[1]),
        .I1(state[1]),
        .I2(control_flit[1]),
        .O(\control_flit[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \control_flit[20]_i_1 
       (.I0(\control_flit[31]_i_3_n_0 ),
        .I1(dat_leng[4]),
        .I2(state[1]),
        .I3(SL_DT_I[20]),
        .O(\control_flit[20]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \control_flit[21]_i_1 
       (.I0(\control_flit[31]_i_3_n_0 ),
        .I1(dat_leng[5]),
        .I2(state[1]),
        .I3(SL_DT_I[21]),
        .O(\control_flit[21]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \control_flit[22]_i_1 
       (.I0(\control_flit[31]_i_3_n_0 ),
        .I1(dat_leng[6]),
        .I2(state[1]),
        .I3(SL_DT_I[22]),
        .O(\control_flit[22]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \control_flit[23]_i_1 
       (.I0(\control_flit[31]_i_3_n_0 ),
        .I1(dat_leng[7]),
        .I2(state[1]),
        .I3(SL_DT_I[23]),
        .O(\control_flit[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \control_flit[24]_i_1 
       (.I0(\control_flit[31]_i_3_n_0 ),
        .I1(dat_leng[8]),
        .I2(state[1]),
        .I3(SL_DT_I[24]),
        .O(\control_flit[24]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \control_flit[25]_i_1 
       (.I0(\control_flit[31]_i_3_n_0 ),
        .I1(dat_leng[9]),
        .I2(state[1]),
        .I3(SL_DT_I[25]),
        .O(\control_flit[25]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \control_flit[26]_i_1 
       (.I0(\control_flit[31]_i_3_n_0 ),
        .I1(dat_leng[10]),
        .I2(state[1]),
        .I3(SL_DT_I[26]),
        .O(\control_flit[26]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \control_flit[27]_i_1 
       (.I0(\control_flit[31]_i_3_n_0 ),
        .I1(dat_leng[11]),
        .I2(state[1]),
        .I3(SL_DT_I[27]),
        .O(\control_flit[27]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \control_flit[28]_i_1 
       (.I0(\control_flit[31]_i_3_n_0 ),
        .I1(dat_leng[12]),
        .I2(state[1]),
        .I3(SL_DT_I[28]),
        .O(\control_flit[28]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \control_flit[29]_i_1 
       (.I0(\control_flit[31]_i_3_n_0 ),
        .I1(dat_leng[13]),
        .I2(state[1]),
        .I3(SL_DT_I[29]),
        .O(\control_flit[29]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \control_flit[2]_i_1 
       (.I0(SL_DT_I[2]),
        .I1(state[1]),
        .I2(control_flit[2]),
        .O(\control_flit[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \control_flit[30]_i_1 
       (.I0(\control_flit[31]_i_3_n_0 ),
        .I1(dat_leng[14]),
        .I2(state[1]),
        .I3(SL_DT_I[30]),
        .O(\control_flit[30]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000009)) 
    \control_flit[31]_i_1 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(state[4]),
        .I3(state[2]),
        .I4(state[3]),
        .O(\control_flit[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \control_flit[31]_i_2 
       (.I0(\control_flit[31]_i_3_n_0 ),
        .I1(dat_leng[15]),
        .I2(state[1]),
        .I3(SL_DT_I[31]),
        .O(\control_flit[31]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0000F888)) 
    \control_flit[31]_i_3 
       (.I0(sl_mode_reg[1]),
        .I1(mask[1]),
        .I2(sl_mode_reg[0]),
        .I3(mask[0]),
        .I4(state[1]),
        .O(\control_flit[31]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \control_flit[3]_i_1 
       (.I0(SL_DT_I[3]),
        .I1(state[1]),
        .I2(control_flit[3]),
        .O(\control_flit[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAA3FAA00AA00AA00)) 
    \control_flit[4]_i_1 
       (.I0(SL_DT_I[4]),
        .I1(mask[1]),
        .I2(sl_mode_reg[1]),
        .I3(state[1]),
        .I4(\control_flit[15]_i_2_n_0 ),
        .I5(transactor_sel[0]),
        .O(\control_flit[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAA3FAA00AA00AA00)) 
    \control_flit[5]_i_1 
       (.I0(SL_DT_I[5]),
        .I1(mask[1]),
        .I2(sl_mode_reg[1]),
        .I3(state[1]),
        .I4(\control_flit[15]_i_2_n_0 ),
        .I5(transactor_sel[1]),
        .O(\control_flit[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAA3FAA00AA00AA00)) 
    \control_flit[6]_i_1 
       (.I0(SL_DT_I[6]),
        .I1(mask[1]),
        .I2(sl_mode_reg[1]),
        .I3(state[1]),
        .I4(\control_flit[15]_i_2_n_0 ),
        .I5(transactor_sel[2]),
        .O(\control_flit[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAA3FAA00AA00AA00)) 
    \control_flit[7]_i_1 
       (.I0(SL_DT_I[7]),
        .I1(mask[1]),
        .I2(sl_mode_reg[1]),
        .I3(state[1]),
        .I4(\control_flit[15]_i_2_n_0 ),
        .I5(transactor_sel[3]),
        .O(\control_flit[7]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \control_flit[8]_i_1 
       (.I0(SL_DT_I[8]),
        .I1(state[1]),
        .I2(control_flit[8]),
        .O(\control_flit[8]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \control_flit[9]_i_1 
       (.I0(SL_DT_I[9]),
        .I1(state[1]),
        .I2(control_flit[9]),
        .O(\control_flit[9]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    control_flit_inst
       (.I0(control_flit[31]),
        .O(dat_leng[15]));
  LUT1 #(
    .INIT(2'h2)) 
    control_flit_inst__0
       (.I0(control_flit[30]),
        .O(dat_leng[14]));
  LUT1 #(
    .INIT(2'h2)) 
    control_flit_inst__1
       (.I0(control_flit[29]),
        .O(dat_leng[13]));
  LUT1 #(
    .INIT(2'h2)) 
    control_flit_inst__10
       (.I0(control_flit[20]),
        .O(dat_leng[4]));
  LUT1 #(
    .INIT(2'h2)) 
    control_flit_inst__11
       (.I0(control_flit[19]),
        .O(dat_leng[3]));
  LUT1 #(
    .INIT(2'h2)) 
    control_flit_inst__12
       (.I0(control_flit[18]),
        .O(dat_leng[2]));
  LUT1 #(
    .INIT(2'h2)) 
    control_flit_inst__13
       (.I0(control_flit[17]),
        .O(dat_leng[1]));
  LUT1 #(
    .INIT(2'h2)) 
    control_flit_inst__14
       (.I0(control_flit[16]),
        .O(dat_leng[0]));
  LUT1 #(
    .INIT(2'h2)) 
    control_flit_inst__15
       (.I0(control_flit[15]),
        .O(ctl_cmd[3]));
  LUT1 #(
    .INIT(2'h2)) 
    control_flit_inst__16
       (.I0(control_flit[14]),
        .O(ctl_cmd[2]));
  LUT1 #(
    .INIT(2'h2)) 
    control_flit_inst__17
       (.I0(control_flit[13]),
        .O(ctl_cmd[1]));
  LUT1 #(
    .INIT(2'h2)) 
    control_flit_inst__18
       (.I0(control_flit[12]),
        .O(ctl_cmd[0]));
  LUT1 #(
    .INIT(2'h2)) 
    control_flit_inst__19
       (.I0(control_flit[7]),
        .O(transactor_sel[3]));
  LUT1 #(
    .INIT(2'h2)) 
    control_flit_inst__2
       (.I0(control_flit[28]),
        .O(dat_leng[12]));
  LUT1 #(
    .INIT(2'h2)) 
    control_flit_inst__20
       (.I0(control_flit[6]),
        .O(transactor_sel[2]));
  LUT1 #(
    .INIT(2'h2)) 
    control_flit_inst__21
       (.I0(control_flit[5]),
        .O(transactor_sel[1]));
  LUT1 #(
    .INIT(2'h2)) 
    control_flit_inst__22
       (.I0(control_flit[4]),
        .O(transactor_sel[0]));
  LUT1 #(
    .INIT(2'h2)) 
    control_flit_inst__3
       (.I0(control_flit[27]),
        .O(dat_leng[11]));
  LUT1 #(
    .INIT(2'h2)) 
    control_flit_inst__4
       (.I0(control_flit[26]),
        .O(dat_leng[10]));
  LUT1 #(
    .INIT(2'h2)) 
    control_flit_inst__5
       (.I0(control_flit[25]),
        .O(dat_leng[9]));
  LUT1 #(
    .INIT(2'h2)) 
    control_flit_inst__6
       (.I0(control_flit[24]),
        .O(dat_leng[8]));
  LUT1 #(
    .INIT(2'h2)) 
    control_flit_inst__7
       (.I0(control_flit[23]),
        .O(dat_leng[7]));
  LUT1 #(
    .INIT(2'h2)) 
    control_flit_inst__8
       (.I0(control_flit[22]),
        .O(dat_leng[6]));
  LUT1 #(
    .INIT(2'h2)) 
    control_flit_inst__9
       (.I0(control_flit[21]),
        .O(dat_leng[5]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \control_flit_reg[0] 
       (.C(SYS_CLK),
        .CE(\control_flit[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\control_flit[0]_i_1_n_0 ),
        .Q(control_flit[0]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \control_flit_reg[10] 
       (.C(SYS_CLK),
        .CE(\control_flit[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\control_flit[10]_i_1_n_0 ),
        .Q(control_flit[10]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \control_flit_reg[11] 
       (.C(SYS_CLK),
        .CE(\control_flit[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\control_flit[11]_i_1_n_0 ),
        .Q(control_flit[11]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \control_flit_reg[12] 
       (.C(SYS_CLK),
        .CE(\control_flit[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\control_flit[12]_i_1_n_0 ),
        .Q(control_flit[12]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \control_flit_reg[13] 
       (.C(SYS_CLK),
        .CE(\control_flit[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\control_flit[13]_i_1_n_0 ),
        .Q(control_flit[13]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \control_flit_reg[14] 
       (.C(SYS_CLK),
        .CE(\control_flit[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\control_flit[14]_i_1_n_0 ),
        .Q(control_flit[14]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \control_flit_reg[15] 
       (.C(SYS_CLK),
        .CE(\control_flit[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\control_flit[15]_i_1_n_0 ),
        .Q(control_flit[15]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \control_flit_reg[16] 
       (.C(SYS_CLK),
        .CE(\control_flit[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\control_flit[16]_i_1_n_0 ),
        .Q(control_flit[16]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \control_flit_reg[17] 
       (.C(SYS_CLK),
        .CE(\control_flit[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\control_flit[17]_i_1_n_0 ),
        .Q(control_flit[17]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \control_flit_reg[18] 
       (.C(SYS_CLK),
        .CE(\control_flit[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\control_flit[18]_i_1_n_0 ),
        .Q(control_flit[18]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \control_flit_reg[19] 
       (.C(SYS_CLK),
        .CE(\control_flit[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\control_flit[19]_i_1_n_0 ),
        .Q(control_flit[19]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \control_flit_reg[1] 
       (.C(SYS_CLK),
        .CE(\control_flit[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\control_flit[1]_i_1_n_0 ),
        .Q(control_flit[1]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \control_flit_reg[20] 
       (.C(SYS_CLK),
        .CE(\control_flit[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\control_flit[20]_i_1_n_0 ),
        .Q(control_flit[20]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \control_flit_reg[21] 
       (.C(SYS_CLK),
        .CE(\control_flit[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\control_flit[21]_i_1_n_0 ),
        .Q(control_flit[21]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \control_flit_reg[22] 
       (.C(SYS_CLK),
        .CE(\control_flit[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\control_flit[22]_i_1_n_0 ),
        .Q(control_flit[22]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \control_flit_reg[23] 
       (.C(SYS_CLK),
        .CE(\control_flit[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\control_flit[23]_i_1_n_0 ),
        .Q(control_flit[23]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \control_flit_reg[24] 
       (.C(SYS_CLK),
        .CE(\control_flit[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\control_flit[24]_i_1_n_0 ),
        .Q(control_flit[24]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \control_flit_reg[25] 
       (.C(SYS_CLK),
        .CE(\control_flit[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\control_flit[25]_i_1_n_0 ),
        .Q(control_flit[25]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \control_flit_reg[26] 
       (.C(SYS_CLK),
        .CE(\control_flit[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\control_flit[26]_i_1_n_0 ),
        .Q(control_flit[26]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \control_flit_reg[27] 
       (.C(SYS_CLK),
        .CE(\control_flit[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\control_flit[27]_i_1_n_0 ),
        .Q(control_flit[27]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \control_flit_reg[28] 
       (.C(SYS_CLK),
        .CE(\control_flit[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\control_flit[28]_i_1_n_0 ),
        .Q(control_flit[28]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \control_flit_reg[29] 
       (.C(SYS_CLK),
        .CE(\control_flit[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\control_flit[29]_i_1_n_0 ),
        .Q(control_flit[29]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \control_flit_reg[2] 
       (.C(SYS_CLK),
        .CE(\control_flit[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\control_flit[2]_i_1_n_0 ),
        .Q(control_flit[2]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \control_flit_reg[30] 
       (.C(SYS_CLK),
        .CE(\control_flit[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\control_flit[30]_i_1_n_0 ),
        .Q(control_flit[30]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \control_flit_reg[31] 
       (.C(SYS_CLK),
        .CE(\control_flit[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\control_flit[31]_i_2_n_0 ),
        .Q(control_flit[31]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \control_flit_reg[3] 
       (.C(SYS_CLK),
        .CE(\control_flit[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\control_flit[3]_i_1_n_0 ),
        .Q(control_flit[3]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \control_flit_reg[4] 
       (.C(SYS_CLK),
        .CE(\control_flit[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\control_flit[4]_i_1_n_0 ),
        .Q(control_flit[4]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \control_flit_reg[5] 
       (.C(SYS_CLK),
        .CE(\control_flit[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\control_flit[5]_i_1_n_0 ),
        .Q(control_flit[5]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \control_flit_reg[6] 
       (.C(SYS_CLK),
        .CE(\control_flit[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\control_flit[6]_i_1_n_0 ),
        .Q(control_flit[6]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \control_flit_reg[7] 
       (.C(SYS_CLK),
        .CE(\control_flit[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\control_flit[7]_i_1_n_0 ),
        .Q(control_flit[7]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \control_flit_reg[8] 
       (.C(SYS_CLK),
        .CE(\control_flit[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\control_flit[8]_i_1_n_0 ),
        .Q(control_flit[8]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \control_flit_reg[9] 
       (.C(SYS_CLK),
        .CE(\control_flit[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\control_flit[9]_i_1_n_0 ),
        .Q(control_flit[9]));
  LUT6 #(
    .INIT(64'hFFABFFFFFFAB0000)) 
    \fifo_sel[0]_i_1 
       (.I0(\fifo_sel[0]_i_2_n_0 ),
        .I1(\control_flit[15]_i_2_n_0 ),
        .I2(state[2]),
        .I3(\fifo_sel[0]_i_3_n_0 ),
        .I4(\fifo_sel[1]_i_4_n_0 ),
        .I5(fifo_sel[0]),
        .O(\fifo_sel[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F0888800008888)) 
    \fifo_sel[0]_i_2 
       (.I0(\fifo_sel[0]_i_4_n_0 ),
        .I1(fifo_sel[0]),
        .I2(SL_OE_N_i_4_n_0),
        .I3(ctl_cmd[0]),
        .I4(state[2]),
        .I5(\fifo_sel[0]_i_5_n_0 ),
        .O(\fifo_sel[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFF50000FDCF0000)) 
    \fifo_sel[0]_i_3 
       (.I0(SL_OE_N_i_4_n_0),
        .I1(ctl_cmd[0]),
        .I2(ctl_cmd[3]),
        .I3(ctl_cmd[1]),
        .I4(\fifo_sel[0]_i_6_n_0 ),
        .I5(ctl_cmd[2]),
        .O(\fifo_sel[0]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \fifo_sel[0]_i_4 
       (.I0(sl_mode_reg[1]),
        .I1(mask[1]),
        .O(\fifo_sel[0]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \fifo_sel[0]_i_5 
       (.I0(ctl_cmd[2]),
        .I1(ctl_cmd[3]),
        .I2(ctl_cmd[1]),
        .O(\fifo_sel[0]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \fifo_sel[0]_i_6 
       (.I0(fifo_sel[0]),
        .I1(state[2]),
        .O(\fifo_sel[0]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hFEFFFE00)) 
    \fifo_sel[1]_i_1 
       (.I0(\SL_AD[1]_i_3_n_0 ),
        .I1(\fifo_sel[1]_i_2_n_0 ),
        .I2(\fifo_sel[1]_i_3_n_0 ),
        .I3(\fifo_sel[1]_i_4_n_0 ),
        .I4(fifo_sel[1]),
        .O(\fifo_sel[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0444)) 
    \fifo_sel[1]_i_2 
       (.I0(state[2]),
        .I1(fifo_sel[1]),
        .I2(mask[0]),
        .I3(sl_mode_reg[0]),
        .O(\fifo_sel[1]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \fifo_sel[1]_i_3 
       (.I0(state[2]),
        .I1(fifo_sel[1]),
        .I2(SL_OE_N_i_3_n_0),
        .O(\fifo_sel[1]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \fifo_sel[1]_i_4 
       (.I0(state[4]),
        .I1(state[0]),
        .I2(state[1]),
        .I3(state[3]),
        .O(\fifo_sel[1]_i_4_n_0 ));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \fifo_sel_reg[0] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\fifo_sel[0]_i_1_n_0 ),
        .Q(fifo_sel[0]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \fifo_sel_reg[1] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\fifo_sel[1]_i_1_n_0 ),
        .Q(fifo_sel[1]));
  LUT5 #(
    .INIT(32'hFFD0081F)) 
    g0_b0
       (.I0(state[0]),
        .I1(state[1]),
        .I2(state[2]),
        .I3(state[3]),
        .I4(state[4]),
        .O(g0_b0_n_0));
  LUT5 #(
    .INIT(32'hFFD002DF)) 
    g0_b0__0
       (.I0(state[0]),
        .I1(state[1]),
        .I2(state[2]),
        .I3(state[3]),
        .I4(state[4]),
        .O(g0_b0__0_n_0));
  LUT5 #(
    .INIT(32'hFFF0703F)) 
    g0_b0__1
       (.I0(state[0]),
        .I1(state[1]),
        .I2(state[2]),
        .I3(state[3]),
        .I4(state[4]),
        .O(g0_b0__1_n_0));
  LUT4 #(
    .INIT(16'h77C4)) 
    \mask[0]_i_1 
       (.I0(sl_mode_reg[1]),
        .I1(mask[0]),
        .I2(mask[1]),
        .I3(sl_mode_reg[0]),
        .O(\mask[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hBFB0)) 
    \mask[1]_i_1 
       (.I0(mask[0]),
        .I1(sl_mode_reg[0]),
        .I2(mask[1]),
        .I3(sl_mode_reg[1]),
        .O(\mask[1]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \mask_reg[0] 
       (.C(SYS_CLK),
        .CE(\sl_mode_reg[1]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\mask[0]_i_1_n_0 ),
        .Q(mask[0]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \mask_reg[1] 
       (.C(SYS_CLK),
        .CE(\sl_mode_reg[1]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\mask[1]_i_1_n_0 ),
        .Q(mask[1]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \pushed_reg[0] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_du2f_n_52),
        .Q(pushed[0]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \pushed_reg[10] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_du2f_n_42),
        .Q(pushed[10]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \pushed_reg[11] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_du2f_n_41),
        .Q(pushed[11]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \pushed_reg[12] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_du2f_n_40),
        .Q(pushed[12]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \pushed_reg[13] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_du2f_n_39),
        .Q(pushed[13]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \pushed_reg[14] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_du2f_n_38),
        .Q(pushed[14]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \pushed_reg[15] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_du2f_n_37),
        .Q(pushed[15]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \pushed_reg[1] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_du2f_n_51),
        .Q(pushed[1]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \pushed_reg[2] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_du2f_n_50),
        .Q(pushed[2]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \pushed_reg[3] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_du2f_n_49),
        .Q(pushed[3]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \pushed_reg[4] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_du2f_n_48),
        .Q(pushed[4]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \pushed_reg[5] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_du2f_n_47),
        .Q(pushed[5]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \pushed_reg[6] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_du2f_n_46),
        .Q(pushed[6]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \pushed_reg[7] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_du2f_n_45),
        .Q(pushed[7]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \pushed_reg[8] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_du2f_n_44),
        .Q(pushed[8]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \pushed_reg[9] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_du2f_n_43),
        .Q(pushed[9]));
  LUT1 #(
    .INIT(2'h1)) 
    reg_clk_i_1
       (.I0(reg_clk),
        .O(reg_clk_i_1_n_0));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    reg_clk_reg
       (.C(SYS_CLK),
        .CE(1'b1),
        .D(reg_clk_i_1_n_0),
        .Q(reg_clk),
        .R(1'b0));
  CARRY4 remain_carry
       (.CI(1'b0),
        .CO({remain_carry_n_0,remain_carry_n_1,remain_carry_n_2,remain_carry_n_3}),
        .CYINIT(1'b1),
        .DI(dat_leng[3:0]),
        .O(remain[3:0]),
        .S({remain_carry_i_1_n_0,remain_carry_i_2_n_0,remain_carry_i_3_n_0,remain_carry_i_4_n_0}));
  CARRY4 remain_carry__0
       (.CI(remain_carry_n_0),
        .CO({remain_carry__0_n_0,remain_carry__0_n_1,remain_carry__0_n_2,remain_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(dat_leng[7:4]),
        .O(remain[7:4]),
        .S({remain_carry__0_i_1_n_0,remain_carry__0_i_2_n_0,remain_carry__0_i_3_n_0,remain_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    remain_carry__0_i_1
       (.I0(dat_leng[7]),
        .I1(cnt_reg_n_0_[7]),
        .O(remain_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    remain_carry__0_i_2
       (.I0(dat_leng[6]),
        .I1(cnt_reg_n_0_[6]),
        .O(remain_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    remain_carry__0_i_3
       (.I0(dat_leng[5]),
        .I1(cnt_reg_n_0_[5]),
        .O(remain_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    remain_carry__0_i_4
       (.I0(dat_leng[4]),
        .I1(cnt_reg_n_0_[4]),
        .O(remain_carry__0_i_4_n_0));
  CARRY4 remain_carry__1
       (.CI(remain_carry__0_n_0),
        .CO({remain_carry__1_n_0,remain_carry__1_n_1,remain_carry__1_n_2,remain_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI(dat_leng[11:8]),
        .O(remain[11:8]),
        .S({remain_carry__1_i_1_n_0,remain_carry__1_i_2_n_0,remain_carry__1_i_3_n_0,remain_carry__1_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    remain_carry__1_i_1
       (.I0(dat_leng[11]),
        .I1(cnt_reg_n_0_[11]),
        .O(remain_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    remain_carry__1_i_2
       (.I0(dat_leng[10]),
        .I1(cnt_reg_n_0_[10]),
        .O(remain_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    remain_carry__1_i_3
       (.I0(dat_leng[9]),
        .I1(cnt_reg_n_0_[9]),
        .O(remain_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    remain_carry__1_i_4
       (.I0(dat_leng[8]),
        .I1(cnt_reg_n_0_[8]),
        .O(remain_carry__1_i_4_n_0));
  CARRY4 remain_carry__2
       (.CI(remain_carry__1_n_0),
        .CO({NLW_remain_carry__2_CO_UNCONNECTED[3],remain_carry__2_n_1,remain_carry__2_n_2,remain_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,dat_leng[14:12]}),
        .O(remain[15:12]),
        .S({remain_carry__2_i_1_n_0,remain_carry__2_i_2_n_0,remain_carry__2_i_3_n_0,remain_carry__2_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    remain_carry__2_i_1
       (.I0(dat_leng[15]),
        .I1(cnt_reg_n_0_[15]),
        .O(remain_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    remain_carry__2_i_2
       (.I0(dat_leng[14]),
        .I1(cnt_reg_n_0_[14]),
        .O(remain_carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    remain_carry__2_i_3
       (.I0(dat_leng[13]),
        .I1(cnt_reg_n_0_[13]),
        .O(remain_carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    remain_carry__2_i_4
       (.I0(dat_leng[12]),
        .I1(cnt_reg_n_0_[12]),
        .O(remain_carry__2_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    remain_carry_i_1
       (.I0(dat_leng[3]),
        .I1(cnt_reg_n_0_[3]),
        .O(remain_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    remain_carry_i_2
       (.I0(dat_leng[2]),
        .I1(cnt_reg_n_0_[2]),
        .O(remain_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    remain_carry_i_3
       (.I0(dat_leng[1]),
        .I1(cnt_reg_n_0_[1]),
        .O(remain_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    remain_carry_i_4
       (.I0(dat_leng[0]),
        .I1(cnt_reg_n_0_[0]),
        .O(remain_carry_i_4_n_0));
  LUT6 #(
    .INIT(64'h004FF7E000000000)) 
    \sl_ad_reg[0]_i_1 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(state[2]),
        .I3(state[3]),
        .I4(state[4]),
        .I5(sl_ad_reg[0]),
        .O(\sl_ad_reg[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF222FFFFF222F222)) 
    \sl_ad_reg[1]_i_1 
       (.I0(\control_flit[12]_i_2_n_0 ),
        .I1(SL_WR_N_i_4_n_0),
        .I2(\sl_ad_reg[1]_i_2_n_0 ),
        .I3(sl_ad_reg[1]),
        .I4(\cnt[15]_i_5_n_0 ),
        .I5(\sl_ad_reg[1]_i_3_n_0 ),
        .O(\sl_ad_reg[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h52567646)) 
    \sl_ad_reg[1]_i_2 
       (.I0(state[4]),
        .I1(state[3]),
        .I2(state[2]),
        .I3(state[0]),
        .I4(state[1]),
        .O(\sl_ad_reg[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h10040004)) 
    \sl_ad_reg[1]_i_3 
       (.I0(ctl_cmd[1]),
        .I1(ctl_cmd[3]),
        .I2(ctl_cmd[2]),
        .I3(ctl_cmd[0]),
        .I4(SL_OE_N_i_4_n_0),
        .O(\sl_ad_reg[1]_i_3_n_0 ));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \sl_ad_reg_reg[0] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\sl_ad_reg[0]_i_1_n_0 ),
        .Q(sl_ad_reg[0]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \sl_ad_reg_reg[1] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\sl_ad_reg[1]_i_1_n_0 ),
        .Q(sl_ad_reg[1]));
  LUT5 #(
    .INIT(32'h00000001)) 
    \sl_mode_reg[1]_i_1 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(state[4]),
        .I3(state[2]),
        .I4(state[3]),
        .O(\sl_mode_reg[1]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \sl_mode_reg_reg[0] 
       (.C(SYS_CLK),
        .CE(\sl_mode_reg[1]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_MODE[0]),
        .Q(sl_mode_reg[0]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \sl_mode_reg_reg[1] 
       (.C(SYS_CLK),
        .CE(\sl_mode_reg[1]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_MODE[1]),
        .Q(sl_mode_reg[1]));
  LUT6 #(
    .INIT(64'hFFFFFFFFAE000400)) 
    sl_oe_n_reg_i_3
       (.I0(state[1]),
        .I1(SL_OE_N_i_3_n_0),
        .I2(state[0]),
        .I3(\cnt[0]_i_3_n_0 ),
        .I4(sl_oe_n_reg),
        .I5(sl_oe_n_reg_i_5_n_0),
        .O(sl_oe_n_reg_i_3_n_0));
  LUT5 #(
    .INIT(32'h00080C08)) 
    sl_oe_n_reg_i_4
       (.I0(sl_oe_n_reg),
        .I1(state[3]),
        .I2(state[4]),
        .I3(state[2]),
        .I4(state[1]),
        .O(sl_oe_n_reg_i_4_n_0));
  LUT6 #(
    .INIT(64'h00B0000000000000)) 
    sl_oe_n_reg_i_5
       (.I0(sl_oe_n_reg),
        .I1(state[0]),
        .I2(state[1]),
        .I3(state[4]),
        .I4(state[2]),
        .I5(state[3]),
        .O(sl_oe_n_reg_i_5_n_0));
  (* KEEP = "yes" *) 
  FDPE #(
    .INIT(1'b1)) 
    sl_oe_n_reg_reg
       (.C(SYS_CLK),
        .CE(1'b1),
        .D(u_cu2f_n_36),
        .PRE(\SL_AD[1]_i_2_n_0 ),
        .Q(sl_oe_n_reg));
  LUT2 #(
    .INIT(4'h7)) 
    sl_pktend_n_reg_i_5
       (.I0(state[2]),
        .I1(state[3]),
        .O(sl_pktend_n_reg_i_5_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    sl_pktend_n_reg_i_7
       (.I0(state[1]),
        .I1(state[0]),
        .O(sl_pktend_n_reg_i_7_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    sl_pktend_n_reg_i_8
       (.I0(state[1]),
        .I1(state[0]),
        .O(sl_pktend_n_reg_i_8_n_0));
  (* KEEP = "yes" *) 
  FDPE #(
    .INIT(1'b1)) 
    sl_pktend_n_reg_reg
       (.C(SYS_CLK),
        .CE(1'b1),
        .D(u_df2u_n_37),
        .PRE(\SL_AD[1]_i_2_n_0 ),
        .Q(sl_pktend_n_reg));
  LUT5 #(
    .INIT(32'hFF008282)) 
    sl_rd_n_reg_i_5
       (.I0(state[2]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(state[4]),
        .I4(state[3]),
        .O(sl_rd_n_reg_i_5_n_0));
  (* KEEP = "yes" *) 
  FDPE #(
    .INIT(1'b1)) 
    sl_rd_n_reg_reg
       (.C(SYS_CLK),
        .CE(1'b1),
        .D(u_cu2f_n_37),
        .PRE(\SL_AD[1]_i_2_n_0 ),
        .Q(sl_rd_n_reg));
  LUT2 #(
    .INIT(4'h8)) 
    sl_wr_n_reg_i_5
       (.I0(state[3]),
        .I1(state[4]),
        .O(sl_wr_n_reg_i_5_n_0));
  (* KEEP = "yes" *) 
  FDPE #(
    .INIT(1'b1)) 
    sl_wr_n_reg_reg
       (.C(SYS_CLK),
        .CE(1'b1),
        .D(u_df2u_n_36),
        .PRE(\SL_AD[1]_i_2_n_0 ),
        .Q(sl_wr_n_reg));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \state[0]_i_10 
       (.I0(state[2]),
        .I1(state[4]),
        .I2(state[3]),
        .I3(state[0]),
        .O(\state[0]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \state[0]_i_11 
       (.I0(state[1]),
        .I1(state[2]),
        .O(\state[0]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h0000003005050000)) 
    \state[0]_i_16 
       (.I0(state[2]),
        .I1(sl_mode_reg[1]),
        .I2(state[1]),
        .I3(state[0]),
        .I4(state[4]),
        .I5(state[3]),
        .O(\state[0]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF222222F22222)) 
    \state[0]_i_3 
       (.I0(\state[0]_i_9_n_0 ),
        .I1(\control_flit[15]_i_2_n_0 ),
        .I2(\state[4]_i_4_n_0 ),
        .I3(SL_PRE_FULL_N),
        .I4(SL_FULL_N),
        .I5(\state[0]_i_10_n_0 ),
        .O(\state[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h10)) 
    \state[0]_i_6 
       (.I0(state[4]),
        .I1(state[0]),
        .I2(state[1]),
        .O(\state[0]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    \state[0]_i_8 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(state[4]),
        .I3(state[3]),
        .O(\state[0]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \state[0]_i_9 
       (.I0(state[2]),
        .I1(state[4]),
        .I2(state[3]),
        .I3(state[0]),
        .O(\state[0]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h0000020000000000)) 
    \state[1]_i_10 
       (.I0(state[3]),
        .I1(state[4]),
        .I2(state[0]),
        .I3(state[1]),
        .I4(sl_mode_reg[0]),
        .I5(sl_mode_reg[1]),
        .O(\state[1]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h0000040000000000)) 
    \state[1]_i_11 
       (.I0(ctl_cmd[3]),
        .I1(ctl_cmd[1]),
        .I2(state[4]),
        .I3(\state[0]_i_11_n_0 ),
        .I4(\state[1]_i_17_n_0 ),
        .I5(SL_OE_N_i_4_n_0),
        .O(\state[1]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \state[1]_i_12 
       (.I0(state[2]),
        .I1(state[1]),
        .I2(state[3]),
        .I3(state[0]),
        .O(\state[1]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h0004000400440004)) 
    \state[1]_i_13 
       (.I0(state[2]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(state[3]),
        .I4(state[4]),
        .I5(SL_PKTEND_N_i_4_n_0),
        .O(\state[1]_i_13_n_0 ));
  LUT3 #(
    .INIT(8'h07)) 
    \state[1]_i_14 
       (.I0(SL_FULL_N),
        .I1(SL_PRE_FULL_N),
        .I2(sl_mode_reg[1]),
        .O(\state[1]_i_14_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \state[1]_i_16 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(state[4]),
        .O(\state[1]_i_16_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \state[1]_i_17 
       (.I0(ctl_cmd[0]),
        .I1(ctl_cmd[2]),
        .O(\state[1]_i_17_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \state[1]_i_8 
       (.I0(state[4]),
        .I1(state[0]),
        .I2(state[2]),
        .O(\state[1]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hC800C8FF)) 
    \state[1]_i_9 
       (.I0(timeout_reg_n_0_[0]),
        .I1(timeout_reg_n_0_[2]),
        .I2(timeout_reg_n_0_[1]),
        .I3(SL_EMPTY_N),
        .I4(sl_mode_reg[0]),
        .O(\state[1]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h00F0004400000000)) 
    \state[2]_i_11 
       (.I0(state[2]),
        .I1(\state[2]_i_13_n_0 ),
        .I2(\state[1]_i_9_n_0 ),
        .I3(state[1]),
        .I4(state[3]),
        .I5(\state[2]_i_6_n_0 ),
        .O(\state[2]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \state[2]_i_12 
       (.I0(state[4]),
        .I1(state[0]),
        .O(\state[2]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \state[2]_i_13 
       (.I0(mask[0]),
        .I1(sl_mode_reg[0]),
        .I2(mask[1]),
        .I3(sl_mode_reg[1]),
        .O(\state[2]_i_13_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFEA)) 
    \state[2]_i_2 
       (.I0(\state[2]_i_8_n_0 ),
        .I1(\cnt[15]_i_6_n_0 ),
        .I2(\state[3]_i_17_n_0 ),
        .I3(\state[3]_i_11_n_0 ),
        .I4(\state[2]_i_9_n_0 ),
        .O(\state[2]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \state[2]_i_6 
       (.I0(state[0]),
        .I1(state[4]),
        .O(\state[2]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \state[2]_i_7 
       (.I0(state[2]),
        .I1(state[3]),
        .O(\state[2]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF04000640)) 
    \state[2]_i_8 
       (.I0(state[3]),
        .I1(state[0]),
        .I2(state[1]),
        .I3(state[2]),
        .I4(state[4]),
        .I5(\state[2]_i_11_n_0 ),
        .O(\state[2]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h002A0000)) 
    \state[2]_i_9 
       (.I0(\state[4]_i_4_n_0 ),
        .I1(timeout_reg_n_0_[1]),
        .I2(timeout_reg_n_0_[2]),
        .I3(SL_PRE_FULL_N),
        .I4(SL_FULL_N),
        .O(\state[2]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h0000200020002000)) 
    \state[3]_i_10 
       (.I0(state[2]),
        .I1(state[4]),
        .I2(state[0]),
        .I3(state[1]),
        .I4(state[3]),
        .I5(\state[4]_i_5_n_0 ),
        .O(\state[3]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h0010001000100000)) 
    \state[3]_i_11 
       (.I0(state[0]),
        .I1(state[3]),
        .I2(state[4]),
        .I3(state[2]),
        .I4(SL_FULL_N),
        .I5(state[1]),
        .O(\state[3]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \state[3]_i_12 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(state[4]),
        .I3(state[3]),
        .O(\state[3]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'h1500)) 
    \state[3]_i_13 
       (.I0(sl_mode_reg[1]),
        .I1(SL_PRE_FULL_N),
        .I2(SL_FULL_N),
        .I3(\state[3]_i_12_n_0 ),
        .O(\state[3]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hFFFE000000000000)) 
    \state[3]_i_14 
       (.I0(SL_WR_N_i_12_n_0),
        .I1(SL_WR_N_i_11_n_0),
        .I2(SL_WR_N_i_10_n_0),
        .I3(SL_WR_N_i_9_n_0),
        .I4(\state[1]_i_10_n_0 ),
        .I5(\state[3]_i_22_n_0 ),
        .O(\state[3]_i_14_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00001000)) 
    \state[3]_i_15 
       (.I0(state[1]),
        .I1(state[3]),
        .I2(state[4]),
        .I3(state[0]),
        .I4(state[2]),
        .O(\state[3]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h1000500000000000)) 
    \state[3]_i_16 
       (.I0(state[1]),
        .I1(mask[0]),
        .I2(mask[1]),
        .I3(sl_mode_reg[1]),
        .I4(sl_mode_reg[0]),
        .I5(\state[0]_i_9_n_0 ),
        .O(\state[3]_i_16_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    \state[3]_i_17 
       (.I0(state[0]),
        .I1(state[4]),
        .I2(state[2]),
        .I3(state[1]),
        .O(\state[3]_i_17_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \state[3]_i_19 
       (.I0(state[2]),
        .I1(state[1]),
        .I2(state[3]),
        .I3(state[4]),
        .O(\state[3]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'h88888C8888888888)) 
    \state[3]_i_20 
       (.I0(\state[3]_i_24_n_0 ),
        .I1(\state[1]_i_8_n_0 ),
        .I2(SL_EMPTY_N),
        .I3(state[3]),
        .I4(sl_mode_reg[1]),
        .I5(sl_mode_reg[0]),
        .O(\state[3]_i_20_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \state[3]_i_22 
       (.I0(cnt_reg_n_0_[0]),
        .I1(SL_PKTEND_N_i_4_n_0),
        .I2(cnt_reg_n_0_[1]),
        .O(\state[3]_i_22_n_0 ));
  LUT5 #(
    .INIT(32'h08080888)) 
    \state[3]_i_24 
       (.I0(SL_EMPTY_N),
        .I1(state[3]),
        .I2(timeout_reg_n_0_[2]),
        .I3(timeout_reg_n_0_[0]),
        .I4(timeout_reg_n_0_[1]),
        .O(\state[3]_i_24_n_0 ));
  LUT6 #(
    .INIT(64'h80FF0000FF800000)) 
    \state[3]_i_5 
       (.I0(\fifo_sel[0]_i_5_n_0 ),
        .I1(ctl_cmd[0]),
        .I2(SL_OE_N_i_4_n_0),
        .I3(\state[4]_i_13_n_0 ),
        .I4(\state[3]_i_17_n_0 ),
        .I5(state[3]),
        .O(\state[3]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h4F)) 
    \state[3]_i_8 
       (.I0(sl_mode_reg[0]),
        .I1(\state[3]_i_22_n_0 ),
        .I2(sl_mode_reg[1]),
        .O(\state[3]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \state[3]_i_9 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(state[4]),
        .I3(state[3]),
        .O(\state[3]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00200000)) 
    \state[4]_i_10 
       (.I0(state[0]),
        .I1(state[4]),
        .I2(state[3]),
        .I3(state[1]),
        .I4(state[2]),
        .O(\state[4]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'h0002)) 
    \state[4]_i_11 
       (.I0(sl_mode_reg[1]),
        .I1(cnt_reg_n_0_[1]),
        .I2(SL_PKTEND_N_i_4_n_0),
        .I3(cnt_reg_n_0_[0]),
        .O(\state[4]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'h0002)) 
    \state[4]_i_13 
       (.I0(ctl_cmd[3]),
        .I1(ctl_cmd[1]),
        .I2(ctl_cmd[2]),
        .I3(ctl_cmd[0]),
        .O(\state[4]_i_13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00100000)) 
    \state[4]_i_14 
       (.I0(state[0]),
        .I1(state[4]),
        .I2(state[2]),
        .I3(state[1]),
        .I4(state[3]),
        .O(\state[4]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h0000404000004000)) 
    \state[4]_i_15 
       (.I0(SL_FULL_N),
        .I1(state[2]),
        .I2(state[3]),
        .I3(state[0]),
        .I4(state[4]),
        .I5(state[1]),
        .O(\state[4]_i_15_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00080000)) 
    \state[4]_i_16 
       (.I0(state[0]),
        .I1(state[4]),
        .I2(state[3]),
        .I3(state[1]),
        .I4(state[2]),
        .O(\state[4]_i_16_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \state[4]_i_18 
       (.I0(state[1]),
        .I1(SL_FULL_N),
        .O(\state[4]_i_18_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \state[4]_i_19 
       (.I0(state[1]),
        .I1(state[4]),
        .O(\state[4]_i_19_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h08000000)) 
    \state[4]_i_4 
       (.I0(state[1]),
        .I1(state[3]),
        .I2(state[4]),
        .I3(state[0]),
        .I4(state[2]),
        .O(\state[4]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFDDD)) 
    \state[4]_i_5 
       (.I0(SL_FULL_N),
        .I1(SL_PRE_FULL_N),
        .I2(timeout_reg_n_0_[2]),
        .I3(timeout_reg_n_0_[1]),
        .O(\state[4]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \state[4]_i_9 
       (.I0(state[4]),
        .I1(state[0]),
        .I2(state[3]),
        .O(\state[4]_i_9_n_0 ));
  (* FSM_ENCODED_STATES = "STA_READY:00000,STA_CMD0:00001,STA_CMD1:00010,STA_CMD2:00011,STA_PAR:00100,STA_U2F_GUARD:00101,STA_U2F:00110,STA_U2F_PRE_EMPTY_N:00111,STA_U2F_WAIT_EMPTY_N:01000,STA_U2F_END0:01001,STA_U2F_END1:01010,STA_U2F_END2:01011,STA_F2U_GUARD:01100,STA_F2U0:01101,STA_F2U:01110,STA_F2U_WAIT_FULL_N:01111,STA_F2U_WAIT_FULL:10000,STA_F2U_WAIT_EMPTY:10001,STA_F2U_WAIT:10010,STA_F2U_ZLP:10011,STA_F2U_END:10100,STA_REQ:10101" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \state_reg[0] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(p_0_in__0[0]),
        .Q(state[0]));
  (* FSM_ENCODED_STATES = "STA_READY:00000,STA_CMD0:00001,STA_CMD1:00010,STA_CMD2:00011,STA_PAR:00100,STA_U2F_GUARD:00101,STA_U2F:00110,STA_U2F_PRE_EMPTY_N:00111,STA_U2F_WAIT_EMPTY_N:01000,STA_U2F_END0:01001,STA_U2F_END1:01010,STA_U2F_END2:01011,STA_F2U_GUARD:01100,STA_F2U0:01101,STA_F2U:01110,STA_F2U_WAIT_FULL_N:01111,STA_F2U_WAIT_FULL:10000,STA_F2U_WAIT_EMPTY:10001,STA_F2U_WAIT:10010,STA_F2U_ZLP:10011,STA_F2U_END:10100,STA_REQ:10101" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \state_reg[1] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(p_0_in__0[1]),
        .Q(state[1]));
  (* FSM_ENCODED_STATES = "STA_READY:00000,STA_CMD0:00001,STA_CMD1:00010,STA_CMD2:00011,STA_PAR:00100,STA_U2F_GUARD:00101,STA_U2F:00110,STA_U2F_PRE_EMPTY_N:00111,STA_U2F_WAIT_EMPTY_N:01000,STA_U2F_END0:01001,STA_U2F_END1:01010,STA_U2F_END2:01011,STA_F2U_GUARD:01100,STA_F2U0:01101,STA_F2U:01110,STA_F2U_WAIT_FULL_N:01111,STA_F2U_WAIT_FULL:10000,STA_F2U_WAIT_EMPTY:10001,STA_F2U_WAIT:10010,STA_F2U_ZLP:10011,STA_F2U_END:10100,STA_REQ:10101" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \state_reg[2] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(p_0_in__0[2]),
        .Q(state[2]));
  (* FSM_ENCODED_STATES = "STA_READY:00000,STA_CMD0:00001,STA_CMD1:00010,STA_CMD2:00011,STA_PAR:00100,STA_U2F_GUARD:00101,STA_U2F:00110,STA_U2F_PRE_EMPTY_N:00111,STA_U2F_WAIT_EMPTY_N:01000,STA_U2F_END0:01001,STA_U2F_END1:01010,STA_U2F_END2:01011,STA_F2U_GUARD:01100,STA_F2U0:01101,STA_F2U:01110,STA_F2U_WAIT_FULL_N:01111,STA_F2U_WAIT_FULL:10000,STA_F2U_WAIT_EMPTY:10001,STA_F2U_WAIT:10010,STA_F2U_ZLP:10011,STA_F2U_END:10100,STA_REQ:10101" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \state_reg[3] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(p_0_in__0[3]),
        .Q(state[3]));
  (* FSM_ENCODED_STATES = "STA_READY:00000,STA_CMD0:00001,STA_CMD1:00010,STA_CMD2:00011,STA_PAR:00100,STA_U2F_GUARD:00101,STA_U2F:00110,STA_U2F_PRE_EMPTY_N:00111,STA_U2F_WAIT_EMPTY_N:01000,STA_U2F_END0:01001,STA_U2F_END1:01010,STA_U2F_END2:01011,STA_F2U_GUARD:01100,STA_F2U0:01101,STA_F2U:01110,STA_F2U_WAIT_FULL_N:01111,STA_F2U_WAIT_FULL:10000,STA_F2U_WAIT_EMPTY:10001,STA_F2U_WAIT:10010,STA_F2U_ZLP:10011,STA_F2U_END:10100,STA_REQ:10101" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \state_reg[4] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(p_0_in__0[4]),
        .Q(state[4]));
  LUT2 #(
    .INIT(4'hB)) 
    \timeout[2]_i_2 
       (.I0(state[0]),
        .I1(state[1]),
        .O(\timeout[2]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \timeout_reg[0] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_35),
        .Q(timeout_reg_n_0_[0]));
  FDCE #(
    .INIT(1'b0)) 
    \timeout_reg[1] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_34),
        .Q(timeout_reg_n_0_[1]));
  FDCE #(
    .INIT(1'b0)) 
    \timeout_reg[2] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u_df2u_n_33),
        .Q(timeout_reg_n_0_[2]));
  LUT2 #(
    .INIT(4'h2)) 
    \u2f_wr_data[31]_i_1 
       (.I0(fifo_sel[0]),
        .I1(fifo_sel[1]),
        .O(\u2f_wr_data[31]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \u2f_wr_data_reg[0] 
       (.C(SYS_CLK),
        .CE(\u2f_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[0]),
        .Q(u2f_wr_data[0]));
  FDCE #(
    .INIT(1'b0)) 
    \u2f_wr_data_reg[10] 
       (.C(SYS_CLK),
        .CE(\u2f_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[10]),
        .Q(u2f_wr_data[10]));
  FDCE #(
    .INIT(1'b0)) 
    \u2f_wr_data_reg[11] 
       (.C(SYS_CLK),
        .CE(\u2f_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[11]),
        .Q(u2f_wr_data[11]));
  FDCE #(
    .INIT(1'b0)) 
    \u2f_wr_data_reg[12] 
       (.C(SYS_CLK),
        .CE(\u2f_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[12]),
        .Q(u2f_wr_data[12]));
  FDCE #(
    .INIT(1'b0)) 
    \u2f_wr_data_reg[13] 
       (.C(SYS_CLK),
        .CE(\u2f_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[13]),
        .Q(u2f_wr_data[13]));
  FDCE #(
    .INIT(1'b0)) 
    \u2f_wr_data_reg[14] 
       (.C(SYS_CLK),
        .CE(\u2f_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[14]),
        .Q(u2f_wr_data[14]));
  FDCE #(
    .INIT(1'b0)) 
    \u2f_wr_data_reg[15] 
       (.C(SYS_CLK),
        .CE(\u2f_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[15]),
        .Q(u2f_wr_data[15]));
  FDCE #(
    .INIT(1'b0)) 
    \u2f_wr_data_reg[16] 
       (.C(SYS_CLK),
        .CE(\u2f_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[16]),
        .Q(u2f_wr_data[16]));
  FDCE #(
    .INIT(1'b0)) 
    \u2f_wr_data_reg[17] 
       (.C(SYS_CLK),
        .CE(\u2f_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[17]),
        .Q(u2f_wr_data[17]));
  FDCE #(
    .INIT(1'b0)) 
    \u2f_wr_data_reg[18] 
       (.C(SYS_CLK),
        .CE(\u2f_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[18]),
        .Q(u2f_wr_data[18]));
  FDCE #(
    .INIT(1'b0)) 
    \u2f_wr_data_reg[19] 
       (.C(SYS_CLK),
        .CE(\u2f_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[19]),
        .Q(u2f_wr_data[19]));
  FDCE #(
    .INIT(1'b0)) 
    \u2f_wr_data_reg[1] 
       (.C(SYS_CLK),
        .CE(\u2f_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[1]),
        .Q(u2f_wr_data[1]));
  FDCE #(
    .INIT(1'b0)) 
    \u2f_wr_data_reg[20] 
       (.C(SYS_CLK),
        .CE(\u2f_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[20]),
        .Q(u2f_wr_data[20]));
  FDCE #(
    .INIT(1'b0)) 
    \u2f_wr_data_reg[21] 
       (.C(SYS_CLK),
        .CE(\u2f_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[21]),
        .Q(u2f_wr_data[21]));
  FDCE #(
    .INIT(1'b0)) 
    \u2f_wr_data_reg[22] 
       (.C(SYS_CLK),
        .CE(\u2f_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[22]),
        .Q(u2f_wr_data[22]));
  FDCE #(
    .INIT(1'b0)) 
    \u2f_wr_data_reg[23] 
       (.C(SYS_CLK),
        .CE(\u2f_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[23]),
        .Q(u2f_wr_data[23]));
  FDCE #(
    .INIT(1'b0)) 
    \u2f_wr_data_reg[24] 
       (.C(SYS_CLK),
        .CE(\u2f_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[24]),
        .Q(u2f_wr_data[24]));
  FDCE #(
    .INIT(1'b0)) 
    \u2f_wr_data_reg[25] 
       (.C(SYS_CLK),
        .CE(\u2f_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[25]),
        .Q(u2f_wr_data[25]));
  FDCE #(
    .INIT(1'b0)) 
    \u2f_wr_data_reg[26] 
       (.C(SYS_CLK),
        .CE(\u2f_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[26]),
        .Q(u2f_wr_data[26]));
  FDCE #(
    .INIT(1'b0)) 
    \u2f_wr_data_reg[27] 
       (.C(SYS_CLK),
        .CE(\u2f_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[27]),
        .Q(u2f_wr_data[27]));
  FDCE #(
    .INIT(1'b0)) 
    \u2f_wr_data_reg[28] 
       (.C(SYS_CLK),
        .CE(\u2f_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[28]),
        .Q(u2f_wr_data[28]));
  FDCE #(
    .INIT(1'b0)) 
    \u2f_wr_data_reg[29] 
       (.C(SYS_CLK),
        .CE(\u2f_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[29]),
        .Q(u2f_wr_data[29]));
  FDCE #(
    .INIT(1'b0)) 
    \u2f_wr_data_reg[2] 
       (.C(SYS_CLK),
        .CE(\u2f_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[2]),
        .Q(u2f_wr_data[2]));
  FDCE #(
    .INIT(1'b0)) 
    \u2f_wr_data_reg[30] 
       (.C(SYS_CLK),
        .CE(\u2f_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[30]),
        .Q(u2f_wr_data[30]));
  FDCE #(
    .INIT(1'b0)) 
    \u2f_wr_data_reg[31] 
       (.C(SYS_CLK),
        .CE(\u2f_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[31]),
        .Q(u2f_wr_data[31]));
  FDCE #(
    .INIT(1'b0)) 
    \u2f_wr_data_reg[3] 
       (.C(SYS_CLK),
        .CE(\u2f_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[3]),
        .Q(u2f_wr_data[3]));
  FDCE #(
    .INIT(1'b0)) 
    \u2f_wr_data_reg[4] 
       (.C(SYS_CLK),
        .CE(\u2f_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[4]),
        .Q(u2f_wr_data[4]));
  FDCE #(
    .INIT(1'b0)) 
    \u2f_wr_data_reg[5] 
       (.C(SYS_CLK),
        .CE(\u2f_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[5]),
        .Q(u2f_wr_data[5]));
  FDCE #(
    .INIT(1'b0)) 
    \u2f_wr_data_reg[6] 
       (.C(SYS_CLK),
        .CE(\u2f_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[6]),
        .Q(u2f_wr_data[6]));
  FDCE #(
    .INIT(1'b0)) 
    \u2f_wr_data_reg[7] 
       (.C(SYS_CLK),
        .CE(\u2f_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[7]),
        .Q(u2f_wr_data[7]));
  FDCE #(
    .INIT(1'b0)) 
    \u2f_wr_data_reg[8] 
       (.C(SYS_CLK),
        .CE(\u2f_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[8]),
        .Q(u2f_wr_data[8]));
  FDCE #(
    .INIT(1'b0)) 
    \u2f_wr_data_reg[9] 
       (.C(SYS_CLK),
        .CE(\u2f_wr_data[31]_i_1_n_0 ),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(SL_DT_I[9]),
        .Q(u2f_wr_data[9]));
  LUT3 #(
    .INIT(8'h10)) 
    u2f_wr_valid_i_1
       (.I0(SL_RD_N1),
        .I1(fifo_sel[1]),
        .I2(fifo_sel[0]),
        .O(u2f_wr_valid_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    u2f_wr_valid_reg
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(u2f_wr_valid_i_1_n_0),
        .Q(u2f_wr_valid));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_gpif2mst_async__xdcDup__1 u_cu2f
       (.ACLK(ACLK),
        .CMD1__2(CMD1__2),
        .Q(cmd_wr_data),
        .SL_FLAGA(u_cu2f_n_38),
        .SL_OE_N_reg(SL_RD_N_i_2_n_0),
        .SL_OE_N_reg_0(SL_OE_N_i_3_n_0),
        .SL_OE_N_reg_1(mask[0]),
        .SL_OE_N_reg_2(sl_mode_reg),
        .SL_RST_N(SL_RST_N),
        .SYS_CLK(SYS_CLK),
        .SYS_CLK_STABLE(SYS_CLK_STABLE),
        .axis_prog_full(cmd_wr_fullN),
        .cmd_rd_data(cmd_rd_data),
        .cmd_rd_ready(cmd_rd_ready),
        .cmd_rd_valid(cmd_rd_valid),
        .cnt_reg(\timeout[2]_i_2_n_0 ),
        .\cnt_reg[0]_0 (SL_EMPTY_N),
        .\cnt_reg[0]_1 (\SL_DT_O[29]_i_2_n_0 ),
        .\cnt_reg[0]_2 (SL_WR_N_i_7_n_0),
        .out(transactor_sel),
        .s_aresetn(SYS_RST_N),
        .s_axis_tvalid(cmd_wr_valid),
        .sl_oe_n_reg_reg(state),
        .sl_oe_n_reg_reg_0(sl_oe_n_reg),
        .sl_oe_n_reg_reg_1(sl_oe_n_reg_i_3_n_0),
        .sl_oe_n_reg_reg_2(\cnt[15]_i_13_n_0 ),
        .sl_oe_n_reg_reg_3(sl_oe_n_reg_i_4_n_0),
        .sl_rd_n_reg_i_4_0(fifo_sel),
        .sl_rd_n_reg_i_4_1(u2f_wr_fullN),
        .sl_rd_n_reg_reg(sl_rd_n_reg),
        .sl_rd_n_reg_reg_0(sl_rd_n_reg_i_5_n_0),
        .state_reg({u_cu2f_n_37,NLW_u_cu2f_state_reg_UNCONNECTED[3],u_cu2f_n_36,u_cu2f_n_39}));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_gpif2mst_async__parameterized0 u_df2u
       (.ACLK(ACLK),
        .D({u_df2u_n_1,u_df2u_n_2,u_df2u_n_3,u_df2u_n_4,u_df2u_n_5,u_df2u_n_6,u_df2u_n_7,u_df2u_n_8,u_df2u_n_9,u_df2u_n_10,u_df2u_n_11,u_df2u_n_12,u_df2u_n_13,u_df2u_n_14,u_df2u_n_15,u_df2u_n_16,u_df2u_n_17,u_df2u_n_18,u_df2u_n_19,u_df2u_n_20,u_df2u_n_21,u_df2u_n_22,u_df2u_n_23,u_df2u_n_24,u_df2u_n_25,u_df2u_n_26,u_df2u_n_27,u_df2u_n_28,u_df2u_n_29,u_df2u_n_30,u_df2u_n_31,u_df2u_n_32}),
        .E(u_df2u_n_41),
        .Q(cnt_reg_n_0_[1:0]),
        .SL_DT_O_reg({\SL_DT_O[29]_i_3_n_0 ,u2f_wr_full,reg_clk,\SL_DT_O[26]_i_2_n_0 ,\SL_DT_O[25]_i_2_n_0 ,NLW_u_df2u_SL_DT_O_reg_UNCONNECTED[24:23],\SL_DT_O[28]_i_2_n_0 ,NLW_u_df2u_SL_DT_O_reg_UNCONNECTED[21],\SL_DT_O[29]_i_5_n_0 ,NLW_u_df2u_SL_DT_O_reg_UNCONNECTED[19:10],\SL_DT_O[29]_i_2_n_0 }),
        .\SL_DT_O_reg[25]_0 (\SL_DT_O[25]_i_3_n_0 ),
        .\SL_DT_O_reg[26]_0 (\SL_DT_O[26]_i_3_n_0 ),
        .\SL_DT_O_reg[29]_0 (\SL_DT_O[29]_i_4_n_0 ),
        .\SL_DT_O_reg[9]_0 (SL_PKTEND_N_i_4_n_0),
        .\SL_DT_O_reg[9]_1 (\SL_DT_O[9]_i_2_n_0 ),
        .SL_FLAGA(u_df2u_n_42),
        .SL_FLAGD(p_0_in__0),
        .SL_PKTEND_N_reg(SL_WR_N_i_4_n_0),
        .SL_PKTEND_N_reg_0(SL_PKTEND_N_i_5_n_0),
        .SYS_CLK(SYS_CLK),
        .SYS_RST_N(SYS_RST_N),
        .axis_prog_full(cmd_wr_fullN),
        .cnt_reg(u_cu2f_n_38),
        .\cnt_reg[0]_0 (\cnt[15]_i_4_n_0 ),
        .\cnt_reg[0]_1 (\cnt[15]_i_5_n_0 ),
        .\cnt_reg[0]_2 (\cnt[15]_i_6_n_0 ),
        .\cnt_reg[0]_3 (\cnt[15]_i_12_n_0 ),
        .\cnt_reg[0]_4 (SL_PRE_FULL_N),
        .\cnt_reg[0]_5 (\cnt[15]_i_13_n_0 ),
        .f2u_wr_ready(f2u_wr_ready),
        .f2u_wr_valid(f2u_wr_valid),
        .out(state),
        .rd_dout(rd_dout),
        .sl_pktend_n_reg_reg(sl_pktend_n_reg),
        .sl_pktend_n_reg_reg_0(SL_FULL_N),
        .sl_pktend_n_reg_reg_1(sl_pktend_n_reg_i_8_n_0),
        .sl_pktend_n_reg_reg_2(sl_pktend_n_reg_i_7_n_0),
        .sl_wr_n_reg_reg(u_df2u_n_36),
        .sl_wr_n_reg_reg_0(sl_wr_n_reg),
        .sl_wr_n_reg_reg_1(sl_wr_n_reg_i_5_n_0),
        .sl_wr_n_reg_reg_2(sl_pktend_n_reg_i_5_n_0),
        .sl_wr_n_reg_reg_3(SL_WR_N_i_7_n_0),
        .\state[0]_i_2_0 (\state[3]_i_17_n_0 ),
        .\state[0]_i_4_0 (\state[0]_i_16_n_0 ),
        .\state[0]_i_5_0 (SL_OE_N_i_4_n_0),
        .\state[0]_i_5_1 (ctl_cmd[0]),
        .\state[0]_i_5_2 (\fifo_sel[0]_i_5_n_0 ),
        .\state[2]_i_3_0 (\state[2]_i_12_n_0 ),
        .\state[3]_i_4_0 (SL_WR_N_i_9_n_0),
        .\state[3]_i_4_1 (SL_WR_N_i_10_n_0),
        .\state[3]_i_4_2 (SL_WR_N_i_11_n_0),
        .\state[3]_i_4_3 (SL_WR_N_i_12_n_0),
        .\state[4]_i_6_0 (\state[4]_i_18_n_0 ),
        .\state[4]_i_6_1 (\state[0]_i_10_n_0 ),
        .\state[4]_i_7_0 (\state[4]_i_19_n_0 ),
        .state_reg_bb4(u_df2u_n_38),
        .state_reg_bb3(u_df2u_n_33),
        .state_reg_bb2(\state[2]_i_2_n_0 ),
        .state_reg_bb1(u_df2u_n_34),
        .state_reg_bb0(\state[0]_i_3_n_0 ),
        .\state_reg[0]_0 (\state[0]_i_6_n_0 ),
        .\state_reg[0]_1 (SL_EMPTY_N),
        .\state_reg[0]_2 (SL_RD_N_i_4_n_0),
        .\state_reg[0]_3 (\state[0]_i_9_n_0 ),
        .\state_reg[0]_4 (SL_PRE_EMPTY_N),
        .\state_reg[0]_5 (\state[0]_i_8_n_0 ),
        .\state_reg[0]_6 (u_du2f_n_35),
        .\state_reg[0]_7 (\state[0]_i_11_n_0 ),
        .\state_reg[0]_8 (\state[4]_i_9_n_0 ),
        .\state_reg[0]_9 (\state[1]_i_13_n_0 ),
        .\state_reg[1]_0 (u_df2u_n_35),
        .\state_reg[1]_1 (u_df2u_n_39),
        .\state_reg[1]_10 (\state[1]_i_14_n_0 ),
        .\state_reg[1]_11 (\state[2]_i_9_n_0 ),
        .\state_reg[1]_12 (\state[1]_i_12_n_0 ),
        .\state_reg[1]_2 (u_df2u_n_40),
        .\state_reg[1]_3 (u_du2f_n_53),
        .\state_reg[1]_4 (\state[1]_i_8_n_0 ),
        .\state_reg[1]_5 (\state[1]_i_9_n_0 ),
        .\state_reg[1]_6 (\state[1]_i_10_n_0 ),
        .\state_reg[1]_7 (\state[1]_i_11_n_0 ),
        .\state_reg[1]_8 (\state[3]_i_12_n_0 ),
        .\state_reg[1]_9 (\state[1]_i_16_n_0 ),
        .\state_reg[2]_0 (u_du2f_n_54),
        .\state_reg[2]_1 (\state[2]_i_6_n_0 ),
        .\state_reg[2]_2 (\state[2]_i_7_n_0 ),
        .\state_reg[2]_3 (sl_mode_reg),
        .\state_reg[2]_4 (\state[3]_i_22_n_0 ),
        .\state_reg[3]_0 (u_df2u_n_37),
        .\state_reg[3]_1 (\state[3]_i_5_n_0 ),
        .\state_reg[3]_10 (\state[3]_i_11_n_0 ),
        .\state_reg[3]_2 (u_du2f_n_55),
        .\state_reg[3]_3 (\state[3]_i_13_n_0 ),
        .\state_reg[3]_4 (\state[3]_i_14_n_0 ),
        .\state_reg[3]_5 (\state[3]_i_15_n_0 ),
        .\state_reg[3]_6 (\state[3]_i_16_n_0 ),
        .\state_reg[3]_7 (\state[3]_i_8_n_0 ),
        .\state_reg[3]_8 (\state[3]_i_9_n_0 ),
        .\state_reg[3]_9 (\state[3]_i_10_n_0 ),
        .\state_reg[4]_0 (u_df2u_n_43),
        .\state_reg[4]_1 (u_df2u_n_44),
        .\state_reg[4]_10 (\state[4]_i_10_n_0 ),
        .\state_reg[4]_2 (state),
        .\state_reg[4]_3 (\state[4]_i_4_n_0 ),
        .\state_reg[4]_4 (\state[4]_i_5_n_0 ),
        .\state_reg[4]_5 (\state[4]_i_13_n_0 ),
        .\state_reg[4]_6 (\state[4]_i_14_n_0 ),
        .\state_reg[4]_7 (\state[4]_i_11_n_0 ),
        .\state_reg[4]_8 (\state[4]_i_15_n_0 ),
        .\state_reg[4]_9 (\state[4]_i_16_n_0 ),
        .timeout_reg(\timeout[2]_i_2_n_0 ),
        .\timeout_reg[2]_0 (timeout_reg_n_0_[1]),
        .\timeout_reg[2]_1 (timeout_reg_n_0_[0]),
        .\timeout_reg[2]_2 (timeout_reg_n_0_[2]));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_gpif2mst_async u_du2f
       (.ACLK(ACLK),
        .BREADY1__0(BREADY1__0),
        .D({u_du2f_n_37,u_du2f_n_38,u_du2f_n_39,u_du2f_n_40,u_du2f_n_41,u_du2f_n_42,u_du2f_n_43,u_du2f_n_44,u_du2f_n_45,u_du2f_n_46,u_du2f_n_47,u_du2f_n_48,u_du2f_n_49,u_du2f_n_50,u_du2f_n_51,u_du2f_n_52}),
        .Q(u2f_wr_data),
        .SL_RD_N_reg(cmd_wr_fullN),
        .SL_RD_N_reg_0(SL_EMPTY_N),
        .SL_RD_N_reg_1(SL_RD_N_i_2_n_0),
        .SL_RD_N_reg_2(SL_RD_N_i_4_n_0),
        .SYS_CLK(SYS_CLK),
        .SYS_RST_N(SYS_RST_N),
        .axis_prog_full(u2f_wr_fullN),
        .fifo_sel_reg(u_du2f_n_35),
        .in0(u2f_wr_full),
        .out(fifo_sel),
        .\pushed_reg[0] (state),
        .\pushed_reg[15] (pushed),
        .s_axis_tvalid(u2f_wr_valid),
        .sl_mode_reg_reg(u_du2f_n_55),
        .state_reg_bb3(\state[3]_i_19_n_0 ),
        .state_reg_bb2(u_du2f_n_54),
        .state_reg_bb1(u_du2f_n_53),
        .state_reg_bb0(u_du2f_n_56),
        .\state_reg[1]_0 (SL_WR_N_i_7_n_0),
        .\state_reg[1]_1 (state),
        .\state_reg[2]_0 (\state[0]_i_6_n_0 ),
        .\state_reg[2]_1 (sl_mode_reg[1]),
        .\state_reg[3]_0 (\state[3]_i_20_n_0 ),
        .u2f_rd_data(u2f_rd_data),
        .u2f_rd_ready(u2f_rd_ready),
        .u2f_rd_valid(u2f_rd_valid));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \written[0]_i_1 
       (.I0(\written[15]_i_3_n_0 ),
        .I1(\written_reg[3]_i_2_n_7 ),
        .O(\written[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \written[10]_i_1 
       (.I0(\written_reg[11]_i_2_n_5 ),
        .I1(\written[15]_i_3_n_0 ),
        .O(\written[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \written[11]_i_1 
       (.I0(\written_reg[11]_i_2_n_4 ),
        .I1(\written[15]_i_3_n_0 ),
        .O(\written[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \written[12]_i_1 
       (.I0(\written_reg[15]_i_2_n_7 ),
        .I1(\written[15]_i_3_n_0 ),
        .O(\written[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \written[13]_i_1 
       (.I0(\written_reg[15]_i_2_n_6 ),
        .I1(\written[15]_i_3_n_0 ),
        .O(\written[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \written[14]_i_1 
       (.I0(\written[15]_i_3_n_0 ),
        .I1(\written_reg[15]_i_2_n_5 ),
        .O(\written[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \written[15]_i_1 
       (.I0(\written_reg[15]_i_2_n_4 ),
        .I1(\written[15]_i_3_n_0 ),
        .O(\written[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000001FFFFFFFF)) 
    \written[15]_i_3 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(state[4]),
        .I3(state[2]),
        .I4(state[3]),
        .I5(sl_pktend_n_reg),
        .O(\written[15]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \written[1]_i_1 
       (.I0(\written[15]_i_3_n_0 ),
        .I1(\written_reg[3]_i_2_n_6 ),
        .O(\written[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \written[2]_i_1 
       (.I0(\written[15]_i_3_n_0 ),
        .I1(\written_reg[3]_i_2_n_5 ),
        .O(\written[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \written[3]_i_1 
       (.I0(\written[15]_i_3_n_0 ),
        .I1(\written_reg[3]_i_2_n_4 ),
        .O(\written[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \written[3]_i_3 
       (.I0(written[0]),
        .I1(sl_wr_n_reg),
        .O(\written[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \written[4]_i_1 
       (.I0(\written[15]_i_3_n_0 ),
        .I1(\written_reg[7]_i_2_n_7 ),
        .O(\written[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \written[5]_i_1 
       (.I0(\written[15]_i_3_n_0 ),
        .I1(\written_reg[7]_i_2_n_6 ),
        .O(\written[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \written[6]_i_1 
       (.I0(\written[15]_i_3_n_0 ),
        .I1(\written_reg[7]_i_2_n_5 ),
        .O(\written[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \written[7]_i_1 
       (.I0(\written_reg[7]_i_2_n_4 ),
        .I1(\written[15]_i_3_n_0 ),
        .O(\written[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \written[8]_i_1 
       (.I0(\written_reg[11]_i_2_n_7 ),
        .I1(\written[15]_i_3_n_0 ),
        .O(\written[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \written[9]_i_1 
       (.I0(\written_reg[11]_i_2_n_6 ),
        .I1(\written[15]_i_3_n_0 ),
        .O(\written[9]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \written_reg[0] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\written[0]_i_1_n_0 ),
        .Q(written[0]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \written_reg[10] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\written[10]_i_1_n_0 ),
        .Q(written[10]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \written_reg[11] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\written[11]_i_1_n_0 ),
        .Q(written[11]));
  CARRY4 \written_reg[11]_i_2 
       (.CI(\written_reg[7]_i_2_n_0 ),
        .CO({\written_reg[11]_i_2_n_0 ,\written_reg[11]_i_2_n_1 ,\written_reg[11]_i_2_n_2 ,\written_reg[11]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\written_reg[11]_i_2_n_4 ,\written_reg[11]_i_2_n_5 ,\written_reg[11]_i_2_n_6 ,\written_reg[11]_i_2_n_7 }),
        .S(written[11:8]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \written_reg[12] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\written[12]_i_1_n_0 ),
        .Q(written[12]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \written_reg[13] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\written[13]_i_1_n_0 ),
        .Q(written[13]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \written_reg[14] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\written[14]_i_1_n_0 ),
        .Q(written[14]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \written_reg[15] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\written[15]_i_1_n_0 ),
        .Q(written[15]));
  CARRY4 \written_reg[15]_i_2 
       (.CI(\written_reg[11]_i_2_n_0 ),
        .CO({\NLW_written_reg[15]_i_2_CO_UNCONNECTED [3],\written_reg[15]_i_2_n_1 ,\written_reg[15]_i_2_n_2 ,\written_reg[15]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\written_reg[15]_i_2_n_4 ,\written_reg[15]_i_2_n_5 ,\written_reg[15]_i_2_n_6 ,\written_reg[15]_i_2_n_7 }),
        .S(written[15:12]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \written_reg[1] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\written[1]_i_1_n_0 ),
        .Q(written[1]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \written_reg[2] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\written[2]_i_1_n_0 ),
        .Q(written[2]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \written_reg[3] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\written[3]_i_1_n_0 ),
        .Q(written[3]));
  CARRY4 \written_reg[3]_i_2 
       (.CI(1'b0),
        .CO({\written_reg[3]_i_2_n_0 ,\written_reg[3]_i_2_n_1 ,\written_reg[3]_i_2_n_2 ,\written_reg[3]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,written[0]}),
        .O({\written_reg[3]_i_2_n_4 ,\written_reg[3]_i_2_n_5 ,\written_reg[3]_i_2_n_6 ,\written_reg[3]_i_2_n_7 }),
        .S({written[3:1],\written[3]_i_3_n_0 }));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \written_reg[4] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\written[4]_i_1_n_0 ),
        .Q(written[4]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \written_reg[5] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\written[5]_i_1_n_0 ),
        .Q(written[5]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \written_reg[6] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\written[6]_i_1_n_0 ),
        .Q(written[6]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \written_reg[7] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\written[7]_i_1_n_0 ),
        .Q(written[7]));
  CARRY4 \written_reg[7]_i_2 
       (.CI(\written_reg[3]_i_2_n_0 ),
        .CO({\written_reg[7]_i_2_n_0 ,\written_reg[7]_i_2_n_1 ,\written_reg[7]_i_2_n_2 ,\written_reg[7]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\written_reg[7]_i_2_n_4 ,\written_reg[7]_i_2_n_5 ,\written_reg[7]_i_2_n_6 ,\written_reg[7]_i_2_n_7 }),
        .S(written[7:4]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \written_reg[8] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\written[8]_i_1_n_0 ),
        .Q(written[8]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \written_reg[9] 
       (.C(SYS_CLK),
        .CE(1'b1),
        .CLR(\SL_AD[1]_i_2_n_0 ),
        .D(\written[9]_i_1_n_0 ),
        .Q(written[9]));
endmodule

(* CHECK_LICENSE_TYPE = "gpif2mst_async_32x512,fifo_generator_v13_2_5,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* ORIG_REF_NAME = "gpif2mst_async_32x512" *) 
(* X_CORE_INFO = "fifo_generator_v13_2_5,Vivado 2019.2" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512
   (axis_prog_empty,
    axis_prog_full,
    m_aclk,
    m_axis_tready,
    m_axis_tvalid,
    s_aclk,
    s_aresetn,
    s_axis_tready,
    s_axis_tvalid,
    axis_rd_data_count,
    axis_wr_data_count,
    m_axis_tdata,
    s_axis_tdata);
  output axis_prog_empty;
  output axis_prog_full;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 master_aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME master_aclk, ASSOCIATED_BUSIF M_AXIS:M_AXI, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input m_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *) input m_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *) output m_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 slave_aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME slave_aclk, ASSOCIATED_BUSIF S_AXIS:S_AXI, ASSOCIATED_RESET s_aresetn, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input s_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 slave_aresetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME slave_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *) output s_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *) input s_axis_tvalid;
  output [9:0]axis_rd_data_count;
  output [9:0]axis_wr_data_count;
  output [31:0]m_axis_tdata;
  input [31:0]s_axis_tdata;

  wire axis_prog_empty;
  wire axis_prog_full;
  wire [9:0]axis_rd_data_count;
  wire [9:0]axis_wr_data_count;
  wire m_aclk;
  wire [31:0]m_axis_tdata;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire s_aclk;
  wire s_aresetn;
  wire [31:0]s_axis_tdata;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_empty_UNCONNECTED;
  wire NLW_U0_full_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_rd_rst_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire NLW_U0_wr_rst_busy_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [9:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [9:0]NLW_U0_data_count_UNCONNECTED;
  wire [17:0]NLW_U0_dout_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [9:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [9:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "32" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "4" *) 
  (* C_AXIS_TSTRB_WIDTH = "4" *) 
  (* C_AXIS_TUSER_WIDTH = "1" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "10" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "18" *) 
  (* C_DIN_WIDTH_AXIS = "32" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "32" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "18" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_FULL_FLAGS_RST_VAL = "1" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "0" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "1" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "1" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "0" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "11" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "12" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "11" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "12" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "11" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "12" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "1" *) 
  (* C_MEMORY_TYPE = "1" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "1" *) 
  (* C_PRELOAD_REGS = "0" *) 
  (* C_PRIM_FIFO_TYPE = "4kx4" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "2" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "4" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "13" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1021" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "13" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1021" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "13" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "3" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "1" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "1022" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "508" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "15" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "15" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "15" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "1021" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "1" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "10" *) 
  (* C_RD_DEPTH = "1024" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "10" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "10" *) 
  (* C_WR_DEPTH = "1024" *) 
  (* C_WR_DEPTH_AXIS = "512" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "10" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "9" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_fifo_generator_v13_2_5 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[9:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(axis_prog_empty),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(axis_prog_full),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(axis_rd_data_count),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(axis_wr_data_count),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(1'b0),
        .data_count(NLW_U0_data_count_UNCONNECTED[9:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dout(NLW_U0_dout_UNCONNECTED[17:0]),
        .empty(NLW_U0_empty_UNCONNECTED),
        .full(NLW_U0_full_UNCONNECTED),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(m_aclk),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[3:0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(m_axis_tready),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[3:0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[0]),
        .m_axis_tvalid(m_axis_tvalid),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(1'b0),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[9:0]),
        .rd_en(1'b0),
        .rd_rst(1'b0),
        .rd_rst_busy(NLW_U0_rd_rst_busy_UNCONNECTED),
        .rst(1'b0),
        .s_aclk(s_aclk),
        .s_aclk_en(1'b0),
        .s_aresetn(s_aresetn),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tlast(1'b0),
        .s_axis_tready(s_axis_tready),
        .s_axis_tstrb({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tuser(1'b0),
        .s_axis_tvalid(s_axis_tvalid),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(1'b0),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[9:0]),
        .wr_en(1'b0),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
endmodule

(* CHECK_LICENSE_TYPE = "gpif2mst_async_32x512,fifo_generator_v13_2_5,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* ORIG_REF_NAME = "gpif2mst_async_32x512" *) 
(* X_CORE_INFO = "fifo_generator_v13_2_5,Vivado 2019.2" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_HD1
   (axis_prog_empty,
    axis_prog_full,
    m_aclk,
    m_axis_tready,
    m_axis_tvalid,
    s_aclk,
    s_aresetn,
    s_axis_tready,
    s_axis_tvalid,
    axis_rd_data_count,
    axis_wr_data_count,
    m_axis_tdata,
    s_axis_tdata);
  output axis_prog_empty;
  output axis_prog_full;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 master_aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME master_aclk, ASSOCIATED_BUSIF M_AXIS:M_AXI, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input m_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *) input m_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *) output m_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 slave_aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME slave_aclk, ASSOCIATED_BUSIF S_AXIS:S_AXI, ASSOCIATED_RESET s_aresetn, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input s_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 slave_aresetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME slave_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *) output s_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *) input s_axis_tvalid;
  output [9:0]axis_rd_data_count;
  output [9:0]axis_wr_data_count;
  output [31:0]m_axis_tdata;
  input [31:0]s_axis_tdata;

  wire axis_prog_empty;
  wire axis_prog_full;
  wire [9:0]axis_rd_data_count;
  wire [9:0]axis_wr_data_count;
  wire m_aclk;
  wire [31:0]m_axis_tdata;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire s_aclk;
  wire s_aresetn;
  wire [31:0]s_axis_tdata;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_empty_UNCONNECTED;
  wire NLW_U0_full_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_rd_rst_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire NLW_U0_wr_rst_busy_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [9:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [9:0]NLW_U0_data_count_UNCONNECTED;
  wire [17:0]NLW_U0_dout_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [9:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [9:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "32" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "4" *) 
  (* C_AXIS_TSTRB_WIDTH = "4" *) 
  (* C_AXIS_TUSER_WIDTH = "1" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "10" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "18" *) 
  (* C_DIN_WIDTH_AXIS = "32" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "32" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "18" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_FULL_FLAGS_RST_VAL = "1" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "0" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "1" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "1" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "0" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "11" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "12" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "11" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "12" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "11" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "12" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "1" *) 
  (* C_MEMORY_TYPE = "1" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "1" *) 
  (* C_PRELOAD_REGS = "0" *) 
  (* C_PRIM_FIFO_TYPE = "4kx4" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "2" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "4" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "13" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1021" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "13" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1021" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "13" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "3" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "1" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "1022" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "508" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "15" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "15" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "15" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "1021" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "1" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "10" *) 
  (* C_RD_DEPTH = "1024" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "10" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "10" *) 
  (* C_WR_DEPTH = "1024" *) 
  (* C_WR_DEPTH_AXIS = "512" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "10" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "9" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_fifo_generator_v13_2_5 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[9:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(axis_prog_empty),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(axis_prog_full),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(axis_rd_data_count),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(axis_wr_data_count),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(1'b0),
        .data_count(NLW_U0_data_count_UNCONNECTED[9:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dout(NLW_U0_dout_UNCONNECTED[17:0]),
        .empty(NLW_U0_empty_UNCONNECTED),
        .full(NLW_U0_full_UNCONNECTED),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(m_aclk),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[3:0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(m_axis_tready),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[3:0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[0]),
        .m_axis_tvalid(m_axis_tvalid),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(1'b0),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[9:0]),
        .rd_en(1'b0),
        .rd_rst(1'b0),
        .rd_rst_busy(NLW_U0_rd_rst_busy_UNCONNECTED),
        .rst(1'b0),
        .s_aclk(s_aclk),
        .s_aclk_en(1'b0),
        .s_aresetn(s_aresetn),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tlast(1'b0),
        .s_axis_tready(s_axis_tready),
        .s_axis_tstrb({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tuser(1'b0),
        .s_axis_tvalid(s_axis_tvalid),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(1'b0),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[9:0]),
        .wr_en(1'b0),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_generic_cstr" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_blk_mem_gen_generic_cstr
   (ENB_I,
    ENB_dly_D,
    m_aclk,
    out,
    s_aclk,
    s_axis_tvalid,
    D,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    E,
    Q,
    s_axis_tdata);
  input ENB_I;
  output ENB_dly_D;
  input m_aclk;
  input out;
  input s_aclk;
  input s_axis_tvalid;
  output [31:0]D;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  input [0:0]E;
  input [8:0]Q;
  input [31:0]s_axis_tdata;

  wire [31:0]D;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  wire [0:0]E;
  wire ENB_I;
  wire ENB_dly_D;
  wire [8:0]Q;
  wire m_aclk;
  wire out;
  wire s_aclk;
  wire [31:0]s_axis_tdata;
  wire s_axis_tvalid;

  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_blk_mem_gen_prim_width \ramloop[0].ram.r 
       (.D(D),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ),
        .E(E),
        .ENB_I(ENB_I),
        .ENB_dly_D(ENB_dly_D),
        .Q(Q),
        .m_aclk(m_aclk),
        .out(out),
        .s_aclk(s_aclk),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_blk_mem_gen_prim_width
   (ENB_I,
    ENB_dly_D,
    m_aclk,
    out,
    s_aclk,
    s_axis_tvalid,
    D,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    E,
    Q,
    s_axis_tdata);
  input ENB_I;
  output ENB_dly_D;
  input m_aclk;
  input out;
  input s_aclk;
  input s_axis_tvalid;
  output [31:0]D;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  input [0:0]E;
  input [8:0]Q;
  input [31:0]s_axis_tdata;

  wire [31:0]D;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  wire [0:0]E;
  wire ENA_dly_D;
  wire ENB_I;
  wire ENB_dly;
  wire ENB_dly_D;
  wire POR_A0;
  wire POR_B;
  wire POR_B0;
  wire [8:0]Q;
  wire [4:0]RSTA_SHFT_REG;
  wire [4:0]RSTB_SHFT_REG;
  wire \SAFETY_CKT_GEN.ENA_NO_REG.ENA_dly_reg_srl2_n_0 ;
  wire \SAFETY_CKT_GEN.RSTA_SHFT_REG_reg[3]_srl3_n_0 ;
  wire \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[3]_srl3_n_0 ;
  wire m_aclk;
  wire out;
  wire s_aclk;
  wire [31:0]s_axis_tdata;
  wire s_axis_tvalid;

  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.ENA_NO_REG.ENA_dly_D_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\SAFETY_CKT_GEN.ENA_NO_REG.ENA_dly_reg_srl2_n_0 ),
        .Q(ENA_dly_D),
        .R(1'b0));
  (* srl_bus_name = "U0/\inst_fifo_gen/gaxis_fifo.gaxisf.axisf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop " *) 
  (* srl_name = "U0/\inst_fifo_gen/gaxis_fifo.gaxisf.axisf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/SAFETY_CKT_GEN.ENA_NO_REG.ENA_dly_reg_srl2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SAFETY_CKT_GEN.ENA_NO_REG.ENA_dly_reg_srl2 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(s_aclk),
        .D(POR_A0),
        .Q(\SAFETY_CKT_GEN.ENA_NO_REG.ENA_dly_reg_srl2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \SAFETY_CKT_GEN.ENA_NO_REG.ENA_dly_reg_srl2_i_1 
       (.I0(RSTA_SHFT_REG[0]),
        .I1(RSTA_SHFT_REG[4]),
        .O(POR_A0));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.ENB_NO_REG.ENB_dly_D_reg 
       (.C(m_aclk),
        .CE(1'b1),
        .D(ENB_dly),
        .Q(ENB_dly_D),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.ENB_NO_REG.ENB_dly_reg 
       (.C(m_aclk),
        .CE(1'b1),
        .D(POR_B),
        .Q(ENB_dly),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \SAFETY_CKT_GEN.POR_B_i_1 
       (.I0(RSTB_SHFT_REG[0]),
        .I1(RSTB_SHFT_REG[4]),
        .O(POR_B0));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.POR_B_reg 
       (.C(m_aclk),
        .CE(1'b1),
        .D(POR_B0),
        .Q(POR_B),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.RSTA_SHFT_REG_reg[0] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(1'b1),
        .Q(RSTA_SHFT_REG[0]),
        .R(1'b0));
  (* srl_bus_name = "U0/\inst_fifo_gen/gaxis_fifo.gaxisf.axisf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/SAFETY_CKT_GEN.RSTA_SHFT_REG_reg " *) 
  (* srl_name = "U0/\inst_fifo_gen/gaxis_fifo.gaxisf.axisf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/SAFETY_CKT_GEN.RSTA_SHFT_REG_reg[3]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SAFETY_CKT_GEN.RSTA_SHFT_REG_reg[3]_srl3 
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(s_aclk),
        .D(RSTA_SHFT_REG[0]),
        .Q(\SAFETY_CKT_GEN.RSTA_SHFT_REG_reg[3]_srl3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.RSTA_SHFT_REG_reg[4] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\SAFETY_CKT_GEN.RSTA_SHFT_REG_reg[3]_srl3_n_0 ),
        .Q(RSTA_SHFT_REG[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(1'b1),
        .Q(RSTB_SHFT_REG[0]),
        .R(1'b0));
  (* srl_bus_name = "U0/\inst_fifo_gen/gaxis_fifo.gaxisf.axisf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/SAFETY_CKT_GEN.RSTB_SHFT_REG_reg " *) 
  (* srl_name = "U0/\inst_fifo_gen/gaxis_fifo.gaxisf.axisf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[3]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[3]_srl3 
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(m_aclk),
        .D(RSTB_SHFT_REG[0]),
        .Q(\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[3]_srl3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[3]_srl3_n_0 ),
        .Q(RSTB_SHFT_REG[4]),
        .R(1'b0));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_blk_mem_gen_prim_wrapper \prim_noinit.ram 
       (.D(D),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ),
        .E(E),
        .ENA_dly_D(ENA_dly_D),
        .ENB_I(ENB_I),
        .POR_B(POR_B),
        .Q(Q),
        .m_aclk(m_aclk),
        .out(out),
        .s_aclk(s_aclk),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_blk_mem_gen_prim_wrapper
   (ENA_dly_D,
    ENB_I,
    POR_B,
    m_aclk,
    out,
    s_aclk,
    s_axis_tvalid,
    D,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 ,
    E,
    Q,
    s_axis_tdata);
  input ENA_dly_D;
  input ENB_I;
  input POR_B;
  input m_aclk;
  input out;
  input s_aclk;
  input s_axis_tvalid;
  output [31:0]D;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 ;
  input [0:0]E;
  input [8:0]Q;
  input [31:0]s_axis_tdata;

  wire [31:0]D;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_32 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_33 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_34 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_35 ;
  wire [0:0]E;
  wire ENA_I;
  wire ENA_dly_D;
  wire ENB_I;
  wire POR_B;
  wire [8:0]Q;
  wire m_aclk;
  wire out;
  wire s_aclk;
  wire [31:0]s_axis_tdata;
  wire s_axis_tvalid;

  (* BOX_TYPE = "PRIMITIVE" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_MODE("SDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(36)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram 
       (.ADDRARDADDR({Q,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 ,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CLKARDCLK(m_aclk),
        .CLKBWRCLK(s_aclk),
        .DIADI(s_axis_tdata[15:0]),
        .DIBDI(s_axis_tdata[31:16]),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO(D[15:0]),
        .DOBDO(D[31:16]),
        .DOPADOP({\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_32 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_33 }),
        .DOPBDOP({\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_34 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_35 }),
        .ENARDEN(ENB_I),
        .ENBWREN(ENA_I),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(POR_B),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({E,E,E,E}));
  LUT3 #(
    .INIT(8'hBA)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_i_2 
       (.I0(ENA_dly_D),
        .I1(out),
        .I2(s_axis_tvalid),
        .O(ENA_I));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_top" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_blk_mem_gen_top
   (ENB_I,
    ENB_dly_D,
    m_aclk,
    out,
    s_aclk,
    s_axis_tvalid,
    D,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    E,
    Q,
    s_axis_tdata);
  input ENB_I;
  output ENB_dly_D;
  input m_aclk;
  input out;
  input s_aclk;
  input s_axis_tvalid;
  output [31:0]D;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  input [0:0]E;
  input [8:0]Q;
  input [31:0]s_axis_tdata;

  wire [31:0]D;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  wire [0:0]E;
  wire ENB_I;
  wire ENB_dly_D;
  wire [8:0]Q;
  wire m_aclk;
  wire out;
  wire s_aclk;
  wire [31:0]s_axis_tdata;
  wire s_axis_tvalid;

  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_blk_mem_gen_generic_cstr \valid.cstr 
       (.D(D),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ),
        .E(E),
        .ENB_I(ENB_I),
        .ENB_dly_D(ENB_dly_D),
        .Q(Q),
        .m_aclk(m_aclk),
        .out(out),
        .s_aclk(s_aclk),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_4_4" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_blk_mem_gen_v8_4_4
   (ENB_I,
    ENB_dly_D,
    m_aclk,
    out,
    s_aclk,
    s_axis_tvalid,
    D,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    E,
    Q,
    s_axis_tdata);
  input ENB_I;
  output ENB_dly_D;
  input m_aclk;
  input out;
  input s_aclk;
  input s_axis_tvalid;
  output [31:0]D;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  input [0:0]E;
  input [8:0]Q;
  input [31:0]s_axis_tdata;

  wire [31:0]D;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  wire [0:0]E;
  wire ENB_I;
  wire ENB_dly_D;
  wire [8:0]Q;
  wire m_aclk;
  wire out;
  wire s_aclk;
  wire [31:0]s_axis_tdata;
  wire s_axis_tvalid;

  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_blk_mem_gen_v8_4_4_synth inst_blk_mem_gen
       (.D(D),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ),
        .E(E),
        .ENB_I(ENB_I),
        .ENB_dly_D(ENB_dly_D),
        .Q(Q),
        .m_aclk(m_aclk),
        .out(out),
        .s_aclk(s_aclk),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_4_4_synth" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_blk_mem_gen_v8_4_4_synth
   (ENB_I,
    ENB_dly_D,
    m_aclk,
    out,
    s_aclk,
    s_axis_tvalid,
    D,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    E,
    Q,
    s_axis_tdata);
  input ENB_I;
  output ENB_dly_D;
  input m_aclk;
  input out;
  input s_aclk;
  input s_axis_tvalid;
  output [31:0]D;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  input [0:0]E;
  input [8:0]Q;
  input [31:0]s_axis_tdata;

  wire [31:0]D;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  wire [0:0]E;
  wire ENB_I;
  wire ENB_dly_D;
  wire [8:0]Q;
  wire m_aclk;
  wire out;
  wire s_aclk;
  wire [31:0]s_axis_tdata;
  wire s_axis_tvalid;

  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_blk_mem_gen_top \gnbram.gnativebmg.native_blk_mem_gen 
       (.D(D),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ),
        .E(E),
        .ENB_I(ENB_I),
        .ENB_dly_D(ENB_dly_D),
        .Q(Q),
        .m_aclk(m_aclk),
        .out(out),
        .s_aclk(s_aclk),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

(* ORIG_REF_NAME = "clk_x_pntrs" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_clk_x_pntrs
   (dest_out_bin_ff_reg,
    \dest_out_bin_ff_reg[3]_0 ,
    \dest_out_bin_ff_reg[3]_1 ,
    \dest_out_bin_ff_reg[3]_2 ,
    \dest_out_bin_ff_reg[3]_3 ,
    \dest_out_bin_ff_reg[7]_0 ,
    \dest_out_bin_ff_reg[7]_1 ,
    \dest_out_bin_ff_reg[7]_2 ,
    m_aclk,
    s_aclk,
    DI,
    O,
    Q,
    RD_PNTR_WR,
    S,
    WR_PNTR_RD,
    \dest_out_bin_ff_reg[2] ,
    \dest_out_bin_ff_reg[6] ,
    \dest_out_bin_ff_reg[6]_0 ,
    \gdiff.diff_pntr_pad_reg[9] ,
    \gmux.gm[3].gms.ms ,
    \gmux.gm[4].gms.ms ,
    \src_gray_ff_reg[8] ,
    v1_reg,
    v1_reg_0,
    v1_reg_1,
    v1_reg_2);
  output [8:3]dest_out_bin_ff_reg;
  output \dest_out_bin_ff_reg[3]_0 ;
  output \dest_out_bin_ff_reg[3]_1 ;
  output \dest_out_bin_ff_reg[3]_2 ;
  output \dest_out_bin_ff_reg[3]_3 ;
  output \dest_out_bin_ff_reg[7]_0 ;
  output \dest_out_bin_ff_reg[7]_1 ;
  output \dest_out_bin_ff_reg[7]_2 ;
  input m_aclk;
  input s_aclk;
  output [1:0]DI;
  output [0:0]O;
  input [8:0]Q;
  output [8:0]RD_PNTR_WR;
  output [0:0]S;
  output [8:0]WR_PNTR_RD;
  output [1:0]\dest_out_bin_ff_reg[2] ;
  output [3:0]\dest_out_bin_ff_reg[6] ;
  output [3:0]\dest_out_bin_ff_reg[6]_0 ;
  input [8:0]\gdiff.diff_pntr_pad_reg[9] ;
  input [7:0]\gmux.gm[3].gms.ms ;
  input [0:0]\gmux.gm[4].gms.ms ;
  input [8:0]\src_gray_ff_reg[8] ;
  output [3:0]v1_reg;
  output [3:0]v1_reg_0;
  output [3:0]v1_reg_1;
  output [0:0]v1_reg_2;

  wire [1:0]DI;
  wire [0:0]O;
  wire [8:0]Q;
  wire [8:0]RD_PNTR_WR;
  wire [0:0]S;
  wire [8:0]WR_PNTR_RD;
  wire [8:3]dest_out_bin_ff_reg;
  wire [1:0]\dest_out_bin_ff_reg[2] ;
  wire \dest_out_bin_ff_reg[3]_0 ;
  wire \dest_out_bin_ff_reg[3]_1 ;
  wire \dest_out_bin_ff_reg[3]_2 ;
  wire \dest_out_bin_ff_reg[3]_3 ;
  wire [3:0]\dest_out_bin_ff_reg[6] ;
  wire [3:0]\dest_out_bin_ff_reg[6]_0 ;
  wire \dest_out_bin_ff_reg[7]_0 ;
  wire \dest_out_bin_ff_reg[7]_1 ;
  wire \dest_out_bin_ff_reg[7]_2 ;
  wire [8:1]diff_wr_rd__0;
  wire \g_rd.gvalid_low.rd_dc_i[6]_i_3_n_0 ;
  wire \g_rd.gvalid_low.rd_dc_i[6]_i_4_n_0 ;
  wire \g_rd.gvalid_low.rd_dc_i[6]_i_5_n_0 ;
  wire \g_rd.gvalid_low.rd_dc_i[6]_i_6_n_0 ;
  wire \g_rd.gvalid_low.rd_dc_i[9]_i_10_n_0 ;
  wire \g_rd.gvalid_low.rd_dc_i[9]_i_4_n_0 ;
  wire \g_rd.gvalid_low.rd_dc_i[9]_i_6_n_0 ;
  wire \g_rd.gvalid_low.rd_dc_i[9]_i_7_n_0 ;
  wire \g_rd.gvalid_low.rd_dc_i[9]_i_8_n_0 ;
  wire \g_rd.gvalid_low.rd_dc_i[9]_i_9_n_0 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[6]_i_2_n_0 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[6]_i_2_n_1 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[6]_i_2_n_2 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[6]_i_2_n_3 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[9]_i_5_n_0 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[9]_i_5_n_1 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[9]_i_5_n_2 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[9]_i_5_n_3 ;
  wire [8:0]\gdiff.diff_pntr_pad_reg[9] ;
  wire [7:0]\gmux.gm[3].gms.ms ;
  wire [0:0]\gmux.gm[4].gms.ms ;
  wire m_aclk;
  wire s_aclk;
  wire [8:0]\src_gray_ff_reg[8] ;
  wire [3:0]v1_reg;
  wire [3:0]v1_reg_0;
  wire [3:0]v1_reg_1;
  wire [0:0]v1_reg_2;
  wire [3:0]\NLW_g_rd.gvalid_low.rd_dc_i_reg[9]_i_3_CO_UNCONNECTED ;
  wire [3:1]\NLW_g_rd.gvalid_low.rd_dc_i_reg[9]_i_3_O_UNCONNECTED ;

  LUT1 #(
    .INIT(2'h1)) 
    \g_rd.gvalid_low.rd_dc_i[1]_i_1 
       (.I0(diff_wr_rd__0[1]),
        .O(dest_out_bin_ff_reg[3]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \g_rd.gvalid_low.rd_dc_i[2]_i_1 
       (.I0(diff_wr_rd__0[1]),
        .I1(diff_wr_rd__0[2]),
        .O(\dest_out_bin_ff_reg[3]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \g_rd.gvalid_low.rd_dc_i[3]_i_1 
       (.I0(diff_wr_rd__0[1]),
        .I1(diff_wr_rd__0[2]),
        .I2(diff_wr_rd__0[3]),
        .O(\dest_out_bin_ff_reg[3]_3 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \g_rd.gvalid_low.rd_dc_i[4]_i_1 
       (.I0(diff_wr_rd__0[2]),
        .I1(diff_wr_rd__0[1]),
        .I2(diff_wr_rd__0[3]),
        .I3(diff_wr_rd__0[4]),
        .O(\dest_out_bin_ff_reg[3]_2 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \g_rd.gvalid_low.rd_dc_i[5]_i_1 
       (.I0(diff_wr_rd__0[3]),
        .I1(diff_wr_rd__0[1]),
        .I2(diff_wr_rd__0[2]),
        .I3(diff_wr_rd__0[4]),
        .I4(diff_wr_rd__0[5]),
        .O(\dest_out_bin_ff_reg[3]_1 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \g_rd.gvalid_low.rd_dc_i[6]_i_1 
       (.I0(diff_wr_rd__0[4]),
        .I1(diff_wr_rd__0[2]),
        .I2(diff_wr_rd__0[1]),
        .I3(diff_wr_rd__0[3]),
        .I4(diff_wr_rd__0[5]),
        .I5(diff_wr_rd__0[6]),
        .O(\dest_out_bin_ff_reg[7]_2 ));
  LUT2 #(
    .INIT(4'h9)) 
    \g_rd.gvalid_low.rd_dc_i[6]_i_3 
       (.I0(WR_PNTR_RD[3]),
        .I1(Q[3]),
        .O(\g_rd.gvalid_low.rd_dc_i[6]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \g_rd.gvalid_low.rd_dc_i[6]_i_4 
       (.I0(WR_PNTR_RD[2]),
        .I1(Q[2]),
        .O(\g_rd.gvalid_low.rd_dc_i[6]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \g_rd.gvalid_low.rd_dc_i[6]_i_5 
       (.I0(WR_PNTR_RD[1]),
        .I1(Q[1]),
        .O(\g_rd.gvalid_low.rd_dc_i[6]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \g_rd.gvalid_low.rd_dc_i[6]_i_6 
       (.I0(WR_PNTR_RD[0]),
        .I1(Q[0]),
        .O(\g_rd.gvalid_low.rd_dc_i[6]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \g_rd.gvalid_low.rd_dc_i[7]_i_1 
       (.I0(\g_rd.gvalid_low.rd_dc_i[9]_i_4_n_0 ),
        .I1(diff_wr_rd__0[7]),
        .O(\dest_out_bin_ff_reg[7]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \g_rd.gvalid_low.rd_dc_i[8]_i_1 
       (.I0(\g_rd.gvalid_low.rd_dc_i[9]_i_4_n_0 ),
        .I1(diff_wr_rd__0[7]),
        .I2(diff_wr_rd__0[8]),
        .O(\dest_out_bin_ff_reg[7]_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \g_rd.gvalid_low.rd_dc_i[9]_i_10 
       (.I0(WR_PNTR_RD[4]),
        .I1(Q[4]),
        .O(\g_rd.gvalid_low.rd_dc_i[9]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \g_rd.gvalid_low.rd_dc_i[9]_i_2 
       (.I0(diff_wr_rd__0[8]),
        .I1(\g_rd.gvalid_low.rd_dc_i[9]_i_4_n_0 ),
        .I2(diff_wr_rd__0[7]),
        .O(dest_out_bin_ff_reg[7]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \g_rd.gvalid_low.rd_dc_i[9]_i_4 
       (.I0(diff_wr_rd__0[6]),
        .I1(diff_wr_rd__0[4]),
        .I2(diff_wr_rd__0[2]),
        .I3(diff_wr_rd__0[1]),
        .I4(diff_wr_rd__0[3]),
        .I5(diff_wr_rd__0[5]),
        .O(\g_rd.gvalid_low.rd_dc_i[9]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \g_rd.gvalid_low.rd_dc_i[9]_i_6 
       (.I0(WR_PNTR_RD[8]),
        .I1(Q[8]),
        .O(\g_rd.gvalid_low.rd_dc_i[9]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \g_rd.gvalid_low.rd_dc_i[9]_i_7 
       (.I0(WR_PNTR_RD[7]),
        .I1(Q[7]),
        .O(\g_rd.gvalid_low.rd_dc_i[9]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \g_rd.gvalid_low.rd_dc_i[9]_i_8 
       (.I0(WR_PNTR_RD[6]),
        .I1(Q[6]),
        .O(\g_rd.gvalid_low.rd_dc_i[9]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \g_rd.gvalid_low.rd_dc_i[9]_i_9 
       (.I0(WR_PNTR_RD[5]),
        .I1(Q[5]),
        .O(\g_rd.gvalid_low.rd_dc_i[9]_i_9_n_0 ));
  CARRY4 \g_rd.gvalid_low.rd_dc_i_reg[6]_i_2 
       (.CI(1'b0),
        .CO({\g_rd.gvalid_low.rd_dc_i_reg[6]_i_2_n_0 ,\g_rd.gvalid_low.rd_dc_i_reg[6]_i_2_n_1 ,\g_rd.gvalid_low.rd_dc_i_reg[6]_i_2_n_2 ,\g_rd.gvalid_low.rd_dc_i_reg[6]_i_2_n_3 }),
        .CYINIT(1'b1),
        .DI(WR_PNTR_RD[3:0]),
        .O({diff_wr_rd__0[3:1],O}),
        .S({\g_rd.gvalid_low.rd_dc_i[6]_i_3_n_0 ,\g_rd.gvalid_low.rd_dc_i[6]_i_4_n_0 ,\g_rd.gvalid_low.rd_dc_i[6]_i_5_n_0 ,\g_rd.gvalid_low.rd_dc_i[6]_i_6_n_0 }));
  CARRY4 \g_rd.gvalid_low.rd_dc_i_reg[9]_i_3 
       (.CI(\g_rd.gvalid_low.rd_dc_i_reg[9]_i_5_n_0 ),
        .CO(\NLW_g_rd.gvalid_low.rd_dc_i_reg[9]_i_3_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_g_rd.gvalid_low.rd_dc_i_reg[9]_i_3_O_UNCONNECTED [3:1],diff_wr_rd__0[8]}),
        .S({1'b0,1'b0,1'b0,\g_rd.gvalid_low.rd_dc_i[9]_i_6_n_0 }));
  CARRY4 \g_rd.gvalid_low.rd_dc_i_reg[9]_i_5 
       (.CI(\g_rd.gvalid_low.rd_dc_i_reg[6]_i_2_n_0 ),
        .CO({\g_rd.gvalid_low.rd_dc_i_reg[9]_i_5_n_0 ,\g_rd.gvalid_low.rd_dc_i_reg[9]_i_5_n_1 ,\g_rd.gvalid_low.rd_dc_i_reg[9]_i_5_n_2 ,\g_rd.gvalid_low.rd_dc_i_reg[9]_i_5_n_3 }),
        .CYINIT(1'b0),
        .DI(WR_PNTR_RD[7:4]),
        .O(diff_wr_rd__0[7:4]),
        .S({\g_rd.gvalid_low.rd_dc_i[9]_i_7_n_0 ,\g_rd.gvalid_low.rd_dc_i[9]_i_8_n_0 ,\g_rd.gvalid_low.rd_dc_i[9]_i_9_n_0 ,\g_rd.gvalid_low.rd_dc_i[9]_i_10_n_0 }));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1 
       (.I0(RD_PNTR_WR[0]),
        .I1(\gdiff.diff_pntr_pad_reg[9] [0]),
        .I2(RD_PNTR_WR[1]),
        .I3(\gdiff.diff_pntr_pad_reg[9] [1]),
        .O(v1_reg[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1__0 
       (.I0(RD_PNTR_WR[0]),
        .I1(\gmux.gm[3].gms.ms [0]),
        .I2(RD_PNTR_WR[1]),
        .I3(\gmux.gm[3].gms.ms [1]),
        .O(v1_reg_0[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1__1 
       (.I0(WR_PNTR_RD[0]),
        .I1(Q[0]),
        .I2(WR_PNTR_RD[1]),
        .I3(Q[1]),
        .O(v1_reg_1[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1 
       (.I0(RD_PNTR_WR[2]),
        .I1(\gdiff.diff_pntr_pad_reg[9] [2]),
        .I2(RD_PNTR_WR[3]),
        .I3(\gdiff.diff_pntr_pad_reg[9] [3]),
        .O(v1_reg[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1__0 
       (.I0(RD_PNTR_WR[2]),
        .I1(\gmux.gm[3].gms.ms [2]),
        .I2(RD_PNTR_WR[3]),
        .I3(\gmux.gm[3].gms.ms [3]),
        .O(v1_reg_0[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1__1 
       (.I0(WR_PNTR_RD[2]),
        .I1(Q[2]),
        .I2(WR_PNTR_RD[3]),
        .I3(Q[3]),
        .O(v1_reg_1[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1 
       (.I0(RD_PNTR_WR[4]),
        .I1(\gdiff.diff_pntr_pad_reg[9] [4]),
        .I2(RD_PNTR_WR[5]),
        .I3(\gdiff.diff_pntr_pad_reg[9] [5]),
        .O(v1_reg[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1__0 
       (.I0(RD_PNTR_WR[4]),
        .I1(\gmux.gm[3].gms.ms [4]),
        .I2(RD_PNTR_WR[5]),
        .I3(\gmux.gm[3].gms.ms [5]),
        .O(v1_reg_0[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1__1 
       (.I0(WR_PNTR_RD[4]),
        .I1(Q[4]),
        .I2(WR_PNTR_RD[5]),
        .I3(Q[5]),
        .O(v1_reg_1[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1 
       (.I0(RD_PNTR_WR[6]),
        .I1(\gdiff.diff_pntr_pad_reg[9] [6]),
        .I2(RD_PNTR_WR[7]),
        .I3(\gdiff.diff_pntr_pad_reg[9] [7]),
        .O(v1_reg[3]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1__0 
       (.I0(RD_PNTR_WR[6]),
        .I1(\gmux.gm[3].gms.ms [6]),
        .I2(RD_PNTR_WR[7]),
        .I3(\gmux.gm[3].gms.ms [7]),
        .O(v1_reg_0[3]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1__1 
       (.I0(WR_PNTR_RD[6]),
        .I1(Q[6]),
        .I2(WR_PNTR_RD[7]),
        .I3(Q[7]),
        .O(v1_reg_1[3]));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[4].gms.ms_i_1__0 
       (.I0(WR_PNTR_RD[8]),
        .I1(\gmux.gm[4].gms.ms ),
        .O(v1_reg_2));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[4].gms.ms_i_1__1 
       (.I0(WR_PNTR_RD[8]),
        .I1(Q[8]),
        .O(dest_out_bin_ff_reg[8]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry__0_i_1__0
       (.I0(WR_PNTR_RD[6]),
        .I1(Q[6]),
        .O(\dest_out_bin_ff_reg[6] [3]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry__0_i_2__0
       (.I0(WR_PNTR_RD[5]),
        .I1(Q[5]),
        .O(\dest_out_bin_ff_reg[6] [2]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry__0_i_3__0
       (.I0(WR_PNTR_RD[4]),
        .I1(Q[4]),
        .O(\dest_out_bin_ff_reg[6] [1]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry__0_i_4__0
       (.I0(WR_PNTR_RD[3]),
        .I1(Q[3]),
        .O(\dest_out_bin_ff_reg[6] [0]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__0_i_5
       (.I0(RD_PNTR_WR[6]),
        .I1(\gdiff.diff_pntr_pad_reg[9] [6]),
        .I2(\gdiff.diff_pntr_pad_reg[9] [7]),
        .I3(RD_PNTR_WR[7]),
        .O(\dest_out_bin_ff_reg[6]_0 [3]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__0_i_6
       (.I0(RD_PNTR_WR[5]),
        .I1(\gdiff.diff_pntr_pad_reg[9] [5]),
        .I2(\gdiff.diff_pntr_pad_reg[9] [6]),
        .I3(RD_PNTR_WR[6]),
        .O(\dest_out_bin_ff_reg[6]_0 [2]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__0_i_7
       (.I0(RD_PNTR_WR[4]),
        .I1(\gdiff.diff_pntr_pad_reg[9] [4]),
        .I2(\gdiff.diff_pntr_pad_reg[9] [5]),
        .I3(RD_PNTR_WR[5]),
        .O(\dest_out_bin_ff_reg[6]_0 [1]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__0_i_8
       (.I0(RD_PNTR_WR[3]),
        .I1(\gdiff.diff_pntr_pad_reg[9] [3]),
        .I2(\gdiff.diff_pntr_pad_reg[9] [4]),
        .I3(RD_PNTR_WR[4]),
        .O(\dest_out_bin_ff_reg[6]_0 [0]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__1_i_1
       (.I0(RD_PNTR_WR[7]),
        .I1(\gdiff.diff_pntr_pad_reg[9] [7]),
        .I2(RD_PNTR_WR[8]),
        .I3(\gdiff.diff_pntr_pad_reg[9] [8]),
        .O(S));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry_i_1__0
       (.I0(WR_PNTR_RD[2]),
        .I1(Q[2]),
        .O(DI[1]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry_i_2__0
       (.I0(WR_PNTR_RD[1]),
        .I1(Q[1]),
        .O(DI[0]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry_i_4
       (.I0(RD_PNTR_WR[2]),
        .I1(\gdiff.diff_pntr_pad_reg[9] [2]),
        .I2(\gdiff.diff_pntr_pad_reg[9] [3]),
        .I3(RD_PNTR_WR[3]),
        .O(\dest_out_bin_ff_reg[2] [1]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry_i_5
       (.I0(RD_PNTR_WR[1]),
        .I1(\gdiff.diff_pntr_pad_reg[9] [1]),
        .I2(\gdiff.diff_pntr_pad_reg[9] [2]),
        .I3(RD_PNTR_WR[2]),
        .O(\dest_out_bin_ff_reg[2] [0]));
  (* DEST_SYNC_FF = "2" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* REG_OUTPUT = "1" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* WIDTH = "9" *) 
  (* XPM_CDC = "GRAY" *) 
  (* XPM_MODULE = "TRUE" *) 
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_xpm_cdc_gray rd_pntr_cdc_inst
       (.dest_clk(s_aclk),
        .dest_out_bin(RD_PNTR_WR),
        .src_clk(m_aclk),
        .src_in_bin(Q));
  (* DEST_SYNC_FF = "2" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* REG_OUTPUT = "1" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* WIDTH = "9" *) 
  (* XPM_CDC = "GRAY" *) 
  (* XPM_MODULE = "TRUE" *) 
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_xpm_cdc_gray__2 wr_pntr_cdc_inst
       (.dest_clk(m_aclk),
        .dest_out_bin(WR_PNTR_RD),
        .src_clk(s_aclk),
        .src_in_bin(\src_gray_ff_reg[8] ));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_compare
   (comp1,
    \gmux.gm[4].gms.ms_0 ,
    v1_reg);
  output comp1;
  input [3:0]\gmux.gm[4].gms.ms_0 ;
  input [0:0]v1_reg;

  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_3;
  wire comp1;
  wire [3:0]\gmux.gm[4].gms.ms_0 ;
  wire [0:0]v1_reg;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({carrynet_3,carrynet_2,carrynet_1,carrynet_0}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(\gmux.gm[4].gms.ms_0 ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(carrynet_3),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3:1],comp1}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3:1],1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3:1],v1_reg}));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_compare_0
   (comp1,
    out,
    ram_full_fb_i_reg,
    ram_full_fb_i_reg_0,
    s_axis_tvalid,
    \gmux.gm[4].gms.ms_0 ,
    v1_reg_0);
  input comp1;
  input out;
  output ram_full_fb_i_reg;
  input ram_full_fb_i_reg_0;
  input s_axis_tvalid;
  input [3:0]\gmux.gm[4].gms.ms_0 ;
  input [0:0]v1_reg_0;

  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_3;
  wire comp1;
  wire comp2;
  wire [3:0]\gmux.gm[4].gms.ms_0 ;
  wire out;
  wire ram_full_fb_i_reg;
  wire ram_full_fb_i_reg_0;
  wire s_axis_tvalid;
  wire [0:0]v1_reg_0;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({carrynet_3,carrynet_2,carrynet_1,carrynet_0}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(\gmux.gm[4].gms.ms_0 ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(carrynet_3),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3:1],comp2}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3:1],1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3:1],v1_reg_0}));
  LUT5 #(
    .INIT(32'h0000FF20)) 
    ram_full_i_i_1
       (.I0(comp2),
        .I1(out),
        .I2(s_axis_tvalid),
        .I3(comp1),
        .I4(ram_full_fb_i_reg_0),
        .O(ram_full_fb_i_reg));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_compare_1
   (comp1,
    ram_empty_fb_i_reg,
    ram_empty_fb_i_reg_0,
    ram_rd_en,
    v1_reg);
  input comp1;
  output ram_empty_fb_i_reg;
  input ram_empty_fb_i_reg_0;
  input ram_rd_en;
  input [3:0]v1_reg;

  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_3;
  wire comp0;
  wire comp1;
  wire ram_empty_fb_i_reg;
  wire ram_empty_fb_i_reg_0;
  wire ram_rd_en;
  wire [3:0]v1_reg;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({carrynet_3,carrynet_2,carrynet_1,carrynet_0}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(v1_reg));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(carrynet_3),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3:1],comp0}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3:1],1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3:1],ram_empty_fb_i_reg_0}));
  LUT3 #(
    .INIT(8'hEA)) 
    ram_empty_i_i_1
       (.I0(comp0),
        .I1(ram_rd_en),
        .I2(comp1),
        .O(ram_empty_fb_i_reg));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_compare_2
   (comp1,
    ram_empty_fb_i_reg,
    v1_reg_0);
  output comp1;
  input [0:0]ram_empty_fb_i_reg;
  input [3:0]v1_reg_0;

  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_3;
  wire comp1;
  wire [0:0]ram_empty_fb_i_reg;
  wire [3:0]v1_reg_0;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({carrynet_3,carrynet_2,carrynet_1,carrynet_0}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(v1_reg_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(carrynet_3),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3:1],comp1}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3:1],1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3:1],ram_empty_fb_i_reg}));
endmodule

(* ORIG_REF_NAME = "fifo_generator_ramfifo" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_fifo_generator_ramfifo
   (axis_prog_empty,
    axis_prog_full,
    m_aclk,
    m_axis_tready,
    m_axis_tvalid,
    s_aclk,
    s_aresetn,
    s_axis_tready,
    s_axis_tvalid,
    wr_rst_busy,
    axis_rd_data_count,
    axis_wr_data_count,
    m_axis_tdata,
    s_axis_tdata);
  output axis_prog_empty;
  output axis_prog_full;
  input m_aclk;
  input m_axis_tready;
  output m_axis_tvalid;
  input s_aclk;
  input s_aresetn;
  output s_axis_tready;
  input s_axis_tvalid;
  output wr_rst_busy;
  output [9:0]axis_rd_data_count;
  output [9:0]axis_wr_data_count;
  output [31:0]m_axis_tdata;
  input [31:0]s_axis_tdata;

  wire axis_prog_empty;
  wire axis_prog_full;
  wire [9:0]axis_rd_data_count;
  wire [9:0]axis_wr_data_count;
  wire [0:0]diff_wr_rd;
  wire dout_i;
  wire full_fb_axis;
  wire \gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENB_I ;
  wire \gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENB_dly_D ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_10 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_11 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_12 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_13 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_14 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_15 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_16 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_34 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_35 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_36 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_37 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_38 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_39 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_45 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_46 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_47 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_48 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_49 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_50 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_51 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_52 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_53 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_9 ;
  wire [3:0]\gras.rsts/c0/v1_reg ;
  wire [4:4]\gras.rsts/c1/v1_reg ;
  wire [3:0]\gwas.wsts/c1/v1_reg ;
  wire [3:0]\gwas.wsts/c2/v1_reg ;
  wire m_aclk;
  wire [31:0]m_axis_tdata;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire ram_wr_en;
  wire [8:0]rd_pntr;
  wire [8:8]rd_pntr_plus1;
  wire [8:0]rd_pntr_wr;
  wire rst_full_gen_i;
  wire rstblk_n_0;
  wire rstblk_n_1;
  wire s_aclk;
  wire s_aresetn;
  wire [31:0]s_axis_tdata;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire [8:0]wr_pntr;
  wire [8:0]wr_pntr_plus1;
  wire [7:0]wr_pntr_plus2;
  wire [8:0]wr_pntr_rd;
  wire wr_rst_busy;
  wire [6:4]\NLW_gntv_or_sync_fifo.gcx.clkx_dest_out_bin_ff_reg_UNCONNECTED ;

  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_clk_x_pntrs \gntv_or_sync_fifo.gcx.clkx 
       (.DI({\gntv_or_sync_fifo.gcx.clkx_n_9 ,\gntv_or_sync_fifo.gcx.clkx_n_10 }),
        .O(diff_wr_rd),
        .Q(rd_pntr),
        .RD_PNTR_WR(rd_pntr_wr),
        .S(\gntv_or_sync_fifo.gcx.clkx_n_16 ),
        .WR_PNTR_RD(wr_pntr_rd),
        .dest_out_bin_ff_reg({\gntv_or_sync_fifo.gcx.clkx_n_15 ,\gntv_or_sync_fifo.gcx.clkx_n_47 ,\NLW_gntv_or_sync_fifo.gcx.clkx_dest_out_bin_ff_reg_UNCONNECTED [6:4],\gntv_or_sync_fifo.gcx.clkx_n_45 }),
        .\dest_out_bin_ff_reg[2] ({\gntv_or_sync_fifo.gcx.clkx_n_34 ,\gntv_or_sync_fifo.gcx.clkx_n_35 }),
        .\dest_out_bin_ff_reg[3]_0 (\gntv_or_sync_fifo.gcx.clkx_n_46 ),
        .\dest_out_bin_ff_reg[3]_1 (\gntv_or_sync_fifo.gcx.clkx_n_51 ),
        .\dest_out_bin_ff_reg[3]_2 (\gntv_or_sync_fifo.gcx.clkx_n_52 ),
        .\dest_out_bin_ff_reg[3]_3 (\gntv_or_sync_fifo.gcx.clkx_n_53 ),
        .\dest_out_bin_ff_reg[6] ({\gntv_or_sync_fifo.gcx.clkx_n_11 ,\gntv_or_sync_fifo.gcx.clkx_n_12 ,\gntv_or_sync_fifo.gcx.clkx_n_13 ,\gntv_or_sync_fifo.gcx.clkx_n_14 }),
        .\dest_out_bin_ff_reg[6]_0 ({\gntv_or_sync_fifo.gcx.clkx_n_36 ,\gntv_or_sync_fifo.gcx.clkx_n_37 ,\gntv_or_sync_fifo.gcx.clkx_n_38 ,\gntv_or_sync_fifo.gcx.clkx_n_39 }),
        .\dest_out_bin_ff_reg[7]_0 (\gntv_or_sync_fifo.gcx.clkx_n_48 ),
        .\dest_out_bin_ff_reg[7]_1 (\gntv_or_sync_fifo.gcx.clkx_n_49 ),
        .\dest_out_bin_ff_reg[7]_2 (\gntv_or_sync_fifo.gcx.clkx_n_50 ),
        .\gdiff.diff_pntr_pad_reg[9] (wr_pntr_plus1),
        .\gmux.gm[3].gms.ms (wr_pntr_plus2),
        .\gmux.gm[4].gms.ms (rd_pntr_plus1),
        .m_aclk(m_aclk),
        .s_aclk(s_aclk),
        .\src_gray_ff_reg[8] (wr_pntr),
        .v1_reg(\gwas.wsts/c1/v1_reg ),
        .v1_reg_0(\gwas.wsts/c2/v1_reg ),
        .v1_reg_1(\gras.rsts/c0/v1_reg ),
        .v1_reg_2(\gras.rsts/c1/v1_reg ));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_rd_logic \gntv_or_sync_fifo.gl0.rd 
       (.DI({\gntv_or_sync_fifo.gcx.clkx_n_9 ,\gntv_or_sync_fifo.gcx.clkx_n_10 }),
        .E(dout_i),
        .ENB_I(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENB_I ),
        .ENB_dly_D(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENB_dly_D ),
        .O(diff_wr_rd),
        .Q(rd_pntr),
        .WR_PNTR_RD(wr_pntr_rd),
        .axis_prog_empty(axis_prog_empty),
        .axis_rd_data_count(axis_rd_data_count),
        .\g_rd.gvalid_low.rd_dc_i_reg ({\gntv_or_sync_fifo.gcx.clkx_n_47 ,\gntv_or_sync_fifo.gcx.clkx_n_48 ,\gntv_or_sync_fifo.gcx.clkx_n_49 ,\gntv_or_sync_fifo.gcx.clkx_n_50 ,\gntv_or_sync_fifo.gcx.clkx_n_51 ,\gntv_or_sync_fifo.gcx.clkx_n_52 ,\gntv_or_sync_fifo.gcx.clkx_n_53 ,\gntv_or_sync_fifo.gcx.clkx_n_46 ,\gntv_or_sync_fifo.gcx.clkx_n_45 }),
        .\gc0.count_d1_reg (rstblk_n_1),
        .\gc0.count_reg[8] (rd_pntr_plus1),
        .\gdiff.diff_pntr_pad_reg[8] ({\gntv_or_sync_fifo.gcx.clkx_n_11 ,\gntv_or_sync_fifo.gcx.clkx_n_12 ,\gntv_or_sync_fifo.gcx.clkx_n_13 ,\gntv_or_sync_fifo.gcx.clkx_n_14 }),
        .m_aclk(m_aclk),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .ram_empty_fb_i_reg(\gntv_or_sync_fifo.gcx.clkx_n_15 ),
        .ram_empty_fb_i_reg_0(\gras.rsts/c1/v1_reg ),
        .v1_reg(\gras.rsts/c0/v1_reg ));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_wr_logic \gntv_or_sync_fifo.gl0.wr 
       (.E(ram_wr_en),
        .Q(wr_pntr),
        .RD_PNTR_WR(rd_pntr_wr),
        .S(\gntv_or_sync_fifo.gcx.clkx_n_16 ),
        .axis_prog_full(axis_prog_full),
        .axis_wr_data_count(axis_wr_data_count),
        .\gdiff.diff_pntr_pad_reg[4] ({\gntv_or_sync_fifo.gcx.clkx_n_34 ,\gntv_or_sync_fifo.gcx.clkx_n_35 }),
        .\gdiff.diff_pntr_pad_reg[8] ({\gntv_or_sync_fifo.gcx.clkx_n_36 ,\gntv_or_sync_fifo.gcx.clkx_n_37 ,\gntv_or_sync_fifo.gcx.clkx_n_38 ,\gntv_or_sync_fifo.gcx.clkx_n_39 }),
        .\gic0.gc0.count_d1_reg (rstblk_n_0),
        .\gic0.gc0.count_d1_reg[8] (wr_pntr_plus1),
        .\gic0.gc0.count_reg[7] (wr_pntr_plus2),
        .\gmux.gm[4].gms.ms (\gwas.wsts/c1/v1_reg ),
        .\gmux.gm[4].gms.ms_0 (\gwas.wsts/c2/v1_reg ),
        .out(full_fb_axis),
        .ram_full_fb_i_reg(rst_full_gen_i),
        .s_aclk(s_aclk),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_memory \gntv_or_sync_fifo.mem 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (wr_pntr),
        .E(ram_wr_en),
        .ENB_I(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENB_I ),
        .ENB_dly_D(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENB_dly_D ),
        .Q(rd_pntr),
        .\goreg_bm.dout_i_reg[31]_0 (dout_i),
        .m_aclk(m_aclk),
        .m_axis_tdata(m_axis_tdata),
        .out(full_fb_axis),
        .s_aclk(s_aclk),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tvalid(s_axis_tvalid));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_reset_blk_ramfifo rstblk
       (.m_aclk(m_aclk),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 (rstblk_n_1),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg_0 (rstblk_n_0),
        .out(rst_full_gen_i),
        .s_aclk(s_aclk),
        .s_aresetn(s_aresetn),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* ORIG_REF_NAME = "fifo_generator_top" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_fifo_generator_top
   (axis_prog_empty,
    axis_prog_full,
    m_aclk,
    m_axis_tready,
    m_axis_tvalid,
    s_aclk,
    s_aresetn,
    s_axis_tready,
    s_axis_tvalid,
    wr_rst_busy,
    axis_rd_data_count,
    axis_wr_data_count,
    m_axis_tdata,
    s_axis_tdata);
  output axis_prog_empty;
  output axis_prog_full;
  input m_aclk;
  input m_axis_tready;
  output m_axis_tvalid;
  input s_aclk;
  input s_aresetn;
  output s_axis_tready;
  input s_axis_tvalid;
  output wr_rst_busy;
  output [9:0]axis_rd_data_count;
  output [9:0]axis_wr_data_count;
  output [31:0]m_axis_tdata;
  input [31:0]s_axis_tdata;

  wire axis_prog_empty;
  wire axis_prog_full;
  wire [9:0]axis_rd_data_count;
  wire [9:0]axis_wr_data_count;
  wire m_aclk;
  wire [31:0]m_axis_tdata;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire s_aclk;
  wire s_aresetn;
  wire [31:0]s_axis_tdata;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire wr_rst_busy;

  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_fifo_generator_ramfifo \grf.rf 
       (.axis_prog_empty(axis_prog_empty),
        .axis_prog_full(axis_prog_full),
        .axis_rd_data_count(axis_rd_data_count),
        .axis_wr_data_count(axis_wr_data_count),
        .m_aclk(m_aclk),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .s_aclk(s_aclk),
        .s_aresetn(s_aresetn),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* C_ADD_NGC_CONSTRAINT = "0" *) (* C_APPLICATION_TYPE_AXIS = "0" *) (* C_APPLICATION_TYPE_RACH = "0" *) 
(* C_APPLICATION_TYPE_RDCH = "0" *) (* C_APPLICATION_TYPE_WACH = "0" *) (* C_APPLICATION_TYPE_WDCH = "0" *) 
(* C_APPLICATION_TYPE_WRCH = "0" *) (* C_AXIS_TDATA_WIDTH = "32" *) (* C_AXIS_TDEST_WIDTH = "1" *) 
(* C_AXIS_TID_WIDTH = "1" *) (* C_AXIS_TKEEP_WIDTH = "4" *) (* C_AXIS_TSTRB_WIDTH = "4" *) 
(* C_AXIS_TUSER_WIDTH = "1" *) (* C_AXIS_TYPE = "0" *) (* C_AXI_ADDR_WIDTH = "32" *) 
(* C_AXI_ARUSER_WIDTH = "1" *) (* C_AXI_AWUSER_WIDTH = "1" *) (* C_AXI_BUSER_WIDTH = "1" *) 
(* C_AXI_DATA_WIDTH = "64" *) (* C_AXI_ID_WIDTH = "1" *) (* C_AXI_LEN_WIDTH = "8" *) 
(* C_AXI_LOCK_WIDTH = "1" *) (* C_AXI_RUSER_WIDTH = "1" *) (* C_AXI_TYPE = "1" *) 
(* C_AXI_WUSER_WIDTH = "1" *) (* C_COMMON_CLOCK = "0" *) (* C_COUNT_TYPE = "0" *) 
(* C_DATA_COUNT_WIDTH = "10" *) (* C_DEFAULT_VALUE = "BlankString" *) (* C_DIN_WIDTH = "18" *) 
(* C_DIN_WIDTH_AXIS = "32" *) (* C_DIN_WIDTH_RACH = "32" *) (* C_DIN_WIDTH_RDCH = "64" *) 
(* C_DIN_WIDTH_WACH = "32" *) (* C_DIN_WIDTH_WDCH = "64" *) (* C_DIN_WIDTH_WRCH = "2" *) 
(* C_DOUT_RST_VAL = "0" *) (* C_DOUT_WIDTH = "18" *) (* C_ENABLE_RLOCS = "0" *) 
(* C_ENABLE_RST_SYNC = "1" *) (* C_EN_SAFETY_CKT = "0" *) (* C_ERROR_INJECTION_TYPE = "0" *) 
(* C_ERROR_INJECTION_TYPE_AXIS = "0" *) (* C_ERROR_INJECTION_TYPE_RACH = "0" *) (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
(* C_ERROR_INJECTION_TYPE_WACH = "0" *) (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
(* C_FAMILY = "zynq" *) (* C_FULL_FLAGS_RST_VAL = "1" *) (* C_HAS_ALMOST_EMPTY = "0" *) 
(* C_HAS_ALMOST_FULL = "0" *) (* C_HAS_AXIS_TDATA = "1" *) (* C_HAS_AXIS_TDEST = "0" *) 
(* C_HAS_AXIS_TID = "0" *) (* C_HAS_AXIS_TKEEP = "0" *) (* C_HAS_AXIS_TLAST = "0" *) 
(* C_HAS_AXIS_TREADY = "1" *) (* C_HAS_AXIS_TSTRB = "0" *) (* C_HAS_AXIS_TUSER = "0" *) 
(* C_HAS_AXI_ARUSER = "0" *) (* C_HAS_AXI_AWUSER = "0" *) (* C_HAS_AXI_BUSER = "0" *) 
(* C_HAS_AXI_ID = "0" *) (* C_HAS_AXI_RD_CHANNEL = "1" *) (* C_HAS_AXI_RUSER = "0" *) 
(* C_HAS_AXI_WR_CHANNEL = "1" *) (* C_HAS_AXI_WUSER = "0" *) (* C_HAS_BACKUP = "0" *) 
(* C_HAS_DATA_COUNT = "0" *) (* C_HAS_DATA_COUNTS_AXIS = "1" *) (* C_HAS_DATA_COUNTS_RACH = "0" *) 
(* C_HAS_DATA_COUNTS_RDCH = "0" *) (* C_HAS_DATA_COUNTS_WACH = "0" *) (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
(* C_HAS_DATA_COUNTS_WRCH = "0" *) (* C_HAS_INT_CLK = "0" *) (* C_HAS_MASTER_CE = "0" *) 
(* C_HAS_MEMINIT_FILE = "0" *) (* C_HAS_OVERFLOW = "0" *) (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
(* C_HAS_PROG_FLAGS_RACH = "0" *) (* C_HAS_PROG_FLAGS_RDCH = "0" *) (* C_HAS_PROG_FLAGS_WACH = "0" *) 
(* C_HAS_PROG_FLAGS_WDCH = "0" *) (* C_HAS_PROG_FLAGS_WRCH = "0" *) (* C_HAS_RD_DATA_COUNT = "0" *) 
(* C_HAS_RD_RST = "0" *) (* C_HAS_RST = "1" *) (* C_HAS_SLAVE_CE = "0" *) 
(* C_HAS_SRST = "0" *) (* C_HAS_UNDERFLOW = "0" *) (* C_HAS_VALID = "0" *) 
(* C_HAS_WR_ACK = "0" *) (* C_HAS_WR_DATA_COUNT = "0" *) (* C_HAS_WR_RST = "0" *) 
(* C_IMPLEMENTATION_TYPE = "0" *) (* C_IMPLEMENTATION_TYPE_AXIS = "11" *) (* C_IMPLEMENTATION_TYPE_RACH = "12" *) 
(* C_IMPLEMENTATION_TYPE_RDCH = "11" *) (* C_IMPLEMENTATION_TYPE_WACH = "12" *) (* C_IMPLEMENTATION_TYPE_WDCH = "11" *) 
(* C_IMPLEMENTATION_TYPE_WRCH = "12" *) (* C_INIT_WR_PNTR_VAL = "0" *) (* C_INTERFACE_TYPE = "1" *) 
(* C_MEMORY_TYPE = "1" *) (* C_MIF_FILE_NAME = "BlankString" *) (* C_MSGON_VAL = "1" *) 
(* C_OPTIMIZATION_MODE = "0" *) (* C_OVERFLOW_LOW = "0" *) (* C_POWER_SAVING_MODE = "0" *) 
(* C_PRELOAD_LATENCY = "1" *) (* C_PRELOAD_REGS = "0" *) (* C_PRIM_FIFO_TYPE = "4kx4" *) 
(* C_PRIM_FIFO_TYPE_AXIS = "512x36" *) (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
(* C_PRIM_FIFO_TYPE_WACH = "512x36" *) (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL = "2" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "4" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "13" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1021" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "13" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1021" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "13" *) (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "3" *) (* C_PROG_EMPTY_TYPE = "0" *) 
(* C_PROG_EMPTY_TYPE_AXIS = "1" *) (* C_PROG_EMPTY_TYPE_RACH = "0" *) (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
(* C_PROG_EMPTY_TYPE_WACH = "0" *) (* C_PROG_EMPTY_TYPE_WDCH = "0" *) (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL = "1022" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "508" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "15" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "15" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "15" *) (* C_PROG_FULL_THRESH_NEGATE_VAL = "1021" *) (* C_PROG_FULL_TYPE = "0" *) 
(* C_PROG_FULL_TYPE_AXIS = "1" *) (* C_PROG_FULL_TYPE_RACH = "0" *) (* C_PROG_FULL_TYPE_RDCH = "0" *) 
(* C_PROG_FULL_TYPE_WACH = "0" *) (* C_PROG_FULL_TYPE_WDCH = "0" *) (* C_PROG_FULL_TYPE_WRCH = "0" *) 
(* C_RACH_TYPE = "0" *) (* C_RDCH_TYPE = "0" *) (* C_RD_DATA_COUNT_WIDTH = "10" *) 
(* C_RD_DEPTH = "1024" *) (* C_RD_FREQ = "1" *) (* C_RD_PNTR_WIDTH = "10" *) 
(* C_REG_SLICE_MODE_AXIS = "0" *) (* C_REG_SLICE_MODE_RACH = "0" *) (* C_REG_SLICE_MODE_RDCH = "0" *) 
(* C_REG_SLICE_MODE_WACH = "0" *) (* C_REG_SLICE_MODE_WDCH = "0" *) (* C_REG_SLICE_MODE_WRCH = "0" *) 
(* C_SELECT_XPM = "0" *) (* C_SYNCHRONIZER_STAGE = "2" *) (* C_UNDERFLOW_LOW = "0" *) 
(* C_USE_COMMON_OVERFLOW = "0" *) (* C_USE_COMMON_UNDERFLOW = "0" *) (* C_USE_DEFAULT_SETTINGS = "0" *) 
(* C_USE_DOUT_RST = "1" *) (* C_USE_ECC = "0" *) (* C_USE_ECC_AXIS = "0" *) 
(* C_USE_ECC_RACH = "0" *) (* C_USE_ECC_RDCH = "0" *) (* C_USE_ECC_WACH = "0" *) 
(* C_USE_ECC_WDCH = "0" *) (* C_USE_ECC_WRCH = "0" *) (* C_USE_EMBEDDED_REG = "0" *) 
(* C_USE_FIFO16_FLAGS = "0" *) (* C_USE_FWFT_DATA_COUNT = "0" *) (* C_USE_PIPELINE_REG = "0" *) 
(* C_VALID_LOW = "0" *) (* C_WACH_TYPE = "0" *) (* C_WDCH_TYPE = "0" *) 
(* C_WRCH_TYPE = "0" *) (* C_WR_ACK_LOW = "0" *) (* C_WR_DATA_COUNT_WIDTH = "10" *) 
(* C_WR_DEPTH = "1024" *) (* C_WR_DEPTH_AXIS = "512" *) (* C_WR_DEPTH_RACH = "16" *) 
(* C_WR_DEPTH_RDCH = "1024" *) (* C_WR_DEPTH_WACH = "16" *) (* C_WR_DEPTH_WDCH = "1024" *) 
(* C_WR_DEPTH_WRCH = "16" *) (* C_WR_FREQ = "1" *) (* C_WR_PNTR_WIDTH = "10" *) 
(* C_WR_PNTR_WIDTH_AXIS = "9" *) (* C_WR_PNTR_WIDTH_RACH = "4" *) (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
(* C_WR_PNTR_WIDTH_WACH = "4" *) (* C_WR_PNTR_WIDTH_WDCH = "10" *) (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
(* C_WR_RESPONSE_LATENCY = "1" *) (* ORIG_REF_NAME = "fifo_generator_v13_2_5" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_fifo_generator_v13_2_5
   (almost_empty,
    almost_full,
    axi_ar_dbiterr,
    axi_ar_injectdbiterr,
    axi_ar_injectsbiterr,
    axi_ar_overflow,
    axi_ar_prog_empty,
    axi_ar_prog_full,
    axi_ar_sbiterr,
    axi_ar_underflow,
    axi_aw_dbiterr,
    axi_aw_injectdbiterr,
    axi_aw_injectsbiterr,
    axi_aw_overflow,
    axi_aw_prog_empty,
    axi_aw_prog_full,
    axi_aw_sbiterr,
    axi_aw_underflow,
    axi_b_dbiterr,
    axi_b_injectdbiterr,
    axi_b_injectsbiterr,
    axi_b_overflow,
    axi_b_prog_empty,
    axi_b_prog_full,
    axi_b_sbiterr,
    axi_b_underflow,
    axi_r_dbiterr,
    axi_r_injectdbiterr,
    axi_r_injectsbiterr,
    axi_r_overflow,
    axi_r_prog_empty,
    axi_r_prog_full,
    axi_r_sbiterr,
    axi_r_underflow,
    axi_w_dbiterr,
    axi_w_injectdbiterr,
    axi_w_injectsbiterr,
    axi_w_overflow,
    axi_w_prog_empty,
    axi_w_prog_full,
    axi_w_sbiterr,
    axi_w_underflow,
    axis_dbiterr,
    axis_injectdbiterr,
    axis_injectsbiterr,
    axis_overflow,
    axis_prog_empty,
    axis_prog_full,
    axis_sbiterr,
    axis_underflow,
    backup,
    backup_marker,
    clk,
    dbiterr,
    empty,
    full,
    injectdbiterr,
    injectsbiterr,
    int_clk,
    m_aclk,
    m_aclk_en,
    m_axi_arready,
    m_axi_arvalid,
    m_axi_awready,
    m_axi_awvalid,
    m_axi_bready,
    m_axi_bvalid,
    m_axi_rlast,
    m_axi_rready,
    m_axi_rvalid,
    m_axi_wlast,
    m_axi_wready,
    m_axi_wvalid,
    m_axis_tlast,
    m_axis_tready,
    m_axis_tvalid,
    overflow,
    prog_empty,
    prog_full,
    rd_clk,
    rd_en,
    rd_rst,
    rd_rst_busy,
    rst,
    s_aclk,
    s_aclk_en,
    s_aresetn,
    s_axi_arready,
    s_axi_arvalid,
    s_axi_awready,
    s_axi_awvalid,
    s_axi_bready,
    s_axi_bvalid,
    s_axi_rlast,
    s_axi_rready,
    s_axi_rvalid,
    s_axi_wlast,
    s_axi_wready,
    s_axi_wvalid,
    s_axis_tlast,
    s_axis_tready,
    s_axis_tvalid,
    sbiterr,
    sleep,
    srst,
    underflow,
    valid,
    wr_ack,
    wr_clk,
    wr_en,
    wr_rst,
    wr_rst_busy,
    axi_ar_data_count,
    axi_ar_prog_empty_thresh,
    axi_ar_prog_full_thresh,
    axi_ar_rd_data_count,
    axi_ar_wr_data_count,
    axi_aw_data_count,
    axi_aw_prog_empty_thresh,
    axi_aw_prog_full_thresh,
    axi_aw_rd_data_count,
    axi_aw_wr_data_count,
    axi_b_data_count,
    axi_b_prog_empty_thresh,
    axi_b_prog_full_thresh,
    axi_b_rd_data_count,
    axi_b_wr_data_count,
    axi_r_data_count,
    axi_r_prog_empty_thresh,
    axi_r_prog_full_thresh,
    axi_r_rd_data_count,
    axi_r_wr_data_count,
    axi_w_data_count,
    axi_w_prog_empty_thresh,
    axi_w_prog_full_thresh,
    axi_w_rd_data_count,
    axi_w_wr_data_count,
    axis_data_count,
    axis_prog_empty_thresh,
    axis_prog_full_thresh,
    axis_rd_data_count,
    axis_wr_data_count,
    data_count,
    din,
    dout,
    m_axi_araddr,
    m_axi_arburst,
    m_axi_arcache,
    m_axi_arid,
    m_axi_arlen,
    m_axi_arlock,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arregion,
    m_axi_arsize,
    m_axi_aruser,
    m_axi_awaddr,
    m_axi_awburst,
    m_axi_awcache,
    m_axi_awid,
    m_axi_awlen,
    m_axi_awlock,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awregion,
    m_axi_awsize,
    m_axi_awuser,
    m_axi_bid,
    m_axi_bresp,
    m_axi_buser,
    m_axi_rdata,
    m_axi_rid,
    m_axi_rresp,
    m_axi_ruser,
    m_axi_wdata,
    m_axi_wid,
    m_axi_wstrb,
    m_axi_wuser,
    m_axis_tdata,
    m_axis_tdest,
    m_axis_tid,
    m_axis_tkeep,
    m_axis_tstrb,
    m_axis_tuser,
    prog_empty_thresh,
    prog_empty_thresh_assert,
    prog_empty_thresh_negate,
    prog_full_thresh,
    prog_full_thresh_assert,
    prog_full_thresh_negate,
    rd_data_count,
    s_axi_araddr,
    s_axi_arburst,
    s_axi_arcache,
    s_axi_arid,
    s_axi_arlen,
    s_axi_arlock,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arregion,
    s_axi_arsize,
    s_axi_aruser,
    s_axi_awaddr,
    s_axi_awburst,
    s_axi_awcache,
    s_axi_awid,
    s_axi_awlen,
    s_axi_awlock,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awregion,
    s_axi_awsize,
    s_axi_awuser,
    s_axi_bid,
    s_axi_bresp,
    s_axi_buser,
    s_axi_rdata,
    s_axi_rid,
    s_axi_rresp,
    s_axi_ruser,
    s_axi_wdata,
    s_axi_wid,
    s_axi_wstrb,
    s_axi_wuser,
    s_axis_tdata,
    s_axis_tdest,
    s_axis_tid,
    s_axis_tkeep,
    s_axis_tstrb,
    s_axis_tuser,
    wr_data_count);
  output almost_empty;
  output almost_full;
  output axi_ar_dbiterr;
  input axi_ar_injectdbiterr;
  input axi_ar_injectsbiterr;
  output axi_ar_overflow;
  output axi_ar_prog_empty;
  output axi_ar_prog_full;
  output axi_ar_sbiterr;
  output axi_ar_underflow;
  output axi_aw_dbiterr;
  input axi_aw_injectdbiterr;
  input axi_aw_injectsbiterr;
  output axi_aw_overflow;
  output axi_aw_prog_empty;
  output axi_aw_prog_full;
  output axi_aw_sbiterr;
  output axi_aw_underflow;
  output axi_b_dbiterr;
  input axi_b_injectdbiterr;
  input axi_b_injectsbiterr;
  output axi_b_overflow;
  output axi_b_prog_empty;
  output axi_b_prog_full;
  output axi_b_sbiterr;
  output axi_b_underflow;
  output axi_r_dbiterr;
  input axi_r_injectdbiterr;
  input axi_r_injectsbiterr;
  output axi_r_overflow;
  output axi_r_prog_empty;
  output axi_r_prog_full;
  output axi_r_sbiterr;
  output axi_r_underflow;
  output axi_w_dbiterr;
  input axi_w_injectdbiterr;
  input axi_w_injectsbiterr;
  output axi_w_overflow;
  output axi_w_prog_empty;
  output axi_w_prog_full;
  output axi_w_sbiterr;
  output axi_w_underflow;
  output axis_dbiterr;
  input axis_injectdbiterr;
  input axis_injectsbiterr;
  output axis_overflow;
  output axis_prog_empty;
  output axis_prog_full;
  output axis_sbiterr;
  output axis_underflow;
  input backup;
  input backup_marker;
  input clk;
  output dbiterr;
  output empty;
  output full;
  input injectdbiterr;
  input injectsbiterr;
  input int_clk;
  input m_aclk;
  input m_aclk_en;
  input m_axi_arready;
  output m_axi_arvalid;
  input m_axi_awready;
  output m_axi_awvalid;
  output m_axi_bready;
  input m_axi_bvalid;
  input m_axi_rlast;
  output m_axi_rready;
  input m_axi_rvalid;
  output m_axi_wlast;
  input m_axi_wready;
  output m_axi_wvalid;
  output m_axis_tlast;
  input m_axis_tready;
  output m_axis_tvalid;
  output overflow;
  output prog_empty;
  output prog_full;
  input rd_clk;
  input rd_en;
  input rd_rst;
  output rd_rst_busy;
  input rst;
  input s_aclk;
  input s_aclk_en;
  input s_aresetn;
  output s_axi_arready;
  input s_axi_arvalid;
  output s_axi_awready;
  input s_axi_awvalid;
  input s_axi_bready;
  output s_axi_bvalid;
  output s_axi_rlast;
  input s_axi_rready;
  output s_axi_rvalid;
  input s_axi_wlast;
  output s_axi_wready;
  input s_axi_wvalid;
  input s_axis_tlast;
  output s_axis_tready;
  input s_axis_tvalid;
  output sbiterr;
  input sleep;
  input srst;
  output underflow;
  output valid;
  output wr_ack;
  input wr_clk;
  input wr_en;
  input wr_rst;
  output wr_rst_busy;
  output [4:0]axi_ar_data_count;
  input [3:0]axi_ar_prog_empty_thresh;
  input [3:0]axi_ar_prog_full_thresh;
  output [4:0]axi_ar_rd_data_count;
  output [4:0]axi_ar_wr_data_count;
  output [4:0]axi_aw_data_count;
  input [3:0]axi_aw_prog_empty_thresh;
  input [3:0]axi_aw_prog_full_thresh;
  output [4:0]axi_aw_rd_data_count;
  output [4:0]axi_aw_wr_data_count;
  output [4:0]axi_b_data_count;
  input [3:0]axi_b_prog_empty_thresh;
  input [3:0]axi_b_prog_full_thresh;
  output [4:0]axi_b_rd_data_count;
  output [4:0]axi_b_wr_data_count;
  output [10:0]axi_r_data_count;
  input [9:0]axi_r_prog_empty_thresh;
  input [9:0]axi_r_prog_full_thresh;
  output [10:0]axi_r_rd_data_count;
  output [10:0]axi_r_wr_data_count;
  output [10:0]axi_w_data_count;
  input [9:0]axi_w_prog_empty_thresh;
  input [9:0]axi_w_prog_full_thresh;
  output [10:0]axi_w_rd_data_count;
  output [10:0]axi_w_wr_data_count;
  output [9:0]axis_data_count;
  input [8:0]axis_prog_empty_thresh;
  input [8:0]axis_prog_full_thresh;
  output [9:0]axis_rd_data_count;
  output [9:0]axis_wr_data_count;
  output [9:0]data_count;
  input [17:0]din;
  output [17:0]dout;
  output [31:0]m_axi_araddr;
  output [1:0]m_axi_arburst;
  output [3:0]m_axi_arcache;
  output [0:0]m_axi_arid;
  output [7:0]m_axi_arlen;
  output [0:0]m_axi_arlock;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  output [3:0]m_axi_arregion;
  output [2:0]m_axi_arsize;
  output [0:0]m_axi_aruser;
  output [31:0]m_axi_awaddr;
  output [1:0]m_axi_awburst;
  output [3:0]m_axi_awcache;
  output [0:0]m_axi_awid;
  output [7:0]m_axi_awlen;
  output [0:0]m_axi_awlock;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  output [3:0]m_axi_awregion;
  output [2:0]m_axi_awsize;
  output [0:0]m_axi_awuser;
  input [0:0]m_axi_bid;
  input [1:0]m_axi_bresp;
  input [0:0]m_axi_buser;
  input [63:0]m_axi_rdata;
  input [0:0]m_axi_rid;
  input [1:0]m_axi_rresp;
  input [0:0]m_axi_ruser;
  output [63:0]m_axi_wdata;
  output [0:0]m_axi_wid;
  output [7:0]m_axi_wstrb;
  output [0:0]m_axi_wuser;
  output [31:0]m_axis_tdata;
  output [0:0]m_axis_tdest;
  output [0:0]m_axis_tid;
  output [3:0]m_axis_tkeep;
  output [3:0]m_axis_tstrb;
  output [0:0]m_axis_tuser;
  input [9:0]prog_empty_thresh;
  input [9:0]prog_empty_thresh_assert;
  input [9:0]prog_empty_thresh_negate;
  input [9:0]prog_full_thresh;
  input [9:0]prog_full_thresh_assert;
  input [9:0]prog_full_thresh_negate;
  output [9:0]rd_data_count;
  input [31:0]s_axi_araddr;
  input [1:0]s_axi_arburst;
  input [3:0]s_axi_arcache;
  input [0:0]s_axi_arid;
  input [7:0]s_axi_arlen;
  input [0:0]s_axi_arlock;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  input [3:0]s_axi_arregion;
  input [2:0]s_axi_arsize;
  input [0:0]s_axi_aruser;
  input [31:0]s_axi_awaddr;
  input [1:0]s_axi_awburst;
  input [3:0]s_axi_awcache;
  input [0:0]s_axi_awid;
  input [7:0]s_axi_awlen;
  input [0:0]s_axi_awlock;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  input [3:0]s_axi_awregion;
  input [2:0]s_axi_awsize;
  input [0:0]s_axi_awuser;
  output [0:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output [0:0]s_axi_buser;
  output [63:0]s_axi_rdata;
  output [0:0]s_axi_rid;
  output [1:0]s_axi_rresp;
  output [0:0]s_axi_ruser;
  input [63:0]s_axi_wdata;
  input [0:0]s_axi_wid;
  input [7:0]s_axi_wstrb;
  input [0:0]s_axi_wuser;
  input [31:0]s_axis_tdata;
  input [0:0]s_axis_tdest;
  input [0:0]s_axis_tid;
  input [3:0]s_axis_tkeep;
  input [3:0]s_axis_tstrb;
  input [0:0]s_axis_tuser;
  output [9:0]wr_data_count;

  wire \<const0> ;
  wire \<const1> ;
  wire axis_prog_empty;
  wire axis_prog_full;
  wire [9:0]axis_rd_data_count;
  wire [9:0]axis_wr_data_count;
  wire m_aclk;
  wire [31:0]m_axis_tdata;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire s_aclk;
  wire s_aresetn;
  wire [31:0]s_axis_tdata;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire wr_rst_busy;

  assign almost_empty = \<const1> ;
  assign almost_full = \<const0> ;
  assign axi_ar_data_count[4] = \<const0> ;
  assign axi_ar_data_count[3] = \<const0> ;
  assign axi_ar_data_count[2] = \<const0> ;
  assign axi_ar_data_count[1] = \<const0> ;
  assign axi_ar_data_count[0] = \<const0> ;
  assign axi_ar_dbiterr = \<const0> ;
  assign axi_ar_overflow = \<const0> ;
  assign axi_ar_prog_empty = \<const1> ;
  assign axi_ar_prog_full = \<const0> ;
  assign axi_ar_rd_data_count[4] = \<const0> ;
  assign axi_ar_rd_data_count[3] = \<const0> ;
  assign axi_ar_rd_data_count[2] = \<const0> ;
  assign axi_ar_rd_data_count[1] = \<const0> ;
  assign axi_ar_rd_data_count[0] = \<const0> ;
  assign axi_ar_sbiterr = \<const0> ;
  assign axi_ar_underflow = \<const0> ;
  assign axi_ar_wr_data_count[4] = \<const0> ;
  assign axi_ar_wr_data_count[3] = \<const0> ;
  assign axi_ar_wr_data_count[2] = \<const0> ;
  assign axi_ar_wr_data_count[1] = \<const0> ;
  assign axi_ar_wr_data_count[0] = \<const0> ;
  assign axi_aw_data_count[4] = \<const0> ;
  assign axi_aw_data_count[3] = \<const0> ;
  assign axi_aw_data_count[2] = \<const0> ;
  assign axi_aw_data_count[1] = \<const0> ;
  assign axi_aw_data_count[0] = \<const0> ;
  assign axi_aw_dbiterr = \<const0> ;
  assign axi_aw_overflow = \<const0> ;
  assign axi_aw_prog_empty = \<const1> ;
  assign axi_aw_prog_full = \<const0> ;
  assign axi_aw_rd_data_count[4] = \<const0> ;
  assign axi_aw_rd_data_count[3] = \<const0> ;
  assign axi_aw_rd_data_count[2] = \<const0> ;
  assign axi_aw_rd_data_count[1] = \<const0> ;
  assign axi_aw_rd_data_count[0] = \<const0> ;
  assign axi_aw_sbiterr = \<const0> ;
  assign axi_aw_underflow = \<const0> ;
  assign axi_aw_wr_data_count[4] = \<const0> ;
  assign axi_aw_wr_data_count[3] = \<const0> ;
  assign axi_aw_wr_data_count[2] = \<const0> ;
  assign axi_aw_wr_data_count[1] = \<const0> ;
  assign axi_aw_wr_data_count[0] = \<const0> ;
  assign axi_b_data_count[4] = \<const0> ;
  assign axi_b_data_count[3] = \<const0> ;
  assign axi_b_data_count[2] = \<const0> ;
  assign axi_b_data_count[1] = \<const0> ;
  assign axi_b_data_count[0] = \<const0> ;
  assign axi_b_dbiterr = \<const0> ;
  assign axi_b_overflow = \<const0> ;
  assign axi_b_prog_empty = \<const1> ;
  assign axi_b_prog_full = \<const0> ;
  assign axi_b_rd_data_count[4] = \<const0> ;
  assign axi_b_rd_data_count[3] = \<const0> ;
  assign axi_b_rd_data_count[2] = \<const0> ;
  assign axi_b_rd_data_count[1] = \<const0> ;
  assign axi_b_rd_data_count[0] = \<const0> ;
  assign axi_b_sbiterr = \<const0> ;
  assign axi_b_underflow = \<const0> ;
  assign axi_b_wr_data_count[4] = \<const0> ;
  assign axi_b_wr_data_count[3] = \<const0> ;
  assign axi_b_wr_data_count[2] = \<const0> ;
  assign axi_b_wr_data_count[1] = \<const0> ;
  assign axi_b_wr_data_count[0] = \<const0> ;
  assign axi_r_data_count[10] = \<const0> ;
  assign axi_r_data_count[9] = \<const0> ;
  assign axi_r_data_count[8] = \<const0> ;
  assign axi_r_data_count[7] = \<const0> ;
  assign axi_r_data_count[6] = \<const0> ;
  assign axi_r_data_count[5] = \<const0> ;
  assign axi_r_data_count[4] = \<const0> ;
  assign axi_r_data_count[3] = \<const0> ;
  assign axi_r_data_count[2] = \<const0> ;
  assign axi_r_data_count[1] = \<const0> ;
  assign axi_r_data_count[0] = \<const0> ;
  assign axi_r_dbiterr = \<const0> ;
  assign axi_r_overflow = \<const0> ;
  assign axi_r_prog_empty = \<const1> ;
  assign axi_r_prog_full = \<const0> ;
  assign axi_r_rd_data_count[10] = \<const0> ;
  assign axi_r_rd_data_count[9] = \<const0> ;
  assign axi_r_rd_data_count[8] = \<const0> ;
  assign axi_r_rd_data_count[7] = \<const0> ;
  assign axi_r_rd_data_count[6] = \<const0> ;
  assign axi_r_rd_data_count[5] = \<const0> ;
  assign axi_r_rd_data_count[4] = \<const0> ;
  assign axi_r_rd_data_count[3] = \<const0> ;
  assign axi_r_rd_data_count[2] = \<const0> ;
  assign axi_r_rd_data_count[1] = \<const0> ;
  assign axi_r_rd_data_count[0] = \<const0> ;
  assign axi_r_sbiterr = \<const0> ;
  assign axi_r_underflow = \<const0> ;
  assign axi_r_wr_data_count[10] = \<const0> ;
  assign axi_r_wr_data_count[9] = \<const0> ;
  assign axi_r_wr_data_count[8] = \<const0> ;
  assign axi_r_wr_data_count[7] = \<const0> ;
  assign axi_r_wr_data_count[6] = \<const0> ;
  assign axi_r_wr_data_count[5] = \<const0> ;
  assign axi_r_wr_data_count[4] = \<const0> ;
  assign axi_r_wr_data_count[3] = \<const0> ;
  assign axi_r_wr_data_count[2] = \<const0> ;
  assign axi_r_wr_data_count[1] = \<const0> ;
  assign axi_r_wr_data_count[0] = \<const0> ;
  assign axi_w_data_count[10] = \<const0> ;
  assign axi_w_data_count[9] = \<const0> ;
  assign axi_w_data_count[8] = \<const0> ;
  assign axi_w_data_count[7] = \<const0> ;
  assign axi_w_data_count[6] = \<const0> ;
  assign axi_w_data_count[5] = \<const0> ;
  assign axi_w_data_count[4] = \<const0> ;
  assign axi_w_data_count[3] = \<const0> ;
  assign axi_w_data_count[2] = \<const0> ;
  assign axi_w_data_count[1] = \<const0> ;
  assign axi_w_data_count[0] = \<const0> ;
  assign axi_w_dbiterr = \<const0> ;
  assign axi_w_overflow = \<const0> ;
  assign axi_w_prog_empty = \<const1> ;
  assign axi_w_prog_full = \<const0> ;
  assign axi_w_rd_data_count[10] = \<const0> ;
  assign axi_w_rd_data_count[9] = \<const0> ;
  assign axi_w_rd_data_count[8] = \<const0> ;
  assign axi_w_rd_data_count[7] = \<const0> ;
  assign axi_w_rd_data_count[6] = \<const0> ;
  assign axi_w_rd_data_count[5] = \<const0> ;
  assign axi_w_rd_data_count[4] = \<const0> ;
  assign axi_w_rd_data_count[3] = \<const0> ;
  assign axi_w_rd_data_count[2] = \<const0> ;
  assign axi_w_rd_data_count[1] = \<const0> ;
  assign axi_w_rd_data_count[0] = \<const0> ;
  assign axi_w_sbiterr = \<const0> ;
  assign axi_w_underflow = \<const0> ;
  assign axi_w_wr_data_count[10] = \<const0> ;
  assign axi_w_wr_data_count[9] = \<const0> ;
  assign axi_w_wr_data_count[8] = \<const0> ;
  assign axi_w_wr_data_count[7] = \<const0> ;
  assign axi_w_wr_data_count[6] = \<const0> ;
  assign axi_w_wr_data_count[5] = \<const0> ;
  assign axi_w_wr_data_count[4] = \<const0> ;
  assign axi_w_wr_data_count[3] = \<const0> ;
  assign axi_w_wr_data_count[2] = \<const0> ;
  assign axi_w_wr_data_count[1] = \<const0> ;
  assign axi_w_wr_data_count[0] = \<const0> ;
  assign axis_data_count[9] = \<const0> ;
  assign axis_data_count[8] = \<const0> ;
  assign axis_data_count[7] = \<const0> ;
  assign axis_data_count[6] = \<const0> ;
  assign axis_data_count[5] = \<const0> ;
  assign axis_data_count[4] = \<const0> ;
  assign axis_data_count[3] = \<const0> ;
  assign axis_data_count[2] = \<const0> ;
  assign axis_data_count[1] = \<const0> ;
  assign axis_data_count[0] = \<const0> ;
  assign axis_dbiterr = \<const0> ;
  assign axis_overflow = \<const0> ;
  assign axis_sbiterr = \<const0> ;
  assign axis_underflow = \<const0> ;
  assign data_count[9] = \<const0> ;
  assign data_count[8] = \<const0> ;
  assign data_count[7] = \<const0> ;
  assign data_count[6] = \<const0> ;
  assign data_count[5] = \<const0> ;
  assign data_count[4] = \<const0> ;
  assign data_count[3] = \<const0> ;
  assign data_count[2] = \<const0> ;
  assign data_count[1] = \<const0> ;
  assign data_count[0] = \<const0> ;
  assign dbiterr = \<const0> ;
  assign dout[17] = \<const0> ;
  assign dout[16] = \<const0> ;
  assign dout[15] = \<const0> ;
  assign dout[14] = \<const0> ;
  assign dout[13] = \<const0> ;
  assign dout[12] = \<const0> ;
  assign dout[11] = \<const0> ;
  assign dout[10] = \<const0> ;
  assign dout[9] = \<const0> ;
  assign dout[8] = \<const0> ;
  assign dout[7] = \<const0> ;
  assign dout[6] = \<const0> ;
  assign dout[5] = \<const0> ;
  assign dout[4] = \<const0> ;
  assign dout[3] = \<const0> ;
  assign dout[2] = \<const0> ;
  assign dout[1] = \<const0> ;
  assign dout[0] = \<const0> ;
  assign empty = \<const1> ;
  assign full = \<const0> ;
  assign m_axi_araddr[31] = \<const0> ;
  assign m_axi_araddr[30] = \<const0> ;
  assign m_axi_araddr[29] = \<const0> ;
  assign m_axi_araddr[28] = \<const0> ;
  assign m_axi_araddr[27] = \<const0> ;
  assign m_axi_araddr[26] = \<const0> ;
  assign m_axi_araddr[25] = \<const0> ;
  assign m_axi_araddr[24] = \<const0> ;
  assign m_axi_araddr[23] = \<const0> ;
  assign m_axi_araddr[22] = \<const0> ;
  assign m_axi_araddr[21] = \<const0> ;
  assign m_axi_araddr[20] = \<const0> ;
  assign m_axi_araddr[19] = \<const0> ;
  assign m_axi_araddr[18] = \<const0> ;
  assign m_axi_araddr[17] = \<const0> ;
  assign m_axi_araddr[16] = \<const0> ;
  assign m_axi_araddr[15] = \<const0> ;
  assign m_axi_araddr[14] = \<const0> ;
  assign m_axi_araddr[13] = \<const0> ;
  assign m_axi_araddr[12] = \<const0> ;
  assign m_axi_araddr[11] = \<const0> ;
  assign m_axi_araddr[10] = \<const0> ;
  assign m_axi_araddr[9] = \<const0> ;
  assign m_axi_araddr[8] = \<const0> ;
  assign m_axi_araddr[7] = \<const0> ;
  assign m_axi_araddr[6] = \<const0> ;
  assign m_axi_araddr[5] = \<const0> ;
  assign m_axi_araddr[4] = \<const0> ;
  assign m_axi_araddr[3] = \<const0> ;
  assign m_axi_araddr[2] = \<const0> ;
  assign m_axi_araddr[1] = \<const0> ;
  assign m_axi_araddr[0] = \<const0> ;
  assign m_axi_arburst[1] = \<const0> ;
  assign m_axi_arburst[0] = \<const0> ;
  assign m_axi_arcache[3] = \<const0> ;
  assign m_axi_arcache[2] = \<const0> ;
  assign m_axi_arcache[1] = \<const0> ;
  assign m_axi_arcache[0] = \<const0> ;
  assign m_axi_arid[0] = \<const0> ;
  assign m_axi_arlen[7] = \<const0> ;
  assign m_axi_arlen[6] = \<const0> ;
  assign m_axi_arlen[5] = \<const0> ;
  assign m_axi_arlen[4] = \<const0> ;
  assign m_axi_arlen[3] = \<const0> ;
  assign m_axi_arlen[2] = \<const0> ;
  assign m_axi_arlen[1] = \<const0> ;
  assign m_axi_arlen[0] = \<const0> ;
  assign m_axi_arlock[0] = \<const0> ;
  assign m_axi_arprot[2] = \<const0> ;
  assign m_axi_arprot[1] = \<const0> ;
  assign m_axi_arprot[0] = \<const0> ;
  assign m_axi_arqos[3] = \<const0> ;
  assign m_axi_arqos[2] = \<const0> ;
  assign m_axi_arqos[1] = \<const0> ;
  assign m_axi_arqos[0] = \<const0> ;
  assign m_axi_arregion[3] = \<const0> ;
  assign m_axi_arregion[2] = \<const0> ;
  assign m_axi_arregion[1] = \<const0> ;
  assign m_axi_arregion[0] = \<const0> ;
  assign m_axi_arsize[2] = \<const0> ;
  assign m_axi_arsize[1] = \<const0> ;
  assign m_axi_arsize[0] = \<const0> ;
  assign m_axi_aruser[0] = \<const0> ;
  assign m_axi_arvalid = \<const0> ;
  assign m_axi_awaddr[31] = \<const0> ;
  assign m_axi_awaddr[30] = \<const0> ;
  assign m_axi_awaddr[29] = \<const0> ;
  assign m_axi_awaddr[28] = \<const0> ;
  assign m_axi_awaddr[27] = \<const0> ;
  assign m_axi_awaddr[26] = \<const0> ;
  assign m_axi_awaddr[25] = \<const0> ;
  assign m_axi_awaddr[24] = \<const0> ;
  assign m_axi_awaddr[23] = \<const0> ;
  assign m_axi_awaddr[22] = \<const0> ;
  assign m_axi_awaddr[21] = \<const0> ;
  assign m_axi_awaddr[20] = \<const0> ;
  assign m_axi_awaddr[19] = \<const0> ;
  assign m_axi_awaddr[18] = \<const0> ;
  assign m_axi_awaddr[17] = \<const0> ;
  assign m_axi_awaddr[16] = \<const0> ;
  assign m_axi_awaddr[15] = \<const0> ;
  assign m_axi_awaddr[14] = \<const0> ;
  assign m_axi_awaddr[13] = \<const0> ;
  assign m_axi_awaddr[12] = \<const0> ;
  assign m_axi_awaddr[11] = \<const0> ;
  assign m_axi_awaddr[10] = \<const0> ;
  assign m_axi_awaddr[9] = \<const0> ;
  assign m_axi_awaddr[8] = \<const0> ;
  assign m_axi_awaddr[7] = \<const0> ;
  assign m_axi_awaddr[6] = \<const0> ;
  assign m_axi_awaddr[5] = \<const0> ;
  assign m_axi_awaddr[4] = \<const0> ;
  assign m_axi_awaddr[3] = \<const0> ;
  assign m_axi_awaddr[2] = \<const0> ;
  assign m_axi_awaddr[1] = \<const0> ;
  assign m_axi_awaddr[0] = \<const0> ;
  assign m_axi_awburst[1] = \<const0> ;
  assign m_axi_awburst[0] = \<const0> ;
  assign m_axi_awcache[3] = \<const0> ;
  assign m_axi_awcache[2] = \<const0> ;
  assign m_axi_awcache[1] = \<const0> ;
  assign m_axi_awcache[0] = \<const0> ;
  assign m_axi_awid[0] = \<const0> ;
  assign m_axi_awlen[7] = \<const0> ;
  assign m_axi_awlen[6] = \<const0> ;
  assign m_axi_awlen[5] = \<const0> ;
  assign m_axi_awlen[4] = \<const0> ;
  assign m_axi_awlen[3] = \<const0> ;
  assign m_axi_awlen[2] = \<const0> ;
  assign m_axi_awlen[1] = \<const0> ;
  assign m_axi_awlen[0] = \<const0> ;
  assign m_axi_awlock[0] = \<const0> ;
  assign m_axi_awprot[2] = \<const0> ;
  assign m_axi_awprot[1] = \<const0> ;
  assign m_axi_awprot[0] = \<const0> ;
  assign m_axi_awqos[3] = \<const0> ;
  assign m_axi_awqos[2] = \<const0> ;
  assign m_axi_awqos[1] = \<const0> ;
  assign m_axi_awqos[0] = \<const0> ;
  assign m_axi_awregion[3] = \<const0> ;
  assign m_axi_awregion[2] = \<const0> ;
  assign m_axi_awregion[1] = \<const0> ;
  assign m_axi_awregion[0] = \<const0> ;
  assign m_axi_awsize[2] = \<const0> ;
  assign m_axi_awsize[1] = \<const0> ;
  assign m_axi_awsize[0] = \<const0> ;
  assign m_axi_awuser[0] = \<const0> ;
  assign m_axi_awvalid = \<const0> ;
  assign m_axi_bready = \<const0> ;
  assign m_axi_rready = \<const0> ;
  assign m_axi_wdata[63] = \<const0> ;
  assign m_axi_wdata[62] = \<const0> ;
  assign m_axi_wdata[61] = \<const0> ;
  assign m_axi_wdata[60] = \<const0> ;
  assign m_axi_wdata[59] = \<const0> ;
  assign m_axi_wdata[58] = \<const0> ;
  assign m_axi_wdata[57] = \<const0> ;
  assign m_axi_wdata[56] = \<const0> ;
  assign m_axi_wdata[55] = \<const0> ;
  assign m_axi_wdata[54] = \<const0> ;
  assign m_axi_wdata[53] = \<const0> ;
  assign m_axi_wdata[52] = \<const0> ;
  assign m_axi_wdata[51] = \<const0> ;
  assign m_axi_wdata[50] = \<const0> ;
  assign m_axi_wdata[49] = \<const0> ;
  assign m_axi_wdata[48] = \<const0> ;
  assign m_axi_wdata[47] = \<const0> ;
  assign m_axi_wdata[46] = \<const0> ;
  assign m_axi_wdata[45] = \<const0> ;
  assign m_axi_wdata[44] = \<const0> ;
  assign m_axi_wdata[43] = \<const0> ;
  assign m_axi_wdata[42] = \<const0> ;
  assign m_axi_wdata[41] = \<const0> ;
  assign m_axi_wdata[40] = \<const0> ;
  assign m_axi_wdata[39] = \<const0> ;
  assign m_axi_wdata[38] = \<const0> ;
  assign m_axi_wdata[37] = \<const0> ;
  assign m_axi_wdata[36] = \<const0> ;
  assign m_axi_wdata[35] = \<const0> ;
  assign m_axi_wdata[34] = \<const0> ;
  assign m_axi_wdata[33] = \<const0> ;
  assign m_axi_wdata[32] = \<const0> ;
  assign m_axi_wdata[31] = \<const0> ;
  assign m_axi_wdata[30] = \<const0> ;
  assign m_axi_wdata[29] = \<const0> ;
  assign m_axi_wdata[28] = \<const0> ;
  assign m_axi_wdata[27] = \<const0> ;
  assign m_axi_wdata[26] = \<const0> ;
  assign m_axi_wdata[25] = \<const0> ;
  assign m_axi_wdata[24] = \<const0> ;
  assign m_axi_wdata[23] = \<const0> ;
  assign m_axi_wdata[22] = \<const0> ;
  assign m_axi_wdata[21] = \<const0> ;
  assign m_axi_wdata[20] = \<const0> ;
  assign m_axi_wdata[19] = \<const0> ;
  assign m_axi_wdata[18] = \<const0> ;
  assign m_axi_wdata[17] = \<const0> ;
  assign m_axi_wdata[16] = \<const0> ;
  assign m_axi_wdata[15] = \<const0> ;
  assign m_axi_wdata[14] = \<const0> ;
  assign m_axi_wdata[13] = \<const0> ;
  assign m_axi_wdata[12] = \<const0> ;
  assign m_axi_wdata[11] = \<const0> ;
  assign m_axi_wdata[10] = \<const0> ;
  assign m_axi_wdata[9] = \<const0> ;
  assign m_axi_wdata[8] = \<const0> ;
  assign m_axi_wdata[7] = \<const0> ;
  assign m_axi_wdata[6] = \<const0> ;
  assign m_axi_wdata[5] = \<const0> ;
  assign m_axi_wdata[4] = \<const0> ;
  assign m_axi_wdata[3] = \<const0> ;
  assign m_axi_wdata[2] = \<const0> ;
  assign m_axi_wdata[1] = \<const0> ;
  assign m_axi_wdata[0] = \<const0> ;
  assign m_axi_wid[0] = \<const0> ;
  assign m_axi_wlast = \<const0> ;
  assign m_axi_wstrb[7] = \<const0> ;
  assign m_axi_wstrb[6] = \<const0> ;
  assign m_axi_wstrb[5] = \<const0> ;
  assign m_axi_wstrb[4] = \<const0> ;
  assign m_axi_wstrb[3] = \<const0> ;
  assign m_axi_wstrb[2] = \<const0> ;
  assign m_axi_wstrb[1] = \<const0> ;
  assign m_axi_wstrb[0] = \<const0> ;
  assign m_axi_wuser[0] = \<const0> ;
  assign m_axi_wvalid = \<const0> ;
  assign m_axis_tdest[0] = \<const0> ;
  assign m_axis_tid[0] = \<const0> ;
  assign m_axis_tkeep[3] = \<const0> ;
  assign m_axis_tkeep[2] = \<const0> ;
  assign m_axis_tkeep[1] = \<const0> ;
  assign m_axis_tkeep[0] = \<const0> ;
  assign m_axis_tlast = \<const0> ;
  assign m_axis_tstrb[3] = \<const0> ;
  assign m_axis_tstrb[2] = \<const0> ;
  assign m_axis_tstrb[1] = \<const0> ;
  assign m_axis_tstrb[0] = \<const0> ;
  assign m_axis_tuser[0] = \<const0> ;
  assign overflow = \<const0> ;
  assign prog_empty = \<const1> ;
  assign prog_full = \<const0> ;
  assign rd_data_count[9] = \<const0> ;
  assign rd_data_count[8] = \<const0> ;
  assign rd_data_count[7] = \<const0> ;
  assign rd_data_count[6] = \<const0> ;
  assign rd_data_count[5] = \<const0> ;
  assign rd_data_count[4] = \<const0> ;
  assign rd_data_count[3] = \<const0> ;
  assign rd_data_count[2] = \<const0> ;
  assign rd_data_count[1] = \<const0> ;
  assign rd_data_count[0] = \<const0> ;
  assign rd_rst_busy = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_buser[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_rdata[63] = \<const0> ;
  assign s_axi_rdata[62] = \<const0> ;
  assign s_axi_rdata[61] = \<const0> ;
  assign s_axi_rdata[60] = \<const0> ;
  assign s_axi_rdata[59] = \<const0> ;
  assign s_axi_rdata[58] = \<const0> ;
  assign s_axi_rdata[57] = \<const0> ;
  assign s_axi_rdata[56] = \<const0> ;
  assign s_axi_rdata[55] = \<const0> ;
  assign s_axi_rdata[54] = \<const0> ;
  assign s_axi_rdata[53] = \<const0> ;
  assign s_axi_rdata[52] = \<const0> ;
  assign s_axi_rdata[51] = \<const0> ;
  assign s_axi_rdata[50] = \<const0> ;
  assign s_axi_rdata[49] = \<const0> ;
  assign s_axi_rdata[48] = \<const0> ;
  assign s_axi_rdata[47] = \<const0> ;
  assign s_axi_rdata[46] = \<const0> ;
  assign s_axi_rdata[45] = \<const0> ;
  assign s_axi_rdata[44] = \<const0> ;
  assign s_axi_rdata[43] = \<const0> ;
  assign s_axi_rdata[42] = \<const0> ;
  assign s_axi_rdata[41] = \<const0> ;
  assign s_axi_rdata[40] = \<const0> ;
  assign s_axi_rdata[39] = \<const0> ;
  assign s_axi_rdata[38] = \<const0> ;
  assign s_axi_rdata[37] = \<const0> ;
  assign s_axi_rdata[36] = \<const0> ;
  assign s_axi_rdata[35] = \<const0> ;
  assign s_axi_rdata[34] = \<const0> ;
  assign s_axi_rdata[33] = \<const0> ;
  assign s_axi_rdata[32] = \<const0> ;
  assign s_axi_rdata[31] = \<const0> ;
  assign s_axi_rdata[30] = \<const0> ;
  assign s_axi_rdata[29] = \<const0> ;
  assign s_axi_rdata[28] = \<const0> ;
  assign s_axi_rdata[27] = \<const0> ;
  assign s_axi_rdata[26] = \<const0> ;
  assign s_axi_rdata[25] = \<const0> ;
  assign s_axi_rdata[24] = \<const0> ;
  assign s_axi_rdata[23] = \<const0> ;
  assign s_axi_rdata[22] = \<const0> ;
  assign s_axi_rdata[21] = \<const0> ;
  assign s_axi_rdata[20] = \<const0> ;
  assign s_axi_rdata[19] = \<const0> ;
  assign s_axi_rdata[18] = \<const0> ;
  assign s_axi_rdata[17] = \<const0> ;
  assign s_axi_rdata[16] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_ruser[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign sbiterr = \<const0> ;
  assign underflow = \<const0> ;
  assign valid = \<const0> ;
  assign wr_ack = \<const0> ;
  assign wr_data_count[9] = \<const0> ;
  assign wr_data_count[8] = \<const0> ;
  assign wr_data_count[7] = \<const0> ;
  assign wr_data_count[6] = \<const0> ;
  assign wr_data_count[5] = \<const0> ;
  assign wr_data_count[4] = \<const0> ;
  assign wr_data_count[3] = \<const0> ;
  assign wr_data_count[2] = \<const0> ;
  assign wr_data_count[1] = \<const0> ;
  assign wr_data_count[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_fifo_generator_v13_2_5_synth inst_fifo_gen
       (.axis_prog_empty(axis_prog_empty),
        .axis_prog_full(axis_prog_full),
        .axis_rd_data_count(axis_rd_data_count),
        .axis_wr_data_count(axis_wr_data_count),
        .m_aclk(m_aclk),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .s_aclk(s_aclk),
        .s_aresetn(s_aresetn),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* ORIG_REF_NAME = "fifo_generator_v13_2_5_synth" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_fifo_generator_v13_2_5_synth
   (axis_prog_empty,
    axis_prog_full,
    m_aclk,
    m_axis_tready,
    m_axis_tvalid,
    s_aclk,
    s_aresetn,
    s_axis_tready,
    s_axis_tvalid,
    wr_rst_busy,
    axis_rd_data_count,
    axis_wr_data_count,
    m_axis_tdata,
    s_axis_tdata);
  output axis_prog_empty;
  output axis_prog_full;
  input m_aclk;
  input m_axis_tready;
  output m_axis_tvalid;
  input s_aclk;
  input s_aresetn;
  output s_axis_tready;
  input s_axis_tvalid;
  output wr_rst_busy;
  output [9:0]axis_rd_data_count;
  output [9:0]axis_wr_data_count;
  output [31:0]m_axis_tdata;
  input [31:0]s_axis_tdata;

  wire axis_prog_empty;
  wire axis_prog_full;
  wire [9:0]axis_rd_data_count;
  wire [9:0]axis_wr_data_count;
  wire m_aclk;
  wire [31:0]m_axis_tdata;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire s_aclk;
  wire s_aresetn;
  wire [31:0]s_axis_tdata;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire wr_rst_busy;

  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_fifo_generator_top \gaxis_fifo.gaxisf.axisf 
       (.axis_prog_empty(axis_prog_empty),
        .axis_prog_full(axis_prog_full),
        .axis_rd_data_count(axis_rd_data_count),
        .axis_wr_data_count(axis_wr_data_count),
        .m_aclk(m_aclk),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .s_aclk(s_aclk),
        .s_aresetn(s_aresetn),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* ORIG_REF_NAME = "memory" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_memory
   (ENB_I,
    ENB_dly_D,
    m_aclk,
    out,
    s_aclk,
    s_axis_tvalid,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    E,
    Q,
    \goreg_bm.dout_i_reg[31]_0 ,
    m_axis_tdata,
    s_axis_tdata);
  input ENB_I;
  output ENB_dly_D;
  input m_aclk;
  input out;
  input s_aclk;
  input s_axis_tvalid;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  input [0:0]E;
  input [8:0]Q;
  input [0:0]\goreg_bm.dout_i_reg[31]_0 ;
  output [31:0]m_axis_tdata;
  input [31:0]s_axis_tdata;

  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  wire [0:0]E;
  wire ENB_I;
  wire ENB_dly_D;
  wire [8:0]Q;
  wire [31:0]doutb;
  wire [0:0]\goreg_bm.dout_i_reg[31]_0 ;
  wire m_aclk;
  wire [31:0]m_axis_tdata;
  wire out;
  wire s_aclk;
  wire [31:0]s_axis_tdata;
  wire s_axis_tvalid;

  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_blk_mem_gen_v8_4_4 \gbm.gbmg.gbmga.ngecc.bmg 
       (.D(doutb),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ),
        .E(E),
        .ENB_I(ENB_I),
        .ENB_dly_D(ENB_dly_D),
        .Q(Q),
        .m_aclk(m_aclk),
        .out(out),
        .s_aclk(s_aclk),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tvalid(s_axis_tvalid));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[0] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[31]_0 ),
        .D(doutb[0]),
        .Q(m_axis_tdata[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[10] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[31]_0 ),
        .D(doutb[10]),
        .Q(m_axis_tdata[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[11] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[31]_0 ),
        .D(doutb[11]),
        .Q(m_axis_tdata[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[12] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[31]_0 ),
        .D(doutb[12]),
        .Q(m_axis_tdata[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[13] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[31]_0 ),
        .D(doutb[13]),
        .Q(m_axis_tdata[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[14] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[31]_0 ),
        .D(doutb[14]),
        .Q(m_axis_tdata[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[15] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[31]_0 ),
        .D(doutb[15]),
        .Q(m_axis_tdata[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[16] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[31]_0 ),
        .D(doutb[16]),
        .Q(m_axis_tdata[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[17] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[31]_0 ),
        .D(doutb[17]),
        .Q(m_axis_tdata[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[18] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[31]_0 ),
        .D(doutb[18]),
        .Q(m_axis_tdata[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[19] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[31]_0 ),
        .D(doutb[19]),
        .Q(m_axis_tdata[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[1] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[31]_0 ),
        .D(doutb[1]),
        .Q(m_axis_tdata[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[20] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[31]_0 ),
        .D(doutb[20]),
        .Q(m_axis_tdata[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[21] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[31]_0 ),
        .D(doutb[21]),
        .Q(m_axis_tdata[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[22] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[31]_0 ),
        .D(doutb[22]),
        .Q(m_axis_tdata[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[23] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[31]_0 ),
        .D(doutb[23]),
        .Q(m_axis_tdata[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[24] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[31]_0 ),
        .D(doutb[24]),
        .Q(m_axis_tdata[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[25] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[31]_0 ),
        .D(doutb[25]),
        .Q(m_axis_tdata[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[26] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[31]_0 ),
        .D(doutb[26]),
        .Q(m_axis_tdata[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[27] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[31]_0 ),
        .D(doutb[27]),
        .Q(m_axis_tdata[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[28] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[31]_0 ),
        .D(doutb[28]),
        .Q(m_axis_tdata[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[29] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[31]_0 ),
        .D(doutb[29]),
        .Q(m_axis_tdata[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[2] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[31]_0 ),
        .D(doutb[2]),
        .Q(m_axis_tdata[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[30] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[31]_0 ),
        .D(doutb[30]),
        .Q(m_axis_tdata[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[31] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[31]_0 ),
        .D(doutb[31]),
        .Q(m_axis_tdata[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[3] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[31]_0 ),
        .D(doutb[3]),
        .Q(m_axis_tdata[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[4] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[31]_0 ),
        .D(doutb[4]),
        .Q(m_axis_tdata[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[5] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[31]_0 ),
        .D(doutb[5]),
        .Q(m_axis_tdata[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[6] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[31]_0 ),
        .D(doutb[6]),
        .Q(m_axis_tdata[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[7] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[31]_0 ),
        .D(doutb[7]),
        .Q(m_axis_tdata[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[8] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[31]_0 ),
        .D(doutb[8]),
        .Q(m_axis_tdata[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[9] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[31]_0 ),
        .D(doutb[9]),
        .Q(m_axis_tdata[9]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "rd_bin_cntr" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_rd_bin_cntr
   (\gc0.count_d1_reg[0]_0 ,
    m_aclk,
    ram_rd_en,
    DI,
    Q,
    S,
    WR_PNTR_RD,
    \gc0.count_d1_reg[6]_0 ,
    \gc0.count_d1_reg[7]_0 ,
    \gc0.count_reg[8]_0 ,
    v1_reg);
  input \gc0.count_d1_reg[0]_0 ;
  input m_aclk;
  input ram_rd_en;
  output [0:0]DI;
  output [8:0]Q;
  output [3:0]S;
  input [8:0]WR_PNTR_RD;
  output [3:0]\gc0.count_d1_reg[6]_0 ;
  output [0:0]\gc0.count_d1_reg[7]_0 ;
  output [0:0]\gc0.count_reg[8]_0 ;
  output [3:0]v1_reg;

  wire [0:0]DI;
  wire [8:0]Q;
  wire [3:0]S;
  wire [8:0]WR_PNTR_RD;
  wire \gc0.count[8]_i_2_n_0 ;
  wire \gc0.count_d1_reg[0]_0 ;
  wire [3:0]\gc0.count_d1_reg[6]_0 ;
  wire [0:0]\gc0.count_d1_reg[7]_0 ;
  wire [0:0]\gc0.count_reg[8]_0 ;
  wire m_aclk;
  wire [8:0]plusOp__1;
  wire ram_rd_en;
  wire [7:0]rd_pntr_plus1;
  wire [3:0]v1_reg;

  LUT1 #(
    .INIT(2'h1)) 
    \gc0.count[0]_i_1 
       (.I0(rd_pntr_plus1[0]),
        .O(plusOp__1[0]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \gc0.count[1]_i_1 
       (.I0(rd_pntr_plus1[0]),
        .I1(rd_pntr_plus1[1]),
        .O(plusOp__1[1]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \gc0.count[2]_i_1 
       (.I0(rd_pntr_plus1[0]),
        .I1(rd_pntr_plus1[1]),
        .I2(rd_pntr_plus1[2]),
        .O(plusOp__1[2]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \gc0.count[3]_i_1 
       (.I0(rd_pntr_plus1[1]),
        .I1(rd_pntr_plus1[0]),
        .I2(rd_pntr_plus1[2]),
        .I3(rd_pntr_plus1[3]),
        .O(plusOp__1[3]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \gc0.count[4]_i_1 
       (.I0(rd_pntr_plus1[2]),
        .I1(rd_pntr_plus1[0]),
        .I2(rd_pntr_plus1[1]),
        .I3(rd_pntr_plus1[3]),
        .I4(rd_pntr_plus1[4]),
        .O(plusOp__1[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \gc0.count[5]_i_1 
       (.I0(rd_pntr_plus1[3]),
        .I1(rd_pntr_plus1[1]),
        .I2(rd_pntr_plus1[0]),
        .I3(rd_pntr_plus1[2]),
        .I4(rd_pntr_plus1[4]),
        .I5(rd_pntr_plus1[5]),
        .O(plusOp__1[5]));
  LUT2 #(
    .INIT(4'h6)) 
    \gc0.count[6]_i_1 
       (.I0(\gc0.count[8]_i_2_n_0 ),
        .I1(rd_pntr_plus1[6]),
        .O(plusOp__1[6]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \gc0.count[7]_i_1 
       (.I0(\gc0.count[8]_i_2_n_0 ),
        .I1(rd_pntr_plus1[6]),
        .I2(rd_pntr_plus1[7]),
        .O(plusOp__1[7]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \gc0.count[8]_i_1 
       (.I0(rd_pntr_plus1[6]),
        .I1(\gc0.count[8]_i_2_n_0 ),
        .I2(rd_pntr_plus1[7]),
        .I3(\gc0.count_reg[8]_0 ),
        .O(plusOp__1[8]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \gc0.count[8]_i_2 
       (.I0(rd_pntr_plus1[5]),
        .I1(rd_pntr_plus1[3]),
        .I2(rd_pntr_plus1[1]),
        .I3(rd_pntr_plus1[0]),
        .I4(rd_pntr_plus1[2]),
        .I5(rd_pntr_plus1[4]),
        .O(\gc0.count[8]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[0] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(rd_pntr_plus1[0]),
        .Q(Q[0]),
        .R(\gc0.count_d1_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[1] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(rd_pntr_plus1[1]),
        .Q(Q[1]),
        .R(\gc0.count_d1_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[2] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(rd_pntr_plus1[2]),
        .Q(Q[2]),
        .R(\gc0.count_d1_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[3] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(rd_pntr_plus1[3]),
        .Q(Q[3]),
        .R(\gc0.count_d1_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[4] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(rd_pntr_plus1[4]),
        .Q(Q[4]),
        .R(\gc0.count_d1_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[5] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(rd_pntr_plus1[5]),
        .Q(Q[5]),
        .R(\gc0.count_d1_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[6] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(rd_pntr_plus1[6]),
        .Q(Q[6]),
        .R(\gc0.count_d1_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[7] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(rd_pntr_plus1[7]),
        .Q(Q[7]),
        .R(\gc0.count_d1_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[8] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(\gc0.count_reg[8]_0 ),
        .Q(Q[8]),
        .R(\gc0.count_d1_reg[0]_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \gc0.count_reg[0] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(plusOp__1[0]),
        .Q(rd_pntr_plus1[0]),
        .S(\gc0.count_d1_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[1] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(plusOp__1[1]),
        .Q(rd_pntr_plus1[1]),
        .R(\gc0.count_d1_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[2] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(plusOp__1[2]),
        .Q(rd_pntr_plus1[2]),
        .R(\gc0.count_d1_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[3] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(plusOp__1[3]),
        .Q(rd_pntr_plus1[3]),
        .R(\gc0.count_d1_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[4] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(plusOp__1[4]),
        .Q(rd_pntr_plus1[4]),
        .R(\gc0.count_d1_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[5] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(plusOp__1[5]),
        .Q(rd_pntr_plus1[5]),
        .R(\gc0.count_d1_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[6] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(plusOp__1[6]),
        .Q(rd_pntr_plus1[6]),
        .R(\gc0.count_d1_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[7] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(plusOp__1[7]),
        .Q(rd_pntr_plus1[7]),
        .R(\gc0.count_d1_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[8] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(plusOp__1[8]),
        .Q(\gc0.count_reg[8]_0 ),
        .R(\gc0.count_d1_reg[0]_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1__2 
       (.I0(rd_pntr_plus1[0]),
        .I1(WR_PNTR_RD[0]),
        .I2(rd_pntr_plus1[1]),
        .I3(WR_PNTR_RD[1]),
        .O(v1_reg[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1__2 
       (.I0(rd_pntr_plus1[2]),
        .I1(WR_PNTR_RD[2]),
        .I2(rd_pntr_plus1[3]),
        .I3(WR_PNTR_RD[3]),
        .O(v1_reg[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1__2 
       (.I0(rd_pntr_plus1[4]),
        .I1(WR_PNTR_RD[4]),
        .I2(rd_pntr_plus1[5]),
        .I3(WR_PNTR_RD[5]),
        .O(v1_reg[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1__2 
       (.I0(rd_pntr_plus1[6]),
        .I1(WR_PNTR_RD[6]),
        .I2(rd_pntr_plus1[7]),
        .I3(WR_PNTR_RD[7]),
        .O(v1_reg[3]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__0_i_5__0
       (.I0(Q[6]),
        .I1(WR_PNTR_RD[6]),
        .I2(Q[7]),
        .I3(WR_PNTR_RD[7]),
        .O(\gc0.count_d1_reg[6]_0 [3]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__0_i_6__0
       (.I0(Q[5]),
        .I1(WR_PNTR_RD[5]),
        .I2(Q[6]),
        .I3(WR_PNTR_RD[6]),
        .O(\gc0.count_d1_reg[6]_0 [2]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__0_i_7__0
       (.I0(Q[4]),
        .I1(WR_PNTR_RD[4]),
        .I2(Q[5]),
        .I3(WR_PNTR_RD[5]),
        .O(\gc0.count_d1_reg[6]_0 [1]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__0_i_8__0
       (.I0(Q[3]),
        .I1(WR_PNTR_RD[3]),
        .I2(Q[4]),
        .I3(WR_PNTR_RD[4]),
        .O(\gc0.count_d1_reg[6]_0 [0]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__1_i_1__0
       (.I0(Q[7]),
        .I1(WR_PNTR_RD[7]),
        .I2(Q[8]),
        .I3(WR_PNTR_RD[8]),
        .O(\gc0.count_d1_reg[7]_0 ));
  LUT3 #(
    .INIT(8'h71)) 
    plusOp__0_carry_i_3__0
       (.I0(Q[0]),
        .I1(ram_rd_en),
        .I2(WR_PNTR_RD[0]),
        .O(DI));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry_i_4__0
       (.I0(Q[2]),
        .I1(WR_PNTR_RD[2]),
        .I2(Q[3]),
        .I3(WR_PNTR_RD[3]),
        .O(S[3]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry_i_5__0
       (.I0(Q[1]),
        .I1(WR_PNTR_RD[1]),
        .I2(Q[2]),
        .I3(WR_PNTR_RD[2]),
        .O(S[2]));
  LUT5 #(
    .INIT(32'hD42B2BD4)) 
    plusOp__0_carry_i_6__0
       (.I0(WR_PNTR_RD[0]),
        .I1(ram_rd_en),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(WR_PNTR_RD[1]),
        .O(S[1]));
  LUT3 #(
    .INIT(8'h96)) 
    plusOp__0_carry_i_7__0
       (.I0(WR_PNTR_RD[0]),
        .I1(Q[0]),
        .I2(ram_rd_en),
        .O(S[0]));
endmodule

(* ORIG_REF_NAME = "rd_dc_fwft_ext_as" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_rd_dc_fwft_ext_as
   (\g_rd.gvalid_low.rd_dc_i_reg[0]_0 ,
    \g_rd.gvalid_low.rd_dc_i_reg[1]_0 ,
    \g_rd.gvalid_low.rd_dc_i_reg[2]_0 ,
    \g_rd.gvalid_low.rd_dc_i_reg[3]_0 ,
    \g_rd.gvalid_low.rd_dc_i_reg[4]_0 ,
    \g_rd.gvalid_low.rd_dc_i_reg[5]_0 ,
    \g_rd.gvalid_low.rd_dc_i_reg[6]_0 ,
    \g_rd.gvalid_low.rd_dc_i_reg[7]_0 ,
    \g_rd.gvalid_low.rd_dc_i_reg[8]_0 ,
    \g_rd.gvalid_low.rd_dc_i_reg[9]_0 ,
    m_aclk,
    axis_rd_data_count,
    rd_dc_i);
  input \g_rd.gvalid_low.rd_dc_i_reg[0]_0 ;
  input \g_rd.gvalid_low.rd_dc_i_reg[1]_0 ;
  input \g_rd.gvalid_low.rd_dc_i_reg[2]_0 ;
  input \g_rd.gvalid_low.rd_dc_i_reg[3]_0 ;
  input \g_rd.gvalid_low.rd_dc_i_reg[4]_0 ;
  input \g_rd.gvalid_low.rd_dc_i_reg[5]_0 ;
  input \g_rd.gvalid_low.rd_dc_i_reg[6]_0 ;
  input \g_rd.gvalid_low.rd_dc_i_reg[7]_0 ;
  input \g_rd.gvalid_low.rd_dc_i_reg[8]_0 ;
  input \g_rd.gvalid_low.rd_dc_i_reg[9]_0 ;
  input m_aclk;
  output [9:0]axis_rd_data_count;
  input [0:0]rd_dc_i;

  wire [9:0]axis_rd_data_count;
  wire \g_rd.gvalid_low.rd_dc_i_reg[0]_0 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[1]_0 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[2]_0 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[3]_0 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[4]_0 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[5]_0 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[6]_0 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[7]_0 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[8]_0 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[9]_0 ;
  wire m_aclk;
  wire [0:0]rd_dc_i;

  FDRE #(
    .INIT(1'b0)) 
    \g_rd.gvalid_low.rd_dc_i_reg[0] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(\g_rd.gvalid_low.rd_dc_i_reg[0]_0 ),
        .Q(axis_rd_data_count[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \g_rd.gvalid_low.rd_dc_i_reg[1] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(\g_rd.gvalid_low.rd_dc_i_reg[1]_0 ),
        .Q(axis_rd_data_count[1]),
        .R(rd_dc_i));
  FDRE #(
    .INIT(1'b0)) 
    \g_rd.gvalid_low.rd_dc_i_reg[2] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(\g_rd.gvalid_low.rd_dc_i_reg[2]_0 ),
        .Q(axis_rd_data_count[2]),
        .R(rd_dc_i));
  FDRE #(
    .INIT(1'b0)) 
    \g_rd.gvalid_low.rd_dc_i_reg[3] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(\g_rd.gvalid_low.rd_dc_i_reg[3]_0 ),
        .Q(axis_rd_data_count[3]),
        .R(rd_dc_i));
  FDRE #(
    .INIT(1'b0)) 
    \g_rd.gvalid_low.rd_dc_i_reg[4] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(\g_rd.gvalid_low.rd_dc_i_reg[4]_0 ),
        .Q(axis_rd_data_count[4]),
        .R(rd_dc_i));
  FDRE #(
    .INIT(1'b0)) 
    \g_rd.gvalid_low.rd_dc_i_reg[5] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(\g_rd.gvalid_low.rd_dc_i_reg[5]_0 ),
        .Q(axis_rd_data_count[5]),
        .R(rd_dc_i));
  FDRE #(
    .INIT(1'b0)) 
    \g_rd.gvalid_low.rd_dc_i_reg[6] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(\g_rd.gvalid_low.rd_dc_i_reg[6]_0 ),
        .Q(axis_rd_data_count[6]),
        .R(rd_dc_i));
  FDRE #(
    .INIT(1'b0)) 
    \g_rd.gvalid_low.rd_dc_i_reg[7] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(\g_rd.gvalid_low.rd_dc_i_reg[7]_0 ),
        .Q(axis_rd_data_count[7]),
        .R(rd_dc_i));
  FDRE #(
    .INIT(1'b0)) 
    \g_rd.gvalid_low.rd_dc_i_reg[8] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(\g_rd.gvalid_low.rd_dc_i_reg[8]_0 ),
        .Q(axis_rd_data_count[8]),
        .R(rd_dc_i));
  FDRE #(
    .INIT(1'b0)) 
    \g_rd.gvalid_low.rd_dc_i_reg[9] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(\g_rd.gvalid_low.rd_dc_i_reg[9]_0 ),
        .Q(axis_rd_data_count[9]),
        .R(rd_dc_i));
endmodule

(* ORIG_REF_NAME = "rd_fwft" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_rd_fwft
   (ENB_I,
    ENB_dly_D,
    empty_fwft_i_reg_0,
    \gpregsm1.curr_fwft_state_reg[1]_0 ,
    m_aclk,
    m_axis_tready,
    m_axis_tvalid,
    out,
    ram_rd_en,
    E,
    O,
    rd_dc_i);
  output ENB_I;
  input ENB_dly_D;
  input empty_fwft_i_reg_0;
  output \gpregsm1.curr_fwft_state_reg[1]_0 ;
  input m_aclk;
  input m_axis_tready;
  output m_axis_tvalid;
  input out;
  output ram_rd_en;
  output [0:0]E;
  input [0:0]O;
  output [0:0]rd_dc_i;

  wire [0:0]E;
  wire ENB_I;
  wire ENB_dly_D;
  wire [0:0]O;
  (* DONT_TOUCH *) wire aempty_fwft_fb_i;
  (* DONT_TOUCH *) wire aempty_fwft_i;
  wire aempty_fwft_i0__1;
  (* DONT_TOUCH *) wire [1:0]curr_fwft_state;
  (* DONT_TOUCH *) wire empty_fwft_fb_i;
  (* DONT_TOUCH *) wire empty_fwft_fb_o_i;
  wire empty_fwft_fb_o_i_reg0;
  (* DONT_TOUCH *) wire empty_fwft_i;
  wire empty_fwft_i0__1;
  wire empty_fwft_i_reg_0;
  wire \gpregsm1.curr_fwft_state_reg[1]_0 ;
  wire m_aclk;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire [1:0]next_fwft_state;
  wire out;
  wire ram_rd_en;
  wire [0:0]rd_dc_i;
  (* DONT_TOUCH *) wire user_valid;

  LUT4 #(
    .INIT(16'hAABA)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_i_1 
       (.I0(ENB_dly_D),
        .I1(empty_fwft_i_reg_0),
        .I2(ram_rd_en),
        .I3(out),
        .O(ENB_I));
  LUT6 #(
    .INIT(64'hFFFFF02F20000000)) 
    aempty_fwft_fb_i_i_1
       (.I0(m_axis_tready),
        .I1(empty_fwft_fb_o_i),
        .I2(curr_fwft_state[0]),
        .I3(curr_fwft_state[1]),
        .I4(out),
        .I5(aempty_fwft_fb_i),
        .O(aempty_fwft_i0__1));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    aempty_fwft_fb_i_reg
       (.C(m_aclk),
        .CE(1'b1),
        .D(aempty_fwft_i0__1),
        .Q(aempty_fwft_fb_i),
        .S(empty_fwft_i_reg_0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    aempty_fwft_i_reg
       (.C(m_aclk),
        .CE(1'b1),
        .D(aempty_fwft_i0__1),
        .Q(aempty_fwft_i),
        .S(empty_fwft_i_reg_0));
  LUT5 #(
    .INIT(32'hFF0F0400)) 
    empty_fwft_fb_i_i_1
       (.I0(empty_fwft_fb_o_i),
        .I1(m_axis_tready),
        .I2(curr_fwft_state[1]),
        .I3(curr_fwft_state[0]),
        .I4(empty_fwft_fb_i),
        .O(empty_fwft_i0__1));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    empty_fwft_fb_i_reg
       (.C(m_aclk),
        .CE(1'b1),
        .D(empty_fwft_i0__1),
        .Q(empty_fwft_fb_i),
        .S(empty_fwft_i_reg_0));
  LUT4 #(
    .INIT(16'hF320)) 
    empty_fwft_fb_o_i_i_1
       (.I0(m_axis_tready),
        .I1(curr_fwft_state[1]),
        .I2(curr_fwft_state[0]),
        .I3(empty_fwft_fb_o_i),
        .O(empty_fwft_fb_o_i_reg0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    empty_fwft_fb_o_i_reg
       (.C(m_aclk),
        .CE(1'b1),
        .D(empty_fwft_fb_o_i_reg0),
        .Q(empty_fwft_fb_o_i),
        .S(empty_fwft_i_reg_0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    empty_fwft_i_reg
       (.C(m_aclk),
        .CE(1'b1),
        .D(empty_fwft_i0__1),
        .Q(empty_fwft_i),
        .S(empty_fwft_i_reg_0));
  LUT4 #(
    .INIT(16'h00D0)) 
    \g_rd.gvalid_low.rd_dc_i[0]_i_1 
       (.I0(curr_fwft_state[1]),
        .I1(O),
        .I2(user_valid),
        .I3(empty_fwft_i_reg_0),
        .O(\gpregsm1.curr_fwft_state_reg[1]_0 ));
  LUT3 #(
    .INIT(8'hBF)) 
    \g_rd.gvalid_low.rd_dc_i[9]_i_1 
       (.I0(empty_fwft_i_reg_0),
        .I1(curr_fwft_state[1]),
        .I2(user_valid),
        .O(rd_dc_i));
  LUT5 #(
    .INIT(32'h04555555)) 
    \gc0.count_d1[8]_i_1 
       (.I0(out),
        .I1(m_axis_tready),
        .I2(empty_fwft_fb_o_i),
        .I3(curr_fwft_state[1]),
        .I4(curr_fwft_state[0]),
        .O(ram_rd_en));
  LUT5 #(
    .INIT(32'h00004F00)) 
    \goreg_bm.dout_i[31]_i_1 
       (.I0(empty_fwft_fb_o_i),
        .I1(m_axis_tready),
        .I2(curr_fwft_state[0]),
        .I3(curr_fwft_state[1]),
        .I4(empty_fwft_i_reg_0),
        .O(E));
  LUT4 #(
    .INIT(16'hFBAA)) 
    \gpregsm1.curr_fwft_state[0]_i_1 
       (.I0(curr_fwft_state[1]),
        .I1(m_axis_tready),
        .I2(empty_fwft_fb_o_i),
        .I3(curr_fwft_state[0]),
        .O(next_fwft_state[0]));
  LUT5 #(
    .INIT(32'hA200FFFF)) 
    \gpregsm1.curr_fwft_state[1]_i_1 
       (.I0(curr_fwft_state[1]),
        .I1(m_axis_tready),
        .I2(empty_fwft_fb_o_i),
        .I3(curr_fwft_state[0]),
        .I4(out),
        .O(next_fwft_state[1]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \gpregsm1.curr_fwft_state_reg[0] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(next_fwft_state[0]),
        .Q(curr_fwft_state[0]),
        .R(empty_fwft_i_reg_0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \gpregsm1.curr_fwft_state_reg[1] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(next_fwft_state[1]),
        .Q(curr_fwft_state[1]),
        .R(empty_fwft_i_reg_0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \gpregsm1.user_valid_reg 
       (.C(m_aclk),
        .CE(1'b1),
        .D(next_fwft_state[0]),
        .Q(user_valid),
        .R(empty_fwft_i_reg_0));
  LUT1 #(
    .INIT(2'h1)) 
    m_axis_tvalid_INST_0
       (.I0(empty_fwft_i),
        .O(m_axis_tvalid));
endmodule

(* ORIG_REF_NAME = "rd_logic" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_rd_logic
   (ENB_I,
    ENB_dly_D,
    axis_prog_empty,
    \g_rd.gvalid_low.rd_dc_i_reg ,
    \gc0.count_d1_reg ,
    m_aclk,
    m_axis_tready,
    m_axis_tvalid,
    ram_empty_fb_i_reg,
    DI,
    E,
    O,
    Q,
    WR_PNTR_RD,
    axis_rd_data_count,
    \gc0.count_reg[8] ,
    \gdiff.diff_pntr_pad_reg[8] ,
    ram_empty_fb_i_reg_0,
    v1_reg);
  output ENB_I;
  input ENB_dly_D;
  output axis_prog_empty;
  input [9:1]\g_rd.gvalid_low.rd_dc_i_reg ;
  input [0:0]\gc0.count_d1_reg ;
  input m_aclk;
  input m_axis_tready;
  output m_axis_tvalid;
  input ram_empty_fb_i_reg;
  input [1:0]DI;
  output [0:0]E;
  input [0:0]O;
  output [8:0]Q;
  input [8:0]WR_PNTR_RD;
  output [9:0]axis_rd_data_count;
  output [0:0]\gc0.count_reg[8] ;
  input [3:0]\gdiff.diff_pntr_pad_reg[8] ;
  input [0:0]ram_empty_fb_i_reg_0;
  input [3:0]v1_reg;

  wire [1:0]DI;
  wire [0:0]E;
  wire ENB_I;
  wire ENB_dly_D;
  wire [0:0]O;
  wire [8:0]Q;
  wire [8:0]WR_PNTR_RD;
  wire axis_prog_empty;
  wire [9:0]axis_rd_data_count;
  wire [3:0]\c1/v1_reg ;
  wire empty_fb_i;
  wire [9:1]\g_rd.gvalid_low.rd_dc_i_reg ;
  wire [0:0]\gc0.count_d1_reg ;
  wire [0:0]\gc0.count_reg[8] ;
  wire [3:0]\gdiff.diff_pntr_pad_reg[8] ;
  wire \gr1.gr1_int.rfwft_n_3 ;
  wire m_aclk;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire ram_empty_fb_i_reg;
  wire [0:0]ram_empty_fb_i_reg_0;
  wire ram_rd_en;
  wire [9:9]rd_dc_i;
  wire rpntr_n_0;
  wire rpntr_n_15;
  wire rpntr_n_16;
  wire rpntr_n_17;
  wire rpntr_n_18;
  wire rpntr_n_19;
  wire rpntr_n_20;
  wire rpntr_n_21;
  wire rpntr_n_22;
  wire rpntr_n_23;
  wire [3:0]v1_reg;

  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_rd_fwft \gr1.gr1_int.rfwft 
       (.E(E),
        .ENB_I(ENB_I),
        .ENB_dly_D(ENB_dly_D),
        .O(O),
        .empty_fwft_i_reg_0(\gc0.count_d1_reg ),
        .\gpregsm1.curr_fwft_state_reg[1]_0 (\gr1.gr1_int.rfwft_n_3 ),
        .m_aclk(m_aclk),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .out(empty_fb_i),
        .ram_rd_en(ram_rd_en),
        .rd_dc_i(rd_dc_i));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_rd_dc_fwft_ext_as \gr1.grdc2.rdc 
       (.axis_rd_data_count(axis_rd_data_count),
        .\g_rd.gvalid_low.rd_dc_i_reg[0]_0 (\gr1.gr1_int.rfwft_n_3 ),
        .\g_rd.gvalid_low.rd_dc_i_reg[1]_0 (\g_rd.gvalid_low.rd_dc_i_reg [1]),
        .\g_rd.gvalid_low.rd_dc_i_reg[2]_0 (\g_rd.gvalid_low.rd_dc_i_reg [2]),
        .\g_rd.gvalid_low.rd_dc_i_reg[3]_0 (\g_rd.gvalid_low.rd_dc_i_reg [3]),
        .\g_rd.gvalid_low.rd_dc_i_reg[4]_0 (\g_rd.gvalid_low.rd_dc_i_reg [4]),
        .\g_rd.gvalid_low.rd_dc_i_reg[5]_0 (\g_rd.gvalid_low.rd_dc_i_reg [5]),
        .\g_rd.gvalid_low.rd_dc_i_reg[6]_0 (\g_rd.gvalid_low.rd_dc_i_reg [6]),
        .\g_rd.gvalid_low.rd_dc_i_reg[7]_0 (\g_rd.gvalid_low.rd_dc_i_reg [7]),
        .\g_rd.gvalid_low.rd_dc_i_reg[8]_0 (\g_rd.gvalid_low.rd_dc_i_reg [8]),
        .\g_rd.gvalid_low.rd_dc_i_reg[9]_0 (\g_rd.gvalid_low.rd_dc_i_reg [9]),
        .m_aclk(m_aclk),
        .rd_dc_i(rd_dc_i));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_rd_pe_as \gras.gpe.rdpe 
       (.DI({DI,rpntr_n_0}),
        .S({rpntr_n_16,rpntr_n_17,rpntr_n_18,rpntr_n_19}),
        .axis_prog_empty(axis_prog_empty),
        .\gdiff.diff_pntr_pad_reg[8]_0 (\gdiff.diff_pntr_pad_reg[8] ),
        .\gdiff.diff_pntr_pad_reg[8]_1 ({rpntr_n_20,rpntr_n_21,rpntr_n_22,rpntr_n_23}),
        .\gdiff.diff_pntr_pad_reg[9]_0 (rpntr_n_15),
        .\gpe1.prog_empty_i_reg_0 (\gc0.count_d1_reg ),
        .m_aclk(m_aclk),
        .out(empty_fb_i));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_rd_status_flags_as \gras.rsts 
       (.m_aclk(m_aclk),
        .out(empty_fb_i),
        .ram_empty_fb_i_reg_0(ram_empty_fb_i_reg),
        .ram_empty_fb_i_reg_1(ram_empty_fb_i_reg_0),
        .ram_empty_fb_i_reg_2(\gc0.count_d1_reg ),
        .ram_rd_en(ram_rd_en),
        .v1_reg(v1_reg),
        .v1_reg_0(\c1/v1_reg ));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_rd_bin_cntr rpntr
       (.DI(rpntr_n_0),
        .Q(Q),
        .S({rpntr_n_16,rpntr_n_17,rpntr_n_18,rpntr_n_19}),
        .WR_PNTR_RD(WR_PNTR_RD),
        .\gc0.count_d1_reg[0]_0 (\gc0.count_d1_reg ),
        .\gc0.count_d1_reg[6]_0 ({rpntr_n_20,rpntr_n_21,rpntr_n_22,rpntr_n_23}),
        .\gc0.count_d1_reg[7]_0 (rpntr_n_15),
        .\gc0.count_reg[8]_0 (\gc0.count_reg[8] ),
        .m_aclk(m_aclk),
        .ram_rd_en(ram_rd_en),
        .v1_reg(\c1/v1_reg ));
endmodule

(* ORIG_REF_NAME = "rd_pe_as" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_rd_pe_as
   (axis_prog_empty,
    \gpe1.prog_empty_i_reg_0 ,
    m_aclk,
    out,
    DI,
    S,
    \gdiff.diff_pntr_pad_reg[8]_0 ,
    \gdiff.diff_pntr_pad_reg[8]_1 ,
    \gdiff.diff_pntr_pad_reg[9]_0 );
  output axis_prog_empty;
  input \gpe1.prog_empty_i_reg_0 ;
  input m_aclk;
  input out;
  input [2:0]DI;
  input [3:0]S;
  input [3:0]\gdiff.diff_pntr_pad_reg[8]_0 ;
  input [3:0]\gdiff.diff_pntr_pad_reg[8]_1 ;
  input [0:0]\gdiff.diff_pntr_pad_reg[9]_0 ;

  wire [2:0]DI;
  wire [3:0]S;
  wire axis_prog_empty;
  wire [9:1]diff_pntr_pad;
  wire [3:0]\gdiff.diff_pntr_pad_reg[8]_0 ;
  wire [3:0]\gdiff.diff_pntr_pad_reg[8]_1 ;
  wire [0:0]\gdiff.diff_pntr_pad_reg[9]_0 ;
  wire \gpe1.prog_empty_i_i_1_n_0 ;
  wire \gpe1.prog_empty_i_i_2_n_0 ;
  wire \gpe1.prog_empty_i_i_3_n_0 ;
  wire \gpe1.prog_empty_i_reg_0 ;
  wire m_aclk;
  wire out;
  wire [9:1]plusOp;
  wire plusOp__0_carry__0_n_0;
  wire plusOp__0_carry__0_n_1;
  wire plusOp__0_carry__0_n_2;
  wire plusOp__0_carry__0_n_3;
  wire plusOp__0_carry_n_0;
  wire plusOp__0_carry_n_1;
  wire plusOp__0_carry_n_2;
  wire plusOp__0_carry_n_3;
  wire [3:0]NLW_plusOp__0_carry__1_CO_UNCONNECTED;
  wire [3:1]NLW_plusOp__0_carry__1_O_UNCONNECTED;

  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[1] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(plusOp[1]),
        .Q(diff_pntr_pad[1]),
        .R(\gpe1.prog_empty_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[2] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(plusOp[2]),
        .Q(diff_pntr_pad[2]),
        .R(\gpe1.prog_empty_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[3] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(plusOp[3]),
        .Q(diff_pntr_pad[3]),
        .R(\gpe1.prog_empty_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[4] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(plusOp[4]),
        .Q(diff_pntr_pad[4]),
        .R(\gpe1.prog_empty_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[5] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(plusOp[5]),
        .Q(diff_pntr_pad[5]),
        .R(\gpe1.prog_empty_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[6] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(plusOp[6]),
        .Q(diff_pntr_pad[6]),
        .R(\gpe1.prog_empty_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[7] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(plusOp[7]),
        .Q(diff_pntr_pad[7]),
        .R(\gpe1.prog_empty_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[8] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(plusOp[8]),
        .Q(diff_pntr_pad[8]),
        .R(\gpe1.prog_empty_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[9] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(plusOp[9]),
        .Q(diff_pntr_pad[9]),
        .R(\gpe1.prog_empty_i_reg_0 ));
  LUT6 #(
    .INIT(64'h8888888888888BBB)) 
    \gpe1.prog_empty_i_i_1 
       (.I0(axis_prog_empty),
        .I1(out),
        .I2(diff_pntr_pad[1]),
        .I3(diff_pntr_pad[2]),
        .I4(\gpe1.prog_empty_i_i_2_n_0 ),
        .I5(\gpe1.prog_empty_i_i_3_n_0 ),
        .O(\gpe1.prog_empty_i_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \gpe1.prog_empty_i_i_2 
       (.I0(diff_pntr_pad[7]),
        .I1(diff_pntr_pad[6]),
        .I2(diff_pntr_pad[9]),
        .I3(diff_pntr_pad[8]),
        .O(\gpe1.prog_empty_i_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \gpe1.prog_empty_i_i_3 
       (.I0(diff_pntr_pad[3]),
        .I1(diff_pntr_pad[5]),
        .I2(diff_pntr_pad[4]),
        .O(\gpe1.prog_empty_i_i_3_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \gpe1.prog_empty_i_reg 
       (.C(m_aclk),
        .CE(1'b1),
        .D(\gpe1.prog_empty_i_i_1_n_0 ),
        .Q(axis_prog_empty),
        .S(\gpe1.prog_empty_i_reg_0 ));
  CARRY4 plusOp__0_carry
       (.CI(1'b0),
        .CO({plusOp__0_carry_n_0,plusOp__0_carry_n_1,plusOp__0_carry_n_2,plusOp__0_carry_n_3}),
        .CYINIT(1'b0),
        .DI({DI,1'b0}),
        .O(plusOp[4:1]),
        .S(S));
  CARRY4 plusOp__0_carry__0
       (.CI(plusOp__0_carry_n_0),
        .CO({plusOp__0_carry__0_n_0,plusOp__0_carry__0_n_1,plusOp__0_carry__0_n_2,plusOp__0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(\gdiff.diff_pntr_pad_reg[8]_0 ),
        .O(plusOp[8:5]),
        .S(\gdiff.diff_pntr_pad_reg[8]_1 ));
  CARRY4 plusOp__0_carry__1
       (.CI(plusOp__0_carry__0_n_0),
        .CO(NLW_plusOp__0_carry__1_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_plusOp__0_carry__1_O_UNCONNECTED[3:1],plusOp[9]}),
        .S({1'b0,1'b0,1'b0,\gdiff.diff_pntr_pad_reg[9]_0 }));
endmodule

(* ORIG_REF_NAME = "rd_status_flags_as" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_rd_status_flags_as
   (m_aclk,
    out,
    ram_empty_fb_i_reg_0,
    ram_empty_fb_i_reg_2,
    ram_rd_en,
    ram_empty_fb_i_reg_1,
    v1_reg,
    v1_reg_0);
  input m_aclk;
  output out;
  input ram_empty_fb_i_reg_0;
  input ram_empty_fb_i_reg_2;
  input ram_rd_en;
  input [0:0]ram_empty_fb_i_reg_1;
  input [3:0]v1_reg;
  input [3:0]v1_reg_0;

  wire c0_n_0;
  wire comp1;
  wire m_aclk;
  (* DONT_TOUCH *) wire ram_empty_fb_i;
  wire ram_empty_fb_i_reg_0;
  wire [0:0]ram_empty_fb_i_reg_1;
  wire ram_empty_fb_i_reg_2;
  (* DONT_TOUCH *) wire ram_empty_i;
  wire ram_rd_en;
  wire [3:0]v1_reg;
  wire [3:0]v1_reg_0;

  assign out = ram_empty_fb_i;
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_compare_1 c0
       (.comp1(comp1),
        .ram_empty_fb_i_reg(c0_n_0),
        .ram_empty_fb_i_reg_0(ram_empty_fb_i_reg_0),
        .ram_rd_en(ram_rd_en),
        .v1_reg(v1_reg));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_compare_2 c1
       (.comp1(comp1),
        .ram_empty_fb_i_reg(ram_empty_fb_i_reg_1),
        .v1_reg_0(v1_reg_0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    ram_empty_fb_i_reg
       (.C(m_aclk),
        .CE(1'b1),
        .D(c0_n_0),
        .Q(ram_empty_fb_i),
        .S(ram_empty_fb_i_reg_2));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    ram_empty_i_reg
       (.C(m_aclk),
        .CE(1'b1),
        .D(c0_n_0),
        .Q(ram_empty_i),
        .S(ram_empty_fb_i_reg_2));
endmodule

(* ORIG_REF_NAME = "reset_blk_ramfifo" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_reset_blk_ramfifo
   (m_aclk,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg_0 ,
    out,
    s_aclk,
    s_aresetn,
    wr_rst_busy);
  input m_aclk;
  output \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ;
  output \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg_0 ;
  output out;
  input s_aclk;
  input s_aresetn;
  output wr_rst_busy;

  wire arst_sync_rd_rst;
  wire dest_out;
  wire dest_rst;
  wire inverted_reset;
  wire m_aclk;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_i_1_n_0 ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_i_1_n_0 ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg_0 ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_i_1_n_0 ;
  (* DONT_TOUCH *) wire [2:0]rd_rst_reg;
  wire [3:0]rd_rst_wr_ext;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_d1;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_d2;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_d3;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_d4;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_d5;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_d6;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_d7;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_rd_reg1;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_rd_reg2;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_wr_reg1;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_wr_reg2;
  wire s_aclk;
  wire s_aresetn;
  wire sckt_rd_rst_wr;
  wire wr_rst_busy_i;
  wire [1:0]wr_rst_rd_ext;
  (* DONT_TOUCH *) wire [2:0]wr_rst_reg;

  assign out = rst_d3;
  assign wr_rst_busy = wr_rst_busy_i;
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \grstd1.grst_full.grst_f.rst_d1_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(wr_rst_busy_i),
        .Q(rst_d1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \grstd1.grst_full.grst_f.rst_d2_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(rst_d1),
        .Q(rst_d2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDSE #(
    .INIT(1'b1)) 
    \grstd1.grst_full.grst_f.rst_d3_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(rst_d2),
        .Q(rst_d3),
        .S(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg_0 ));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \grstd1.grst_full.grst_f.rst_d4_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(rst_d3),
        .Q(rst_d4),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(1'b0),
        .O(rst_wr_reg2));
  LUT1 #(
    .INIT(2'h2)) 
    i_1
       (.I0(1'b1),
        .O(wr_rst_reg[2]));
  LUT1 #(
    .INIT(2'h2)) 
    i_10
       (.I0(1'b1),
        .O(rst_d5));
  LUT1 #(
    .INIT(2'h2)) 
    i_11
       (.I0(1'b1),
        .O(rst_d6));
  LUT1 #(
    .INIT(2'h2)) 
    i_12
       (.I0(1'b1),
        .O(rst_d7));
  LUT1 #(
    .INIT(2'h2)) 
    i_2
       (.I0(1'b1),
        .O(wr_rst_reg[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_3
       (.I0(1'b1),
        .O(wr_rst_reg[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_4
       (.I0(1'b1),
        .O(rd_rst_reg[2]));
  LUT1 #(
    .INIT(2'h2)) 
    i_5
       (.I0(1'b1),
        .O(rd_rst_reg[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_6
       (.I0(1'b1),
        .O(rd_rst_reg[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_7
       (.I0(1'b0),
        .O(rst_wr_reg1));
  LUT1 #(
    .INIT(2'h2)) 
    i_8
       (.I0(1'b0),
        .O(rst_rd_reg1));
  LUT1 #(
    .INIT(2'h2)) 
    i_9
       (.I0(1'b0),
        .O(rst_rd_reg2));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.rd_rst_wr_ext_reg[0] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(sckt_rd_rst_wr),
        .Q(rd_rst_wr_ext[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.rd_rst_wr_ext_reg[1] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(rd_rst_wr_ext[0]),
        .Q(rd_rst_wr_ext[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.rd_rst_wr_ext_reg[2] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(rd_rst_wr_ext[1]),
        .Q(rd_rst_wr_ext[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.rd_rst_wr_ext_reg[3] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(rd_rst_wr_ext[2]),
        .Q(rd_rst_wr_ext[3]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hF4)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_i_1 
       (.I0(wr_rst_rd_ext[1]),
        .I1(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ),
        .I2(arst_sync_rd_rst),
        .O(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg 
       (.C(m_aclk),
        .CE(1'b1),
        .D(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_i_1_n_0 ),
        .Q(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hFF8A)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_i_1 
       (.I0(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg_0 ),
        .I1(rd_rst_wr_ext[0]),
        .I2(rd_rst_wr_ext[1]),
        .I3(dest_rst),
        .O(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_i_1_n_0 ),
        .Q(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg_0 ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFFFD0F0D0D0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_i_1 
       (.I0(rd_rst_wr_ext[3]),
        .I1(rd_rst_wr_ext[2]),
        .I2(wr_rst_busy_i),
        .I3(rd_rst_wr_ext[0]),
        .I4(rd_rst_wr_ext[1]),
        .I5(dest_rst),
        .O(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_i_1_n_0 ),
        .Q(wr_rst_busy_i),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_rd_ext_reg[0] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(dest_out),
        .Q(wr_rst_rd_ext[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_rd_ext_reg[1] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(wr_rst_rd_ext[0]),
        .Q(wr_rst_rd_ext[1]),
        .R(1'b0));
  (* DEST_SYNC_FF = "5" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* SRC_INPUT_REG = "0" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SINGLE" *) 
  (* XPM_MODULE = "TRUE" *) 
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_xpm_cdc_single \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_single_inst_rrst_wr 
       (.dest_clk(s_aclk),
        .dest_out(sckt_rd_rst_wr),
        .src_clk(m_aclk),
        .src_in(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ));
  (* DEST_SYNC_FF = "5" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* SRC_INPUT_REG = "0" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SINGLE" *) 
  (* XPM_MODULE = "TRUE" *) 
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_xpm_cdc_single__2 \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_single_inst_wrst_rd 
       (.dest_clk(m_aclk),
        .dest_out(dest_out),
        .src_clk(s_aclk),
        .src_in(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg_0 ));
  (* DEF_VAL = "1'b1" *) 
  (* DEST_SYNC_FF = "5" *) 
  (* INIT = "1" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  (* XPM_MODULE = "TRUE" *) 
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_xpm_cdc_sync_rst \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_sync_rst_inst_wrst 
       (.dest_clk(m_aclk),
        .dest_rst(arst_sync_rd_rst),
        .src_rst(inverted_reset));
  (* DEF_VAL = "1'b1" *) 
  (* DEST_SYNC_FF = "5" *) 
  (* INIT = "1" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  (* XPM_MODULE = "TRUE" *) 
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_xpm_cdc_sync_rst__2 \ngwrdrst.grst.g7serrst.gsckt_wrst.xpm_cdc_sync_rst_inst_wrst 
       (.dest_clk(s_aclk),
        .dest_rst(dest_rst),
        .src_rst(inverted_reset));
  LUT1 #(
    .INIT(2'h1)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.xpm_cdc_sync_rst_inst_wrst_i_1 
       (.I0(s_aresetn),
        .O(inverted_reset));
endmodule

(* ORIG_REF_NAME = "wr_bin_cntr" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_wr_bin_cntr
   (\gic0.gc0.count_d1_reg[1]_0 ,
    out,
    s_aclk,
    s_axis_tvalid,
    DI,
    E,
    Q,
    RD_PNTR_WR,
    S,
    \gic0.gc0.count_d1_reg[0]_0 ,
    \gic0.gc0.count_d1_reg[6]_0 ,
    \gic0.gc0.count_d1_reg[8]_0 ,
    \gic0.gc0.count_d2_reg[7]_0 ,
    \gic0.gc0.count_d2_reg[8]_0 ,
    \gic0.gc0.count_reg[7]_0 ,
    v1_reg,
    v1_reg_0);
  input \gic0.gc0.count_d1_reg[1]_0 ;
  input out;
  input s_aclk;
  input s_axis_tvalid;
  output [1:0]DI;
  input [0:0]E;
  output [8:0]Q;
  input [8:0]RD_PNTR_WR;
  output [3:0]S;
  output [1:0]\gic0.gc0.count_d1_reg[0]_0 ;
  output [3:0]\gic0.gc0.count_d1_reg[6]_0 ;
  output [8:0]\gic0.gc0.count_d1_reg[8]_0 ;
  output [3:0]\gic0.gc0.count_d2_reg[7]_0 ;
  output [0:0]\gic0.gc0.count_d2_reg[8]_0 ;
  output [7:0]\gic0.gc0.count_reg[7]_0 ;
  output [0:0]v1_reg;
  output [0:0]v1_reg_0;

  wire [1:0]DI;
  wire [0:0]E;
  wire [8:0]Q;
  wire [8:0]RD_PNTR_WR;
  wire [3:0]S;
  wire \gic0.gc0.count[8]_i_2_n_0 ;
  wire [1:0]\gic0.gc0.count_d1_reg[0]_0 ;
  wire \gic0.gc0.count_d1_reg[1]_0 ;
  wire [3:0]\gic0.gc0.count_d1_reg[6]_0 ;
  wire [8:0]\gic0.gc0.count_d1_reg[8]_0 ;
  wire [3:0]\gic0.gc0.count_d2_reg[7]_0 ;
  wire [0:0]\gic0.gc0.count_d2_reg[8]_0 ;
  wire [7:0]\gic0.gc0.count_reg[7]_0 ;
  wire out;
  wire [8:0]plusOp__0;
  wire s_aclk;
  wire s_axis_tvalid;
  wire [0:0]v1_reg;
  wire [0:0]v1_reg_0;
  wire [8:8]wr_pntr_plus2;

  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \gic0.gc0.count[0]_i_1 
       (.I0(\gic0.gc0.count_reg[7]_0 [0]),
        .O(plusOp__0[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \gic0.gc0.count[1]_i_1 
       (.I0(\gic0.gc0.count_reg[7]_0 [0]),
        .I1(\gic0.gc0.count_reg[7]_0 [1]),
        .O(plusOp__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \gic0.gc0.count[2]_i_1 
       (.I0(\gic0.gc0.count_reg[7]_0 [0]),
        .I1(\gic0.gc0.count_reg[7]_0 [1]),
        .I2(\gic0.gc0.count_reg[7]_0 [2]),
        .O(plusOp__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \gic0.gc0.count[3]_i_1 
       (.I0(\gic0.gc0.count_reg[7]_0 [1]),
        .I1(\gic0.gc0.count_reg[7]_0 [0]),
        .I2(\gic0.gc0.count_reg[7]_0 [2]),
        .I3(\gic0.gc0.count_reg[7]_0 [3]),
        .O(plusOp__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \gic0.gc0.count[4]_i_1 
       (.I0(\gic0.gc0.count_reg[7]_0 [2]),
        .I1(\gic0.gc0.count_reg[7]_0 [0]),
        .I2(\gic0.gc0.count_reg[7]_0 [1]),
        .I3(\gic0.gc0.count_reg[7]_0 [3]),
        .I4(\gic0.gc0.count_reg[7]_0 [4]),
        .O(plusOp__0[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \gic0.gc0.count[5]_i_1 
       (.I0(\gic0.gc0.count_reg[7]_0 [3]),
        .I1(\gic0.gc0.count_reg[7]_0 [1]),
        .I2(\gic0.gc0.count_reg[7]_0 [0]),
        .I3(\gic0.gc0.count_reg[7]_0 [2]),
        .I4(\gic0.gc0.count_reg[7]_0 [4]),
        .I5(\gic0.gc0.count_reg[7]_0 [5]),
        .O(plusOp__0[5]));
  LUT2 #(
    .INIT(4'h6)) 
    \gic0.gc0.count[6]_i_1 
       (.I0(\gic0.gc0.count[8]_i_2_n_0 ),
        .I1(\gic0.gc0.count_reg[7]_0 [6]),
        .O(plusOp__0[6]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \gic0.gc0.count[7]_i_1 
       (.I0(\gic0.gc0.count[8]_i_2_n_0 ),
        .I1(\gic0.gc0.count_reg[7]_0 [6]),
        .I2(\gic0.gc0.count_reg[7]_0 [7]),
        .O(plusOp__0[7]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \gic0.gc0.count[8]_i_1 
       (.I0(\gic0.gc0.count_reg[7]_0 [6]),
        .I1(\gic0.gc0.count[8]_i_2_n_0 ),
        .I2(\gic0.gc0.count_reg[7]_0 [7]),
        .I3(wr_pntr_plus2),
        .O(plusOp__0[8]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \gic0.gc0.count[8]_i_2 
       (.I0(\gic0.gc0.count_reg[7]_0 [5]),
        .I1(\gic0.gc0.count_reg[7]_0 [3]),
        .I2(\gic0.gc0.count_reg[7]_0 [1]),
        .I3(\gic0.gc0.count_reg[7]_0 [0]),
        .I4(\gic0.gc0.count_reg[7]_0 [2]),
        .I5(\gic0.gc0.count_reg[7]_0 [4]),
        .O(\gic0.gc0.count[8]_i_2_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \gic0.gc0.count_d1_reg[0] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_reg[7]_0 [0]),
        .Q(\gic0.gc0.count_d1_reg[8]_0 [0]),
        .S(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[1] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_reg[7]_0 [1]),
        .Q(\gic0.gc0.count_d1_reg[8]_0 [1]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[2] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_reg[7]_0 [2]),
        .Q(\gic0.gc0.count_d1_reg[8]_0 [2]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[3] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_reg[7]_0 [3]),
        .Q(\gic0.gc0.count_d1_reg[8]_0 [3]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[4] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_reg[7]_0 [4]),
        .Q(\gic0.gc0.count_d1_reg[8]_0 [4]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[5] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_reg[7]_0 [5]),
        .Q(\gic0.gc0.count_d1_reg[8]_0 [5]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[6] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_reg[7]_0 [6]),
        .Q(\gic0.gc0.count_d1_reg[8]_0 [6]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[7] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_reg[7]_0 [7]),
        .Q(\gic0.gc0.count_d1_reg[8]_0 [7]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[8] 
       (.C(s_aclk),
        .CE(E),
        .D(wr_pntr_plus2),
        .Q(\gic0.gc0.count_d1_reg[8]_0 [8]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[0] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_d1_reg[8]_0 [0]),
        .Q(Q[0]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[1] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_d1_reg[8]_0 [1]),
        .Q(Q[1]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[2] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_d1_reg[8]_0 [2]),
        .Q(Q[2]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[3] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_d1_reg[8]_0 [3]),
        .Q(Q[3]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[4] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_d1_reg[8]_0 [4]),
        .Q(Q[4]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[5] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_d1_reg[8]_0 [5]),
        .Q(Q[5]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[6] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_d1_reg[8]_0 [6]),
        .Q(Q[6]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[7] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_d1_reg[8]_0 [7]),
        .Q(Q[7]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[8] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_d1_reg[8]_0 [8]),
        .Q(Q[8]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[0] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__0[0]),
        .Q(\gic0.gc0.count_reg[7]_0 [0]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \gic0.gc0.count_reg[1] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__0[1]),
        .Q(\gic0.gc0.count_reg[7]_0 [1]),
        .S(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[2] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__0[2]),
        .Q(\gic0.gc0.count_reg[7]_0 [2]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[3] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__0[3]),
        .Q(\gic0.gc0.count_reg[7]_0 [3]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[4] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__0[4]),
        .Q(\gic0.gc0.count_reg[7]_0 [4]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[5] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__0[5]),
        .Q(\gic0.gc0.count_reg[7]_0 [5]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[6] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__0[6]),
        .Q(\gic0.gc0.count_reg[7]_0 [6]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[7] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__0[7]),
        .Q(\gic0.gc0.count_reg[7]_0 [7]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[8] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__0[8]),
        .Q(wr_pntr_plus2),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[4].gms.ms_i_1 
       (.I0(wr_pntr_plus2),
        .I1(RD_PNTR_WR[8]),
        .O(v1_reg_0));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[4].gms.ms_i_1__2 
       (.I0(\gic0.gc0.count_d1_reg[8]_0 [8]),
        .I1(RD_PNTR_WR[8]),
        .O(v1_reg));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry__0_i_1
       (.I0(Q[7]),
        .I1(RD_PNTR_WR[7]),
        .O(\gic0.gc0.count_d2_reg[7]_0 [3]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry__0_i_2
       (.I0(Q[6]),
        .I1(RD_PNTR_WR[6]),
        .O(\gic0.gc0.count_d2_reg[7]_0 [2]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry__0_i_3
       (.I0(Q[5]),
        .I1(RD_PNTR_WR[5]),
        .O(\gic0.gc0.count_d2_reg[7]_0 [1]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry__0_i_4
       (.I0(Q[4]),
        .I1(RD_PNTR_WR[4]),
        .O(\gic0.gc0.count_d2_reg[7]_0 [0]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry__1_i_1
       (.I0(Q[8]),
        .I1(RD_PNTR_WR[8]),
        .O(\gic0.gc0.count_d2_reg[8]_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry_i_1
       (.I0(Q[3]),
        .I1(RD_PNTR_WR[3]),
        .O(S[3]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry_i_2
       (.I0(Q[2]),
        .I1(RD_PNTR_WR[2]),
        .O(S[2]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry_i_3
       (.I0(Q[1]),
        .I1(RD_PNTR_WR[1]),
        .O(S[1]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry_i_4
       (.I0(Q[0]),
        .I1(RD_PNTR_WR[0]),
        .O(S[0]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry__0_i_1
       (.I0(\gic0.gc0.count_d1_reg[8]_0 [6]),
        .I1(RD_PNTR_WR[6]),
        .O(\gic0.gc0.count_d1_reg[6]_0 [3]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry__0_i_2
       (.I0(\gic0.gc0.count_d1_reg[8]_0 [5]),
        .I1(RD_PNTR_WR[5]),
        .O(\gic0.gc0.count_d1_reg[6]_0 [2]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry__0_i_3
       (.I0(\gic0.gc0.count_d1_reg[8]_0 [4]),
        .I1(RD_PNTR_WR[4]),
        .O(\gic0.gc0.count_d1_reg[6]_0 [1]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry__0_i_4
       (.I0(\gic0.gc0.count_d1_reg[8]_0 [3]),
        .I1(RD_PNTR_WR[3]),
        .O(\gic0.gc0.count_d1_reg[6]_0 [0]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry_i_1
       (.I0(\gic0.gc0.count_d1_reg[8]_0 [2]),
        .I1(RD_PNTR_WR[2]),
        .O(DI[1]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry_i_2
       (.I0(\gic0.gc0.count_d1_reg[8]_0 [1]),
        .I1(RD_PNTR_WR[1]),
        .O(DI[0]));
  LUT6 #(
    .INIT(64'hF75108AE08AEF751)) 
    plusOp__0_carry_i_6
       (.I0(\gic0.gc0.count_d1_reg[8]_0 [0]),
        .I1(s_axis_tvalid),
        .I2(out),
        .I3(RD_PNTR_WR[0]),
        .I4(\gic0.gc0.count_d1_reg[8]_0 [1]),
        .I5(RD_PNTR_WR[1]),
        .O(\gic0.gc0.count_d1_reg[0]_0 [1]));
  LUT4 #(
    .INIT(16'h9969)) 
    plusOp__0_carry_i_7
       (.I0(\gic0.gc0.count_d1_reg[8]_0 [0]),
        .I1(RD_PNTR_WR[0]),
        .I2(s_axis_tvalid),
        .I3(out),
        .O(\gic0.gc0.count_d1_reg[0]_0 [0]));
endmodule

(* ORIG_REF_NAME = "wr_dc_fwft_ext_as" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_wr_dc_fwft_ext_as
   (s_aclk,
    \wr_data_count_i_reg[0]_0 ,
    Q,
    S,
    axis_wr_data_count,
    \wr_data_count_i_reg[7]_0 ,
    \wr_data_count_i_reg[8]_0 );
  input s_aclk;
  input \wr_data_count_i_reg[0]_0 ;
  input [7:0]Q;
  input [3:0]S;
  output [9:0]axis_wr_data_count;
  input [3:0]\wr_data_count_i_reg[7]_0 ;
  input [0:0]\wr_data_count_i_reg[8]_0 ;

  wire [7:0]Q;
  wire [3:0]S;
  wire [9:0]axis_wr_data_count;
  wire minusOp_carry__0_n_0;
  wire minusOp_carry__0_n_1;
  wire minusOp_carry__0_n_2;
  wire minusOp_carry__0_n_3;
  wire minusOp_carry__0_n_4;
  wire minusOp_carry__0_n_5;
  wire minusOp_carry__0_n_6;
  wire minusOp_carry__0_n_7;
  wire minusOp_carry__1_n_7;
  wire minusOp_carry_n_0;
  wire minusOp_carry_n_1;
  wire minusOp_carry_n_2;
  wire minusOp_carry_n_3;
  wire minusOp_carry_n_4;
  wire minusOp_carry_n_5;
  wire minusOp_carry_n_6;
  wire minusOp_carry_n_7;
  wire s_aclk;
  wire \wr_data_count_i[1]_i_1_n_0 ;
  wire \wr_data_count_i[2]_i_1_n_0 ;
  wire \wr_data_count_i[3]_i_1_n_0 ;
  wire \wr_data_count_i[4]_i_1_n_0 ;
  wire \wr_data_count_i[5]_i_1_n_0 ;
  wire \wr_data_count_i[6]_i_1_n_0 ;
  wire \wr_data_count_i[7]_i_1_n_0 ;
  wire \wr_data_count_i[8]_i_1_n_0 ;
  wire \wr_data_count_i[9]_i_1_n_0 ;
  wire \wr_data_count_i[9]_i_2_n_0 ;
  wire \wr_data_count_i_reg[0]_0 ;
  wire [3:0]\wr_data_count_i_reg[7]_0 ;
  wire [0:0]\wr_data_count_i_reg[8]_0 ;
  wire [3:0]NLW_minusOp_carry__1_CO_UNCONNECTED;
  wire [3:1]NLW_minusOp_carry__1_O_UNCONNECTED;

  CARRY4 minusOp_carry
       (.CI(1'b0),
        .CO({minusOp_carry_n_0,minusOp_carry_n_1,minusOp_carry_n_2,minusOp_carry_n_3}),
        .CYINIT(1'b1),
        .DI(Q[3:0]),
        .O({minusOp_carry_n_4,minusOp_carry_n_5,minusOp_carry_n_6,minusOp_carry_n_7}),
        .S(S));
  CARRY4 minusOp_carry__0
       (.CI(minusOp_carry_n_0),
        .CO({minusOp_carry__0_n_0,minusOp_carry__0_n_1,minusOp_carry__0_n_2,minusOp_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(Q[7:4]),
        .O({minusOp_carry__0_n_4,minusOp_carry__0_n_5,minusOp_carry__0_n_6,minusOp_carry__0_n_7}),
        .S(\wr_data_count_i_reg[7]_0 ));
  CARRY4 minusOp_carry__1
       (.CI(minusOp_carry__0_n_0),
        .CO(NLW_minusOp_carry__1_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_minusOp_carry__1_O_UNCONNECTED[3:1],minusOp_carry__1_n_7}),
        .S({1'b0,1'b0,1'b0,\wr_data_count_i_reg[8]_0 }));
  LUT1 #(
    .INIT(2'h1)) 
    \wr_data_count_i[1]_i_1 
       (.I0(minusOp_carry_n_6),
        .O(\wr_data_count_i[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \wr_data_count_i[2]_i_1 
       (.I0(minusOp_carry_n_6),
        .I1(minusOp_carry_n_5),
        .O(\wr_data_count_i[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \wr_data_count_i[3]_i_1 
       (.I0(minusOp_carry_n_6),
        .I1(minusOp_carry_n_5),
        .I2(minusOp_carry_n_4),
        .O(\wr_data_count_i[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \wr_data_count_i[4]_i_1 
       (.I0(minusOp_carry_n_5),
        .I1(minusOp_carry_n_6),
        .I2(minusOp_carry_n_4),
        .I3(minusOp_carry__0_n_7),
        .O(\wr_data_count_i[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \wr_data_count_i[5]_i_1 
       (.I0(minusOp_carry_n_4),
        .I1(minusOp_carry_n_6),
        .I2(minusOp_carry_n_5),
        .I3(minusOp_carry__0_n_7),
        .I4(minusOp_carry__0_n_6),
        .O(\wr_data_count_i[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \wr_data_count_i[6]_i_1 
       (.I0(minusOp_carry__0_n_7),
        .I1(minusOp_carry_n_5),
        .I2(minusOp_carry_n_6),
        .I3(minusOp_carry_n_4),
        .I4(minusOp_carry__0_n_6),
        .I5(minusOp_carry__0_n_5),
        .O(\wr_data_count_i[6]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \wr_data_count_i[7]_i_1 
       (.I0(\wr_data_count_i[9]_i_2_n_0 ),
        .I1(minusOp_carry__0_n_4),
        .O(\wr_data_count_i[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \wr_data_count_i[8]_i_1 
       (.I0(\wr_data_count_i[9]_i_2_n_0 ),
        .I1(minusOp_carry__0_n_4),
        .I2(minusOp_carry__1_n_7),
        .O(\wr_data_count_i[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \wr_data_count_i[9]_i_1 
       (.I0(minusOp_carry__1_n_7),
        .I1(\wr_data_count_i[9]_i_2_n_0 ),
        .I2(minusOp_carry__0_n_4),
        .O(\wr_data_count_i[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \wr_data_count_i[9]_i_2 
       (.I0(minusOp_carry__0_n_5),
        .I1(minusOp_carry__0_n_7),
        .I2(minusOp_carry_n_5),
        .I3(minusOp_carry_n_6),
        .I4(minusOp_carry_n_4),
        .I5(minusOp_carry__0_n_6),
        .O(\wr_data_count_i[9]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[0] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(minusOp_carry_n_7),
        .Q(axis_wr_data_count[0]),
        .R(\wr_data_count_i_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[1] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\wr_data_count_i[1]_i_1_n_0 ),
        .Q(axis_wr_data_count[1]),
        .R(\wr_data_count_i_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[2] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\wr_data_count_i[2]_i_1_n_0 ),
        .Q(axis_wr_data_count[2]),
        .R(\wr_data_count_i_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[3] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\wr_data_count_i[3]_i_1_n_0 ),
        .Q(axis_wr_data_count[3]),
        .R(\wr_data_count_i_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[4] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\wr_data_count_i[4]_i_1_n_0 ),
        .Q(axis_wr_data_count[4]),
        .R(\wr_data_count_i_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[5] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\wr_data_count_i[5]_i_1_n_0 ),
        .Q(axis_wr_data_count[5]),
        .R(\wr_data_count_i_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[6] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\wr_data_count_i[6]_i_1_n_0 ),
        .Q(axis_wr_data_count[6]),
        .R(\wr_data_count_i_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[7] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\wr_data_count_i[7]_i_1_n_0 ),
        .Q(axis_wr_data_count[7]),
        .R(\wr_data_count_i_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[8] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\wr_data_count_i[8]_i_1_n_0 ),
        .Q(axis_wr_data_count[8]),
        .R(\wr_data_count_i_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[9] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\wr_data_count_i[9]_i_1_n_0 ),
        .Q(axis_wr_data_count[9]),
        .R(\wr_data_count_i_reg[0]_0 ));
endmodule

(* ORIG_REF_NAME = "wr_logic" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_wr_logic
   (axis_prog_full,
    \gic0.gc0.count_d1_reg ,
    out,
    ram_full_fb_i_reg,
    s_aclk,
    s_axis_tready,
    s_axis_tvalid,
    E,
    Q,
    RD_PNTR_WR,
    S,
    axis_wr_data_count,
    \gdiff.diff_pntr_pad_reg[4] ,
    \gdiff.diff_pntr_pad_reg[8] ,
    \gic0.gc0.count_d1_reg[8] ,
    \gic0.gc0.count_reg[7] ,
    \gmux.gm[4].gms.ms ,
    \gmux.gm[4].gms.ms_0 );
  output axis_prog_full;
  input [1:1]\gic0.gc0.count_d1_reg ;
  output out;
  input ram_full_fb_i_reg;
  input s_aclk;
  output s_axis_tready;
  input s_axis_tvalid;
  output [0:0]E;
  output [8:0]Q;
  input [8:0]RD_PNTR_WR;
  input [0:0]S;
  output [9:0]axis_wr_data_count;
  input [1:0]\gdiff.diff_pntr_pad_reg[4] ;
  input [3:0]\gdiff.diff_pntr_pad_reg[8] ;
  output [8:0]\gic0.gc0.count_d1_reg[8] ;
  output [7:0]\gic0.gc0.count_reg[7] ;
  input [3:0]\gmux.gm[4].gms.ms ;
  input [3:0]\gmux.gm[4].gms.ms_0 ;

  wire [0:0]E;
  wire [8:0]Q;
  wire [8:0]RD_PNTR_WR;
  wire [0:0]S;
  wire axis_prog_full;
  wire [9:0]axis_wr_data_count;
  wire [4:4]\c1/v1_reg ;
  wire [4:4]\c2/v1_reg ;
  wire [1:0]\gdiff.diff_pntr_pad_reg[4] ;
  wire [3:0]\gdiff.diff_pntr_pad_reg[8] ;
  wire [1:1]\gic0.gc0.count_d1_reg ;
  wire [8:0]\gic0.gc0.count_d1_reg[8] ;
  wire [7:0]\gic0.gc0.count_reg[7] ;
  wire [3:0]\gmux.gm[4].gms.ms ;
  wire [3:0]\gmux.gm[4].gms.ms_0 ;
  wire \gwas.wsts_n_1 ;
  wire out;
  wire ram_full_fb_i_reg;
  wire s_aclk;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire wpntr_n_0;
  wire wpntr_n_1;
  wire wpntr_n_13;
  wire wpntr_n_14;
  wire wpntr_n_2;
  wire wpntr_n_24;
  wire wpntr_n_25;
  wire wpntr_n_26;
  wire wpntr_n_27;
  wire wpntr_n_28;
  wire wpntr_n_29;
  wire wpntr_n_3;
  wire wpntr_n_30;
  wire wpntr_n_31;
  wire wpntr_n_32;
  wire wpntr_n_43;
  wire wpntr_n_44;

  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_wr_pf_as \gwas.gpf.wrpf 
       (.DI({wpntr_n_13,wpntr_n_14,\gwas.wsts_n_1 }),
        .S({\gdiff.diff_pntr_pad_reg[4] ,wpntr_n_43,wpntr_n_44}),
        .axis_prog_full(axis_prog_full),
        .\gdiff.diff_pntr_pad_reg[2]_0 (\gic0.gc0.count_d1_reg ),
        .\gdiff.diff_pntr_pad_reg[8]_0 ({wpntr_n_24,wpntr_n_25,wpntr_n_26,wpntr_n_27}),
        .\gdiff.diff_pntr_pad_reg[8]_1 (\gdiff.diff_pntr_pad_reg[8] ),
        .\gdiff.diff_pntr_pad_reg[9]_0 (S),
        .\gpf1.prog_full_i_reg_0 (ram_full_fb_i_reg),
        .out(out),
        .s_aclk(s_aclk));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_wr_dc_fwft_ext_as \gwas.gwdc1.wdcext 
       (.Q(Q[7:0]),
        .S({wpntr_n_0,wpntr_n_1,wpntr_n_2,wpntr_n_3}),
        .axis_wr_data_count(axis_wr_data_count),
        .s_aclk(s_aclk),
        .\wr_data_count_i_reg[0]_0 (\gic0.gc0.count_d1_reg ),
        .\wr_data_count_i_reg[7]_0 ({wpntr_n_28,wpntr_n_29,wpntr_n_30,wpntr_n_31}),
        .\wr_data_count_i_reg[8]_0 (wpntr_n_32));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_wr_status_flags_as \gwas.wsts 
       (.DI(\gwas.wsts_n_1 ),
        .E(E),
        .Q(\gic0.gc0.count_d1_reg[8] [0]),
        .RD_PNTR_WR(RD_PNTR_WR[0]),
        .\gmux.gm[4].gms.ms (\gmux.gm[4].gms.ms ),
        .\gmux.gm[4].gms.ms_0 (\gmux.gm[4].gms.ms_0 ),
        .out(out),
        .ram_full_fb_i_reg_0(\gic0.gc0.count_d1_reg ),
        .ram_full_fb_i_reg_1(ram_full_fb_i_reg),
        .s_aclk(s_aclk),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid),
        .v1_reg(\c1/v1_reg ),
        .v1_reg_0(\c2/v1_reg ));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_wr_bin_cntr wpntr
       (.DI({wpntr_n_13,wpntr_n_14}),
        .E(E),
        .Q(Q),
        .RD_PNTR_WR(RD_PNTR_WR),
        .S({wpntr_n_0,wpntr_n_1,wpntr_n_2,wpntr_n_3}),
        .\gic0.gc0.count_d1_reg[0]_0 ({wpntr_n_43,wpntr_n_44}),
        .\gic0.gc0.count_d1_reg[1]_0 (\gic0.gc0.count_d1_reg ),
        .\gic0.gc0.count_d1_reg[6]_0 ({wpntr_n_24,wpntr_n_25,wpntr_n_26,wpntr_n_27}),
        .\gic0.gc0.count_d1_reg[8]_0 (\gic0.gc0.count_d1_reg[8] ),
        .\gic0.gc0.count_d2_reg[7]_0 ({wpntr_n_28,wpntr_n_29,wpntr_n_30,wpntr_n_31}),
        .\gic0.gc0.count_d2_reg[8]_0 (wpntr_n_32),
        .\gic0.gc0.count_reg[7]_0 (\gic0.gc0.count_reg[7] ),
        .out(out),
        .s_aclk(s_aclk),
        .s_axis_tvalid(s_axis_tvalid),
        .v1_reg(\c1/v1_reg ),
        .v1_reg_0(\c2/v1_reg ));
endmodule

(* ORIG_REF_NAME = "wr_pf_as" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_wr_pf_as
   (axis_prog_full,
    \gdiff.diff_pntr_pad_reg[2]_0 ,
    \gpf1.prog_full_i_reg_0 ,
    out,
    s_aclk,
    DI,
    S,
    \gdiff.diff_pntr_pad_reg[8]_0 ,
    \gdiff.diff_pntr_pad_reg[8]_1 ,
    \gdiff.diff_pntr_pad_reg[9]_0 );
  output axis_prog_full;
  input \gdiff.diff_pntr_pad_reg[2]_0 ;
  input \gpf1.prog_full_i_reg_0 ;
  input out;
  input s_aclk;
  input [2:0]DI;
  input [3:0]S;
  input [3:0]\gdiff.diff_pntr_pad_reg[8]_0 ;
  input [3:0]\gdiff.diff_pntr_pad_reg[8]_1 ;
  input [0:0]\gdiff.diff_pntr_pad_reg[9]_0 ;

  wire [2:0]DI;
  wire [3:0]S;
  wire axis_prog_full;
  wire \gdiff.diff_pntr_pad_reg[2]_0 ;
  wire [3:0]\gdiff.diff_pntr_pad_reg[8]_0 ;
  wire [3:0]\gdiff.diff_pntr_pad_reg[8]_1 ;
  wire [0:0]\gdiff.diff_pntr_pad_reg[9]_0 ;
  wire [9:2]\gdiff.diff_pntr_pad_reg_n_0_ ;
  wire \gpf1.prog_full_i_i_1_n_0 ;
  wire \gpf1.prog_full_i_i_2_n_0 ;
  wire \gpf1.prog_full_i_i_3_n_0 ;
  wire \gpf1.prog_full_i_reg_0 ;
  wire out;
  wire plusOp__0_carry__0_n_0;
  wire plusOp__0_carry__0_n_1;
  wire plusOp__0_carry__0_n_2;
  wire plusOp__0_carry__0_n_3;
  wire plusOp__0_carry__0_n_4;
  wire plusOp__0_carry__0_n_5;
  wire plusOp__0_carry__0_n_6;
  wire plusOp__0_carry__0_n_7;
  wire plusOp__0_carry__1_n_7;
  wire plusOp__0_carry_n_0;
  wire plusOp__0_carry_n_1;
  wire plusOp__0_carry_n_2;
  wire plusOp__0_carry_n_3;
  wire plusOp__0_carry_n_4;
  wire plusOp__0_carry_n_5;
  wire plusOp__0_carry_n_6;
  wire s_aclk;
  wire [0:0]NLW_plusOp__0_carry_O_UNCONNECTED;
  wire [3:0]NLW_plusOp__0_carry__1_CO_UNCONNECTED;
  wire [3:1]NLW_plusOp__0_carry__1_O_UNCONNECTED;

  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[2] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp__0_carry_n_6),
        .Q(\gdiff.diff_pntr_pad_reg_n_0_ [2]),
        .R(\gdiff.diff_pntr_pad_reg[2]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[3] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp__0_carry_n_5),
        .Q(\gdiff.diff_pntr_pad_reg_n_0_ [3]),
        .R(\gdiff.diff_pntr_pad_reg[2]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[4] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp__0_carry_n_4),
        .Q(\gdiff.diff_pntr_pad_reg_n_0_ [4]),
        .R(\gdiff.diff_pntr_pad_reg[2]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[5] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp__0_carry__0_n_7),
        .Q(\gdiff.diff_pntr_pad_reg_n_0_ [5]),
        .R(\gdiff.diff_pntr_pad_reg[2]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[6] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp__0_carry__0_n_6),
        .Q(\gdiff.diff_pntr_pad_reg_n_0_ [6]),
        .R(\gdiff.diff_pntr_pad_reg[2]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[7] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp__0_carry__0_n_5),
        .Q(\gdiff.diff_pntr_pad_reg_n_0_ [7]),
        .R(\gdiff.diff_pntr_pad_reg[2]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[8] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp__0_carry__0_n_4),
        .Q(\gdiff.diff_pntr_pad_reg_n_0_ [8]),
        .R(\gdiff.diff_pntr_pad_reg[2]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[9] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp__0_carry__1_n_7),
        .Q(\gdiff.diff_pntr_pad_reg_n_0_ [9]),
        .R(\gdiff.diff_pntr_pad_reg[2]_0 ));
  LUT5 #(
    .INIT(32'h0F010001)) 
    \gpf1.prog_full_i_i_1 
       (.I0(\gpf1.prog_full_i_i_2_n_0 ),
        .I1(\gpf1.prog_full_i_i_3_n_0 ),
        .I2(\gpf1.prog_full_i_reg_0 ),
        .I3(out),
        .I4(axis_prog_full),
        .O(\gpf1.prog_full_i_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h777FFFFF)) 
    \gpf1.prog_full_i_i_2 
       (.I0(\gdiff.diff_pntr_pad_reg_n_0_ [8]),
        .I1(\gdiff.diff_pntr_pad_reg_n_0_ [7]),
        .I2(\gdiff.diff_pntr_pad_reg_n_0_ [3]),
        .I3(\gdiff.diff_pntr_pad_reg_n_0_ [2]),
        .I4(\gdiff.diff_pntr_pad_reg_n_0_ [9]),
        .O(\gpf1.prog_full_i_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h7F)) 
    \gpf1.prog_full_i_i_3 
       (.I0(\gdiff.diff_pntr_pad_reg_n_0_ [4]),
        .I1(\gdiff.diff_pntr_pad_reg_n_0_ [6]),
        .I2(\gdiff.diff_pntr_pad_reg_n_0_ [5]),
        .O(\gpf1.prog_full_i_i_3_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \gpf1.prog_full_i_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\gpf1.prog_full_i_i_1_n_0 ),
        .Q(axis_prog_full),
        .S(\gdiff.diff_pntr_pad_reg[2]_0 ));
  CARRY4 plusOp__0_carry
       (.CI(1'b0),
        .CO({plusOp__0_carry_n_0,plusOp__0_carry_n_1,plusOp__0_carry_n_2,plusOp__0_carry_n_3}),
        .CYINIT(1'b0),
        .DI({DI,1'b0}),
        .O({plusOp__0_carry_n_4,plusOp__0_carry_n_5,plusOp__0_carry_n_6,NLW_plusOp__0_carry_O_UNCONNECTED[0]}),
        .S(S));
  CARRY4 plusOp__0_carry__0
       (.CI(plusOp__0_carry_n_0),
        .CO({plusOp__0_carry__0_n_0,plusOp__0_carry__0_n_1,plusOp__0_carry__0_n_2,plusOp__0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(\gdiff.diff_pntr_pad_reg[8]_0 ),
        .O({plusOp__0_carry__0_n_4,plusOp__0_carry__0_n_5,plusOp__0_carry__0_n_6,plusOp__0_carry__0_n_7}),
        .S(\gdiff.diff_pntr_pad_reg[8]_1 ));
  CARRY4 plusOp__0_carry__1
       (.CI(plusOp__0_carry__0_n_0),
        .CO(NLW_plusOp__0_carry__1_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_plusOp__0_carry__1_O_UNCONNECTED[3:1],plusOp__0_carry__1_n_7}),
        .S({1'b0,1'b0,1'b0,\gdiff.diff_pntr_pad_reg[9]_0 }));
endmodule

(* ORIG_REF_NAME = "wr_status_flags_as" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_wr_status_flags_as
   (out,
    ram_full_fb_i_reg_0,
    ram_full_fb_i_reg_1,
    s_aclk,
    s_axis_tready,
    s_axis_tvalid,
    DI,
    E,
    Q,
    RD_PNTR_WR,
    \gmux.gm[4].gms.ms ,
    \gmux.gm[4].gms.ms_0 ,
    v1_reg,
    v1_reg_0);
  output out;
  input ram_full_fb_i_reg_0;
  input ram_full_fb_i_reg_1;
  input s_aclk;
  output s_axis_tready;
  input s_axis_tvalid;
  output [0:0]DI;
  output [0:0]E;
  input [0:0]Q;
  input [0:0]RD_PNTR_WR;
  input [3:0]\gmux.gm[4].gms.ms ;
  input [3:0]\gmux.gm[4].gms.ms_0 ;
  input [0:0]v1_reg;
  input [0:0]v1_reg_0;

  wire [0:0]DI;
  wire [0:0]E;
  wire [0:0]Q;
  wire [0:0]RD_PNTR_WR;
  wire c2_n_0;
  wire comp1;
  wire [3:0]\gmux.gm[4].gms.ms ;
  wire [3:0]\gmux.gm[4].gms.ms_0 ;
  (* DONT_TOUCH *) wire ram_full_fb_i;
  wire ram_full_fb_i_reg_0;
  wire ram_full_fb_i_reg_1;
  (* DONT_TOUCH *) wire ram_full_i;
  wire s_aclk;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire [0:0]v1_reg;
  wire [0:0]v1_reg_0;

  assign out = ram_full_fb_i;
  LUT2 #(
    .INIT(4'h2)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_i_3 
       (.I0(s_axis_tvalid),
        .I1(ram_full_fb_i),
        .O(E));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_compare c1
       (.comp1(comp1),
        .\gmux.gm[4].gms.ms_0 (\gmux.gm[4].gms.ms ),
        .v1_reg(v1_reg));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_compare_0 c2
       (.comp1(comp1),
        .\gmux.gm[4].gms.ms_0 (\gmux.gm[4].gms.ms_0 ),
        .out(ram_full_fb_i),
        .ram_full_fb_i_reg(c2_n_0),
        .ram_full_fb_i_reg_0(ram_full_fb_i_reg_1),
        .s_axis_tvalid(s_axis_tvalid),
        .v1_reg_0(v1_reg_0));
  LUT4 #(
    .INIT(16'h7510)) 
    plusOp__0_carry_i_3
       (.I0(RD_PNTR_WR),
        .I1(ram_full_fb_i),
        .I2(s_axis_tvalid),
        .I3(Q),
        .O(DI));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b0)) 
    ram_full_fb_i_reg
       (.C(s_aclk),
        .CE(1'b1),
        .D(c2_n_0),
        .Q(ram_full_fb_i),
        .S(ram_full_fb_i_reg_0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b0)) 
    ram_full_i_reg
       (.C(s_aclk),
        .CE(1'b1),
        .D(c2_n_0),
        .Q(ram_full_i),
        .S(ram_full_fb_i_reg_0));
  LUT1 #(
    .INIT(2'h1)) 
    s_axis_tready_INST_0
       (.I0(ram_full_i),
        .O(s_axis_tready));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "9" *) (* XPM_MODULE = "TRUE" *) 
(* xpm_cdc = "GRAY" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_xpm_cdc_gray
   (dest_clk,
    src_clk,
    dest_out_bin,
    src_in_bin);
  input dest_clk;
  input src_clk;
  output [8:0]dest_out_bin;
  input [8:0]src_in_bin;

  wire [8:0]async_path;
  wire [7:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [8:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [8:0]\dest_graysync_ff[1] ;
  wire [8:0]dest_out_bin;
  wire [7:0]gray_enc;
  wire src_clk;
  wire [8:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[7]),
        .Q(\dest_graysync_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[8]),
        .Q(\dest_graysync_ff[0] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [7]),
        .Q(\dest_graysync_ff[1] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [8]),
        .Q(\dest_graysync_ff[1] [8]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(binval[3]),
        .I3(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(binval[3]),
        .I2(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(binval[3]),
        .O(binval[2]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(\dest_graysync_ff[1] [7]),
        .I3(\dest_graysync_ff[1] [8]),
        .I4(\dest_graysync_ff[1] [6]),
        .I5(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [6]),
        .I2(\dest_graysync_ff[1] [8]),
        .I3(\dest_graysync_ff[1] [7]),
        .I4(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [7]),
        .I2(\dest_graysync_ff[1] [8]),
        .I3(\dest_graysync_ff[1] [6]),
        .O(binval[5]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[6]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [8]),
        .I2(\dest_graysync_ff[1] [7]),
        .O(binval[6]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[7]_i_1 
       (.I0(\dest_graysync_ff[1] [7]),
        .I1(\dest_graysync_ff[1] [8]),
        .O(binval[7]));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[7]),
        .Q(dest_out_bin[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [8]),
        .Q(dest_out_bin[8]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[6]_i_1 
       (.I0(src_in_bin[7]),
        .I1(src_in_bin[6]),
        .O(gray_enc[6]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[7]_i_1 
       (.I0(src_in_bin[8]),
        .I1(src_in_bin[7]),
        .O(gray_enc[7]));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[6]),
        .Q(async_path[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[7]),
        .Q(async_path[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[8] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[8]),
        .Q(async_path[8]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "9" *) (* XPM_MODULE = "TRUE" *) 
(* xpm_cdc = "GRAY" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_xpm_cdc_gray__2
   (dest_clk,
    src_clk,
    dest_out_bin,
    src_in_bin);
  input dest_clk;
  input src_clk;
  output [8:0]dest_out_bin;
  input [8:0]src_in_bin;

  wire [8:0]async_path;
  wire [7:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [8:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [8:0]\dest_graysync_ff[1] ;
  wire [8:0]dest_out_bin;
  wire [7:0]gray_enc;
  wire src_clk;
  wire [8:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[7]),
        .Q(\dest_graysync_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[8]),
        .Q(\dest_graysync_ff[0] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [7]),
        .Q(\dest_graysync_ff[1] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [8]),
        .Q(\dest_graysync_ff[1] [8]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(binval[3]),
        .I3(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(binval[3]),
        .I2(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(binval[3]),
        .O(binval[2]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(\dest_graysync_ff[1] [7]),
        .I3(\dest_graysync_ff[1] [8]),
        .I4(\dest_graysync_ff[1] [6]),
        .I5(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [6]),
        .I2(\dest_graysync_ff[1] [8]),
        .I3(\dest_graysync_ff[1] [7]),
        .I4(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [7]),
        .I2(\dest_graysync_ff[1] [8]),
        .I3(\dest_graysync_ff[1] [6]),
        .O(binval[5]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[6]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [8]),
        .I2(\dest_graysync_ff[1] [7]),
        .O(binval[6]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[7]_i_1 
       (.I0(\dest_graysync_ff[1] [7]),
        .I1(\dest_graysync_ff[1] [8]),
        .O(binval[7]));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[7]),
        .Q(dest_out_bin[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [8]),
        .Q(dest_out_bin[8]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[6]_i_1 
       (.I0(src_in_bin[7]),
        .I1(src_in_bin[6]),
        .O(gray_enc[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[7]_i_1 
       (.I0(src_in_bin[8]),
        .I1(src_in_bin[7]),
        .O(gray_enc[7]));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[6]),
        .Q(async_path[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[7]),
        .Q(async_path[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[8] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[8]),
        .Q(async_path[8]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* xpm_cdc = "SINGLE" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_xpm_cdc_single
   (dest_clk,
    dest_out,
    src_clk,
    src_in);
  input dest_clk;
  output dest_out;
  input src_clk;
  input src_in;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [4:0]syncstages_ff;

  assign dest_out = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* xpm_cdc = "SINGLE" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_xpm_cdc_single__2
   (dest_clk,
    dest_out,
    src_clk,
    src_in);
  input dest_clk;
  output dest_out;
  input src_clk;
  input src_in;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [4:0]syncstages_ff;

  assign dest_out = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* xpm_cdc = "SYNC_RST" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_xpm_cdc_sync_rst
   (dest_clk,
    dest_rst,
    src_rst);
  input dest_clk;
  output dest_rst;
  input src_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* xpm_cdc = "SYNC_RST" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_xpm_cdc_sync_rst__2
   (dest_clk,
    dest_rst,
    src_rst);
  input dest_clk;
  output dest_rst;
  input src_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* CHECK_LICENSE_TYPE = "gpif2mst_async_34x512,fifo_generator_v13_2_5,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* ORIG_REF_NAME = "gpif2mst_async_34x512" *) 
(* X_CORE_INFO = "fifo_generator_v13_2_5,Vivado 2019.2" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512
   (axis_prog_empty,
    axis_prog_full,
    m_aclk,
    m_axis_tready,
    m_axis_tvalid,
    s_aclk,
    s_aresetn,
    s_axis_tready,
    s_axis_tvalid,
    axis_rd_data_count,
    axis_wr_data_count,
    m_axis_tdata,
    m_axis_tuser,
    s_axis_tdata,
    s_axis_tuser);
  output axis_prog_empty;
  output axis_prog_full;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 master_aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME master_aclk, ASSOCIATED_BUSIF M_AXIS:M_AXI, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input m_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *) input m_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 2, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *) output m_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 slave_aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME slave_aclk, ASSOCIATED_BUSIF S_AXIS:S_AXI, ASSOCIATED_RESET s_aresetn, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input s_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 slave_aresetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME slave_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *) output s_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 2, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *) input s_axis_tvalid;
  output [9:0]axis_rd_data_count;
  output [9:0]axis_wr_data_count;
  output [31:0]m_axis_tdata;
  output [1:0]m_axis_tuser;
  input [31:0]s_axis_tdata;
  input [1:0]s_axis_tuser;

  wire axis_prog_empty;
  wire axis_prog_full;
  wire [9:0]axis_rd_data_count;
  wire [9:0]axis_wr_data_count;
  wire m_aclk;
  wire [31:0]m_axis_tdata;
  wire m_axis_tready;
  wire [1:0]m_axis_tuser;
  wire m_axis_tvalid;
  wire s_aclk;
  wire s_aresetn;
  wire [31:0]s_axis_tdata;
  wire s_axis_tready;
  wire [1:0]s_axis_tuser;
  wire s_axis_tvalid;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_empty_UNCONNECTED;
  wire NLW_U0_full_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_rd_rst_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire NLW_U0_wr_rst_busy_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [9:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [9:0]NLW_U0_data_count_UNCONNECTED;
  wire [17:0]NLW_U0_dout_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [9:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [9:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "32" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "4" *) 
  (* C_AXIS_TSTRB_WIDTH = "4" *) 
  (* C_AXIS_TUSER_WIDTH = "2" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "10" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "18" *) 
  (* C_DIN_WIDTH_AXIS = "34" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "32" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "18" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_FULL_FLAGS_RST_VAL = "1" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "1" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "1" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "0" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "11" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "12" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "11" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "12" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "11" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "12" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "1" *) 
  (* C_MEMORY_TYPE = "1" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "1" *) 
  (* C_PRELOAD_REGS = "0" *) 
  (* C_PRIM_FIFO_TYPE = "4kx4" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "2" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "4" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "13" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1021" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "13" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1021" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "13" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "3" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "1" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "1022" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "508" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "15" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "15" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "15" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "1021" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "1" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "10" *) 
  (* C_RD_DEPTH = "1024" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "10" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "10" *) 
  (* C_WR_DEPTH = "1024" *) 
  (* C_WR_DEPTH_AXIS = "512" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "10" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "9" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_fifo_generator_v13_2_5 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[9:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(axis_prog_empty),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(axis_prog_full),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(axis_rd_data_count),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(axis_wr_data_count),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(1'b0),
        .data_count(NLW_U0_data_count_UNCONNECTED[9:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dout(NLW_U0_dout_UNCONNECTED[17:0]),
        .empty(NLW_U0_empty_UNCONNECTED),
        .full(NLW_U0_full_UNCONNECTED),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(m_aclk),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[3:0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(m_axis_tready),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[3:0]),
        .m_axis_tuser(m_axis_tuser),
        .m_axis_tvalid(m_axis_tvalid),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(1'b0),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[9:0]),
        .rd_en(1'b0),
        .rd_rst(1'b0),
        .rd_rst_busy(NLW_U0_rd_rst_busy_UNCONNECTED),
        .rst(1'b0),
        .s_aclk(s_aclk),
        .s_aclk_en(1'b0),
        .s_aresetn(s_aresetn),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tlast(1'b0),
        .s_axis_tready(s_axis_tready),
        .s_axis_tstrb({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tuser(s_axis_tuser),
        .s_axis_tvalid(s_axis_tvalid),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(1'b0),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[9:0]),
        .wr_en(1'b0),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_generic_cstr" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_blk_mem_gen_generic_cstr
   (ENB_I,
    ENB_dly_D,
    m_aclk,
    out,
    s_aclk,
    s_axis_tvalid,
    D,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    E,
    Q,
    s_axis_tdata,
    s_axis_tuser);
  input ENB_I;
  output ENB_dly_D;
  input m_aclk;
  input out;
  input s_aclk;
  input s_axis_tvalid;
  output [33:0]D;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  input [0:0]E;
  input [8:0]Q;
  input [31:0]s_axis_tdata;
  input [1:0]s_axis_tuser;

  wire [33:0]D;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  wire [0:0]E;
  wire ENB_I;
  wire ENB_dly_D;
  wire [8:0]Q;
  wire m_aclk;
  wire out;
  wire s_aclk;
  wire [31:0]s_axis_tdata;
  wire [1:0]s_axis_tuser;
  wire s_axis_tvalid;

  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_blk_mem_gen_prim_width \ramloop[0].ram.r 
       (.D(D),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ),
        .E(E),
        .ENB_I(ENB_I),
        .ENB_dly_D(ENB_dly_D),
        .Q(Q),
        .m_aclk(m_aclk),
        .out(out),
        .s_aclk(s_aclk),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tuser(s_axis_tuser),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_blk_mem_gen_prim_width
   (ENB_I,
    ENB_dly_D,
    m_aclk,
    out,
    s_aclk,
    s_axis_tvalid,
    D,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    E,
    Q,
    s_axis_tdata,
    s_axis_tuser);
  input ENB_I;
  output ENB_dly_D;
  input m_aclk;
  input out;
  input s_aclk;
  input s_axis_tvalid;
  output [33:0]D;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  input [0:0]E;
  input [8:0]Q;
  input [31:0]s_axis_tdata;
  input [1:0]s_axis_tuser;

  wire [33:0]D;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  wire [0:0]E;
  wire ENA_dly_D;
  wire ENB_I;
  wire ENB_dly;
  wire ENB_dly_D;
  wire POR_A0;
  wire POR_B;
  wire POR_B0;
  wire [8:0]Q;
  wire [4:0]RSTA_SHFT_REG;
  wire [4:0]RSTB_SHFT_REG;
  wire \SAFETY_CKT_GEN.ENA_NO_REG.ENA_dly_reg_srl2_n_0 ;
  wire \SAFETY_CKT_GEN.RSTA_SHFT_REG_reg[3]_srl3_n_0 ;
  wire \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[3]_srl3_n_0 ;
  wire m_aclk;
  wire out;
  wire s_aclk;
  wire [31:0]s_axis_tdata;
  wire [1:0]s_axis_tuser;
  wire s_axis_tvalid;

  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.ENA_NO_REG.ENA_dly_D_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\SAFETY_CKT_GEN.ENA_NO_REG.ENA_dly_reg_srl2_n_0 ),
        .Q(ENA_dly_D),
        .R(1'b0));
  (* srl_bus_name = "U0/\inst_fifo_gen/gaxis_fifo.gaxisf.axisf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop " *) 
  (* srl_name = "U0/\inst_fifo_gen/gaxis_fifo.gaxisf.axisf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/SAFETY_CKT_GEN.ENA_NO_REG.ENA_dly_reg_srl2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SAFETY_CKT_GEN.ENA_NO_REG.ENA_dly_reg_srl2 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(s_aclk),
        .D(POR_A0),
        .Q(\SAFETY_CKT_GEN.ENA_NO_REG.ENA_dly_reg_srl2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \SAFETY_CKT_GEN.ENA_NO_REG.ENA_dly_reg_srl2_i_1 
       (.I0(RSTA_SHFT_REG[0]),
        .I1(RSTA_SHFT_REG[4]),
        .O(POR_A0));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.ENB_NO_REG.ENB_dly_D_reg 
       (.C(m_aclk),
        .CE(1'b1),
        .D(ENB_dly),
        .Q(ENB_dly_D),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.ENB_NO_REG.ENB_dly_reg 
       (.C(m_aclk),
        .CE(1'b1),
        .D(POR_B),
        .Q(ENB_dly),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \SAFETY_CKT_GEN.POR_B_i_1 
       (.I0(RSTB_SHFT_REG[0]),
        .I1(RSTB_SHFT_REG[4]),
        .O(POR_B0));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.POR_B_reg 
       (.C(m_aclk),
        .CE(1'b1),
        .D(POR_B0),
        .Q(POR_B),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.RSTA_SHFT_REG_reg[0] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(1'b1),
        .Q(RSTA_SHFT_REG[0]),
        .R(1'b0));
  (* srl_bus_name = "U0/\inst_fifo_gen/gaxis_fifo.gaxisf.axisf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/SAFETY_CKT_GEN.RSTA_SHFT_REG_reg " *) 
  (* srl_name = "U0/\inst_fifo_gen/gaxis_fifo.gaxisf.axisf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/SAFETY_CKT_GEN.RSTA_SHFT_REG_reg[3]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SAFETY_CKT_GEN.RSTA_SHFT_REG_reg[3]_srl3 
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(s_aclk),
        .D(RSTA_SHFT_REG[0]),
        .Q(\SAFETY_CKT_GEN.RSTA_SHFT_REG_reg[3]_srl3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.RSTA_SHFT_REG_reg[4] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\SAFETY_CKT_GEN.RSTA_SHFT_REG_reg[3]_srl3_n_0 ),
        .Q(RSTA_SHFT_REG[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(1'b1),
        .Q(RSTB_SHFT_REG[0]),
        .R(1'b0));
  (* srl_bus_name = "U0/\inst_fifo_gen/gaxis_fifo.gaxisf.axisf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/SAFETY_CKT_GEN.RSTB_SHFT_REG_reg " *) 
  (* srl_name = "U0/\inst_fifo_gen/gaxis_fifo.gaxisf.axisf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[3]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[3]_srl3 
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(m_aclk),
        .D(RSTB_SHFT_REG[0]),
        .Q(\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[3]_srl3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[3]_srl3_n_0 ),
        .Q(RSTB_SHFT_REG[4]),
        .R(1'b0));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_blk_mem_gen_prim_wrapper \prim_noinit.ram 
       (.D(D),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ),
        .E(E),
        .ENA_dly_D(ENA_dly_D),
        .ENB_I(ENB_I),
        .POR_B(POR_B),
        .Q(Q),
        .m_aclk(m_aclk),
        .out(out),
        .s_aclk(s_aclk),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tuser(s_axis_tuser),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_blk_mem_gen_prim_wrapper
   (ENA_dly_D,
    ENB_I,
    POR_B,
    m_aclk,
    out,
    s_aclk,
    s_axis_tvalid,
    D,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 ,
    E,
    Q,
    s_axis_tdata,
    s_axis_tuser);
  input ENA_dly_D;
  input ENB_I;
  input POR_B;
  input m_aclk;
  input out;
  input s_aclk;
  input s_axis_tvalid;
  output [33:0]D;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 ;
  input [0:0]E;
  input [8:0]Q;
  input [31:0]s_axis_tdata;
  input [1:0]s_axis_tuser;

  wire [33:0]D;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_32 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_34 ;
  wire [0:0]E;
  wire ENA_I;
  wire ENA_dly_D;
  wire ENB_I;
  wire POR_B;
  wire [8:0]Q;
  wire m_aclk;
  wire out;
  wire s_aclk;
  wire [31:0]s_axis_tdata;
  wire [1:0]s_axis_tuser;
  wire s_axis_tvalid;

  (* BOX_TYPE = "PRIMITIVE" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_MODE("SDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(36)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram 
       (.ADDRARDADDR({Q,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 ,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CLKARDCLK(m_aclk),
        .CLKBWRCLK(s_aclk),
        .DIADI({s_axis_tdata[14:7],s_axis_tdata[5:0],s_axis_tuser}),
        .DIBDI({s_axis_tdata[31:24],s_axis_tdata[22:15]}),
        .DIPADIP({1'b0,s_axis_tdata[6]}),
        .DIPBDIP({1'b0,s_axis_tdata[23]}),
        .DOADO({D[16:9],D[7:0]}),
        .DOBDO({D[33:26],D[24:17]}),
        .DOPADOP({\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_32 ,D[8]}),
        .DOPBDOP({\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_34 ,D[25]}),
        .ENARDEN(ENB_I),
        .ENBWREN(ENA_I),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(POR_B),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({E,E,E,E}));
  LUT3 #(
    .INIT(8'hBA)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_i_2 
       (.I0(ENA_dly_D),
        .I1(out),
        .I2(s_axis_tvalid),
        .O(ENA_I));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_top" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_blk_mem_gen_top
   (ENB_I,
    ENB_dly_D,
    m_aclk,
    out,
    s_aclk,
    s_axis_tvalid,
    D,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    E,
    Q,
    s_axis_tdata,
    s_axis_tuser);
  input ENB_I;
  output ENB_dly_D;
  input m_aclk;
  input out;
  input s_aclk;
  input s_axis_tvalid;
  output [33:0]D;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  input [0:0]E;
  input [8:0]Q;
  input [31:0]s_axis_tdata;
  input [1:0]s_axis_tuser;

  wire [33:0]D;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  wire [0:0]E;
  wire ENB_I;
  wire ENB_dly_D;
  wire [8:0]Q;
  wire m_aclk;
  wire out;
  wire s_aclk;
  wire [31:0]s_axis_tdata;
  wire [1:0]s_axis_tuser;
  wire s_axis_tvalid;

  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_blk_mem_gen_generic_cstr \valid.cstr 
       (.D(D),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ),
        .E(E),
        .ENB_I(ENB_I),
        .ENB_dly_D(ENB_dly_D),
        .Q(Q),
        .m_aclk(m_aclk),
        .out(out),
        .s_aclk(s_aclk),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tuser(s_axis_tuser),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_4_4" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_blk_mem_gen_v8_4_4
   (ENB_I,
    ENB_dly_D,
    m_aclk,
    out,
    s_aclk,
    s_axis_tvalid,
    D,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    E,
    Q,
    s_axis_tdata,
    s_axis_tuser);
  input ENB_I;
  output ENB_dly_D;
  input m_aclk;
  input out;
  input s_aclk;
  input s_axis_tvalid;
  output [33:0]D;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  input [0:0]E;
  input [8:0]Q;
  input [31:0]s_axis_tdata;
  input [1:0]s_axis_tuser;

  wire [33:0]D;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  wire [0:0]E;
  wire ENB_I;
  wire ENB_dly_D;
  wire [8:0]Q;
  wire m_aclk;
  wire out;
  wire s_aclk;
  wire [31:0]s_axis_tdata;
  wire [1:0]s_axis_tuser;
  wire s_axis_tvalid;

  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_blk_mem_gen_v8_4_4_synth inst_blk_mem_gen
       (.D(D),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ),
        .E(E),
        .ENB_I(ENB_I),
        .ENB_dly_D(ENB_dly_D),
        .Q(Q),
        .m_aclk(m_aclk),
        .out(out),
        .s_aclk(s_aclk),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tuser(s_axis_tuser),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_4_4_synth" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_blk_mem_gen_v8_4_4_synth
   (ENB_I,
    ENB_dly_D,
    m_aclk,
    out,
    s_aclk,
    s_axis_tvalid,
    D,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    E,
    Q,
    s_axis_tdata,
    s_axis_tuser);
  input ENB_I;
  output ENB_dly_D;
  input m_aclk;
  input out;
  input s_aclk;
  input s_axis_tvalid;
  output [33:0]D;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  input [0:0]E;
  input [8:0]Q;
  input [31:0]s_axis_tdata;
  input [1:0]s_axis_tuser;

  wire [33:0]D;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  wire [0:0]E;
  wire ENB_I;
  wire ENB_dly_D;
  wire [8:0]Q;
  wire m_aclk;
  wire out;
  wire s_aclk;
  wire [31:0]s_axis_tdata;
  wire [1:0]s_axis_tuser;
  wire s_axis_tvalid;

  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_blk_mem_gen_top \gnbram.gnativebmg.native_blk_mem_gen 
       (.D(D),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ),
        .E(E),
        .ENB_I(ENB_I),
        .ENB_dly_D(ENB_dly_D),
        .Q(Q),
        .m_aclk(m_aclk),
        .out(out),
        .s_aclk(s_aclk),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tuser(s_axis_tuser),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

(* ORIG_REF_NAME = "clk_x_pntrs" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_clk_x_pntrs
   (dest_out_bin_ff_reg,
    \dest_out_bin_ff_reg[3]_0 ,
    \dest_out_bin_ff_reg[3]_1 ,
    \dest_out_bin_ff_reg[3]_2 ,
    \dest_out_bin_ff_reg[3]_3 ,
    \dest_out_bin_ff_reg[7]_0 ,
    \dest_out_bin_ff_reg[7]_1 ,
    \dest_out_bin_ff_reg[7]_2 ,
    m_aclk,
    s_aclk,
    DI,
    O,
    Q,
    RD_PNTR_WR,
    S,
    WR_PNTR_RD,
    \dest_out_bin_ff_reg[2] ,
    \dest_out_bin_ff_reg[6] ,
    \dest_out_bin_ff_reg[6]_0 ,
    \gdiff.diff_pntr_pad_reg[9] ,
    \gmux.gm[3].gms.ms ,
    \gmux.gm[4].gms.ms ,
    \src_gray_ff_reg[8] ,
    v1_reg,
    v1_reg_0,
    v1_reg_1,
    v1_reg_2);
  output [8:3]dest_out_bin_ff_reg;
  output \dest_out_bin_ff_reg[3]_0 ;
  output \dest_out_bin_ff_reg[3]_1 ;
  output \dest_out_bin_ff_reg[3]_2 ;
  output \dest_out_bin_ff_reg[3]_3 ;
  output \dest_out_bin_ff_reg[7]_0 ;
  output \dest_out_bin_ff_reg[7]_1 ;
  output \dest_out_bin_ff_reg[7]_2 ;
  input m_aclk;
  input s_aclk;
  output [1:0]DI;
  output [0:0]O;
  input [8:0]Q;
  output [8:0]RD_PNTR_WR;
  output [0:0]S;
  output [8:0]WR_PNTR_RD;
  output [1:0]\dest_out_bin_ff_reg[2] ;
  output [3:0]\dest_out_bin_ff_reg[6] ;
  output [3:0]\dest_out_bin_ff_reg[6]_0 ;
  input [8:0]\gdiff.diff_pntr_pad_reg[9] ;
  input [7:0]\gmux.gm[3].gms.ms ;
  input [0:0]\gmux.gm[4].gms.ms ;
  input [8:0]\src_gray_ff_reg[8] ;
  output [3:0]v1_reg;
  output [3:0]v1_reg_0;
  output [3:0]v1_reg_1;
  output [0:0]v1_reg_2;

  wire [1:0]DI;
  wire [0:0]O;
  wire [8:0]Q;
  wire [8:0]RD_PNTR_WR;
  wire [0:0]S;
  wire [8:0]WR_PNTR_RD;
  wire [8:3]dest_out_bin_ff_reg;
  wire [1:0]\dest_out_bin_ff_reg[2] ;
  wire \dest_out_bin_ff_reg[3]_0 ;
  wire \dest_out_bin_ff_reg[3]_1 ;
  wire \dest_out_bin_ff_reg[3]_2 ;
  wire \dest_out_bin_ff_reg[3]_3 ;
  wire [3:0]\dest_out_bin_ff_reg[6] ;
  wire [3:0]\dest_out_bin_ff_reg[6]_0 ;
  wire \dest_out_bin_ff_reg[7]_0 ;
  wire \dest_out_bin_ff_reg[7]_1 ;
  wire \dest_out_bin_ff_reg[7]_2 ;
  wire [8:1]diff_wr_rd__0;
  wire \g_rd.gvalid_low.rd_dc_i[6]_i_3_n_0 ;
  wire \g_rd.gvalid_low.rd_dc_i[6]_i_4_n_0 ;
  wire \g_rd.gvalid_low.rd_dc_i[6]_i_5_n_0 ;
  wire \g_rd.gvalid_low.rd_dc_i[6]_i_6_n_0 ;
  wire \g_rd.gvalid_low.rd_dc_i[9]_i_10_n_0 ;
  wire \g_rd.gvalid_low.rd_dc_i[9]_i_4_n_0 ;
  wire \g_rd.gvalid_low.rd_dc_i[9]_i_6_n_0 ;
  wire \g_rd.gvalid_low.rd_dc_i[9]_i_7_n_0 ;
  wire \g_rd.gvalid_low.rd_dc_i[9]_i_8_n_0 ;
  wire \g_rd.gvalid_low.rd_dc_i[9]_i_9_n_0 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[6]_i_2_n_0 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[6]_i_2_n_1 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[6]_i_2_n_2 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[6]_i_2_n_3 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[9]_i_5_n_0 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[9]_i_5_n_1 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[9]_i_5_n_2 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[9]_i_5_n_3 ;
  wire [8:0]\gdiff.diff_pntr_pad_reg[9] ;
  wire [7:0]\gmux.gm[3].gms.ms ;
  wire [0:0]\gmux.gm[4].gms.ms ;
  wire m_aclk;
  wire s_aclk;
  wire [8:0]\src_gray_ff_reg[8] ;
  wire [3:0]v1_reg;
  wire [3:0]v1_reg_0;
  wire [3:0]v1_reg_1;
  wire [0:0]v1_reg_2;
  wire [3:0]\NLW_g_rd.gvalid_low.rd_dc_i_reg[9]_i_3_CO_UNCONNECTED ;
  wire [3:1]\NLW_g_rd.gvalid_low.rd_dc_i_reg[9]_i_3_O_UNCONNECTED ;

  LUT1 #(
    .INIT(2'h1)) 
    \g_rd.gvalid_low.rd_dc_i[1]_i_1 
       (.I0(diff_wr_rd__0[1]),
        .O(dest_out_bin_ff_reg[3]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \g_rd.gvalid_low.rd_dc_i[2]_i_1 
       (.I0(diff_wr_rd__0[1]),
        .I1(diff_wr_rd__0[2]),
        .O(\dest_out_bin_ff_reg[3]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \g_rd.gvalid_low.rd_dc_i[3]_i_1 
       (.I0(diff_wr_rd__0[1]),
        .I1(diff_wr_rd__0[2]),
        .I2(diff_wr_rd__0[3]),
        .O(\dest_out_bin_ff_reg[3]_3 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \g_rd.gvalid_low.rd_dc_i[4]_i_1 
       (.I0(diff_wr_rd__0[2]),
        .I1(diff_wr_rd__0[1]),
        .I2(diff_wr_rd__0[3]),
        .I3(diff_wr_rd__0[4]),
        .O(\dest_out_bin_ff_reg[3]_2 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \g_rd.gvalid_low.rd_dc_i[5]_i_1 
       (.I0(diff_wr_rd__0[3]),
        .I1(diff_wr_rd__0[1]),
        .I2(diff_wr_rd__0[2]),
        .I3(diff_wr_rd__0[4]),
        .I4(diff_wr_rd__0[5]),
        .O(\dest_out_bin_ff_reg[3]_1 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \g_rd.gvalid_low.rd_dc_i[6]_i_1 
       (.I0(diff_wr_rd__0[4]),
        .I1(diff_wr_rd__0[2]),
        .I2(diff_wr_rd__0[1]),
        .I3(diff_wr_rd__0[3]),
        .I4(diff_wr_rd__0[5]),
        .I5(diff_wr_rd__0[6]),
        .O(\dest_out_bin_ff_reg[7]_2 ));
  LUT2 #(
    .INIT(4'h9)) 
    \g_rd.gvalid_low.rd_dc_i[6]_i_3 
       (.I0(WR_PNTR_RD[3]),
        .I1(Q[3]),
        .O(\g_rd.gvalid_low.rd_dc_i[6]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \g_rd.gvalid_low.rd_dc_i[6]_i_4 
       (.I0(WR_PNTR_RD[2]),
        .I1(Q[2]),
        .O(\g_rd.gvalid_low.rd_dc_i[6]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \g_rd.gvalid_low.rd_dc_i[6]_i_5 
       (.I0(WR_PNTR_RD[1]),
        .I1(Q[1]),
        .O(\g_rd.gvalid_low.rd_dc_i[6]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \g_rd.gvalid_low.rd_dc_i[6]_i_6 
       (.I0(WR_PNTR_RD[0]),
        .I1(Q[0]),
        .O(\g_rd.gvalid_low.rd_dc_i[6]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \g_rd.gvalid_low.rd_dc_i[7]_i_1 
       (.I0(\g_rd.gvalid_low.rd_dc_i[9]_i_4_n_0 ),
        .I1(diff_wr_rd__0[7]),
        .O(\dest_out_bin_ff_reg[7]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \g_rd.gvalid_low.rd_dc_i[8]_i_1 
       (.I0(\g_rd.gvalid_low.rd_dc_i[9]_i_4_n_0 ),
        .I1(diff_wr_rd__0[7]),
        .I2(diff_wr_rd__0[8]),
        .O(\dest_out_bin_ff_reg[7]_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \g_rd.gvalid_low.rd_dc_i[9]_i_10 
       (.I0(WR_PNTR_RD[4]),
        .I1(Q[4]),
        .O(\g_rd.gvalid_low.rd_dc_i[9]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \g_rd.gvalid_low.rd_dc_i[9]_i_2 
       (.I0(diff_wr_rd__0[8]),
        .I1(\g_rd.gvalid_low.rd_dc_i[9]_i_4_n_0 ),
        .I2(diff_wr_rd__0[7]),
        .O(dest_out_bin_ff_reg[7]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \g_rd.gvalid_low.rd_dc_i[9]_i_4 
       (.I0(diff_wr_rd__0[6]),
        .I1(diff_wr_rd__0[4]),
        .I2(diff_wr_rd__0[2]),
        .I3(diff_wr_rd__0[1]),
        .I4(diff_wr_rd__0[3]),
        .I5(diff_wr_rd__0[5]),
        .O(\g_rd.gvalid_low.rd_dc_i[9]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \g_rd.gvalid_low.rd_dc_i[9]_i_6 
       (.I0(WR_PNTR_RD[8]),
        .I1(Q[8]),
        .O(\g_rd.gvalid_low.rd_dc_i[9]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \g_rd.gvalid_low.rd_dc_i[9]_i_7 
       (.I0(WR_PNTR_RD[7]),
        .I1(Q[7]),
        .O(\g_rd.gvalid_low.rd_dc_i[9]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \g_rd.gvalid_low.rd_dc_i[9]_i_8 
       (.I0(WR_PNTR_RD[6]),
        .I1(Q[6]),
        .O(\g_rd.gvalid_low.rd_dc_i[9]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \g_rd.gvalid_low.rd_dc_i[9]_i_9 
       (.I0(WR_PNTR_RD[5]),
        .I1(Q[5]),
        .O(\g_rd.gvalid_low.rd_dc_i[9]_i_9_n_0 ));
  CARRY4 \g_rd.gvalid_low.rd_dc_i_reg[6]_i_2 
       (.CI(1'b0),
        .CO({\g_rd.gvalid_low.rd_dc_i_reg[6]_i_2_n_0 ,\g_rd.gvalid_low.rd_dc_i_reg[6]_i_2_n_1 ,\g_rd.gvalid_low.rd_dc_i_reg[6]_i_2_n_2 ,\g_rd.gvalid_low.rd_dc_i_reg[6]_i_2_n_3 }),
        .CYINIT(1'b1),
        .DI(WR_PNTR_RD[3:0]),
        .O({diff_wr_rd__0[3:1],O}),
        .S({\g_rd.gvalid_low.rd_dc_i[6]_i_3_n_0 ,\g_rd.gvalid_low.rd_dc_i[6]_i_4_n_0 ,\g_rd.gvalid_low.rd_dc_i[6]_i_5_n_0 ,\g_rd.gvalid_low.rd_dc_i[6]_i_6_n_0 }));
  CARRY4 \g_rd.gvalid_low.rd_dc_i_reg[9]_i_3 
       (.CI(\g_rd.gvalid_low.rd_dc_i_reg[9]_i_5_n_0 ),
        .CO(\NLW_g_rd.gvalid_low.rd_dc_i_reg[9]_i_3_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_g_rd.gvalid_low.rd_dc_i_reg[9]_i_3_O_UNCONNECTED [3:1],diff_wr_rd__0[8]}),
        .S({1'b0,1'b0,1'b0,\g_rd.gvalid_low.rd_dc_i[9]_i_6_n_0 }));
  CARRY4 \g_rd.gvalid_low.rd_dc_i_reg[9]_i_5 
       (.CI(\g_rd.gvalid_low.rd_dc_i_reg[6]_i_2_n_0 ),
        .CO({\g_rd.gvalid_low.rd_dc_i_reg[9]_i_5_n_0 ,\g_rd.gvalid_low.rd_dc_i_reg[9]_i_5_n_1 ,\g_rd.gvalid_low.rd_dc_i_reg[9]_i_5_n_2 ,\g_rd.gvalid_low.rd_dc_i_reg[9]_i_5_n_3 }),
        .CYINIT(1'b0),
        .DI(WR_PNTR_RD[7:4]),
        .O(diff_wr_rd__0[7:4]),
        .S({\g_rd.gvalid_low.rd_dc_i[9]_i_7_n_0 ,\g_rd.gvalid_low.rd_dc_i[9]_i_8_n_0 ,\g_rd.gvalid_low.rd_dc_i[9]_i_9_n_0 ,\g_rd.gvalid_low.rd_dc_i[9]_i_10_n_0 }));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1 
       (.I0(RD_PNTR_WR[0]),
        .I1(\gdiff.diff_pntr_pad_reg[9] [0]),
        .I2(RD_PNTR_WR[1]),
        .I3(\gdiff.diff_pntr_pad_reg[9] [1]),
        .O(v1_reg[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1__0 
       (.I0(RD_PNTR_WR[0]),
        .I1(\gmux.gm[3].gms.ms [0]),
        .I2(RD_PNTR_WR[1]),
        .I3(\gmux.gm[3].gms.ms [1]),
        .O(v1_reg_0[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1__1 
       (.I0(WR_PNTR_RD[0]),
        .I1(Q[0]),
        .I2(WR_PNTR_RD[1]),
        .I3(Q[1]),
        .O(v1_reg_1[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1 
       (.I0(RD_PNTR_WR[2]),
        .I1(\gdiff.diff_pntr_pad_reg[9] [2]),
        .I2(RD_PNTR_WR[3]),
        .I3(\gdiff.diff_pntr_pad_reg[9] [3]),
        .O(v1_reg[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1__0 
       (.I0(RD_PNTR_WR[2]),
        .I1(\gmux.gm[3].gms.ms [2]),
        .I2(RD_PNTR_WR[3]),
        .I3(\gmux.gm[3].gms.ms [3]),
        .O(v1_reg_0[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1__1 
       (.I0(WR_PNTR_RD[2]),
        .I1(Q[2]),
        .I2(WR_PNTR_RD[3]),
        .I3(Q[3]),
        .O(v1_reg_1[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1 
       (.I0(RD_PNTR_WR[4]),
        .I1(\gdiff.diff_pntr_pad_reg[9] [4]),
        .I2(RD_PNTR_WR[5]),
        .I3(\gdiff.diff_pntr_pad_reg[9] [5]),
        .O(v1_reg[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1__0 
       (.I0(RD_PNTR_WR[4]),
        .I1(\gmux.gm[3].gms.ms [4]),
        .I2(RD_PNTR_WR[5]),
        .I3(\gmux.gm[3].gms.ms [5]),
        .O(v1_reg_0[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1__1 
       (.I0(WR_PNTR_RD[4]),
        .I1(Q[4]),
        .I2(WR_PNTR_RD[5]),
        .I3(Q[5]),
        .O(v1_reg_1[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1 
       (.I0(RD_PNTR_WR[6]),
        .I1(\gdiff.diff_pntr_pad_reg[9] [6]),
        .I2(RD_PNTR_WR[7]),
        .I3(\gdiff.diff_pntr_pad_reg[9] [7]),
        .O(v1_reg[3]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1__0 
       (.I0(RD_PNTR_WR[6]),
        .I1(\gmux.gm[3].gms.ms [6]),
        .I2(RD_PNTR_WR[7]),
        .I3(\gmux.gm[3].gms.ms [7]),
        .O(v1_reg_0[3]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1__1 
       (.I0(WR_PNTR_RD[6]),
        .I1(Q[6]),
        .I2(WR_PNTR_RD[7]),
        .I3(Q[7]),
        .O(v1_reg_1[3]));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[4].gms.ms_i_1__0 
       (.I0(WR_PNTR_RD[8]),
        .I1(\gmux.gm[4].gms.ms ),
        .O(v1_reg_2));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[4].gms.ms_i_1__1 
       (.I0(WR_PNTR_RD[8]),
        .I1(Q[8]),
        .O(dest_out_bin_ff_reg[8]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry__0_i_1__0
       (.I0(WR_PNTR_RD[6]),
        .I1(Q[6]),
        .O(\dest_out_bin_ff_reg[6] [3]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry__0_i_2__0
       (.I0(WR_PNTR_RD[5]),
        .I1(Q[5]),
        .O(\dest_out_bin_ff_reg[6] [2]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry__0_i_3__0
       (.I0(WR_PNTR_RD[4]),
        .I1(Q[4]),
        .O(\dest_out_bin_ff_reg[6] [1]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry__0_i_4__0
       (.I0(WR_PNTR_RD[3]),
        .I1(Q[3]),
        .O(\dest_out_bin_ff_reg[6] [0]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__0_i_5
       (.I0(RD_PNTR_WR[6]),
        .I1(\gdiff.diff_pntr_pad_reg[9] [6]),
        .I2(\gdiff.diff_pntr_pad_reg[9] [7]),
        .I3(RD_PNTR_WR[7]),
        .O(\dest_out_bin_ff_reg[6]_0 [3]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__0_i_6
       (.I0(RD_PNTR_WR[5]),
        .I1(\gdiff.diff_pntr_pad_reg[9] [5]),
        .I2(\gdiff.diff_pntr_pad_reg[9] [6]),
        .I3(RD_PNTR_WR[6]),
        .O(\dest_out_bin_ff_reg[6]_0 [2]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__0_i_7
       (.I0(RD_PNTR_WR[4]),
        .I1(\gdiff.diff_pntr_pad_reg[9] [4]),
        .I2(\gdiff.diff_pntr_pad_reg[9] [5]),
        .I3(RD_PNTR_WR[5]),
        .O(\dest_out_bin_ff_reg[6]_0 [1]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__0_i_8
       (.I0(RD_PNTR_WR[3]),
        .I1(\gdiff.diff_pntr_pad_reg[9] [3]),
        .I2(\gdiff.diff_pntr_pad_reg[9] [4]),
        .I3(RD_PNTR_WR[4]),
        .O(\dest_out_bin_ff_reg[6]_0 [0]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__1_i_1
       (.I0(RD_PNTR_WR[7]),
        .I1(\gdiff.diff_pntr_pad_reg[9] [7]),
        .I2(RD_PNTR_WR[8]),
        .I3(\gdiff.diff_pntr_pad_reg[9] [8]),
        .O(S));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry_i_1__0
       (.I0(WR_PNTR_RD[2]),
        .I1(Q[2]),
        .O(DI[1]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry_i_2__0
       (.I0(WR_PNTR_RD[1]),
        .I1(Q[1]),
        .O(DI[0]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry_i_4
       (.I0(RD_PNTR_WR[2]),
        .I1(\gdiff.diff_pntr_pad_reg[9] [2]),
        .I2(\gdiff.diff_pntr_pad_reg[9] [3]),
        .I3(RD_PNTR_WR[3]),
        .O(\dest_out_bin_ff_reg[2] [1]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry_i_5
       (.I0(RD_PNTR_WR[1]),
        .I1(\gdiff.diff_pntr_pad_reg[9] [1]),
        .I2(\gdiff.diff_pntr_pad_reg[9] [2]),
        .I3(RD_PNTR_WR[2]),
        .O(\dest_out_bin_ff_reg[2] [0]));
  (* DEST_SYNC_FF = "2" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* REG_OUTPUT = "1" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* WIDTH = "9" *) 
  (* XPM_CDC = "GRAY" *) 
  (* XPM_MODULE = "TRUE" *) 
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_xpm_cdc_gray rd_pntr_cdc_inst
       (.dest_clk(s_aclk),
        .dest_out_bin(RD_PNTR_WR),
        .src_clk(m_aclk),
        .src_in_bin(Q));
  (* DEST_SYNC_FF = "2" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* REG_OUTPUT = "1" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* WIDTH = "9" *) 
  (* XPM_CDC = "GRAY" *) 
  (* XPM_MODULE = "TRUE" *) 
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_xpm_cdc_gray__2 wr_pntr_cdc_inst
       (.dest_clk(m_aclk),
        .dest_out_bin(WR_PNTR_RD),
        .src_clk(s_aclk),
        .src_in_bin(\src_gray_ff_reg[8] ));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_compare
   (comp1,
    \gmux.gm[4].gms.ms_0 ,
    v1_reg);
  output comp1;
  input [3:0]\gmux.gm[4].gms.ms_0 ;
  input [0:0]v1_reg;

  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_3;
  wire comp1;
  wire [3:0]\gmux.gm[4].gms.ms_0 ;
  wire [0:0]v1_reg;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({carrynet_3,carrynet_2,carrynet_1,carrynet_0}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(\gmux.gm[4].gms.ms_0 ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(carrynet_3),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3:1],comp1}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3:1],1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3:1],v1_reg}));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_compare_0
   (comp1,
    out,
    ram_full_fb_i_reg,
    ram_full_fb_i_reg_0,
    s_axis_tvalid,
    \gmux.gm[4].gms.ms_0 ,
    v1_reg_0);
  input comp1;
  input out;
  output ram_full_fb_i_reg;
  input ram_full_fb_i_reg_0;
  input s_axis_tvalid;
  input [3:0]\gmux.gm[4].gms.ms_0 ;
  input [0:0]v1_reg_0;

  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_3;
  wire comp1;
  wire comp2;
  wire [3:0]\gmux.gm[4].gms.ms_0 ;
  wire out;
  wire ram_full_fb_i_reg;
  wire ram_full_fb_i_reg_0;
  wire s_axis_tvalid;
  wire [0:0]v1_reg_0;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({carrynet_3,carrynet_2,carrynet_1,carrynet_0}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(\gmux.gm[4].gms.ms_0 ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(carrynet_3),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3:1],comp2}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3:1],1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3:1],v1_reg_0}));
  LUT5 #(
    .INIT(32'h0000FF20)) 
    ram_full_i_i_1
       (.I0(comp2),
        .I1(out),
        .I2(s_axis_tvalid),
        .I3(comp1),
        .I4(ram_full_fb_i_reg_0),
        .O(ram_full_fb_i_reg));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_compare_1
   (comp1,
    ram_empty_fb_i_reg,
    ram_empty_fb_i_reg_0,
    ram_rd_en,
    v1_reg);
  input comp1;
  output ram_empty_fb_i_reg;
  input ram_empty_fb_i_reg_0;
  input ram_rd_en;
  input [3:0]v1_reg;

  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_3;
  wire comp0;
  wire comp1;
  wire ram_empty_fb_i_reg;
  wire ram_empty_fb_i_reg_0;
  wire ram_rd_en;
  wire [3:0]v1_reg;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({carrynet_3,carrynet_2,carrynet_1,carrynet_0}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(v1_reg));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(carrynet_3),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3:1],comp0}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3:1],1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3:1],ram_empty_fb_i_reg_0}));
  LUT3 #(
    .INIT(8'hEA)) 
    ram_empty_i_i_1
       (.I0(comp0),
        .I1(ram_rd_en),
        .I2(comp1),
        .O(ram_empty_fb_i_reg));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_compare_2
   (comp1,
    ram_empty_fb_i_reg,
    v1_reg_0);
  output comp1;
  input [0:0]ram_empty_fb_i_reg;
  input [3:0]v1_reg_0;

  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_3;
  wire comp1;
  wire [0:0]ram_empty_fb_i_reg;
  wire [3:0]v1_reg_0;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({carrynet_3,carrynet_2,carrynet_1,carrynet_0}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(v1_reg_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(carrynet_3),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3:1],comp1}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3:1],1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3:1],ram_empty_fb_i_reg}));
endmodule

(* ORIG_REF_NAME = "fifo_generator_ramfifo" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_fifo_generator_ramfifo
   (axis_prog_empty,
    axis_prog_full,
    m_aclk,
    m_axis_tready,
    m_axis_tvalid,
    s_aclk,
    s_aresetn,
    s_axis_tready,
    s_axis_tvalid,
    wr_rst_busy,
    Q,
    axis_rd_data_count,
    axis_wr_data_count,
    s_axis_tdata,
    s_axis_tuser);
  output axis_prog_empty;
  output axis_prog_full;
  input m_aclk;
  input m_axis_tready;
  output m_axis_tvalid;
  input s_aclk;
  input s_aresetn;
  output s_axis_tready;
  input s_axis_tvalid;
  output wr_rst_busy;
  output [33:0]Q;
  output [9:0]axis_rd_data_count;
  output [9:0]axis_wr_data_count;
  input [31:0]s_axis_tdata;
  input [1:0]s_axis_tuser;

  wire [33:0]Q;
  wire axis_prog_empty;
  wire axis_prog_full;
  wire [9:0]axis_rd_data_count;
  wire [9:0]axis_wr_data_count;
  wire [0:0]diff_wr_rd;
  wire dout_i;
  wire full_fb_axis;
  wire \gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENB_I ;
  wire \gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENB_dly_D ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_10 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_11 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_12 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_13 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_14 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_15 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_16 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_34 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_35 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_36 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_37 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_38 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_39 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_45 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_46 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_47 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_48 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_49 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_50 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_51 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_52 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_53 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_9 ;
  wire [3:0]\gras.rsts/c0/v1_reg ;
  wire [4:4]\gras.rsts/c1/v1_reg ;
  wire [3:0]\gwas.wsts/c1/v1_reg ;
  wire [3:0]\gwas.wsts/c2/v1_reg ;
  wire m_aclk;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire ram_wr_en;
  wire [8:0]rd_pntr;
  wire [8:8]rd_pntr_plus1;
  wire [8:0]rd_pntr_wr;
  wire rst_full_gen_i;
  wire rstblk_n_0;
  wire rstblk_n_1;
  wire s_aclk;
  wire s_aresetn;
  wire [31:0]s_axis_tdata;
  wire s_axis_tready;
  wire [1:0]s_axis_tuser;
  wire s_axis_tvalid;
  wire [8:0]wr_pntr;
  wire [8:0]wr_pntr_plus1;
  wire [7:0]wr_pntr_plus2;
  wire [8:0]wr_pntr_rd;
  wire wr_rst_busy;
  wire [6:4]\NLW_gntv_or_sync_fifo.gcx.clkx_dest_out_bin_ff_reg_UNCONNECTED ;

  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_clk_x_pntrs \gntv_or_sync_fifo.gcx.clkx 
       (.DI({\gntv_or_sync_fifo.gcx.clkx_n_9 ,\gntv_or_sync_fifo.gcx.clkx_n_10 }),
        .O(diff_wr_rd),
        .Q(rd_pntr),
        .RD_PNTR_WR(rd_pntr_wr),
        .S(\gntv_or_sync_fifo.gcx.clkx_n_16 ),
        .WR_PNTR_RD(wr_pntr_rd),
        .dest_out_bin_ff_reg({\gntv_or_sync_fifo.gcx.clkx_n_15 ,\gntv_or_sync_fifo.gcx.clkx_n_47 ,\NLW_gntv_or_sync_fifo.gcx.clkx_dest_out_bin_ff_reg_UNCONNECTED [6:4],\gntv_or_sync_fifo.gcx.clkx_n_45 }),
        .\dest_out_bin_ff_reg[2] ({\gntv_or_sync_fifo.gcx.clkx_n_34 ,\gntv_or_sync_fifo.gcx.clkx_n_35 }),
        .\dest_out_bin_ff_reg[3]_0 (\gntv_or_sync_fifo.gcx.clkx_n_46 ),
        .\dest_out_bin_ff_reg[3]_1 (\gntv_or_sync_fifo.gcx.clkx_n_51 ),
        .\dest_out_bin_ff_reg[3]_2 (\gntv_or_sync_fifo.gcx.clkx_n_52 ),
        .\dest_out_bin_ff_reg[3]_3 (\gntv_or_sync_fifo.gcx.clkx_n_53 ),
        .\dest_out_bin_ff_reg[6] ({\gntv_or_sync_fifo.gcx.clkx_n_11 ,\gntv_or_sync_fifo.gcx.clkx_n_12 ,\gntv_or_sync_fifo.gcx.clkx_n_13 ,\gntv_or_sync_fifo.gcx.clkx_n_14 }),
        .\dest_out_bin_ff_reg[6]_0 ({\gntv_or_sync_fifo.gcx.clkx_n_36 ,\gntv_or_sync_fifo.gcx.clkx_n_37 ,\gntv_or_sync_fifo.gcx.clkx_n_38 ,\gntv_or_sync_fifo.gcx.clkx_n_39 }),
        .\dest_out_bin_ff_reg[7]_0 (\gntv_or_sync_fifo.gcx.clkx_n_48 ),
        .\dest_out_bin_ff_reg[7]_1 (\gntv_or_sync_fifo.gcx.clkx_n_49 ),
        .\dest_out_bin_ff_reg[7]_2 (\gntv_or_sync_fifo.gcx.clkx_n_50 ),
        .\gdiff.diff_pntr_pad_reg[9] (wr_pntr_plus1),
        .\gmux.gm[3].gms.ms (wr_pntr_plus2),
        .\gmux.gm[4].gms.ms (rd_pntr_plus1),
        .m_aclk(m_aclk),
        .s_aclk(s_aclk),
        .\src_gray_ff_reg[8] (wr_pntr),
        .v1_reg(\gwas.wsts/c1/v1_reg ),
        .v1_reg_0(\gwas.wsts/c2/v1_reg ),
        .v1_reg_1(\gras.rsts/c0/v1_reg ),
        .v1_reg_2(\gras.rsts/c1/v1_reg ));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_rd_logic \gntv_or_sync_fifo.gl0.rd 
       (.DI({\gntv_or_sync_fifo.gcx.clkx_n_9 ,\gntv_or_sync_fifo.gcx.clkx_n_10 }),
        .E(dout_i),
        .ENB_I(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENB_I ),
        .ENB_dly_D(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENB_dly_D ),
        .O(diff_wr_rd),
        .Q(rd_pntr),
        .WR_PNTR_RD(wr_pntr_rd),
        .axis_prog_empty(axis_prog_empty),
        .axis_rd_data_count(axis_rd_data_count),
        .\g_rd.gvalid_low.rd_dc_i_reg ({\gntv_or_sync_fifo.gcx.clkx_n_47 ,\gntv_or_sync_fifo.gcx.clkx_n_48 ,\gntv_or_sync_fifo.gcx.clkx_n_49 ,\gntv_or_sync_fifo.gcx.clkx_n_50 ,\gntv_or_sync_fifo.gcx.clkx_n_51 ,\gntv_or_sync_fifo.gcx.clkx_n_52 ,\gntv_or_sync_fifo.gcx.clkx_n_53 ,\gntv_or_sync_fifo.gcx.clkx_n_46 ,\gntv_or_sync_fifo.gcx.clkx_n_45 }),
        .\gc0.count_d1_reg (rstblk_n_1),
        .\gc0.count_reg[8] (rd_pntr_plus1),
        .\gdiff.diff_pntr_pad_reg[8] ({\gntv_or_sync_fifo.gcx.clkx_n_11 ,\gntv_or_sync_fifo.gcx.clkx_n_12 ,\gntv_or_sync_fifo.gcx.clkx_n_13 ,\gntv_or_sync_fifo.gcx.clkx_n_14 }),
        .m_aclk(m_aclk),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .ram_empty_fb_i_reg(\gntv_or_sync_fifo.gcx.clkx_n_15 ),
        .ram_empty_fb_i_reg_0(\gras.rsts/c1/v1_reg ),
        .v1_reg(\gras.rsts/c0/v1_reg ));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_wr_logic \gntv_or_sync_fifo.gl0.wr 
       (.E(ram_wr_en),
        .Q(wr_pntr),
        .RD_PNTR_WR(rd_pntr_wr),
        .S(\gntv_or_sync_fifo.gcx.clkx_n_16 ),
        .axis_prog_full(axis_prog_full),
        .axis_wr_data_count(axis_wr_data_count),
        .\gdiff.diff_pntr_pad_reg[4] ({\gntv_or_sync_fifo.gcx.clkx_n_34 ,\gntv_or_sync_fifo.gcx.clkx_n_35 }),
        .\gdiff.diff_pntr_pad_reg[8] ({\gntv_or_sync_fifo.gcx.clkx_n_36 ,\gntv_or_sync_fifo.gcx.clkx_n_37 ,\gntv_or_sync_fifo.gcx.clkx_n_38 ,\gntv_or_sync_fifo.gcx.clkx_n_39 }),
        .\gic0.gc0.count_d1_reg (rstblk_n_0),
        .\gic0.gc0.count_d1_reg[8] (wr_pntr_plus1),
        .\gic0.gc0.count_reg[7] (wr_pntr_plus2),
        .\gmux.gm[4].gms.ms (\gwas.wsts/c1/v1_reg ),
        .\gmux.gm[4].gms.ms_0 (\gwas.wsts/c2/v1_reg ),
        .out(full_fb_axis),
        .ram_full_fb_i_reg(rst_full_gen_i),
        .s_aclk(s_aclk),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_memory \gntv_or_sync_fifo.mem 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (wr_pntr),
        .E(ram_wr_en),
        .ENB_I(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENB_I ),
        .ENB_dly_D(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENB_dly_D ),
        .Q(rd_pntr),
        .\goreg_bm.dout_i_reg[33]_0 (Q),
        .\goreg_bm.dout_i_reg[33]_1 (dout_i),
        .m_aclk(m_aclk),
        .out(full_fb_axis),
        .s_aclk(s_aclk),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tuser(s_axis_tuser),
        .s_axis_tvalid(s_axis_tvalid));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_reset_blk_ramfifo rstblk
       (.m_aclk(m_aclk),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 (rstblk_n_1),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg_0 (rstblk_n_0),
        .out(rst_full_gen_i),
        .s_aclk(s_aclk),
        .s_aresetn(s_aresetn),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* ORIG_REF_NAME = "fifo_generator_top" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_fifo_generator_top
   (axis_prog_empty,
    axis_prog_full,
    m_aclk,
    m_axis_tready,
    m_axis_tvalid,
    s_aclk,
    s_aresetn,
    s_axis_tready,
    s_axis_tvalid,
    wr_rst_busy,
    Q,
    axis_rd_data_count,
    axis_wr_data_count,
    s_axis_tdata,
    s_axis_tuser);
  output axis_prog_empty;
  output axis_prog_full;
  input m_aclk;
  input m_axis_tready;
  output m_axis_tvalid;
  input s_aclk;
  input s_aresetn;
  output s_axis_tready;
  input s_axis_tvalid;
  output wr_rst_busy;
  output [33:0]Q;
  output [9:0]axis_rd_data_count;
  output [9:0]axis_wr_data_count;
  input [31:0]s_axis_tdata;
  input [1:0]s_axis_tuser;

  wire [33:0]Q;
  wire axis_prog_empty;
  wire axis_prog_full;
  wire [9:0]axis_rd_data_count;
  wire [9:0]axis_wr_data_count;
  wire m_aclk;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire s_aclk;
  wire s_aresetn;
  wire [31:0]s_axis_tdata;
  wire s_axis_tready;
  wire [1:0]s_axis_tuser;
  wire s_axis_tvalid;
  wire wr_rst_busy;

  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_fifo_generator_ramfifo \grf.rf 
       (.Q(Q),
        .axis_prog_empty(axis_prog_empty),
        .axis_prog_full(axis_prog_full),
        .axis_rd_data_count(axis_rd_data_count),
        .axis_wr_data_count(axis_wr_data_count),
        .m_aclk(m_aclk),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .s_aclk(s_aclk),
        .s_aresetn(s_aresetn),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tready(s_axis_tready),
        .s_axis_tuser(s_axis_tuser),
        .s_axis_tvalid(s_axis_tvalid),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* C_ADD_NGC_CONSTRAINT = "0" *) (* C_APPLICATION_TYPE_AXIS = "0" *) (* C_APPLICATION_TYPE_RACH = "0" *) 
(* C_APPLICATION_TYPE_RDCH = "0" *) (* C_APPLICATION_TYPE_WACH = "0" *) (* C_APPLICATION_TYPE_WDCH = "0" *) 
(* C_APPLICATION_TYPE_WRCH = "0" *) (* C_AXIS_TDATA_WIDTH = "32" *) (* C_AXIS_TDEST_WIDTH = "1" *) 
(* C_AXIS_TID_WIDTH = "1" *) (* C_AXIS_TKEEP_WIDTH = "4" *) (* C_AXIS_TSTRB_WIDTH = "4" *) 
(* C_AXIS_TUSER_WIDTH = "2" *) (* C_AXIS_TYPE = "0" *) (* C_AXI_ADDR_WIDTH = "32" *) 
(* C_AXI_ARUSER_WIDTH = "1" *) (* C_AXI_AWUSER_WIDTH = "1" *) (* C_AXI_BUSER_WIDTH = "1" *) 
(* C_AXI_DATA_WIDTH = "64" *) (* C_AXI_ID_WIDTH = "1" *) (* C_AXI_LEN_WIDTH = "8" *) 
(* C_AXI_LOCK_WIDTH = "1" *) (* C_AXI_RUSER_WIDTH = "1" *) (* C_AXI_TYPE = "1" *) 
(* C_AXI_WUSER_WIDTH = "1" *) (* C_COMMON_CLOCK = "0" *) (* C_COUNT_TYPE = "0" *) 
(* C_DATA_COUNT_WIDTH = "10" *) (* C_DEFAULT_VALUE = "BlankString" *) (* C_DIN_WIDTH = "18" *) 
(* C_DIN_WIDTH_AXIS = "34" *) (* C_DIN_WIDTH_RACH = "32" *) (* C_DIN_WIDTH_RDCH = "64" *) 
(* C_DIN_WIDTH_WACH = "32" *) (* C_DIN_WIDTH_WDCH = "64" *) (* C_DIN_WIDTH_WRCH = "2" *) 
(* C_DOUT_RST_VAL = "0" *) (* C_DOUT_WIDTH = "18" *) (* C_ENABLE_RLOCS = "0" *) 
(* C_ENABLE_RST_SYNC = "1" *) (* C_EN_SAFETY_CKT = "0" *) (* C_ERROR_INJECTION_TYPE = "0" *) 
(* C_ERROR_INJECTION_TYPE_AXIS = "0" *) (* C_ERROR_INJECTION_TYPE_RACH = "0" *) (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
(* C_ERROR_INJECTION_TYPE_WACH = "0" *) (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
(* C_FAMILY = "zynq" *) (* C_FULL_FLAGS_RST_VAL = "1" *) (* C_HAS_ALMOST_EMPTY = "0" *) 
(* C_HAS_ALMOST_FULL = "0" *) (* C_HAS_AXIS_TDATA = "1" *) (* C_HAS_AXIS_TDEST = "0" *) 
(* C_HAS_AXIS_TID = "0" *) (* C_HAS_AXIS_TKEEP = "0" *) (* C_HAS_AXIS_TLAST = "0" *) 
(* C_HAS_AXIS_TREADY = "1" *) (* C_HAS_AXIS_TSTRB = "0" *) (* C_HAS_AXIS_TUSER = "1" *) 
(* C_HAS_AXI_ARUSER = "0" *) (* C_HAS_AXI_AWUSER = "0" *) (* C_HAS_AXI_BUSER = "0" *) 
(* C_HAS_AXI_ID = "0" *) (* C_HAS_AXI_RD_CHANNEL = "1" *) (* C_HAS_AXI_RUSER = "0" *) 
(* C_HAS_AXI_WR_CHANNEL = "1" *) (* C_HAS_AXI_WUSER = "0" *) (* C_HAS_BACKUP = "0" *) 
(* C_HAS_DATA_COUNT = "0" *) (* C_HAS_DATA_COUNTS_AXIS = "1" *) (* C_HAS_DATA_COUNTS_RACH = "0" *) 
(* C_HAS_DATA_COUNTS_RDCH = "0" *) (* C_HAS_DATA_COUNTS_WACH = "0" *) (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
(* C_HAS_DATA_COUNTS_WRCH = "0" *) (* C_HAS_INT_CLK = "0" *) (* C_HAS_MASTER_CE = "0" *) 
(* C_HAS_MEMINIT_FILE = "0" *) (* C_HAS_OVERFLOW = "0" *) (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
(* C_HAS_PROG_FLAGS_RACH = "0" *) (* C_HAS_PROG_FLAGS_RDCH = "0" *) (* C_HAS_PROG_FLAGS_WACH = "0" *) 
(* C_HAS_PROG_FLAGS_WDCH = "0" *) (* C_HAS_PROG_FLAGS_WRCH = "0" *) (* C_HAS_RD_DATA_COUNT = "0" *) 
(* C_HAS_RD_RST = "0" *) (* C_HAS_RST = "1" *) (* C_HAS_SLAVE_CE = "0" *) 
(* C_HAS_SRST = "0" *) (* C_HAS_UNDERFLOW = "0" *) (* C_HAS_VALID = "0" *) 
(* C_HAS_WR_ACK = "0" *) (* C_HAS_WR_DATA_COUNT = "0" *) (* C_HAS_WR_RST = "0" *) 
(* C_IMPLEMENTATION_TYPE = "0" *) (* C_IMPLEMENTATION_TYPE_AXIS = "11" *) (* C_IMPLEMENTATION_TYPE_RACH = "12" *) 
(* C_IMPLEMENTATION_TYPE_RDCH = "11" *) (* C_IMPLEMENTATION_TYPE_WACH = "12" *) (* C_IMPLEMENTATION_TYPE_WDCH = "11" *) 
(* C_IMPLEMENTATION_TYPE_WRCH = "12" *) (* C_INIT_WR_PNTR_VAL = "0" *) (* C_INTERFACE_TYPE = "1" *) 
(* C_MEMORY_TYPE = "1" *) (* C_MIF_FILE_NAME = "BlankString" *) (* C_MSGON_VAL = "1" *) 
(* C_OPTIMIZATION_MODE = "0" *) (* C_OVERFLOW_LOW = "0" *) (* C_POWER_SAVING_MODE = "0" *) 
(* C_PRELOAD_LATENCY = "1" *) (* C_PRELOAD_REGS = "0" *) (* C_PRIM_FIFO_TYPE = "4kx4" *) 
(* C_PRIM_FIFO_TYPE_AXIS = "512x36" *) (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
(* C_PRIM_FIFO_TYPE_WACH = "512x36" *) (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL = "2" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "4" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "13" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1021" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "13" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1021" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "13" *) (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "3" *) (* C_PROG_EMPTY_TYPE = "0" *) 
(* C_PROG_EMPTY_TYPE_AXIS = "1" *) (* C_PROG_EMPTY_TYPE_RACH = "0" *) (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
(* C_PROG_EMPTY_TYPE_WACH = "0" *) (* C_PROG_EMPTY_TYPE_WDCH = "0" *) (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL = "1022" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "508" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "15" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "15" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "15" *) (* C_PROG_FULL_THRESH_NEGATE_VAL = "1021" *) (* C_PROG_FULL_TYPE = "0" *) 
(* C_PROG_FULL_TYPE_AXIS = "1" *) (* C_PROG_FULL_TYPE_RACH = "0" *) (* C_PROG_FULL_TYPE_RDCH = "0" *) 
(* C_PROG_FULL_TYPE_WACH = "0" *) (* C_PROG_FULL_TYPE_WDCH = "0" *) (* C_PROG_FULL_TYPE_WRCH = "0" *) 
(* C_RACH_TYPE = "0" *) (* C_RDCH_TYPE = "0" *) (* C_RD_DATA_COUNT_WIDTH = "10" *) 
(* C_RD_DEPTH = "1024" *) (* C_RD_FREQ = "1" *) (* C_RD_PNTR_WIDTH = "10" *) 
(* C_REG_SLICE_MODE_AXIS = "0" *) (* C_REG_SLICE_MODE_RACH = "0" *) (* C_REG_SLICE_MODE_RDCH = "0" *) 
(* C_REG_SLICE_MODE_WACH = "0" *) (* C_REG_SLICE_MODE_WDCH = "0" *) (* C_REG_SLICE_MODE_WRCH = "0" *) 
(* C_SELECT_XPM = "0" *) (* C_SYNCHRONIZER_STAGE = "2" *) (* C_UNDERFLOW_LOW = "0" *) 
(* C_USE_COMMON_OVERFLOW = "0" *) (* C_USE_COMMON_UNDERFLOW = "0" *) (* C_USE_DEFAULT_SETTINGS = "0" *) 
(* C_USE_DOUT_RST = "1" *) (* C_USE_ECC = "0" *) (* C_USE_ECC_AXIS = "0" *) 
(* C_USE_ECC_RACH = "0" *) (* C_USE_ECC_RDCH = "0" *) (* C_USE_ECC_WACH = "0" *) 
(* C_USE_ECC_WDCH = "0" *) (* C_USE_ECC_WRCH = "0" *) (* C_USE_EMBEDDED_REG = "0" *) 
(* C_USE_FIFO16_FLAGS = "0" *) (* C_USE_FWFT_DATA_COUNT = "0" *) (* C_USE_PIPELINE_REG = "0" *) 
(* C_VALID_LOW = "0" *) (* C_WACH_TYPE = "0" *) (* C_WDCH_TYPE = "0" *) 
(* C_WRCH_TYPE = "0" *) (* C_WR_ACK_LOW = "0" *) (* C_WR_DATA_COUNT_WIDTH = "10" *) 
(* C_WR_DEPTH = "1024" *) (* C_WR_DEPTH_AXIS = "512" *) (* C_WR_DEPTH_RACH = "16" *) 
(* C_WR_DEPTH_RDCH = "1024" *) (* C_WR_DEPTH_WACH = "16" *) (* C_WR_DEPTH_WDCH = "1024" *) 
(* C_WR_DEPTH_WRCH = "16" *) (* C_WR_FREQ = "1" *) (* C_WR_PNTR_WIDTH = "10" *) 
(* C_WR_PNTR_WIDTH_AXIS = "9" *) (* C_WR_PNTR_WIDTH_RACH = "4" *) (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
(* C_WR_PNTR_WIDTH_WACH = "4" *) (* C_WR_PNTR_WIDTH_WDCH = "10" *) (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
(* C_WR_RESPONSE_LATENCY = "1" *) (* ORIG_REF_NAME = "fifo_generator_v13_2_5" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_fifo_generator_v13_2_5
   (almost_empty,
    almost_full,
    axi_ar_dbiterr,
    axi_ar_injectdbiterr,
    axi_ar_injectsbiterr,
    axi_ar_overflow,
    axi_ar_prog_empty,
    axi_ar_prog_full,
    axi_ar_sbiterr,
    axi_ar_underflow,
    axi_aw_dbiterr,
    axi_aw_injectdbiterr,
    axi_aw_injectsbiterr,
    axi_aw_overflow,
    axi_aw_prog_empty,
    axi_aw_prog_full,
    axi_aw_sbiterr,
    axi_aw_underflow,
    axi_b_dbiterr,
    axi_b_injectdbiterr,
    axi_b_injectsbiterr,
    axi_b_overflow,
    axi_b_prog_empty,
    axi_b_prog_full,
    axi_b_sbiterr,
    axi_b_underflow,
    axi_r_dbiterr,
    axi_r_injectdbiterr,
    axi_r_injectsbiterr,
    axi_r_overflow,
    axi_r_prog_empty,
    axi_r_prog_full,
    axi_r_sbiterr,
    axi_r_underflow,
    axi_w_dbiterr,
    axi_w_injectdbiterr,
    axi_w_injectsbiterr,
    axi_w_overflow,
    axi_w_prog_empty,
    axi_w_prog_full,
    axi_w_sbiterr,
    axi_w_underflow,
    axis_dbiterr,
    axis_injectdbiterr,
    axis_injectsbiterr,
    axis_overflow,
    axis_prog_empty,
    axis_prog_full,
    axis_sbiterr,
    axis_underflow,
    backup,
    backup_marker,
    clk,
    dbiterr,
    empty,
    full,
    injectdbiterr,
    injectsbiterr,
    int_clk,
    m_aclk,
    m_aclk_en,
    m_axi_arready,
    m_axi_arvalid,
    m_axi_awready,
    m_axi_awvalid,
    m_axi_bready,
    m_axi_bvalid,
    m_axi_rlast,
    m_axi_rready,
    m_axi_rvalid,
    m_axi_wlast,
    m_axi_wready,
    m_axi_wvalid,
    m_axis_tlast,
    m_axis_tready,
    m_axis_tvalid,
    overflow,
    prog_empty,
    prog_full,
    rd_clk,
    rd_en,
    rd_rst,
    rd_rst_busy,
    rst,
    s_aclk,
    s_aclk_en,
    s_aresetn,
    s_axi_arready,
    s_axi_arvalid,
    s_axi_awready,
    s_axi_awvalid,
    s_axi_bready,
    s_axi_bvalid,
    s_axi_rlast,
    s_axi_rready,
    s_axi_rvalid,
    s_axi_wlast,
    s_axi_wready,
    s_axi_wvalid,
    s_axis_tlast,
    s_axis_tready,
    s_axis_tvalid,
    sbiterr,
    sleep,
    srst,
    underflow,
    valid,
    wr_ack,
    wr_clk,
    wr_en,
    wr_rst,
    wr_rst_busy,
    axi_ar_data_count,
    axi_ar_prog_empty_thresh,
    axi_ar_prog_full_thresh,
    axi_ar_rd_data_count,
    axi_ar_wr_data_count,
    axi_aw_data_count,
    axi_aw_prog_empty_thresh,
    axi_aw_prog_full_thresh,
    axi_aw_rd_data_count,
    axi_aw_wr_data_count,
    axi_b_data_count,
    axi_b_prog_empty_thresh,
    axi_b_prog_full_thresh,
    axi_b_rd_data_count,
    axi_b_wr_data_count,
    axi_r_data_count,
    axi_r_prog_empty_thresh,
    axi_r_prog_full_thresh,
    axi_r_rd_data_count,
    axi_r_wr_data_count,
    axi_w_data_count,
    axi_w_prog_empty_thresh,
    axi_w_prog_full_thresh,
    axi_w_rd_data_count,
    axi_w_wr_data_count,
    axis_data_count,
    axis_prog_empty_thresh,
    axis_prog_full_thresh,
    axis_rd_data_count,
    axis_wr_data_count,
    data_count,
    din,
    dout,
    m_axi_araddr,
    m_axi_arburst,
    m_axi_arcache,
    m_axi_arid,
    m_axi_arlen,
    m_axi_arlock,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arregion,
    m_axi_arsize,
    m_axi_aruser,
    m_axi_awaddr,
    m_axi_awburst,
    m_axi_awcache,
    m_axi_awid,
    m_axi_awlen,
    m_axi_awlock,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awregion,
    m_axi_awsize,
    m_axi_awuser,
    m_axi_bid,
    m_axi_bresp,
    m_axi_buser,
    m_axi_rdata,
    m_axi_rid,
    m_axi_rresp,
    m_axi_ruser,
    m_axi_wdata,
    m_axi_wid,
    m_axi_wstrb,
    m_axi_wuser,
    m_axis_tdata,
    m_axis_tdest,
    m_axis_tid,
    m_axis_tkeep,
    m_axis_tstrb,
    m_axis_tuser,
    prog_empty_thresh,
    prog_empty_thresh_assert,
    prog_empty_thresh_negate,
    prog_full_thresh,
    prog_full_thresh_assert,
    prog_full_thresh_negate,
    rd_data_count,
    s_axi_araddr,
    s_axi_arburst,
    s_axi_arcache,
    s_axi_arid,
    s_axi_arlen,
    s_axi_arlock,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arregion,
    s_axi_arsize,
    s_axi_aruser,
    s_axi_awaddr,
    s_axi_awburst,
    s_axi_awcache,
    s_axi_awid,
    s_axi_awlen,
    s_axi_awlock,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awregion,
    s_axi_awsize,
    s_axi_awuser,
    s_axi_bid,
    s_axi_bresp,
    s_axi_buser,
    s_axi_rdata,
    s_axi_rid,
    s_axi_rresp,
    s_axi_ruser,
    s_axi_wdata,
    s_axi_wid,
    s_axi_wstrb,
    s_axi_wuser,
    s_axis_tdata,
    s_axis_tdest,
    s_axis_tid,
    s_axis_tkeep,
    s_axis_tstrb,
    s_axis_tuser,
    wr_data_count);
  output almost_empty;
  output almost_full;
  output axi_ar_dbiterr;
  input axi_ar_injectdbiterr;
  input axi_ar_injectsbiterr;
  output axi_ar_overflow;
  output axi_ar_prog_empty;
  output axi_ar_prog_full;
  output axi_ar_sbiterr;
  output axi_ar_underflow;
  output axi_aw_dbiterr;
  input axi_aw_injectdbiterr;
  input axi_aw_injectsbiterr;
  output axi_aw_overflow;
  output axi_aw_prog_empty;
  output axi_aw_prog_full;
  output axi_aw_sbiterr;
  output axi_aw_underflow;
  output axi_b_dbiterr;
  input axi_b_injectdbiterr;
  input axi_b_injectsbiterr;
  output axi_b_overflow;
  output axi_b_prog_empty;
  output axi_b_prog_full;
  output axi_b_sbiterr;
  output axi_b_underflow;
  output axi_r_dbiterr;
  input axi_r_injectdbiterr;
  input axi_r_injectsbiterr;
  output axi_r_overflow;
  output axi_r_prog_empty;
  output axi_r_prog_full;
  output axi_r_sbiterr;
  output axi_r_underflow;
  output axi_w_dbiterr;
  input axi_w_injectdbiterr;
  input axi_w_injectsbiterr;
  output axi_w_overflow;
  output axi_w_prog_empty;
  output axi_w_prog_full;
  output axi_w_sbiterr;
  output axi_w_underflow;
  output axis_dbiterr;
  input axis_injectdbiterr;
  input axis_injectsbiterr;
  output axis_overflow;
  output axis_prog_empty;
  output axis_prog_full;
  output axis_sbiterr;
  output axis_underflow;
  input backup;
  input backup_marker;
  input clk;
  output dbiterr;
  output empty;
  output full;
  input injectdbiterr;
  input injectsbiterr;
  input int_clk;
  input m_aclk;
  input m_aclk_en;
  input m_axi_arready;
  output m_axi_arvalid;
  input m_axi_awready;
  output m_axi_awvalid;
  output m_axi_bready;
  input m_axi_bvalid;
  input m_axi_rlast;
  output m_axi_rready;
  input m_axi_rvalid;
  output m_axi_wlast;
  input m_axi_wready;
  output m_axi_wvalid;
  output m_axis_tlast;
  input m_axis_tready;
  output m_axis_tvalid;
  output overflow;
  output prog_empty;
  output prog_full;
  input rd_clk;
  input rd_en;
  input rd_rst;
  output rd_rst_busy;
  input rst;
  input s_aclk;
  input s_aclk_en;
  input s_aresetn;
  output s_axi_arready;
  input s_axi_arvalid;
  output s_axi_awready;
  input s_axi_awvalid;
  input s_axi_bready;
  output s_axi_bvalid;
  output s_axi_rlast;
  input s_axi_rready;
  output s_axi_rvalid;
  input s_axi_wlast;
  output s_axi_wready;
  input s_axi_wvalid;
  input s_axis_tlast;
  output s_axis_tready;
  input s_axis_tvalid;
  output sbiterr;
  input sleep;
  input srst;
  output underflow;
  output valid;
  output wr_ack;
  input wr_clk;
  input wr_en;
  input wr_rst;
  output wr_rst_busy;
  output [4:0]axi_ar_data_count;
  input [3:0]axi_ar_prog_empty_thresh;
  input [3:0]axi_ar_prog_full_thresh;
  output [4:0]axi_ar_rd_data_count;
  output [4:0]axi_ar_wr_data_count;
  output [4:0]axi_aw_data_count;
  input [3:0]axi_aw_prog_empty_thresh;
  input [3:0]axi_aw_prog_full_thresh;
  output [4:0]axi_aw_rd_data_count;
  output [4:0]axi_aw_wr_data_count;
  output [4:0]axi_b_data_count;
  input [3:0]axi_b_prog_empty_thresh;
  input [3:0]axi_b_prog_full_thresh;
  output [4:0]axi_b_rd_data_count;
  output [4:0]axi_b_wr_data_count;
  output [10:0]axi_r_data_count;
  input [9:0]axi_r_prog_empty_thresh;
  input [9:0]axi_r_prog_full_thresh;
  output [10:0]axi_r_rd_data_count;
  output [10:0]axi_r_wr_data_count;
  output [10:0]axi_w_data_count;
  input [9:0]axi_w_prog_empty_thresh;
  input [9:0]axi_w_prog_full_thresh;
  output [10:0]axi_w_rd_data_count;
  output [10:0]axi_w_wr_data_count;
  output [9:0]axis_data_count;
  input [8:0]axis_prog_empty_thresh;
  input [8:0]axis_prog_full_thresh;
  output [9:0]axis_rd_data_count;
  output [9:0]axis_wr_data_count;
  output [9:0]data_count;
  input [17:0]din;
  output [17:0]dout;
  output [31:0]m_axi_araddr;
  output [1:0]m_axi_arburst;
  output [3:0]m_axi_arcache;
  output [0:0]m_axi_arid;
  output [7:0]m_axi_arlen;
  output [0:0]m_axi_arlock;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  output [3:0]m_axi_arregion;
  output [2:0]m_axi_arsize;
  output [0:0]m_axi_aruser;
  output [31:0]m_axi_awaddr;
  output [1:0]m_axi_awburst;
  output [3:0]m_axi_awcache;
  output [0:0]m_axi_awid;
  output [7:0]m_axi_awlen;
  output [0:0]m_axi_awlock;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  output [3:0]m_axi_awregion;
  output [2:0]m_axi_awsize;
  output [0:0]m_axi_awuser;
  input [0:0]m_axi_bid;
  input [1:0]m_axi_bresp;
  input [0:0]m_axi_buser;
  input [63:0]m_axi_rdata;
  input [0:0]m_axi_rid;
  input [1:0]m_axi_rresp;
  input [0:0]m_axi_ruser;
  output [63:0]m_axi_wdata;
  output [0:0]m_axi_wid;
  output [7:0]m_axi_wstrb;
  output [0:0]m_axi_wuser;
  output [31:0]m_axis_tdata;
  output [0:0]m_axis_tdest;
  output [0:0]m_axis_tid;
  output [3:0]m_axis_tkeep;
  output [3:0]m_axis_tstrb;
  output [1:0]m_axis_tuser;
  input [9:0]prog_empty_thresh;
  input [9:0]prog_empty_thresh_assert;
  input [9:0]prog_empty_thresh_negate;
  input [9:0]prog_full_thresh;
  input [9:0]prog_full_thresh_assert;
  input [9:0]prog_full_thresh_negate;
  output [9:0]rd_data_count;
  input [31:0]s_axi_araddr;
  input [1:0]s_axi_arburst;
  input [3:0]s_axi_arcache;
  input [0:0]s_axi_arid;
  input [7:0]s_axi_arlen;
  input [0:0]s_axi_arlock;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  input [3:0]s_axi_arregion;
  input [2:0]s_axi_arsize;
  input [0:0]s_axi_aruser;
  input [31:0]s_axi_awaddr;
  input [1:0]s_axi_awburst;
  input [3:0]s_axi_awcache;
  input [0:0]s_axi_awid;
  input [7:0]s_axi_awlen;
  input [0:0]s_axi_awlock;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  input [3:0]s_axi_awregion;
  input [2:0]s_axi_awsize;
  input [0:0]s_axi_awuser;
  output [0:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output [0:0]s_axi_buser;
  output [63:0]s_axi_rdata;
  output [0:0]s_axi_rid;
  output [1:0]s_axi_rresp;
  output [0:0]s_axi_ruser;
  input [63:0]s_axi_wdata;
  input [0:0]s_axi_wid;
  input [7:0]s_axi_wstrb;
  input [0:0]s_axi_wuser;
  input [31:0]s_axis_tdata;
  input [0:0]s_axis_tdest;
  input [0:0]s_axis_tid;
  input [3:0]s_axis_tkeep;
  input [3:0]s_axis_tstrb;
  input [1:0]s_axis_tuser;
  output [9:0]wr_data_count;

  wire \<const0> ;
  wire \<const1> ;
  wire axis_prog_empty;
  wire axis_prog_full;
  wire [9:0]axis_rd_data_count;
  wire [9:0]axis_wr_data_count;
  wire m_aclk;
  wire [31:0]m_axis_tdata;
  wire m_axis_tready;
  wire [1:0]m_axis_tuser;
  wire m_axis_tvalid;
  wire s_aclk;
  wire s_aresetn;
  wire [31:0]s_axis_tdata;
  wire s_axis_tready;
  wire [1:0]s_axis_tuser;
  wire s_axis_tvalid;
  wire wr_rst_busy;

  assign almost_empty = \<const1> ;
  assign almost_full = \<const0> ;
  assign axi_ar_data_count[4] = \<const0> ;
  assign axi_ar_data_count[3] = \<const0> ;
  assign axi_ar_data_count[2] = \<const0> ;
  assign axi_ar_data_count[1] = \<const0> ;
  assign axi_ar_data_count[0] = \<const0> ;
  assign axi_ar_dbiterr = \<const0> ;
  assign axi_ar_overflow = \<const0> ;
  assign axi_ar_prog_empty = \<const1> ;
  assign axi_ar_prog_full = \<const0> ;
  assign axi_ar_rd_data_count[4] = \<const0> ;
  assign axi_ar_rd_data_count[3] = \<const0> ;
  assign axi_ar_rd_data_count[2] = \<const0> ;
  assign axi_ar_rd_data_count[1] = \<const0> ;
  assign axi_ar_rd_data_count[0] = \<const0> ;
  assign axi_ar_sbiterr = \<const0> ;
  assign axi_ar_underflow = \<const0> ;
  assign axi_ar_wr_data_count[4] = \<const0> ;
  assign axi_ar_wr_data_count[3] = \<const0> ;
  assign axi_ar_wr_data_count[2] = \<const0> ;
  assign axi_ar_wr_data_count[1] = \<const0> ;
  assign axi_ar_wr_data_count[0] = \<const0> ;
  assign axi_aw_data_count[4] = \<const0> ;
  assign axi_aw_data_count[3] = \<const0> ;
  assign axi_aw_data_count[2] = \<const0> ;
  assign axi_aw_data_count[1] = \<const0> ;
  assign axi_aw_data_count[0] = \<const0> ;
  assign axi_aw_dbiterr = \<const0> ;
  assign axi_aw_overflow = \<const0> ;
  assign axi_aw_prog_empty = \<const1> ;
  assign axi_aw_prog_full = \<const0> ;
  assign axi_aw_rd_data_count[4] = \<const0> ;
  assign axi_aw_rd_data_count[3] = \<const0> ;
  assign axi_aw_rd_data_count[2] = \<const0> ;
  assign axi_aw_rd_data_count[1] = \<const0> ;
  assign axi_aw_rd_data_count[0] = \<const0> ;
  assign axi_aw_sbiterr = \<const0> ;
  assign axi_aw_underflow = \<const0> ;
  assign axi_aw_wr_data_count[4] = \<const0> ;
  assign axi_aw_wr_data_count[3] = \<const0> ;
  assign axi_aw_wr_data_count[2] = \<const0> ;
  assign axi_aw_wr_data_count[1] = \<const0> ;
  assign axi_aw_wr_data_count[0] = \<const0> ;
  assign axi_b_data_count[4] = \<const0> ;
  assign axi_b_data_count[3] = \<const0> ;
  assign axi_b_data_count[2] = \<const0> ;
  assign axi_b_data_count[1] = \<const0> ;
  assign axi_b_data_count[0] = \<const0> ;
  assign axi_b_dbiterr = \<const0> ;
  assign axi_b_overflow = \<const0> ;
  assign axi_b_prog_empty = \<const1> ;
  assign axi_b_prog_full = \<const0> ;
  assign axi_b_rd_data_count[4] = \<const0> ;
  assign axi_b_rd_data_count[3] = \<const0> ;
  assign axi_b_rd_data_count[2] = \<const0> ;
  assign axi_b_rd_data_count[1] = \<const0> ;
  assign axi_b_rd_data_count[0] = \<const0> ;
  assign axi_b_sbiterr = \<const0> ;
  assign axi_b_underflow = \<const0> ;
  assign axi_b_wr_data_count[4] = \<const0> ;
  assign axi_b_wr_data_count[3] = \<const0> ;
  assign axi_b_wr_data_count[2] = \<const0> ;
  assign axi_b_wr_data_count[1] = \<const0> ;
  assign axi_b_wr_data_count[0] = \<const0> ;
  assign axi_r_data_count[10] = \<const0> ;
  assign axi_r_data_count[9] = \<const0> ;
  assign axi_r_data_count[8] = \<const0> ;
  assign axi_r_data_count[7] = \<const0> ;
  assign axi_r_data_count[6] = \<const0> ;
  assign axi_r_data_count[5] = \<const0> ;
  assign axi_r_data_count[4] = \<const0> ;
  assign axi_r_data_count[3] = \<const0> ;
  assign axi_r_data_count[2] = \<const0> ;
  assign axi_r_data_count[1] = \<const0> ;
  assign axi_r_data_count[0] = \<const0> ;
  assign axi_r_dbiterr = \<const0> ;
  assign axi_r_overflow = \<const0> ;
  assign axi_r_prog_empty = \<const1> ;
  assign axi_r_prog_full = \<const0> ;
  assign axi_r_rd_data_count[10] = \<const0> ;
  assign axi_r_rd_data_count[9] = \<const0> ;
  assign axi_r_rd_data_count[8] = \<const0> ;
  assign axi_r_rd_data_count[7] = \<const0> ;
  assign axi_r_rd_data_count[6] = \<const0> ;
  assign axi_r_rd_data_count[5] = \<const0> ;
  assign axi_r_rd_data_count[4] = \<const0> ;
  assign axi_r_rd_data_count[3] = \<const0> ;
  assign axi_r_rd_data_count[2] = \<const0> ;
  assign axi_r_rd_data_count[1] = \<const0> ;
  assign axi_r_rd_data_count[0] = \<const0> ;
  assign axi_r_sbiterr = \<const0> ;
  assign axi_r_underflow = \<const0> ;
  assign axi_r_wr_data_count[10] = \<const0> ;
  assign axi_r_wr_data_count[9] = \<const0> ;
  assign axi_r_wr_data_count[8] = \<const0> ;
  assign axi_r_wr_data_count[7] = \<const0> ;
  assign axi_r_wr_data_count[6] = \<const0> ;
  assign axi_r_wr_data_count[5] = \<const0> ;
  assign axi_r_wr_data_count[4] = \<const0> ;
  assign axi_r_wr_data_count[3] = \<const0> ;
  assign axi_r_wr_data_count[2] = \<const0> ;
  assign axi_r_wr_data_count[1] = \<const0> ;
  assign axi_r_wr_data_count[0] = \<const0> ;
  assign axi_w_data_count[10] = \<const0> ;
  assign axi_w_data_count[9] = \<const0> ;
  assign axi_w_data_count[8] = \<const0> ;
  assign axi_w_data_count[7] = \<const0> ;
  assign axi_w_data_count[6] = \<const0> ;
  assign axi_w_data_count[5] = \<const0> ;
  assign axi_w_data_count[4] = \<const0> ;
  assign axi_w_data_count[3] = \<const0> ;
  assign axi_w_data_count[2] = \<const0> ;
  assign axi_w_data_count[1] = \<const0> ;
  assign axi_w_data_count[0] = \<const0> ;
  assign axi_w_dbiterr = \<const0> ;
  assign axi_w_overflow = \<const0> ;
  assign axi_w_prog_empty = \<const1> ;
  assign axi_w_prog_full = \<const0> ;
  assign axi_w_rd_data_count[10] = \<const0> ;
  assign axi_w_rd_data_count[9] = \<const0> ;
  assign axi_w_rd_data_count[8] = \<const0> ;
  assign axi_w_rd_data_count[7] = \<const0> ;
  assign axi_w_rd_data_count[6] = \<const0> ;
  assign axi_w_rd_data_count[5] = \<const0> ;
  assign axi_w_rd_data_count[4] = \<const0> ;
  assign axi_w_rd_data_count[3] = \<const0> ;
  assign axi_w_rd_data_count[2] = \<const0> ;
  assign axi_w_rd_data_count[1] = \<const0> ;
  assign axi_w_rd_data_count[0] = \<const0> ;
  assign axi_w_sbiterr = \<const0> ;
  assign axi_w_underflow = \<const0> ;
  assign axi_w_wr_data_count[10] = \<const0> ;
  assign axi_w_wr_data_count[9] = \<const0> ;
  assign axi_w_wr_data_count[8] = \<const0> ;
  assign axi_w_wr_data_count[7] = \<const0> ;
  assign axi_w_wr_data_count[6] = \<const0> ;
  assign axi_w_wr_data_count[5] = \<const0> ;
  assign axi_w_wr_data_count[4] = \<const0> ;
  assign axi_w_wr_data_count[3] = \<const0> ;
  assign axi_w_wr_data_count[2] = \<const0> ;
  assign axi_w_wr_data_count[1] = \<const0> ;
  assign axi_w_wr_data_count[0] = \<const0> ;
  assign axis_data_count[9] = \<const0> ;
  assign axis_data_count[8] = \<const0> ;
  assign axis_data_count[7] = \<const0> ;
  assign axis_data_count[6] = \<const0> ;
  assign axis_data_count[5] = \<const0> ;
  assign axis_data_count[4] = \<const0> ;
  assign axis_data_count[3] = \<const0> ;
  assign axis_data_count[2] = \<const0> ;
  assign axis_data_count[1] = \<const0> ;
  assign axis_data_count[0] = \<const0> ;
  assign axis_dbiterr = \<const0> ;
  assign axis_overflow = \<const0> ;
  assign axis_sbiterr = \<const0> ;
  assign axis_underflow = \<const0> ;
  assign data_count[9] = \<const0> ;
  assign data_count[8] = \<const0> ;
  assign data_count[7] = \<const0> ;
  assign data_count[6] = \<const0> ;
  assign data_count[5] = \<const0> ;
  assign data_count[4] = \<const0> ;
  assign data_count[3] = \<const0> ;
  assign data_count[2] = \<const0> ;
  assign data_count[1] = \<const0> ;
  assign data_count[0] = \<const0> ;
  assign dbiterr = \<const0> ;
  assign dout[17] = \<const0> ;
  assign dout[16] = \<const0> ;
  assign dout[15] = \<const0> ;
  assign dout[14] = \<const0> ;
  assign dout[13] = \<const0> ;
  assign dout[12] = \<const0> ;
  assign dout[11] = \<const0> ;
  assign dout[10] = \<const0> ;
  assign dout[9] = \<const0> ;
  assign dout[8] = \<const0> ;
  assign dout[7] = \<const0> ;
  assign dout[6] = \<const0> ;
  assign dout[5] = \<const0> ;
  assign dout[4] = \<const0> ;
  assign dout[3] = \<const0> ;
  assign dout[2] = \<const0> ;
  assign dout[1] = \<const0> ;
  assign dout[0] = \<const0> ;
  assign empty = \<const1> ;
  assign full = \<const0> ;
  assign m_axi_araddr[31] = \<const0> ;
  assign m_axi_araddr[30] = \<const0> ;
  assign m_axi_araddr[29] = \<const0> ;
  assign m_axi_araddr[28] = \<const0> ;
  assign m_axi_araddr[27] = \<const0> ;
  assign m_axi_araddr[26] = \<const0> ;
  assign m_axi_araddr[25] = \<const0> ;
  assign m_axi_araddr[24] = \<const0> ;
  assign m_axi_araddr[23] = \<const0> ;
  assign m_axi_araddr[22] = \<const0> ;
  assign m_axi_araddr[21] = \<const0> ;
  assign m_axi_araddr[20] = \<const0> ;
  assign m_axi_araddr[19] = \<const0> ;
  assign m_axi_araddr[18] = \<const0> ;
  assign m_axi_araddr[17] = \<const0> ;
  assign m_axi_araddr[16] = \<const0> ;
  assign m_axi_araddr[15] = \<const0> ;
  assign m_axi_araddr[14] = \<const0> ;
  assign m_axi_araddr[13] = \<const0> ;
  assign m_axi_araddr[12] = \<const0> ;
  assign m_axi_araddr[11] = \<const0> ;
  assign m_axi_araddr[10] = \<const0> ;
  assign m_axi_araddr[9] = \<const0> ;
  assign m_axi_araddr[8] = \<const0> ;
  assign m_axi_araddr[7] = \<const0> ;
  assign m_axi_araddr[6] = \<const0> ;
  assign m_axi_araddr[5] = \<const0> ;
  assign m_axi_araddr[4] = \<const0> ;
  assign m_axi_araddr[3] = \<const0> ;
  assign m_axi_araddr[2] = \<const0> ;
  assign m_axi_araddr[1] = \<const0> ;
  assign m_axi_araddr[0] = \<const0> ;
  assign m_axi_arburst[1] = \<const0> ;
  assign m_axi_arburst[0] = \<const0> ;
  assign m_axi_arcache[3] = \<const0> ;
  assign m_axi_arcache[2] = \<const0> ;
  assign m_axi_arcache[1] = \<const0> ;
  assign m_axi_arcache[0] = \<const0> ;
  assign m_axi_arid[0] = \<const0> ;
  assign m_axi_arlen[7] = \<const0> ;
  assign m_axi_arlen[6] = \<const0> ;
  assign m_axi_arlen[5] = \<const0> ;
  assign m_axi_arlen[4] = \<const0> ;
  assign m_axi_arlen[3] = \<const0> ;
  assign m_axi_arlen[2] = \<const0> ;
  assign m_axi_arlen[1] = \<const0> ;
  assign m_axi_arlen[0] = \<const0> ;
  assign m_axi_arlock[0] = \<const0> ;
  assign m_axi_arprot[2] = \<const0> ;
  assign m_axi_arprot[1] = \<const0> ;
  assign m_axi_arprot[0] = \<const0> ;
  assign m_axi_arqos[3] = \<const0> ;
  assign m_axi_arqos[2] = \<const0> ;
  assign m_axi_arqos[1] = \<const0> ;
  assign m_axi_arqos[0] = \<const0> ;
  assign m_axi_arregion[3] = \<const0> ;
  assign m_axi_arregion[2] = \<const0> ;
  assign m_axi_arregion[1] = \<const0> ;
  assign m_axi_arregion[0] = \<const0> ;
  assign m_axi_arsize[2] = \<const0> ;
  assign m_axi_arsize[1] = \<const0> ;
  assign m_axi_arsize[0] = \<const0> ;
  assign m_axi_aruser[0] = \<const0> ;
  assign m_axi_arvalid = \<const0> ;
  assign m_axi_awaddr[31] = \<const0> ;
  assign m_axi_awaddr[30] = \<const0> ;
  assign m_axi_awaddr[29] = \<const0> ;
  assign m_axi_awaddr[28] = \<const0> ;
  assign m_axi_awaddr[27] = \<const0> ;
  assign m_axi_awaddr[26] = \<const0> ;
  assign m_axi_awaddr[25] = \<const0> ;
  assign m_axi_awaddr[24] = \<const0> ;
  assign m_axi_awaddr[23] = \<const0> ;
  assign m_axi_awaddr[22] = \<const0> ;
  assign m_axi_awaddr[21] = \<const0> ;
  assign m_axi_awaddr[20] = \<const0> ;
  assign m_axi_awaddr[19] = \<const0> ;
  assign m_axi_awaddr[18] = \<const0> ;
  assign m_axi_awaddr[17] = \<const0> ;
  assign m_axi_awaddr[16] = \<const0> ;
  assign m_axi_awaddr[15] = \<const0> ;
  assign m_axi_awaddr[14] = \<const0> ;
  assign m_axi_awaddr[13] = \<const0> ;
  assign m_axi_awaddr[12] = \<const0> ;
  assign m_axi_awaddr[11] = \<const0> ;
  assign m_axi_awaddr[10] = \<const0> ;
  assign m_axi_awaddr[9] = \<const0> ;
  assign m_axi_awaddr[8] = \<const0> ;
  assign m_axi_awaddr[7] = \<const0> ;
  assign m_axi_awaddr[6] = \<const0> ;
  assign m_axi_awaddr[5] = \<const0> ;
  assign m_axi_awaddr[4] = \<const0> ;
  assign m_axi_awaddr[3] = \<const0> ;
  assign m_axi_awaddr[2] = \<const0> ;
  assign m_axi_awaddr[1] = \<const0> ;
  assign m_axi_awaddr[0] = \<const0> ;
  assign m_axi_awburst[1] = \<const0> ;
  assign m_axi_awburst[0] = \<const0> ;
  assign m_axi_awcache[3] = \<const0> ;
  assign m_axi_awcache[2] = \<const0> ;
  assign m_axi_awcache[1] = \<const0> ;
  assign m_axi_awcache[0] = \<const0> ;
  assign m_axi_awid[0] = \<const0> ;
  assign m_axi_awlen[7] = \<const0> ;
  assign m_axi_awlen[6] = \<const0> ;
  assign m_axi_awlen[5] = \<const0> ;
  assign m_axi_awlen[4] = \<const0> ;
  assign m_axi_awlen[3] = \<const0> ;
  assign m_axi_awlen[2] = \<const0> ;
  assign m_axi_awlen[1] = \<const0> ;
  assign m_axi_awlen[0] = \<const0> ;
  assign m_axi_awlock[0] = \<const0> ;
  assign m_axi_awprot[2] = \<const0> ;
  assign m_axi_awprot[1] = \<const0> ;
  assign m_axi_awprot[0] = \<const0> ;
  assign m_axi_awqos[3] = \<const0> ;
  assign m_axi_awqos[2] = \<const0> ;
  assign m_axi_awqos[1] = \<const0> ;
  assign m_axi_awqos[0] = \<const0> ;
  assign m_axi_awregion[3] = \<const0> ;
  assign m_axi_awregion[2] = \<const0> ;
  assign m_axi_awregion[1] = \<const0> ;
  assign m_axi_awregion[0] = \<const0> ;
  assign m_axi_awsize[2] = \<const0> ;
  assign m_axi_awsize[1] = \<const0> ;
  assign m_axi_awsize[0] = \<const0> ;
  assign m_axi_awuser[0] = \<const0> ;
  assign m_axi_awvalid = \<const0> ;
  assign m_axi_bready = \<const0> ;
  assign m_axi_rready = \<const0> ;
  assign m_axi_wdata[63] = \<const0> ;
  assign m_axi_wdata[62] = \<const0> ;
  assign m_axi_wdata[61] = \<const0> ;
  assign m_axi_wdata[60] = \<const0> ;
  assign m_axi_wdata[59] = \<const0> ;
  assign m_axi_wdata[58] = \<const0> ;
  assign m_axi_wdata[57] = \<const0> ;
  assign m_axi_wdata[56] = \<const0> ;
  assign m_axi_wdata[55] = \<const0> ;
  assign m_axi_wdata[54] = \<const0> ;
  assign m_axi_wdata[53] = \<const0> ;
  assign m_axi_wdata[52] = \<const0> ;
  assign m_axi_wdata[51] = \<const0> ;
  assign m_axi_wdata[50] = \<const0> ;
  assign m_axi_wdata[49] = \<const0> ;
  assign m_axi_wdata[48] = \<const0> ;
  assign m_axi_wdata[47] = \<const0> ;
  assign m_axi_wdata[46] = \<const0> ;
  assign m_axi_wdata[45] = \<const0> ;
  assign m_axi_wdata[44] = \<const0> ;
  assign m_axi_wdata[43] = \<const0> ;
  assign m_axi_wdata[42] = \<const0> ;
  assign m_axi_wdata[41] = \<const0> ;
  assign m_axi_wdata[40] = \<const0> ;
  assign m_axi_wdata[39] = \<const0> ;
  assign m_axi_wdata[38] = \<const0> ;
  assign m_axi_wdata[37] = \<const0> ;
  assign m_axi_wdata[36] = \<const0> ;
  assign m_axi_wdata[35] = \<const0> ;
  assign m_axi_wdata[34] = \<const0> ;
  assign m_axi_wdata[33] = \<const0> ;
  assign m_axi_wdata[32] = \<const0> ;
  assign m_axi_wdata[31] = \<const0> ;
  assign m_axi_wdata[30] = \<const0> ;
  assign m_axi_wdata[29] = \<const0> ;
  assign m_axi_wdata[28] = \<const0> ;
  assign m_axi_wdata[27] = \<const0> ;
  assign m_axi_wdata[26] = \<const0> ;
  assign m_axi_wdata[25] = \<const0> ;
  assign m_axi_wdata[24] = \<const0> ;
  assign m_axi_wdata[23] = \<const0> ;
  assign m_axi_wdata[22] = \<const0> ;
  assign m_axi_wdata[21] = \<const0> ;
  assign m_axi_wdata[20] = \<const0> ;
  assign m_axi_wdata[19] = \<const0> ;
  assign m_axi_wdata[18] = \<const0> ;
  assign m_axi_wdata[17] = \<const0> ;
  assign m_axi_wdata[16] = \<const0> ;
  assign m_axi_wdata[15] = \<const0> ;
  assign m_axi_wdata[14] = \<const0> ;
  assign m_axi_wdata[13] = \<const0> ;
  assign m_axi_wdata[12] = \<const0> ;
  assign m_axi_wdata[11] = \<const0> ;
  assign m_axi_wdata[10] = \<const0> ;
  assign m_axi_wdata[9] = \<const0> ;
  assign m_axi_wdata[8] = \<const0> ;
  assign m_axi_wdata[7] = \<const0> ;
  assign m_axi_wdata[6] = \<const0> ;
  assign m_axi_wdata[5] = \<const0> ;
  assign m_axi_wdata[4] = \<const0> ;
  assign m_axi_wdata[3] = \<const0> ;
  assign m_axi_wdata[2] = \<const0> ;
  assign m_axi_wdata[1] = \<const0> ;
  assign m_axi_wdata[0] = \<const0> ;
  assign m_axi_wid[0] = \<const0> ;
  assign m_axi_wlast = \<const0> ;
  assign m_axi_wstrb[7] = \<const0> ;
  assign m_axi_wstrb[6] = \<const0> ;
  assign m_axi_wstrb[5] = \<const0> ;
  assign m_axi_wstrb[4] = \<const0> ;
  assign m_axi_wstrb[3] = \<const0> ;
  assign m_axi_wstrb[2] = \<const0> ;
  assign m_axi_wstrb[1] = \<const0> ;
  assign m_axi_wstrb[0] = \<const0> ;
  assign m_axi_wuser[0] = \<const0> ;
  assign m_axi_wvalid = \<const0> ;
  assign m_axis_tdest[0] = \<const0> ;
  assign m_axis_tid[0] = \<const0> ;
  assign m_axis_tkeep[3] = \<const0> ;
  assign m_axis_tkeep[2] = \<const0> ;
  assign m_axis_tkeep[1] = \<const0> ;
  assign m_axis_tkeep[0] = \<const0> ;
  assign m_axis_tlast = \<const0> ;
  assign m_axis_tstrb[3] = \<const0> ;
  assign m_axis_tstrb[2] = \<const0> ;
  assign m_axis_tstrb[1] = \<const0> ;
  assign m_axis_tstrb[0] = \<const0> ;
  assign overflow = \<const0> ;
  assign prog_empty = \<const1> ;
  assign prog_full = \<const0> ;
  assign rd_data_count[9] = \<const0> ;
  assign rd_data_count[8] = \<const0> ;
  assign rd_data_count[7] = \<const0> ;
  assign rd_data_count[6] = \<const0> ;
  assign rd_data_count[5] = \<const0> ;
  assign rd_data_count[4] = \<const0> ;
  assign rd_data_count[3] = \<const0> ;
  assign rd_data_count[2] = \<const0> ;
  assign rd_data_count[1] = \<const0> ;
  assign rd_data_count[0] = \<const0> ;
  assign rd_rst_busy = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_buser[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_rdata[63] = \<const0> ;
  assign s_axi_rdata[62] = \<const0> ;
  assign s_axi_rdata[61] = \<const0> ;
  assign s_axi_rdata[60] = \<const0> ;
  assign s_axi_rdata[59] = \<const0> ;
  assign s_axi_rdata[58] = \<const0> ;
  assign s_axi_rdata[57] = \<const0> ;
  assign s_axi_rdata[56] = \<const0> ;
  assign s_axi_rdata[55] = \<const0> ;
  assign s_axi_rdata[54] = \<const0> ;
  assign s_axi_rdata[53] = \<const0> ;
  assign s_axi_rdata[52] = \<const0> ;
  assign s_axi_rdata[51] = \<const0> ;
  assign s_axi_rdata[50] = \<const0> ;
  assign s_axi_rdata[49] = \<const0> ;
  assign s_axi_rdata[48] = \<const0> ;
  assign s_axi_rdata[47] = \<const0> ;
  assign s_axi_rdata[46] = \<const0> ;
  assign s_axi_rdata[45] = \<const0> ;
  assign s_axi_rdata[44] = \<const0> ;
  assign s_axi_rdata[43] = \<const0> ;
  assign s_axi_rdata[42] = \<const0> ;
  assign s_axi_rdata[41] = \<const0> ;
  assign s_axi_rdata[40] = \<const0> ;
  assign s_axi_rdata[39] = \<const0> ;
  assign s_axi_rdata[38] = \<const0> ;
  assign s_axi_rdata[37] = \<const0> ;
  assign s_axi_rdata[36] = \<const0> ;
  assign s_axi_rdata[35] = \<const0> ;
  assign s_axi_rdata[34] = \<const0> ;
  assign s_axi_rdata[33] = \<const0> ;
  assign s_axi_rdata[32] = \<const0> ;
  assign s_axi_rdata[31] = \<const0> ;
  assign s_axi_rdata[30] = \<const0> ;
  assign s_axi_rdata[29] = \<const0> ;
  assign s_axi_rdata[28] = \<const0> ;
  assign s_axi_rdata[27] = \<const0> ;
  assign s_axi_rdata[26] = \<const0> ;
  assign s_axi_rdata[25] = \<const0> ;
  assign s_axi_rdata[24] = \<const0> ;
  assign s_axi_rdata[23] = \<const0> ;
  assign s_axi_rdata[22] = \<const0> ;
  assign s_axi_rdata[21] = \<const0> ;
  assign s_axi_rdata[20] = \<const0> ;
  assign s_axi_rdata[19] = \<const0> ;
  assign s_axi_rdata[18] = \<const0> ;
  assign s_axi_rdata[17] = \<const0> ;
  assign s_axi_rdata[16] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_ruser[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign sbiterr = \<const0> ;
  assign underflow = \<const0> ;
  assign valid = \<const0> ;
  assign wr_ack = \<const0> ;
  assign wr_data_count[9] = \<const0> ;
  assign wr_data_count[8] = \<const0> ;
  assign wr_data_count[7] = \<const0> ;
  assign wr_data_count[6] = \<const0> ;
  assign wr_data_count[5] = \<const0> ;
  assign wr_data_count[4] = \<const0> ;
  assign wr_data_count[3] = \<const0> ;
  assign wr_data_count[2] = \<const0> ;
  assign wr_data_count[1] = \<const0> ;
  assign wr_data_count[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_fifo_generator_v13_2_5_synth inst_fifo_gen
       (.Q({m_axis_tdata,m_axis_tuser}),
        .axis_prog_empty(axis_prog_empty),
        .axis_prog_full(axis_prog_full),
        .axis_rd_data_count(axis_rd_data_count),
        .axis_wr_data_count(axis_wr_data_count),
        .m_aclk(m_aclk),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .s_aclk(s_aclk),
        .s_aresetn(s_aresetn),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tready(s_axis_tready),
        .s_axis_tuser(s_axis_tuser),
        .s_axis_tvalid(s_axis_tvalid),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* ORIG_REF_NAME = "fifo_generator_v13_2_5_synth" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_fifo_generator_v13_2_5_synth
   (axis_prog_empty,
    axis_prog_full,
    m_aclk,
    m_axis_tready,
    m_axis_tvalid,
    s_aclk,
    s_aresetn,
    s_axis_tready,
    s_axis_tvalid,
    wr_rst_busy,
    Q,
    axis_rd_data_count,
    axis_wr_data_count,
    s_axis_tdata,
    s_axis_tuser);
  output axis_prog_empty;
  output axis_prog_full;
  input m_aclk;
  input m_axis_tready;
  output m_axis_tvalid;
  input s_aclk;
  input s_aresetn;
  output s_axis_tready;
  input s_axis_tvalid;
  output wr_rst_busy;
  output [33:0]Q;
  output [9:0]axis_rd_data_count;
  output [9:0]axis_wr_data_count;
  input [31:0]s_axis_tdata;
  input [1:0]s_axis_tuser;

  wire [33:0]Q;
  wire axis_prog_empty;
  wire axis_prog_full;
  wire [9:0]axis_rd_data_count;
  wire [9:0]axis_wr_data_count;
  wire m_aclk;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire s_aclk;
  wire s_aresetn;
  wire [31:0]s_axis_tdata;
  wire s_axis_tready;
  wire [1:0]s_axis_tuser;
  wire s_axis_tvalid;
  wire wr_rst_busy;

  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_fifo_generator_top \gaxis_fifo.gaxisf.axisf 
       (.Q(Q),
        .axis_prog_empty(axis_prog_empty),
        .axis_prog_full(axis_prog_full),
        .axis_rd_data_count(axis_rd_data_count),
        .axis_wr_data_count(axis_wr_data_count),
        .m_aclk(m_aclk),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .s_aclk(s_aclk),
        .s_aresetn(s_aresetn),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tready(s_axis_tready),
        .s_axis_tuser(s_axis_tuser),
        .s_axis_tvalid(s_axis_tvalid),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* ORIG_REF_NAME = "memory" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_memory
   (ENB_I,
    ENB_dly_D,
    m_aclk,
    out,
    s_aclk,
    s_axis_tvalid,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    E,
    Q,
    \goreg_bm.dout_i_reg[33]_0 ,
    \goreg_bm.dout_i_reg[33]_1 ,
    s_axis_tdata,
    s_axis_tuser);
  input ENB_I;
  output ENB_dly_D;
  input m_aclk;
  input out;
  input s_aclk;
  input s_axis_tvalid;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  input [0:0]E;
  input [8:0]Q;
  output [33:0]\goreg_bm.dout_i_reg[33]_0 ;
  input [0:0]\goreg_bm.dout_i_reg[33]_1 ;
  input [31:0]s_axis_tdata;
  input [1:0]s_axis_tuser;

  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  wire [0:0]E;
  wire ENB_I;
  wire ENB_dly_D;
  wire [8:0]Q;
  wire [33:0]doutb;
  wire [33:0]\goreg_bm.dout_i_reg[33]_0 ;
  wire [0:0]\goreg_bm.dout_i_reg[33]_1 ;
  wire m_aclk;
  wire out;
  wire s_aclk;
  wire [31:0]s_axis_tdata;
  wire [1:0]s_axis_tuser;
  wire s_axis_tvalid;

  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_blk_mem_gen_v8_4_4 \gbm.gbmg.gbmga.ngecc.bmg 
       (.D(doutb),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ),
        .E(E),
        .ENB_I(ENB_I),
        .ENB_dly_D(ENB_dly_D),
        .Q(Q),
        .m_aclk(m_aclk),
        .out(out),
        .s_aclk(s_aclk),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tuser(s_axis_tuser),
        .s_axis_tvalid(s_axis_tvalid));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[0] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[0]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[10] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[10]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[11] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[11]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[12] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[12]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[13] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[13]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[14] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[14]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[15] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[15]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[16] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[16]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[17] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[17]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[18] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[18]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[19] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[19]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[1] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[1]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[20] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[20]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[21] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[21]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[22] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[22]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[23] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[23]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[24] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[24]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[25] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[25]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[26] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[26]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[27] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[27]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[28] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[28]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[29] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[29]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[2] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[2]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[30] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[30]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[31] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[31]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[32] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[32]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [32]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[33] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[33]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [33]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[3] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[3]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[4] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[4]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[5] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[5]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[6] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[6]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[7] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[7]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[8] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[8]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[9] 
       (.C(m_aclk),
        .CE(\goreg_bm.dout_i_reg[33]_1 ),
        .D(doutb[9]),
        .Q(\goreg_bm.dout_i_reg[33]_0 [9]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "rd_bin_cntr" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_rd_bin_cntr
   (\gc0.count_d1_reg[0]_0 ,
    m_aclk,
    ram_rd_en,
    DI,
    Q,
    S,
    WR_PNTR_RD,
    \gc0.count_d1_reg[6]_0 ,
    \gc0.count_d1_reg[7]_0 ,
    \gc0.count_reg[8]_0 ,
    v1_reg);
  input \gc0.count_d1_reg[0]_0 ;
  input m_aclk;
  input ram_rd_en;
  output [0:0]DI;
  output [8:0]Q;
  output [3:0]S;
  input [8:0]WR_PNTR_RD;
  output [3:0]\gc0.count_d1_reg[6]_0 ;
  output [0:0]\gc0.count_d1_reg[7]_0 ;
  output [0:0]\gc0.count_reg[8]_0 ;
  output [3:0]v1_reg;

  wire [0:0]DI;
  wire [8:0]Q;
  wire [3:0]S;
  wire [8:0]WR_PNTR_RD;
  wire \gc0.count[8]_i_2_n_0 ;
  wire \gc0.count_d1_reg[0]_0 ;
  wire [3:0]\gc0.count_d1_reg[6]_0 ;
  wire [0:0]\gc0.count_d1_reg[7]_0 ;
  wire [0:0]\gc0.count_reg[8]_0 ;
  wire m_aclk;
  wire [8:0]plusOp__1;
  wire ram_rd_en;
  wire [7:0]rd_pntr_plus1;
  wire [3:0]v1_reg;

  LUT1 #(
    .INIT(2'h1)) 
    \gc0.count[0]_i_1 
       (.I0(rd_pntr_plus1[0]),
        .O(plusOp__1[0]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \gc0.count[1]_i_1 
       (.I0(rd_pntr_plus1[0]),
        .I1(rd_pntr_plus1[1]),
        .O(plusOp__1[1]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \gc0.count[2]_i_1 
       (.I0(rd_pntr_plus1[0]),
        .I1(rd_pntr_plus1[1]),
        .I2(rd_pntr_plus1[2]),
        .O(plusOp__1[2]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \gc0.count[3]_i_1 
       (.I0(rd_pntr_plus1[1]),
        .I1(rd_pntr_plus1[0]),
        .I2(rd_pntr_plus1[2]),
        .I3(rd_pntr_plus1[3]),
        .O(plusOp__1[3]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \gc0.count[4]_i_1 
       (.I0(rd_pntr_plus1[2]),
        .I1(rd_pntr_plus1[0]),
        .I2(rd_pntr_plus1[1]),
        .I3(rd_pntr_plus1[3]),
        .I4(rd_pntr_plus1[4]),
        .O(plusOp__1[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \gc0.count[5]_i_1 
       (.I0(rd_pntr_plus1[3]),
        .I1(rd_pntr_plus1[1]),
        .I2(rd_pntr_plus1[0]),
        .I3(rd_pntr_plus1[2]),
        .I4(rd_pntr_plus1[4]),
        .I5(rd_pntr_plus1[5]),
        .O(plusOp__1[5]));
  LUT2 #(
    .INIT(4'h6)) 
    \gc0.count[6]_i_1 
       (.I0(\gc0.count[8]_i_2_n_0 ),
        .I1(rd_pntr_plus1[6]),
        .O(plusOp__1[6]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \gc0.count[7]_i_1 
       (.I0(\gc0.count[8]_i_2_n_0 ),
        .I1(rd_pntr_plus1[6]),
        .I2(rd_pntr_plus1[7]),
        .O(plusOp__1[7]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \gc0.count[8]_i_1 
       (.I0(rd_pntr_plus1[6]),
        .I1(\gc0.count[8]_i_2_n_0 ),
        .I2(rd_pntr_plus1[7]),
        .I3(\gc0.count_reg[8]_0 ),
        .O(plusOp__1[8]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \gc0.count[8]_i_2 
       (.I0(rd_pntr_plus1[5]),
        .I1(rd_pntr_plus1[3]),
        .I2(rd_pntr_plus1[1]),
        .I3(rd_pntr_plus1[0]),
        .I4(rd_pntr_plus1[2]),
        .I5(rd_pntr_plus1[4]),
        .O(\gc0.count[8]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[0] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(rd_pntr_plus1[0]),
        .Q(Q[0]),
        .R(\gc0.count_d1_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[1] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(rd_pntr_plus1[1]),
        .Q(Q[1]),
        .R(\gc0.count_d1_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[2] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(rd_pntr_plus1[2]),
        .Q(Q[2]),
        .R(\gc0.count_d1_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[3] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(rd_pntr_plus1[3]),
        .Q(Q[3]),
        .R(\gc0.count_d1_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[4] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(rd_pntr_plus1[4]),
        .Q(Q[4]),
        .R(\gc0.count_d1_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[5] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(rd_pntr_plus1[5]),
        .Q(Q[5]),
        .R(\gc0.count_d1_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[6] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(rd_pntr_plus1[6]),
        .Q(Q[6]),
        .R(\gc0.count_d1_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[7] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(rd_pntr_plus1[7]),
        .Q(Q[7]),
        .R(\gc0.count_d1_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[8] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(\gc0.count_reg[8]_0 ),
        .Q(Q[8]),
        .R(\gc0.count_d1_reg[0]_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \gc0.count_reg[0] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(plusOp__1[0]),
        .Q(rd_pntr_plus1[0]),
        .S(\gc0.count_d1_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[1] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(plusOp__1[1]),
        .Q(rd_pntr_plus1[1]),
        .R(\gc0.count_d1_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[2] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(plusOp__1[2]),
        .Q(rd_pntr_plus1[2]),
        .R(\gc0.count_d1_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[3] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(plusOp__1[3]),
        .Q(rd_pntr_plus1[3]),
        .R(\gc0.count_d1_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[4] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(plusOp__1[4]),
        .Q(rd_pntr_plus1[4]),
        .R(\gc0.count_d1_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[5] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(plusOp__1[5]),
        .Q(rd_pntr_plus1[5]),
        .R(\gc0.count_d1_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[6] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(plusOp__1[6]),
        .Q(rd_pntr_plus1[6]),
        .R(\gc0.count_d1_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[7] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(plusOp__1[7]),
        .Q(rd_pntr_plus1[7]),
        .R(\gc0.count_d1_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[8] 
       (.C(m_aclk),
        .CE(ram_rd_en),
        .D(plusOp__1[8]),
        .Q(\gc0.count_reg[8]_0 ),
        .R(\gc0.count_d1_reg[0]_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1__2 
       (.I0(rd_pntr_plus1[0]),
        .I1(WR_PNTR_RD[0]),
        .I2(rd_pntr_plus1[1]),
        .I3(WR_PNTR_RD[1]),
        .O(v1_reg[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1__2 
       (.I0(rd_pntr_plus1[2]),
        .I1(WR_PNTR_RD[2]),
        .I2(rd_pntr_plus1[3]),
        .I3(WR_PNTR_RD[3]),
        .O(v1_reg[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1__2 
       (.I0(rd_pntr_plus1[4]),
        .I1(WR_PNTR_RD[4]),
        .I2(rd_pntr_plus1[5]),
        .I3(WR_PNTR_RD[5]),
        .O(v1_reg[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1__2 
       (.I0(rd_pntr_plus1[6]),
        .I1(WR_PNTR_RD[6]),
        .I2(rd_pntr_plus1[7]),
        .I3(WR_PNTR_RD[7]),
        .O(v1_reg[3]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__0_i_5__0
       (.I0(Q[6]),
        .I1(WR_PNTR_RD[6]),
        .I2(Q[7]),
        .I3(WR_PNTR_RD[7]),
        .O(\gc0.count_d1_reg[6]_0 [3]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__0_i_6__0
       (.I0(Q[5]),
        .I1(WR_PNTR_RD[5]),
        .I2(Q[6]),
        .I3(WR_PNTR_RD[6]),
        .O(\gc0.count_d1_reg[6]_0 [2]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__0_i_7__0
       (.I0(Q[4]),
        .I1(WR_PNTR_RD[4]),
        .I2(Q[5]),
        .I3(WR_PNTR_RD[5]),
        .O(\gc0.count_d1_reg[6]_0 [1]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__0_i_8__0
       (.I0(Q[3]),
        .I1(WR_PNTR_RD[3]),
        .I2(Q[4]),
        .I3(WR_PNTR_RD[4]),
        .O(\gc0.count_d1_reg[6]_0 [0]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__1_i_1__0
       (.I0(Q[7]),
        .I1(WR_PNTR_RD[7]),
        .I2(Q[8]),
        .I3(WR_PNTR_RD[8]),
        .O(\gc0.count_d1_reg[7]_0 ));
  LUT3 #(
    .INIT(8'h71)) 
    plusOp__0_carry_i_3__0
       (.I0(Q[0]),
        .I1(ram_rd_en),
        .I2(WR_PNTR_RD[0]),
        .O(DI));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry_i_4__0
       (.I0(Q[2]),
        .I1(WR_PNTR_RD[2]),
        .I2(Q[3]),
        .I3(WR_PNTR_RD[3]),
        .O(S[3]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry_i_5__0
       (.I0(Q[1]),
        .I1(WR_PNTR_RD[1]),
        .I2(Q[2]),
        .I3(WR_PNTR_RD[2]),
        .O(S[2]));
  LUT5 #(
    .INIT(32'hD42B2BD4)) 
    plusOp__0_carry_i_6__0
       (.I0(WR_PNTR_RD[0]),
        .I1(ram_rd_en),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(WR_PNTR_RD[1]),
        .O(S[1]));
  LUT3 #(
    .INIT(8'h96)) 
    plusOp__0_carry_i_7__0
       (.I0(WR_PNTR_RD[0]),
        .I1(Q[0]),
        .I2(ram_rd_en),
        .O(S[0]));
endmodule

(* ORIG_REF_NAME = "rd_dc_fwft_ext_as" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_rd_dc_fwft_ext_as
   (\g_rd.gvalid_low.rd_dc_i_reg[0]_0 ,
    \g_rd.gvalid_low.rd_dc_i_reg[1]_0 ,
    \g_rd.gvalid_low.rd_dc_i_reg[2]_0 ,
    \g_rd.gvalid_low.rd_dc_i_reg[3]_0 ,
    \g_rd.gvalid_low.rd_dc_i_reg[4]_0 ,
    \g_rd.gvalid_low.rd_dc_i_reg[5]_0 ,
    \g_rd.gvalid_low.rd_dc_i_reg[6]_0 ,
    \g_rd.gvalid_low.rd_dc_i_reg[7]_0 ,
    \g_rd.gvalid_low.rd_dc_i_reg[8]_0 ,
    \g_rd.gvalid_low.rd_dc_i_reg[9]_0 ,
    m_aclk,
    axis_rd_data_count,
    rd_dc_i);
  input \g_rd.gvalid_low.rd_dc_i_reg[0]_0 ;
  input \g_rd.gvalid_low.rd_dc_i_reg[1]_0 ;
  input \g_rd.gvalid_low.rd_dc_i_reg[2]_0 ;
  input \g_rd.gvalid_low.rd_dc_i_reg[3]_0 ;
  input \g_rd.gvalid_low.rd_dc_i_reg[4]_0 ;
  input \g_rd.gvalid_low.rd_dc_i_reg[5]_0 ;
  input \g_rd.gvalid_low.rd_dc_i_reg[6]_0 ;
  input \g_rd.gvalid_low.rd_dc_i_reg[7]_0 ;
  input \g_rd.gvalid_low.rd_dc_i_reg[8]_0 ;
  input \g_rd.gvalid_low.rd_dc_i_reg[9]_0 ;
  input m_aclk;
  output [9:0]axis_rd_data_count;
  input [0:0]rd_dc_i;

  wire [9:0]axis_rd_data_count;
  wire \g_rd.gvalid_low.rd_dc_i_reg[0]_0 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[1]_0 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[2]_0 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[3]_0 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[4]_0 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[5]_0 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[6]_0 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[7]_0 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[8]_0 ;
  wire \g_rd.gvalid_low.rd_dc_i_reg[9]_0 ;
  wire m_aclk;
  wire [0:0]rd_dc_i;

  FDRE #(
    .INIT(1'b0)) 
    \g_rd.gvalid_low.rd_dc_i_reg[0] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(\g_rd.gvalid_low.rd_dc_i_reg[0]_0 ),
        .Q(axis_rd_data_count[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \g_rd.gvalid_low.rd_dc_i_reg[1] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(\g_rd.gvalid_low.rd_dc_i_reg[1]_0 ),
        .Q(axis_rd_data_count[1]),
        .R(rd_dc_i));
  FDRE #(
    .INIT(1'b0)) 
    \g_rd.gvalid_low.rd_dc_i_reg[2] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(\g_rd.gvalid_low.rd_dc_i_reg[2]_0 ),
        .Q(axis_rd_data_count[2]),
        .R(rd_dc_i));
  FDRE #(
    .INIT(1'b0)) 
    \g_rd.gvalid_low.rd_dc_i_reg[3] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(\g_rd.gvalid_low.rd_dc_i_reg[3]_0 ),
        .Q(axis_rd_data_count[3]),
        .R(rd_dc_i));
  FDRE #(
    .INIT(1'b0)) 
    \g_rd.gvalid_low.rd_dc_i_reg[4] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(\g_rd.gvalid_low.rd_dc_i_reg[4]_0 ),
        .Q(axis_rd_data_count[4]),
        .R(rd_dc_i));
  FDRE #(
    .INIT(1'b0)) 
    \g_rd.gvalid_low.rd_dc_i_reg[5] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(\g_rd.gvalid_low.rd_dc_i_reg[5]_0 ),
        .Q(axis_rd_data_count[5]),
        .R(rd_dc_i));
  FDRE #(
    .INIT(1'b0)) 
    \g_rd.gvalid_low.rd_dc_i_reg[6] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(\g_rd.gvalid_low.rd_dc_i_reg[6]_0 ),
        .Q(axis_rd_data_count[6]),
        .R(rd_dc_i));
  FDRE #(
    .INIT(1'b0)) 
    \g_rd.gvalid_low.rd_dc_i_reg[7] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(\g_rd.gvalid_low.rd_dc_i_reg[7]_0 ),
        .Q(axis_rd_data_count[7]),
        .R(rd_dc_i));
  FDRE #(
    .INIT(1'b0)) 
    \g_rd.gvalid_low.rd_dc_i_reg[8] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(\g_rd.gvalid_low.rd_dc_i_reg[8]_0 ),
        .Q(axis_rd_data_count[8]),
        .R(rd_dc_i));
  FDRE #(
    .INIT(1'b0)) 
    \g_rd.gvalid_low.rd_dc_i_reg[9] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(\g_rd.gvalid_low.rd_dc_i_reg[9]_0 ),
        .Q(axis_rd_data_count[9]),
        .R(rd_dc_i));
endmodule

(* ORIG_REF_NAME = "rd_fwft" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_rd_fwft
   (ENB_I,
    ENB_dly_D,
    empty_fwft_i_reg_0,
    \gpregsm1.curr_fwft_state_reg[1]_0 ,
    m_aclk,
    m_axis_tready,
    m_axis_tvalid,
    out,
    ram_rd_en,
    E,
    O,
    rd_dc_i);
  output ENB_I;
  input ENB_dly_D;
  input empty_fwft_i_reg_0;
  output \gpregsm1.curr_fwft_state_reg[1]_0 ;
  input m_aclk;
  input m_axis_tready;
  output m_axis_tvalid;
  input out;
  output ram_rd_en;
  output [0:0]E;
  input [0:0]O;
  output [0:0]rd_dc_i;

  wire [0:0]E;
  wire ENB_I;
  wire ENB_dly_D;
  wire [0:0]O;
  (* DONT_TOUCH *) wire aempty_fwft_fb_i;
  (* DONT_TOUCH *) wire aempty_fwft_i;
  wire aempty_fwft_i0__1;
  (* DONT_TOUCH *) wire [1:0]curr_fwft_state;
  (* DONT_TOUCH *) wire empty_fwft_fb_i;
  (* DONT_TOUCH *) wire empty_fwft_fb_o_i;
  wire empty_fwft_fb_o_i_reg0;
  (* DONT_TOUCH *) wire empty_fwft_i;
  wire empty_fwft_i0__1;
  wire empty_fwft_i_reg_0;
  wire \gpregsm1.curr_fwft_state_reg[1]_0 ;
  wire m_aclk;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire [1:0]next_fwft_state;
  wire out;
  wire ram_rd_en;
  wire [0:0]rd_dc_i;
  (* DONT_TOUCH *) wire user_valid;

  LUT4 #(
    .INIT(16'hAABA)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_i_1 
       (.I0(ENB_dly_D),
        .I1(empty_fwft_i_reg_0),
        .I2(ram_rd_en),
        .I3(out),
        .O(ENB_I));
  LUT6 #(
    .INIT(64'hFFFFF02F20000000)) 
    aempty_fwft_fb_i_i_1
       (.I0(m_axis_tready),
        .I1(empty_fwft_fb_o_i),
        .I2(curr_fwft_state[0]),
        .I3(curr_fwft_state[1]),
        .I4(out),
        .I5(aempty_fwft_fb_i),
        .O(aempty_fwft_i0__1));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    aempty_fwft_fb_i_reg
       (.C(m_aclk),
        .CE(1'b1),
        .D(aempty_fwft_i0__1),
        .Q(aempty_fwft_fb_i),
        .S(empty_fwft_i_reg_0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    aempty_fwft_i_reg
       (.C(m_aclk),
        .CE(1'b1),
        .D(aempty_fwft_i0__1),
        .Q(aempty_fwft_i),
        .S(empty_fwft_i_reg_0));
  LUT5 #(
    .INIT(32'hFF0F0400)) 
    empty_fwft_fb_i_i_1
       (.I0(empty_fwft_fb_o_i),
        .I1(m_axis_tready),
        .I2(curr_fwft_state[1]),
        .I3(curr_fwft_state[0]),
        .I4(empty_fwft_fb_i),
        .O(empty_fwft_i0__1));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    empty_fwft_fb_i_reg
       (.C(m_aclk),
        .CE(1'b1),
        .D(empty_fwft_i0__1),
        .Q(empty_fwft_fb_i),
        .S(empty_fwft_i_reg_0));
  LUT4 #(
    .INIT(16'hF320)) 
    empty_fwft_fb_o_i_i_1
       (.I0(m_axis_tready),
        .I1(curr_fwft_state[1]),
        .I2(curr_fwft_state[0]),
        .I3(empty_fwft_fb_o_i),
        .O(empty_fwft_fb_o_i_reg0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    empty_fwft_fb_o_i_reg
       (.C(m_aclk),
        .CE(1'b1),
        .D(empty_fwft_fb_o_i_reg0),
        .Q(empty_fwft_fb_o_i),
        .S(empty_fwft_i_reg_0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    empty_fwft_i_reg
       (.C(m_aclk),
        .CE(1'b1),
        .D(empty_fwft_i0__1),
        .Q(empty_fwft_i),
        .S(empty_fwft_i_reg_0));
  LUT4 #(
    .INIT(16'h00D0)) 
    \g_rd.gvalid_low.rd_dc_i[0]_i_1 
       (.I0(curr_fwft_state[1]),
        .I1(O),
        .I2(user_valid),
        .I3(empty_fwft_i_reg_0),
        .O(\gpregsm1.curr_fwft_state_reg[1]_0 ));
  LUT3 #(
    .INIT(8'hBF)) 
    \g_rd.gvalid_low.rd_dc_i[9]_i_1 
       (.I0(empty_fwft_i_reg_0),
        .I1(curr_fwft_state[1]),
        .I2(user_valid),
        .O(rd_dc_i));
  LUT5 #(
    .INIT(32'h04555555)) 
    \gc0.count_d1[8]_i_1 
       (.I0(out),
        .I1(m_axis_tready),
        .I2(empty_fwft_fb_o_i),
        .I3(curr_fwft_state[1]),
        .I4(curr_fwft_state[0]),
        .O(ram_rd_en));
  LUT5 #(
    .INIT(32'h00004F00)) 
    \goreg_bm.dout_i[33]_i_1 
       (.I0(empty_fwft_fb_o_i),
        .I1(m_axis_tready),
        .I2(curr_fwft_state[0]),
        .I3(curr_fwft_state[1]),
        .I4(empty_fwft_i_reg_0),
        .O(E));
  LUT4 #(
    .INIT(16'hFBAA)) 
    \gpregsm1.curr_fwft_state[0]_i_1 
       (.I0(curr_fwft_state[1]),
        .I1(m_axis_tready),
        .I2(empty_fwft_fb_o_i),
        .I3(curr_fwft_state[0]),
        .O(next_fwft_state[0]));
  LUT5 #(
    .INIT(32'hA200FFFF)) 
    \gpregsm1.curr_fwft_state[1]_i_1 
       (.I0(curr_fwft_state[1]),
        .I1(m_axis_tready),
        .I2(empty_fwft_fb_o_i),
        .I3(curr_fwft_state[0]),
        .I4(out),
        .O(next_fwft_state[1]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \gpregsm1.curr_fwft_state_reg[0] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(next_fwft_state[0]),
        .Q(curr_fwft_state[0]),
        .R(empty_fwft_i_reg_0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \gpregsm1.curr_fwft_state_reg[1] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(next_fwft_state[1]),
        .Q(curr_fwft_state[1]),
        .R(empty_fwft_i_reg_0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \gpregsm1.user_valid_reg 
       (.C(m_aclk),
        .CE(1'b1),
        .D(next_fwft_state[0]),
        .Q(user_valid),
        .R(empty_fwft_i_reg_0));
  LUT1 #(
    .INIT(2'h1)) 
    m_axis_tvalid_INST_0
       (.I0(empty_fwft_i),
        .O(m_axis_tvalid));
endmodule

(* ORIG_REF_NAME = "rd_logic" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_rd_logic
   (ENB_I,
    ENB_dly_D,
    axis_prog_empty,
    \g_rd.gvalid_low.rd_dc_i_reg ,
    \gc0.count_d1_reg ,
    m_aclk,
    m_axis_tready,
    m_axis_tvalid,
    ram_empty_fb_i_reg,
    DI,
    E,
    O,
    Q,
    WR_PNTR_RD,
    axis_rd_data_count,
    \gc0.count_reg[8] ,
    \gdiff.diff_pntr_pad_reg[8] ,
    ram_empty_fb_i_reg_0,
    v1_reg);
  output ENB_I;
  input ENB_dly_D;
  output axis_prog_empty;
  input [9:1]\g_rd.gvalid_low.rd_dc_i_reg ;
  input [0:0]\gc0.count_d1_reg ;
  input m_aclk;
  input m_axis_tready;
  output m_axis_tvalid;
  input ram_empty_fb_i_reg;
  input [1:0]DI;
  output [0:0]E;
  input [0:0]O;
  output [8:0]Q;
  input [8:0]WR_PNTR_RD;
  output [9:0]axis_rd_data_count;
  output [0:0]\gc0.count_reg[8] ;
  input [3:0]\gdiff.diff_pntr_pad_reg[8] ;
  input [0:0]ram_empty_fb_i_reg_0;
  input [3:0]v1_reg;

  wire [1:0]DI;
  wire [0:0]E;
  wire ENB_I;
  wire ENB_dly_D;
  wire [0:0]O;
  wire [8:0]Q;
  wire [8:0]WR_PNTR_RD;
  wire axis_prog_empty;
  wire [9:0]axis_rd_data_count;
  wire [3:0]\c1/v1_reg ;
  wire empty_fb_i;
  wire [9:1]\g_rd.gvalid_low.rd_dc_i_reg ;
  wire [0:0]\gc0.count_d1_reg ;
  wire [0:0]\gc0.count_reg[8] ;
  wire [3:0]\gdiff.diff_pntr_pad_reg[8] ;
  wire \gr1.gr1_int.rfwft_n_3 ;
  wire m_aclk;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire ram_empty_fb_i_reg;
  wire [0:0]ram_empty_fb_i_reg_0;
  wire ram_rd_en;
  wire [9:9]rd_dc_i;
  wire rpntr_n_0;
  wire rpntr_n_15;
  wire rpntr_n_16;
  wire rpntr_n_17;
  wire rpntr_n_18;
  wire rpntr_n_19;
  wire rpntr_n_20;
  wire rpntr_n_21;
  wire rpntr_n_22;
  wire rpntr_n_23;
  wire [3:0]v1_reg;

  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_rd_fwft \gr1.gr1_int.rfwft 
       (.E(E),
        .ENB_I(ENB_I),
        .ENB_dly_D(ENB_dly_D),
        .O(O),
        .empty_fwft_i_reg_0(\gc0.count_d1_reg ),
        .\gpregsm1.curr_fwft_state_reg[1]_0 (\gr1.gr1_int.rfwft_n_3 ),
        .m_aclk(m_aclk),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .out(empty_fb_i),
        .ram_rd_en(ram_rd_en),
        .rd_dc_i(rd_dc_i));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_rd_dc_fwft_ext_as \gr1.grdc2.rdc 
       (.axis_rd_data_count(axis_rd_data_count),
        .\g_rd.gvalid_low.rd_dc_i_reg[0]_0 (\gr1.gr1_int.rfwft_n_3 ),
        .\g_rd.gvalid_low.rd_dc_i_reg[1]_0 (\g_rd.gvalid_low.rd_dc_i_reg [1]),
        .\g_rd.gvalid_low.rd_dc_i_reg[2]_0 (\g_rd.gvalid_low.rd_dc_i_reg [2]),
        .\g_rd.gvalid_low.rd_dc_i_reg[3]_0 (\g_rd.gvalid_low.rd_dc_i_reg [3]),
        .\g_rd.gvalid_low.rd_dc_i_reg[4]_0 (\g_rd.gvalid_low.rd_dc_i_reg [4]),
        .\g_rd.gvalid_low.rd_dc_i_reg[5]_0 (\g_rd.gvalid_low.rd_dc_i_reg [5]),
        .\g_rd.gvalid_low.rd_dc_i_reg[6]_0 (\g_rd.gvalid_low.rd_dc_i_reg [6]),
        .\g_rd.gvalid_low.rd_dc_i_reg[7]_0 (\g_rd.gvalid_low.rd_dc_i_reg [7]),
        .\g_rd.gvalid_low.rd_dc_i_reg[8]_0 (\g_rd.gvalid_low.rd_dc_i_reg [8]),
        .\g_rd.gvalid_low.rd_dc_i_reg[9]_0 (\g_rd.gvalid_low.rd_dc_i_reg [9]),
        .m_aclk(m_aclk),
        .rd_dc_i(rd_dc_i));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_rd_pe_as \gras.gpe.rdpe 
       (.DI({DI,rpntr_n_0}),
        .S({rpntr_n_16,rpntr_n_17,rpntr_n_18,rpntr_n_19}),
        .axis_prog_empty(axis_prog_empty),
        .\gdiff.diff_pntr_pad_reg[8]_0 (\gdiff.diff_pntr_pad_reg[8] ),
        .\gdiff.diff_pntr_pad_reg[8]_1 ({rpntr_n_20,rpntr_n_21,rpntr_n_22,rpntr_n_23}),
        .\gdiff.diff_pntr_pad_reg[9]_0 (rpntr_n_15),
        .\gpe1.prog_empty_i_reg_0 (\gc0.count_d1_reg ),
        .m_aclk(m_aclk),
        .out(empty_fb_i));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_rd_status_flags_as \gras.rsts 
       (.m_aclk(m_aclk),
        .out(empty_fb_i),
        .ram_empty_fb_i_reg_0(ram_empty_fb_i_reg),
        .ram_empty_fb_i_reg_1(ram_empty_fb_i_reg_0),
        .ram_empty_fb_i_reg_2(\gc0.count_d1_reg ),
        .ram_rd_en(ram_rd_en),
        .v1_reg(v1_reg),
        .v1_reg_0(\c1/v1_reg ));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_rd_bin_cntr rpntr
       (.DI(rpntr_n_0),
        .Q(Q),
        .S({rpntr_n_16,rpntr_n_17,rpntr_n_18,rpntr_n_19}),
        .WR_PNTR_RD(WR_PNTR_RD),
        .\gc0.count_d1_reg[0]_0 (\gc0.count_d1_reg ),
        .\gc0.count_d1_reg[6]_0 ({rpntr_n_20,rpntr_n_21,rpntr_n_22,rpntr_n_23}),
        .\gc0.count_d1_reg[7]_0 (rpntr_n_15),
        .\gc0.count_reg[8]_0 (\gc0.count_reg[8] ),
        .m_aclk(m_aclk),
        .ram_rd_en(ram_rd_en),
        .v1_reg(\c1/v1_reg ));
endmodule

(* ORIG_REF_NAME = "rd_pe_as" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_rd_pe_as
   (axis_prog_empty,
    \gpe1.prog_empty_i_reg_0 ,
    m_aclk,
    out,
    DI,
    S,
    \gdiff.diff_pntr_pad_reg[8]_0 ,
    \gdiff.diff_pntr_pad_reg[8]_1 ,
    \gdiff.diff_pntr_pad_reg[9]_0 );
  output axis_prog_empty;
  input \gpe1.prog_empty_i_reg_0 ;
  input m_aclk;
  input out;
  input [2:0]DI;
  input [3:0]S;
  input [3:0]\gdiff.diff_pntr_pad_reg[8]_0 ;
  input [3:0]\gdiff.diff_pntr_pad_reg[8]_1 ;
  input [0:0]\gdiff.diff_pntr_pad_reg[9]_0 ;

  wire [2:0]DI;
  wire [3:0]S;
  wire axis_prog_empty;
  wire [9:1]diff_pntr_pad;
  wire [3:0]\gdiff.diff_pntr_pad_reg[8]_0 ;
  wire [3:0]\gdiff.diff_pntr_pad_reg[8]_1 ;
  wire [0:0]\gdiff.diff_pntr_pad_reg[9]_0 ;
  wire \gpe1.prog_empty_i_i_1_n_0 ;
  wire \gpe1.prog_empty_i_i_2_n_0 ;
  wire \gpe1.prog_empty_i_i_3_n_0 ;
  wire \gpe1.prog_empty_i_reg_0 ;
  wire m_aclk;
  wire out;
  wire [9:1]plusOp;
  wire plusOp__0_carry__0_n_0;
  wire plusOp__0_carry__0_n_1;
  wire plusOp__0_carry__0_n_2;
  wire plusOp__0_carry__0_n_3;
  wire plusOp__0_carry_n_0;
  wire plusOp__0_carry_n_1;
  wire plusOp__0_carry_n_2;
  wire plusOp__0_carry_n_3;
  wire [3:0]NLW_plusOp__0_carry__1_CO_UNCONNECTED;
  wire [3:1]NLW_plusOp__0_carry__1_O_UNCONNECTED;

  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[1] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(plusOp[1]),
        .Q(diff_pntr_pad[1]),
        .R(\gpe1.prog_empty_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[2] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(plusOp[2]),
        .Q(diff_pntr_pad[2]),
        .R(\gpe1.prog_empty_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[3] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(plusOp[3]),
        .Q(diff_pntr_pad[3]),
        .R(\gpe1.prog_empty_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[4] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(plusOp[4]),
        .Q(diff_pntr_pad[4]),
        .R(\gpe1.prog_empty_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[5] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(plusOp[5]),
        .Q(diff_pntr_pad[5]),
        .R(\gpe1.prog_empty_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[6] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(plusOp[6]),
        .Q(diff_pntr_pad[6]),
        .R(\gpe1.prog_empty_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[7] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(plusOp[7]),
        .Q(diff_pntr_pad[7]),
        .R(\gpe1.prog_empty_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[8] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(plusOp[8]),
        .Q(diff_pntr_pad[8]),
        .R(\gpe1.prog_empty_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[9] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(plusOp[9]),
        .Q(diff_pntr_pad[9]),
        .R(\gpe1.prog_empty_i_reg_0 ));
  LUT6 #(
    .INIT(64'h8888888888888BBB)) 
    \gpe1.prog_empty_i_i_1 
       (.I0(axis_prog_empty),
        .I1(out),
        .I2(diff_pntr_pad[1]),
        .I3(diff_pntr_pad[2]),
        .I4(\gpe1.prog_empty_i_i_2_n_0 ),
        .I5(\gpe1.prog_empty_i_i_3_n_0 ),
        .O(\gpe1.prog_empty_i_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \gpe1.prog_empty_i_i_2 
       (.I0(diff_pntr_pad[7]),
        .I1(diff_pntr_pad[6]),
        .I2(diff_pntr_pad[9]),
        .I3(diff_pntr_pad[8]),
        .O(\gpe1.prog_empty_i_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \gpe1.prog_empty_i_i_3 
       (.I0(diff_pntr_pad[3]),
        .I1(diff_pntr_pad[5]),
        .I2(diff_pntr_pad[4]),
        .O(\gpe1.prog_empty_i_i_3_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \gpe1.prog_empty_i_reg 
       (.C(m_aclk),
        .CE(1'b1),
        .D(\gpe1.prog_empty_i_i_1_n_0 ),
        .Q(axis_prog_empty),
        .S(\gpe1.prog_empty_i_reg_0 ));
  CARRY4 plusOp__0_carry
       (.CI(1'b0),
        .CO({plusOp__0_carry_n_0,plusOp__0_carry_n_1,plusOp__0_carry_n_2,plusOp__0_carry_n_3}),
        .CYINIT(1'b0),
        .DI({DI,1'b0}),
        .O(plusOp[4:1]),
        .S(S));
  CARRY4 plusOp__0_carry__0
       (.CI(plusOp__0_carry_n_0),
        .CO({plusOp__0_carry__0_n_0,plusOp__0_carry__0_n_1,plusOp__0_carry__0_n_2,plusOp__0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(\gdiff.diff_pntr_pad_reg[8]_0 ),
        .O(plusOp[8:5]),
        .S(\gdiff.diff_pntr_pad_reg[8]_1 ));
  CARRY4 plusOp__0_carry__1
       (.CI(plusOp__0_carry__0_n_0),
        .CO(NLW_plusOp__0_carry__1_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_plusOp__0_carry__1_O_UNCONNECTED[3:1],plusOp[9]}),
        .S({1'b0,1'b0,1'b0,\gdiff.diff_pntr_pad_reg[9]_0 }));
endmodule

(* ORIG_REF_NAME = "rd_status_flags_as" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_rd_status_flags_as
   (m_aclk,
    out,
    ram_empty_fb_i_reg_0,
    ram_empty_fb_i_reg_2,
    ram_rd_en,
    ram_empty_fb_i_reg_1,
    v1_reg,
    v1_reg_0);
  input m_aclk;
  output out;
  input ram_empty_fb_i_reg_0;
  input ram_empty_fb_i_reg_2;
  input ram_rd_en;
  input [0:0]ram_empty_fb_i_reg_1;
  input [3:0]v1_reg;
  input [3:0]v1_reg_0;

  wire c0_n_0;
  wire comp1;
  wire m_aclk;
  (* DONT_TOUCH *) wire ram_empty_fb_i;
  wire ram_empty_fb_i_reg_0;
  wire [0:0]ram_empty_fb_i_reg_1;
  wire ram_empty_fb_i_reg_2;
  (* DONT_TOUCH *) wire ram_empty_i;
  wire ram_rd_en;
  wire [3:0]v1_reg;
  wire [3:0]v1_reg_0;

  assign out = ram_empty_fb_i;
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_compare_1 c0
       (.comp1(comp1),
        .ram_empty_fb_i_reg(c0_n_0),
        .ram_empty_fb_i_reg_0(ram_empty_fb_i_reg_0),
        .ram_rd_en(ram_rd_en),
        .v1_reg(v1_reg));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_compare_2 c1
       (.comp1(comp1),
        .ram_empty_fb_i_reg(ram_empty_fb_i_reg_1),
        .v1_reg_0(v1_reg_0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    ram_empty_fb_i_reg
       (.C(m_aclk),
        .CE(1'b1),
        .D(c0_n_0),
        .Q(ram_empty_fb_i),
        .S(ram_empty_fb_i_reg_2));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    ram_empty_i_reg
       (.C(m_aclk),
        .CE(1'b1),
        .D(c0_n_0),
        .Q(ram_empty_i),
        .S(ram_empty_fb_i_reg_2));
endmodule

(* ORIG_REF_NAME = "reset_blk_ramfifo" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_reset_blk_ramfifo
   (m_aclk,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg_0 ,
    out,
    s_aclk,
    s_aresetn,
    wr_rst_busy);
  input m_aclk;
  output \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ;
  output \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg_0 ;
  output out;
  input s_aclk;
  input s_aresetn;
  output wr_rst_busy;

  wire arst_sync_rd_rst;
  wire dest_out;
  wire dest_rst;
  wire inverted_reset;
  wire m_aclk;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_i_1_n_0 ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_i_1_n_0 ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg_0 ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_i_1_n_0 ;
  (* DONT_TOUCH *) wire [2:0]rd_rst_reg;
  wire [3:0]rd_rst_wr_ext;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_d1;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_d2;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_d3;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_d4;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_d5;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_d6;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_d7;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_rd_reg1;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_rd_reg2;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_wr_reg1;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_wr_reg2;
  wire s_aclk;
  wire s_aresetn;
  wire sckt_rd_rst_wr;
  wire wr_rst_busy_i;
  wire [1:0]wr_rst_rd_ext;
  (* DONT_TOUCH *) wire [2:0]wr_rst_reg;

  assign out = rst_d3;
  assign wr_rst_busy = wr_rst_busy_i;
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \grstd1.grst_full.grst_f.rst_d1_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(wr_rst_busy_i),
        .Q(rst_d1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \grstd1.grst_full.grst_f.rst_d2_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(rst_d1),
        .Q(rst_d2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDSE #(
    .INIT(1'b1)) 
    \grstd1.grst_full.grst_f.rst_d3_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(rst_d2),
        .Q(rst_d3),
        .S(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg_0 ));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \grstd1.grst_full.grst_f.rst_d4_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(rst_d3),
        .Q(rst_d4),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(1'b0),
        .O(rst_wr_reg2));
  LUT1 #(
    .INIT(2'h2)) 
    i_1
       (.I0(1'b1),
        .O(wr_rst_reg[2]));
  LUT1 #(
    .INIT(2'h2)) 
    i_10
       (.I0(1'b1),
        .O(rst_d5));
  LUT1 #(
    .INIT(2'h2)) 
    i_11
       (.I0(1'b1),
        .O(rst_d6));
  LUT1 #(
    .INIT(2'h2)) 
    i_12
       (.I0(1'b1),
        .O(rst_d7));
  LUT1 #(
    .INIT(2'h2)) 
    i_2
       (.I0(1'b1),
        .O(wr_rst_reg[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_3
       (.I0(1'b1),
        .O(wr_rst_reg[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_4
       (.I0(1'b1),
        .O(rd_rst_reg[2]));
  LUT1 #(
    .INIT(2'h2)) 
    i_5
       (.I0(1'b1),
        .O(rd_rst_reg[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_6
       (.I0(1'b1),
        .O(rd_rst_reg[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_7
       (.I0(1'b0),
        .O(rst_wr_reg1));
  LUT1 #(
    .INIT(2'h2)) 
    i_8
       (.I0(1'b0),
        .O(rst_rd_reg1));
  LUT1 #(
    .INIT(2'h2)) 
    i_9
       (.I0(1'b0),
        .O(rst_rd_reg2));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.rd_rst_wr_ext_reg[0] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(sckt_rd_rst_wr),
        .Q(rd_rst_wr_ext[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.rd_rst_wr_ext_reg[1] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(rd_rst_wr_ext[0]),
        .Q(rd_rst_wr_ext[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.rd_rst_wr_ext_reg[2] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(rd_rst_wr_ext[1]),
        .Q(rd_rst_wr_ext[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.rd_rst_wr_ext_reg[3] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(rd_rst_wr_ext[2]),
        .Q(rd_rst_wr_ext[3]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hF4)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_i_1 
       (.I0(wr_rst_rd_ext[1]),
        .I1(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ),
        .I2(arst_sync_rd_rst),
        .O(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg 
       (.C(m_aclk),
        .CE(1'b1),
        .D(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_i_1_n_0 ),
        .Q(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hFF8A)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_i_1 
       (.I0(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg_0 ),
        .I1(rd_rst_wr_ext[0]),
        .I2(rd_rst_wr_ext[1]),
        .I3(dest_rst),
        .O(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_i_1_n_0 ),
        .Q(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg_0 ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFFFD0F0D0D0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_i_1 
       (.I0(rd_rst_wr_ext[3]),
        .I1(rd_rst_wr_ext[2]),
        .I2(wr_rst_busy_i),
        .I3(rd_rst_wr_ext[0]),
        .I4(rd_rst_wr_ext[1]),
        .I5(dest_rst),
        .O(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_i_1_n_0 ),
        .Q(wr_rst_busy_i),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_rd_ext_reg[0] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(dest_out),
        .Q(wr_rst_rd_ext[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_rd_ext_reg[1] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(wr_rst_rd_ext[0]),
        .Q(wr_rst_rd_ext[1]),
        .R(1'b0));
  (* DEST_SYNC_FF = "5" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* SRC_INPUT_REG = "0" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SINGLE" *) 
  (* XPM_MODULE = "TRUE" *) 
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_xpm_cdc_single \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_single_inst_rrst_wr 
       (.dest_clk(s_aclk),
        .dest_out(sckt_rd_rst_wr),
        .src_clk(m_aclk),
        .src_in(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ));
  (* DEST_SYNC_FF = "5" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* SRC_INPUT_REG = "0" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SINGLE" *) 
  (* XPM_MODULE = "TRUE" *) 
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_xpm_cdc_single__2 \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_single_inst_wrst_rd 
       (.dest_clk(m_aclk),
        .dest_out(dest_out),
        .src_clk(s_aclk),
        .src_in(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg_0 ));
  (* DEF_VAL = "1'b1" *) 
  (* DEST_SYNC_FF = "5" *) 
  (* INIT = "1" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  (* XPM_MODULE = "TRUE" *) 
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_xpm_cdc_sync_rst \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_sync_rst_inst_wrst 
       (.dest_clk(m_aclk),
        .dest_rst(arst_sync_rd_rst),
        .src_rst(inverted_reset));
  (* DEF_VAL = "1'b1" *) 
  (* DEST_SYNC_FF = "5" *) 
  (* INIT = "1" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  (* XPM_MODULE = "TRUE" *) 
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_xpm_cdc_sync_rst__2 \ngwrdrst.grst.g7serrst.gsckt_wrst.xpm_cdc_sync_rst_inst_wrst 
       (.dest_clk(s_aclk),
        .dest_rst(dest_rst),
        .src_rst(inverted_reset));
  LUT1 #(
    .INIT(2'h1)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.xpm_cdc_sync_rst_inst_wrst_i_1 
       (.I0(s_aresetn),
        .O(inverted_reset));
endmodule

(* ORIG_REF_NAME = "wr_bin_cntr" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_wr_bin_cntr
   (\gic0.gc0.count_d1_reg[1]_0 ,
    out,
    s_aclk,
    s_axis_tvalid,
    DI,
    E,
    Q,
    RD_PNTR_WR,
    S,
    \gic0.gc0.count_d1_reg[0]_0 ,
    \gic0.gc0.count_d1_reg[6]_0 ,
    \gic0.gc0.count_d1_reg[8]_0 ,
    \gic0.gc0.count_d2_reg[7]_0 ,
    \gic0.gc0.count_d2_reg[8]_0 ,
    \gic0.gc0.count_reg[7]_0 ,
    v1_reg,
    v1_reg_0);
  input \gic0.gc0.count_d1_reg[1]_0 ;
  input out;
  input s_aclk;
  input s_axis_tvalid;
  output [1:0]DI;
  input [0:0]E;
  output [8:0]Q;
  input [8:0]RD_PNTR_WR;
  output [3:0]S;
  output [1:0]\gic0.gc0.count_d1_reg[0]_0 ;
  output [3:0]\gic0.gc0.count_d1_reg[6]_0 ;
  output [8:0]\gic0.gc0.count_d1_reg[8]_0 ;
  output [3:0]\gic0.gc0.count_d2_reg[7]_0 ;
  output [0:0]\gic0.gc0.count_d2_reg[8]_0 ;
  output [7:0]\gic0.gc0.count_reg[7]_0 ;
  output [0:0]v1_reg;
  output [0:0]v1_reg_0;

  wire [1:0]DI;
  wire [0:0]E;
  wire [8:0]Q;
  wire [8:0]RD_PNTR_WR;
  wire [3:0]S;
  wire \gic0.gc0.count[8]_i_2_n_0 ;
  wire [1:0]\gic0.gc0.count_d1_reg[0]_0 ;
  wire \gic0.gc0.count_d1_reg[1]_0 ;
  wire [3:0]\gic0.gc0.count_d1_reg[6]_0 ;
  wire [8:0]\gic0.gc0.count_d1_reg[8]_0 ;
  wire [3:0]\gic0.gc0.count_d2_reg[7]_0 ;
  wire [0:0]\gic0.gc0.count_d2_reg[8]_0 ;
  wire [7:0]\gic0.gc0.count_reg[7]_0 ;
  wire out;
  wire [8:0]plusOp__0;
  wire s_aclk;
  wire s_axis_tvalid;
  wire [0:0]v1_reg;
  wire [0:0]v1_reg_0;
  wire [8:8]wr_pntr_plus2;

  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \gic0.gc0.count[0]_i_1 
       (.I0(\gic0.gc0.count_reg[7]_0 [0]),
        .O(plusOp__0[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \gic0.gc0.count[1]_i_1 
       (.I0(\gic0.gc0.count_reg[7]_0 [0]),
        .I1(\gic0.gc0.count_reg[7]_0 [1]),
        .O(plusOp__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \gic0.gc0.count[2]_i_1 
       (.I0(\gic0.gc0.count_reg[7]_0 [0]),
        .I1(\gic0.gc0.count_reg[7]_0 [1]),
        .I2(\gic0.gc0.count_reg[7]_0 [2]),
        .O(plusOp__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \gic0.gc0.count[3]_i_1 
       (.I0(\gic0.gc0.count_reg[7]_0 [1]),
        .I1(\gic0.gc0.count_reg[7]_0 [0]),
        .I2(\gic0.gc0.count_reg[7]_0 [2]),
        .I3(\gic0.gc0.count_reg[7]_0 [3]),
        .O(plusOp__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \gic0.gc0.count[4]_i_1 
       (.I0(\gic0.gc0.count_reg[7]_0 [2]),
        .I1(\gic0.gc0.count_reg[7]_0 [0]),
        .I2(\gic0.gc0.count_reg[7]_0 [1]),
        .I3(\gic0.gc0.count_reg[7]_0 [3]),
        .I4(\gic0.gc0.count_reg[7]_0 [4]),
        .O(plusOp__0[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \gic0.gc0.count[5]_i_1 
       (.I0(\gic0.gc0.count_reg[7]_0 [3]),
        .I1(\gic0.gc0.count_reg[7]_0 [1]),
        .I2(\gic0.gc0.count_reg[7]_0 [0]),
        .I3(\gic0.gc0.count_reg[7]_0 [2]),
        .I4(\gic0.gc0.count_reg[7]_0 [4]),
        .I5(\gic0.gc0.count_reg[7]_0 [5]),
        .O(plusOp__0[5]));
  LUT2 #(
    .INIT(4'h6)) 
    \gic0.gc0.count[6]_i_1 
       (.I0(\gic0.gc0.count[8]_i_2_n_0 ),
        .I1(\gic0.gc0.count_reg[7]_0 [6]),
        .O(plusOp__0[6]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \gic0.gc0.count[7]_i_1 
       (.I0(\gic0.gc0.count[8]_i_2_n_0 ),
        .I1(\gic0.gc0.count_reg[7]_0 [6]),
        .I2(\gic0.gc0.count_reg[7]_0 [7]),
        .O(plusOp__0[7]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \gic0.gc0.count[8]_i_1 
       (.I0(\gic0.gc0.count_reg[7]_0 [6]),
        .I1(\gic0.gc0.count[8]_i_2_n_0 ),
        .I2(\gic0.gc0.count_reg[7]_0 [7]),
        .I3(wr_pntr_plus2),
        .O(plusOp__0[8]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \gic0.gc0.count[8]_i_2 
       (.I0(\gic0.gc0.count_reg[7]_0 [5]),
        .I1(\gic0.gc0.count_reg[7]_0 [3]),
        .I2(\gic0.gc0.count_reg[7]_0 [1]),
        .I3(\gic0.gc0.count_reg[7]_0 [0]),
        .I4(\gic0.gc0.count_reg[7]_0 [2]),
        .I5(\gic0.gc0.count_reg[7]_0 [4]),
        .O(\gic0.gc0.count[8]_i_2_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \gic0.gc0.count_d1_reg[0] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_reg[7]_0 [0]),
        .Q(\gic0.gc0.count_d1_reg[8]_0 [0]),
        .S(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[1] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_reg[7]_0 [1]),
        .Q(\gic0.gc0.count_d1_reg[8]_0 [1]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[2] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_reg[7]_0 [2]),
        .Q(\gic0.gc0.count_d1_reg[8]_0 [2]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[3] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_reg[7]_0 [3]),
        .Q(\gic0.gc0.count_d1_reg[8]_0 [3]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[4] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_reg[7]_0 [4]),
        .Q(\gic0.gc0.count_d1_reg[8]_0 [4]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[5] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_reg[7]_0 [5]),
        .Q(\gic0.gc0.count_d1_reg[8]_0 [5]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[6] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_reg[7]_0 [6]),
        .Q(\gic0.gc0.count_d1_reg[8]_0 [6]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[7] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_reg[7]_0 [7]),
        .Q(\gic0.gc0.count_d1_reg[8]_0 [7]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[8] 
       (.C(s_aclk),
        .CE(E),
        .D(wr_pntr_plus2),
        .Q(\gic0.gc0.count_d1_reg[8]_0 [8]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[0] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_d1_reg[8]_0 [0]),
        .Q(Q[0]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[1] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_d1_reg[8]_0 [1]),
        .Q(Q[1]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[2] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_d1_reg[8]_0 [2]),
        .Q(Q[2]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[3] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_d1_reg[8]_0 [3]),
        .Q(Q[3]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[4] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_d1_reg[8]_0 [4]),
        .Q(Q[4]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[5] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_d1_reg[8]_0 [5]),
        .Q(Q[5]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[6] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_d1_reg[8]_0 [6]),
        .Q(Q[6]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[7] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_d1_reg[8]_0 [7]),
        .Q(Q[7]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[8] 
       (.C(s_aclk),
        .CE(E),
        .D(\gic0.gc0.count_d1_reg[8]_0 [8]),
        .Q(Q[8]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[0] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__0[0]),
        .Q(\gic0.gc0.count_reg[7]_0 [0]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \gic0.gc0.count_reg[1] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__0[1]),
        .Q(\gic0.gc0.count_reg[7]_0 [1]),
        .S(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[2] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__0[2]),
        .Q(\gic0.gc0.count_reg[7]_0 [2]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[3] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__0[3]),
        .Q(\gic0.gc0.count_reg[7]_0 [3]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[4] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__0[4]),
        .Q(\gic0.gc0.count_reg[7]_0 [4]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[5] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__0[5]),
        .Q(\gic0.gc0.count_reg[7]_0 [5]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[6] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__0[6]),
        .Q(\gic0.gc0.count_reg[7]_0 [6]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[7] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__0[7]),
        .Q(\gic0.gc0.count_reg[7]_0 [7]),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[8] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__0[8]),
        .Q(wr_pntr_plus2),
        .R(\gic0.gc0.count_d1_reg[1]_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[4].gms.ms_i_1 
       (.I0(wr_pntr_plus2),
        .I1(RD_PNTR_WR[8]),
        .O(v1_reg_0));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[4].gms.ms_i_1__2 
       (.I0(\gic0.gc0.count_d1_reg[8]_0 [8]),
        .I1(RD_PNTR_WR[8]),
        .O(v1_reg));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry__0_i_1
       (.I0(Q[7]),
        .I1(RD_PNTR_WR[7]),
        .O(\gic0.gc0.count_d2_reg[7]_0 [3]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry__0_i_2
       (.I0(Q[6]),
        .I1(RD_PNTR_WR[6]),
        .O(\gic0.gc0.count_d2_reg[7]_0 [2]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry__0_i_3
       (.I0(Q[5]),
        .I1(RD_PNTR_WR[5]),
        .O(\gic0.gc0.count_d2_reg[7]_0 [1]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry__0_i_4
       (.I0(Q[4]),
        .I1(RD_PNTR_WR[4]),
        .O(\gic0.gc0.count_d2_reg[7]_0 [0]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry__1_i_1
       (.I0(Q[8]),
        .I1(RD_PNTR_WR[8]),
        .O(\gic0.gc0.count_d2_reg[8]_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry_i_1
       (.I0(Q[3]),
        .I1(RD_PNTR_WR[3]),
        .O(S[3]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry_i_2
       (.I0(Q[2]),
        .I1(RD_PNTR_WR[2]),
        .O(S[2]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry_i_3
       (.I0(Q[1]),
        .I1(RD_PNTR_WR[1]),
        .O(S[1]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry_i_4
       (.I0(Q[0]),
        .I1(RD_PNTR_WR[0]),
        .O(S[0]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry__0_i_1
       (.I0(\gic0.gc0.count_d1_reg[8]_0 [6]),
        .I1(RD_PNTR_WR[6]),
        .O(\gic0.gc0.count_d1_reg[6]_0 [3]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry__0_i_2
       (.I0(\gic0.gc0.count_d1_reg[8]_0 [5]),
        .I1(RD_PNTR_WR[5]),
        .O(\gic0.gc0.count_d1_reg[6]_0 [2]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry__0_i_3
       (.I0(\gic0.gc0.count_d1_reg[8]_0 [4]),
        .I1(RD_PNTR_WR[4]),
        .O(\gic0.gc0.count_d1_reg[6]_0 [1]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry__0_i_4
       (.I0(\gic0.gc0.count_d1_reg[8]_0 [3]),
        .I1(RD_PNTR_WR[3]),
        .O(\gic0.gc0.count_d1_reg[6]_0 [0]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry_i_1
       (.I0(\gic0.gc0.count_d1_reg[8]_0 [2]),
        .I1(RD_PNTR_WR[2]),
        .O(DI[1]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry_i_2
       (.I0(\gic0.gc0.count_d1_reg[8]_0 [1]),
        .I1(RD_PNTR_WR[1]),
        .O(DI[0]));
  LUT6 #(
    .INIT(64'hF75108AE08AEF751)) 
    plusOp__0_carry_i_6
       (.I0(\gic0.gc0.count_d1_reg[8]_0 [0]),
        .I1(s_axis_tvalid),
        .I2(out),
        .I3(RD_PNTR_WR[0]),
        .I4(\gic0.gc0.count_d1_reg[8]_0 [1]),
        .I5(RD_PNTR_WR[1]),
        .O(\gic0.gc0.count_d1_reg[0]_0 [1]));
  LUT4 #(
    .INIT(16'h9969)) 
    plusOp__0_carry_i_7
       (.I0(\gic0.gc0.count_d1_reg[8]_0 [0]),
        .I1(RD_PNTR_WR[0]),
        .I2(s_axis_tvalid),
        .I3(out),
        .O(\gic0.gc0.count_d1_reg[0]_0 [0]));
endmodule

(* ORIG_REF_NAME = "wr_dc_fwft_ext_as" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_wr_dc_fwft_ext_as
   (s_aclk,
    \wr_data_count_i_reg[0]_0 ,
    Q,
    S,
    axis_wr_data_count,
    \wr_data_count_i_reg[7]_0 ,
    \wr_data_count_i_reg[8]_0 );
  input s_aclk;
  input \wr_data_count_i_reg[0]_0 ;
  input [7:0]Q;
  input [3:0]S;
  output [9:0]axis_wr_data_count;
  input [3:0]\wr_data_count_i_reg[7]_0 ;
  input [0:0]\wr_data_count_i_reg[8]_0 ;

  wire [7:0]Q;
  wire [3:0]S;
  wire [9:0]axis_wr_data_count;
  wire minusOp_carry__0_n_0;
  wire minusOp_carry__0_n_1;
  wire minusOp_carry__0_n_2;
  wire minusOp_carry__0_n_3;
  wire minusOp_carry__0_n_4;
  wire minusOp_carry__0_n_5;
  wire minusOp_carry__0_n_6;
  wire minusOp_carry__0_n_7;
  wire minusOp_carry__1_n_7;
  wire minusOp_carry_n_0;
  wire minusOp_carry_n_1;
  wire minusOp_carry_n_2;
  wire minusOp_carry_n_3;
  wire minusOp_carry_n_4;
  wire minusOp_carry_n_5;
  wire minusOp_carry_n_6;
  wire minusOp_carry_n_7;
  wire s_aclk;
  wire \wr_data_count_i[1]_i_1_n_0 ;
  wire \wr_data_count_i[2]_i_1_n_0 ;
  wire \wr_data_count_i[3]_i_1_n_0 ;
  wire \wr_data_count_i[4]_i_1_n_0 ;
  wire \wr_data_count_i[5]_i_1_n_0 ;
  wire \wr_data_count_i[6]_i_1_n_0 ;
  wire \wr_data_count_i[7]_i_1_n_0 ;
  wire \wr_data_count_i[8]_i_1_n_0 ;
  wire \wr_data_count_i[9]_i_1_n_0 ;
  wire \wr_data_count_i[9]_i_2_n_0 ;
  wire \wr_data_count_i_reg[0]_0 ;
  wire [3:0]\wr_data_count_i_reg[7]_0 ;
  wire [0:0]\wr_data_count_i_reg[8]_0 ;
  wire [3:0]NLW_minusOp_carry__1_CO_UNCONNECTED;
  wire [3:1]NLW_minusOp_carry__1_O_UNCONNECTED;

  CARRY4 minusOp_carry
       (.CI(1'b0),
        .CO({minusOp_carry_n_0,minusOp_carry_n_1,minusOp_carry_n_2,minusOp_carry_n_3}),
        .CYINIT(1'b1),
        .DI(Q[3:0]),
        .O({minusOp_carry_n_4,minusOp_carry_n_5,minusOp_carry_n_6,minusOp_carry_n_7}),
        .S(S));
  CARRY4 minusOp_carry__0
       (.CI(minusOp_carry_n_0),
        .CO({minusOp_carry__0_n_0,minusOp_carry__0_n_1,minusOp_carry__0_n_2,minusOp_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(Q[7:4]),
        .O({minusOp_carry__0_n_4,minusOp_carry__0_n_5,minusOp_carry__0_n_6,minusOp_carry__0_n_7}),
        .S(\wr_data_count_i_reg[7]_0 ));
  CARRY4 minusOp_carry__1
       (.CI(minusOp_carry__0_n_0),
        .CO(NLW_minusOp_carry__1_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_minusOp_carry__1_O_UNCONNECTED[3:1],minusOp_carry__1_n_7}),
        .S({1'b0,1'b0,1'b0,\wr_data_count_i_reg[8]_0 }));
  LUT1 #(
    .INIT(2'h1)) 
    \wr_data_count_i[1]_i_1 
       (.I0(minusOp_carry_n_6),
        .O(\wr_data_count_i[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \wr_data_count_i[2]_i_1 
       (.I0(minusOp_carry_n_6),
        .I1(minusOp_carry_n_5),
        .O(\wr_data_count_i[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \wr_data_count_i[3]_i_1 
       (.I0(minusOp_carry_n_6),
        .I1(minusOp_carry_n_5),
        .I2(minusOp_carry_n_4),
        .O(\wr_data_count_i[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \wr_data_count_i[4]_i_1 
       (.I0(minusOp_carry_n_5),
        .I1(minusOp_carry_n_6),
        .I2(minusOp_carry_n_4),
        .I3(minusOp_carry__0_n_7),
        .O(\wr_data_count_i[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \wr_data_count_i[5]_i_1 
       (.I0(minusOp_carry_n_4),
        .I1(minusOp_carry_n_6),
        .I2(minusOp_carry_n_5),
        .I3(minusOp_carry__0_n_7),
        .I4(minusOp_carry__0_n_6),
        .O(\wr_data_count_i[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \wr_data_count_i[6]_i_1 
       (.I0(minusOp_carry__0_n_7),
        .I1(minusOp_carry_n_5),
        .I2(minusOp_carry_n_6),
        .I3(minusOp_carry_n_4),
        .I4(minusOp_carry__0_n_6),
        .I5(minusOp_carry__0_n_5),
        .O(\wr_data_count_i[6]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \wr_data_count_i[7]_i_1 
       (.I0(\wr_data_count_i[9]_i_2_n_0 ),
        .I1(minusOp_carry__0_n_4),
        .O(\wr_data_count_i[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \wr_data_count_i[8]_i_1 
       (.I0(\wr_data_count_i[9]_i_2_n_0 ),
        .I1(minusOp_carry__0_n_4),
        .I2(minusOp_carry__1_n_7),
        .O(\wr_data_count_i[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \wr_data_count_i[9]_i_1 
       (.I0(minusOp_carry__1_n_7),
        .I1(\wr_data_count_i[9]_i_2_n_0 ),
        .I2(minusOp_carry__0_n_4),
        .O(\wr_data_count_i[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \wr_data_count_i[9]_i_2 
       (.I0(minusOp_carry__0_n_5),
        .I1(minusOp_carry__0_n_7),
        .I2(minusOp_carry_n_5),
        .I3(minusOp_carry_n_6),
        .I4(minusOp_carry_n_4),
        .I5(minusOp_carry__0_n_6),
        .O(\wr_data_count_i[9]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[0] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(minusOp_carry_n_7),
        .Q(axis_wr_data_count[0]),
        .R(\wr_data_count_i_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[1] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\wr_data_count_i[1]_i_1_n_0 ),
        .Q(axis_wr_data_count[1]),
        .R(\wr_data_count_i_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[2] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\wr_data_count_i[2]_i_1_n_0 ),
        .Q(axis_wr_data_count[2]),
        .R(\wr_data_count_i_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[3] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\wr_data_count_i[3]_i_1_n_0 ),
        .Q(axis_wr_data_count[3]),
        .R(\wr_data_count_i_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[4] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\wr_data_count_i[4]_i_1_n_0 ),
        .Q(axis_wr_data_count[4]),
        .R(\wr_data_count_i_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[5] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\wr_data_count_i[5]_i_1_n_0 ),
        .Q(axis_wr_data_count[5]),
        .R(\wr_data_count_i_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[6] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\wr_data_count_i[6]_i_1_n_0 ),
        .Q(axis_wr_data_count[6]),
        .R(\wr_data_count_i_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[7] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\wr_data_count_i[7]_i_1_n_0 ),
        .Q(axis_wr_data_count[7]),
        .R(\wr_data_count_i_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[8] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\wr_data_count_i[8]_i_1_n_0 ),
        .Q(axis_wr_data_count[8]),
        .R(\wr_data_count_i_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[9] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\wr_data_count_i[9]_i_1_n_0 ),
        .Q(axis_wr_data_count[9]),
        .R(\wr_data_count_i_reg[0]_0 ));
endmodule

(* ORIG_REF_NAME = "wr_logic" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_wr_logic
   (axis_prog_full,
    \gic0.gc0.count_d1_reg ,
    out,
    ram_full_fb_i_reg,
    s_aclk,
    s_axis_tready,
    s_axis_tvalid,
    E,
    Q,
    RD_PNTR_WR,
    S,
    axis_wr_data_count,
    \gdiff.diff_pntr_pad_reg[4] ,
    \gdiff.diff_pntr_pad_reg[8] ,
    \gic0.gc0.count_d1_reg[8] ,
    \gic0.gc0.count_reg[7] ,
    \gmux.gm[4].gms.ms ,
    \gmux.gm[4].gms.ms_0 );
  output axis_prog_full;
  input [1:1]\gic0.gc0.count_d1_reg ;
  output out;
  input ram_full_fb_i_reg;
  input s_aclk;
  output s_axis_tready;
  input s_axis_tvalid;
  output [0:0]E;
  output [8:0]Q;
  input [8:0]RD_PNTR_WR;
  input [0:0]S;
  output [9:0]axis_wr_data_count;
  input [1:0]\gdiff.diff_pntr_pad_reg[4] ;
  input [3:0]\gdiff.diff_pntr_pad_reg[8] ;
  output [8:0]\gic0.gc0.count_d1_reg[8] ;
  output [7:0]\gic0.gc0.count_reg[7] ;
  input [3:0]\gmux.gm[4].gms.ms ;
  input [3:0]\gmux.gm[4].gms.ms_0 ;

  wire [0:0]E;
  wire [8:0]Q;
  wire [8:0]RD_PNTR_WR;
  wire [0:0]S;
  wire axis_prog_full;
  wire [9:0]axis_wr_data_count;
  wire [4:4]\c1/v1_reg ;
  wire [4:4]\c2/v1_reg ;
  wire [1:0]\gdiff.diff_pntr_pad_reg[4] ;
  wire [3:0]\gdiff.diff_pntr_pad_reg[8] ;
  wire [1:1]\gic0.gc0.count_d1_reg ;
  wire [8:0]\gic0.gc0.count_d1_reg[8] ;
  wire [7:0]\gic0.gc0.count_reg[7] ;
  wire [3:0]\gmux.gm[4].gms.ms ;
  wire [3:0]\gmux.gm[4].gms.ms_0 ;
  wire \gwas.wsts_n_1 ;
  wire out;
  wire ram_full_fb_i_reg;
  wire s_aclk;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire wpntr_n_0;
  wire wpntr_n_1;
  wire wpntr_n_13;
  wire wpntr_n_14;
  wire wpntr_n_2;
  wire wpntr_n_24;
  wire wpntr_n_25;
  wire wpntr_n_26;
  wire wpntr_n_27;
  wire wpntr_n_28;
  wire wpntr_n_29;
  wire wpntr_n_3;
  wire wpntr_n_30;
  wire wpntr_n_31;
  wire wpntr_n_32;
  wire wpntr_n_43;
  wire wpntr_n_44;

  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_wr_pf_as \gwas.gpf.wrpf 
       (.DI({wpntr_n_13,wpntr_n_14,\gwas.wsts_n_1 }),
        .S({\gdiff.diff_pntr_pad_reg[4] ,wpntr_n_43,wpntr_n_44}),
        .axis_prog_full(axis_prog_full),
        .\gdiff.diff_pntr_pad_reg[2]_0 (\gic0.gc0.count_d1_reg ),
        .\gdiff.diff_pntr_pad_reg[8]_0 ({wpntr_n_24,wpntr_n_25,wpntr_n_26,wpntr_n_27}),
        .\gdiff.diff_pntr_pad_reg[8]_1 (\gdiff.diff_pntr_pad_reg[8] ),
        .\gdiff.diff_pntr_pad_reg[9]_0 (S),
        .\gpf1.prog_full_i_reg_0 (ram_full_fb_i_reg),
        .out(out),
        .s_aclk(s_aclk));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_wr_dc_fwft_ext_as \gwas.gwdc1.wdcext 
       (.Q(Q[7:0]),
        .S({wpntr_n_0,wpntr_n_1,wpntr_n_2,wpntr_n_3}),
        .axis_wr_data_count(axis_wr_data_count),
        .s_aclk(s_aclk),
        .\wr_data_count_i_reg[0]_0 (\gic0.gc0.count_d1_reg ),
        .\wr_data_count_i_reg[7]_0 ({wpntr_n_28,wpntr_n_29,wpntr_n_30,wpntr_n_31}),
        .\wr_data_count_i_reg[8]_0 (wpntr_n_32));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_wr_status_flags_as \gwas.wsts 
       (.DI(\gwas.wsts_n_1 ),
        .E(E),
        .Q(\gic0.gc0.count_d1_reg[8] [0]),
        .RD_PNTR_WR(RD_PNTR_WR[0]),
        .\gmux.gm[4].gms.ms (\gmux.gm[4].gms.ms ),
        .\gmux.gm[4].gms.ms_0 (\gmux.gm[4].gms.ms_0 ),
        .out(out),
        .ram_full_fb_i_reg_0(\gic0.gc0.count_d1_reg ),
        .ram_full_fb_i_reg_1(ram_full_fb_i_reg),
        .s_aclk(s_aclk),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid),
        .v1_reg(\c1/v1_reg ),
        .v1_reg_0(\c2/v1_reg ));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_wr_bin_cntr wpntr
       (.DI({wpntr_n_13,wpntr_n_14}),
        .E(E),
        .Q(Q),
        .RD_PNTR_WR(RD_PNTR_WR),
        .S({wpntr_n_0,wpntr_n_1,wpntr_n_2,wpntr_n_3}),
        .\gic0.gc0.count_d1_reg[0]_0 ({wpntr_n_43,wpntr_n_44}),
        .\gic0.gc0.count_d1_reg[1]_0 (\gic0.gc0.count_d1_reg ),
        .\gic0.gc0.count_d1_reg[6]_0 ({wpntr_n_24,wpntr_n_25,wpntr_n_26,wpntr_n_27}),
        .\gic0.gc0.count_d1_reg[8]_0 (\gic0.gc0.count_d1_reg[8] ),
        .\gic0.gc0.count_d2_reg[7]_0 ({wpntr_n_28,wpntr_n_29,wpntr_n_30,wpntr_n_31}),
        .\gic0.gc0.count_d2_reg[8]_0 (wpntr_n_32),
        .\gic0.gc0.count_reg[7]_0 (\gic0.gc0.count_reg[7] ),
        .out(out),
        .s_aclk(s_aclk),
        .s_axis_tvalid(s_axis_tvalid),
        .v1_reg(\c1/v1_reg ),
        .v1_reg_0(\c2/v1_reg ));
endmodule

(* ORIG_REF_NAME = "wr_pf_as" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_wr_pf_as
   (axis_prog_full,
    \gdiff.diff_pntr_pad_reg[2]_0 ,
    \gpf1.prog_full_i_reg_0 ,
    out,
    s_aclk,
    DI,
    S,
    \gdiff.diff_pntr_pad_reg[8]_0 ,
    \gdiff.diff_pntr_pad_reg[8]_1 ,
    \gdiff.diff_pntr_pad_reg[9]_0 );
  output axis_prog_full;
  input \gdiff.diff_pntr_pad_reg[2]_0 ;
  input \gpf1.prog_full_i_reg_0 ;
  input out;
  input s_aclk;
  input [2:0]DI;
  input [3:0]S;
  input [3:0]\gdiff.diff_pntr_pad_reg[8]_0 ;
  input [3:0]\gdiff.diff_pntr_pad_reg[8]_1 ;
  input [0:0]\gdiff.diff_pntr_pad_reg[9]_0 ;

  wire [2:0]DI;
  wire [3:0]S;
  wire axis_prog_full;
  wire \gdiff.diff_pntr_pad_reg[2]_0 ;
  wire [3:0]\gdiff.diff_pntr_pad_reg[8]_0 ;
  wire [3:0]\gdiff.diff_pntr_pad_reg[8]_1 ;
  wire [0:0]\gdiff.diff_pntr_pad_reg[9]_0 ;
  wire [9:2]\gdiff.diff_pntr_pad_reg_n_0_ ;
  wire \gpf1.prog_full_i_i_1_n_0 ;
  wire \gpf1.prog_full_i_i_2_n_0 ;
  wire \gpf1.prog_full_i_i_3_n_0 ;
  wire \gpf1.prog_full_i_reg_0 ;
  wire out;
  wire plusOp__0_carry__0_n_0;
  wire plusOp__0_carry__0_n_1;
  wire plusOp__0_carry__0_n_2;
  wire plusOp__0_carry__0_n_3;
  wire plusOp__0_carry__0_n_4;
  wire plusOp__0_carry__0_n_5;
  wire plusOp__0_carry__0_n_6;
  wire plusOp__0_carry__0_n_7;
  wire plusOp__0_carry__1_n_7;
  wire plusOp__0_carry_n_0;
  wire plusOp__0_carry_n_1;
  wire plusOp__0_carry_n_2;
  wire plusOp__0_carry_n_3;
  wire plusOp__0_carry_n_4;
  wire plusOp__0_carry_n_5;
  wire plusOp__0_carry_n_6;
  wire s_aclk;
  wire [0:0]NLW_plusOp__0_carry_O_UNCONNECTED;
  wire [3:0]NLW_plusOp__0_carry__1_CO_UNCONNECTED;
  wire [3:1]NLW_plusOp__0_carry__1_O_UNCONNECTED;

  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[2] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp__0_carry_n_6),
        .Q(\gdiff.diff_pntr_pad_reg_n_0_ [2]),
        .R(\gdiff.diff_pntr_pad_reg[2]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[3] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp__0_carry_n_5),
        .Q(\gdiff.diff_pntr_pad_reg_n_0_ [3]),
        .R(\gdiff.diff_pntr_pad_reg[2]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[4] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp__0_carry_n_4),
        .Q(\gdiff.diff_pntr_pad_reg_n_0_ [4]),
        .R(\gdiff.diff_pntr_pad_reg[2]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[5] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp__0_carry__0_n_7),
        .Q(\gdiff.diff_pntr_pad_reg_n_0_ [5]),
        .R(\gdiff.diff_pntr_pad_reg[2]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[6] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp__0_carry__0_n_6),
        .Q(\gdiff.diff_pntr_pad_reg_n_0_ [6]),
        .R(\gdiff.diff_pntr_pad_reg[2]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[7] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp__0_carry__0_n_5),
        .Q(\gdiff.diff_pntr_pad_reg_n_0_ [7]),
        .R(\gdiff.diff_pntr_pad_reg[2]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[8] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp__0_carry__0_n_4),
        .Q(\gdiff.diff_pntr_pad_reg_n_0_ [8]),
        .R(\gdiff.diff_pntr_pad_reg[2]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[9] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(plusOp__0_carry__1_n_7),
        .Q(\gdiff.diff_pntr_pad_reg_n_0_ [9]),
        .R(\gdiff.diff_pntr_pad_reg[2]_0 ));
  LUT5 #(
    .INIT(32'h0F010001)) 
    \gpf1.prog_full_i_i_1 
       (.I0(\gpf1.prog_full_i_i_2_n_0 ),
        .I1(\gpf1.prog_full_i_i_3_n_0 ),
        .I2(\gpf1.prog_full_i_reg_0 ),
        .I3(out),
        .I4(axis_prog_full),
        .O(\gpf1.prog_full_i_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h777FFFFF)) 
    \gpf1.prog_full_i_i_2 
       (.I0(\gdiff.diff_pntr_pad_reg_n_0_ [8]),
        .I1(\gdiff.diff_pntr_pad_reg_n_0_ [7]),
        .I2(\gdiff.diff_pntr_pad_reg_n_0_ [3]),
        .I3(\gdiff.diff_pntr_pad_reg_n_0_ [2]),
        .I4(\gdiff.diff_pntr_pad_reg_n_0_ [9]),
        .O(\gpf1.prog_full_i_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h7F)) 
    \gpf1.prog_full_i_i_3 
       (.I0(\gdiff.diff_pntr_pad_reg_n_0_ [4]),
        .I1(\gdiff.diff_pntr_pad_reg_n_0_ [6]),
        .I2(\gdiff.diff_pntr_pad_reg_n_0_ [5]),
        .O(\gpf1.prog_full_i_i_3_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \gpf1.prog_full_i_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\gpf1.prog_full_i_i_1_n_0 ),
        .Q(axis_prog_full),
        .S(\gdiff.diff_pntr_pad_reg[2]_0 ));
  CARRY4 plusOp__0_carry
       (.CI(1'b0),
        .CO({plusOp__0_carry_n_0,plusOp__0_carry_n_1,plusOp__0_carry_n_2,plusOp__0_carry_n_3}),
        .CYINIT(1'b0),
        .DI({DI,1'b0}),
        .O({plusOp__0_carry_n_4,plusOp__0_carry_n_5,plusOp__0_carry_n_6,NLW_plusOp__0_carry_O_UNCONNECTED[0]}),
        .S(S));
  CARRY4 plusOp__0_carry__0
       (.CI(plusOp__0_carry_n_0),
        .CO({plusOp__0_carry__0_n_0,plusOp__0_carry__0_n_1,plusOp__0_carry__0_n_2,plusOp__0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(\gdiff.diff_pntr_pad_reg[8]_0 ),
        .O({plusOp__0_carry__0_n_4,plusOp__0_carry__0_n_5,plusOp__0_carry__0_n_6,plusOp__0_carry__0_n_7}),
        .S(\gdiff.diff_pntr_pad_reg[8]_1 ));
  CARRY4 plusOp__0_carry__1
       (.CI(plusOp__0_carry__0_n_0),
        .CO(NLW_plusOp__0_carry__1_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_plusOp__0_carry__1_O_UNCONNECTED[3:1],plusOp__0_carry__1_n_7}),
        .S({1'b0,1'b0,1'b0,\gdiff.diff_pntr_pad_reg[9]_0 }));
endmodule

(* ORIG_REF_NAME = "wr_status_flags_as" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_wr_status_flags_as
   (out,
    ram_full_fb_i_reg_0,
    ram_full_fb_i_reg_1,
    s_aclk,
    s_axis_tready,
    s_axis_tvalid,
    DI,
    E,
    Q,
    RD_PNTR_WR,
    \gmux.gm[4].gms.ms ,
    \gmux.gm[4].gms.ms_0 ,
    v1_reg,
    v1_reg_0);
  output out;
  input ram_full_fb_i_reg_0;
  input ram_full_fb_i_reg_1;
  input s_aclk;
  output s_axis_tready;
  input s_axis_tvalid;
  output [0:0]DI;
  output [0:0]E;
  input [0:0]Q;
  input [0:0]RD_PNTR_WR;
  input [3:0]\gmux.gm[4].gms.ms ;
  input [3:0]\gmux.gm[4].gms.ms_0 ;
  input [0:0]v1_reg;
  input [0:0]v1_reg_0;

  wire [0:0]DI;
  wire [0:0]E;
  wire [0:0]Q;
  wire [0:0]RD_PNTR_WR;
  wire c2_n_0;
  wire comp1;
  wire [3:0]\gmux.gm[4].gms.ms ;
  wire [3:0]\gmux.gm[4].gms.ms_0 ;
  (* DONT_TOUCH *) wire ram_full_fb_i;
  wire ram_full_fb_i_reg_0;
  wire ram_full_fb_i_reg_1;
  (* DONT_TOUCH *) wire ram_full_i;
  wire s_aclk;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire [0:0]v1_reg;
  wire [0:0]v1_reg_0;

  assign out = ram_full_fb_i;
  LUT2 #(
    .INIT(4'h2)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_i_3 
       (.I0(s_axis_tvalid),
        .I1(ram_full_fb_i),
        .O(E));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_compare c1
       (.comp1(comp1),
        .\gmux.gm[4].gms.ms_0 (\gmux.gm[4].gms.ms ),
        .v1_reg(v1_reg));
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_compare_0 c2
       (.comp1(comp1),
        .\gmux.gm[4].gms.ms_0 (\gmux.gm[4].gms.ms_0 ),
        .out(ram_full_fb_i),
        .ram_full_fb_i_reg(c2_n_0),
        .ram_full_fb_i_reg_0(ram_full_fb_i_reg_1),
        .s_axis_tvalid(s_axis_tvalid),
        .v1_reg_0(v1_reg_0));
  LUT4 #(
    .INIT(16'h7510)) 
    plusOp__0_carry_i_3
       (.I0(RD_PNTR_WR),
        .I1(ram_full_fb_i),
        .I2(s_axis_tvalid),
        .I3(Q),
        .O(DI));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b0)) 
    ram_full_fb_i_reg
       (.C(s_aclk),
        .CE(1'b1),
        .D(c2_n_0),
        .Q(ram_full_fb_i),
        .S(ram_full_fb_i_reg_0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b0)) 
    ram_full_i_reg
       (.C(s_aclk),
        .CE(1'b1),
        .D(c2_n_0),
        .Q(ram_full_i),
        .S(ram_full_fb_i_reg_0));
  LUT1 #(
    .INIT(2'h1)) 
    s_axis_tready_INST_0
       (.I0(ram_full_i),
        .O(s_axis_tready));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "9" *) (* XPM_MODULE = "TRUE" *) 
(* xpm_cdc = "GRAY" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_xpm_cdc_gray
   (dest_clk,
    src_clk,
    dest_out_bin,
    src_in_bin);
  input dest_clk;
  input src_clk;
  output [8:0]dest_out_bin;
  input [8:0]src_in_bin;

  wire [8:0]async_path;
  wire [7:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [8:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [8:0]\dest_graysync_ff[1] ;
  wire [8:0]dest_out_bin;
  wire [7:0]gray_enc;
  wire src_clk;
  wire [8:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[7]),
        .Q(\dest_graysync_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[8]),
        .Q(\dest_graysync_ff[0] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [7]),
        .Q(\dest_graysync_ff[1] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [8]),
        .Q(\dest_graysync_ff[1] [8]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(binval[3]),
        .I3(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(binval[3]),
        .I2(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(binval[3]),
        .O(binval[2]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(\dest_graysync_ff[1] [7]),
        .I3(\dest_graysync_ff[1] [8]),
        .I4(\dest_graysync_ff[1] [6]),
        .I5(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [6]),
        .I2(\dest_graysync_ff[1] [8]),
        .I3(\dest_graysync_ff[1] [7]),
        .I4(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [7]),
        .I2(\dest_graysync_ff[1] [8]),
        .I3(\dest_graysync_ff[1] [6]),
        .O(binval[5]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[6]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [8]),
        .I2(\dest_graysync_ff[1] [7]),
        .O(binval[6]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[7]_i_1 
       (.I0(\dest_graysync_ff[1] [7]),
        .I1(\dest_graysync_ff[1] [8]),
        .O(binval[7]));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[7]),
        .Q(dest_out_bin[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [8]),
        .Q(dest_out_bin[8]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[6]_i_1 
       (.I0(src_in_bin[7]),
        .I1(src_in_bin[6]),
        .O(gray_enc[6]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[7]_i_1 
       (.I0(src_in_bin[8]),
        .I1(src_in_bin[7]),
        .O(gray_enc[7]));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[6]),
        .Q(async_path[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[7]),
        .Q(async_path[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[8] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[8]),
        .Q(async_path[8]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "9" *) (* XPM_MODULE = "TRUE" *) 
(* xpm_cdc = "GRAY" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_xpm_cdc_gray__2
   (dest_clk,
    src_clk,
    dest_out_bin,
    src_in_bin);
  input dest_clk;
  input src_clk;
  output [8:0]dest_out_bin;
  input [8:0]src_in_bin;

  wire [8:0]async_path;
  wire [7:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [8:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [8:0]\dest_graysync_ff[1] ;
  wire [8:0]dest_out_bin;
  wire [7:0]gray_enc;
  wire src_clk;
  wire [8:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[7]),
        .Q(\dest_graysync_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[0][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[8]),
        .Q(\dest_graysync_ff[0] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [7]),
        .Q(\dest_graysync_ff[1] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE #(
    .INIT(1'b0)) 
    \dest_graysync_ff_reg[1][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [8]),
        .Q(\dest_graysync_ff[1] [8]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(binval[3]),
        .I3(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(binval[3]),
        .I2(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(binval[3]),
        .O(binval[2]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(\dest_graysync_ff[1] [7]),
        .I3(\dest_graysync_ff[1] [8]),
        .I4(\dest_graysync_ff[1] [6]),
        .I5(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [6]),
        .I2(\dest_graysync_ff[1] [8]),
        .I3(\dest_graysync_ff[1] [7]),
        .I4(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [7]),
        .I2(\dest_graysync_ff[1] [8]),
        .I3(\dest_graysync_ff[1] [6]),
        .O(binval[5]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[6]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [8]),
        .I2(\dest_graysync_ff[1] [7]),
        .O(binval[6]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[7]_i_1 
       (.I0(\dest_graysync_ff[1] [7]),
        .I1(\dest_graysync_ff[1] [8]),
        .O(binval[7]));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[7]),
        .Q(dest_out_bin[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_out_bin_ff_reg[8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [8]),
        .Q(dest_out_bin[8]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[6]_i_1 
       (.I0(src_in_bin[7]),
        .I1(src_in_bin[6]),
        .O(gray_enc[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[7]_i_1 
       (.I0(src_in_bin[8]),
        .I1(src_in_bin[7]),
        .O(gray_enc[7]));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[6]),
        .Q(async_path[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[7]),
        .Q(async_path[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_gray_ff_reg[8] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[8]),
        .Q(async_path[8]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* xpm_cdc = "SINGLE" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_xpm_cdc_single
   (dest_clk,
    dest_out,
    src_clk,
    src_in);
  input dest_clk;
  output dest_out;
  input src_clk;
  input src_in;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [4:0]syncstages_ff;

  assign dest_out = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* xpm_cdc = "SINGLE" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_xpm_cdc_single__2
   (dest_clk,
    dest_out,
    src_clk,
    src_in);
  input dest_clk;
  output dest_out;
  input src_clk;
  input src_in;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [4:0]syncstages_ff;

  assign dest_out = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* xpm_cdc = "SYNC_RST" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_xpm_cdc_sync_rst
   (dest_clk,
    dest_rst,
    src_rst);
  input dest_clk;
  output dest_rst;
  input src_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* xpm_cdc = "SYNC_RST" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512_xpm_cdc_sync_rst__2
   (dest_clk,
    dest_rst,
    src_rst);
  input dest_clk;
  output dest_rst;
  input src_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "gpif2mst_gpif2mst_async" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_gpif2mst_async
   (state_reg_bb0,
    state_reg_bb1,
    state_reg_bb2,
    state_reg_bb3,
    ACLK,
    BREADY1__0,
    SL_RD_N_reg,
    SL_RD_N_reg_0,
    SL_RD_N_reg_1,
    SL_RD_N_reg_2,
    SYS_CLK,
    SYS_RST_N,
    axis_prog_full,
    fifo_sel_reg,
    in0,
    s_axis_tvalid,
    sl_mode_reg_reg,
    \state_reg[1]_0 ,
    \state_reg[2]_0 ,
    \state_reg[3]_0 ,
    u2f_rd_ready,
    u2f_rd_valid,
    D,
    Q,
    out,
    \pushed_reg[0] ,
    \pushed_reg[15] ,
    \state_reg[1]_1 ,
    \state_reg[2]_1 ,
    u2f_rd_data);
  input ACLK;
  output BREADY1__0;
  input SL_RD_N_reg;
  input SL_RD_N_reg_0;
  input SL_RD_N_reg_1;
  input SL_RD_N_reg_2;
  input SYS_CLK;
  input SYS_RST_N;
  output axis_prog_full;
  output [1:1]fifo_sel_reg;
  output in0;
  input s_axis_tvalid;
  output [1:1]sl_mode_reg_reg;
  input \state_reg[1]_0 ;
  input \state_reg[2]_0 ;
  input \state_reg[3]_0 ;
  input u2f_rd_ready;
  output u2f_rd_valid;
  output [15:0]D;
  input [31:0]Q;
  input [1:0]out;
  input [4:0]\pushed_reg[0] ;
  input [15:0]\pushed_reg[15] ;
  input [4:0]\state_reg[1]_1 ;
  input [0:0]\state_reg[2]_1 ;
  output [31:0]u2f_rd_data;
  output state_reg_bb0;
  output state_reg_bb1;
  output state_reg_bb2;
  input state_reg_bb3;

  wire ACLK;
  wire BREADY1__0;
  wire [15:0]D;
  wire [31:0]Q;
  wire SL_RD_N_i_3_n_0;
  wire SL_RD_N_reg;
  wire SL_RD_N_reg_0;
  wire SL_RD_N_reg_1;
  wire SL_RD_N_reg_2;
  wire SYS_CLK;
  wire SYS_RST_N;
  wire \WIDTH_32.BLK_512.u_fifo_n_55 ;
  wire axis_prog_full;
  wire [1:1]fifo_sel_reg;
  wire in0;
  wire [1:0]out;
  wire \pushed[3]_i_3_n_0 ;
  wire [4:0]\pushed_reg[0] ;
  wire \pushed_reg[11]_i_2_n_0 ;
  wire \pushed_reg[11]_i_2_n_1 ;
  wire \pushed_reg[11]_i_2_n_2 ;
  wire \pushed_reg[11]_i_2_n_3 ;
  wire \pushed_reg[11]_i_2_n_4 ;
  wire \pushed_reg[11]_i_2_n_5 ;
  wire \pushed_reg[11]_i_2_n_6 ;
  wire \pushed_reg[11]_i_2_n_7 ;
  wire [15:0]\pushed_reg[15] ;
  wire \pushed_reg[15]_i_2_n_1 ;
  wire \pushed_reg[15]_i_2_n_2 ;
  wire \pushed_reg[15]_i_2_n_3 ;
  wire \pushed_reg[15]_i_2_n_4 ;
  wire \pushed_reg[15]_i_2_n_5 ;
  wire \pushed_reg[15]_i_2_n_6 ;
  wire \pushed_reg[15]_i_2_n_7 ;
  wire \pushed_reg[3]_i_2_n_0 ;
  wire \pushed_reg[3]_i_2_n_1 ;
  wire \pushed_reg[3]_i_2_n_2 ;
  wire \pushed_reg[3]_i_2_n_3 ;
  wire \pushed_reg[3]_i_2_n_4 ;
  wire \pushed_reg[3]_i_2_n_5 ;
  wire \pushed_reg[3]_i_2_n_6 ;
  wire \pushed_reg[3]_i_2_n_7 ;
  wire \pushed_reg[7]_i_2_n_0 ;
  wire \pushed_reg[7]_i_2_n_1 ;
  wire \pushed_reg[7]_i_2_n_2 ;
  wire \pushed_reg[7]_i_2_n_3 ;
  wire \pushed_reg[7]_i_2_n_4 ;
  wire \pushed_reg[7]_i_2_n_5 ;
  wire \pushed_reg[7]_i_2_n_6 ;
  wire \pushed_reg[7]_i_2_n_7 ;
  wire s_axis_tvalid;
  wire [1:1]sl_mode_reg_reg;
  wire [3:0]\^state_reg ;
  wire \state_reg[1]_0 ;
  wire [4:0]\state_reg[1]_1 ;
  wire \state_reg[2]_0 ;
  wire [0:0]\state_reg[2]_1 ;
  wire \state_reg[3]_0 ;
  wire [31:0]u2f_rd_data;
  wire [9:0]u2f_rd_items;
  wire u2f_rd_ready;
  wire u2f_rd_valid;
  wire u2f_wr_ready;
  wire [9:0]witems;
  wire [3:3]\NLW_pushed_reg[15]_i_2_CO_UNCONNECTED ;

  assign \^state_reg [3] = state_reg_bb3;
  assign state_reg_bb0 = \^state_reg [0];
  assign state_reg_bb1 = \^state_reg [1];
  assign state_reg_bb2 = \^state_reg [2];
  LUT2 #(
    .INIT(4'h8)) 
    BREADY_i_2
       (.I0(u2f_rd_valid),
        .I1(u2f_rd_ready),
        .O(BREADY1__0));
  LUT6 #(
    .INIT(64'hFFFFFFFFEFFEFFFF)) 
    SL_RD_N_i_1
       (.I0(SL_RD_N_reg_1),
        .I1(\pushed_reg[0] [0]),
        .I2(\pushed_reg[0] [2]),
        .I3(\pushed_reg[0] [1]),
        .I4(SL_RD_N_reg_0),
        .I5(SL_RD_N_i_3_n_0),
        .O(\^state_reg [0]));
  LUT6 #(
    .INIT(64'h51FF51FF40FF4000)) 
    SL_RD_N_i_3
       (.I0(out[1]),
        .I1(out[0]),
        .I2(axis_prog_full),
        .I3(\pushed_reg[0] [1]),
        .I4(SL_RD_N_reg_2),
        .I5(SL_RD_N_reg),
        .O(SL_RD_N_i_3_n_0));
  (* IMPORTED_FROM = "/home/adki/work/projects/ez-usb-fx3/hwlib/gpif2mst/fifo_async/z7/vivado.2019.2/gpif2mst_async_32x512/gpif2mst_async_32x512.dcp" *) 
  (* IMPORTED_TYPE = "CHECKPOINT" *) 
  (* IS_IMPORTED *) 
  (* black_box_pad_pin = "m_aclk,s_aclk,s_aresetn,s_axis_tvalid,s_axis_tready,s_axis_tdata[31:0],m_axis_tvalid,m_axis_tready,m_axis_tdata[31:0],axis_wr_data_count[9:0],axis_rd_data_count[9:0],axis_prog_full,axis_prog_empty" *) 
  (* syn_black_box = "1" *) 
  (* x_core_info = "fifo_generator_v13_2_5,Vivado 2019.2" *) 
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512_HD1 \WIDTH_32.BLK_512.u_fifo 
       (.axis_prog_empty(\WIDTH_32.BLK_512.u_fifo_n_55 ),
        .axis_prog_full(axis_prog_full),
        .axis_rd_data_count(u2f_rd_items),
        .axis_wr_data_count(witems),
        .m_aclk(ACLK),
        .m_axis_tdata(u2f_rd_data),
        .m_axis_tready(u2f_rd_ready),
        .m_axis_tvalid(u2f_rd_valid),
        .s_aclk(SYS_CLK),
        .s_aresetn(SYS_RST_N),
        .s_axis_tdata(Q),
        .s_axis_tready(u2f_wr_ready),
        .s_axis_tvalid(s_axis_tvalid));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \pushed[0]_i_1 
       (.I0(\pushed_reg[0] [3]),
        .I1(\pushed_reg[0] [2]),
        .I2(\pushed_reg[0] [1]),
        .I3(\pushed_reg[0] [0]),
        .I4(\pushed_reg[0] [4]),
        .I5(\pushed_reg[3]_i_2_n_7 ),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \pushed[10]_i_1 
       (.I0(\pushed_reg[0] [3]),
        .I1(\pushed_reg[0] [2]),
        .I2(\pushed_reg[0] [1]),
        .I3(\pushed_reg[0] [0]),
        .I4(\pushed_reg[0] [4]),
        .I5(\pushed_reg[11]_i_2_n_5 ),
        .O(D[10]));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \pushed[11]_i_1 
       (.I0(\pushed_reg[0] [3]),
        .I1(\pushed_reg[0] [2]),
        .I2(\pushed_reg[0] [1]),
        .I3(\pushed_reg[0] [0]),
        .I4(\pushed_reg[0] [4]),
        .I5(\pushed_reg[11]_i_2_n_4 ),
        .O(D[11]));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \pushed[12]_i_1 
       (.I0(\pushed_reg[0] [3]),
        .I1(\pushed_reg[0] [2]),
        .I2(\pushed_reg[0] [1]),
        .I3(\pushed_reg[0] [0]),
        .I4(\pushed_reg[0] [4]),
        .I5(\pushed_reg[15]_i_2_n_7 ),
        .O(D[12]));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \pushed[13]_i_1 
       (.I0(\pushed_reg[0] [3]),
        .I1(\pushed_reg[0] [2]),
        .I2(\pushed_reg[0] [1]),
        .I3(\pushed_reg[0] [0]),
        .I4(\pushed_reg[0] [4]),
        .I5(\pushed_reg[15]_i_2_n_6 ),
        .O(D[13]));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \pushed[14]_i_1 
       (.I0(\pushed_reg[0] [3]),
        .I1(\pushed_reg[0] [2]),
        .I2(\pushed_reg[0] [1]),
        .I3(\pushed_reg[0] [0]),
        .I4(\pushed_reg[0] [4]),
        .I5(\pushed_reg[15]_i_2_n_5 ),
        .O(D[14]));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \pushed[15]_i_1 
       (.I0(\pushed_reg[0] [3]),
        .I1(\pushed_reg[0] [2]),
        .I2(\pushed_reg[0] [1]),
        .I3(\pushed_reg[0] [0]),
        .I4(\pushed_reg[0] [4]),
        .I5(\pushed_reg[15]_i_2_n_4 ),
        .O(D[15]));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \pushed[1]_i_1 
       (.I0(\pushed_reg[0] [3]),
        .I1(\pushed_reg[0] [2]),
        .I2(\pushed_reg[0] [1]),
        .I3(\pushed_reg[0] [0]),
        .I4(\pushed_reg[0] [4]),
        .I5(\pushed_reg[3]_i_2_n_6 ),
        .O(D[1]));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \pushed[2]_i_1 
       (.I0(\pushed_reg[0] [3]),
        .I1(\pushed_reg[0] [2]),
        .I2(\pushed_reg[0] [1]),
        .I3(\pushed_reg[0] [0]),
        .I4(\pushed_reg[0] [4]),
        .I5(\pushed_reg[3]_i_2_n_5 ),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \pushed[3]_i_1 
       (.I0(\pushed_reg[0] [3]),
        .I1(\pushed_reg[0] [2]),
        .I2(\pushed_reg[0] [1]),
        .I3(\pushed_reg[0] [0]),
        .I4(\pushed_reg[0] [4]),
        .I5(\pushed_reg[3]_i_2_n_4 ),
        .O(D[3]));
  LUT3 #(
    .INIT(8'h6A)) 
    \pushed[3]_i_3 
       (.I0(\pushed_reg[15] [0]),
        .I1(s_axis_tvalid),
        .I2(u2f_wr_ready),
        .O(\pushed[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \pushed[4]_i_1 
       (.I0(\pushed_reg[0] [3]),
        .I1(\pushed_reg[0] [2]),
        .I2(\pushed_reg[0] [1]),
        .I3(\pushed_reg[0] [0]),
        .I4(\pushed_reg[0] [4]),
        .I5(\pushed_reg[7]_i_2_n_7 ),
        .O(D[4]));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \pushed[5]_i_1 
       (.I0(\pushed_reg[0] [3]),
        .I1(\pushed_reg[0] [2]),
        .I2(\pushed_reg[0] [1]),
        .I3(\pushed_reg[0] [0]),
        .I4(\pushed_reg[0] [4]),
        .I5(\pushed_reg[7]_i_2_n_6 ),
        .O(D[5]));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \pushed[6]_i_1 
       (.I0(\pushed_reg[0] [3]),
        .I1(\pushed_reg[0] [2]),
        .I2(\pushed_reg[0] [1]),
        .I3(\pushed_reg[0] [0]),
        .I4(\pushed_reg[0] [4]),
        .I5(\pushed_reg[7]_i_2_n_5 ),
        .O(D[6]));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \pushed[7]_i_1 
       (.I0(\pushed_reg[0] [3]),
        .I1(\pushed_reg[0] [2]),
        .I2(\pushed_reg[0] [1]),
        .I3(\pushed_reg[0] [0]),
        .I4(\pushed_reg[0] [4]),
        .I5(\pushed_reg[7]_i_2_n_4 ),
        .O(D[7]));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \pushed[8]_i_1 
       (.I0(\pushed_reg[0] [3]),
        .I1(\pushed_reg[0] [2]),
        .I2(\pushed_reg[0] [1]),
        .I3(\pushed_reg[0] [0]),
        .I4(\pushed_reg[0] [4]),
        .I5(\pushed_reg[11]_i_2_n_7 ),
        .O(D[8]));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \pushed[9]_i_1 
       (.I0(\pushed_reg[0] [3]),
        .I1(\pushed_reg[0] [2]),
        .I2(\pushed_reg[0] [1]),
        .I3(\pushed_reg[0] [0]),
        .I4(\pushed_reg[0] [4]),
        .I5(\pushed_reg[11]_i_2_n_6 ),
        .O(D[9]));
  CARRY4 \pushed_reg[11]_i_2 
       (.CI(\pushed_reg[7]_i_2_n_0 ),
        .CO({\pushed_reg[11]_i_2_n_0 ,\pushed_reg[11]_i_2_n_1 ,\pushed_reg[11]_i_2_n_2 ,\pushed_reg[11]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pushed_reg[11]_i_2_n_4 ,\pushed_reg[11]_i_2_n_5 ,\pushed_reg[11]_i_2_n_6 ,\pushed_reg[11]_i_2_n_7 }),
        .S(\pushed_reg[15] [11:8]));
  CARRY4 \pushed_reg[15]_i_2 
       (.CI(\pushed_reg[11]_i_2_n_0 ),
        .CO({\NLW_pushed_reg[15]_i_2_CO_UNCONNECTED [3],\pushed_reg[15]_i_2_n_1 ,\pushed_reg[15]_i_2_n_2 ,\pushed_reg[15]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pushed_reg[15]_i_2_n_4 ,\pushed_reg[15]_i_2_n_5 ,\pushed_reg[15]_i_2_n_6 ,\pushed_reg[15]_i_2_n_7 }),
        .S(\pushed_reg[15] [15:12]));
  CARRY4 \pushed_reg[3]_i_2 
       (.CI(1'b0),
        .CO({\pushed_reg[3]_i_2_n_0 ,\pushed_reg[3]_i_2_n_1 ,\pushed_reg[3]_i_2_n_2 ,\pushed_reg[3]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\pushed_reg[15] [0]}),
        .O({\pushed_reg[3]_i_2_n_4 ,\pushed_reg[3]_i_2_n_5 ,\pushed_reg[3]_i_2_n_6 ,\pushed_reg[3]_i_2_n_7 }),
        .S({\pushed_reg[15] [3:1],\pushed[3]_i_3_n_0 }));
  CARRY4 \pushed_reg[7]_i_2 
       (.CI(\pushed_reg[3]_i_2_n_0 ),
        .CO({\pushed_reg[7]_i_2_n_0 ,\pushed_reg[7]_i_2_n_1 ,\pushed_reg[7]_i_2_n_2 ,\pushed_reg[7]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pushed_reg[7]_i_2_n_4 ,\pushed_reg[7]_i_2_n_5 ,\pushed_reg[7]_i_2_n_6 ,\pushed_reg[7]_i_2_n_7 }),
        .S(\pushed_reg[15] [7:4]));
  LUT6 #(
    .INIT(64'h00000000000000E0)) 
    \state[1]_i_3 
       (.I0(\state_reg[1]_0 ),
        .I1(fifo_sel_reg),
        .I2(\state_reg[1]_1 [1]),
        .I3(\state_reg[1]_1 [0]),
        .I4(\state_reg[1]_1 [4]),
        .I5(\state_reg[1]_1 [3]),
        .O(\^state_reg [1]));
  LUT6 #(
    .INIT(64'h0008080800000800)) 
    \state[2]_i_4 
       (.I0(\state_reg[1]_1 [2]),
        .I1(\state_reg[2]_0 ),
        .I2(\state_reg[1]_1 [3]),
        .I3(fifo_sel_reg),
        .I4(\state_reg[2]_1 ),
        .I5(\state_reg[1]_0 ),
        .O(\^state_reg [2]));
  LUT5 #(
    .INIT(32'h4540FFFF)) 
    \state[3]_i_18 
       (.I0(out[1]),
        .I1(axis_prog_full),
        .I2(out[0]),
        .I3(SL_RD_N_reg),
        .I4(SL_RD_N_reg_0),
        .O(fifo_sel_reg));
  LUT5 #(
    .INIT(32'hFFFF8B00)) 
    \state[3]_i_6 
       (.I0(\state_reg[2]_1 ),
        .I1(fifo_sel_reg),
        .I2(\state_reg[1]_0 ),
        .I3(\^state_reg [3]),
        .I4(\state_reg[3]_0 ),
        .O(sl_mode_reg_reg));
  LUT1 #(
    .INIT(2'h1)) 
    u2f_wr_full_inferred_i_1
       (.I0(u2f_wr_ready),
        .O(in0));
endmodule

(* ORIG_REF_NAME = "gpif2mst_gpif2mst_async" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_gpif2mst_async__parameterized0
   (state_reg_bb0,
    state_reg_bb1,
    state_reg_bb2,
    state_reg_bb3,
    state_reg_bb4,
    ACLK,
    SL_DT_O_reg,
    \SL_DT_O_reg[25]_0 ,
    \SL_DT_O_reg[26]_0 ,
    \SL_DT_O_reg[29]_0 ,
    \SL_DT_O_reg[9]_0 ,
    \SL_DT_O_reg[9]_1 ,
    SL_PKTEND_N_reg,
    SL_PKTEND_N_reg_0,
    SYS_CLK,
    SYS_RST_N,
    axis_prog_full,
    cnt_reg,
    \cnt_reg[0]_0 ,
    \cnt_reg[0]_1 ,
    \cnt_reg[0]_2 ,
    \cnt_reg[0]_3 ,
    \cnt_reg[0]_4 ,
    \cnt_reg[0]_5 ,
    f2u_wr_ready,
    f2u_wr_valid,
    sl_pktend_n_reg_reg,
    sl_pktend_n_reg_reg_0,
    sl_pktend_n_reg_reg_1,
    sl_pktend_n_reg_reg_2,
    sl_wr_n_reg_reg,
    sl_wr_n_reg_reg_0,
    sl_wr_n_reg_reg_1,
    sl_wr_n_reg_reg_2,
    sl_wr_n_reg_reg_3,
    \state[0]_i_2_0 ,
    \state[0]_i_4_0 ,
    \state[0]_i_5_0 ,
    \state[0]_i_5_2 ,
    \state[2]_i_3_0 ,
    \state[3]_i_4_0 ,
    \state[3]_i_4_1 ,
    \state[3]_i_4_2 ,
    \state[3]_i_4_3 ,
    \state[4]_i_6_0 ,
    \state[4]_i_6_1 ,
    \state[4]_i_7_0 ,
    \state_reg[0]_0 ,
    \state_reg[0]_1 ,
    \state_reg[0]_2 ,
    \state_reg[0]_3 ,
    \state_reg[0]_4 ,
    \state_reg[0]_5 ,
    \state_reg[0]_6 ,
    \state_reg[0]_7 ,
    \state_reg[0]_8 ,
    \state_reg[0]_9 ,
    \state_reg[1]_0 ,
    \state_reg[1]_1 ,
    \state_reg[1]_10 ,
    \state_reg[1]_11 ,
    \state_reg[1]_12 ,
    \state_reg[1]_2 ,
    \state_reg[1]_3 ,
    \state_reg[1]_4 ,
    \state_reg[1]_5 ,
    \state_reg[1]_6 ,
    \state_reg[1]_7 ,
    \state_reg[1]_8 ,
    \state_reg[1]_9 ,
    \state_reg[2]_0 ,
    \state_reg[2]_1 ,
    \state_reg[2]_2 ,
    \state_reg[2]_4 ,
    \state_reg[3]_0 ,
    \state_reg[3]_1 ,
    \state_reg[3]_10 ,
    \state_reg[3]_2 ,
    \state_reg[3]_3 ,
    \state_reg[3]_4 ,
    \state_reg[3]_5 ,
    \state_reg[3]_6 ,
    \state_reg[3]_7 ,
    \state_reg[3]_8 ,
    \state_reg[3]_9 ,
    \state_reg[4]_0 ,
    \state_reg[4]_1 ,
    \state_reg[4]_10 ,
    \state_reg[4]_3 ,
    \state_reg[4]_4 ,
    \state_reg[4]_5 ,
    \state_reg[4]_6 ,
    \state_reg[4]_7 ,
    \state_reg[4]_8 ,
    \state_reg[4]_9 ,
    timeout_reg,
    \timeout_reg[2]_0 ,
    \timeout_reg[2]_1 ,
    \timeout_reg[2]_2 ,
    D,
    E,
    Q,
    SL_FLAGA,
    SL_FLAGD,
    out,
    rd_dout,
    \state[0]_i_5_1 ,
    \state_reg[2]_3 ,
    \state_reg[4]_2 );
  input ACLK;
  input [29:9]SL_DT_O_reg;
  input \SL_DT_O_reg[25]_0 ;
  input \SL_DT_O_reg[26]_0 ;
  input \SL_DT_O_reg[29]_0 ;
  input \SL_DT_O_reg[9]_0 ;
  input \SL_DT_O_reg[9]_1 ;
  input SL_PKTEND_N_reg;
  input SL_PKTEND_N_reg_0;
  input SYS_CLK;
  input SYS_RST_N;
  input axis_prog_full;
  input [0:0]cnt_reg;
  input \cnt_reg[0]_0 ;
  input \cnt_reg[0]_1 ;
  input \cnt_reg[0]_2 ;
  input \cnt_reg[0]_3 ;
  input \cnt_reg[0]_4 ;
  input \cnt_reg[0]_5 ;
  output f2u_wr_ready;
  input f2u_wr_valid;
  input sl_pktend_n_reg_reg;
  input sl_pktend_n_reg_reg_0;
  input sl_pktend_n_reg_reg_1;
  input sl_pktend_n_reg_reg_2;
  output sl_wr_n_reg_reg;
  input sl_wr_n_reg_reg_0;
  input sl_wr_n_reg_reg_1;
  input sl_wr_n_reg_reg_2;
  input sl_wr_n_reg_reg_3;
  input \state[0]_i_2_0 ;
  input \state[0]_i_4_0 ;
  input \state[0]_i_5_0 ;
  input \state[0]_i_5_2 ;
  input \state[2]_i_3_0 ;
  input \state[3]_i_4_0 ;
  input \state[3]_i_4_1 ;
  input \state[3]_i_4_2 ;
  input \state[3]_i_4_3 ;
  input \state[4]_i_6_0 ;
  input \state[4]_i_6_1 ;
  input \state[4]_i_7_0 ;
  input \state_reg[0]_0 ;
  input \state_reg[0]_1 ;
  input \state_reg[0]_2 ;
  input \state_reg[0]_3 ;
  input \state_reg[0]_4 ;
  input \state_reg[0]_5 ;
  input \state_reg[0]_6 ;
  input \state_reg[0]_7 ;
  input \state_reg[0]_8 ;
  input \state_reg[0]_9 ;
  output \state_reg[1]_0 ;
  output \state_reg[1]_1 ;
  input \state_reg[1]_10 ;
  input \state_reg[1]_11 ;
  input \state_reg[1]_12 ;
  output \state_reg[1]_2 ;
  input \state_reg[1]_3 ;
  input \state_reg[1]_4 ;
  input \state_reg[1]_5 ;
  input \state_reg[1]_6 ;
  input \state_reg[1]_7 ;
  input \state_reg[1]_8 ;
  input \state_reg[1]_9 ;
  input \state_reg[2]_0 ;
  input \state_reg[2]_1 ;
  input \state_reg[2]_2 ;
  input \state_reg[2]_4 ;
  output \state_reg[3]_0 ;
  input \state_reg[3]_1 ;
  input \state_reg[3]_10 ;
  input \state_reg[3]_2 ;
  input \state_reg[3]_3 ;
  input \state_reg[3]_4 ;
  input \state_reg[3]_5 ;
  input \state_reg[3]_6 ;
  input \state_reg[3]_7 ;
  input \state_reg[3]_8 ;
  input \state_reg[3]_9 ;
  output \state_reg[4]_0 ;
  output \state_reg[4]_1 ;
  input \state_reg[4]_10 ;
  input \state_reg[4]_3 ;
  input \state_reg[4]_4 ;
  input \state_reg[4]_5 ;
  input \state_reg[4]_6 ;
  input \state_reg[4]_7 ;
  input \state_reg[4]_8 ;
  input \state_reg[4]_9 ;
  input [2:2]timeout_reg;
  input \timeout_reg[2]_0 ;
  input \timeout_reg[2]_1 ;
  input \timeout_reg[2]_2 ;
  output [31:0]D;
  output [0:0]E;
  input [1:0]Q;
  output [0:0]SL_FLAGA;
  output [4:0]SL_FLAGD;
  input [4:0]out;
  input [31:0]rd_dout;
  input [0:0]\state[0]_i_5_1 ;
  input [1:0]\state_reg[2]_3 ;
  input [4:0]\state_reg[4]_2 ;
  input state_reg_bb0;
  output state_reg_bb1;
  input state_reg_bb2;
  output state_reg_bb3;
  output state_reg_bb4;

  wire ACLK;
  wire [31:0]D;
  wire [0:0]E;
  wire [1:0]Q;
  wire \SL_DT_O[31]_i_3_n_0 ;
  wire [29:9]SL_DT_O_reg;
  wire \SL_DT_O_reg[25]_0 ;
  wire \SL_DT_O_reg[26]_0 ;
  wire \SL_DT_O_reg[29]_0 ;
  wire \SL_DT_O_reg[9]_0 ;
  wire \SL_DT_O_reg[9]_1 ;
  wire [0:0]SL_FLAGA;
  wire [4:0]SL_FLAGD;
  wire SL_PKTEND_N_i_3_n_0;
  wire SL_PKTEND_N_reg;
  wire SL_PKTEND_N_reg_0;
  wire SL_WR_N_i_3_n_0;
  wire SL_WR_N_i_5_n_0;
  wire SL_WR_N_i_6_n_0;
  wire SL_WR_N_i_8_n_0;
  wire SYS_CLK;
  wire SYS_RST_N;
  wire \WIDTH_34.BLK_512.u_fifo_n_1 ;
  wire \WIDTH_34.BLK_512.u_fifo_n_46 ;
  wire \WIDTH_34.BLK_512.u_fifo_n_47 ;
  wire \WIDTH_34.BLK_512.u_fifo_n_48 ;
  wire \WIDTH_34.BLK_512.u_fifo_n_49 ;
  wire \WIDTH_34.BLK_512.u_fifo_n_50 ;
  wire \WIDTH_34.BLK_512.u_fifo_n_51 ;
  wire \WIDTH_34.BLK_512.u_fifo_n_52 ;
  wire \WIDTH_34.BLK_512.u_fifo_n_53 ;
  wire \WIDTH_34.BLK_512.u_fifo_n_54 ;
  wire \WIDTH_34.BLK_512.u_fifo_n_55 ;
  wire \WIDTH_34.BLK_512.u_fifo_n_56 ;
  wire \WIDTH_34.BLK_512.u_fifo_n_57 ;
  wire axis_prog_full;
  wire \cnt[15]_i_7_n_0 ;
  wire \cnt[15]_i_8_n_0 ;
  wire [0:0]cnt_reg;
  wire \cnt_reg[0]_0 ;
  wire \cnt_reg[0]_1 ;
  wire \cnt_reg[0]_2 ;
  wire \cnt_reg[0]_3 ;
  wire \cnt_reg[0]_4 ;
  wire \cnt_reg[0]_5 ;
  wire [33:0]f2u_rd_data;
  wire f2u_rd_ready;
  wire f2u_wr_ready;
  wire f2u_wr_valid;
  wire [4:0]out;
  wire [31:0]rd_dout;
  wire sl_pktend_n_reg_i_2_n_0;
  wire sl_pktend_n_reg_i_3_n_0;
  wire sl_pktend_n_reg_i_4_n_0;
  wire sl_pktend_n_reg_i_6_n_0;
  wire sl_pktend_n_reg_reg;
  wire sl_pktend_n_reg_reg_0;
  wire sl_pktend_n_reg_reg_1;
  wire sl_pktend_n_reg_reg_2;
  wire sl_wr_n_reg_i_2_n_0;
  wire sl_wr_n_reg_i_3_n_0;
  wire sl_wr_n_reg_i_4_n_0;
  wire sl_wr_n_reg_reg;
  wire sl_wr_n_reg_reg_0;
  wire sl_wr_n_reg_reg_1;
  wire sl_wr_n_reg_reg_2;
  wire sl_wr_n_reg_reg_3;
  wire \state[0]_i_12_n_0 ;
  wire \state[0]_i_13_n_0 ;
  wire \state[0]_i_14_n_0 ;
  wire \state[0]_i_15_n_0 ;
  wire \state[0]_i_2_0 ;
  wire \state[0]_i_2_n_0 ;
  wire \state[0]_i_4_0 ;
  wire \state[0]_i_4_n_0 ;
  wire \state[0]_i_5_0 ;
  wire [0:0]\state[0]_i_5_1 ;
  wire \state[0]_i_5_2 ;
  wire \state[0]_i_5_n_0 ;
  wire \state[0]_i_7_n_0 ;
  wire \state[1]_i_15_n_0 ;
  wire \state[1]_i_2_n_0 ;
  wire \state[1]_i_4_n_0 ;
  wire \state[1]_i_5_n_0 ;
  wire \state[1]_i_6_n_0 ;
  wire \state[1]_i_7_n_0 ;
  wire \state[2]_i_10_n_0 ;
  wire \state[2]_i_3_0 ;
  wire \state[2]_i_3_n_0 ;
  wire \state[2]_i_5_n_0 ;
  wire \state[3]_i_21_n_0 ;
  wire \state[3]_i_23_n_0 ;
  wire \state[3]_i_2_n_0 ;
  wire \state[3]_i_3_n_0 ;
  wire \state[3]_i_4_0 ;
  wire \state[3]_i_4_1 ;
  wire \state[3]_i_4_2 ;
  wire \state[3]_i_4_3 ;
  wire \state[3]_i_4_n_0 ;
  wire \state[3]_i_7_n_0 ;
  wire \state[4]_i_12_n_0 ;
  wire \state[4]_i_17_n_0 ;
  wire \state[4]_i_2_n_0 ;
  wire \state[4]_i_3_n_0 ;
  wire \state[4]_i_6_0 ;
  wire \state[4]_i_6_1 ;
  wire \state[4]_i_6_n_0 ;
  wire \state[4]_i_7_0 ;
  wire \state[4]_i_7_n_0 ;
  wire \state[4]_i_8_n_0 ;
  wire [4:0]\^state_reg ;
  wire \state_reg[0]_0 ;
  wire \state_reg[0]_1 ;
  wire \state_reg[0]_2 ;
  wire \state_reg[0]_3 ;
  wire \state_reg[0]_4 ;
  wire \state_reg[0]_5 ;
  wire \state_reg[0]_6 ;
  wire \state_reg[0]_7 ;
  wire \state_reg[0]_8 ;
  wire \state_reg[0]_9 ;
  wire \state_reg[1]_0 ;
  wire \state_reg[1]_1 ;
  wire \state_reg[1]_10 ;
  wire \state_reg[1]_11 ;
  wire \state_reg[1]_12 ;
  wire \state_reg[1]_2 ;
  wire \state_reg[1]_3 ;
  wire \state_reg[1]_4 ;
  wire \state_reg[1]_5 ;
  wire \state_reg[1]_6 ;
  wire \state_reg[1]_7 ;
  wire \state_reg[1]_8 ;
  wire \state_reg[1]_9 ;
  wire \state_reg[2]_0 ;
  wire \state_reg[2]_1 ;
  wire \state_reg[2]_2 ;
  wire [1:0]\state_reg[2]_3 ;
  wire \state_reg[2]_4 ;
  wire \state_reg[3]_0 ;
  wire \state_reg[3]_1 ;
  wire \state_reg[3]_10 ;
  wire \state_reg[3]_2 ;
  wire \state_reg[3]_3 ;
  wire \state_reg[3]_4 ;
  wire \state_reg[3]_5 ;
  wire \state_reg[3]_6 ;
  wire \state_reg[3]_7 ;
  wire \state_reg[3]_8 ;
  wire \state_reg[3]_9 ;
  wire \state_reg[4]_0 ;
  wire \state_reg[4]_1 ;
  wire \state_reg[4]_10 ;
  wire [4:0]\state_reg[4]_2 ;
  wire \state_reg[4]_3 ;
  wire \state_reg[4]_4 ;
  wire \state_reg[4]_5 ;
  wire \state_reg[4]_6 ;
  wire \state_reg[4]_7 ;
  wire \state_reg[4]_8 ;
  wire \state_reg[4]_9 ;
  wire \timeout[2]_i_3_n_0 ;
  wire \timeout[2]_i_4_n_0 ;
  wire [2:2]timeout_reg;
  wire \timeout_reg[2]_0 ;
  wire \timeout_reg[2]_1 ;
  wire \timeout_reg[2]_2 ;
  wire [9:0]witems;

  assign \^state_reg [2] = state_reg_bb2;
  assign \^state_reg [0] = state_reg_bb0;
  assign state_reg_bb1 = \^state_reg [1];
  assign state_reg_bb3 = \^state_reg [3];
  assign state_reg_bb4 = \^state_reg [4];
  LUT5 #(
    .INIT(32'hF888F8F8)) 
    \SL_DT_O[0]_i_1 
       (.I0(SL_DT_O_reg[20]),
        .I1(Q[0]),
        .I2(f2u_rd_data[0]),
        .I3(out[3]),
        .I4(out[2]),
        .O(D[0]));
  LUT5 #(
    .INIT(32'hF888F8F8)) 
    \SL_DT_O[10]_i_1 
       (.I0(SL_DT_O_reg[20]),
        .I1(Q[0]),
        .I2(f2u_rd_data[10]),
        .I3(out[3]),
        .I4(out[2]),
        .O(D[10]));
  LUT3 #(
    .INIT(8'hD0)) 
    \SL_DT_O[11]_i_1 
       (.I0(out[2]),
        .I1(out[3]),
        .I2(f2u_rd_data[11]),
        .O(D[11]));
  LUT3 #(
    .INIT(8'hD0)) 
    \SL_DT_O[12]_i_1 
       (.I0(out[2]),
        .I1(out[3]),
        .I2(f2u_rd_data[12]),
        .O(D[12]));
  LUT3 #(
    .INIT(8'hD0)) 
    \SL_DT_O[13]_i_1 
       (.I0(out[2]),
        .I1(out[3]),
        .I2(f2u_rd_data[13]),
        .O(D[13]));
  LUT3 #(
    .INIT(8'hD0)) 
    \SL_DT_O[14]_i_1 
       (.I0(out[2]),
        .I1(out[3]),
        .I2(f2u_rd_data[14]),
        .O(D[14]));
  LUT3 #(
    .INIT(8'hD0)) 
    \SL_DT_O[15]_i_1 
       (.I0(out[2]),
        .I1(out[3]),
        .I2(f2u_rd_data[15]),
        .O(D[15]));
  LUT3 #(
    .INIT(8'hD0)) 
    \SL_DT_O[16]_i_1 
       (.I0(out[2]),
        .I1(out[3]),
        .I2(f2u_rd_data[16]),
        .O(D[16]));
  LUT3 #(
    .INIT(8'hD0)) 
    \SL_DT_O[17]_i_1 
       (.I0(out[2]),
        .I1(out[3]),
        .I2(f2u_rd_data[17]),
        .O(D[17]));
  LUT3 #(
    .INIT(8'hD0)) 
    \SL_DT_O[18]_i_1 
       (.I0(out[2]),
        .I1(out[3]),
        .I2(f2u_rd_data[18]),
        .O(D[18]));
  LUT5 #(
    .INIT(32'hF888F8F8)) 
    \SL_DT_O[19]_i_1 
       (.I0(SL_DT_O_reg[20]),
        .I1(Q[0]),
        .I2(f2u_rd_data[19]),
        .I3(out[3]),
        .I4(out[2]),
        .O(D[19]));
  LUT3 #(
    .INIT(8'hD0)) 
    \SL_DT_O[1]_i_1 
       (.I0(out[2]),
        .I1(out[3]),
        .I2(f2u_rd_data[1]),
        .O(D[1]));
  LUT4 #(
    .INIT(16'hFF8A)) 
    \SL_DT_O[20]_i_1 
       (.I0(f2u_rd_data[20]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(SL_DT_O_reg[20]),
        .O(D[20]));
  LUT3 #(
    .INIT(8'hD0)) 
    \SL_DT_O[21]_i_1 
       (.I0(out[2]),
        .I1(out[3]),
        .I2(f2u_rd_data[21]),
        .O(D[21]));
  LUT4 #(
    .INIT(16'hFF8A)) 
    \SL_DT_O[22]_i_1 
       (.I0(f2u_rd_data[22]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(SL_DT_O_reg[22]),
        .O(D[22]));
  LUT3 #(
    .INIT(8'hD0)) 
    \SL_DT_O[23]_i_1 
       (.I0(out[2]),
        .I1(out[3]),
        .I2(f2u_rd_data[23]),
        .O(D[23]));
  LUT4 #(
    .INIT(16'hFF8A)) 
    \SL_DT_O[24]_i_1 
       (.I0(f2u_rd_data[24]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(SL_DT_O_reg[22]),
        .O(D[24]));
  LUT6 #(
    .INIT(64'hFFFFFF08FF08FF08)) 
    \SL_DT_O[25]_i_1 
       (.I0(SL_DT_O_reg[22]),
        .I1(\timeout_reg[2]_1 ),
        .I2(SL_DT_O_reg[25]),
        .I3(\SL_DT_O_reg[25]_0 ),
        .I4(SL_DT_O_reg[9]),
        .I5(f2u_rd_data[25]),
        .O(D[25]));
  LUT6 #(
    .INIT(64'hFF8A8A8A8A8A8A8A)) 
    \SL_DT_O[26]_i_1 
       (.I0(f2u_rd_data[26]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(SL_DT_O_reg[26]),
        .I4(\SL_DT_O_reg[26]_0 ),
        .I5(SL_DT_O_reg[22]),
        .O(D[26]));
  LUT5 #(
    .INIT(32'hFF8A8A8A)) 
    \SL_DT_O[27]_i_1 
       (.I0(f2u_rd_data[27]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(SL_DT_O_reg[27]),
        .I4(SL_DT_O_reg[22]),
        .O(D[27]));
  LUT5 #(
    .INIT(32'hFF8A8A8A)) 
    \SL_DT_O[28]_i_1 
       (.I0(f2u_rd_data[28]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(SL_DT_O_reg[28]),
        .I4(SL_DT_O_reg[22]),
        .O(D[28]));
  LUT6 #(
    .INIT(64'hFFEAEAEAC0C0C0C0)) 
    \SL_DT_O[29]_i_1 
       (.I0(Q[0]),
        .I1(SL_DT_O_reg[9]),
        .I2(f2u_rd_data[29]),
        .I3(SL_DT_O_reg[29]),
        .I4(\SL_DT_O_reg[29]_0 ),
        .I5(SL_DT_O_reg[20]),
        .O(D[29]));
  LUT3 #(
    .INIT(8'hD0)) 
    \SL_DT_O[2]_i_1 
       (.I0(out[2]),
        .I1(out[3]),
        .I2(f2u_rd_data[2]),
        .O(D[2]));
  LUT3 #(
    .INIT(8'hD0)) 
    \SL_DT_O[30]_i_1 
       (.I0(out[2]),
        .I1(out[3]),
        .I2(f2u_rd_data[30]),
        .O(D[30]));
  LUT6 #(
    .INIT(64'h44FF00F044000000)) 
    \SL_DT_O[31]_i_1 
       (.I0(out[4]),
        .I1(\SL_DT_O[31]_i_3_n_0 ),
        .I2(\WIDTH_34.BLK_512.u_fifo_n_1 ),
        .I3(out[3]),
        .I4(out[2]),
        .I5(\^state_reg [4]),
        .O(E));
  LUT3 #(
    .INIT(8'hD0)) 
    \SL_DT_O[31]_i_2 
       (.I0(out[2]),
        .I1(out[3]),
        .I2(f2u_rd_data[31]),
        .O(D[31]));
  LUT5 #(
    .INIT(32'h00C08000)) 
    \SL_DT_O[31]_i_3 
       (.I0(\cnt_reg[0]_4 ),
        .I1(sl_pktend_n_reg_reg_0),
        .I2(\WIDTH_34.BLK_512.u_fifo_n_1 ),
        .I3(out[1]),
        .I4(out[0]),
        .O(\SL_DT_O[31]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \SL_DT_O[31]_i_4 
       (.I0(out[4]),
        .I1(out[0]),
        .I2(out[1]),
        .O(\^state_reg [4]));
  LUT5 #(
    .INIT(32'hF888F8F8)) 
    \SL_DT_O[3]_i_1 
       (.I0(SL_DT_O_reg[20]),
        .I1(Q[0]),
        .I2(f2u_rd_data[3]),
        .I3(out[3]),
        .I4(out[2]),
        .O(D[3]));
  LUT3 #(
    .INIT(8'hD0)) 
    \SL_DT_O[4]_i_1 
       (.I0(out[2]),
        .I1(out[3]),
        .I2(f2u_rd_data[4]),
        .O(D[4]));
  LUT5 #(
    .INIT(32'hF888F8F8)) 
    \SL_DT_O[5]_i_1 
       (.I0(SL_DT_O_reg[20]),
        .I1(Q[0]),
        .I2(f2u_rd_data[5]),
        .I3(out[3]),
        .I4(out[2]),
        .O(D[5]));
  LUT3 #(
    .INIT(8'hD0)) 
    \SL_DT_O[6]_i_1 
       (.I0(out[2]),
        .I1(out[3]),
        .I2(f2u_rd_data[6]),
        .O(D[6]));
  LUT3 #(
    .INIT(8'hD0)) 
    \SL_DT_O[7]_i_1 
       (.I0(out[2]),
        .I1(out[3]),
        .I2(f2u_rd_data[7]),
        .O(D[7]));
  LUT5 #(
    .INIT(32'hF888F8F8)) 
    \SL_DT_O[8]_i_1 
       (.I0(SL_DT_O_reg[20]),
        .I1(Q[0]),
        .I2(f2u_rd_data[8]),
        .I3(out[3]),
        .I4(out[2]),
        .O(D[8]));
  LUT6 #(
    .INIT(64'h888F88888F888888)) 
    \SL_DT_O[9]_i_1 
       (.I0(SL_DT_O_reg[9]),
        .I1(f2u_rd_data[9]),
        .I2(\SL_DT_O_reg[9]_0 ),
        .I3(Q[0]),
        .I4(\SL_DT_O_reg[9]_1 ),
        .I5(Q[1]),
        .O(D[9]));
  LUT6 #(
    .INIT(64'hFFEFEFEFAFAFAFAF)) 
    SL_PKTEND_N_i_1
       (.I0(SL_WR_N_i_3_n_0),
        .I1(out[1]),
        .I2(SL_PKTEND_N_reg),
        .I3(\WIDTH_34.BLK_512.u_fifo_n_1 ),
        .I4(out[0]),
        .I5(out[4]),
        .O(\state_reg[1]_1 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFEEBBEEFB)) 
    SL_PKTEND_N_i_2
       (.I0(SL_PKTEND_N_i_3_n_0),
        .I1(out[4]),
        .I2(out[1]),
        .I3(out[3]),
        .I4(\SL_DT_O_reg[9]_0 ),
        .I5(SL_PKTEND_N_reg_0),
        .O(\state_reg[4]_0 ));
  LUT6 #(
    .INIT(64'hF2FF222200002222)) 
    SL_PKTEND_N_i_3
       (.I0(sl_wr_n_reg_reg_3),
        .I1(f2u_rd_data[32]),
        .I2(SL_WR_N_i_6_n_0),
        .I3(\cnt_reg[0]_4 ),
        .I4(out[1]),
        .I5(out[3]),
        .O(SL_PKTEND_N_i_3_n_0));
  LUT6 #(
    .INIT(64'hBFFBBBBBBBFBBBBB)) 
    SL_WR_N_i_1
       (.I0(SL_WR_N_i_3_n_0),
        .I1(SL_PKTEND_N_reg),
        .I2(out[1]),
        .I3(out[0]),
        .I4(out[4]),
        .I5(\WIDTH_34.BLK_512.u_fifo_n_1 ),
        .O(\state_reg[1]_2 ));
  LUT6 #(
    .INIT(64'hEFEBEFEBEFEFEFEB)) 
    SL_WR_N_i_2
       (.I0(SL_WR_N_i_5_n_0),
        .I1(out[4]),
        .I2(out[3]),
        .I3(out[1]),
        .I4(out[2]),
        .I5(out[0]),
        .O(\state_reg[4]_1 ));
  LUT6 #(
    .INIT(64'hFF1CFF00FF000000)) 
    SL_WR_N_i_3
       (.I0(SL_WR_N_i_6_n_0),
        .I1(out[1]),
        .I2(out[0]),
        .I3(out[4]),
        .I4(out[2]),
        .I5(out[3]),
        .O(SL_WR_N_i_3_n_0));
  LUT6 #(
    .INIT(64'hFFFF80B380B380B3)) 
    SL_WR_N_i_5
       (.I0(f2u_rd_data[33]),
        .I1(SL_DT_O_reg[9]),
        .I2(sl_wr_n_reg_reg_3),
        .I3(sl_pktend_n_reg_reg_0),
        .I4(out[1]),
        .I5(SL_WR_N_i_8_n_0),
        .O(SL_WR_N_i_5_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    SL_WR_N_i_6
       (.I0(sl_pktend_n_reg_reg_0),
        .I1(\WIDTH_34.BLK_512.u_fifo_n_1 ),
        .O(SL_WR_N_i_6_n_0));
  LUT3 #(
    .INIT(8'h7F)) 
    SL_WR_N_i_8
       (.I0(\WIDTH_34.BLK_512.u_fifo_n_1 ),
        .I1(sl_pktend_n_reg_reg_0),
        .I2(\cnt_reg[0]_4 ),
        .O(SL_WR_N_i_8_n_0));
  (* IMPORTED_FROM = "/home/adki/work/projects/ez-usb-fx3/hwlib/gpif2mst/fifo_async/z7/vivado.2019.2/gpif2mst_async_34x512/gpif2mst_async_34x512.dcp" *) 
  (* IMPORTED_TYPE = "CHECKPOINT" *) 
  (* IS_IMPORTED *) 
  (* black_box_pad_pin = "m_aclk,s_aclk,s_aresetn,s_axis_tvalid,s_axis_tready,s_axis_tdata[31:0],s_axis_tuser[1:0],m_axis_tvalid,m_axis_tready,m_axis_tdata[31:0],m_axis_tuser[1:0],axis_wr_data_count[9:0],axis_rd_data_count[9:0],axis_prog_full,axis_prog_empty" *) 
  (* syn_black_box = "1" *) 
  (* x_core_info = "fifo_generator_v13_2_5,Vivado 2019.2" *) 
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_34x512 \WIDTH_34.BLK_512.u_fifo 
       (.axis_prog_empty(\WIDTH_34.BLK_512.u_fifo_n_57 ),
        .axis_prog_full(\WIDTH_34.BLK_512.u_fifo_n_56 ),
        .axis_rd_data_count({\WIDTH_34.BLK_512.u_fifo_n_46 ,\WIDTH_34.BLK_512.u_fifo_n_47 ,\WIDTH_34.BLK_512.u_fifo_n_48 ,\WIDTH_34.BLK_512.u_fifo_n_49 ,\WIDTH_34.BLK_512.u_fifo_n_50 ,\WIDTH_34.BLK_512.u_fifo_n_51 ,\WIDTH_34.BLK_512.u_fifo_n_52 ,\WIDTH_34.BLK_512.u_fifo_n_53 ,\WIDTH_34.BLK_512.u_fifo_n_54 ,\WIDTH_34.BLK_512.u_fifo_n_55 }),
        .axis_wr_data_count(witems),
        .m_aclk(SYS_CLK),
        .m_axis_tdata(f2u_rd_data[31:0]),
        .m_axis_tready(f2u_rd_ready),
        .m_axis_tuser(f2u_rd_data[33:32]),
        .m_axis_tvalid(\WIDTH_34.BLK_512.u_fifo_n_1 ),
        .s_aclk(ACLK),
        .s_aresetn(SYS_RST_N),
        .s_axis_tdata(rd_dout),
        .s_axis_tready(f2u_wr_ready),
        .s_axis_tuser({1'b0,1'b0}),
        .s_axis_tvalid(f2u_wr_valid));
  LUT6 #(
    .INIT(64'h00000088F0000088)) 
    \WIDTH_34.BLK_512.u_fifo_i_2 
       (.I0(\^state_reg [4]),
        .I1(\WIDTH_34.BLK_512.u_fifo_n_1 ),
        .I2(\SL_DT_O[31]_i_3_n_0 ),
        .I3(out[3]),
        .I4(out[2]),
        .I5(out[4]),
        .O(f2u_rd_ready));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFEFEE)) 
    \cnt[15]_i_1 
       (.I0(cnt_reg),
        .I1(\cnt_reg[0]_0 ),
        .I2(\cnt_reg[0]_1 ),
        .I3(\cnt_reg[0]_2 ),
        .I4(\cnt[15]_i_7_n_0 ),
        .I5(\cnt[15]_i_8_n_0 ),
        .O(SL_FLAGA));
  LUT6 #(
    .INIT(64'h0000088000000080)) 
    \cnt[15]_i_7 
       (.I0(\cnt_reg[0]_3 ),
        .I1(sl_wr_n_reg_reg_3),
        .I2(out[0]),
        .I3(out[1]),
        .I4(SL_WR_N_i_6_n_0),
        .I5(\cnt_reg[0]_4 ),
        .O(\cnt[15]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h4040400040004000)) 
    \cnt[15]_i_8 
       (.I0(\cnt_reg[0]_5 ),
        .I1(out[4]),
        .I2(out[0]),
        .I3(out[1]),
        .I4(\WIDTH_34.BLK_512.u_fifo_n_1 ),
        .I5(sl_wr_n_reg_reg_3),
        .O(\cnt[15]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFF8F8F8)) 
    sl_pktend_n_reg_i_1
       (.I0(out[3]),
        .I1(out[4]),
        .I2(sl_pktend_n_reg_i_2_n_0),
        .I3(sl_pktend_n_reg_i_3_n_0),
        .I4(sl_pktend_n_reg_reg),
        .I5(sl_pktend_n_reg_i_4_n_0),
        .O(\state_reg[3]_0 ));
  LUT6 #(
    .INIT(64'h008000F000800080)) 
    sl_pktend_n_reg_i_2
       (.I0(\WIDTH_34.BLK_512.u_fifo_n_1 ),
        .I1(\^state_reg [4]),
        .I2(sl_wr_n_reg_reg_3),
        .I3(f2u_rd_data[32]),
        .I4(sl_wr_n_reg_reg_2),
        .I5(sl_pktend_n_reg_i_6_n_0),
        .O(sl_pktend_n_reg_i_2_n_0));
  LUT6 #(
    .INIT(64'hDDDFFCFFFDFFFFFF)) 
    sl_pktend_n_reg_i_3
       (.I0(sl_pktend_n_reg_reg_0),
        .I1(sl_pktend_n_reg_reg_2),
        .I2(out[3]),
        .I3(out[4]),
        .I4(out[2]),
        .I5(\WIDTH_34.BLK_512.u_fifo_n_1 ),
        .O(sl_pktend_n_reg_i_3_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFD000000)) 
    sl_pktend_n_reg_i_4
       (.I0(sl_pktend_n_reg_reg_0),
        .I1(sl_pktend_n_reg_reg_1),
        .I2(sl_wr_n_reg_reg_3),
        .I3(out[2]),
        .I4(out[4]),
        .I5(sl_wr_n_reg_i_4_n_0),
        .O(sl_pktend_n_reg_i_4_n_0));
  LUT4 #(
    .INIT(16'h08F0)) 
    sl_pktend_n_reg_i_6
       (.I0(sl_pktend_n_reg_reg_0),
        .I1(\WIDTH_34.BLK_512.u_fifo_n_1 ),
        .I2(out[1]),
        .I3(out[0]),
        .O(sl_pktend_n_reg_i_6_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFEA)) 
    sl_wr_n_reg_i_1
       (.I0(sl_wr_n_reg_i_2_n_0),
        .I1(sl_wr_n_reg_reg_0),
        .I2(sl_pktend_n_reg_i_3_n_0),
        .I3(sl_wr_n_reg_i_3_n_0),
        .I4(sl_wr_n_reg_i_4_n_0),
        .I5(sl_wr_n_reg_reg_1),
        .O(sl_wr_n_reg_reg));
  LUT6 #(
    .INIT(64'hF0F0535000000000)) 
    sl_wr_n_reg_i_2
       (.I0(sl_pktend_n_reg_reg_0),
        .I1(\state[4]_i_8_n_0 ),
        .I2(out[2]),
        .I3(f2u_rd_data[33]),
        .I4(sl_pktend_n_reg_reg_1),
        .I5(out[4]),
        .O(sl_wr_n_reg_i_2_n_0));
  LUT6 #(
    .INIT(64'h00001C0000000000)) 
    sl_wr_n_reg_i_3
       (.I0(SL_WR_N_i_6_n_0),
        .I1(out[1]),
        .I2(out[0]),
        .I3(f2u_rd_data[33]),
        .I4(sl_wr_n_reg_reg_2),
        .I5(sl_wr_n_reg_reg_3),
        .O(sl_wr_n_reg_i_3_n_0));
  LUT6 #(
    .INIT(64'h0C080C000C000C03)) 
    sl_wr_n_reg_i_4
       (.I0(SL_WR_N_i_8_n_0),
        .I1(out[1]),
        .I2(out[0]),
        .I3(out[4]),
        .I4(out[2]),
        .I5(out[3]),
        .O(sl_wr_n_reg_i_4_n_0));
  LUT6 #(
    .INIT(64'hFFFEFFFFFFFEFFFE)) 
    \state[0]_i_1 
       (.I0(\state[0]_i_2_n_0 ),
        .I1(\^state_reg [0]),
        .I2(\state[0]_i_4_n_0 ),
        .I3(\state[0]_i_5_n_0 ),
        .I4(\state_reg[4]_2 [2]),
        .I5(\state_reg[0]_0 ),
        .O(SL_FLAGD[0]));
  LUT5 #(
    .INIT(32'h0088F888)) 
    \state[0]_i_12 
       (.I0(\state_reg[4]_7 ),
        .I1(\state_reg[1]_8 ),
        .I2(\state[0]_i_4_0 ),
        .I3(sl_pktend_n_reg_reg_0),
        .I4(\WIDTH_34.BLK_512.u_fifo_n_1 ),
        .O(\state[0]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h0000000001000000)) 
    \state[0]_i_13 
       (.I0(\WIDTH_34.BLK_512.u_fifo_n_1 ),
        .I1(\state_reg[4]_2 [1]),
        .I2(sl_pktend_n_reg_reg_0),
        .I3(\state_reg[4]_2 [0]),
        .I4(\state_reg[4]_2 [4]),
        .I5(\state_reg[4]_2 [3]),
        .O(\state[0]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h88F8888888888888)) 
    \state[0]_i_14 
       (.I0(\state_reg[1]_8 ),
        .I1(\state[1]_i_15_n_0 ),
        .I2(\state[0]_i_5_0 ),
        .I3(\state[0]_i_5_1 ),
        .I4(\state[0]_i_5_2 ),
        .I5(\state[0]_i_2_0 ),
        .O(\state[0]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h0000007000000000)) 
    \state[0]_i_15 
       (.I0(sl_pktend_n_reg_reg_0),
        .I1(\WIDTH_34.BLK_512.u_fifo_n_1 ),
        .I2(\state_reg[4]_2 [3]),
        .I3(\state_reg[4]_2 [4]),
        .I4(\state_reg[4]_2 [1]),
        .I5(\state_reg[4]_2 [2]),
        .O(\state[0]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEAAAAAFFFAAAA)) 
    \state[0]_i_2 
       (.I0(\state[0]_i_7_n_0 ),
        .I1(\state_reg[2]_3 [1]),
        .I2(sl_wr_n_reg_reg_3),
        .I3(\state_reg[0]_4 ),
        .I4(\state_reg[0]_5 ),
        .I5(\state_reg[0]_6 ),
        .O(\state[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF8808)) 
    \state[0]_i_4 
       (.I0(\state_reg[0]_7 ),
        .I1(\state_reg[0]_8 ),
        .I2(sl_pktend_n_reg_reg_0),
        .I3(sl_wr_n_reg_reg_3),
        .I4(\state_reg[0]_9 ),
        .I5(\state[0]_i_12_n_0 ),
        .O(\state[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFAABAAAAA)) 
    \state[0]_i_5 
       (.I0(\state[0]_i_13_n_0 ),
        .I1(axis_prog_full),
        .I2(\state_reg[0]_1 ),
        .I3(\state_reg[0]_2 ),
        .I4(\state_reg[0]_3 ),
        .I5(\state[0]_i_14_n_0 ),
        .O(\state[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF7F007F007F00)) 
    \state[0]_i_7 
       (.I0(\state_reg[2]_3 [0]),
        .I1(\state_reg[2]_4 ),
        .I2(\state_reg[2]_3 [1]),
        .I3(\state[0]_i_15_n_0 ),
        .I4(\state_reg[4]_2 [3]),
        .I5(\state[0]_i_2_0 ),
        .O(\state[0]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \state[1]_i_1 
       (.I0(\state[1]_i_2_n_0 ),
        .I1(\state_reg[1]_3 ),
        .I2(\state[1]_i_4_n_0 ),
        .I3(\state[1]_i_5_n_0 ),
        .I4(\state[1]_i_6_n_0 ),
        .I5(\state[1]_i_7_n_0 ),
        .O(SL_FLAGD[1]));
  LUT3 #(
    .INIT(8'h08)) 
    \state[1]_i_15 
       (.I0(\WIDTH_34.BLK_512.u_fifo_n_1 ),
        .I1(sl_pktend_n_reg_reg_0),
        .I2(\cnt_reg[0]_4 ),
        .O(\state[1]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h88F8FFFF88F800F0)) 
    \state[1]_i_2 
       (.I0(\state_reg[1]_4 ),
        .I1(\state_reg[1]_5 ),
        .I2(\state_reg[1]_6 ),
        .I3(\WIDTH_34.BLK_512.u_fifo_n_1 ),
        .I4(\state_reg[4]_2 [3]),
        .I5(\state_reg[1]_7 ),
        .O(\state[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFEAAA)) 
    \state[1]_i_4 
       (.I0(\state_reg[1]_11 ),
        .I1(\state_reg[1]_12 ),
        .I2(\WIDTH_34.BLK_512.u_fifo_n_1 ),
        .I3(sl_wr_n_reg_reg_3),
        .I4(\state_reg[0]_9 ),
        .O(\state[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hEEEE0000EFFF0000)) 
    \state[1]_i_5 
       (.I0(\state_reg[1]_10 ),
        .I1(\state[1]_i_15_n_0 ),
        .I2(\state_reg[2]_4 ),
        .I3(\state_reg[2]_3 [0]),
        .I4(\state_reg[1]_8 ),
        .I5(sl_pktend_n_reg_reg_0),
        .O(\state[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hF000CC88CC00CC88)) 
    \state[1]_i_6 
       (.I0(\state_reg[1]_8 ),
        .I1(\state_reg[4]_7 ),
        .I2(sl_wr_n_reg_reg_3),
        .I3(\state_reg[1]_9 ),
        .I4(\WIDTH_34.BLK_512.u_fifo_n_1 ),
        .I5(sl_pktend_n_reg_reg_0),
        .O(\state[1]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h20FFFFFF20AA20AA)) 
    \state[1]_i_7 
       (.I0(\state_reg[0]_0 ),
        .I1(SL_WR_N_i_6_n_0),
        .I2(sl_wr_n_reg_reg_3),
        .I3(\state_reg[4]_2 [2]),
        .I4(\state_reg[4]_2 [3]),
        .I5(\state_reg[1]_9 ),
        .O(\state[1]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFEFEFEFEFFFEFEFE)) 
    \state[2]_i_1 
       (.I0(\^state_reg [2]),
        .I1(\state[2]_i_3_n_0 ),
        .I2(\state_reg[2]_0 ),
        .I3(\state[2]_i_5_n_0 ),
        .I4(\state_reg[2]_1 ),
        .I5(\state_reg[2]_2 ),
        .O(SL_FLAGD[2]));
  LUT6 #(
    .INIT(64'h0888080888888888)) 
    \state[2]_i_10 
       (.I0(\state_reg[0]_7 ),
        .I1(\state[2]_i_3_0 ),
        .I2(SL_WR_N_i_6_n_0),
        .I3(\state_reg[2]_3 [0]),
        .I4(\state_reg[2]_4 ),
        .I5(\state_reg[2]_3 [1]),
        .O(\state[2]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF0B000000)) 
    \state[2]_i_3 
       (.I0(\cnt_reg[0]_4 ),
        .I1(sl_wr_n_reg_reg_3),
        .I2(\state_reg[4]_2 [1]),
        .I3(\state_reg[0]_8 ),
        .I4(\WIDTH_34.BLK_512.u_fifo_n_1 ),
        .I5(\state[2]_i_10_n_0 ),
        .O(\state[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hF444F444FF0FFFFF)) 
    \state[2]_i_5 
       (.I0(\state_reg[2]_3 [0]),
        .I1(\state_reg[2]_4 ),
        .I2(sl_pktend_n_reg_reg_0),
        .I3(\WIDTH_34.BLK_512.u_fifo_n_1 ),
        .I4(\cnt_reg[0]_4 ),
        .I5(\state_reg[2]_3 [1]),
        .O(\state[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \state[3]_i_1 
       (.I0(\state[3]_i_2_n_0 ),
        .I1(\state[3]_i_3_n_0 ),
        .I2(\state[3]_i_4_n_0 ),
        .I3(\state_reg[3]_1 ),
        .I4(\state_reg[3]_2 ),
        .I5(\state[3]_i_7_n_0 ),
        .O(SL_FLAGD[3]));
  LUT6 #(
    .INIT(64'hFFFFFFFFBBF30000)) 
    \state[3]_i_2 
       (.I0(\state_reg[3]_7 ),
        .I1(\state_reg[4]_2 [2]),
        .I2(sl_wr_n_reg_reg_3),
        .I3(SL_WR_N_i_6_n_0),
        .I4(\state_reg[3]_8 ),
        .I5(\state_reg[3]_9 ),
        .O(\state[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h08000000)) 
    \state[3]_i_21 
       (.I0(\state_reg[2]_3 [1]),
        .I1(\state_reg[4]_2 [2]),
        .I2(\cnt_reg[0]_4 ),
        .I3(sl_pktend_n_reg_reg_0),
        .I4(\WIDTH_34.BLK_512.u_fifo_n_1 ),
        .O(\state[3]_i_21_n_0 ));
  LUT5 #(
    .INIT(32'h00080808)) 
    \state[3]_i_23 
       (.I0(\state_reg[4]_2 [2]),
        .I1(\state_reg[2]_3 [1]),
        .I2(\state_reg[2]_3 [0]),
        .I3(\WIDTH_34.BLK_512.u_fifo_n_1 ),
        .I4(sl_pktend_n_reg_reg_0),
        .O(\state[3]_i_23_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAEEEEEEEE)) 
    \state[3]_i_3 
       (.I0(\state_reg[3]_10 ),
        .I1(\state_reg[1]_8 ),
        .I2(sl_pktend_n_reg_reg_0),
        .I3(\WIDTH_34.BLK_512.u_fifo_n_1 ),
        .I4(sl_wr_n_reg_reg_3),
        .I5(\state_reg[4]_2 [2]),
        .O(\state[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFEEEEFEEE)) 
    \state[3]_i_4 
       (.I0(\state_reg[3]_3 ),
        .I1(\state_reg[3]_4 ),
        .I2(\state_reg[3]_5 ),
        .I3(\cnt_reg[0]_4 ),
        .I4(\state[4]_i_8_n_0 ),
        .I5(\state_reg[3]_6 ),
        .O(\state[3]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h0000E0A0)) 
    \state[3]_i_7 
       (.I0(\state[3]_i_21_n_0 ),
        .I1(\state_reg[2]_4 ),
        .I2(\state_reg[0]_0 ),
        .I3(\state[3]_i_23_n_0 ),
        .I4(sl_wr_n_reg_reg_3),
        .O(\state[3]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEEE)) 
    \state[4]_i_1 
       (.I0(\state[4]_i_2_n_0 ),
        .I1(\state[4]_i_3_n_0 ),
        .I2(\state_reg[4]_3 ),
        .I3(\state_reg[4]_4 ),
        .I4(\state[4]_i_6_n_0 ),
        .I5(\state[4]_i_7_n_0 ),
        .O(SL_FLAGD[4]));
  LUT6 #(
    .INIT(64'h44F4444444444444)) 
    \state[4]_i_12 
       (.I0(\state[4]_i_6_0 ),
        .I1(\state[4]_i_6_1 ),
        .I2(\state_reg[4]_7 ),
        .I3(\WIDTH_34.BLK_512.u_fifo_n_1 ),
        .I4(\state_reg[4]_2 [2]),
        .I5(\state_reg[1]_8 ),
        .O(\state[4]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h0000004000000000)) 
    \state[4]_i_17 
       (.I0(\state_reg[2]_2 ),
        .I1(\cnt_reg[0]_4 ),
        .I2(sl_pktend_n_reg_reg_0),
        .I3(\state_reg[2]_3 [1]),
        .I4(\WIDTH_34.BLK_512.u_fifo_n_1 ),
        .I5(\state[4]_i_7_0 ),
        .O(\state[4]_i_17_n_0 ));
  LUT6 #(
    .INIT(64'h000FBBBB00000000)) 
    \state[4]_i_2 
       (.I0(\state[4]_i_8_n_0 ),
        .I1(\cnt_reg[0]_4 ),
        .I2(\SL_DT_O_reg[9]_0 ),
        .I3(\state_reg[4]_2 [2]),
        .I4(\state_reg[4]_2 [1]),
        .I5(\state_reg[0]_8 ),
        .O(\state[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h08A80808)) 
    \state[4]_i_3 
       (.I0(\state_reg[4]_10 ),
        .I1(\state_reg[4]_7 ),
        .I2(\WIDTH_34.BLK_512.u_fifo_n_1 ),
        .I3(sl_wr_n_reg_reg_3),
        .I4(sl_pktend_n_reg_reg_0),
        .O(\state[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \state[4]_i_6 
       (.I0(\state[4]_i_12_n_0 ),
        .I1(\state_reg[4]_5 ),
        .I2(\state_reg[4]_6 ),
        .I3(\state_reg[4]_7 ),
        .I4(\state_reg[4]_8 ),
        .I5(\state_reg[4]_9 ),
        .O(\state[4]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00000010)) 
    \state[4]_i_7 
       (.I0(sl_wr_n_reg_reg_3),
        .I1(\state_reg[2]_2 ),
        .I2(\state_reg[4]_2 [1]),
        .I3(\state_reg[4]_2 [4]),
        .I4(SL_WR_N_i_8_n_0),
        .I5(\state[4]_i_17_n_0 ),
        .O(\state[4]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h0001FFFF)) 
    \state[4]_i_8 
       (.I0(\state[3]_i_4_0 ),
        .I1(\state[3]_i_4_1 ),
        .I2(\state[3]_i_4_2 ),
        .I3(\state[3]_i_4_3 ),
        .I4(\WIDTH_34.BLK_512.u_fifo_n_1 ),
        .O(\state[4]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h2AFFFA00)) 
    \timeout[0]_i_1 
       (.I0(out[1]),
        .I1(out[0]),
        .I2(out[3]),
        .I3(\timeout[2]_i_3_n_0 ),
        .I4(\timeout_reg[2]_1 ),
        .O(\state_reg[1]_0 ));
  LUT6 #(
    .INIT(64'h00D0FFFFD0000000)) 
    \timeout[1]_i_1 
       (.I0(out[1]),
        .I1(out[0]),
        .I2(out[3]),
        .I3(\timeout_reg[2]_1 ),
        .I4(\timeout[2]_i_3_n_0 ),
        .I5(\timeout_reg[2]_0 ),
        .O(\^state_reg [1]));
  LUT6 #(
    .INIT(64'h0888FFFF80000000)) 
    \timeout[2]_i_1 
       (.I0(timeout_reg),
        .I1(out[3]),
        .I2(\timeout_reg[2]_0 ),
        .I3(\timeout_reg[2]_1 ),
        .I4(\timeout[2]_i_3_n_0 ),
        .I5(\timeout_reg[2]_2 ),
        .O(\^state_reg [3]));
  LUT6 #(
    .INIT(64'h00000300F000800F)) 
    \timeout[2]_i_3 
       (.I0(\timeout[2]_i_4_n_0 ),
        .I1(out[3]),
        .I2(out[2]),
        .I3(out[1]),
        .I4(out[0]),
        .I5(out[4]),
        .O(\timeout[2]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h3010)) 
    \timeout[2]_i_4 
       (.I0(\state_reg[2]_3 [1]),
        .I1(\cnt_reg[0]_4 ),
        .I2(sl_pktend_n_reg_reg_0),
        .I3(\WIDTH_34.BLK_512.u_fifo_n_1 ),
        .O(\timeout[2]_i_4_n_0 ));
endmodule

(* ORIG_REF_NAME = "gpif2mst_gpif2mst_async" *) 
module design_riscv_cache_bfm_axi_if_0_0_gpif2mst_gpif2mst_async__xdcDup__1
   (ACLK,
    CMD1__2,
    SL_FLAGA,
    SL_OE_N_reg,
    SL_OE_N_reg_0,
    SL_RST_N,
    SYS_CLK,
    SYS_CLK_STABLE,
    axis_prog_full,
    cmd_rd_ready,
    cmd_rd_valid,
    cnt_reg,
    \cnt_reg[0]_0 ,
    \cnt_reg[0]_1 ,
    \cnt_reg[0]_2 ,
    s_aresetn,
    s_axis_tvalid,
    sl_oe_n_reg_reg_0,
    sl_oe_n_reg_reg_1,
    sl_oe_n_reg_reg_2,
    sl_oe_n_reg_reg_3,
    sl_rd_n_reg_i_4_1,
    sl_rd_n_reg_reg,
    sl_rd_n_reg_reg_0,
    state_reg,
    Q,
    SL_OE_N_reg_1,
    SL_OE_N_reg_2,
    cmd_rd_data,
    out,
    sl_oe_n_reg_reg,
    sl_rd_n_reg_i_4_0);
  input ACLK;
  output CMD1__2;
  output SL_FLAGA;
  input SL_OE_N_reg;
  input SL_OE_N_reg_0;
  input SL_RST_N;
  input SYS_CLK;
  input SYS_CLK_STABLE;
  output axis_prog_full;
  input cmd_rd_ready;
  output cmd_rd_valid;
  input [0:0]cnt_reg;
  input \cnt_reg[0]_0 ;
  input \cnt_reg[0]_1 ;
  input \cnt_reg[0]_2 ;
  output s_aresetn;
  input s_axis_tvalid;
  input sl_oe_n_reg_reg_0;
  input sl_oe_n_reg_reg_1;
  input sl_oe_n_reg_reg_2;
  input sl_oe_n_reg_reg_3;
  input sl_rd_n_reg_i_4_1;
  input sl_rd_n_reg_reg;
  input sl_rd_n_reg_reg_0;
  output [4:1]state_reg;
  input [31:0]Q;
  input [0:0]SL_OE_N_reg_1;
  input [1:0]SL_OE_N_reg_2;
  output [31:0]cmd_rd_data;
  input [3:0]out;
  input [4:0]sl_oe_n_reg_reg;
  input [1:0]sl_rd_n_reg_i_4_0;

  wire ACLK;
  wire CMD1__2;
  wire [31:0]Q;
  wire SL_FLAGA;
  wire SL_OE_N_i_2_n_0;
  wire SL_OE_N_reg;
  wire SL_OE_N_reg_0;
  wire [0:0]SL_OE_N_reg_1;
  wire [1:0]SL_OE_N_reg_2;
  wire SL_RST_N;
  wire SYS_CLK;
  wire SYS_CLK_STABLE;
  wire \WIDTH_32.BLK_512.u_fifo_n_0 ;
  wire \WIDTH_32.BLK_512.u_fifo_n_55 ;
  wire axis_prog_full;
  wire [31:0]cmd_rd_data;
  wire [9:0]cmd_rd_items;
  wire cmd_rd_ready;
  wire cmd_rd_valid;
  wire \cnt[15]_i_11_n_0 ;
  wire [0:0]cnt_reg;
  wire \cnt_reg[0]_0 ;
  wire \cnt_reg[0]_1 ;
  wire \cnt_reg[0]_2 ;
  wire [3:0]out;
  wire s_aresetn;
  wire s_axis_tvalid;
  wire sl_oe_n_reg_i_2_n_0;
  wire [4:0]sl_oe_n_reg_reg;
  wire sl_oe_n_reg_reg_0;
  wire sl_oe_n_reg_reg_1;
  wire sl_oe_n_reg_reg_2;
  wire sl_oe_n_reg_reg_3;
  wire sl_rd_n_reg_i_2_n_0;
  wire sl_rd_n_reg_i_3_n_0;
  wire [1:0]sl_rd_n_reg_i_4_0;
  wire sl_rd_n_reg_i_4_1;
  wire sl_rd_n_reg_i_4_n_0;
  wire sl_rd_n_reg_i_6_n_0;
  wire sl_rd_n_reg_reg;
  wire sl_rd_n_reg_reg_0;
  wire [4:1]state_reg;
  wire [9:0]witems;

  LUT6 #(
    .INIT(64'hAAAAAAAAFFAABABA)) 
    SL_OE_N_i_1
       (.I0(SL_OE_N_reg),
        .I1(sl_oe_n_reg_reg[1]),
        .I2(SL_OE_N_i_2_n_0),
        .I3(SL_OE_N_reg_0),
        .I4(sl_oe_n_reg_reg[2]),
        .I5(sl_oe_n_reg_reg[0]),
        .O(state_reg[1]));
  LUT5 #(
    .INIT(32'h0FFF0FDD)) 
    SL_OE_N_i_2
       (.I0(\cnt_reg[0]_0 ),
        .I1(axis_prog_full),
        .I2(SL_OE_N_reg_1),
        .I3(SL_OE_N_reg_2[0]),
        .I4(SL_OE_N_reg_2[1]),
        .O(SL_OE_N_i_2_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    SYS_RST_N_INST_0
       (.I0(SL_RST_N),
        .I1(SYS_CLK_STABLE),
        .O(s_aresetn));
  (* IMPORTED_FROM = "/home/adki/work/projects/ez-usb-fx3/hwlib/gpif2mst/fifo_async/z7/vivado.2019.2/gpif2mst_async_32x512/gpif2mst_async_32x512.dcp" *) 
  (* IMPORTED_TYPE = "CHECKPOINT" *) 
  (* IS_IMPORTED *) 
  (* black_box_pad_pin = "m_aclk,s_aclk,s_aresetn,s_axis_tvalid,s_axis_tready,s_axis_tdata[31:0],m_axis_tvalid,m_axis_tready,m_axis_tdata[31:0],axis_wr_data_count[9:0],axis_rd_data_count[9:0],axis_prog_full,axis_prog_empty" *) 
  (* syn_black_box = "1" *) 
  (* x_core_info = "fifo_generator_v13_2_5,Vivado 2019.2" *) 
  design_riscv_cache_bfm_axi_if_0_0_gpif2mst_async_32x512 \WIDTH_32.BLK_512.u_fifo 
       (.axis_prog_empty(\WIDTH_32.BLK_512.u_fifo_n_55 ),
        .axis_prog_full(axis_prog_full),
        .axis_rd_data_count(cmd_rd_items),
        .axis_wr_data_count(witems),
        .m_aclk(ACLK),
        .m_axis_tdata(cmd_rd_data),
        .m_axis_tready(cmd_rd_ready),
        .m_axis_tvalid(cmd_rd_valid),
        .s_aclk(SYS_CLK),
        .s_aresetn(s_aresetn),
        .s_axis_tdata(Q),
        .s_axis_tready(\WIDTH_32.BLK_512.u_fifo_n_0 ),
        .s_axis_tvalid(s_axis_tvalid));
  LUT4 #(
    .INIT(16'hFF1D)) 
    \cnt[15]_i_11 
       (.I0(axis_prog_full),
        .I1(sl_rd_n_reg_i_4_0[0]),
        .I2(sl_rd_n_reg_i_4_1),
        .I3(sl_rd_n_reg_i_4_0[1]),
        .O(\cnt[15]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \cnt[15]_i_3 
       (.I0(\cnt[15]_i_11_n_0 ),
        .I1(cnt_reg),
        .I2(\cnt_reg[0]_0 ),
        .I3(sl_oe_n_reg_reg[4]),
        .I4(\cnt_reg[0]_1 ),
        .I5(\cnt_reg[0]_2 ),
        .O(SL_FLAGA));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFEAAAA)) 
    sl_oe_n_reg_i_1
       (.I0(sl_oe_n_reg_i_2_n_0),
        .I1(sl_oe_n_reg_reg[2]),
        .I2(sl_oe_n_reg_reg_0),
        .I3(sl_oe_n_reg_reg[3]),
        .I4(sl_oe_n_reg_reg[4]),
        .I5(sl_oe_n_reg_reg_1),
        .O(state_reg[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFF00000004)) 
    sl_oe_n_reg_i_2
       (.I0(sl_oe_n_reg_reg[0]),
        .I1(SL_OE_N_i_2_n_0),
        .I2(sl_oe_n_reg_reg[1]),
        .I3(sl_oe_n_reg_reg_2),
        .I4(sl_oe_n_reg_reg[4]),
        .I5(sl_oe_n_reg_reg_3),
        .O(sl_oe_n_reg_i_2_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFAAABAAAA)) 
    sl_rd_n_reg_i_1
       (.I0(sl_rd_n_reg_i_2_n_0),
        .I1(sl_oe_n_reg_reg[4]),
        .I2(sl_oe_n_reg_reg[2]),
        .I3(sl_oe_n_reg_reg[3]),
        .I4(sl_oe_n_reg_reg[1]),
        .I5(sl_rd_n_reg_i_3_n_0),
        .O(state_reg[4]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFEAAAA)) 
    sl_rd_n_reg_i_2
       (.I0(sl_rd_n_reg_i_4_n_0),
        .I1(sl_oe_n_reg_reg[0]),
        .I2(sl_oe_n_reg_reg[3]),
        .I3(sl_oe_n_reg_reg[4]),
        .I4(sl_rd_n_reg_reg),
        .I5(sl_rd_n_reg_reg_0),
        .O(sl_rd_n_reg_i_2_n_0));
  LUT6 #(
    .INIT(64'h000000000005000D)) 
    sl_rd_n_reg_i_3
       (.I0(\cnt_reg[0]_0 ),
        .I1(sl_rd_n_reg_i_6_n_0),
        .I2(sl_oe_n_reg_reg[4]),
        .I3(sl_oe_n_reg_reg[0]),
        .I4(sl_oe_n_reg_reg[1]),
        .I5(sl_oe_n_reg_reg[3]),
        .O(sl_rd_n_reg_i_3_n_0));
  LUT6 #(
    .INIT(64'h00FF000000110F00)) 
    sl_rd_n_reg_i_4
       (.I0(sl_oe_n_reg_reg[3]),
        .I1(\cnt[15]_i_11_n_0 ),
        .I2(sl_oe_n_reg_reg[1]),
        .I3(sl_oe_n_reg_reg[0]),
        .I4(sl_oe_n_reg_reg[2]),
        .I5(sl_oe_n_reg_reg[4]),
        .O(sl_rd_n_reg_i_4_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    sl_rd_n_reg_i_6
       (.I0(SL_OE_N_reg_2[1]),
        .I1(SL_OE_N_reg_2[0]),
        .I2(axis_prog_full),
        .O(sl_rd_n_reg_i_6_n_0));
  LUT6 #(
    .INIT(64'h0001000000000000)) 
    \state_cmd[0]_i_3 
       (.I0(out[2]),
        .I1(out[3]),
        .I2(out[0]),
        .I3(out[1]),
        .I4(cmd_rd_valid),
        .I5(cmd_rd_ready),
        .O(CMD1__2));
endmodule

(* ORIG_REF_NAME = "trx_axi" *) 
module design_riscv_cache_bfm_axi_if_0_0_trx_axi
   (ACLK,
    ARESETn,
    ARLOCK,
    ARREADY,
    ARVALID,
    AWLOCK,
    AWREADY,
    AWVALID,
    BREADY1__0,
    BREADY_reg_0,
    BVALID,
    CMD1__2,
    RREADY,
    RVALID,
    WLAST,
    WREADY,
    WVALID,
    cmd_rd_ready,
    cmd_rd_valid,
    f2u_wr_ready,
    f2u_wr_valid,
    u2f_rd_ready,
    u2f_rd_valid,
    ACLK_0,
    ARADDR,
    ARBURST,
    ARID,
    ARLEN,
    ARSIZE,
    AWADDR,
    AWBURST,
    AWID,
    AWLEN,
    AWSIZE,
    BRESP,
    D,
    GPOUT,
    RDATA,
    RRESP,
    cmd_rd_data,
    rd_dout,
    u2f_rd_data);
  input ACLK;
  input ARESETn;
  output ARLOCK;
  input ARREADY;
  output ARVALID;
  output AWLOCK;
  input AWREADY;
  output AWVALID;
  input BREADY1__0;
  output BREADY_reg_0;
  input BVALID;
  input CMD1__2;
  output RREADY;
  input RVALID;
  output WLAST;
  input WREADY;
  output WVALID;
  output cmd_rd_ready;
  input cmd_rd_valid;
  input f2u_wr_ready;
  output f2u_wr_valid;
  output u2f_rd_ready;
  input u2f_rd_valid;
  output [31:0]ACLK_0;
  output [31:0]ARADDR;
  output [1:0]ARBURST;
  output [3:0]ARID;
  output [7:0]ARLEN;
  output [2:0]ARSIZE;
  output [31:0]AWADDR;
  output [1:0]AWBURST;
  output [3:0]AWID;
  output [7:0]AWLEN;
  output [2:0]AWSIZE;
  input [1:0]BRESP;
  input [21:0]D;
  output [15:0]GPOUT;
  input [31:0]RDATA;
  input [1:0]RRESP;
  input [31:0]cmd_rd_data;
  output [39:0]rd_dout;
  input [31:0]u2f_rd_data;

  wire ACLK;
  wire [31:0]ACLK_0;
  wire [31:0]ARADDR;
  wire \ARADDR[0]_i_1_n_0 ;
  wire \ARADDR[10]_i_1_n_0 ;
  wire \ARADDR[11]_i_1_n_0 ;
  wire \ARADDR[12]_i_1_n_0 ;
  wire \ARADDR[13]_i_1_n_0 ;
  wire \ARADDR[14]_i_1_n_0 ;
  wire \ARADDR[15]_i_1_n_0 ;
  wire \ARADDR[16]_i_1_n_0 ;
  wire \ARADDR[17]_i_1_n_0 ;
  wire \ARADDR[18]_i_1_n_0 ;
  wire \ARADDR[19]_i_1_n_0 ;
  wire \ARADDR[1]_i_1_n_0 ;
  wire \ARADDR[20]_i_1_n_0 ;
  wire \ARADDR[21]_i_1_n_0 ;
  wire \ARADDR[22]_i_1_n_0 ;
  wire \ARADDR[23]_i_1_n_0 ;
  wire \ARADDR[24]_i_1_n_0 ;
  wire \ARADDR[25]_i_1_n_0 ;
  wire \ARADDR[26]_i_1_n_0 ;
  wire \ARADDR[27]_i_1_n_0 ;
  wire \ARADDR[28]_i_1_n_0 ;
  wire \ARADDR[29]_i_1_n_0 ;
  wire \ARADDR[2]_i_1_n_0 ;
  wire \ARADDR[30]_i_1_n_0 ;
  wire \ARADDR[31]_i_1_n_0 ;
  wire \ARADDR[3]_i_1_n_0 ;
  wire \ARADDR[4]_i_1_n_0 ;
  wire \ARADDR[5]_i_1_n_0 ;
  wire \ARADDR[6]_i_1_n_0 ;
  wire \ARADDR[7]_i_1_n_0 ;
  wire \ARADDR[8]_i_1_n_0 ;
  wire \ARADDR[9]_i_1_n_0 ;
  wire [1:0]ARBURST;
  wire \ARBURST[0]_i_1_n_0 ;
  wire \ARBURST[1]_i_1_n_0 ;
  wire ARESETn;
  wire [3:0]ARID;
  wire \ARID[0]_i_1_n_0 ;
  wire \ARID[1]_i_1_n_0 ;
  wire \ARID[2]_i_1_n_0 ;
  wire \ARID[3]_i_1_n_0 ;
  wire \ARID[3]_i_2_n_0 ;
  wire [7:0]ARLEN;
  wire \ARLEN[0]_i_1_n_0 ;
  wire \ARLEN[1]_i_1_n_0 ;
  wire \ARLEN[2]_i_1_n_0 ;
  wire \ARLEN[3]_i_1_n_0 ;
  wire \ARLEN[4]_i_1_n_0 ;
  wire \ARLEN[5]_i_1_n_0 ;
  wire \ARLEN[6]_i_1_n_0 ;
  wire \ARLEN[7]_i_1_n_0 ;
  wire ARLOCK;
  wire ARLOCK_i_1_n_0;
  wire ARREADY;
  wire [2:0]ARSIZE;
  wire \ARSIZE[0]_i_1_n_0 ;
  wire \ARSIZE[1]_i_1_n_0 ;
  wire \ARSIZE[2]_i_1_n_0 ;
  wire ARVALID;
  wire ARVALID_i_1_n_0;
  wire ARVALID_i_2_n_0;
  wire [31:0]AWADDR;
  wire \AWADDR[0]_i_1_n_0 ;
  wire \AWADDR[10]_i_1_n_0 ;
  wire \AWADDR[11]_i_1_n_0 ;
  wire \AWADDR[12]_i_1_n_0 ;
  wire \AWADDR[13]_i_1_n_0 ;
  wire \AWADDR[14]_i_1_n_0 ;
  wire \AWADDR[15]_i_1_n_0 ;
  wire \AWADDR[16]_i_1_n_0 ;
  wire \AWADDR[17]_i_1_n_0 ;
  wire \AWADDR[18]_i_1_n_0 ;
  wire \AWADDR[19]_i_1_n_0 ;
  wire \AWADDR[1]_i_1_n_0 ;
  wire \AWADDR[20]_i_1_n_0 ;
  wire \AWADDR[21]_i_1_n_0 ;
  wire \AWADDR[22]_i_1_n_0 ;
  wire \AWADDR[23]_i_1_n_0 ;
  wire \AWADDR[24]_i_1_n_0 ;
  wire \AWADDR[25]_i_1_n_0 ;
  wire \AWADDR[26]_i_1_n_0 ;
  wire \AWADDR[27]_i_1_n_0 ;
  wire \AWADDR[28]_i_1_n_0 ;
  wire \AWADDR[29]_i_1_n_0 ;
  wire \AWADDR[2]_i_1_n_0 ;
  wire \AWADDR[30]_i_1_n_0 ;
  wire \AWADDR[31]_i_1_n_0 ;
  wire \AWADDR[3]_i_1_n_0 ;
  wire \AWADDR[4]_i_1_n_0 ;
  wire \AWADDR[5]_i_1_n_0 ;
  wire \AWADDR[6]_i_1_n_0 ;
  wire \AWADDR[7]_i_1_n_0 ;
  wire \AWADDR[8]_i_1_n_0 ;
  wire \AWADDR[9]_i_1_n_0 ;
  wire [1:0]AWBURST;
  wire \AWBURST[0]_i_1_n_0 ;
  wire \AWBURST[1]_i_1_n_0 ;
  wire [3:0]AWID;
  wire \AWID[0]_i_1_n_0 ;
  wire \AWID[1]_i_1_n_0 ;
  wire \AWID[2]_i_1_n_0 ;
  wire \AWID[3]_i_1_n_0 ;
  wire \AWID[3]_i_2_n_0 ;
  wire [7:0]AWLEN;
  wire \AWLEN[0]_i_1_n_0 ;
  wire \AWLEN[1]_i_1_n_0 ;
  wire \AWLEN[2]_i_1_n_0 ;
  wire \AWLEN[3]_i_1_n_0 ;
  wire \AWLEN[4]_i_1_n_0 ;
  wire \AWLEN[5]_i_1_n_0 ;
  wire \AWLEN[6]_i_1_n_0 ;
  wire \AWLEN[7]_i_1_n_0 ;
  wire AWLOCK;
  wire AWLOCK_i_1_n_0;
  wire AWREADY;
  wire [2:0]AWSIZE;
  wire \AWSIZE[0]_i_1_n_0 ;
  wire \AWSIZE[1]_i_1_n_0 ;
  wire \AWSIZE[2]_i_1_n_0 ;
  wire AWVALID;
  wire AWVALID_i_1_n_0;
  wire BREADY0;
  wire BREADY0_carry_i_1_n_0;
  wire BREADY0_carry_i_2_n_0;
  wire BREADY0_carry_i_3_n_0;
  wire BREADY0_carry_i_4_n_0;
  wire BREADY0_carry_i_5_n_0;
  wire BREADY0_carry_i_6_n_0;
  wire BREADY0_carry_i_7_n_0;
  wire BREADY0_carry_i_8_n_0;
  wire BREADY0_carry_n_0;
  wire BREADY0_carry_n_1;
  wire BREADY0_carry_n_2;
  wire BREADY0_carry_n_3;
  wire BREADY1__0;
  wire BREADY_i_1_n_0;
  wire BREADY_i_3_n_0;
  wire BREADY_i_4_n_0;
  wire BREADY_reg_0;
  wire [1:0]BRESP;
  wire BVALID;
  wire \CADDR[0]_i_1_n_0 ;
  wire \CADDR[10]_i_1_n_0 ;
  wire \CADDR[11]_i_1_n_0 ;
  wire \CADDR[12]_i_1_n_0 ;
  wire \CADDR[13]_i_1_n_0 ;
  wire \CADDR[14]_i_1_n_0 ;
  wire \CADDR[15]_i_1_n_0 ;
  wire \CADDR[16]_i_1_n_0 ;
  wire \CADDR[17]_i_1_n_0 ;
  wire \CADDR[18]_i_1_n_0 ;
  wire \CADDR[19]_i_1_n_0 ;
  wire \CADDR[1]_i_1_n_0 ;
  wire \CADDR[20]_i_1_n_0 ;
  wire \CADDR[21]_i_1_n_0 ;
  wire \CADDR[22]_i_1_n_0 ;
  wire \CADDR[23]_i_1_n_0 ;
  wire \CADDR[24]_i_1_n_0 ;
  wire \CADDR[25]_i_1_n_0 ;
  wire \CADDR[26]_i_1_n_0 ;
  wire \CADDR[27]_i_1_n_0 ;
  wire \CADDR[28]_i_1_n_0 ;
  wire \CADDR[29]_i_1_n_0 ;
  wire \CADDR[2]_i_1_n_0 ;
  wire \CADDR[30]_i_1_n_0 ;
  wire \CADDR[31]_i_1_n_0 ;
  wire \CADDR[31]_i_2_n_0 ;
  wire \CADDR[3]_i_1_n_0 ;
  wire \CADDR[4]_i_1_n_0 ;
  wire \CADDR[5]_i_1_n_0 ;
  wire \CADDR[6]_i_1_n_0 ;
  wire \CADDR[7]_i_1_n_0 ;
  wire \CADDR[8]_i_1_n_0 ;
  wire \CADDR[9]_i_1_n_0 ;
  wire [31:0]CADDR_reg_n_0_;
  wire [7:0]CLENG;
  wire \CLENG[0]_i_1_n_0 ;
  wire \CLENG[1]_i_1_n_0 ;
  wire \CLENG[2]_i_1_n_0 ;
  wire \CLENG[3]_i_1_n_0 ;
  wire \CLENG[4]_i_1_n_0 ;
  wire \CLENG[5]_i_1_n_0 ;
  wire \CLENG[6]_i_1_n_0 ;
  wire \CLENG[7]_i_1_n_0 ;
  wire \CLENG[7]_i_2_n_0 ;
  wire \CLENG[7]_i_3_n_0 ;
  wire CLENG_reg0_carry__0_i_1_n_0;
  wire CLENG_reg0_carry__0_n_7;
  wire CLENG_reg0_carry_i_1_n_0;
  wire CLENG_reg0_carry_i_2_n_0;
  wire CLENG_reg0_carry_i_3_n_0;
  wire CLENG_reg0_carry_n_0;
  wire CLENG_reg0_carry_n_1;
  wire CLENG_reg0_carry_n_2;
  wire CLENG_reg0_carry_n_3;
  wire CLENG_reg0_carry_n_4;
  wire CLENG_reg0_carry_n_5;
  wire CLENG_reg0_carry_n_6;
  wire CLENG_reg0_carry_n_7;
  wire \CLENG_reg[0]_i_1_n_0 ;
  wire \CLENG_reg[10]_i_1_n_0 ;
  wire \CLENG_reg[11]_i_1_n_0 ;
  wire \CLENG_reg[11]_i_2_n_0 ;
  wire \CLENG_reg[11]_i_3_n_0 ;
  wire \CLENG_reg[11]_i_4_n_0 ;
  wire \CLENG_reg[11]_i_5_n_0 ;
  wire \CLENG_reg[11]_i_6_n_0 ;
  wire \CLENG_reg[1]_i_1_n_0 ;
  wire \CLENG_reg[2]_i_1_n_0 ;
  wire \CLENG_reg[3]_i_1_n_0 ;
  wire \CLENG_reg[4]_i_1_n_0 ;
  wire \CLENG_reg[5]_i_1_n_0 ;
  wire \CLENG_reg[6]_i_1_n_0 ;
  wire \CLENG_reg[7]_i_1_n_0 ;
  wire \CLENG_reg[8]_i_1_n_0 ;
  wire \CLENG_reg[9]_i_1_n_0 ;
  wire [11:0]CLENG_reg_reg_n_0_;
  (* RTL_KEEP = "true" *) wire [31:0]CMD;
  wire CMD1__2;
  wire \CMD[0]_i_1_n_0 ;
  wire \CMD[10]_i_1_n_0 ;
  wire \CMD[11]_i_1_n_0 ;
  wire \CMD[12]_i_1_n_0 ;
  wire \CMD[13]_i_1_n_0 ;
  wire \CMD[14]_i_1_n_0 ;
  wire \CMD[15]_i_1_n_0 ;
  wire \CMD[16]_i_1_n_0 ;
  wire \CMD[16]_i_2_n_0 ;
  wire \CMD[17]_i_1_n_0 ;
  wire \CMD[17]_i_2_n_0 ;
  wire \CMD[17]_i_3_n_0 ;
  wire \CMD[18]_i_1_n_0 ;
  wire \CMD[19]_i_1_n_0 ;
  wire \CMD[1]_i_1_n_0 ;
  wire \CMD[20]_i_1_n_0 ;
  wire \CMD[21]_i_1_n_0 ;
  wire \CMD[22]_i_1_n_0 ;
  wire \CMD[23]_i_1_n_0 ;
  wire \CMD[24]_i_1_n_0 ;
  wire \CMD[25]_i_1_n_0 ;
  wire \CMD[26]_i_1_n_0 ;
  wire \CMD[27]_i_1_n_0 ;
  wire \CMD[28]_i_1_n_0 ;
  wire \CMD[29]_i_1_n_0 ;
  wire \CMD[2]_i_1_n_0 ;
  wire \CMD[30]_i_1_n_0 ;
  wire \CMD[31]_i_1_n_0 ;
  wire \CMD[31]_i_2_n_0 ;
  wire \CMD[3]_i_1_n_0 ;
  wire \CMD[4]_i_1_n_0 ;
  wire \CMD[5]_i_1_n_0 ;
  wire \CMD[6]_i_1_n_0 ;
  wire \CMD[7]_i_1_n_0 ;
  wire \CMD[8]_i_1_n_0 ;
  wire \CMD[9]_i_1_n_0 ;
  wire [21:0]D;
  wire [15:0]GPOUT;
  wire \GPOUT[15]_i_1_n_0 ;
  wire [31:0]RDATA;
  wire RREADY;
  wire [1:0]RRESP;
  wire RVALID;
  wire WLAST;
  wire WREADY;
  wire WVALID;
  wire [31:0]addr;
  wire \addrR[0]_i_1_n_0 ;
  wire \addrR[10]_i_1_n_0 ;
  wire \addrR[11]_i_1_n_0 ;
  wire \addrR[12]_i_1_n_0 ;
  wire \addrR[13]_i_1_n_0 ;
  wire \addrR[14]_i_1_n_0 ;
  wire \addrR[15]_i_1_n_0 ;
  wire \addrR[16]_i_1_n_0 ;
  wire \addrR[17]_i_1_n_0 ;
  wire \addrR[18]_i_1_n_0 ;
  wire \addrR[19]_i_1_n_0 ;
  wire \addrR[1]_i_1_n_0 ;
  wire \addrR[20]_i_1_n_0 ;
  wire \addrR[21]_i_1_n_0 ;
  wire \addrR[22]_i_1_n_0 ;
  wire \addrR[23]_i_1_n_0 ;
  wire \addrR[24]_i_1_n_0 ;
  wire \addrR[25]_i_1_n_0 ;
  wire \addrR[26]_i_1_n_0 ;
  wire \addrR[27]_i_1_n_0 ;
  wire \addrR[28]_i_1_n_0 ;
  wire \addrR[29]_i_1_n_0 ;
  wire \addrR[2]_i_1_n_0 ;
  wire \addrR[30]_i_1_n_0 ;
  wire \addrR[31]_i_2_n_0 ;
  wire \addrR[31]_i_3_n_0 ;
  wire \addrR[31]_i_4_n_0 ;
  wire \addrR[31]_i_6_n_0 ;
  wire \addrR[3]_i_1_n_0 ;
  wire \addrR[3]_i_3_n_0 ;
  wire \addrR[3]_i_4_n_0 ;
  wire \addrR[3]_i_5_n_0 ;
  wire \addrR[3]_i_6_n_0 ;
  wire \addrR[4]_i_1_n_0 ;
  wire \addrR[5]_i_1_n_0 ;
  wire \addrR[6]_i_1_n_0 ;
  wire \addrR[7]_i_1_n_0 ;
  wire \addrR[7]_i_3_n_0 ;
  wire \addrR[7]_i_4_n_0 ;
  wire \addrR[7]_i_5_n_0 ;
  wire \addrR[7]_i_6_n_0 ;
  wire \addrR[8]_i_1_n_0 ;
  wire \addrR[9]_i_1_n_0 ;
  wire \addrR_reg[11]_i_2_n_0 ;
  wire \addrR_reg[11]_i_2_n_1 ;
  wire \addrR_reg[11]_i_2_n_2 ;
  wire \addrR_reg[11]_i_2_n_3 ;
  wire \addrR_reg[11]_i_2_n_4 ;
  wire \addrR_reg[11]_i_2_n_5 ;
  wire \addrR_reg[11]_i_2_n_6 ;
  wire \addrR_reg[11]_i_2_n_7 ;
  wire \addrR_reg[15]_i_2_n_0 ;
  wire \addrR_reg[15]_i_2_n_1 ;
  wire \addrR_reg[15]_i_2_n_2 ;
  wire \addrR_reg[15]_i_2_n_3 ;
  wire \addrR_reg[15]_i_2_n_4 ;
  wire \addrR_reg[15]_i_2_n_5 ;
  wire \addrR_reg[15]_i_2_n_6 ;
  wire \addrR_reg[15]_i_2_n_7 ;
  wire \addrR_reg[19]_i_2_n_0 ;
  wire \addrR_reg[19]_i_2_n_1 ;
  wire \addrR_reg[19]_i_2_n_2 ;
  wire \addrR_reg[19]_i_2_n_3 ;
  wire \addrR_reg[19]_i_2_n_4 ;
  wire \addrR_reg[19]_i_2_n_5 ;
  wire \addrR_reg[19]_i_2_n_6 ;
  wire \addrR_reg[19]_i_2_n_7 ;
  wire \addrR_reg[23]_i_2_n_0 ;
  wire \addrR_reg[23]_i_2_n_1 ;
  wire \addrR_reg[23]_i_2_n_2 ;
  wire \addrR_reg[23]_i_2_n_3 ;
  wire \addrR_reg[23]_i_2_n_4 ;
  wire \addrR_reg[23]_i_2_n_5 ;
  wire \addrR_reg[23]_i_2_n_6 ;
  wire \addrR_reg[23]_i_2_n_7 ;
  wire \addrR_reg[27]_i_2_n_0 ;
  wire \addrR_reg[27]_i_2_n_1 ;
  wire \addrR_reg[27]_i_2_n_2 ;
  wire \addrR_reg[27]_i_2_n_3 ;
  wire \addrR_reg[27]_i_2_n_4 ;
  wire \addrR_reg[27]_i_2_n_5 ;
  wire \addrR_reg[27]_i_2_n_6 ;
  wire \addrR_reg[27]_i_2_n_7 ;
  wire \addrR_reg[31]_i_5_n_1 ;
  wire \addrR_reg[31]_i_5_n_2 ;
  wire \addrR_reg[31]_i_5_n_3 ;
  wire \addrR_reg[31]_i_5_n_4 ;
  wire \addrR_reg[31]_i_5_n_5 ;
  wire \addrR_reg[31]_i_5_n_6 ;
  wire \addrR_reg[31]_i_5_n_7 ;
  wire \addrR_reg[3]_i_2_n_0 ;
  wire \addrR_reg[3]_i_2_n_1 ;
  wire \addrR_reg[3]_i_2_n_2 ;
  wire \addrR_reg[3]_i_2_n_3 ;
  wire \addrR_reg[3]_i_2_n_4 ;
  wire \addrR_reg[3]_i_2_n_5 ;
  wire \addrR_reg[3]_i_2_n_6 ;
  wire \addrR_reg[3]_i_2_n_7 ;
  wire \addrR_reg[7]_i_2_n_0 ;
  wire \addrR_reg[7]_i_2_n_1 ;
  wire \addrR_reg[7]_i_2_n_2 ;
  wire \addrR_reg[7]_i_2_n_3 ;
  wire \addrR_reg[7]_i_2_n_4 ;
  wire \addrR_reg[7]_i_2_n_5 ;
  wire \addrR_reg[7]_i_2_n_6 ;
  wire \addrR_reg[7]_i_2_n_7 ;
  wire [31:0]addrR_reg_n_0_;
  wire \addrW[0]_i_1_n_0 ;
  wire \addrW[10]_i_1_n_0 ;
  wire \addrW[11]_i_1_n_0 ;
  wire \addrW[12]_i_1_n_0 ;
  wire \addrW[13]_i_1_n_0 ;
  wire \addrW[14]_i_1_n_0 ;
  wire \addrW[15]_i_1_n_0 ;
  wire \addrW[16]_i_1_n_0 ;
  wire \addrW[17]_i_1_n_0 ;
  wire \addrW[18]_i_1_n_0 ;
  wire \addrW[19]_i_1_n_0 ;
  wire \addrW[1]_i_1_n_0 ;
  wire \addrW[20]_i_1_n_0 ;
  wire \addrW[21]_i_1_n_0 ;
  wire \addrW[22]_i_1_n_0 ;
  wire \addrW[23]_i_1_n_0 ;
  wire \addrW[24]_i_1_n_0 ;
  wire \addrW[25]_i_1_n_0 ;
  wire \addrW[26]_i_1_n_0 ;
  wire \addrW[27]_i_1_n_0 ;
  wire \addrW[28]_i_1_n_0 ;
  wire \addrW[29]_i_1_n_0 ;
  wire \addrW[2]_i_1_n_0 ;
  wire \addrW[30]_i_1_n_0 ;
  wire \addrW[31]_i_1_n_0 ;
  wire \addrW[31]_i_2_n_0 ;
  wire \addrW[31]_i_3_n_0 ;
  wire \addrW[31]_i_5_n_0 ;
  wire \addrW[3]_i_1_n_0 ;
  wire \addrW[3]_i_3_n_0 ;
  wire \addrW[3]_i_4_n_0 ;
  wire \addrW[3]_i_5_n_0 ;
  wire \addrW[3]_i_6_n_0 ;
  wire \addrW[4]_i_1_n_0 ;
  wire \addrW[5]_i_1_n_0 ;
  wire \addrW[6]_i_1_n_0 ;
  wire \addrW[7]_i_1_n_0 ;
  wire \addrW[7]_i_3_n_0 ;
  wire \addrW[7]_i_4_n_0 ;
  wire \addrW[7]_i_5_n_0 ;
  wire \addrW[7]_i_6_n_0 ;
  wire \addrW[8]_i_1_n_0 ;
  wire \addrW[9]_i_1_n_0 ;
  wire \addrW_reg[11]_i_2_n_0 ;
  wire \addrW_reg[11]_i_2_n_1 ;
  wire \addrW_reg[11]_i_2_n_2 ;
  wire \addrW_reg[11]_i_2_n_3 ;
  wire \addrW_reg[11]_i_2_n_4 ;
  wire \addrW_reg[11]_i_2_n_5 ;
  wire \addrW_reg[11]_i_2_n_6 ;
  wire \addrW_reg[11]_i_2_n_7 ;
  wire \addrW_reg[15]_i_2_n_0 ;
  wire \addrW_reg[15]_i_2_n_1 ;
  wire \addrW_reg[15]_i_2_n_2 ;
  wire \addrW_reg[15]_i_2_n_3 ;
  wire \addrW_reg[15]_i_2_n_4 ;
  wire \addrW_reg[15]_i_2_n_5 ;
  wire \addrW_reg[15]_i_2_n_6 ;
  wire \addrW_reg[15]_i_2_n_7 ;
  wire \addrW_reg[19]_i_2_n_0 ;
  wire \addrW_reg[19]_i_2_n_1 ;
  wire \addrW_reg[19]_i_2_n_2 ;
  wire \addrW_reg[19]_i_2_n_3 ;
  wire \addrW_reg[19]_i_2_n_4 ;
  wire \addrW_reg[19]_i_2_n_5 ;
  wire \addrW_reg[19]_i_2_n_6 ;
  wire \addrW_reg[19]_i_2_n_7 ;
  wire \addrW_reg[23]_i_2_n_0 ;
  wire \addrW_reg[23]_i_2_n_1 ;
  wire \addrW_reg[23]_i_2_n_2 ;
  wire \addrW_reg[23]_i_2_n_3 ;
  wire \addrW_reg[23]_i_2_n_4 ;
  wire \addrW_reg[23]_i_2_n_5 ;
  wire \addrW_reg[23]_i_2_n_6 ;
  wire \addrW_reg[23]_i_2_n_7 ;
  wire \addrW_reg[27]_i_2_n_0 ;
  wire \addrW_reg[27]_i_2_n_1 ;
  wire \addrW_reg[27]_i_2_n_2 ;
  wire \addrW_reg[27]_i_2_n_3 ;
  wire \addrW_reg[27]_i_2_n_4 ;
  wire \addrW_reg[27]_i_2_n_5 ;
  wire \addrW_reg[27]_i_2_n_6 ;
  wire \addrW_reg[27]_i_2_n_7 ;
  wire \addrW_reg[31]_i_4_n_1 ;
  wire \addrW_reg[31]_i_4_n_2 ;
  wire \addrW_reg[31]_i_4_n_3 ;
  wire \addrW_reg[31]_i_4_n_4 ;
  wire \addrW_reg[31]_i_4_n_5 ;
  wire \addrW_reg[31]_i_4_n_6 ;
  wire \addrW_reg[31]_i_4_n_7 ;
  wire \addrW_reg[3]_i_2_n_0 ;
  wire \addrW_reg[3]_i_2_n_1 ;
  wire \addrW_reg[3]_i_2_n_2 ;
  wire \addrW_reg[3]_i_2_n_3 ;
  wire \addrW_reg[3]_i_2_n_4 ;
  wire \addrW_reg[3]_i_2_n_5 ;
  wire \addrW_reg[3]_i_2_n_6 ;
  wire \addrW_reg[3]_i_2_n_7 ;
  wire \addrW_reg[7]_i_2_n_0 ;
  wire \addrW_reg[7]_i_2_n_1 ;
  wire \addrW_reg[7]_i_2_n_2 ;
  wire \addrW_reg[7]_i_2_n_3 ;
  wire \addrW_reg[7]_i_2_n_4 ;
  wire \addrW_reg[7]_i_2_n_5 ;
  wire \addrW_reg[7]_i_2_n_6 ;
  wire \addrW_reg[7]_i_2_n_7 ;
  wire [31:0]cmd_rd_data;
  wire cmd_rd_ready;
  wire cmd_rd_valid;
  wire cmd_ready_i_1_n_0;
  wire cmd_ready_i_2_n_0;
  wire countR1;
  wire countR1_carry__0_i_1_n_0;
  wire countR1_carry_i_1_n_0;
  wire countR1_carry_i_2_n_0;
  wire countR1_carry_i_3_n_0;
  wire countR1_carry_i_4_n_0;
  wire countR1_carry_i_5_n_0;
  wire countR1_carry_i_6_n_0;
  wire countR1_carry_i_7_n_0;
  wire countR1_carry_i_8_n_0;
  wire countR1_carry_n_0;
  wire countR1_carry_n_1;
  wire countR1_carry_n_2;
  wire countR1_carry_n_3;
  wire \countR[0]_i_1_n_0 ;
  wire \countR[1]_i_1_n_0 ;
  wire \countR[2]_i_1_n_0 ;
  wire \countR[3]_i_1_n_0 ;
  wire \countR[4]_i_1_n_0 ;
  wire \countR[5]_i_1_n_0 ;
  wire \countR[5]_i_2_n_0 ;
  wire \countR[5]_i_3_n_0 ;
  wire \countR[6]_i_1_n_0 ;
  wire \countR[7]_i_1_n_0 ;
  wire \countR[8]_i_2_n_0 ;
  wire \countR[8]_i_4_n_0 ;
  wire [8:0]countR_reg_n_0_;
  wire \countW[0]_i_1_n_0 ;
  wire \countW[1]_i_1_n_0 ;
  wire \countW[2]_i_1_n_0 ;
  wire \countW[3]_i_1_n_0 ;
  wire \countW[4]_i_1_n_0 ;
  wire \countW[5]_i_1_n_0 ;
  wire \countW[5]_i_2_n_0 ;
  wire \countW[6]_i_1_n_0 ;
  wire \countW[7]_i_1_n_0 ;
  wire \countW[8]_i_1_n_0 ;
  wire \countW[8]_i_2_n_0 ;
  wire \countW[8]_i_3_n_0 ;
  wire [8:0]countW_reg_n_0_;
  wire \f2u_int_data[31]_i_1_n_0 ;
  wire [31:0]f2u_int_data_reg_n_0_;
  wire f2u_wr_ready;
  wire f2u_wr_valid;
  wire get_next_addr_rd0_carry__0_n_0;
  wire get_next_addr_rd0_carry__0_n_1;
  wire get_next_addr_rd0_carry__0_n_2;
  wire get_next_addr_rd0_carry__0_n_3;
  wire get_next_addr_rd0_carry__0_n_4;
  wire get_next_addr_rd0_carry__0_n_5;
  wire get_next_addr_rd0_carry__0_n_6;
  wire get_next_addr_rd0_carry__0_n_7;
  wire get_next_addr_rd0_carry__1_n_0;
  wire get_next_addr_rd0_carry__1_n_1;
  wire get_next_addr_rd0_carry__1_n_2;
  wire get_next_addr_rd0_carry__1_n_3;
  wire get_next_addr_rd0_carry__1_n_4;
  wire get_next_addr_rd0_carry__1_n_5;
  wire get_next_addr_rd0_carry__1_n_6;
  wire get_next_addr_rd0_carry__1_n_7;
  wire get_next_addr_rd0_carry__2_n_0;
  wire get_next_addr_rd0_carry__2_n_1;
  wire get_next_addr_rd0_carry__2_n_2;
  wire get_next_addr_rd0_carry__2_n_3;
  wire get_next_addr_rd0_carry__2_n_4;
  wire get_next_addr_rd0_carry__2_n_5;
  wire get_next_addr_rd0_carry__2_n_6;
  wire get_next_addr_rd0_carry__2_n_7;
  wire get_next_addr_rd0_carry__3_n_0;
  wire get_next_addr_rd0_carry__3_n_1;
  wire get_next_addr_rd0_carry__3_n_2;
  wire get_next_addr_rd0_carry__3_n_3;
  wire get_next_addr_rd0_carry__3_n_4;
  wire get_next_addr_rd0_carry__3_n_5;
  wire get_next_addr_rd0_carry__3_n_6;
  wire get_next_addr_rd0_carry__3_n_7;
  wire get_next_addr_rd0_carry__4_n_0;
  wire get_next_addr_rd0_carry__4_n_1;
  wire get_next_addr_rd0_carry__4_n_2;
  wire get_next_addr_rd0_carry__4_n_3;
  wire get_next_addr_rd0_carry__4_n_4;
  wire get_next_addr_rd0_carry__4_n_5;
  wire get_next_addr_rd0_carry__4_n_6;
  wire get_next_addr_rd0_carry__4_n_7;
  wire get_next_addr_rd0_carry__5_n_0;
  wire get_next_addr_rd0_carry__5_n_1;
  wire get_next_addr_rd0_carry__5_n_2;
  wire get_next_addr_rd0_carry__5_n_3;
  wire get_next_addr_rd0_carry__5_n_4;
  wire get_next_addr_rd0_carry__5_n_5;
  wire get_next_addr_rd0_carry__5_n_6;
  wire get_next_addr_rd0_carry__5_n_7;
  wire get_next_addr_rd0_carry__6_n_7;
  wire get_next_addr_rd0_carry_n_0;
  wire get_next_addr_rd0_carry_n_1;
  wire get_next_addr_rd0_carry_n_2;
  wire get_next_addr_rd0_carry_n_3;
  wire get_next_addr_rd0_carry_n_4;
  wire get_next_addr_rd0_carry_n_5;
  wire get_next_addr_rd0_carry_n_6;
  wire get_next_addr_rd0_carry_n_7;
  wire get_next_addr_wr0_carry__0_n_0;
  wire get_next_addr_wr0_carry__0_n_1;
  wire get_next_addr_wr0_carry__0_n_2;
  wire get_next_addr_wr0_carry__0_n_3;
  wire get_next_addr_wr0_carry__0_n_4;
  wire get_next_addr_wr0_carry__0_n_5;
  wire get_next_addr_wr0_carry__0_n_6;
  wire get_next_addr_wr0_carry__0_n_7;
  wire get_next_addr_wr0_carry__1_n_0;
  wire get_next_addr_wr0_carry__1_n_1;
  wire get_next_addr_wr0_carry__1_n_2;
  wire get_next_addr_wr0_carry__1_n_3;
  wire get_next_addr_wr0_carry__1_n_4;
  wire get_next_addr_wr0_carry__1_n_5;
  wire get_next_addr_wr0_carry__1_n_6;
  wire get_next_addr_wr0_carry__1_n_7;
  wire get_next_addr_wr0_carry__2_n_0;
  wire get_next_addr_wr0_carry__2_n_1;
  wire get_next_addr_wr0_carry__2_n_2;
  wire get_next_addr_wr0_carry__2_n_3;
  wire get_next_addr_wr0_carry__2_n_4;
  wire get_next_addr_wr0_carry__2_n_5;
  wire get_next_addr_wr0_carry__2_n_6;
  wire get_next_addr_wr0_carry__2_n_7;
  wire get_next_addr_wr0_carry__3_n_0;
  wire get_next_addr_wr0_carry__3_n_1;
  wire get_next_addr_wr0_carry__3_n_2;
  wire get_next_addr_wr0_carry__3_n_3;
  wire get_next_addr_wr0_carry__3_n_4;
  wire get_next_addr_wr0_carry__3_n_5;
  wire get_next_addr_wr0_carry__3_n_6;
  wire get_next_addr_wr0_carry__3_n_7;
  wire get_next_addr_wr0_carry__4_n_0;
  wire get_next_addr_wr0_carry__4_n_1;
  wire get_next_addr_wr0_carry__4_n_2;
  wire get_next_addr_wr0_carry__4_n_3;
  wire get_next_addr_wr0_carry__4_n_4;
  wire get_next_addr_wr0_carry__4_n_5;
  wire get_next_addr_wr0_carry__4_n_6;
  wire get_next_addr_wr0_carry__4_n_7;
  wire get_next_addr_wr0_carry__5_n_0;
  wire get_next_addr_wr0_carry__5_n_1;
  wire get_next_addr_wr0_carry__5_n_2;
  wire get_next_addr_wr0_carry__5_n_3;
  wire get_next_addr_wr0_carry__5_n_4;
  wire get_next_addr_wr0_carry__5_n_5;
  wire get_next_addr_wr0_carry__5_n_6;
  wire get_next_addr_wr0_carry__5_n_7;
  wire get_next_addr_wr0_carry__6_n_7;
  wire get_next_addr_wr0_carry_n_0;
  wire get_next_addr_wr0_carry_n_1;
  wire get_next_addr_wr0_carry_n_2;
  wire get_next_addr_wr0_carry_n_3;
  wire get_next_addr_wr0_carry_n_4;
  wire get_next_addr_wr0_carry_n_5;
  wire get_next_addr_wr0_carry_n_6;
  wire get_next_addr_wr0_carry_n_7;
  wire [1:0]last_resp;
  wire [2:0]p_0_in__0;
  wire [2:0]p_0_in__1;
  wire [2:0]p_0_in__2;
  wire [39:0]rd_dout;
  wire read_done_reg_n_0;
  wire read_go;
  wire read_go_i_1_n_0;
  wire read_go_i_2_n_0;
  (* RTL_KEEP = "true" *) wire [2:0]state_cmd;
  wire \state_cmd[0]_i_2_n_0 ;
  wire \state_cmd[0]_i_4_n_0 ;
  wire \state_cmd[1]_i_2_n_0 ;
  wire \state_cmd[1]_i_3_n_0 ;
  wire \state_cmd[2]_i_2_n_0 ;
  wire \state_cmd[2]_i_3_n_0 ;
  wire \state_cmd[2]_i_4_n_0 ;
  wire \state_cmd[2]_i_5_n_0 ;
  wire \state_cmd[2]_i_6_n_0 ;
  (* RTL_KEEP = "true" *) wire [2:0]state_read;
  wire \state_read[1]_i_2_n_0 ;
  (* RTL_KEEP = "true" *) wire [2:0]state_write;
  wire \state_write[2]_i_2_n_0 ;
  wire [31:0]u2f_rd_data;
  wire u2f_rd_ready;
  wire u2f_rd_valid;
  wire u2f_ready_i_3_n_0;
  wire u_f2u_fifo_n_1;
  wire u_f2u_fifo_n_2;
  wire u_f2u_fifo_n_7;
  wire u_f2u_fifo_n_8;
  wire u_f2u_fifo_n_9;
  wire u_u2f_fifo_n_0;
  wire u_u2f_fifo_n_2;
  wire u_u2f_fifo_n_3;
  wire u_u2f_fifo_n_4;
  wire write_done;
  wire write_done_i_1_n_0;
  wire write_go_i_1_n_0;
  wire write_go_i_2_n_0;
  wire write_go_reg_n_0;
  wire [3:0]NLW_BREADY0_carry_O_UNCONNECTED;
  wire [3:1]NLW_BREADY0_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_BREADY0_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_CLENG_reg0_carry__0_CO_UNCONNECTED;
  wire [3:1]NLW_CLENG_reg0_carry__0_O_UNCONNECTED;
  wire [3:3]\NLW_addrR_reg[31]_i_5_CO_UNCONNECTED ;
  wire [3:3]\NLW_addrW_reg[31]_i_4_CO_UNCONNECTED ;
  wire [3:0]NLW_countR1_carry_O_UNCONNECTED;
  wire [3:1]NLW_countR1_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_countR1_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_get_next_addr_rd0_carry__6_CO_UNCONNECTED;
  wire [3:1]NLW_get_next_addr_rd0_carry__6_O_UNCONNECTED;
  wire [3:0]NLW_get_next_addr_wr0_carry__6_CO_UNCONNECTED;
  wire [3:1]NLW_get_next_addr_wr0_carry__6_O_UNCONNECTED;

  LUT2 #(
    .INIT(4'h2)) 
    \ARADDR[0]_i_1 
       (.I0(CADDR_reg_n_0_[0]),
        .I1(state_read[2]),
        .O(\ARADDR[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARADDR[10]_i_1 
       (.I0(CADDR_reg_n_0_[10]),
        .I1(state_read[2]),
        .O(\ARADDR[10]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARADDR[11]_i_1 
       (.I0(CADDR_reg_n_0_[11]),
        .I1(state_read[2]),
        .O(\ARADDR[11]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARADDR[12]_i_1 
       (.I0(CADDR_reg_n_0_[12]),
        .I1(state_read[2]),
        .O(\ARADDR[12]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARADDR[13]_i_1 
       (.I0(CADDR_reg_n_0_[13]),
        .I1(state_read[2]),
        .O(\ARADDR[13]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARADDR[14]_i_1 
       (.I0(CADDR_reg_n_0_[14]),
        .I1(state_read[2]),
        .O(\ARADDR[14]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARADDR[15]_i_1 
       (.I0(CADDR_reg_n_0_[15]),
        .I1(state_read[2]),
        .O(\ARADDR[15]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARADDR[16]_i_1 
       (.I0(CADDR_reg_n_0_[16]),
        .I1(state_read[2]),
        .O(\ARADDR[16]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARADDR[17]_i_1 
       (.I0(CADDR_reg_n_0_[17]),
        .I1(state_read[2]),
        .O(\ARADDR[17]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARADDR[18]_i_1 
       (.I0(CADDR_reg_n_0_[18]),
        .I1(state_read[2]),
        .O(\ARADDR[18]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARADDR[19]_i_1 
       (.I0(CADDR_reg_n_0_[19]),
        .I1(state_read[2]),
        .O(\ARADDR[19]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARADDR[1]_i_1 
       (.I0(CADDR_reg_n_0_[1]),
        .I1(state_read[2]),
        .O(\ARADDR[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARADDR[20]_i_1 
       (.I0(CADDR_reg_n_0_[20]),
        .I1(state_read[2]),
        .O(\ARADDR[20]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARADDR[21]_i_1 
       (.I0(CADDR_reg_n_0_[21]),
        .I1(state_read[2]),
        .O(\ARADDR[21]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARADDR[22]_i_1 
       (.I0(CADDR_reg_n_0_[22]),
        .I1(state_read[2]),
        .O(\ARADDR[22]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARADDR[23]_i_1 
       (.I0(CADDR_reg_n_0_[23]),
        .I1(state_read[2]),
        .O(\ARADDR[23]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARADDR[24]_i_1 
       (.I0(CADDR_reg_n_0_[24]),
        .I1(state_read[2]),
        .O(\ARADDR[24]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARADDR[25]_i_1 
       (.I0(CADDR_reg_n_0_[25]),
        .I1(state_read[2]),
        .O(\ARADDR[25]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARADDR[26]_i_1 
       (.I0(CADDR_reg_n_0_[26]),
        .I1(state_read[2]),
        .O(\ARADDR[26]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARADDR[27]_i_1 
       (.I0(CADDR_reg_n_0_[27]),
        .I1(state_read[2]),
        .O(\ARADDR[27]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARADDR[28]_i_1 
       (.I0(CADDR_reg_n_0_[28]),
        .I1(state_read[2]),
        .O(\ARADDR[28]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARADDR[29]_i_1 
       (.I0(CADDR_reg_n_0_[29]),
        .I1(state_read[2]),
        .O(\ARADDR[29]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARADDR[2]_i_1 
       (.I0(CADDR_reg_n_0_[2]),
        .I1(state_read[2]),
        .O(\ARADDR[2]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARADDR[30]_i_1 
       (.I0(CADDR_reg_n_0_[30]),
        .I1(state_read[2]),
        .O(\ARADDR[30]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARADDR[31]_i_1 
       (.I0(CADDR_reg_n_0_[31]),
        .I1(state_read[2]),
        .O(\ARADDR[31]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARADDR[3]_i_1 
       (.I0(CADDR_reg_n_0_[3]),
        .I1(state_read[2]),
        .O(\ARADDR[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARADDR[4]_i_1 
       (.I0(CADDR_reg_n_0_[4]),
        .I1(state_read[2]),
        .O(\ARADDR[4]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARADDR[5]_i_1 
       (.I0(CADDR_reg_n_0_[5]),
        .I1(state_read[2]),
        .O(\ARADDR[5]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARADDR[6]_i_1 
       (.I0(CADDR_reg_n_0_[6]),
        .I1(state_read[2]),
        .O(\ARADDR[6]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARADDR[7]_i_1 
       (.I0(CADDR_reg_n_0_[7]),
        .I1(state_read[2]),
        .O(\ARADDR[7]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARADDR[8]_i_1 
       (.I0(CADDR_reg_n_0_[8]),
        .I1(state_read[2]),
        .O(\ARADDR[8]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARADDR[9]_i_1 
       (.I0(CADDR_reg_n_0_[9]),
        .I1(state_read[2]),
        .O(\ARADDR[9]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \ARADDR_reg[0] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARADDR[0]_i_1_n_0 ),
        .Q(ARADDR[0]));
  FDCE #(
    .INIT(1'b0)) 
    \ARADDR_reg[10] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARADDR[10]_i_1_n_0 ),
        .Q(ARADDR[10]));
  FDCE #(
    .INIT(1'b0)) 
    \ARADDR_reg[11] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARADDR[11]_i_1_n_0 ),
        .Q(ARADDR[11]));
  FDCE #(
    .INIT(1'b0)) 
    \ARADDR_reg[12] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARADDR[12]_i_1_n_0 ),
        .Q(ARADDR[12]));
  FDCE #(
    .INIT(1'b0)) 
    \ARADDR_reg[13] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARADDR[13]_i_1_n_0 ),
        .Q(ARADDR[13]));
  FDCE #(
    .INIT(1'b0)) 
    \ARADDR_reg[14] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARADDR[14]_i_1_n_0 ),
        .Q(ARADDR[14]));
  FDCE #(
    .INIT(1'b0)) 
    \ARADDR_reg[15] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARADDR[15]_i_1_n_0 ),
        .Q(ARADDR[15]));
  FDCE #(
    .INIT(1'b0)) 
    \ARADDR_reg[16] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARADDR[16]_i_1_n_0 ),
        .Q(ARADDR[16]));
  FDCE #(
    .INIT(1'b0)) 
    \ARADDR_reg[17] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARADDR[17]_i_1_n_0 ),
        .Q(ARADDR[17]));
  FDCE #(
    .INIT(1'b0)) 
    \ARADDR_reg[18] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARADDR[18]_i_1_n_0 ),
        .Q(ARADDR[18]));
  FDCE #(
    .INIT(1'b0)) 
    \ARADDR_reg[19] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARADDR[19]_i_1_n_0 ),
        .Q(ARADDR[19]));
  FDCE #(
    .INIT(1'b0)) 
    \ARADDR_reg[1] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARADDR[1]_i_1_n_0 ),
        .Q(ARADDR[1]));
  FDCE #(
    .INIT(1'b0)) 
    \ARADDR_reg[20] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARADDR[20]_i_1_n_0 ),
        .Q(ARADDR[20]));
  FDCE #(
    .INIT(1'b0)) 
    \ARADDR_reg[21] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARADDR[21]_i_1_n_0 ),
        .Q(ARADDR[21]));
  FDCE #(
    .INIT(1'b0)) 
    \ARADDR_reg[22] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARADDR[22]_i_1_n_0 ),
        .Q(ARADDR[22]));
  FDCE #(
    .INIT(1'b0)) 
    \ARADDR_reg[23] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARADDR[23]_i_1_n_0 ),
        .Q(ARADDR[23]));
  FDCE #(
    .INIT(1'b0)) 
    \ARADDR_reg[24] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARADDR[24]_i_1_n_0 ),
        .Q(ARADDR[24]));
  FDCE #(
    .INIT(1'b0)) 
    \ARADDR_reg[25] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARADDR[25]_i_1_n_0 ),
        .Q(ARADDR[25]));
  FDCE #(
    .INIT(1'b0)) 
    \ARADDR_reg[26] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARADDR[26]_i_1_n_0 ),
        .Q(ARADDR[26]));
  FDCE #(
    .INIT(1'b0)) 
    \ARADDR_reg[27] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARADDR[27]_i_1_n_0 ),
        .Q(ARADDR[27]));
  FDCE #(
    .INIT(1'b0)) 
    \ARADDR_reg[28] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARADDR[28]_i_1_n_0 ),
        .Q(ARADDR[28]));
  FDCE #(
    .INIT(1'b0)) 
    \ARADDR_reg[29] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARADDR[29]_i_1_n_0 ),
        .Q(ARADDR[29]));
  FDCE #(
    .INIT(1'b0)) 
    \ARADDR_reg[2] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARADDR[2]_i_1_n_0 ),
        .Q(ARADDR[2]));
  FDCE #(
    .INIT(1'b0)) 
    \ARADDR_reg[30] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARADDR[30]_i_1_n_0 ),
        .Q(ARADDR[30]));
  FDCE #(
    .INIT(1'b0)) 
    \ARADDR_reg[31] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARADDR[31]_i_1_n_0 ),
        .Q(ARADDR[31]));
  FDCE #(
    .INIT(1'b0)) 
    \ARADDR_reg[3] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARADDR[3]_i_1_n_0 ),
        .Q(ARADDR[3]));
  FDCE #(
    .INIT(1'b0)) 
    \ARADDR_reg[4] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARADDR[4]_i_1_n_0 ),
        .Q(ARADDR[4]));
  FDCE #(
    .INIT(1'b0)) 
    \ARADDR_reg[5] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARADDR[5]_i_1_n_0 ),
        .Q(ARADDR[5]));
  FDCE #(
    .INIT(1'b0)) 
    \ARADDR_reg[6] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARADDR[6]_i_1_n_0 ),
        .Q(ARADDR[6]));
  FDCE #(
    .INIT(1'b0)) 
    \ARADDR_reg[7] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARADDR[7]_i_1_n_0 ),
        .Q(ARADDR[7]));
  FDCE #(
    .INIT(1'b0)) 
    \ARADDR_reg[8] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARADDR[8]_i_1_n_0 ),
        .Q(ARADDR[8]));
  FDCE #(
    .INIT(1'b0)) 
    \ARADDR_reg[9] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARADDR[9]_i_1_n_0 ),
        .Q(ARADDR[9]));
  LUT2 #(
    .INIT(4'h2)) 
    \ARBURST[0]_i_1 
       (.I0(CMD[23]),
        .I1(state_read[2]),
        .O(\ARBURST[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARBURST[1]_i_1 
       (.I0(CMD[24]),
        .I1(state_read[2]),
        .O(\ARBURST[1]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \ARBURST_reg[0] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARBURST[0]_i_1_n_0 ),
        .Q(ARBURST[0]));
  FDCE #(
    .INIT(1'b0)) 
    \ARBURST_reg[1] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARBURST[1]_i_1_n_0 ),
        .Q(ARBURST[1]));
  LUT2 #(
    .INIT(4'h2)) 
    \ARID[0]_i_1 
       (.I0(CMD[12]),
        .I1(state_read[2]),
        .O(\ARID[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARID[1]_i_1 
       (.I0(CMD[13]),
        .I1(state_read[2]),
        .O(\ARID[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARID[2]_i_1 
       (.I0(CMD[14]),
        .I1(state_read[2]),
        .O(\ARID[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hA8A8A9A8)) 
    \ARID[3]_i_1 
       (.I0(state_read[2]),
        .I1(state_read[1]),
        .I2(state_read[0]),
        .I3(read_go),
        .I4(CMD[31]),
        .O(\ARID[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARID[3]_i_2 
       (.I0(CMD[15]),
        .I1(state_read[2]),
        .O(\ARID[3]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \ARID_reg[0] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARID[0]_i_1_n_0 ),
        .Q(ARID[0]));
  FDCE #(
    .INIT(1'b0)) 
    \ARID_reg[1] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARID[1]_i_1_n_0 ),
        .Q(ARID[1]));
  FDCE #(
    .INIT(1'b0)) 
    \ARID_reg[2] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARID[2]_i_1_n_0 ),
        .Q(ARID[2]));
  FDCE #(
    .INIT(1'b0)) 
    \ARID_reg[3] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARID[3]_i_2_n_0 ),
        .Q(ARID[3]));
  LUT2 #(
    .INIT(4'h2)) 
    \ARLEN[0]_i_1 
       (.I0(CLENG[0]),
        .I1(state_read[2]),
        .O(\ARLEN[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARLEN[1]_i_1 
       (.I0(CLENG[1]),
        .I1(state_read[2]),
        .O(\ARLEN[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARLEN[2]_i_1 
       (.I0(CLENG[2]),
        .I1(state_read[2]),
        .O(\ARLEN[2]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARLEN[3]_i_1 
       (.I0(CLENG[3]),
        .I1(state_read[2]),
        .O(\ARLEN[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARLEN[4]_i_1 
       (.I0(CLENG[4]),
        .I1(state_read[2]),
        .O(\ARLEN[4]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARLEN[5]_i_1 
       (.I0(CLENG[5]),
        .I1(state_read[2]),
        .O(\ARLEN[5]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARLEN[6]_i_1 
       (.I0(CLENG[6]),
        .I1(state_read[2]),
        .O(\ARLEN[6]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARLEN[7]_i_1 
       (.I0(CLENG[7]),
        .I1(state_read[2]),
        .O(\ARLEN[7]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \ARLEN_reg[0] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARLEN[0]_i_1_n_0 ),
        .Q(ARLEN[0]));
  FDCE #(
    .INIT(1'b0)) 
    \ARLEN_reg[1] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARLEN[1]_i_1_n_0 ),
        .Q(ARLEN[1]));
  FDCE #(
    .INIT(1'b0)) 
    \ARLEN_reg[2] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARLEN[2]_i_1_n_0 ),
        .Q(ARLEN[2]));
  FDCE #(
    .INIT(1'b0)) 
    \ARLEN_reg[3] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARLEN[3]_i_1_n_0 ),
        .Q(ARLEN[3]));
  FDCE #(
    .INIT(1'b0)) 
    \ARLEN_reg[4] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARLEN[4]_i_1_n_0 ),
        .Q(ARLEN[4]));
  FDCE #(
    .INIT(1'b0)) 
    \ARLEN_reg[5] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARLEN[5]_i_1_n_0 ),
        .Q(ARLEN[5]));
  FDCE #(
    .INIT(1'b0)) 
    \ARLEN_reg[6] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARLEN[6]_i_1_n_0 ),
        .Q(ARLEN[6]));
  FDCE #(
    .INIT(1'b0)) 
    \ARLEN_reg[7] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARLEN[7]_i_1_n_0 ),
        .Q(ARLEN[7]));
  LUT2 #(
    .INIT(4'h2)) 
    ARLOCK_i_1
       (.I0(CMD[28]),
        .I1(state_read[2]),
        .O(ARLOCK_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    ARLOCK_reg
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(ARLOCK_i_1_n_0),
        .Q(ARLOCK));
  LUT2 #(
    .INIT(4'h2)) 
    \ARSIZE[0]_i_1 
       (.I0(CMD[25]),
        .I1(state_read[2]),
        .O(\ARSIZE[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARSIZE[1]_i_1 
       (.I0(CMD[26]),
        .I1(state_read[2]),
        .O(\ARSIZE[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ARSIZE[2]_i_1 
       (.I0(CMD[27]),
        .I1(state_read[2]),
        .O(\ARSIZE[2]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \ARSIZE_reg[0] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARSIZE[0]_i_1_n_0 ),
        .Q(ARSIZE[0]));
  FDCE #(
    .INIT(1'b0)) 
    \ARSIZE_reg[1] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARSIZE[1]_i_1_n_0 ),
        .Q(ARSIZE[1]));
  FDCE #(
    .INIT(1'b0)) 
    \ARSIZE_reg[2] 
       (.C(ACLK),
        .CE(\ARID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\ARSIZE[2]_i_1_n_0 ),
        .Q(ARSIZE[2]));
  LUT5 #(
    .INIT(32'h02FF0200)) 
    ARVALID_i_1
       (.I0(read_go),
        .I1(state_read[0]),
        .I2(state_read[2]),
        .I3(ARVALID_i_2_n_0),
        .I4(ARVALID),
        .O(ARVALID_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFF000000AA30)) 
    ARVALID_i_2
       (.I0(ARREADY),
        .I1(CMD[31]),
        .I2(read_go),
        .I3(state_read[0]),
        .I4(state_read[1]),
        .I5(state_read[2]),
        .O(ARVALID_i_2_n_0));
  FDCE #(
    .INIT(1'b0)) 
    ARVALID_reg
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(ARVALID_i_1_n_0),
        .Q(ARVALID));
  LUT2 #(
    .INIT(4'h2)) 
    \AWADDR[0]_i_1 
       (.I0(CADDR_reg_n_0_[0]),
        .I1(state_write[2]),
        .O(\AWADDR[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWADDR[10]_i_1 
       (.I0(CADDR_reg_n_0_[10]),
        .I1(state_write[2]),
        .O(\AWADDR[10]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWADDR[11]_i_1 
       (.I0(CADDR_reg_n_0_[11]),
        .I1(state_write[2]),
        .O(\AWADDR[11]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWADDR[12]_i_1 
       (.I0(CADDR_reg_n_0_[12]),
        .I1(state_write[2]),
        .O(\AWADDR[12]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWADDR[13]_i_1 
       (.I0(CADDR_reg_n_0_[13]),
        .I1(state_write[2]),
        .O(\AWADDR[13]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWADDR[14]_i_1 
       (.I0(CADDR_reg_n_0_[14]),
        .I1(state_write[2]),
        .O(\AWADDR[14]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWADDR[15]_i_1 
       (.I0(CADDR_reg_n_0_[15]),
        .I1(state_write[2]),
        .O(\AWADDR[15]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWADDR[16]_i_1 
       (.I0(CADDR_reg_n_0_[16]),
        .I1(state_write[2]),
        .O(\AWADDR[16]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWADDR[17]_i_1 
       (.I0(CADDR_reg_n_0_[17]),
        .I1(state_write[2]),
        .O(\AWADDR[17]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWADDR[18]_i_1 
       (.I0(CADDR_reg_n_0_[18]),
        .I1(state_write[2]),
        .O(\AWADDR[18]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWADDR[19]_i_1 
       (.I0(CADDR_reg_n_0_[19]),
        .I1(state_write[2]),
        .O(\AWADDR[19]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWADDR[1]_i_1 
       (.I0(CADDR_reg_n_0_[1]),
        .I1(state_write[2]),
        .O(\AWADDR[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWADDR[20]_i_1 
       (.I0(CADDR_reg_n_0_[20]),
        .I1(state_write[2]),
        .O(\AWADDR[20]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWADDR[21]_i_1 
       (.I0(CADDR_reg_n_0_[21]),
        .I1(state_write[2]),
        .O(\AWADDR[21]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWADDR[22]_i_1 
       (.I0(CADDR_reg_n_0_[22]),
        .I1(state_write[2]),
        .O(\AWADDR[22]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWADDR[23]_i_1 
       (.I0(CADDR_reg_n_0_[23]),
        .I1(state_write[2]),
        .O(\AWADDR[23]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWADDR[24]_i_1 
       (.I0(CADDR_reg_n_0_[24]),
        .I1(state_write[2]),
        .O(\AWADDR[24]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWADDR[25]_i_1 
       (.I0(CADDR_reg_n_0_[25]),
        .I1(state_write[2]),
        .O(\AWADDR[25]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWADDR[26]_i_1 
       (.I0(CADDR_reg_n_0_[26]),
        .I1(state_write[2]),
        .O(\AWADDR[26]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWADDR[27]_i_1 
       (.I0(CADDR_reg_n_0_[27]),
        .I1(state_write[2]),
        .O(\AWADDR[27]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWADDR[28]_i_1 
       (.I0(CADDR_reg_n_0_[28]),
        .I1(state_write[2]),
        .O(\AWADDR[28]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWADDR[29]_i_1 
       (.I0(CADDR_reg_n_0_[29]),
        .I1(state_write[2]),
        .O(\AWADDR[29]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWADDR[2]_i_1 
       (.I0(CADDR_reg_n_0_[2]),
        .I1(state_write[2]),
        .O(\AWADDR[2]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWADDR[30]_i_1 
       (.I0(CADDR_reg_n_0_[30]),
        .I1(state_write[2]),
        .O(\AWADDR[30]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWADDR[31]_i_1 
       (.I0(CADDR_reg_n_0_[31]),
        .I1(state_write[2]),
        .O(\AWADDR[31]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWADDR[3]_i_1 
       (.I0(CADDR_reg_n_0_[3]),
        .I1(state_write[2]),
        .O(\AWADDR[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWADDR[4]_i_1 
       (.I0(CADDR_reg_n_0_[4]),
        .I1(state_write[2]),
        .O(\AWADDR[4]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWADDR[5]_i_1 
       (.I0(CADDR_reg_n_0_[5]),
        .I1(state_write[2]),
        .O(\AWADDR[5]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWADDR[6]_i_1 
       (.I0(CADDR_reg_n_0_[6]),
        .I1(state_write[2]),
        .O(\AWADDR[6]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWADDR[7]_i_1 
       (.I0(CADDR_reg_n_0_[7]),
        .I1(state_write[2]),
        .O(\AWADDR[7]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWADDR[8]_i_1 
       (.I0(CADDR_reg_n_0_[8]),
        .I1(state_write[2]),
        .O(\AWADDR[8]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWADDR[9]_i_1 
       (.I0(CADDR_reg_n_0_[9]),
        .I1(state_write[2]),
        .O(\AWADDR[9]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \AWADDR_reg[0] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWADDR[0]_i_1_n_0 ),
        .Q(AWADDR[0]));
  FDCE #(
    .INIT(1'b0)) 
    \AWADDR_reg[10] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWADDR[10]_i_1_n_0 ),
        .Q(AWADDR[10]));
  FDCE #(
    .INIT(1'b0)) 
    \AWADDR_reg[11] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWADDR[11]_i_1_n_0 ),
        .Q(AWADDR[11]));
  FDCE #(
    .INIT(1'b0)) 
    \AWADDR_reg[12] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWADDR[12]_i_1_n_0 ),
        .Q(AWADDR[12]));
  FDCE #(
    .INIT(1'b0)) 
    \AWADDR_reg[13] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWADDR[13]_i_1_n_0 ),
        .Q(AWADDR[13]));
  FDCE #(
    .INIT(1'b0)) 
    \AWADDR_reg[14] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWADDR[14]_i_1_n_0 ),
        .Q(AWADDR[14]));
  FDCE #(
    .INIT(1'b0)) 
    \AWADDR_reg[15] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWADDR[15]_i_1_n_0 ),
        .Q(AWADDR[15]));
  FDCE #(
    .INIT(1'b0)) 
    \AWADDR_reg[16] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWADDR[16]_i_1_n_0 ),
        .Q(AWADDR[16]));
  FDCE #(
    .INIT(1'b0)) 
    \AWADDR_reg[17] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWADDR[17]_i_1_n_0 ),
        .Q(AWADDR[17]));
  FDCE #(
    .INIT(1'b0)) 
    \AWADDR_reg[18] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWADDR[18]_i_1_n_0 ),
        .Q(AWADDR[18]));
  FDCE #(
    .INIT(1'b0)) 
    \AWADDR_reg[19] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWADDR[19]_i_1_n_0 ),
        .Q(AWADDR[19]));
  FDCE #(
    .INIT(1'b0)) 
    \AWADDR_reg[1] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWADDR[1]_i_1_n_0 ),
        .Q(AWADDR[1]));
  FDCE #(
    .INIT(1'b0)) 
    \AWADDR_reg[20] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWADDR[20]_i_1_n_0 ),
        .Q(AWADDR[20]));
  FDCE #(
    .INIT(1'b0)) 
    \AWADDR_reg[21] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWADDR[21]_i_1_n_0 ),
        .Q(AWADDR[21]));
  FDCE #(
    .INIT(1'b0)) 
    \AWADDR_reg[22] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWADDR[22]_i_1_n_0 ),
        .Q(AWADDR[22]));
  FDCE #(
    .INIT(1'b0)) 
    \AWADDR_reg[23] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWADDR[23]_i_1_n_0 ),
        .Q(AWADDR[23]));
  FDCE #(
    .INIT(1'b0)) 
    \AWADDR_reg[24] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWADDR[24]_i_1_n_0 ),
        .Q(AWADDR[24]));
  FDCE #(
    .INIT(1'b0)) 
    \AWADDR_reg[25] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWADDR[25]_i_1_n_0 ),
        .Q(AWADDR[25]));
  FDCE #(
    .INIT(1'b0)) 
    \AWADDR_reg[26] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWADDR[26]_i_1_n_0 ),
        .Q(AWADDR[26]));
  FDCE #(
    .INIT(1'b0)) 
    \AWADDR_reg[27] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWADDR[27]_i_1_n_0 ),
        .Q(AWADDR[27]));
  FDCE #(
    .INIT(1'b0)) 
    \AWADDR_reg[28] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWADDR[28]_i_1_n_0 ),
        .Q(AWADDR[28]));
  FDCE #(
    .INIT(1'b0)) 
    \AWADDR_reg[29] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWADDR[29]_i_1_n_0 ),
        .Q(AWADDR[29]));
  FDCE #(
    .INIT(1'b0)) 
    \AWADDR_reg[2] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWADDR[2]_i_1_n_0 ),
        .Q(AWADDR[2]));
  FDCE #(
    .INIT(1'b0)) 
    \AWADDR_reg[30] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWADDR[30]_i_1_n_0 ),
        .Q(AWADDR[30]));
  FDCE #(
    .INIT(1'b0)) 
    \AWADDR_reg[31] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWADDR[31]_i_1_n_0 ),
        .Q(AWADDR[31]));
  FDCE #(
    .INIT(1'b0)) 
    \AWADDR_reg[3] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWADDR[3]_i_1_n_0 ),
        .Q(AWADDR[3]));
  FDCE #(
    .INIT(1'b0)) 
    \AWADDR_reg[4] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWADDR[4]_i_1_n_0 ),
        .Q(AWADDR[4]));
  FDCE #(
    .INIT(1'b0)) 
    \AWADDR_reg[5] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWADDR[5]_i_1_n_0 ),
        .Q(AWADDR[5]));
  FDCE #(
    .INIT(1'b0)) 
    \AWADDR_reg[6] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWADDR[6]_i_1_n_0 ),
        .Q(AWADDR[6]));
  FDCE #(
    .INIT(1'b0)) 
    \AWADDR_reg[7] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWADDR[7]_i_1_n_0 ),
        .Q(AWADDR[7]));
  FDCE #(
    .INIT(1'b0)) 
    \AWADDR_reg[8] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWADDR[8]_i_1_n_0 ),
        .Q(AWADDR[8]));
  FDCE #(
    .INIT(1'b0)) 
    \AWADDR_reg[9] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWADDR[9]_i_1_n_0 ),
        .Q(AWADDR[9]));
  LUT2 #(
    .INIT(4'h2)) 
    \AWBURST[0]_i_1 
       (.I0(CMD[23]),
        .I1(state_write[2]),
        .O(\AWBURST[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWBURST[1]_i_1 
       (.I0(CMD[24]),
        .I1(state_write[2]),
        .O(\AWBURST[1]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \AWBURST_reg[0] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWBURST[0]_i_1_n_0 ),
        .Q(AWBURST[0]));
  FDCE #(
    .INIT(1'b0)) 
    \AWBURST_reg[1] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWBURST[1]_i_1_n_0 ),
        .Q(AWBURST[1]));
  LUT2 #(
    .INIT(4'h2)) 
    \AWID[0]_i_1 
       (.I0(CMD[12]),
        .I1(state_write[2]),
        .O(\AWID[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWID[1]_i_1 
       (.I0(CMD[13]),
        .I1(state_write[2]),
        .O(\AWID[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWID[2]_i_1 
       (.I0(CMD[14]),
        .I1(state_write[2]),
        .O(\AWID[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF002)) 
    \AWID[3]_i_1 
       (.I0(write_go_reg_n_0),
        .I1(state_write[0]),
        .I2(state_write[2]),
        .I3(state_write[1]),
        .O(\AWID[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWID[3]_i_2 
       (.I0(CMD[15]),
        .I1(state_write[2]),
        .O(\AWID[3]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \AWID_reg[0] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWID[0]_i_1_n_0 ),
        .Q(AWID[0]));
  FDCE #(
    .INIT(1'b0)) 
    \AWID_reg[1] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWID[1]_i_1_n_0 ),
        .Q(AWID[1]));
  FDCE #(
    .INIT(1'b0)) 
    \AWID_reg[2] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWID[2]_i_1_n_0 ),
        .Q(AWID[2]));
  FDCE #(
    .INIT(1'b0)) 
    \AWID_reg[3] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWID[3]_i_2_n_0 ),
        .Q(AWID[3]));
  LUT2 #(
    .INIT(4'h2)) 
    \AWLEN[0]_i_1 
       (.I0(CLENG[0]),
        .I1(state_write[2]),
        .O(\AWLEN[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWLEN[1]_i_1 
       (.I0(CLENG[1]),
        .I1(state_write[2]),
        .O(\AWLEN[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWLEN[2]_i_1 
       (.I0(CLENG[2]),
        .I1(state_write[2]),
        .O(\AWLEN[2]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWLEN[3]_i_1 
       (.I0(CLENG[3]),
        .I1(state_write[2]),
        .O(\AWLEN[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWLEN[4]_i_1 
       (.I0(CLENG[4]),
        .I1(state_write[2]),
        .O(\AWLEN[4]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWLEN[5]_i_1 
       (.I0(CLENG[5]),
        .I1(state_write[2]),
        .O(\AWLEN[5]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWLEN[6]_i_1 
       (.I0(CLENG[6]),
        .I1(state_write[2]),
        .O(\AWLEN[6]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWLEN[7]_i_1 
       (.I0(CLENG[7]),
        .I1(state_write[2]),
        .O(\AWLEN[7]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \AWLEN_reg[0] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWLEN[0]_i_1_n_0 ),
        .Q(AWLEN[0]));
  FDCE #(
    .INIT(1'b0)) 
    \AWLEN_reg[1] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWLEN[1]_i_1_n_0 ),
        .Q(AWLEN[1]));
  FDCE #(
    .INIT(1'b0)) 
    \AWLEN_reg[2] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWLEN[2]_i_1_n_0 ),
        .Q(AWLEN[2]));
  FDCE #(
    .INIT(1'b0)) 
    \AWLEN_reg[3] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWLEN[3]_i_1_n_0 ),
        .Q(AWLEN[3]));
  FDCE #(
    .INIT(1'b0)) 
    \AWLEN_reg[4] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWLEN[4]_i_1_n_0 ),
        .Q(AWLEN[4]));
  FDCE #(
    .INIT(1'b0)) 
    \AWLEN_reg[5] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWLEN[5]_i_1_n_0 ),
        .Q(AWLEN[5]));
  FDCE #(
    .INIT(1'b0)) 
    \AWLEN_reg[6] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWLEN[6]_i_1_n_0 ),
        .Q(AWLEN[6]));
  FDCE #(
    .INIT(1'b0)) 
    \AWLEN_reg[7] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWLEN[7]_i_1_n_0 ),
        .Q(AWLEN[7]));
  LUT2 #(
    .INIT(4'h2)) 
    AWLOCK_i_1
       (.I0(CMD[28]),
        .I1(state_write[2]),
        .O(AWLOCK_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    AWLOCK_reg
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(AWLOCK_i_1_n_0),
        .Q(AWLOCK));
  LUT2 #(
    .INIT(4'h2)) 
    \AWSIZE[0]_i_1 
       (.I0(CMD[25]),
        .I1(state_write[2]),
        .O(\AWSIZE[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWSIZE[1]_i_1 
       (.I0(CMD[26]),
        .I1(state_write[2]),
        .O(\AWSIZE[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AWSIZE[2]_i_1 
       (.I0(CMD[27]),
        .I1(state_write[2]),
        .O(\AWSIZE[2]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \AWSIZE_reg[0] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWSIZE[0]_i_1_n_0 ),
        .Q(AWSIZE[0]));
  FDCE #(
    .INIT(1'b0)) 
    \AWSIZE_reg[1] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWSIZE[1]_i_1_n_0 ),
        .Q(AWSIZE[1]));
  FDCE #(
    .INIT(1'b0)) 
    \AWSIZE_reg[2] 
       (.C(ACLK),
        .CE(\AWID[3]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\AWSIZE[2]_i_1_n_0 ),
        .Q(AWSIZE[2]));
  LUT6 #(
    .INIT(64'h3D3F3D3F00030000)) 
    AWVALID_i_1
       (.I0(AWREADY),
        .I1(state_write[1]),
        .I2(state_write[2]),
        .I3(state_write[0]),
        .I4(write_go_reg_n_0),
        .I5(AWVALID),
        .O(AWVALID_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    AWVALID_reg
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(AWVALID_i_1_n_0),
        .Q(AWVALID));
  CARRY4 BREADY0_carry
       (.CI(1'b0),
        .CO({BREADY0_carry_n_0,BREADY0_carry_n_1,BREADY0_carry_n_2,BREADY0_carry_n_3}),
        .CYINIT(1'b0),
        .DI({BREADY0_carry_i_1_n_0,BREADY0_carry_i_2_n_0,BREADY0_carry_i_3_n_0,BREADY0_carry_i_4_n_0}),
        .O(NLW_BREADY0_carry_O_UNCONNECTED[3:0]),
        .S({BREADY0_carry_i_5_n_0,BREADY0_carry_i_6_n_0,BREADY0_carry_i_7_n_0,BREADY0_carry_i_8_n_0}));
  CARRY4 BREADY0_carry__0
       (.CI(BREADY0_carry_n_0),
        .CO({NLW_BREADY0_carry__0_CO_UNCONNECTED[3:1],BREADY0}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,countW_reg_n_0_[8]}),
        .O(NLW_BREADY0_carry__0_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,u_u2f_fifo_n_2}));
  LUT4 #(
    .INIT(16'h22B2)) 
    BREADY0_carry_i_1
       (.I0(countW_reg_n_0_[7]),
        .I1(AWLEN[7]),
        .I2(countW_reg_n_0_[6]),
        .I3(AWLEN[6]),
        .O(BREADY0_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    BREADY0_carry_i_2
       (.I0(countW_reg_n_0_[5]),
        .I1(AWLEN[5]),
        .I2(countW_reg_n_0_[4]),
        .I3(AWLEN[4]),
        .O(BREADY0_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    BREADY0_carry_i_3
       (.I0(countW_reg_n_0_[3]),
        .I1(AWLEN[3]),
        .I2(countW_reg_n_0_[2]),
        .I3(AWLEN[2]),
        .O(BREADY0_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h7510)) 
    BREADY0_carry_i_4
       (.I0(AWLEN[1]),
        .I1(AWLEN[0]),
        .I2(countW_reg_n_0_[0]),
        .I3(countW_reg_n_0_[1]),
        .O(BREADY0_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    BREADY0_carry_i_5
       (.I0(AWLEN[7]),
        .I1(countW_reg_n_0_[7]),
        .I2(AWLEN[6]),
        .I3(countW_reg_n_0_[6]),
        .O(BREADY0_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    BREADY0_carry_i_6
       (.I0(AWLEN[5]),
        .I1(countW_reg_n_0_[5]),
        .I2(AWLEN[4]),
        .I3(countW_reg_n_0_[4]),
        .O(BREADY0_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    BREADY0_carry_i_7
       (.I0(AWLEN[3]),
        .I1(countW_reg_n_0_[3]),
        .I2(AWLEN[2]),
        .I3(countW_reg_n_0_[2]),
        .O(BREADY0_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    BREADY0_carry_i_8
       (.I0(AWLEN[1]),
        .I1(countW_reg_n_0_[1]),
        .I2(AWLEN[0]),
        .I3(countW_reg_n_0_[0]),
        .O(BREADY0_carry_i_8_n_0));
  LUT6 #(
    .INIT(64'h44447FFF44444000)) 
    BREADY_i_1
       (.I0(state_write[2]),
        .I1(BREADY0),
        .I2(BREADY1__0),
        .I3(BREADY_i_3_n_0),
        .I4(BREADY_i_4_n_0),
        .I5(BREADY_reg_0),
        .O(BREADY_i_1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    BREADY_i_3
       (.I0(state_write[1]),
        .I1(state_write[0]),
        .O(BREADY_i_3_n_0));
  LUT4 #(
    .INIT(16'hAE00)) 
    BREADY_i_4
       (.I0(state_write[1]),
        .I1(BVALID),
        .I2(state_write[0]),
        .I3(state_write[2]),
        .O(BREADY_i_4_n_0));
  FDCE #(
    .INIT(1'b0)) 
    BREADY_reg
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(BREADY_i_1_n_0),
        .Q(BREADY_reg_0));
  LUT6 #(
    .INIT(64'h00F000AA00CC00AA)) 
    \CADDR[0]_i_1 
       (.I0(cmd_rd_data[0]),
        .I1(addr[0]),
        .I2(addrR_reg_n_0_[0]),
        .I3(state_cmd[2]),
        .I4(state_cmd[1]),
        .I5(state_cmd[0]),
        .O(\CADDR[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F000AA00CC00AA)) 
    \CADDR[10]_i_1 
       (.I0(cmd_rd_data[10]),
        .I1(addr[10]),
        .I2(addrR_reg_n_0_[10]),
        .I3(state_cmd[2]),
        .I4(state_cmd[1]),
        .I5(state_cmd[0]),
        .O(\CADDR[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F000AA00CC00AA)) 
    \CADDR[11]_i_1 
       (.I0(cmd_rd_data[11]),
        .I1(addr[11]),
        .I2(addrR_reg_n_0_[11]),
        .I3(state_cmd[2]),
        .I4(state_cmd[1]),
        .I5(state_cmd[0]),
        .O(\CADDR[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F000AA00CC00AA)) 
    \CADDR[12]_i_1 
       (.I0(cmd_rd_data[12]),
        .I1(addr[12]),
        .I2(addrR_reg_n_0_[12]),
        .I3(state_cmd[2]),
        .I4(state_cmd[1]),
        .I5(state_cmd[0]),
        .O(\CADDR[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F000AA00CC00AA)) 
    \CADDR[13]_i_1 
       (.I0(cmd_rd_data[13]),
        .I1(addr[13]),
        .I2(addrR_reg_n_0_[13]),
        .I3(state_cmd[2]),
        .I4(state_cmd[1]),
        .I5(state_cmd[0]),
        .O(\CADDR[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F000AA00CC00AA)) 
    \CADDR[14]_i_1 
       (.I0(cmd_rd_data[14]),
        .I1(addr[14]),
        .I2(addrR_reg_n_0_[14]),
        .I3(state_cmd[2]),
        .I4(state_cmd[1]),
        .I5(state_cmd[0]),
        .O(\CADDR[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F000AA00CC00AA)) 
    \CADDR[15]_i_1 
       (.I0(cmd_rd_data[15]),
        .I1(addr[15]),
        .I2(addrR_reg_n_0_[15]),
        .I3(state_cmd[2]),
        .I4(state_cmd[1]),
        .I5(state_cmd[0]),
        .O(\CADDR[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F000AA00CC00AA)) 
    \CADDR[16]_i_1 
       (.I0(cmd_rd_data[16]),
        .I1(addr[16]),
        .I2(addrR_reg_n_0_[16]),
        .I3(state_cmd[2]),
        .I4(state_cmd[1]),
        .I5(state_cmd[0]),
        .O(\CADDR[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F000AA00CC00AA)) 
    \CADDR[17]_i_1 
       (.I0(cmd_rd_data[17]),
        .I1(addr[17]),
        .I2(addrR_reg_n_0_[17]),
        .I3(state_cmd[2]),
        .I4(state_cmd[1]),
        .I5(state_cmd[0]),
        .O(\CADDR[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F000AA00CC00AA)) 
    \CADDR[18]_i_1 
       (.I0(cmd_rd_data[18]),
        .I1(addr[18]),
        .I2(addrR_reg_n_0_[18]),
        .I3(state_cmd[2]),
        .I4(state_cmd[1]),
        .I5(state_cmd[0]),
        .O(\CADDR[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F000AA00CC00AA)) 
    \CADDR[19]_i_1 
       (.I0(cmd_rd_data[19]),
        .I1(addr[19]),
        .I2(addrR_reg_n_0_[19]),
        .I3(state_cmd[2]),
        .I4(state_cmd[1]),
        .I5(state_cmd[0]),
        .O(\CADDR[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F000AA00CC00AA)) 
    \CADDR[1]_i_1 
       (.I0(cmd_rd_data[1]),
        .I1(addr[1]),
        .I2(addrR_reg_n_0_[1]),
        .I3(state_cmd[2]),
        .I4(state_cmd[1]),
        .I5(state_cmd[0]),
        .O(\CADDR[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F000AA00CC00AA)) 
    \CADDR[20]_i_1 
       (.I0(cmd_rd_data[20]),
        .I1(addr[20]),
        .I2(addrR_reg_n_0_[20]),
        .I3(state_cmd[2]),
        .I4(state_cmd[1]),
        .I5(state_cmd[0]),
        .O(\CADDR[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F000AA00CC00AA)) 
    \CADDR[21]_i_1 
       (.I0(cmd_rd_data[21]),
        .I1(addr[21]),
        .I2(addrR_reg_n_0_[21]),
        .I3(state_cmd[2]),
        .I4(state_cmd[1]),
        .I5(state_cmd[0]),
        .O(\CADDR[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F000AA00CC00AA)) 
    \CADDR[22]_i_1 
       (.I0(cmd_rd_data[22]),
        .I1(addr[22]),
        .I2(addrR_reg_n_0_[22]),
        .I3(state_cmd[2]),
        .I4(state_cmd[1]),
        .I5(state_cmd[0]),
        .O(\CADDR[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F000AA00CC00AA)) 
    \CADDR[23]_i_1 
       (.I0(cmd_rd_data[23]),
        .I1(addr[23]),
        .I2(addrR_reg_n_0_[23]),
        .I3(state_cmd[2]),
        .I4(state_cmd[1]),
        .I5(state_cmd[0]),
        .O(\CADDR[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F000AA00CC00AA)) 
    \CADDR[24]_i_1 
       (.I0(cmd_rd_data[24]),
        .I1(addr[24]),
        .I2(addrR_reg_n_0_[24]),
        .I3(state_cmd[2]),
        .I4(state_cmd[1]),
        .I5(state_cmd[0]),
        .O(\CADDR[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F000AA00CC00AA)) 
    \CADDR[25]_i_1 
       (.I0(cmd_rd_data[25]),
        .I1(addr[25]),
        .I2(addrR_reg_n_0_[25]),
        .I3(state_cmd[2]),
        .I4(state_cmd[1]),
        .I5(state_cmd[0]),
        .O(\CADDR[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F000AA00CC00AA)) 
    \CADDR[26]_i_1 
       (.I0(cmd_rd_data[26]),
        .I1(addr[26]),
        .I2(addrR_reg_n_0_[26]),
        .I3(state_cmd[2]),
        .I4(state_cmd[1]),
        .I5(state_cmd[0]),
        .O(\CADDR[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F000AA00CC00AA)) 
    \CADDR[27]_i_1 
       (.I0(cmd_rd_data[27]),
        .I1(addr[27]),
        .I2(addrR_reg_n_0_[27]),
        .I3(state_cmd[2]),
        .I4(state_cmd[1]),
        .I5(state_cmd[0]),
        .O(\CADDR[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F000AA00CC00AA)) 
    \CADDR[28]_i_1 
       (.I0(cmd_rd_data[28]),
        .I1(addr[28]),
        .I2(addrR_reg_n_0_[28]),
        .I3(state_cmd[2]),
        .I4(state_cmd[1]),
        .I5(state_cmd[0]),
        .O(\CADDR[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F000AA00CC00AA)) 
    \CADDR[29]_i_1 
       (.I0(cmd_rd_data[29]),
        .I1(addr[29]),
        .I2(addrR_reg_n_0_[29]),
        .I3(state_cmd[2]),
        .I4(state_cmd[1]),
        .I5(state_cmd[0]),
        .O(\CADDR[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F000AA00CC00AA)) 
    \CADDR[2]_i_1 
       (.I0(cmd_rd_data[2]),
        .I1(addr[2]),
        .I2(addrR_reg_n_0_[2]),
        .I3(state_cmd[2]),
        .I4(state_cmd[1]),
        .I5(state_cmd[0]),
        .O(\CADDR[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F000AA00CC00AA)) 
    \CADDR[30]_i_1 
       (.I0(cmd_rd_data[30]),
        .I1(addr[30]),
        .I2(addrR_reg_n_0_[30]),
        .I3(state_cmd[2]),
        .I4(state_cmd[1]),
        .I5(state_cmd[0]),
        .O(\CADDR[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFAAFEAAEEAAFEAA)) 
    \CADDR[31]_i_1 
       (.I0(\CLENG_reg[11]_i_3_n_0 ),
        .I1(state_cmd[2]),
        .I2(write_done),
        .I3(state_cmd[1]),
        .I4(state_cmd[0]),
        .I5(read_done_reg_n_0),
        .O(\CADDR[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F000AA00CC00AA)) 
    \CADDR[31]_i_2 
       (.I0(cmd_rd_data[31]),
        .I1(addr[31]),
        .I2(addrR_reg_n_0_[31]),
        .I3(state_cmd[2]),
        .I4(state_cmd[1]),
        .I5(state_cmd[0]),
        .O(\CADDR[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00F000AA00CC00AA)) 
    \CADDR[3]_i_1 
       (.I0(cmd_rd_data[3]),
        .I1(addr[3]),
        .I2(addrR_reg_n_0_[3]),
        .I3(state_cmd[2]),
        .I4(state_cmd[1]),
        .I5(state_cmd[0]),
        .O(\CADDR[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F000AA00CC00AA)) 
    \CADDR[4]_i_1 
       (.I0(cmd_rd_data[4]),
        .I1(addr[4]),
        .I2(addrR_reg_n_0_[4]),
        .I3(state_cmd[2]),
        .I4(state_cmd[1]),
        .I5(state_cmd[0]),
        .O(\CADDR[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F000AA00CC00AA)) 
    \CADDR[5]_i_1 
       (.I0(cmd_rd_data[5]),
        .I1(addr[5]),
        .I2(addrR_reg_n_0_[5]),
        .I3(state_cmd[2]),
        .I4(state_cmd[1]),
        .I5(state_cmd[0]),
        .O(\CADDR[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F000AA00CC00AA)) 
    \CADDR[6]_i_1 
       (.I0(cmd_rd_data[6]),
        .I1(addr[6]),
        .I2(addrR_reg_n_0_[6]),
        .I3(state_cmd[2]),
        .I4(state_cmd[1]),
        .I5(state_cmd[0]),
        .O(\CADDR[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F000AA00CC00AA)) 
    \CADDR[7]_i_1 
       (.I0(cmd_rd_data[7]),
        .I1(addr[7]),
        .I2(addrR_reg_n_0_[7]),
        .I3(state_cmd[2]),
        .I4(state_cmd[1]),
        .I5(state_cmd[0]),
        .O(\CADDR[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F000AA00CC00AA)) 
    \CADDR[8]_i_1 
       (.I0(cmd_rd_data[8]),
        .I1(addr[8]),
        .I2(addrR_reg_n_0_[8]),
        .I3(state_cmd[2]),
        .I4(state_cmd[1]),
        .I5(state_cmd[0]),
        .O(\CADDR[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F000AA00CC00AA)) 
    \CADDR[9]_i_1 
       (.I0(cmd_rd_data[9]),
        .I1(addr[9]),
        .I2(addrR_reg_n_0_[9]),
        .I3(state_cmd[2]),
        .I4(state_cmd[1]),
        .I5(state_cmd[0]),
        .O(\CADDR[9]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \CADDR_reg[0] 
       (.C(ACLK),
        .CE(\CADDR[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CADDR[0]_i_1_n_0 ),
        .Q(CADDR_reg_n_0_[0]));
  FDCE #(
    .INIT(1'b0)) 
    \CADDR_reg[10] 
       (.C(ACLK),
        .CE(\CADDR[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CADDR[10]_i_1_n_0 ),
        .Q(CADDR_reg_n_0_[10]));
  FDCE #(
    .INIT(1'b0)) 
    \CADDR_reg[11] 
       (.C(ACLK),
        .CE(\CADDR[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CADDR[11]_i_1_n_0 ),
        .Q(CADDR_reg_n_0_[11]));
  FDCE #(
    .INIT(1'b0)) 
    \CADDR_reg[12] 
       (.C(ACLK),
        .CE(\CADDR[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CADDR[12]_i_1_n_0 ),
        .Q(CADDR_reg_n_0_[12]));
  FDCE #(
    .INIT(1'b0)) 
    \CADDR_reg[13] 
       (.C(ACLK),
        .CE(\CADDR[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CADDR[13]_i_1_n_0 ),
        .Q(CADDR_reg_n_0_[13]));
  FDCE #(
    .INIT(1'b0)) 
    \CADDR_reg[14] 
       (.C(ACLK),
        .CE(\CADDR[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CADDR[14]_i_1_n_0 ),
        .Q(CADDR_reg_n_0_[14]));
  FDCE #(
    .INIT(1'b0)) 
    \CADDR_reg[15] 
       (.C(ACLK),
        .CE(\CADDR[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CADDR[15]_i_1_n_0 ),
        .Q(CADDR_reg_n_0_[15]));
  FDCE #(
    .INIT(1'b0)) 
    \CADDR_reg[16] 
       (.C(ACLK),
        .CE(\CADDR[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CADDR[16]_i_1_n_0 ),
        .Q(CADDR_reg_n_0_[16]));
  FDCE #(
    .INIT(1'b0)) 
    \CADDR_reg[17] 
       (.C(ACLK),
        .CE(\CADDR[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CADDR[17]_i_1_n_0 ),
        .Q(CADDR_reg_n_0_[17]));
  FDCE #(
    .INIT(1'b0)) 
    \CADDR_reg[18] 
       (.C(ACLK),
        .CE(\CADDR[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CADDR[18]_i_1_n_0 ),
        .Q(CADDR_reg_n_0_[18]));
  FDCE #(
    .INIT(1'b0)) 
    \CADDR_reg[19] 
       (.C(ACLK),
        .CE(\CADDR[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CADDR[19]_i_1_n_0 ),
        .Q(CADDR_reg_n_0_[19]));
  FDCE #(
    .INIT(1'b0)) 
    \CADDR_reg[1] 
       (.C(ACLK),
        .CE(\CADDR[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CADDR[1]_i_1_n_0 ),
        .Q(CADDR_reg_n_0_[1]));
  FDCE #(
    .INIT(1'b0)) 
    \CADDR_reg[20] 
       (.C(ACLK),
        .CE(\CADDR[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CADDR[20]_i_1_n_0 ),
        .Q(CADDR_reg_n_0_[20]));
  FDCE #(
    .INIT(1'b0)) 
    \CADDR_reg[21] 
       (.C(ACLK),
        .CE(\CADDR[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CADDR[21]_i_1_n_0 ),
        .Q(CADDR_reg_n_0_[21]));
  FDCE #(
    .INIT(1'b0)) 
    \CADDR_reg[22] 
       (.C(ACLK),
        .CE(\CADDR[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CADDR[22]_i_1_n_0 ),
        .Q(CADDR_reg_n_0_[22]));
  FDCE #(
    .INIT(1'b0)) 
    \CADDR_reg[23] 
       (.C(ACLK),
        .CE(\CADDR[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CADDR[23]_i_1_n_0 ),
        .Q(CADDR_reg_n_0_[23]));
  FDCE #(
    .INIT(1'b0)) 
    \CADDR_reg[24] 
       (.C(ACLK),
        .CE(\CADDR[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CADDR[24]_i_1_n_0 ),
        .Q(CADDR_reg_n_0_[24]));
  FDCE #(
    .INIT(1'b0)) 
    \CADDR_reg[25] 
       (.C(ACLK),
        .CE(\CADDR[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CADDR[25]_i_1_n_0 ),
        .Q(CADDR_reg_n_0_[25]));
  FDCE #(
    .INIT(1'b0)) 
    \CADDR_reg[26] 
       (.C(ACLK),
        .CE(\CADDR[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CADDR[26]_i_1_n_0 ),
        .Q(CADDR_reg_n_0_[26]));
  FDCE #(
    .INIT(1'b0)) 
    \CADDR_reg[27] 
       (.C(ACLK),
        .CE(\CADDR[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CADDR[27]_i_1_n_0 ),
        .Q(CADDR_reg_n_0_[27]));
  FDCE #(
    .INIT(1'b0)) 
    \CADDR_reg[28] 
       (.C(ACLK),
        .CE(\CADDR[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CADDR[28]_i_1_n_0 ),
        .Q(CADDR_reg_n_0_[28]));
  FDCE #(
    .INIT(1'b0)) 
    \CADDR_reg[29] 
       (.C(ACLK),
        .CE(\CADDR[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CADDR[29]_i_1_n_0 ),
        .Q(CADDR_reg_n_0_[29]));
  FDCE #(
    .INIT(1'b0)) 
    \CADDR_reg[2] 
       (.C(ACLK),
        .CE(\CADDR[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CADDR[2]_i_1_n_0 ),
        .Q(CADDR_reg_n_0_[2]));
  FDCE #(
    .INIT(1'b0)) 
    \CADDR_reg[30] 
       (.C(ACLK),
        .CE(\CADDR[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CADDR[30]_i_1_n_0 ),
        .Q(CADDR_reg_n_0_[30]));
  FDCE #(
    .INIT(1'b0)) 
    \CADDR_reg[31] 
       (.C(ACLK),
        .CE(\CADDR[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CADDR[31]_i_2_n_0 ),
        .Q(CADDR_reg_n_0_[31]));
  FDCE #(
    .INIT(1'b0)) 
    \CADDR_reg[3] 
       (.C(ACLK),
        .CE(\CADDR[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CADDR[3]_i_1_n_0 ),
        .Q(CADDR_reg_n_0_[3]));
  FDCE #(
    .INIT(1'b0)) 
    \CADDR_reg[4] 
       (.C(ACLK),
        .CE(\CADDR[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CADDR[4]_i_1_n_0 ),
        .Q(CADDR_reg_n_0_[4]));
  FDCE #(
    .INIT(1'b0)) 
    \CADDR_reg[5] 
       (.C(ACLK),
        .CE(\CADDR[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CADDR[5]_i_1_n_0 ),
        .Q(CADDR_reg_n_0_[5]));
  FDCE #(
    .INIT(1'b0)) 
    \CADDR_reg[6] 
       (.C(ACLK),
        .CE(\CADDR[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CADDR[6]_i_1_n_0 ),
        .Q(CADDR_reg_n_0_[6]));
  FDCE #(
    .INIT(1'b0)) 
    \CADDR_reg[7] 
       (.C(ACLK),
        .CE(\CADDR[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CADDR[7]_i_1_n_0 ),
        .Q(CADDR_reg_n_0_[7]));
  FDCE #(
    .INIT(1'b0)) 
    \CADDR_reg[8] 
       (.C(ACLK),
        .CE(\CADDR[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CADDR[8]_i_1_n_0 ),
        .Q(CADDR_reg_n_0_[8]));
  FDCE #(
    .INIT(1'b0)) 
    \CADDR_reg[9] 
       (.C(ACLK),
        .CE(\CADDR[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CADDR[9]_i_1_n_0 ),
        .Q(CADDR_reg_n_0_[9]));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \CLENG[0]_i_1 
       (.I0(\CLENG[7]_i_3_n_0 ),
        .I1(CLENG_reg_reg_n_0_[0]),
        .I2(state_cmd[0]),
        .I3(CMD[0]),
        .O(\CLENG[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \CLENG[1]_i_1 
       (.I0(\CLENG[7]_i_3_n_0 ),
        .I1(CLENG_reg_reg_n_0_[1]),
        .I2(state_cmd[0]),
        .I3(CMD[1]),
        .O(\CLENG[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \CLENG[2]_i_1 
       (.I0(\CLENG[7]_i_3_n_0 ),
        .I1(CLENG_reg_reg_n_0_[2]),
        .I2(state_cmd[0]),
        .I3(CMD[2]),
        .O(\CLENG[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \CLENG[3]_i_1 
       (.I0(\CLENG[7]_i_3_n_0 ),
        .I1(CLENG_reg_reg_n_0_[3]),
        .I2(state_cmd[0]),
        .I3(CMD[3]),
        .O(\CLENG[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \CLENG[4]_i_1 
       (.I0(\CLENG[7]_i_3_n_0 ),
        .I1(CLENG_reg_reg_n_0_[4]),
        .I2(state_cmd[0]),
        .I3(CMD[4]),
        .O(\CLENG[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \CLENG[5]_i_1 
       (.I0(\CLENG[7]_i_3_n_0 ),
        .I1(CLENG_reg_reg_n_0_[5]),
        .I2(state_cmd[0]),
        .I3(CMD[5]),
        .O(\CLENG[5]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \CLENG[6]_i_1 
       (.I0(\CLENG[7]_i_3_n_0 ),
        .I1(CLENG_reg_reg_n_0_[6]),
        .I2(state_cmd[0]),
        .I3(CMD[6]),
        .O(\CLENG[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000FF00000800)) 
    \CLENG[7]_i_1 
       (.I0(cmd_rd_valid),
        .I1(cmd_rd_ready),
        .I2(CMD[31]),
        .I3(state_cmd[0]),
        .I4(state_cmd[1]),
        .I5(state_cmd[2]),
        .O(\CLENG[7]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \CLENG[7]_i_2 
       (.I0(\CLENG[7]_i_3_n_0 ),
        .I1(CLENG_reg_reg_n_0_[7]),
        .I2(state_cmd[0]),
        .I3(CMD[7]),
        .O(\CLENG[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFFFFFFFE0000)) 
    \CLENG[7]_i_3 
       (.I0(CMD[11]),
        .I1(CMD[10]),
        .I2(CMD[9]),
        .I3(CMD[8]),
        .I4(state_cmd[0]),
        .I5(\CLENG_reg[11]_i_5_n_0 ),
        .O(\CLENG[7]_i_3_n_0 ));
  CARRY4 CLENG_reg0_carry
       (.CI(1'b0),
        .CO({CLENG_reg0_carry_n_0,CLENG_reg0_carry_n_1,CLENG_reg0_carry_n_2,CLENG_reg0_carry_n_3}),
        .CYINIT(1'b0),
        .DI({CLENG_reg_reg_n_0_[10:8],1'b0}),
        .O({CLENG_reg0_carry_n_4,CLENG_reg0_carry_n_5,CLENG_reg0_carry_n_6,CLENG_reg0_carry_n_7}),
        .S({CLENG_reg0_carry_i_1_n_0,CLENG_reg0_carry_i_2_n_0,CLENG_reg0_carry_i_3_n_0,CLENG_reg_reg_n_0_[7]}));
  CARRY4 CLENG_reg0_carry__0
       (.CI(CLENG_reg0_carry_n_0),
        .CO(NLW_CLENG_reg0_carry__0_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_CLENG_reg0_carry__0_O_UNCONNECTED[3:1],CLENG_reg0_carry__0_n_7}),
        .S({1'b0,1'b0,1'b0,CLENG_reg0_carry__0_i_1_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    CLENG_reg0_carry__0_i_1
       (.I0(CLENG_reg_reg_n_0_[11]),
        .O(CLENG_reg0_carry__0_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    CLENG_reg0_carry_i_1
       (.I0(CLENG_reg_reg_n_0_[10]),
        .O(CLENG_reg0_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    CLENG_reg0_carry_i_2
       (.I0(CLENG_reg_reg_n_0_[9]),
        .O(CLENG_reg0_carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    CLENG_reg0_carry_i_3
       (.I0(CLENG_reg_reg_n_0_[8]),
        .O(CLENG_reg0_carry_i_3_n_0));
  FDCE #(
    .INIT(1'b0)) 
    \CLENG_reg[0] 
       (.C(ACLK),
        .CE(\CLENG[7]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CLENG[0]_i_1_n_0 ),
        .Q(CLENG[0]));
  LUT3 #(
    .INIT(8'hB8)) 
    \CLENG_reg[0]_i_1 
       (.I0(CLENG_reg_reg_n_0_[0]),
        .I1(state_cmd[1]),
        .I2(CMD[0]),
        .O(\CLENG_reg[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \CLENG_reg[10]_i_1 
       (.I0(CLENG_reg0_carry_n_4),
        .I1(state_cmd[1]),
        .I2(CMD[10]),
        .O(\CLENG_reg[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFAAEAAAEAAAEAAA)) 
    \CLENG_reg[11]_i_1 
       (.I0(\CLENG_reg[11]_i_3_n_0 ),
        .I1(write_done),
        .I2(\CLENG_reg[11]_i_4_n_0 ),
        .I3(\CLENG_reg[11]_i_5_n_0 ),
        .I4(\CLENG_reg[11]_i_6_n_0 ),
        .I5(read_done_reg_n_0),
        .O(\CLENG_reg[11]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \CLENG_reg[11]_i_2 
       (.I0(CLENG_reg0_carry__0_n_7),
        .I1(state_cmd[1]),
        .I2(CMD[11]),
        .O(\CLENG_reg[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0010000000000000)) 
    \CLENG_reg[11]_i_3 
       (.I0(state_cmd[2]),
        .I1(state_cmd[1]),
        .I2(state_cmd[0]),
        .I3(CMD[31]),
        .I4(cmd_rd_ready),
        .I5(cmd_rd_valid),
        .O(\CLENG_reg[11]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h04)) 
    \CLENG_reg[11]_i_4 
       (.I0(state_cmd[2]),
        .I1(state_cmd[1]),
        .I2(state_cmd[0]),
        .O(\CLENG_reg[11]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \CLENG_reg[11]_i_5 
       (.I0(CLENG_reg_reg_n_0_[11]),
        .I1(CLENG_reg_reg_n_0_[10]),
        .I2(CLENG_reg_reg_n_0_[9]),
        .I3(CLENG_reg_reg_n_0_[8]),
        .O(\CLENG_reg[11]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h40)) 
    \CLENG_reg[11]_i_6 
       (.I0(state_cmd[2]),
        .I1(state_cmd[1]),
        .I2(state_cmd[0]),
        .O(\CLENG_reg[11]_i_6_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \CLENG_reg[1] 
       (.C(ACLK),
        .CE(\CLENG[7]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CLENG[1]_i_1_n_0 ),
        .Q(CLENG[1]));
  LUT3 #(
    .INIT(8'hB8)) 
    \CLENG_reg[1]_i_1 
       (.I0(CLENG_reg_reg_n_0_[1]),
        .I1(state_cmd[1]),
        .I2(CMD[1]),
        .O(\CLENG_reg[1]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \CLENG_reg[2] 
       (.C(ACLK),
        .CE(\CLENG[7]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CLENG[2]_i_1_n_0 ),
        .Q(CLENG[2]));
  LUT3 #(
    .INIT(8'hB8)) 
    \CLENG_reg[2]_i_1 
       (.I0(CLENG_reg_reg_n_0_[2]),
        .I1(state_cmd[1]),
        .I2(CMD[2]),
        .O(\CLENG_reg[2]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \CLENG_reg[3] 
       (.C(ACLK),
        .CE(\CLENG[7]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CLENG[3]_i_1_n_0 ),
        .Q(CLENG[3]));
  LUT3 #(
    .INIT(8'hB8)) 
    \CLENG_reg[3]_i_1 
       (.I0(CLENG_reg_reg_n_0_[3]),
        .I1(state_cmd[1]),
        .I2(CMD[3]),
        .O(\CLENG_reg[3]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \CLENG_reg[4] 
       (.C(ACLK),
        .CE(\CLENG[7]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CLENG[4]_i_1_n_0 ),
        .Q(CLENG[4]));
  LUT3 #(
    .INIT(8'hB8)) 
    \CLENG_reg[4]_i_1 
       (.I0(CLENG_reg_reg_n_0_[4]),
        .I1(state_cmd[1]),
        .I2(CMD[4]),
        .O(\CLENG_reg[4]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \CLENG_reg[5] 
       (.C(ACLK),
        .CE(\CLENG[7]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CLENG[5]_i_1_n_0 ),
        .Q(CLENG[5]));
  LUT3 #(
    .INIT(8'hB8)) 
    \CLENG_reg[5]_i_1 
       (.I0(CLENG_reg_reg_n_0_[5]),
        .I1(state_cmd[1]),
        .I2(CMD[5]),
        .O(\CLENG_reg[5]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \CLENG_reg[6] 
       (.C(ACLK),
        .CE(\CLENG[7]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CLENG[6]_i_1_n_0 ),
        .Q(CLENG[6]));
  LUT3 #(
    .INIT(8'hB8)) 
    \CLENG_reg[6]_i_1 
       (.I0(CLENG_reg_reg_n_0_[6]),
        .I1(state_cmd[1]),
        .I2(CMD[6]),
        .O(\CLENG_reg[6]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \CLENG_reg[7] 
       (.C(ACLK),
        .CE(\CLENG[7]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CLENG[7]_i_2_n_0 ),
        .Q(CLENG[7]));
  LUT3 #(
    .INIT(8'hB8)) 
    \CLENG_reg[7]_i_1 
       (.I0(CLENG_reg0_carry_n_7),
        .I1(state_cmd[1]),
        .I2(CMD[7]),
        .O(\CLENG_reg[7]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \CLENG_reg[8]_i_1 
       (.I0(CLENG_reg0_carry_n_6),
        .I1(state_cmd[1]),
        .I2(CMD[8]),
        .O(\CLENG_reg[8]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \CLENG_reg[9]_i_1 
       (.I0(CLENG_reg0_carry_n_5),
        .I1(state_cmd[1]),
        .I2(CMD[9]),
        .O(\CLENG_reg[9]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \CLENG_reg_reg[0] 
       (.C(ACLK),
        .CE(\CLENG_reg[11]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CLENG_reg[0]_i_1_n_0 ),
        .Q(CLENG_reg_reg_n_0_[0]));
  FDCE #(
    .INIT(1'b0)) 
    \CLENG_reg_reg[10] 
       (.C(ACLK),
        .CE(\CLENG_reg[11]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CLENG_reg[10]_i_1_n_0 ),
        .Q(CLENG_reg_reg_n_0_[10]));
  FDCE #(
    .INIT(1'b0)) 
    \CLENG_reg_reg[11] 
       (.C(ACLK),
        .CE(\CLENG_reg[11]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CLENG_reg[11]_i_2_n_0 ),
        .Q(CLENG_reg_reg_n_0_[11]));
  FDCE #(
    .INIT(1'b0)) 
    \CLENG_reg_reg[1] 
       (.C(ACLK),
        .CE(\CLENG_reg[11]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CLENG_reg[1]_i_1_n_0 ),
        .Q(CLENG_reg_reg_n_0_[1]));
  FDCE #(
    .INIT(1'b0)) 
    \CLENG_reg_reg[2] 
       (.C(ACLK),
        .CE(\CLENG_reg[11]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CLENG_reg[2]_i_1_n_0 ),
        .Q(CLENG_reg_reg_n_0_[2]));
  FDCE #(
    .INIT(1'b0)) 
    \CLENG_reg_reg[3] 
       (.C(ACLK),
        .CE(\CLENG_reg[11]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CLENG_reg[3]_i_1_n_0 ),
        .Q(CLENG_reg_reg_n_0_[3]));
  FDCE #(
    .INIT(1'b0)) 
    \CLENG_reg_reg[4] 
       (.C(ACLK),
        .CE(\CLENG_reg[11]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CLENG_reg[4]_i_1_n_0 ),
        .Q(CLENG_reg_reg_n_0_[4]));
  FDCE #(
    .INIT(1'b0)) 
    \CLENG_reg_reg[5] 
       (.C(ACLK),
        .CE(\CLENG_reg[11]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CLENG_reg[5]_i_1_n_0 ),
        .Q(CLENG_reg_reg_n_0_[5]));
  FDCE #(
    .INIT(1'b0)) 
    \CLENG_reg_reg[6] 
       (.C(ACLK),
        .CE(\CLENG_reg[11]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CLENG_reg[6]_i_1_n_0 ),
        .Q(CLENG_reg_reg_n_0_[6]));
  FDCE #(
    .INIT(1'b0)) 
    \CLENG_reg_reg[7] 
       (.C(ACLK),
        .CE(\CLENG_reg[11]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CLENG_reg[7]_i_1_n_0 ),
        .Q(CLENG_reg_reg_n_0_[7]));
  FDCE #(
    .INIT(1'b0)) 
    \CLENG_reg_reg[8] 
       (.C(ACLK),
        .CE(\CLENG_reg[11]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CLENG_reg[8]_i_1_n_0 ),
        .Q(CLENG_reg_reg_n_0_[8]));
  FDCE #(
    .INIT(1'b0)) 
    \CLENG_reg_reg[9] 
       (.C(ACLK),
        .CE(\CLENG_reg[11]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\CLENG_reg[9]_i_1_n_0 ),
        .Q(CLENG_reg_reg_n_0_[9]));
  LUT6 #(
    .INIT(64'hFFFF22A822A822A8)) 
    \CMD[0]_i_1 
       (.I0(CMD[0]),
        .I1(state_cmd[2]),
        .I2(state_cmd[0]),
        .I3(state_cmd[1]),
        .I4(cmd_rd_data[0]),
        .I5(\CMD[31]_i_2_n_0 ),
        .O(\CMD[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF22A822A822A8)) 
    \CMD[10]_i_1 
       (.I0(CMD[10]),
        .I1(state_cmd[2]),
        .I2(state_cmd[0]),
        .I3(state_cmd[1]),
        .I4(cmd_rd_data[10]),
        .I5(\CMD[31]_i_2_n_0 ),
        .O(\CMD[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF22A822A822A8)) 
    \CMD[11]_i_1 
       (.I0(CMD[11]),
        .I1(state_cmd[2]),
        .I2(state_cmd[0]),
        .I3(state_cmd[1]),
        .I4(cmd_rd_data[11]),
        .I5(\CMD[31]_i_2_n_0 ),
        .O(\CMD[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF22A822A822A8)) 
    \CMD[12]_i_1 
       (.I0(CMD[12]),
        .I1(state_cmd[2]),
        .I2(state_cmd[0]),
        .I3(state_cmd[1]),
        .I4(cmd_rd_data[12]),
        .I5(\CMD[31]_i_2_n_0 ),
        .O(\CMD[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF22A822A822A8)) 
    \CMD[13]_i_1 
       (.I0(CMD[13]),
        .I1(state_cmd[2]),
        .I2(state_cmd[0]),
        .I3(state_cmd[1]),
        .I4(cmd_rd_data[13]),
        .I5(\CMD[31]_i_2_n_0 ),
        .O(\CMD[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF22A822A822A8)) 
    \CMD[14]_i_1 
       (.I0(CMD[14]),
        .I1(state_cmd[2]),
        .I2(state_cmd[0]),
        .I3(state_cmd[1]),
        .I4(cmd_rd_data[14]),
        .I5(\CMD[31]_i_2_n_0 ),
        .O(\CMD[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF22A822A822A8)) 
    \CMD[15]_i_1 
       (.I0(CMD[15]),
        .I1(state_cmd[2]),
        .I2(state_cmd[0]),
        .I3(state_cmd[1]),
        .I4(cmd_rd_data[15]),
        .I5(\CMD[31]_i_2_n_0 ),
        .O(\CMD[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFF8F8F8)) 
    \CMD[16]_i_1 
       (.I0(\CMD[31]_i_2_n_0 ),
        .I1(cmd_rd_data[16]),
        .I2(\CMD[16]_i_2_n_0 ),
        .I3(CMD[16]),
        .I4(\CMD[17]_i_3_n_0 ),
        .O(\CMD[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0001000000000000)) 
    \CMD[16]_i_2 
       (.I0(CLENG_reg_reg_n_0_[11]),
        .I1(CLENG_reg_reg_n_0_[10]),
        .I2(CLENG_reg_reg_n_0_[9]),
        .I3(CLENG_reg_reg_n_0_[8]),
        .I4(write_done),
        .I5(\CLENG_reg[11]_i_4_n_0 ),
        .O(\CMD[16]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFF8F8F8)) 
    \CMD[17]_i_1 
       (.I0(\CMD[31]_i_2_n_0 ),
        .I1(cmd_rd_data[17]),
        .I2(\CMD[17]_i_2_n_0 ),
        .I3(CMD[17]),
        .I4(\CMD[17]_i_3_n_0 ),
        .O(\CMD[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0001000000000000)) 
    \CMD[17]_i_2 
       (.I0(CLENG_reg_reg_n_0_[11]),
        .I1(CLENG_reg_reg_n_0_[10]),
        .I2(CLENG_reg_reg_n_0_[9]),
        .I3(CLENG_reg_reg_n_0_[8]),
        .I4(read_done_reg_n_0),
        .I5(\CLENG_reg[11]_i_6_n_0 ),
        .O(\CMD[17]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h5E)) 
    \CMD[17]_i_3 
       (.I0(state_cmd[2]),
        .I1(state_cmd[0]),
        .I2(state_cmd[1]),
        .O(\CMD[17]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF22A822A822A8)) 
    \CMD[18]_i_1 
       (.I0(CMD[18]),
        .I1(state_cmd[2]),
        .I2(state_cmd[0]),
        .I3(state_cmd[1]),
        .I4(cmd_rd_data[18]),
        .I5(\CMD[31]_i_2_n_0 ),
        .O(\CMD[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF22A822A822A8)) 
    \CMD[19]_i_1 
       (.I0(CMD[19]),
        .I1(state_cmd[2]),
        .I2(state_cmd[0]),
        .I3(state_cmd[1]),
        .I4(cmd_rd_data[19]),
        .I5(\CMD[31]_i_2_n_0 ),
        .O(\CMD[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF22A822A822A8)) 
    \CMD[1]_i_1 
       (.I0(CMD[1]),
        .I1(state_cmd[2]),
        .I2(state_cmd[0]),
        .I3(state_cmd[1]),
        .I4(cmd_rd_data[1]),
        .I5(\CMD[31]_i_2_n_0 ),
        .O(\CMD[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF22A822A822A8)) 
    \CMD[20]_i_1 
       (.I0(CMD[20]),
        .I1(state_cmd[2]),
        .I2(state_cmd[0]),
        .I3(state_cmd[1]),
        .I4(cmd_rd_data[20]),
        .I5(\CMD[31]_i_2_n_0 ),
        .O(\CMD[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF22A822A822A8)) 
    \CMD[21]_i_1 
       (.I0(CMD[21]),
        .I1(state_cmd[2]),
        .I2(state_cmd[0]),
        .I3(state_cmd[1]),
        .I4(cmd_rd_data[21]),
        .I5(\CMD[31]_i_2_n_0 ),
        .O(\CMD[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF22A822A822A8)) 
    \CMD[22]_i_1 
       (.I0(CMD[22]),
        .I1(state_cmd[2]),
        .I2(state_cmd[0]),
        .I3(state_cmd[1]),
        .I4(cmd_rd_data[22]),
        .I5(\CMD[31]_i_2_n_0 ),
        .O(\CMD[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF22A822A822A8)) 
    \CMD[23]_i_1 
       (.I0(CMD[23]),
        .I1(state_cmd[2]),
        .I2(state_cmd[0]),
        .I3(state_cmd[1]),
        .I4(cmd_rd_data[23]),
        .I5(\CMD[31]_i_2_n_0 ),
        .O(\CMD[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF22A822A822A8)) 
    \CMD[24]_i_1 
       (.I0(CMD[24]),
        .I1(state_cmd[2]),
        .I2(state_cmd[0]),
        .I3(state_cmd[1]),
        .I4(cmd_rd_data[24]),
        .I5(\CMD[31]_i_2_n_0 ),
        .O(\CMD[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF22A822A822A8)) 
    \CMD[25]_i_1 
       (.I0(CMD[25]),
        .I1(state_cmd[2]),
        .I2(state_cmd[0]),
        .I3(state_cmd[1]),
        .I4(cmd_rd_data[25]),
        .I5(\CMD[31]_i_2_n_0 ),
        .O(\CMD[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF22A822A822A8)) 
    \CMD[26]_i_1 
       (.I0(CMD[26]),
        .I1(state_cmd[2]),
        .I2(state_cmd[0]),
        .I3(state_cmd[1]),
        .I4(cmd_rd_data[26]),
        .I5(\CMD[31]_i_2_n_0 ),
        .O(\CMD[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF22A822A822A8)) 
    \CMD[27]_i_1 
       (.I0(CMD[27]),
        .I1(state_cmd[2]),
        .I2(state_cmd[0]),
        .I3(state_cmd[1]),
        .I4(cmd_rd_data[27]),
        .I5(\CMD[31]_i_2_n_0 ),
        .O(\CMD[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF22A822A822A8)) 
    \CMD[28]_i_1 
       (.I0(CMD[28]),
        .I1(state_cmd[2]),
        .I2(state_cmd[0]),
        .I3(state_cmd[1]),
        .I4(cmd_rd_data[28]),
        .I5(\CMD[31]_i_2_n_0 ),
        .O(\CMD[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF22A822A822A8)) 
    \CMD[29]_i_1 
       (.I0(CMD[29]),
        .I1(state_cmd[2]),
        .I2(state_cmd[0]),
        .I3(state_cmd[1]),
        .I4(cmd_rd_data[29]),
        .I5(\CMD[31]_i_2_n_0 ),
        .O(\CMD[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF22A822A822A8)) 
    \CMD[2]_i_1 
       (.I0(CMD[2]),
        .I1(state_cmd[2]),
        .I2(state_cmd[0]),
        .I3(state_cmd[1]),
        .I4(cmd_rd_data[2]),
        .I5(\CMD[31]_i_2_n_0 ),
        .O(\CMD[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF22A822A822A8)) 
    \CMD[30]_i_1 
       (.I0(CMD[30]),
        .I1(state_cmd[2]),
        .I2(state_cmd[0]),
        .I3(state_cmd[1]),
        .I4(cmd_rd_data[30]),
        .I5(\CMD[31]_i_2_n_0 ),
        .O(\CMD[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF22A822A822A8)) 
    \CMD[31]_i_1 
       (.I0(CMD[31]),
        .I1(state_cmd[2]),
        .I2(state_cmd[0]),
        .I3(state_cmd[1]),
        .I4(cmd_rd_data[31]),
        .I5(\CMD[31]_i_2_n_0 ),
        .O(\CMD[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0004)) 
    \CMD[31]_i_2 
       (.I0(state_cmd[2]),
        .I1(CMD1__2),
        .I2(state_cmd[1]),
        .I3(state_cmd[0]),
        .O(\CMD[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF22A822A822A8)) 
    \CMD[3]_i_1 
       (.I0(CMD[3]),
        .I1(state_cmd[2]),
        .I2(state_cmd[0]),
        .I3(state_cmd[1]),
        .I4(cmd_rd_data[3]),
        .I5(\CMD[31]_i_2_n_0 ),
        .O(\CMD[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF22A822A822A8)) 
    \CMD[4]_i_1 
       (.I0(CMD[4]),
        .I1(state_cmd[2]),
        .I2(state_cmd[0]),
        .I3(state_cmd[1]),
        .I4(cmd_rd_data[4]),
        .I5(\CMD[31]_i_2_n_0 ),
        .O(\CMD[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF22A822A822A8)) 
    \CMD[5]_i_1 
       (.I0(CMD[5]),
        .I1(state_cmd[2]),
        .I2(state_cmd[0]),
        .I3(state_cmd[1]),
        .I4(cmd_rd_data[5]),
        .I5(\CMD[31]_i_2_n_0 ),
        .O(\CMD[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF22A822A822A8)) 
    \CMD[6]_i_1 
       (.I0(CMD[6]),
        .I1(state_cmd[2]),
        .I2(state_cmd[0]),
        .I3(state_cmd[1]),
        .I4(cmd_rd_data[6]),
        .I5(\CMD[31]_i_2_n_0 ),
        .O(\CMD[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF22A822A822A8)) 
    \CMD[7]_i_1 
       (.I0(CMD[7]),
        .I1(state_cmd[2]),
        .I2(state_cmd[0]),
        .I3(state_cmd[1]),
        .I4(cmd_rd_data[7]),
        .I5(\CMD[31]_i_2_n_0 ),
        .O(\CMD[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF22A822A822A8)) 
    \CMD[8]_i_1 
       (.I0(CMD[8]),
        .I1(state_cmd[2]),
        .I2(state_cmd[0]),
        .I3(state_cmd[1]),
        .I4(cmd_rd_data[8]),
        .I5(\CMD[31]_i_2_n_0 ),
        .O(\CMD[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF22A822A822A8)) 
    \CMD[9]_i_1 
       (.I0(CMD[9]),
        .I1(state_cmd[2]),
        .I2(state_cmd[0]),
        .I3(state_cmd[1]),
        .I4(cmd_rd_data[9]),
        .I5(\CMD[31]_i_2_n_0 ),
        .O(\CMD[9]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \CMD_reg[0] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(\CMD[0]_i_1_n_0 ),
        .Q(CMD[0]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \CMD_reg[10] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(\CMD[10]_i_1_n_0 ),
        .Q(CMD[10]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \CMD_reg[11] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(\CMD[11]_i_1_n_0 ),
        .Q(CMD[11]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \CMD_reg[12] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(\CMD[12]_i_1_n_0 ),
        .Q(CMD[12]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \CMD_reg[13] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(\CMD[13]_i_1_n_0 ),
        .Q(CMD[13]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \CMD_reg[14] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(\CMD[14]_i_1_n_0 ),
        .Q(CMD[14]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \CMD_reg[15] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(\CMD[15]_i_1_n_0 ),
        .Q(CMD[15]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \CMD_reg[16] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(\CMD[16]_i_1_n_0 ),
        .Q(CMD[16]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \CMD_reg[17] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(\CMD[17]_i_1_n_0 ),
        .Q(CMD[17]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \CMD_reg[18] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(\CMD[18]_i_1_n_0 ),
        .Q(CMD[18]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \CMD_reg[19] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(\CMD[19]_i_1_n_0 ),
        .Q(CMD[19]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \CMD_reg[1] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(\CMD[1]_i_1_n_0 ),
        .Q(CMD[1]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \CMD_reg[20] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(\CMD[20]_i_1_n_0 ),
        .Q(CMD[20]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \CMD_reg[21] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(\CMD[21]_i_1_n_0 ),
        .Q(CMD[21]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \CMD_reg[22] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(\CMD[22]_i_1_n_0 ),
        .Q(CMD[22]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \CMD_reg[23] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(\CMD[23]_i_1_n_0 ),
        .Q(CMD[23]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \CMD_reg[24] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(\CMD[24]_i_1_n_0 ),
        .Q(CMD[24]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \CMD_reg[25] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(\CMD[25]_i_1_n_0 ),
        .Q(CMD[25]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \CMD_reg[26] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(\CMD[26]_i_1_n_0 ),
        .Q(CMD[26]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \CMD_reg[27] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(\CMD[27]_i_1_n_0 ),
        .Q(CMD[27]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \CMD_reg[28] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(\CMD[28]_i_1_n_0 ),
        .Q(CMD[28]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \CMD_reg[29] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(\CMD[29]_i_1_n_0 ),
        .Q(CMD[29]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \CMD_reg[2] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(\CMD[2]_i_1_n_0 ),
        .Q(CMD[2]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \CMD_reg[30] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(\CMD[30]_i_1_n_0 ),
        .Q(CMD[30]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \CMD_reg[31] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(\CMD[31]_i_1_n_0 ),
        .Q(CMD[31]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \CMD_reg[3] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(\CMD[3]_i_1_n_0 ),
        .Q(CMD[3]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \CMD_reg[4] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(\CMD[4]_i_1_n_0 ),
        .Q(CMD[4]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \CMD_reg[5] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(\CMD[5]_i_1_n_0 ),
        .Q(CMD[5]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \CMD_reg[6] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(\CMD[6]_i_1_n_0 ),
        .Q(CMD[6]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \CMD_reg[7] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(\CMD[7]_i_1_n_0 ),
        .Q(CMD[7]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \CMD_reg[8] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(\CMD[8]_i_1_n_0 ),
        .Q(CMD[8]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \CMD_reg[9] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(\CMD[9]_i_1_n_0 ),
        .Q(CMD[9]));
  LUT5 #(
    .INIT(32'h00080000)) 
    \GPOUT[15]_i_1 
       (.I0(CMD[31]),
        .I1(CMD[30]),
        .I2(state_cmd[2]),
        .I3(state_cmd[1]),
        .I4(state_cmd[0]),
        .O(\GPOUT[15]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \GPOUT_reg[0] 
       (.C(ACLK),
        .CE(\GPOUT[15]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(CMD[0]),
        .Q(GPOUT[0]));
  FDCE #(
    .INIT(1'b0)) 
    \GPOUT_reg[10] 
       (.C(ACLK),
        .CE(\GPOUT[15]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(CMD[10]),
        .Q(GPOUT[10]));
  FDCE #(
    .INIT(1'b0)) 
    \GPOUT_reg[11] 
       (.C(ACLK),
        .CE(\GPOUT[15]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(CMD[11]),
        .Q(GPOUT[11]));
  FDCE #(
    .INIT(1'b0)) 
    \GPOUT_reg[12] 
       (.C(ACLK),
        .CE(\GPOUT[15]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(CMD[12]),
        .Q(GPOUT[12]));
  FDCE #(
    .INIT(1'b0)) 
    \GPOUT_reg[13] 
       (.C(ACLK),
        .CE(\GPOUT[15]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(CMD[13]),
        .Q(GPOUT[13]));
  FDCE #(
    .INIT(1'b0)) 
    \GPOUT_reg[14] 
       (.C(ACLK),
        .CE(\GPOUT[15]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(CMD[14]),
        .Q(GPOUT[14]));
  FDCE #(
    .INIT(1'b0)) 
    \GPOUT_reg[15] 
       (.C(ACLK),
        .CE(\GPOUT[15]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(CMD[15]),
        .Q(GPOUT[15]));
  FDCE #(
    .INIT(1'b0)) 
    \GPOUT_reg[1] 
       (.C(ACLK),
        .CE(\GPOUT[15]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(CMD[1]),
        .Q(GPOUT[1]));
  FDCE #(
    .INIT(1'b0)) 
    \GPOUT_reg[2] 
       (.C(ACLK),
        .CE(\GPOUT[15]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(CMD[2]),
        .Q(GPOUT[2]));
  FDCE #(
    .INIT(1'b0)) 
    \GPOUT_reg[3] 
       (.C(ACLK),
        .CE(\GPOUT[15]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(CMD[3]),
        .Q(GPOUT[3]));
  FDCE #(
    .INIT(1'b0)) 
    \GPOUT_reg[4] 
       (.C(ACLK),
        .CE(\GPOUT[15]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(CMD[4]),
        .Q(GPOUT[4]));
  FDCE #(
    .INIT(1'b0)) 
    \GPOUT_reg[5] 
       (.C(ACLK),
        .CE(\GPOUT[15]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(CMD[5]),
        .Q(GPOUT[5]));
  FDCE #(
    .INIT(1'b0)) 
    \GPOUT_reg[6] 
       (.C(ACLK),
        .CE(\GPOUT[15]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(CMD[6]),
        .Q(GPOUT[6]));
  FDCE #(
    .INIT(1'b0)) 
    \GPOUT_reg[7] 
       (.C(ACLK),
        .CE(\GPOUT[15]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(CMD[7]),
        .Q(GPOUT[7]));
  FDCE #(
    .INIT(1'b0)) 
    \GPOUT_reg[8] 
       (.C(ACLK),
        .CE(\GPOUT[15]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(CMD[8]),
        .Q(GPOUT[8]));
  FDCE #(
    .INIT(1'b0)) 
    \GPOUT_reg[9] 
       (.C(ACLK),
        .CE(\GPOUT[15]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(CMD[9]),
        .Q(GPOUT[9]));
  LUT5 #(
    .INIT(32'h888888F8)) 
    \addrR[0]_i_1 
       (.I0(\addrR_reg[3]_i_2_n_7 ),
        .I1(\addrR[31]_i_6_n_0 ),
        .I2(CADDR_reg_n_0_[0]),
        .I3(state_read[2]),
        .I4(state_read[1]),
        .O(\addrR[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \addrR[10]_i_1 
       (.I0(\addrR[31]_i_3_n_0 ),
        .I1(CADDR_reg_n_0_[10]),
        .I2(\addrR[31]_i_4_n_0 ),
        .I3(get_next_addr_rd0_carry__0_n_4),
        .I4(\addrR_reg[11]_i_2_n_5 ),
        .I5(\addrR[31]_i_6_n_0 ),
        .O(\addrR[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \addrR[11]_i_1 
       (.I0(\addrR[31]_i_3_n_0 ),
        .I1(CADDR_reg_n_0_[11]),
        .I2(\addrR[31]_i_4_n_0 ),
        .I3(get_next_addr_rd0_carry__1_n_7),
        .I4(\addrR_reg[11]_i_2_n_4 ),
        .I5(\addrR[31]_i_6_n_0 ),
        .O(\addrR[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \addrR[12]_i_1 
       (.I0(\addrR[31]_i_3_n_0 ),
        .I1(CADDR_reg_n_0_[12]),
        .I2(\addrR[31]_i_4_n_0 ),
        .I3(get_next_addr_rd0_carry__1_n_6),
        .I4(\addrR_reg[15]_i_2_n_7 ),
        .I5(\addrR[31]_i_6_n_0 ),
        .O(\addrR[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \addrR[13]_i_1 
       (.I0(\addrR[31]_i_3_n_0 ),
        .I1(CADDR_reg_n_0_[13]),
        .I2(\addrR[31]_i_4_n_0 ),
        .I3(get_next_addr_rd0_carry__1_n_5),
        .I4(\addrR_reg[15]_i_2_n_6 ),
        .I5(\addrR[31]_i_6_n_0 ),
        .O(\addrR[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \addrR[14]_i_1 
       (.I0(\addrR[31]_i_3_n_0 ),
        .I1(CADDR_reg_n_0_[14]),
        .I2(\addrR[31]_i_4_n_0 ),
        .I3(get_next_addr_rd0_carry__1_n_4),
        .I4(\addrR_reg[15]_i_2_n_5 ),
        .I5(\addrR[31]_i_6_n_0 ),
        .O(\addrR[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \addrR[15]_i_1 
       (.I0(\addrR[31]_i_3_n_0 ),
        .I1(CADDR_reg_n_0_[15]),
        .I2(\addrR[31]_i_4_n_0 ),
        .I3(get_next_addr_rd0_carry__2_n_7),
        .I4(\addrR_reg[15]_i_2_n_4 ),
        .I5(\addrR[31]_i_6_n_0 ),
        .O(\addrR[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \addrR[16]_i_1 
       (.I0(\addrR[31]_i_3_n_0 ),
        .I1(CADDR_reg_n_0_[16]),
        .I2(\addrR[31]_i_4_n_0 ),
        .I3(get_next_addr_rd0_carry__2_n_6),
        .I4(\addrR_reg[19]_i_2_n_7 ),
        .I5(\addrR[31]_i_6_n_0 ),
        .O(\addrR[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \addrR[17]_i_1 
       (.I0(\addrR[31]_i_3_n_0 ),
        .I1(CADDR_reg_n_0_[17]),
        .I2(\addrR[31]_i_4_n_0 ),
        .I3(get_next_addr_rd0_carry__2_n_5),
        .I4(\addrR_reg[19]_i_2_n_6 ),
        .I5(\addrR[31]_i_6_n_0 ),
        .O(\addrR[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \addrR[18]_i_1 
       (.I0(\addrR[31]_i_3_n_0 ),
        .I1(CADDR_reg_n_0_[18]),
        .I2(\addrR[31]_i_4_n_0 ),
        .I3(get_next_addr_rd0_carry__2_n_4),
        .I4(\addrR_reg[19]_i_2_n_5 ),
        .I5(\addrR[31]_i_6_n_0 ),
        .O(\addrR[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \addrR[19]_i_1 
       (.I0(\addrR[31]_i_3_n_0 ),
        .I1(CADDR_reg_n_0_[19]),
        .I2(\addrR[31]_i_4_n_0 ),
        .I3(get_next_addr_rd0_carry__3_n_7),
        .I4(\addrR_reg[19]_i_2_n_4 ),
        .I5(\addrR[31]_i_6_n_0 ),
        .O(\addrR[19]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h888888F8)) 
    \addrR[1]_i_1 
       (.I0(\addrR_reg[3]_i_2_n_6 ),
        .I1(\addrR[31]_i_6_n_0 ),
        .I2(CADDR_reg_n_0_[1]),
        .I3(state_read[2]),
        .I4(state_read[1]),
        .O(\addrR[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \addrR[20]_i_1 
       (.I0(\addrR[31]_i_3_n_0 ),
        .I1(CADDR_reg_n_0_[20]),
        .I2(\addrR[31]_i_4_n_0 ),
        .I3(get_next_addr_rd0_carry__3_n_6),
        .I4(\addrR_reg[23]_i_2_n_7 ),
        .I5(\addrR[31]_i_6_n_0 ),
        .O(\addrR[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \addrR[21]_i_1 
       (.I0(\addrR[31]_i_3_n_0 ),
        .I1(CADDR_reg_n_0_[21]),
        .I2(\addrR[31]_i_4_n_0 ),
        .I3(get_next_addr_rd0_carry__3_n_5),
        .I4(\addrR_reg[23]_i_2_n_6 ),
        .I5(\addrR[31]_i_6_n_0 ),
        .O(\addrR[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \addrR[22]_i_1 
       (.I0(\addrR[31]_i_3_n_0 ),
        .I1(CADDR_reg_n_0_[22]),
        .I2(\addrR[31]_i_4_n_0 ),
        .I3(get_next_addr_rd0_carry__3_n_4),
        .I4(\addrR_reg[23]_i_2_n_5 ),
        .I5(\addrR[31]_i_6_n_0 ),
        .O(\addrR[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \addrR[23]_i_1 
       (.I0(\addrR[31]_i_3_n_0 ),
        .I1(CADDR_reg_n_0_[23]),
        .I2(\addrR[31]_i_4_n_0 ),
        .I3(get_next_addr_rd0_carry__4_n_7),
        .I4(\addrR_reg[23]_i_2_n_4 ),
        .I5(\addrR[31]_i_6_n_0 ),
        .O(\addrR[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \addrR[24]_i_1 
       (.I0(\addrR[31]_i_3_n_0 ),
        .I1(CADDR_reg_n_0_[24]),
        .I2(\addrR[31]_i_4_n_0 ),
        .I3(get_next_addr_rd0_carry__4_n_6),
        .I4(\addrR_reg[27]_i_2_n_7 ),
        .I5(\addrR[31]_i_6_n_0 ),
        .O(\addrR[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \addrR[25]_i_1 
       (.I0(\addrR[31]_i_3_n_0 ),
        .I1(CADDR_reg_n_0_[25]),
        .I2(\addrR[31]_i_4_n_0 ),
        .I3(get_next_addr_rd0_carry__4_n_5),
        .I4(\addrR_reg[27]_i_2_n_6 ),
        .I5(\addrR[31]_i_6_n_0 ),
        .O(\addrR[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \addrR[26]_i_1 
       (.I0(\addrR[31]_i_3_n_0 ),
        .I1(CADDR_reg_n_0_[26]),
        .I2(\addrR[31]_i_4_n_0 ),
        .I3(get_next_addr_rd0_carry__4_n_4),
        .I4(\addrR_reg[27]_i_2_n_5 ),
        .I5(\addrR[31]_i_6_n_0 ),
        .O(\addrR[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \addrR[27]_i_1 
       (.I0(\addrR[31]_i_3_n_0 ),
        .I1(CADDR_reg_n_0_[27]),
        .I2(\addrR[31]_i_4_n_0 ),
        .I3(get_next_addr_rd0_carry__5_n_7),
        .I4(\addrR_reg[27]_i_2_n_4 ),
        .I5(\addrR[31]_i_6_n_0 ),
        .O(\addrR[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \addrR[28]_i_1 
       (.I0(\addrR[31]_i_3_n_0 ),
        .I1(CADDR_reg_n_0_[28]),
        .I2(\addrR[31]_i_4_n_0 ),
        .I3(get_next_addr_rd0_carry__5_n_6),
        .I4(\addrR_reg[31]_i_5_n_7 ),
        .I5(\addrR[31]_i_6_n_0 ),
        .O(\addrR[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \addrR[29]_i_1 
       (.I0(\addrR[31]_i_3_n_0 ),
        .I1(CADDR_reg_n_0_[29]),
        .I2(\addrR[31]_i_4_n_0 ),
        .I3(get_next_addr_rd0_carry__5_n_5),
        .I4(\addrR_reg[31]_i_5_n_6 ),
        .I5(\addrR[31]_i_6_n_0 ),
        .O(\addrR[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF88F888F888F8)) 
    \addrR[2]_i_1 
       (.I0(\addrR[31]_i_3_n_0 ),
        .I1(CADDR_reg_n_0_[2]),
        .I2(\addrR[31]_i_4_n_0 ),
        .I3(addrR_reg_n_0_[2]),
        .I4(\addrR_reg[3]_i_2_n_5 ),
        .I5(\addrR[31]_i_6_n_0 ),
        .O(\addrR[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \addrR[30]_i_1 
       (.I0(\addrR[31]_i_3_n_0 ),
        .I1(CADDR_reg_n_0_[30]),
        .I2(\addrR[31]_i_4_n_0 ),
        .I3(get_next_addr_rd0_carry__5_n_4),
        .I4(\addrR_reg[31]_i_5_n_5 ),
        .I5(\addrR[31]_i_6_n_0 ),
        .O(\addrR[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \addrR[31]_i_2 
       (.I0(\addrR[31]_i_3_n_0 ),
        .I1(CADDR_reg_n_0_[31]),
        .I2(\addrR[31]_i_4_n_0 ),
        .I3(get_next_addr_rd0_carry__6_n_7),
        .I4(\addrR_reg[31]_i_5_n_4 ),
        .I5(\addrR[31]_i_6_n_0 ),
        .O(\addrR[31]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \addrR[31]_i_3 
       (.I0(state_read[2]),
        .I1(state_read[1]),
        .O(\addrR[31]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h4440)) 
    \addrR[31]_i_4 
       (.I0(state_read[2]),
        .I1(state_read[1]),
        .I2(CMD[26]),
        .I3(CMD[27]),
        .O(\addrR[31]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0004)) 
    \addrR[31]_i_6 
       (.I0(state_read[2]),
        .I1(state_read[1]),
        .I2(CMD[26]),
        .I3(CMD[27]),
        .O(\addrR[31]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \addrR[3]_i_1 
       (.I0(\addrR[31]_i_3_n_0 ),
        .I1(CADDR_reg_n_0_[3]),
        .I2(\addrR[31]_i_4_n_0 ),
        .I3(get_next_addr_rd0_carry_n_7),
        .I4(\addrR_reg[3]_i_2_n_4 ),
        .I5(\addrR[31]_i_6_n_0 ),
        .O(\addrR[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h9AAA)) 
    \addrR[3]_i_3 
       (.I0(addrR_reg_n_0_[3]),
        .I1(CMD[27]),
        .I2(CMD[25]),
        .I3(CMD[26]),
        .O(\addrR[3]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hAA9A)) 
    \addrR[3]_i_4 
       (.I0(addrR_reg_n_0_[2]),
        .I1(CMD[27]),
        .I2(CMD[26]),
        .I3(CMD[25]),
        .O(\addrR[3]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hAA9A)) 
    \addrR[3]_i_5 
       (.I0(addrR_reg_n_0_[1]),
        .I1(CMD[26]),
        .I2(CMD[25]),
        .I3(CMD[27]),
        .O(\addrR[3]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hAAA9)) 
    \addrR[3]_i_6 
       (.I0(addrR_reg_n_0_[0]),
        .I1(CMD[25]),
        .I2(CMD[26]),
        .I3(CMD[27]),
        .O(\addrR[3]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \addrR[4]_i_1 
       (.I0(\addrR[31]_i_3_n_0 ),
        .I1(CADDR_reg_n_0_[4]),
        .I2(\addrR[31]_i_4_n_0 ),
        .I3(get_next_addr_rd0_carry_n_6),
        .I4(\addrR_reg[7]_i_2_n_7 ),
        .I5(\addrR[31]_i_6_n_0 ),
        .O(\addrR[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \addrR[5]_i_1 
       (.I0(\addrR[31]_i_3_n_0 ),
        .I1(CADDR_reg_n_0_[5]),
        .I2(\addrR[31]_i_4_n_0 ),
        .I3(get_next_addr_rd0_carry_n_5),
        .I4(\addrR_reg[7]_i_2_n_6 ),
        .I5(\addrR[31]_i_6_n_0 ),
        .O(\addrR[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \addrR[6]_i_1 
       (.I0(\addrR[31]_i_3_n_0 ),
        .I1(CADDR_reg_n_0_[6]),
        .I2(\addrR[31]_i_4_n_0 ),
        .I3(get_next_addr_rd0_carry_n_4),
        .I4(\addrR_reg[7]_i_2_n_5 ),
        .I5(\addrR[31]_i_6_n_0 ),
        .O(\addrR[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \addrR[7]_i_1 
       (.I0(\addrR[31]_i_3_n_0 ),
        .I1(CADDR_reg_n_0_[7]),
        .I2(\addrR[31]_i_4_n_0 ),
        .I3(get_next_addr_rd0_carry__0_n_7),
        .I4(\addrR_reg[7]_i_2_n_4 ),
        .I5(\addrR[31]_i_6_n_0 ),
        .O(\addrR[7]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h6AAA)) 
    \addrR[7]_i_3 
       (.I0(addrR_reg_n_0_[7]),
        .I1(CMD[25]),
        .I2(CMD[26]),
        .I3(CMD[27]),
        .O(\addrR[7]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hAA6A)) 
    \addrR[7]_i_4 
       (.I0(addrR_reg_n_0_[6]),
        .I1(CMD[27]),
        .I2(CMD[26]),
        .I3(CMD[25]),
        .O(\addrR[7]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h9AAA)) 
    \addrR[7]_i_5 
       (.I0(addrR_reg_n_0_[5]),
        .I1(CMD[26]),
        .I2(CMD[25]),
        .I3(CMD[27]),
        .O(\addrR[7]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hAA9A)) 
    \addrR[7]_i_6 
       (.I0(addrR_reg_n_0_[4]),
        .I1(CMD[25]),
        .I2(CMD[27]),
        .I3(CMD[26]),
        .O(\addrR[7]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \addrR[8]_i_1 
       (.I0(\addrR[31]_i_3_n_0 ),
        .I1(CADDR_reg_n_0_[8]),
        .I2(\addrR[31]_i_4_n_0 ),
        .I3(get_next_addr_rd0_carry__0_n_6),
        .I4(\addrR_reg[11]_i_2_n_7 ),
        .I5(\addrR[31]_i_6_n_0 ),
        .O(\addrR[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \addrR[9]_i_1 
       (.I0(\addrR[31]_i_3_n_0 ),
        .I1(CADDR_reg_n_0_[9]),
        .I2(\addrR[31]_i_4_n_0 ),
        .I3(get_next_addr_rd0_carry__0_n_5),
        .I4(\addrR_reg[11]_i_2_n_6 ),
        .I5(\addrR[31]_i_6_n_0 ),
        .O(\addrR[9]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \addrR_reg[0] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_1),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrR[0]_i_1_n_0 ),
        .Q(addrR_reg_n_0_[0]));
  FDCE #(
    .INIT(1'b0)) 
    \addrR_reg[10] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_1),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrR[10]_i_1_n_0 ),
        .Q(addrR_reg_n_0_[10]));
  FDCE #(
    .INIT(1'b0)) 
    \addrR_reg[11] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_1),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrR[11]_i_1_n_0 ),
        .Q(addrR_reg_n_0_[11]));
  CARRY4 \addrR_reg[11]_i_2 
       (.CI(\addrR_reg[7]_i_2_n_0 ),
        .CO({\addrR_reg[11]_i_2_n_0 ,\addrR_reg[11]_i_2_n_1 ,\addrR_reg[11]_i_2_n_2 ,\addrR_reg[11]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\addrR_reg[11]_i_2_n_4 ,\addrR_reg[11]_i_2_n_5 ,\addrR_reg[11]_i_2_n_6 ,\addrR_reg[11]_i_2_n_7 }),
        .S(addrR_reg_n_0_[11:8]));
  FDCE #(
    .INIT(1'b0)) 
    \addrR_reg[12] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_1),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrR[12]_i_1_n_0 ),
        .Q(addrR_reg_n_0_[12]));
  FDCE #(
    .INIT(1'b0)) 
    \addrR_reg[13] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_1),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrR[13]_i_1_n_0 ),
        .Q(addrR_reg_n_0_[13]));
  FDCE #(
    .INIT(1'b0)) 
    \addrR_reg[14] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_1),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrR[14]_i_1_n_0 ),
        .Q(addrR_reg_n_0_[14]));
  FDCE #(
    .INIT(1'b0)) 
    \addrR_reg[15] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_1),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrR[15]_i_1_n_0 ),
        .Q(addrR_reg_n_0_[15]));
  CARRY4 \addrR_reg[15]_i_2 
       (.CI(\addrR_reg[11]_i_2_n_0 ),
        .CO({\addrR_reg[15]_i_2_n_0 ,\addrR_reg[15]_i_2_n_1 ,\addrR_reg[15]_i_2_n_2 ,\addrR_reg[15]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\addrR_reg[15]_i_2_n_4 ,\addrR_reg[15]_i_2_n_5 ,\addrR_reg[15]_i_2_n_6 ,\addrR_reg[15]_i_2_n_7 }),
        .S(addrR_reg_n_0_[15:12]));
  FDCE #(
    .INIT(1'b0)) 
    \addrR_reg[16] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_1),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrR[16]_i_1_n_0 ),
        .Q(addrR_reg_n_0_[16]));
  FDCE #(
    .INIT(1'b0)) 
    \addrR_reg[17] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_1),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrR[17]_i_1_n_0 ),
        .Q(addrR_reg_n_0_[17]));
  FDCE #(
    .INIT(1'b0)) 
    \addrR_reg[18] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_1),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrR[18]_i_1_n_0 ),
        .Q(addrR_reg_n_0_[18]));
  FDCE #(
    .INIT(1'b0)) 
    \addrR_reg[19] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_1),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrR[19]_i_1_n_0 ),
        .Q(addrR_reg_n_0_[19]));
  CARRY4 \addrR_reg[19]_i_2 
       (.CI(\addrR_reg[15]_i_2_n_0 ),
        .CO({\addrR_reg[19]_i_2_n_0 ,\addrR_reg[19]_i_2_n_1 ,\addrR_reg[19]_i_2_n_2 ,\addrR_reg[19]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\addrR_reg[19]_i_2_n_4 ,\addrR_reg[19]_i_2_n_5 ,\addrR_reg[19]_i_2_n_6 ,\addrR_reg[19]_i_2_n_7 }),
        .S(addrR_reg_n_0_[19:16]));
  FDCE #(
    .INIT(1'b0)) 
    \addrR_reg[1] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_1),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrR[1]_i_1_n_0 ),
        .Q(addrR_reg_n_0_[1]));
  FDCE #(
    .INIT(1'b0)) 
    \addrR_reg[20] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_1),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrR[20]_i_1_n_0 ),
        .Q(addrR_reg_n_0_[20]));
  FDCE #(
    .INIT(1'b0)) 
    \addrR_reg[21] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_1),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrR[21]_i_1_n_0 ),
        .Q(addrR_reg_n_0_[21]));
  FDCE #(
    .INIT(1'b0)) 
    \addrR_reg[22] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_1),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrR[22]_i_1_n_0 ),
        .Q(addrR_reg_n_0_[22]));
  FDCE #(
    .INIT(1'b0)) 
    \addrR_reg[23] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_1),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrR[23]_i_1_n_0 ),
        .Q(addrR_reg_n_0_[23]));
  CARRY4 \addrR_reg[23]_i_2 
       (.CI(\addrR_reg[19]_i_2_n_0 ),
        .CO({\addrR_reg[23]_i_2_n_0 ,\addrR_reg[23]_i_2_n_1 ,\addrR_reg[23]_i_2_n_2 ,\addrR_reg[23]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\addrR_reg[23]_i_2_n_4 ,\addrR_reg[23]_i_2_n_5 ,\addrR_reg[23]_i_2_n_6 ,\addrR_reg[23]_i_2_n_7 }),
        .S(addrR_reg_n_0_[23:20]));
  FDCE #(
    .INIT(1'b0)) 
    \addrR_reg[24] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_1),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrR[24]_i_1_n_0 ),
        .Q(addrR_reg_n_0_[24]));
  FDCE #(
    .INIT(1'b0)) 
    \addrR_reg[25] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_1),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrR[25]_i_1_n_0 ),
        .Q(addrR_reg_n_0_[25]));
  FDCE #(
    .INIT(1'b0)) 
    \addrR_reg[26] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_1),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrR[26]_i_1_n_0 ),
        .Q(addrR_reg_n_0_[26]));
  FDCE #(
    .INIT(1'b0)) 
    \addrR_reg[27] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_1),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrR[27]_i_1_n_0 ),
        .Q(addrR_reg_n_0_[27]));
  CARRY4 \addrR_reg[27]_i_2 
       (.CI(\addrR_reg[23]_i_2_n_0 ),
        .CO({\addrR_reg[27]_i_2_n_0 ,\addrR_reg[27]_i_2_n_1 ,\addrR_reg[27]_i_2_n_2 ,\addrR_reg[27]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\addrR_reg[27]_i_2_n_4 ,\addrR_reg[27]_i_2_n_5 ,\addrR_reg[27]_i_2_n_6 ,\addrR_reg[27]_i_2_n_7 }),
        .S(addrR_reg_n_0_[27:24]));
  FDCE #(
    .INIT(1'b0)) 
    \addrR_reg[28] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_1),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrR[28]_i_1_n_0 ),
        .Q(addrR_reg_n_0_[28]));
  FDCE #(
    .INIT(1'b0)) 
    \addrR_reg[29] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_1),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrR[29]_i_1_n_0 ),
        .Q(addrR_reg_n_0_[29]));
  FDCE #(
    .INIT(1'b0)) 
    \addrR_reg[2] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_1),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrR[2]_i_1_n_0 ),
        .Q(addrR_reg_n_0_[2]));
  FDCE #(
    .INIT(1'b0)) 
    \addrR_reg[30] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_1),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrR[30]_i_1_n_0 ),
        .Q(addrR_reg_n_0_[30]));
  FDCE #(
    .INIT(1'b0)) 
    \addrR_reg[31] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_1),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrR[31]_i_2_n_0 ),
        .Q(addrR_reg_n_0_[31]));
  CARRY4 \addrR_reg[31]_i_5 
       (.CI(\addrR_reg[27]_i_2_n_0 ),
        .CO({\NLW_addrR_reg[31]_i_5_CO_UNCONNECTED [3],\addrR_reg[31]_i_5_n_1 ,\addrR_reg[31]_i_5_n_2 ,\addrR_reg[31]_i_5_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\addrR_reg[31]_i_5_n_4 ,\addrR_reg[31]_i_5_n_5 ,\addrR_reg[31]_i_5_n_6 ,\addrR_reg[31]_i_5_n_7 }),
        .S(addrR_reg_n_0_[31:28]));
  FDCE #(
    .INIT(1'b0)) 
    \addrR_reg[3] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_1),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrR[3]_i_1_n_0 ),
        .Q(addrR_reg_n_0_[3]));
  CARRY4 \addrR_reg[3]_i_2 
       (.CI(1'b0),
        .CO({\addrR_reg[3]_i_2_n_0 ,\addrR_reg[3]_i_2_n_1 ,\addrR_reg[3]_i_2_n_2 ,\addrR_reg[3]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI(addrR_reg_n_0_[3:0]),
        .O({\addrR_reg[3]_i_2_n_4 ,\addrR_reg[3]_i_2_n_5 ,\addrR_reg[3]_i_2_n_6 ,\addrR_reg[3]_i_2_n_7 }),
        .S({\addrR[3]_i_3_n_0 ,\addrR[3]_i_4_n_0 ,\addrR[3]_i_5_n_0 ,\addrR[3]_i_6_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \addrR_reg[4] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_1),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrR[4]_i_1_n_0 ),
        .Q(addrR_reg_n_0_[4]));
  FDCE #(
    .INIT(1'b0)) 
    \addrR_reg[5] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_1),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrR[5]_i_1_n_0 ),
        .Q(addrR_reg_n_0_[5]));
  FDCE #(
    .INIT(1'b0)) 
    \addrR_reg[6] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_1),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrR[6]_i_1_n_0 ),
        .Q(addrR_reg_n_0_[6]));
  FDCE #(
    .INIT(1'b0)) 
    \addrR_reg[7] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_1),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrR[7]_i_1_n_0 ),
        .Q(addrR_reg_n_0_[7]));
  CARRY4 \addrR_reg[7]_i_2 
       (.CI(\addrR_reg[3]_i_2_n_0 ),
        .CO({\addrR_reg[7]_i_2_n_0 ,\addrR_reg[7]_i_2_n_1 ,\addrR_reg[7]_i_2_n_2 ,\addrR_reg[7]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI(addrR_reg_n_0_[7:4]),
        .O({\addrR_reg[7]_i_2_n_4 ,\addrR_reg[7]_i_2_n_5 ,\addrR_reg[7]_i_2_n_6 ,\addrR_reg[7]_i_2_n_7 }),
        .S({\addrR[7]_i_3_n_0 ,\addrR[7]_i_4_n_0 ,\addrR[7]_i_5_n_0 ,\addrR[7]_i_6_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \addrR_reg[8] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_1),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrR[8]_i_1_n_0 ),
        .Q(addrR_reg_n_0_[8]));
  FDCE #(
    .INIT(1'b0)) 
    \addrR_reg[9] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_1),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrR[9]_i_1_n_0 ),
        .Q(addrR_reg_n_0_[9]));
  LUT4 #(
    .INIT(16'h8F88)) 
    \addrW[0]_i_1 
       (.I0(\addrW_reg[3]_i_2_n_7 ),
        .I1(\addrW[31]_i_5_n_0 ),
        .I2(state_write[1]),
        .I3(CADDR_reg_n_0_[0]),
        .O(\addrW[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \addrW[10]_i_1 
       (.I0(CADDR_reg_n_0_[10]),
        .I1(state_write[1]),
        .I2(\addrW[31]_i_3_n_0 ),
        .I3(get_next_addr_wr0_carry__0_n_4),
        .I4(\addrW_reg[11]_i_2_n_5 ),
        .I5(\addrW[31]_i_5_n_0 ),
        .O(\addrW[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \addrW[11]_i_1 
       (.I0(CADDR_reg_n_0_[11]),
        .I1(state_write[1]),
        .I2(\addrW[31]_i_3_n_0 ),
        .I3(get_next_addr_wr0_carry__1_n_7),
        .I4(\addrW_reg[11]_i_2_n_4 ),
        .I5(\addrW[31]_i_5_n_0 ),
        .O(\addrW[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \addrW[12]_i_1 
       (.I0(CADDR_reg_n_0_[12]),
        .I1(state_write[1]),
        .I2(\addrW[31]_i_3_n_0 ),
        .I3(get_next_addr_wr0_carry__1_n_6),
        .I4(\addrW_reg[15]_i_2_n_7 ),
        .I5(\addrW[31]_i_5_n_0 ),
        .O(\addrW[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \addrW[13]_i_1 
       (.I0(CADDR_reg_n_0_[13]),
        .I1(state_write[1]),
        .I2(\addrW[31]_i_3_n_0 ),
        .I3(get_next_addr_wr0_carry__1_n_5),
        .I4(\addrW_reg[15]_i_2_n_6 ),
        .I5(\addrW[31]_i_5_n_0 ),
        .O(\addrW[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \addrW[14]_i_1 
       (.I0(CADDR_reg_n_0_[14]),
        .I1(state_write[1]),
        .I2(\addrW[31]_i_3_n_0 ),
        .I3(get_next_addr_wr0_carry__1_n_4),
        .I4(\addrW_reg[15]_i_2_n_5 ),
        .I5(\addrW[31]_i_5_n_0 ),
        .O(\addrW[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \addrW[15]_i_1 
       (.I0(CADDR_reg_n_0_[15]),
        .I1(state_write[1]),
        .I2(\addrW[31]_i_3_n_0 ),
        .I3(get_next_addr_wr0_carry__2_n_7),
        .I4(\addrW_reg[15]_i_2_n_4 ),
        .I5(\addrW[31]_i_5_n_0 ),
        .O(\addrW[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \addrW[16]_i_1 
       (.I0(CADDR_reg_n_0_[16]),
        .I1(state_write[1]),
        .I2(\addrW[31]_i_3_n_0 ),
        .I3(get_next_addr_wr0_carry__2_n_6),
        .I4(\addrW_reg[19]_i_2_n_7 ),
        .I5(\addrW[31]_i_5_n_0 ),
        .O(\addrW[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \addrW[17]_i_1 
       (.I0(CADDR_reg_n_0_[17]),
        .I1(state_write[1]),
        .I2(\addrW[31]_i_3_n_0 ),
        .I3(get_next_addr_wr0_carry__2_n_5),
        .I4(\addrW_reg[19]_i_2_n_6 ),
        .I5(\addrW[31]_i_5_n_0 ),
        .O(\addrW[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \addrW[18]_i_1 
       (.I0(CADDR_reg_n_0_[18]),
        .I1(state_write[1]),
        .I2(\addrW[31]_i_3_n_0 ),
        .I3(get_next_addr_wr0_carry__2_n_4),
        .I4(\addrW_reg[19]_i_2_n_5 ),
        .I5(\addrW[31]_i_5_n_0 ),
        .O(\addrW[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \addrW[19]_i_1 
       (.I0(CADDR_reg_n_0_[19]),
        .I1(state_write[1]),
        .I2(\addrW[31]_i_3_n_0 ),
        .I3(get_next_addr_wr0_carry__3_n_7),
        .I4(\addrW_reg[19]_i_2_n_4 ),
        .I5(\addrW[31]_i_5_n_0 ),
        .O(\addrW[19]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \addrW[1]_i_1 
       (.I0(\addrW_reg[3]_i_2_n_6 ),
        .I1(\addrW[31]_i_5_n_0 ),
        .I2(state_write[1]),
        .I3(CADDR_reg_n_0_[1]),
        .O(\addrW[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \addrW[20]_i_1 
       (.I0(CADDR_reg_n_0_[20]),
        .I1(state_write[1]),
        .I2(\addrW[31]_i_3_n_0 ),
        .I3(get_next_addr_wr0_carry__3_n_6),
        .I4(\addrW_reg[23]_i_2_n_7 ),
        .I5(\addrW[31]_i_5_n_0 ),
        .O(\addrW[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \addrW[21]_i_1 
       (.I0(CADDR_reg_n_0_[21]),
        .I1(state_write[1]),
        .I2(\addrW[31]_i_3_n_0 ),
        .I3(get_next_addr_wr0_carry__3_n_5),
        .I4(\addrW_reg[23]_i_2_n_6 ),
        .I5(\addrW[31]_i_5_n_0 ),
        .O(\addrW[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \addrW[22]_i_1 
       (.I0(CADDR_reg_n_0_[22]),
        .I1(state_write[1]),
        .I2(\addrW[31]_i_3_n_0 ),
        .I3(get_next_addr_wr0_carry__3_n_4),
        .I4(\addrW_reg[23]_i_2_n_5 ),
        .I5(\addrW[31]_i_5_n_0 ),
        .O(\addrW[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \addrW[23]_i_1 
       (.I0(CADDR_reg_n_0_[23]),
        .I1(state_write[1]),
        .I2(\addrW[31]_i_3_n_0 ),
        .I3(get_next_addr_wr0_carry__4_n_7),
        .I4(\addrW_reg[23]_i_2_n_4 ),
        .I5(\addrW[31]_i_5_n_0 ),
        .O(\addrW[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \addrW[24]_i_1 
       (.I0(CADDR_reg_n_0_[24]),
        .I1(state_write[1]),
        .I2(\addrW[31]_i_3_n_0 ),
        .I3(get_next_addr_wr0_carry__4_n_6),
        .I4(\addrW_reg[27]_i_2_n_7 ),
        .I5(\addrW[31]_i_5_n_0 ),
        .O(\addrW[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \addrW[25]_i_1 
       (.I0(CADDR_reg_n_0_[25]),
        .I1(state_write[1]),
        .I2(\addrW[31]_i_3_n_0 ),
        .I3(get_next_addr_wr0_carry__4_n_5),
        .I4(\addrW_reg[27]_i_2_n_6 ),
        .I5(\addrW[31]_i_5_n_0 ),
        .O(\addrW[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \addrW[26]_i_1 
       (.I0(CADDR_reg_n_0_[26]),
        .I1(state_write[1]),
        .I2(\addrW[31]_i_3_n_0 ),
        .I3(get_next_addr_wr0_carry__4_n_4),
        .I4(\addrW_reg[27]_i_2_n_5 ),
        .I5(\addrW[31]_i_5_n_0 ),
        .O(\addrW[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \addrW[27]_i_1 
       (.I0(CADDR_reg_n_0_[27]),
        .I1(state_write[1]),
        .I2(\addrW[31]_i_3_n_0 ),
        .I3(get_next_addr_wr0_carry__5_n_7),
        .I4(\addrW_reg[27]_i_2_n_4 ),
        .I5(\addrW[31]_i_5_n_0 ),
        .O(\addrW[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \addrW[28]_i_1 
       (.I0(CADDR_reg_n_0_[28]),
        .I1(state_write[1]),
        .I2(\addrW[31]_i_3_n_0 ),
        .I3(get_next_addr_wr0_carry__5_n_6),
        .I4(\addrW_reg[31]_i_4_n_7 ),
        .I5(\addrW[31]_i_5_n_0 ),
        .O(\addrW[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \addrW[29]_i_1 
       (.I0(CADDR_reg_n_0_[29]),
        .I1(state_write[1]),
        .I2(\addrW[31]_i_3_n_0 ),
        .I3(get_next_addr_wr0_carry__5_n_5),
        .I4(\addrW_reg[31]_i_4_n_6 ),
        .I5(\addrW[31]_i_5_n_0 ),
        .O(\addrW[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF22F222F222F2)) 
    \addrW[2]_i_1 
       (.I0(CADDR_reg_n_0_[2]),
        .I1(state_write[1]),
        .I2(\addrW[31]_i_3_n_0 ),
        .I3(addr[2]),
        .I4(\addrW_reg[3]_i_2_n_5 ),
        .I5(\addrW[31]_i_5_n_0 ),
        .O(\addrW[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \addrW[30]_i_1 
       (.I0(CADDR_reg_n_0_[30]),
        .I1(state_write[1]),
        .I2(\addrW[31]_i_3_n_0 ),
        .I3(get_next_addr_wr0_carry__5_n_4),
        .I4(\addrW_reg[31]_i_4_n_5 ),
        .I5(\addrW[31]_i_5_n_0 ),
        .O(\addrW[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF02000000)) 
    \addrW[31]_i_1 
       (.I0(state_write[1]),
        .I1(state_write[0]),
        .I2(CMD[24]),
        .I3(CMD[23]),
        .I4(BREADY1__0),
        .I5(\AWID[3]_i_1_n_0 ),
        .O(\addrW[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \addrW[31]_i_2 
       (.I0(CADDR_reg_n_0_[31]),
        .I1(state_write[1]),
        .I2(\addrW[31]_i_3_n_0 ),
        .I3(get_next_addr_wr0_carry__6_n_7),
        .I4(\addrW_reg[31]_i_4_n_4 ),
        .I5(\addrW[31]_i_5_n_0 ),
        .O(\addrW[31]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h4440)) 
    \addrW[31]_i_3 
       (.I0(state_write[2]),
        .I1(state_write[1]),
        .I2(CMD[26]),
        .I3(CMD[27]),
        .O(\addrW[31]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h0004)) 
    \addrW[31]_i_5 
       (.I0(state_write[2]),
        .I1(state_write[1]),
        .I2(CMD[26]),
        .I3(CMD[27]),
        .O(\addrW[31]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \addrW[3]_i_1 
       (.I0(CADDR_reg_n_0_[3]),
        .I1(state_write[1]),
        .I2(\addrW[31]_i_3_n_0 ),
        .I3(get_next_addr_wr0_carry_n_7),
        .I4(\addrW_reg[3]_i_2_n_4 ),
        .I5(\addrW[31]_i_5_n_0 ),
        .O(\addrW[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h9AAA)) 
    \addrW[3]_i_3 
       (.I0(addr[3]),
        .I1(CMD[27]),
        .I2(CMD[25]),
        .I3(CMD[26]),
        .O(\addrW[3]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hAA9A)) 
    \addrW[3]_i_4 
       (.I0(addr[2]),
        .I1(CMD[27]),
        .I2(CMD[26]),
        .I3(CMD[25]),
        .O(\addrW[3]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hAA9A)) 
    \addrW[3]_i_5 
       (.I0(addr[1]),
        .I1(CMD[26]),
        .I2(CMD[25]),
        .I3(CMD[27]),
        .O(\addrW[3]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hAAA9)) 
    \addrW[3]_i_6 
       (.I0(addr[0]),
        .I1(CMD[25]),
        .I2(CMD[26]),
        .I3(CMD[27]),
        .O(\addrW[3]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \addrW[4]_i_1 
       (.I0(CADDR_reg_n_0_[4]),
        .I1(state_write[1]),
        .I2(\addrW[31]_i_3_n_0 ),
        .I3(get_next_addr_wr0_carry_n_6),
        .I4(\addrW_reg[7]_i_2_n_7 ),
        .I5(\addrW[31]_i_5_n_0 ),
        .O(\addrW[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \addrW[5]_i_1 
       (.I0(CADDR_reg_n_0_[5]),
        .I1(state_write[1]),
        .I2(\addrW[31]_i_3_n_0 ),
        .I3(get_next_addr_wr0_carry_n_5),
        .I4(\addrW_reg[7]_i_2_n_6 ),
        .I5(\addrW[31]_i_5_n_0 ),
        .O(\addrW[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \addrW[6]_i_1 
       (.I0(CADDR_reg_n_0_[6]),
        .I1(state_write[1]),
        .I2(\addrW[31]_i_3_n_0 ),
        .I3(get_next_addr_wr0_carry_n_4),
        .I4(\addrW_reg[7]_i_2_n_5 ),
        .I5(\addrW[31]_i_5_n_0 ),
        .O(\addrW[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \addrW[7]_i_1 
       (.I0(CADDR_reg_n_0_[7]),
        .I1(state_write[1]),
        .I2(\addrW[31]_i_3_n_0 ),
        .I3(get_next_addr_wr0_carry__0_n_7),
        .I4(\addrW_reg[7]_i_2_n_4 ),
        .I5(\addrW[31]_i_5_n_0 ),
        .O(\addrW[7]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h6AAA)) 
    \addrW[7]_i_3 
       (.I0(addr[7]),
        .I1(CMD[25]),
        .I2(CMD[26]),
        .I3(CMD[27]),
        .O(\addrW[7]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hAA6A)) 
    \addrW[7]_i_4 
       (.I0(addr[6]),
        .I1(CMD[27]),
        .I2(CMD[26]),
        .I3(CMD[25]),
        .O(\addrW[7]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h9AAA)) 
    \addrW[7]_i_5 
       (.I0(addr[5]),
        .I1(CMD[26]),
        .I2(CMD[25]),
        .I3(CMD[27]),
        .O(\addrW[7]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hAA9A)) 
    \addrW[7]_i_6 
       (.I0(addr[4]),
        .I1(CMD[25]),
        .I2(CMD[27]),
        .I3(CMD[26]),
        .O(\addrW[7]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \addrW[8]_i_1 
       (.I0(CADDR_reg_n_0_[8]),
        .I1(state_write[1]),
        .I2(\addrW[31]_i_3_n_0 ),
        .I3(get_next_addr_wr0_carry__0_n_6),
        .I4(\addrW_reg[11]_i_2_n_7 ),
        .I5(\addrW[31]_i_5_n_0 ),
        .O(\addrW[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \addrW[9]_i_1 
       (.I0(CADDR_reg_n_0_[9]),
        .I1(state_write[1]),
        .I2(\addrW[31]_i_3_n_0 ),
        .I3(get_next_addr_wr0_carry__0_n_5),
        .I4(\addrW_reg[11]_i_2_n_6 ),
        .I5(\addrW[31]_i_5_n_0 ),
        .O(\addrW[9]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \addrW_reg[0] 
       (.C(ACLK),
        .CE(\addrW[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrW[0]_i_1_n_0 ),
        .Q(addr[0]));
  FDCE #(
    .INIT(1'b0)) 
    \addrW_reg[10] 
       (.C(ACLK),
        .CE(\addrW[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrW[10]_i_1_n_0 ),
        .Q(addr[10]));
  FDCE #(
    .INIT(1'b0)) 
    \addrW_reg[11] 
       (.C(ACLK),
        .CE(\addrW[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrW[11]_i_1_n_0 ),
        .Q(addr[11]));
  CARRY4 \addrW_reg[11]_i_2 
       (.CI(\addrW_reg[7]_i_2_n_0 ),
        .CO({\addrW_reg[11]_i_2_n_0 ,\addrW_reg[11]_i_2_n_1 ,\addrW_reg[11]_i_2_n_2 ,\addrW_reg[11]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\addrW_reg[11]_i_2_n_4 ,\addrW_reg[11]_i_2_n_5 ,\addrW_reg[11]_i_2_n_6 ,\addrW_reg[11]_i_2_n_7 }),
        .S(addr[11:8]));
  FDCE #(
    .INIT(1'b0)) 
    \addrW_reg[12] 
       (.C(ACLK),
        .CE(\addrW[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrW[12]_i_1_n_0 ),
        .Q(addr[12]));
  FDCE #(
    .INIT(1'b0)) 
    \addrW_reg[13] 
       (.C(ACLK),
        .CE(\addrW[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrW[13]_i_1_n_0 ),
        .Q(addr[13]));
  FDCE #(
    .INIT(1'b0)) 
    \addrW_reg[14] 
       (.C(ACLK),
        .CE(\addrW[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrW[14]_i_1_n_0 ),
        .Q(addr[14]));
  FDCE #(
    .INIT(1'b0)) 
    \addrW_reg[15] 
       (.C(ACLK),
        .CE(\addrW[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrW[15]_i_1_n_0 ),
        .Q(addr[15]));
  CARRY4 \addrW_reg[15]_i_2 
       (.CI(\addrW_reg[11]_i_2_n_0 ),
        .CO({\addrW_reg[15]_i_2_n_0 ,\addrW_reg[15]_i_2_n_1 ,\addrW_reg[15]_i_2_n_2 ,\addrW_reg[15]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\addrW_reg[15]_i_2_n_4 ,\addrW_reg[15]_i_2_n_5 ,\addrW_reg[15]_i_2_n_6 ,\addrW_reg[15]_i_2_n_7 }),
        .S(addr[15:12]));
  FDCE #(
    .INIT(1'b0)) 
    \addrW_reg[16] 
       (.C(ACLK),
        .CE(\addrW[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrW[16]_i_1_n_0 ),
        .Q(addr[16]));
  FDCE #(
    .INIT(1'b0)) 
    \addrW_reg[17] 
       (.C(ACLK),
        .CE(\addrW[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrW[17]_i_1_n_0 ),
        .Q(addr[17]));
  FDCE #(
    .INIT(1'b0)) 
    \addrW_reg[18] 
       (.C(ACLK),
        .CE(\addrW[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrW[18]_i_1_n_0 ),
        .Q(addr[18]));
  FDCE #(
    .INIT(1'b0)) 
    \addrW_reg[19] 
       (.C(ACLK),
        .CE(\addrW[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrW[19]_i_1_n_0 ),
        .Q(addr[19]));
  CARRY4 \addrW_reg[19]_i_2 
       (.CI(\addrW_reg[15]_i_2_n_0 ),
        .CO({\addrW_reg[19]_i_2_n_0 ,\addrW_reg[19]_i_2_n_1 ,\addrW_reg[19]_i_2_n_2 ,\addrW_reg[19]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\addrW_reg[19]_i_2_n_4 ,\addrW_reg[19]_i_2_n_5 ,\addrW_reg[19]_i_2_n_6 ,\addrW_reg[19]_i_2_n_7 }),
        .S(addr[19:16]));
  FDCE #(
    .INIT(1'b0)) 
    \addrW_reg[1] 
       (.C(ACLK),
        .CE(\addrW[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrW[1]_i_1_n_0 ),
        .Q(addr[1]));
  FDCE #(
    .INIT(1'b0)) 
    \addrW_reg[20] 
       (.C(ACLK),
        .CE(\addrW[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrW[20]_i_1_n_0 ),
        .Q(addr[20]));
  FDCE #(
    .INIT(1'b0)) 
    \addrW_reg[21] 
       (.C(ACLK),
        .CE(\addrW[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrW[21]_i_1_n_0 ),
        .Q(addr[21]));
  FDCE #(
    .INIT(1'b0)) 
    \addrW_reg[22] 
       (.C(ACLK),
        .CE(\addrW[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrW[22]_i_1_n_0 ),
        .Q(addr[22]));
  FDCE #(
    .INIT(1'b0)) 
    \addrW_reg[23] 
       (.C(ACLK),
        .CE(\addrW[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrW[23]_i_1_n_0 ),
        .Q(addr[23]));
  CARRY4 \addrW_reg[23]_i_2 
       (.CI(\addrW_reg[19]_i_2_n_0 ),
        .CO({\addrW_reg[23]_i_2_n_0 ,\addrW_reg[23]_i_2_n_1 ,\addrW_reg[23]_i_2_n_2 ,\addrW_reg[23]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\addrW_reg[23]_i_2_n_4 ,\addrW_reg[23]_i_2_n_5 ,\addrW_reg[23]_i_2_n_6 ,\addrW_reg[23]_i_2_n_7 }),
        .S(addr[23:20]));
  FDCE #(
    .INIT(1'b0)) 
    \addrW_reg[24] 
       (.C(ACLK),
        .CE(\addrW[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrW[24]_i_1_n_0 ),
        .Q(addr[24]));
  FDCE #(
    .INIT(1'b0)) 
    \addrW_reg[25] 
       (.C(ACLK),
        .CE(\addrW[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrW[25]_i_1_n_0 ),
        .Q(addr[25]));
  FDCE #(
    .INIT(1'b0)) 
    \addrW_reg[26] 
       (.C(ACLK),
        .CE(\addrW[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrW[26]_i_1_n_0 ),
        .Q(addr[26]));
  FDCE #(
    .INIT(1'b0)) 
    \addrW_reg[27] 
       (.C(ACLK),
        .CE(\addrW[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrW[27]_i_1_n_0 ),
        .Q(addr[27]));
  CARRY4 \addrW_reg[27]_i_2 
       (.CI(\addrW_reg[23]_i_2_n_0 ),
        .CO({\addrW_reg[27]_i_2_n_0 ,\addrW_reg[27]_i_2_n_1 ,\addrW_reg[27]_i_2_n_2 ,\addrW_reg[27]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\addrW_reg[27]_i_2_n_4 ,\addrW_reg[27]_i_2_n_5 ,\addrW_reg[27]_i_2_n_6 ,\addrW_reg[27]_i_2_n_7 }),
        .S(addr[27:24]));
  FDCE #(
    .INIT(1'b0)) 
    \addrW_reg[28] 
       (.C(ACLK),
        .CE(\addrW[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrW[28]_i_1_n_0 ),
        .Q(addr[28]));
  FDCE #(
    .INIT(1'b0)) 
    \addrW_reg[29] 
       (.C(ACLK),
        .CE(\addrW[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrW[29]_i_1_n_0 ),
        .Q(addr[29]));
  FDCE #(
    .INIT(1'b0)) 
    \addrW_reg[2] 
       (.C(ACLK),
        .CE(\addrW[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrW[2]_i_1_n_0 ),
        .Q(addr[2]));
  FDCE #(
    .INIT(1'b0)) 
    \addrW_reg[30] 
       (.C(ACLK),
        .CE(\addrW[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrW[30]_i_1_n_0 ),
        .Q(addr[30]));
  FDCE #(
    .INIT(1'b0)) 
    \addrW_reg[31] 
       (.C(ACLK),
        .CE(\addrW[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrW[31]_i_2_n_0 ),
        .Q(addr[31]));
  CARRY4 \addrW_reg[31]_i_4 
       (.CI(\addrW_reg[27]_i_2_n_0 ),
        .CO({\NLW_addrW_reg[31]_i_4_CO_UNCONNECTED [3],\addrW_reg[31]_i_4_n_1 ,\addrW_reg[31]_i_4_n_2 ,\addrW_reg[31]_i_4_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\addrW_reg[31]_i_4_n_4 ,\addrW_reg[31]_i_4_n_5 ,\addrW_reg[31]_i_4_n_6 ,\addrW_reg[31]_i_4_n_7 }),
        .S(addr[31:28]));
  FDCE #(
    .INIT(1'b0)) 
    \addrW_reg[3] 
       (.C(ACLK),
        .CE(\addrW[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrW[3]_i_1_n_0 ),
        .Q(addr[3]));
  CARRY4 \addrW_reg[3]_i_2 
       (.CI(1'b0),
        .CO({\addrW_reg[3]_i_2_n_0 ,\addrW_reg[3]_i_2_n_1 ,\addrW_reg[3]_i_2_n_2 ,\addrW_reg[3]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI(addr[3:0]),
        .O({\addrW_reg[3]_i_2_n_4 ,\addrW_reg[3]_i_2_n_5 ,\addrW_reg[3]_i_2_n_6 ,\addrW_reg[3]_i_2_n_7 }),
        .S({\addrW[3]_i_3_n_0 ,\addrW[3]_i_4_n_0 ,\addrW[3]_i_5_n_0 ,\addrW[3]_i_6_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \addrW_reg[4] 
       (.C(ACLK),
        .CE(\addrW[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrW[4]_i_1_n_0 ),
        .Q(addr[4]));
  FDCE #(
    .INIT(1'b0)) 
    \addrW_reg[5] 
       (.C(ACLK),
        .CE(\addrW[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrW[5]_i_1_n_0 ),
        .Q(addr[5]));
  FDCE #(
    .INIT(1'b0)) 
    \addrW_reg[6] 
       (.C(ACLK),
        .CE(\addrW[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrW[6]_i_1_n_0 ),
        .Q(addr[6]));
  FDCE #(
    .INIT(1'b0)) 
    \addrW_reg[7] 
       (.C(ACLK),
        .CE(\addrW[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrW[7]_i_1_n_0 ),
        .Q(addr[7]));
  CARRY4 \addrW_reg[7]_i_2 
       (.CI(\addrW_reg[3]_i_2_n_0 ),
        .CO({\addrW_reg[7]_i_2_n_0 ,\addrW_reg[7]_i_2_n_1 ,\addrW_reg[7]_i_2_n_2 ,\addrW_reg[7]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI(addr[7:4]),
        .O({\addrW_reg[7]_i_2_n_4 ,\addrW_reg[7]_i_2_n_5 ,\addrW_reg[7]_i_2_n_6 ,\addrW_reg[7]_i_2_n_7 }),
        .S({\addrW[7]_i_3_n_0 ,\addrW[7]_i_4_n_0 ,\addrW[7]_i_5_n_0 ,\addrW[7]_i_6_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \addrW_reg[8] 
       (.C(ACLK),
        .CE(\addrW[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrW[8]_i_1_n_0 ),
        .Q(addr[8]));
  FDCE #(
    .INIT(1'b0)) 
    \addrW_reg[9] 
       (.C(ACLK),
        .CE(\addrW[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\addrW[9]_i_1_n_0 ),
        .Q(addr[9]));
  LUT6 #(
    .INIT(64'h0111FFFF01110000)) 
    cmd_ready_i_1
       (.I0(state_cmd[2]),
        .I1(state_cmd[0]),
        .I2(cmd_rd_data[31]),
        .I3(CMD1__2),
        .I4(cmd_ready_i_2_n_0),
        .I5(cmd_rd_ready),
        .O(cmd_ready_i_1_n_0));
  LUT6 #(
    .INIT(64'hFF00FF00000800FF)) 
    cmd_ready_i_2
       (.I0(cmd_rd_valid),
        .I1(cmd_rd_ready),
        .I2(CMD[31]),
        .I3(state_cmd[1]),
        .I4(state_cmd[0]),
        .I5(state_cmd[2]),
        .O(cmd_ready_i_2_n_0));
  FDCE #(
    .INIT(1'b0)) 
    cmd_ready_reg
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(cmd_ready_i_1_n_0),
        .Q(cmd_rd_ready));
  CARRY4 countR1_carry
       (.CI(1'b0),
        .CO({countR1_carry_n_0,countR1_carry_n_1,countR1_carry_n_2,countR1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({countR1_carry_i_1_n_0,countR1_carry_i_2_n_0,countR1_carry_i_3_n_0,countR1_carry_i_4_n_0}),
        .O(NLW_countR1_carry_O_UNCONNECTED[3:0]),
        .S({countR1_carry_i_5_n_0,countR1_carry_i_6_n_0,countR1_carry_i_7_n_0,countR1_carry_i_8_n_0}));
  CARRY4 countR1_carry__0
       (.CI(countR1_carry_n_0),
        .CO({NLW_countR1_carry__0_CO_UNCONNECTED[3:1],countR1}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,countR_reg_n_0_[8]}),
        .O(NLW_countR1_carry__0_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,countR1_carry__0_i_1_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    countR1_carry__0_i_1
       (.I0(countR_reg_n_0_[8]),
        .O(countR1_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    countR1_carry_i_1
       (.I0(countR_reg_n_0_[7]),
        .I1(ARLEN[7]),
        .I2(countR_reg_n_0_[6]),
        .I3(ARLEN[6]),
        .O(countR1_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    countR1_carry_i_2
       (.I0(countR_reg_n_0_[5]),
        .I1(ARLEN[5]),
        .I2(countR_reg_n_0_[4]),
        .I3(ARLEN[4]),
        .O(countR1_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    countR1_carry_i_3
       (.I0(countR_reg_n_0_[3]),
        .I1(ARLEN[3]),
        .I2(countR_reg_n_0_[2]),
        .I3(ARLEN[2]),
        .O(countR1_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h7510)) 
    countR1_carry_i_4
       (.I0(ARLEN[1]),
        .I1(ARLEN[0]),
        .I2(countR_reg_n_0_[0]),
        .I3(countR_reg_n_0_[1]),
        .O(countR1_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    countR1_carry_i_5
       (.I0(ARLEN[7]),
        .I1(countR_reg_n_0_[7]),
        .I2(ARLEN[6]),
        .I3(countR_reg_n_0_[6]),
        .O(countR1_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    countR1_carry_i_6
       (.I0(ARLEN[5]),
        .I1(countR_reg_n_0_[5]),
        .I2(ARLEN[4]),
        .I3(countR_reg_n_0_[4]),
        .O(countR1_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    countR1_carry_i_7
       (.I0(ARLEN[3]),
        .I1(countR_reg_n_0_[3]),
        .I2(ARLEN[2]),
        .I3(countR_reg_n_0_[2]),
        .O(countR1_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    countR1_carry_i_8
       (.I0(ARLEN[1]),
        .I1(countR_reg_n_0_[1]),
        .I2(ARLEN[0]),
        .I3(countR_reg_n_0_[0]),
        .O(countR1_carry_i_8_n_0));
  LUT3 #(
    .INIT(8'h07)) 
    \countR[0]_i_1 
       (.I0(countR_reg_n_0_[0]),
        .I1(state_read[1]),
        .I2(state_read[2]),
        .O(\countR[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0220)) 
    \countR[1]_i_1 
       (.I0(state_read[1]),
        .I1(state_read[2]),
        .I2(countR_reg_n_0_[0]),
        .I3(countR_reg_n_0_[1]),
        .O(\countR[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h07000800)) 
    \countR[2]_i_1 
       (.I0(countR_reg_n_0_[0]),
        .I1(countR_reg_n_0_[1]),
        .I2(state_read[2]),
        .I3(state_read[1]),
        .I4(countR_reg_n_0_[2]),
        .O(\countR[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h007F000000800000)) 
    \countR[3]_i_1 
       (.I0(countR_reg_n_0_[2]),
        .I1(countR_reg_n_0_[1]),
        .I2(countR_reg_n_0_[0]),
        .I3(state_read[2]),
        .I4(state_read[1]),
        .I5(countR_reg_n_0_[3]),
        .O(\countR[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFF000080000000)) 
    \countR[4]_i_1 
       (.I0(countR_reg_n_0_[0]),
        .I1(countR_reg_n_0_[1]),
        .I2(countR_reg_n_0_[2]),
        .I3(countR_reg_n_0_[3]),
        .I4(\countR[5]_i_3_n_0 ),
        .I5(countR_reg_n_0_[4]),
        .O(\countR[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF7F000000800000)) 
    \countR[5]_i_1 
       (.I0(countR_reg_n_0_[4]),
        .I1(countR_reg_n_0_[3]),
        .I2(countR_reg_n_0_[2]),
        .I3(\countR[5]_i_2_n_0 ),
        .I4(\countR[5]_i_3_n_0 ),
        .I5(countR_reg_n_0_[5]),
        .O(\countR[5]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \countR[5]_i_2 
       (.I0(countR_reg_n_0_[0]),
        .I1(countR_reg_n_0_[1]),
        .O(\countR[5]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \countR[5]_i_3 
       (.I0(state_read[1]),
        .I1(state_read[2]),
        .O(\countR[5]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h2010)) 
    \countR[6]_i_1 
       (.I0(\countR[8]_i_4_n_0 ),
        .I1(state_read[2]),
        .I2(state_read[1]),
        .I3(countR_reg_n_0_[6]),
        .O(\countR[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0D000200)) 
    \countR[7]_i_1 
       (.I0(countR_reg_n_0_[6]),
        .I1(\countR[8]_i_4_n_0 ),
        .I2(state_read[2]),
        .I3(state_read[1]),
        .I4(countR_reg_n_0_[7]),
        .O(\countR[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00BF000000400000)) 
    \countR[8]_i_2 
       (.I0(\countR[8]_i_4_n_0 ),
        .I1(countR_reg_n_0_[6]),
        .I2(countR_reg_n_0_[7]),
        .I3(state_read[2]),
        .I4(state_read[1]),
        .I5(countR_reg_n_0_[8]),
        .O(\countR[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \countR[8]_i_4 
       (.I0(countR_reg_n_0_[0]),
        .I1(countR_reg_n_0_[1]),
        .I2(countR_reg_n_0_[2]),
        .I3(countR_reg_n_0_[3]),
        .I4(countR_reg_n_0_[4]),
        .I5(countR_reg_n_0_[5]),
        .O(\countR[8]_i_4_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \countR_reg[0] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_2),
        .CLR(u_u2f_fifo_n_3),
        .D(\countR[0]_i_1_n_0 ),
        .Q(countR_reg_n_0_[0]));
  FDCE #(
    .INIT(1'b0)) 
    \countR_reg[1] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_2),
        .CLR(u_u2f_fifo_n_3),
        .D(\countR[1]_i_1_n_0 ),
        .Q(countR_reg_n_0_[1]));
  FDCE #(
    .INIT(1'b0)) 
    \countR_reg[2] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_2),
        .CLR(u_u2f_fifo_n_3),
        .D(\countR[2]_i_1_n_0 ),
        .Q(countR_reg_n_0_[2]));
  FDCE #(
    .INIT(1'b0)) 
    \countR_reg[3] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_2),
        .CLR(u_u2f_fifo_n_3),
        .D(\countR[3]_i_1_n_0 ),
        .Q(countR_reg_n_0_[3]));
  FDCE #(
    .INIT(1'b0)) 
    \countR_reg[4] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_2),
        .CLR(u_u2f_fifo_n_3),
        .D(\countR[4]_i_1_n_0 ),
        .Q(countR_reg_n_0_[4]));
  FDCE #(
    .INIT(1'b0)) 
    \countR_reg[5] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_2),
        .CLR(u_u2f_fifo_n_3),
        .D(\countR[5]_i_1_n_0 ),
        .Q(countR_reg_n_0_[5]));
  FDCE #(
    .INIT(1'b0)) 
    \countR_reg[6] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_2),
        .CLR(u_u2f_fifo_n_3),
        .D(\countR[6]_i_1_n_0 ),
        .Q(countR_reg_n_0_[6]));
  FDCE #(
    .INIT(1'b0)) 
    \countR_reg[7] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_2),
        .CLR(u_u2f_fifo_n_3),
        .D(\countR[7]_i_1_n_0 ),
        .Q(countR_reg_n_0_[7]));
  FDCE #(
    .INIT(1'b0)) 
    \countR_reg[8] 
       (.C(ACLK),
        .CE(u_f2u_fifo_n_2),
        .CLR(u_u2f_fifo_n_3),
        .D(\countR[8]_i_2_n_0 ),
        .Q(countR_reg_n_0_[8]));
  LUT3 #(
    .INIT(8'h1F)) 
    \countW[0]_i_1 
       (.I0(countW_reg_n_0_[0]),
        .I1(state_write[2]),
        .I2(state_write[1]),
        .O(\countW[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0220)) 
    \countW[1]_i_1 
       (.I0(state_write[1]),
        .I1(state_write[2]),
        .I2(countW_reg_n_0_[0]),
        .I3(countW_reg_n_0_[1]),
        .O(\countW[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h07000800)) 
    \countW[2]_i_1 
       (.I0(countW_reg_n_0_[0]),
        .I1(countW_reg_n_0_[1]),
        .I2(state_write[2]),
        .I3(state_write[1]),
        .I4(countW_reg_n_0_[2]),
        .O(\countW[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h007F000000800000)) 
    \countW[3]_i_1 
       (.I0(countW_reg_n_0_[2]),
        .I1(countW_reg_n_0_[1]),
        .I2(countW_reg_n_0_[0]),
        .I3(state_write[2]),
        .I4(state_write[1]),
        .I5(countW_reg_n_0_[3]),
        .O(\countW[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFF000080000000)) 
    \countW[4]_i_1 
       (.I0(countW_reg_n_0_[0]),
        .I1(countW_reg_n_0_[1]),
        .I2(countW_reg_n_0_[2]),
        .I3(countW_reg_n_0_[3]),
        .I4(u_u2f_fifo_n_0),
        .I5(countW_reg_n_0_[4]),
        .O(\countW[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF7F000000800000)) 
    \countW[5]_i_1 
       (.I0(countW_reg_n_0_[4]),
        .I1(countW_reg_n_0_[3]),
        .I2(countW_reg_n_0_[2]),
        .I3(\countW[5]_i_2_n_0 ),
        .I4(u_u2f_fifo_n_0),
        .I5(countW_reg_n_0_[5]),
        .O(\countW[5]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \countW[5]_i_2 
       (.I0(countW_reg_n_0_[0]),
        .I1(countW_reg_n_0_[1]),
        .O(\countW[5]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h2010)) 
    \countW[6]_i_1 
       (.I0(\countW[8]_i_3_n_0 ),
        .I1(state_write[2]),
        .I2(state_write[1]),
        .I3(countW_reg_n_0_[6]),
        .O(\countW[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0D000200)) 
    \countW[7]_i_1 
       (.I0(countW_reg_n_0_[6]),
        .I1(\countW[8]_i_3_n_0 ),
        .I2(state_write[2]),
        .I3(state_write[1]),
        .I4(countW_reg_n_0_[7]),
        .O(\countW[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00002000)) 
    \countW[8]_i_1 
       (.I0(state_write[1]),
        .I1(state_write[0]),
        .I2(u2f_rd_ready),
        .I3(u2f_rd_valid),
        .I4(BREADY0),
        .I5(\AWID[3]_i_1_n_0 ),
        .O(\countW[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00BF000000400000)) 
    \countW[8]_i_2 
       (.I0(\countW[8]_i_3_n_0 ),
        .I1(countW_reg_n_0_[6]),
        .I2(countW_reg_n_0_[7]),
        .I3(state_write[2]),
        .I4(state_write[1]),
        .I5(countW_reg_n_0_[8]),
        .O(\countW[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \countW[8]_i_3 
       (.I0(countW_reg_n_0_[0]),
        .I1(countW_reg_n_0_[1]),
        .I2(countW_reg_n_0_[2]),
        .I3(countW_reg_n_0_[3]),
        .I4(countW_reg_n_0_[4]),
        .I5(countW_reg_n_0_[5]),
        .O(\countW[8]_i_3_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \countW_reg[0] 
       (.C(ACLK),
        .CE(\countW[8]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\countW[0]_i_1_n_0 ),
        .Q(countW_reg_n_0_[0]));
  FDCE #(
    .INIT(1'b0)) 
    \countW_reg[1] 
       (.C(ACLK),
        .CE(\countW[8]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\countW[1]_i_1_n_0 ),
        .Q(countW_reg_n_0_[1]));
  FDCE #(
    .INIT(1'b0)) 
    \countW_reg[2] 
       (.C(ACLK),
        .CE(\countW[8]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\countW[2]_i_1_n_0 ),
        .Q(countW_reg_n_0_[2]));
  FDCE #(
    .INIT(1'b0)) 
    \countW_reg[3] 
       (.C(ACLK),
        .CE(\countW[8]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\countW[3]_i_1_n_0 ),
        .Q(countW_reg_n_0_[3]));
  FDCE #(
    .INIT(1'b0)) 
    \countW_reg[4] 
       (.C(ACLK),
        .CE(\countW[8]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\countW[4]_i_1_n_0 ),
        .Q(countW_reg_n_0_[4]));
  FDCE #(
    .INIT(1'b0)) 
    \countW_reg[5] 
       (.C(ACLK),
        .CE(\countW[8]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\countW[5]_i_1_n_0 ),
        .Q(countW_reg_n_0_[5]));
  FDCE #(
    .INIT(1'b0)) 
    \countW_reg[6] 
       (.C(ACLK),
        .CE(\countW[8]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\countW[6]_i_1_n_0 ),
        .Q(countW_reg_n_0_[6]));
  FDCE #(
    .INIT(1'b0)) 
    \countW_reg[7] 
       (.C(ACLK),
        .CE(\countW[8]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\countW[7]_i_1_n_0 ),
        .Q(countW_reg_n_0_[7]));
  FDCE #(
    .INIT(1'b0)) 
    \countW_reg[8] 
       (.C(ACLK),
        .CE(\countW[8]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(\countW[8]_i_2_n_0 ),
        .Q(countW_reg_n_0_[8]));
  LUT5 #(
    .INIT(32'h00000200)) 
    \f2u_int_data[31]_i_1 
       (.I0(CMD[31]),
        .I1(state_read[2]),
        .I2(state_read[1]),
        .I3(read_go),
        .I4(state_read[0]),
        .O(\f2u_int_data[31]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \f2u_int_data_reg[0] 
       (.C(ACLK),
        .CE(\f2u_int_data[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(D[0]),
        .Q(f2u_int_data_reg_n_0_[0]));
  FDCE #(
    .INIT(1'b0)) 
    \f2u_int_data_reg[10] 
       (.C(ACLK),
        .CE(\f2u_int_data[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(D[10]),
        .Q(f2u_int_data_reg_n_0_[10]));
  FDCE #(
    .INIT(1'b0)) 
    \f2u_int_data_reg[11] 
       (.C(ACLK),
        .CE(\f2u_int_data[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(D[11]),
        .Q(f2u_int_data_reg_n_0_[11]));
  FDCE #(
    .INIT(1'b0)) 
    \f2u_int_data_reg[12] 
       (.C(ACLK),
        .CE(\f2u_int_data[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(D[12]),
        .Q(f2u_int_data_reg_n_0_[12]));
  FDCE #(
    .INIT(1'b0)) 
    \f2u_int_data_reg[13] 
       (.C(ACLK),
        .CE(\f2u_int_data[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(D[13]),
        .Q(f2u_int_data_reg_n_0_[13]));
  FDCE #(
    .INIT(1'b0)) 
    \f2u_int_data_reg[14] 
       (.C(ACLK),
        .CE(\f2u_int_data[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(D[14]),
        .Q(f2u_int_data_reg_n_0_[14]));
  FDCE #(
    .INIT(1'b0)) 
    \f2u_int_data_reg[15] 
       (.C(ACLK),
        .CE(\f2u_int_data[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(D[15]),
        .Q(f2u_int_data_reg_n_0_[15]));
  FDCE #(
    .INIT(1'b0)) 
    \f2u_int_data_reg[17] 
       (.C(ACLK),
        .CE(\f2u_int_data[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(1'b1),
        .Q(f2u_int_data_reg_n_0_[17]));
  FDCE #(
    .INIT(1'b0)) 
    \f2u_int_data_reg[19] 
       (.C(ACLK),
        .CE(\f2u_int_data[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(1'b1),
        .Q(f2u_int_data_reg_n_0_[19]));
  FDCE #(
    .INIT(1'b0)) 
    \f2u_int_data_reg[1] 
       (.C(ACLK),
        .CE(\f2u_int_data[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(D[1]),
        .Q(f2u_int_data_reg_n_0_[1]));
  FDCE #(
    .INIT(1'b0)) 
    \f2u_int_data_reg[24] 
       (.C(ACLK),
        .CE(\f2u_int_data[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(D[16]),
        .Q(f2u_int_data_reg_n_0_[24]));
  FDCE #(
    .INIT(1'b0)) 
    \f2u_int_data_reg[25] 
       (.C(ACLK),
        .CE(\f2u_int_data[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(D[17]),
        .Q(f2u_int_data_reg_n_0_[25]));
  FDCE #(
    .INIT(1'b0)) 
    \f2u_int_data_reg[26] 
       (.C(ACLK),
        .CE(\f2u_int_data[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(D[18]),
        .Q(f2u_int_data_reg_n_0_[26]));
  FDCE #(
    .INIT(1'b0)) 
    \f2u_int_data_reg[27] 
       (.C(ACLK),
        .CE(\f2u_int_data[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(D[19]),
        .Q(f2u_int_data_reg_n_0_[27]));
  FDCE #(
    .INIT(1'b0)) 
    \f2u_int_data_reg[28] 
       (.C(ACLK),
        .CE(\f2u_int_data[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(last_resp[0]),
        .Q(f2u_int_data_reg_n_0_[28]));
  FDCE #(
    .INIT(1'b0)) 
    \f2u_int_data_reg[29] 
       (.C(ACLK),
        .CE(\f2u_int_data[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(last_resp[1]),
        .Q(f2u_int_data_reg_n_0_[29]));
  FDCE #(
    .INIT(1'b0)) 
    \f2u_int_data_reg[2] 
       (.C(ACLK),
        .CE(\f2u_int_data[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(D[2]),
        .Q(f2u_int_data_reg_n_0_[2]));
  FDCE #(
    .INIT(1'b0)) 
    \f2u_int_data_reg[30] 
       (.C(ACLK),
        .CE(\f2u_int_data[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(D[20]),
        .Q(f2u_int_data_reg_n_0_[30]));
  FDCE #(
    .INIT(1'b0)) 
    \f2u_int_data_reg[31] 
       (.C(ACLK),
        .CE(\f2u_int_data[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(D[21]),
        .Q(f2u_int_data_reg_n_0_[31]));
  FDCE #(
    .INIT(1'b0)) 
    \f2u_int_data_reg[3] 
       (.C(ACLK),
        .CE(\f2u_int_data[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(D[3]),
        .Q(f2u_int_data_reg_n_0_[3]));
  FDCE #(
    .INIT(1'b0)) 
    \f2u_int_data_reg[4] 
       (.C(ACLK),
        .CE(\f2u_int_data[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(D[4]),
        .Q(f2u_int_data_reg_n_0_[4]));
  FDCE #(
    .INIT(1'b0)) 
    \f2u_int_data_reg[5] 
       (.C(ACLK),
        .CE(\f2u_int_data[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(D[5]),
        .Q(f2u_int_data_reg_n_0_[5]));
  FDCE #(
    .INIT(1'b0)) 
    \f2u_int_data_reg[6] 
       (.C(ACLK),
        .CE(\f2u_int_data[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(D[6]),
        .Q(f2u_int_data_reg_n_0_[6]));
  FDCE #(
    .INIT(1'b0)) 
    \f2u_int_data_reg[7] 
       (.C(ACLK),
        .CE(\f2u_int_data[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(D[7]),
        .Q(f2u_int_data_reg_n_0_[7]));
  FDCE #(
    .INIT(1'b0)) 
    \f2u_int_data_reg[8] 
       (.C(ACLK),
        .CE(\f2u_int_data[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(D[8]),
        .Q(f2u_int_data_reg_n_0_[8]));
  FDCE #(
    .INIT(1'b0)) 
    \f2u_int_data_reg[9] 
       (.C(ACLK),
        .CE(\f2u_int_data[31]_i_1_n_0 ),
        .CLR(u_u2f_fifo_n_3),
        .D(D[9]),
        .Q(f2u_int_data_reg_n_0_[9]));
  CARRY4 get_next_addr_rd0_carry
       (.CI(1'b0),
        .CO({get_next_addr_rd0_carry_n_0,get_next_addr_rd0_carry_n_1,get_next_addr_rd0_carry_n_2,get_next_addr_rd0_carry_n_3}),
        .CYINIT(addrR_reg_n_0_[2]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({get_next_addr_rd0_carry_n_4,get_next_addr_rd0_carry_n_5,get_next_addr_rd0_carry_n_6,get_next_addr_rd0_carry_n_7}),
        .S(addrR_reg_n_0_[6:3]));
  CARRY4 get_next_addr_rd0_carry__0
       (.CI(get_next_addr_rd0_carry_n_0),
        .CO({get_next_addr_rd0_carry__0_n_0,get_next_addr_rd0_carry__0_n_1,get_next_addr_rd0_carry__0_n_2,get_next_addr_rd0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({get_next_addr_rd0_carry__0_n_4,get_next_addr_rd0_carry__0_n_5,get_next_addr_rd0_carry__0_n_6,get_next_addr_rd0_carry__0_n_7}),
        .S(addrR_reg_n_0_[10:7]));
  CARRY4 get_next_addr_rd0_carry__1
       (.CI(get_next_addr_rd0_carry__0_n_0),
        .CO({get_next_addr_rd0_carry__1_n_0,get_next_addr_rd0_carry__1_n_1,get_next_addr_rd0_carry__1_n_2,get_next_addr_rd0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({get_next_addr_rd0_carry__1_n_4,get_next_addr_rd0_carry__1_n_5,get_next_addr_rd0_carry__1_n_6,get_next_addr_rd0_carry__1_n_7}),
        .S(addrR_reg_n_0_[14:11]));
  CARRY4 get_next_addr_rd0_carry__2
       (.CI(get_next_addr_rd0_carry__1_n_0),
        .CO({get_next_addr_rd0_carry__2_n_0,get_next_addr_rd0_carry__2_n_1,get_next_addr_rd0_carry__2_n_2,get_next_addr_rd0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({get_next_addr_rd0_carry__2_n_4,get_next_addr_rd0_carry__2_n_5,get_next_addr_rd0_carry__2_n_6,get_next_addr_rd0_carry__2_n_7}),
        .S(addrR_reg_n_0_[18:15]));
  CARRY4 get_next_addr_rd0_carry__3
       (.CI(get_next_addr_rd0_carry__2_n_0),
        .CO({get_next_addr_rd0_carry__3_n_0,get_next_addr_rd0_carry__3_n_1,get_next_addr_rd0_carry__3_n_2,get_next_addr_rd0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({get_next_addr_rd0_carry__3_n_4,get_next_addr_rd0_carry__3_n_5,get_next_addr_rd0_carry__3_n_6,get_next_addr_rd0_carry__3_n_7}),
        .S(addrR_reg_n_0_[22:19]));
  CARRY4 get_next_addr_rd0_carry__4
       (.CI(get_next_addr_rd0_carry__3_n_0),
        .CO({get_next_addr_rd0_carry__4_n_0,get_next_addr_rd0_carry__4_n_1,get_next_addr_rd0_carry__4_n_2,get_next_addr_rd0_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({get_next_addr_rd0_carry__4_n_4,get_next_addr_rd0_carry__4_n_5,get_next_addr_rd0_carry__4_n_6,get_next_addr_rd0_carry__4_n_7}),
        .S(addrR_reg_n_0_[26:23]));
  CARRY4 get_next_addr_rd0_carry__5
       (.CI(get_next_addr_rd0_carry__4_n_0),
        .CO({get_next_addr_rd0_carry__5_n_0,get_next_addr_rd0_carry__5_n_1,get_next_addr_rd0_carry__5_n_2,get_next_addr_rd0_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({get_next_addr_rd0_carry__5_n_4,get_next_addr_rd0_carry__5_n_5,get_next_addr_rd0_carry__5_n_6,get_next_addr_rd0_carry__5_n_7}),
        .S(addrR_reg_n_0_[30:27]));
  CARRY4 get_next_addr_rd0_carry__6
       (.CI(get_next_addr_rd0_carry__5_n_0),
        .CO(NLW_get_next_addr_rd0_carry__6_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_get_next_addr_rd0_carry__6_O_UNCONNECTED[3:1],get_next_addr_rd0_carry__6_n_7}),
        .S({1'b0,1'b0,1'b0,addrR_reg_n_0_[31]}));
  CARRY4 get_next_addr_wr0_carry
       (.CI(1'b0),
        .CO({get_next_addr_wr0_carry_n_0,get_next_addr_wr0_carry_n_1,get_next_addr_wr0_carry_n_2,get_next_addr_wr0_carry_n_3}),
        .CYINIT(addr[2]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({get_next_addr_wr0_carry_n_4,get_next_addr_wr0_carry_n_5,get_next_addr_wr0_carry_n_6,get_next_addr_wr0_carry_n_7}),
        .S(addr[6:3]));
  CARRY4 get_next_addr_wr0_carry__0
       (.CI(get_next_addr_wr0_carry_n_0),
        .CO({get_next_addr_wr0_carry__0_n_0,get_next_addr_wr0_carry__0_n_1,get_next_addr_wr0_carry__0_n_2,get_next_addr_wr0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({get_next_addr_wr0_carry__0_n_4,get_next_addr_wr0_carry__0_n_5,get_next_addr_wr0_carry__0_n_6,get_next_addr_wr0_carry__0_n_7}),
        .S(addr[10:7]));
  CARRY4 get_next_addr_wr0_carry__1
       (.CI(get_next_addr_wr0_carry__0_n_0),
        .CO({get_next_addr_wr0_carry__1_n_0,get_next_addr_wr0_carry__1_n_1,get_next_addr_wr0_carry__1_n_2,get_next_addr_wr0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({get_next_addr_wr0_carry__1_n_4,get_next_addr_wr0_carry__1_n_5,get_next_addr_wr0_carry__1_n_6,get_next_addr_wr0_carry__1_n_7}),
        .S(addr[14:11]));
  CARRY4 get_next_addr_wr0_carry__2
       (.CI(get_next_addr_wr0_carry__1_n_0),
        .CO({get_next_addr_wr0_carry__2_n_0,get_next_addr_wr0_carry__2_n_1,get_next_addr_wr0_carry__2_n_2,get_next_addr_wr0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({get_next_addr_wr0_carry__2_n_4,get_next_addr_wr0_carry__2_n_5,get_next_addr_wr0_carry__2_n_6,get_next_addr_wr0_carry__2_n_7}),
        .S(addr[18:15]));
  CARRY4 get_next_addr_wr0_carry__3
       (.CI(get_next_addr_wr0_carry__2_n_0),
        .CO({get_next_addr_wr0_carry__3_n_0,get_next_addr_wr0_carry__3_n_1,get_next_addr_wr0_carry__3_n_2,get_next_addr_wr0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({get_next_addr_wr0_carry__3_n_4,get_next_addr_wr0_carry__3_n_5,get_next_addr_wr0_carry__3_n_6,get_next_addr_wr0_carry__3_n_7}),
        .S(addr[22:19]));
  CARRY4 get_next_addr_wr0_carry__4
       (.CI(get_next_addr_wr0_carry__3_n_0),
        .CO({get_next_addr_wr0_carry__4_n_0,get_next_addr_wr0_carry__4_n_1,get_next_addr_wr0_carry__4_n_2,get_next_addr_wr0_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({get_next_addr_wr0_carry__4_n_4,get_next_addr_wr0_carry__4_n_5,get_next_addr_wr0_carry__4_n_6,get_next_addr_wr0_carry__4_n_7}),
        .S(addr[26:23]));
  CARRY4 get_next_addr_wr0_carry__5
       (.CI(get_next_addr_wr0_carry__4_n_0),
        .CO({get_next_addr_wr0_carry__5_n_0,get_next_addr_wr0_carry__5_n_1,get_next_addr_wr0_carry__5_n_2,get_next_addr_wr0_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({get_next_addr_wr0_carry__5_n_4,get_next_addr_wr0_carry__5_n_5,get_next_addr_wr0_carry__5_n_6,get_next_addr_wr0_carry__5_n_7}),
        .S(addr[30:27]));
  CARRY4 get_next_addr_wr0_carry__6
       (.CI(get_next_addr_wr0_carry__5_n_0),
        .CO(NLW_get_next_addr_wr0_carry__6_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_get_next_addr_wr0_carry__6_O_UNCONNECTED[3:1],get_next_addr_wr0_carry__6_n_7}),
        .S({1'b0,1'b0,1'b0,addr[31]}));
  FDCE #(
    .INIT(1'b0)) 
    \last_resp_reg[0] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(u_f2u_fifo_n_9),
        .Q(last_resp[0]));
  FDCE #(
    .INIT(1'b0)) 
    \last_resp_reg[1] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(u_f2u_fifo_n_8),
        .Q(last_resp[1]));
  FDCE #(
    .INIT(1'b0)) 
    read_done_reg
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(u_f2u_fifo_n_7),
        .Q(read_done_reg_n_0));
  LUT6 #(
    .INIT(64'h040FFFFF040F0000)) 
    read_go_i_1
       (.I0(state_cmd[2]),
        .I1(\state_cmd[0]_i_4_n_0 ),
        .I2(state_cmd[1]),
        .I3(state_cmd[0]),
        .I4(read_go_i_2_n_0),
        .I5(read_go),
        .O(read_go_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFF4F000F004F050)) 
    read_go_i_2
       (.I0(CMD[30]),
        .I1(\state_cmd[0]_i_4_n_0 ),
        .I2(state_cmd[2]),
        .I3(state_cmd[1]),
        .I4(state_cmd[0]),
        .I5(read_done_reg_n_0),
        .O(read_go_i_2_n_0));
  FDCE #(
    .INIT(1'b0)) 
    read_go_reg
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(read_go_i_1_n_0),
        .Q(read_go));
  LUT6 #(
    .INIT(64'hAAABAAAAABABABAA)) 
    \state_cmd[0]_i_1 
       (.I0(\state_cmd[0]_i_2_n_0 ),
        .I1(state_cmd[2]),
        .I2(state_cmd[1]),
        .I3(state_cmd[0]),
        .I4(CMD1__2),
        .I5(\state_cmd[0]_i_4_n_0 ),
        .O(p_0_in__1[0]));
  LUT5 #(
    .INIT(32'h03013500)) 
    \state_cmd[0]_i_2 
       (.I0(CMD[30]),
        .I1(read_done_reg_n_0),
        .I2(state_cmd[1]),
        .I3(state_cmd[0]),
        .I4(state_cmd[2]),
        .O(\state_cmd[0]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hEA)) 
    \state_cmd[0]_i_4 
       (.I0(CMD[31]),
        .I1(cmd_rd_valid),
        .I2(cmd_rd_ready),
        .O(\state_cmd[0]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hABAAAAAA)) 
    \state_cmd[1]_i_1 
       (.I0(\state_cmd[1]_i_2_n_0 ),
        .I1(state_cmd[2]),
        .I2(state_cmd[1]),
        .I3(state_cmd[0]),
        .I4(\state_cmd[1]_i_3_n_0 ),
        .O(p_0_in__1[1]));
  LUT6 #(
    .INIT(64'h00000C0C002C103C)) 
    \state_cmd[1]_i_2 
       (.I0(CMD[30]),
        .I1(state_cmd[1]),
        .I2(state_cmd[2]),
        .I3(write_done),
        .I4(read_done_reg_n_0),
        .I5(state_cmd[0]),
        .O(\state_cmd[1]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \state_cmd[1]_i_3 
       (.I0(cmd_rd_valid),
        .I1(cmd_rd_ready),
        .I2(CMD[31]),
        .O(\state_cmd[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFF40)) 
    \state_cmd[2]_i_1 
       (.I0(CMD[30]),
        .I1(CMD[31]),
        .I2(\state_cmd[2]_i_2_n_0 ),
        .I3(\state_cmd[2]_i_3_n_0 ),
        .I4(\state_cmd[2]_i_4_n_0 ),
        .I5(\state_cmd[2]_i_5_n_0 ),
        .O(p_0_in__1[2]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \state_cmd[2]_i_2 
       (.I0(state_cmd[2]),
        .I1(state_cmd[0]),
        .I2(state_cmd[1]),
        .O(\state_cmd[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \state_cmd[2]_i_3 
       (.I0(state_cmd[2]),
        .I1(state_cmd[0]),
        .I2(state_cmd[1]),
        .I3(\state_cmd[2]_i_6_n_0 ),
        .O(\state_cmd[2]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h0200)) 
    \state_cmd[2]_i_4 
       (.I0(state_cmd[0]),
        .I1(read_done_reg_n_0),
        .I2(state_cmd[1]),
        .I3(state_cmd[2]),
        .O(\state_cmd[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00A0002000800000)) 
    \state_cmd[2]_i_5 
       (.I0(\CLENG_reg[11]_i_5_n_0 ),
        .I1(state_cmd[0]),
        .I2(state_cmd[1]),
        .I3(state_cmd[2]),
        .I4(read_done_reg_n_0),
        .I5(write_done),
        .O(\state_cmd[2]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \state_cmd[2]_i_6 
       (.I0(write_done),
        .I1(CMD[30]),
        .I2(read_done_reg_n_0),
        .O(\state_cmd[2]_i_6_n_0 ));
  (* FSM_ENCODED_STATES = "SC_IDLE:000,SC_CMD:001,SC_WR_WAIT:010,SC_RD_WAIT:011,SC_BURST:100,SC_IE_WAIT:101" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \state_cmd_reg[0] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(p_0_in__1[0]),
        .Q(state_cmd[0]));
  (* FSM_ENCODED_STATES = "SC_IDLE:000,SC_CMD:001,SC_WR_WAIT:010,SC_RD_WAIT:011,SC_BURST:100,SC_IE_WAIT:101" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \state_cmd_reg[1] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(p_0_in__1[1]),
        .Q(state_cmd[1]));
  (* FSM_ENCODED_STATES = "SC_IDLE:000,SC_CMD:001,SC_WR_WAIT:010,SC_RD_WAIT:011,SC_BURST:100,SC_IE_WAIT:101" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \state_cmd_reg[2] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(p_0_in__1[2]),
        .Q(state_cmd[2]));
  LUT6 #(
    .INIT(64'h000B000800080008)) 
    \state_read[1]_i_2 
       (.I0(ARREADY),
        .I1(state_read[0]),
        .I2(state_read[2]),
        .I3(state_read[1]),
        .I4(CMD[31]),
        .I5(read_go),
        .O(\state_read[1]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "SR_IDLE:000,SR_ARB:001,SR_RD:010,SR_END:100,SR_INT:011" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \state_read_reg[0] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(p_0_in__0[0]),
        .Q(state_read[0]));
  (* FSM_ENCODED_STATES = "SR_IDLE:000,SR_ARB:001,SR_RD:010,SR_END:100,SR_INT:011" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \state_read_reg[1] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(p_0_in__0[1]),
        .Q(state_read[1]));
  (* FSM_ENCODED_STATES = "SR_IDLE:000,SR_ARB:001,SR_RD:010,SR_END:100,SR_INT:011" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \state_read_reg[2] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(p_0_in__0[2]),
        .Q(state_read[2]));
  LUT6 #(
    .INIT(64'h0C080F080F080F08)) 
    \state_write[1]_i_1 
       (.I0(AWREADY),
        .I1(state_write[0]),
        .I2(state_write[2]),
        .I3(state_write[1]),
        .I4(BREADY1__0),
        .I5(BREADY0),
        .O(p_0_in__2[1]));
  LUT6 #(
    .INIT(64'hF0F4F0F0F0F0F0F0)) 
    \state_write[2]_i_1 
       (.I0(state_write[2]),
        .I1(state_write[1]),
        .I2(\state_write[2]_i_2_n_0 ),
        .I3(state_write[0]),
        .I4(BREADY0),
        .I5(BREADY1__0),
        .O(p_0_in__2[2]));
  LUT4 #(
    .INIT(16'h00B0)) 
    \state_write[2]_i_2 
       (.I0(write_go_reg_n_0),
        .I1(state_write[0]),
        .I2(state_write[2]),
        .I3(state_write[1]),
        .O(\state_write[2]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "SW_IDLE:000,SW_ARB:001,SW_WR0:010,SW_WR1:011,SW_WR2:100,SW_END:101" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \state_write_reg[0] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(p_0_in__2[0]),
        .Q(state_write[0]));
  (* FSM_ENCODED_STATES = "SW_IDLE:000,SW_ARB:001,SW_WR0:010,SW_WR1:011,SW_WR2:100,SW_END:101" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \state_write_reg[1] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(p_0_in__2[1]),
        .Q(state_write[1]));
  (* FSM_ENCODED_STATES = "SW_IDLE:000,SW_ARB:001,SW_WR0:010,SW_WR1:011,SW_WR2:100,SW_END:101" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \state_write_reg[2] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(p_0_in__2[2]),
        .Q(state_write[2]));
  LUT4 #(
    .INIT(16'hCC20)) 
    u2f_ready_i_3
       (.I0(AWREADY),
        .I1(state_write[2]),
        .I2(state_write[0]),
        .I3(state_write[1]),
        .O(u2f_ready_i_3_n_0));
  FDCE #(
    .INIT(1'b0)) 
    u2f_ready_reg
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(u_u2f_fifo_n_4),
        .Q(u2f_rd_ready));
  design_riscv_cache_bfm_axi_if_0_0_trx_fifo_sync_small__parameterized0 u_f2u_fifo
       (.ACLK(ACLK),
        .ACLK_0(ACLK_0),
        .ARREADY(ARREADY),
        .BRESP(BRESP),
        .BVALID(BVALID),
        .CO(countR1),
        .D(p_0_in__0),
        .E(u_f2u_fifo_n_1),
        .Mem_reg_0_15_0_5_i_3_0(CMD[26:23]),
        .Mem_reg_0_15_0_5_i_3_1(addrR_reg_n_0_[1:0]),
        .Mem_reg_0_15_30_31_0({f2u_int_data_reg_n_0_[31:24],f2u_int_data_reg_n_0_[19],f2u_int_data_reg_n_0_[17],f2u_int_data_reg_n_0_[15:0]}),
        .Q(state_read),
        .RDATA(RDATA),
        .RREADY(RREADY),
        .RRESP(RRESP),
        .RRESP_0_sp_1(u_f2u_fifo_n_9),
        .RRESP_1_sp_1(u_f2u_fifo_n_8),
        .RVALID(RVALID),
        .addrR_reg(\ARID[3]_i_1_n_0 ),
        .f2u_wr_ready(f2u_wr_ready),
        .f2u_wr_valid(f2u_wr_valid),
        .last_resp_reg(BREADY_reg_0),
        .\last_resp_reg[1] (last_resp),
        .\next_tail_reg[1]_0 (u_u2f_fifo_n_3),
        .out(state_read),
        .read_done_reg(read_done_reg_n_0),
        .read_go(read_go),
        .state_read_reg(\countR[5]_i_3_n_0 ),
        .\state_read_reg[1] (u_f2u_fifo_n_2),
        .\state_read_reg[1]_0 (u_f2u_fifo_n_7),
        .\state_read_reg[1]_1 (\state_read[1]_i_2_n_0 ));
  design_riscv_cache_bfm_axi_if_0_0_trx_fifo_sync_small u_u2f_fifo
       (.ACLK(ACLK),
        .ARESETn(ARESETn),
        .ARESETn_0(u_u2f_fifo_n_3),
        .AWREADY(AWREADY),
        .BREADY0_carry__0(countW_reg_n_0_[8]),
        .BREADY1__0(BREADY1__0),
        .BVALID(BVALID),
        .CO(BREADY0),
        .D(p_0_in__2[0]),
        .Q(state_write),
        .S(u_u2f_fifo_n_2),
        .\WDATA[1] ({CMD[26:25],CMD[15:12]}),
        .\WDATA[1]_0 (addr[1:0]),
        .WLAST(WLAST),
        .WREADY(WREADY),
        .WVALID(WVALID),
        .\fifo_tail_reg[4]_0 (u2f_rd_ready),
        .out(state_write),
        .rd_dout(rd_dout),
        .state_write_reg_bb1(u_u2f_fifo_n_0),
        .state_write_reg_bb0(write_go_reg_n_0),
        .\state_write_reg[1]_0 (u_u2f_fifo_n_4),
        .u2f_rd_data(u2f_rd_data),
        .u2f_rd_valid(u2f_rd_valid),
        .u2f_ready_reg(u2f_ready_i_3_n_0));
  LUT6 #(
    .INIT(64'h3333BFBF00000C00)) 
    write_done_i_1
       (.I0(write_go_reg_n_0),
        .I1(state_write[2]),
        .I2(state_write[0]),
        .I3(BVALID),
        .I4(state_write[1]),
        .I5(write_done),
        .O(write_done_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    write_done_reg
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(write_done_i_1_n_0),
        .Q(write_done));
  LUT4 #(
    .INIT(16'h2F20)) 
    write_go_i_1
       (.I0(CMD[30]),
        .I1(state_cmd[1]),
        .I2(write_go_i_2_n_0),
        .I3(write_go_reg_n_0),
        .O(write_go_i_1_n_0));
  LUT6 #(
    .INIT(64'hF8F8F8FC88F88888)) 
    write_go_i_2
       (.I0(\CLENG_reg[11]_i_3_n_0 ),
        .I1(CMD[30]),
        .I2(state_cmd[1]),
        .I3(state_cmd[0]),
        .I4(write_done),
        .I5(state_cmd[2]),
        .O(write_go_i_2_n_0));
  FDCE #(
    .INIT(1'b0)) 
    write_go_reg
       (.C(ACLK),
        .CE(1'b1),
        .CLR(u_u2f_fifo_n_3),
        .D(write_go_i_1_n_0),
        .Q(write_go_reg_n_0));
endmodule

(* ORIG_REF_NAME = "trx_fifo_sync_small" *) 
module design_riscv_cache_bfm_axi_if_0_0_trx_fifo_sync_small
   (state_write_reg_bb0,
    state_write_reg_bb1,
    ACLK,
    ARESETn,
    ARESETn_0,
    AWREADY,
    BREADY1__0,
    BVALID,
    WLAST,
    WREADY,
    WVALID,
    \fifo_tail_reg[4]_0 ,
    \state_write_reg[1]_0 ,
    u2f_rd_valid,
    u2f_ready_reg,
    BREADY0_carry__0,
    CO,
    D,
    Q,
    S,
    \WDATA[1] ,
    \WDATA[1]_0 ,
    out,
    rd_dout,
    u2f_rd_data);
  input ACLK;
  input ARESETn;
  output ARESETn_0;
  input AWREADY;
  input BREADY1__0;
  input BVALID;
  output WLAST;
  input WREADY;
  output WVALID;
  input \fifo_tail_reg[4]_0 ;
  output \state_write_reg[1]_0 ;
  input u2f_rd_valid;
  input u2f_ready_reg;
  input [0:0]BREADY0_carry__0;
  input [0:0]CO;
  output [0:0]D;
  input [2:0]Q;
  output [0:0]S;
  input [5:0]\WDATA[1] ;
  input [1:0]\WDATA[1]_0 ;
  input [2:0]out;
  output [39:0]rd_dout;
  input [31:0]u2f_rd_data;
  input state_write_reg_bb0;
  output state_write_reg_bb1;

  wire ACLK;
  wire ARESETn;
  wire ARESETn_0;
  wire AWREADY;
  wire [0:0]BREADY0_carry__0;
  wire BREADY1__0;
  wire BVALID;
  wire [0:0]CO;
  wire [0:0]D;
  wire Mem_reg_0_15_30_35_i_7_n_0;
  wire Mem_reg_0_15_30_35_i_8_n_0;
  wire Mem_reg_0_15_36_40_i_1_n_0;
  wire [2:0]Q;
  wire [0:0]S;
  wire [5:0]\WDATA[1] ;
  wire [1:0]\WDATA[1]_0 ;
  wire WLAST;
  wire WLAST_INST_0_i_1_n_0;
  wire WREADY;
  wire WVALID;
  wire [4:0]fifo_head;
  wire fifo_head0;
  wire \fifo_head[4]_i_2__0_n_0 ;
  wire [3:0]fifo_head_reg_rep;
  wire [4:0]fifo_tail;
  wire \fifo_tail_reg[4]_0 ;
  wire n_0_807;
  wire \next_head[0]_i_1_n_0 ;
  wire \next_head[1]_i_1__0_n_0 ;
  wire \next_head[2]_i_1__0_n_0 ;
  wire \next_head[3]_i_1__0_n_0 ;
  wire \next_head[4]_i_1__0_n_0 ;
  wire [4:0]next_head_reg;
  wire \next_tail[0]_i_1_n_0 ;
  wire \next_tail[1]_i_1_n_0 ;
  wire \next_tail[2]_i_1_n_0 ;
  wire \next_tail[3]_i_1__0_n_0 ;
  wire \next_tail[4]_i_1__0_n_0 ;
  wire [4:0]next_tail_reg;
  wire [2:0]out;
  wire rd_cnt13_out;
  wire \rd_cnt[0]_i_1__0_n_0 ;
  wire \rd_cnt[1]_i_1__0_n_0 ;
  wire \rd_cnt[2]_i_1_n_0 ;
  wire \rd_cnt[3]_i_1_n_0 ;
  wire \rd_cnt[4]_i_1_n_0 ;
  wire \rd_cnt[4]_i_2_n_0 ;
  wire \rd_cnt[4]_i_3__0_n_0 ;
  wire [4:0]rd_cnt_reg_n_0_;
  wire [39:0]rd_dout;
  wire \state_write[0]_i_2_n_0 ;
  wire \state_write[0]_i_3_n_0 ;
  wire \state_write[0]_i_4_n_0 ;
  wire [1:0]\^state_write_reg ;
  wire \state_write_reg[1]_0 ;
  wire u2f_fifo_fullN;
  wire [40:40]u2f_fifo_rd_dat;
  wire [35:0]u2f_fifo_wr_dat;
  wire [31:0]u2f_rd_data;
  wire u2f_rd_valid;
  wire u2f_ready_i_2_n_0;
  wire u2f_ready_reg;
  wire [1:0]NLW_Mem_reg_0_15_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_Mem_reg_0_15_12_17_DOD_UNCONNECTED;
  wire [1:0]NLW_Mem_reg_0_15_18_23_DOD_UNCONNECTED;
  wire [1:0]NLW_Mem_reg_0_15_24_29_DOD_UNCONNECTED;
  wire [1:0]NLW_Mem_reg_0_15_30_35_DOD_UNCONNECTED;
  wire [1:1]NLW_Mem_reg_0_15_36_40_DOC_UNCONNECTED;
  wire [1:0]NLW_Mem_reg_0_15_36_40_DOD_UNCONNECTED;
  wire [1:0]NLW_Mem_reg_0_15_6_11_DOD_UNCONNECTED;

  assign \^state_write_reg [0] = state_write_reg_bb0;
  assign state_write_reg_bb1 = \^state_write_reg [1];
  LUT1 #(
    .INIT(2'h1)) 
    \AWID[3]_i_3 
       (.I0(ARESETn),
        .O(ARESETn_0));
  LUT1 #(
    .INIT(2'h1)) 
    BREADY0_carry__0_i_1
       (.I0(BREADY0_carry__0),
        .O(S));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "656" *) 
  (* RTL_RAM_NAME = "u_trx_axi/u_u2f_fifo/Mem" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "5" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    Mem_reg_0_15_0_5
       (.ADDRA({1'b0,fifo_head_reg_rep}),
        .ADDRB({1'b0,fifo_head_reg_rep}),
        .ADDRC({1'b0,fifo_head_reg_rep}),
        .ADDRD({1'b0,fifo_tail[3:0]}),
        .DIA(u2f_fifo_wr_dat[1:0]),
        .DIB(u2f_fifo_wr_dat[3:2]),
        .DIC(u2f_fifo_wr_dat[5:4]),
        .DID({1'b0,1'b0}),
        .DOA(rd_dout[1:0]),
        .DOB(rd_dout[3:2]),
        .DOC(rd_dout[5:4]),
        .DOD(NLW_Mem_reg_0_15_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(ACLK),
        .WE(Mem_reg_0_15_36_40_i_1_n_0));
  LUT5 #(
    .INIT(32'hAAEF0000)) 
    Mem_reg_0_15_0_5_i_1
       (.I0(\WDATA[1] [5]),
        .I1(\WDATA[1] [4]),
        .I2(\WDATA[1]_0 [0]),
        .I3(\WDATA[1]_0 [1]),
        .I4(u2f_rd_data[1]),
        .O(u2f_fifo_wr_dat[1]));
  LUT5 #(
    .INIT(32'hAAEF0000)) 
    Mem_reg_0_15_0_5_i_2__0
       (.I0(\WDATA[1] [5]),
        .I1(\WDATA[1] [4]),
        .I2(\WDATA[1]_0 [0]),
        .I3(\WDATA[1]_0 [1]),
        .I4(u2f_rd_data[0]),
        .O(u2f_fifo_wr_dat[0]));
  LUT5 #(
    .INIT(32'hAAEF0000)) 
    Mem_reg_0_15_0_5_i_3__0
       (.I0(\WDATA[1] [5]),
        .I1(\WDATA[1] [4]),
        .I2(\WDATA[1]_0 [0]),
        .I3(\WDATA[1]_0 [1]),
        .I4(u2f_rd_data[3]),
        .O(u2f_fifo_wr_dat[3]));
  LUT5 #(
    .INIT(32'hAAEF0000)) 
    Mem_reg_0_15_0_5_i_4__0
       (.I0(\WDATA[1] [5]),
        .I1(\WDATA[1] [4]),
        .I2(\WDATA[1]_0 [0]),
        .I3(\WDATA[1]_0 [1]),
        .I4(u2f_rd_data[2]),
        .O(u2f_fifo_wr_dat[2]));
  LUT5 #(
    .INIT(32'hAAEF0000)) 
    Mem_reg_0_15_0_5_i_5__0
       (.I0(\WDATA[1] [5]),
        .I1(\WDATA[1] [4]),
        .I2(\WDATA[1]_0 [0]),
        .I3(\WDATA[1]_0 [1]),
        .I4(u2f_rd_data[5]),
        .O(u2f_fifo_wr_dat[5]));
  LUT5 #(
    .INIT(32'hAAEF0000)) 
    Mem_reg_0_15_0_5_i_6__0
       (.I0(\WDATA[1] [5]),
        .I1(\WDATA[1] [4]),
        .I2(\WDATA[1]_0 [0]),
        .I3(\WDATA[1]_0 [1]),
        .I4(u2f_rd_data[4]),
        .O(u2f_fifo_wr_dat[4]));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "656" *) 
  (* RTL_RAM_NAME = "u_trx_axi/u_u2f_fifo/Mem" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "17" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    Mem_reg_0_15_12_17
       (.ADDRA({1'b0,fifo_head_reg_rep}),
        .ADDRB({1'b0,fifo_head_reg_rep}),
        .ADDRC({1'b0,fifo_head_reg_rep}),
        .ADDRD({1'b0,fifo_tail[3:0]}),
        .DIA(u2f_fifo_wr_dat[13:12]),
        .DIB(u2f_fifo_wr_dat[15:14]),
        .DIC(u2f_fifo_wr_dat[17:16]),
        .DID({1'b0,1'b0}),
        .DOA(rd_dout[13:12]),
        .DOB(rd_dout[15:14]),
        .DOC(rd_dout[17:16]),
        .DOD(NLW_Mem_reg_0_15_12_17_DOD_UNCONNECTED[1:0]),
        .WCLK(ACLK),
        .WE(Mem_reg_0_15_36_40_i_1_n_0));
  LUT6 #(
    .INIT(64'hF0F0F0F000F00088)) 
    Mem_reg_0_15_12_17_i_1__0
       (.I0(u2f_rd_data[5]),
        .I1(\WDATA[1]_0 [0]),
        .I2(u2f_rd_data[13]),
        .I3(\WDATA[1]_0 [1]),
        .I4(\WDATA[1] [4]),
        .I5(\WDATA[1] [5]),
        .O(u2f_fifo_wr_dat[13]));
  LUT6 #(
    .INIT(64'hF0F0F0F000F00088)) 
    Mem_reg_0_15_12_17_i_2__0
       (.I0(u2f_rd_data[4]),
        .I1(\WDATA[1]_0 [0]),
        .I2(u2f_rd_data[12]),
        .I3(\WDATA[1]_0 [1]),
        .I4(\WDATA[1] [4]),
        .I5(\WDATA[1] [5]),
        .O(u2f_fifo_wr_dat[12]));
  LUT6 #(
    .INIT(64'hF0F0F0F000F00088)) 
    Mem_reg_0_15_12_17_i_3__0
       (.I0(u2f_rd_data[7]),
        .I1(\WDATA[1]_0 [0]),
        .I2(u2f_rd_data[15]),
        .I3(\WDATA[1]_0 [1]),
        .I4(\WDATA[1] [4]),
        .I5(\WDATA[1] [5]),
        .O(u2f_fifo_wr_dat[15]));
  LUT6 #(
    .INIT(64'hF0F0F0F000F00088)) 
    Mem_reg_0_15_12_17_i_4__0
       (.I0(u2f_rd_data[6]),
        .I1(\WDATA[1]_0 [0]),
        .I2(u2f_rd_data[14]),
        .I3(\WDATA[1]_0 [1]),
        .I4(\WDATA[1] [4]),
        .I5(\WDATA[1] [5]),
        .O(u2f_fifo_wr_dat[14]));
  LUT6 #(
    .INIT(64'hFF00A0A0FF002020)) 
    Mem_reg_0_15_12_17_i_5__0
       (.I0(u2f_rd_data[1]),
        .I1(\WDATA[1]_0 [0]),
        .I2(\WDATA[1]_0 [1]),
        .I3(u2f_rd_data[17]),
        .I4(\WDATA[1] [5]),
        .I5(\WDATA[1] [4]),
        .O(u2f_fifo_wr_dat[17]));
  LUT6 #(
    .INIT(64'hFF00A0A0FF002020)) 
    Mem_reg_0_15_12_17_i_6__0
       (.I0(u2f_rd_data[0]),
        .I1(\WDATA[1]_0 [0]),
        .I2(\WDATA[1]_0 [1]),
        .I3(u2f_rd_data[16]),
        .I4(\WDATA[1] [5]),
        .I5(\WDATA[1] [4]),
        .O(u2f_fifo_wr_dat[16]));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "656" *) 
  (* RTL_RAM_NAME = "u_trx_axi/u_u2f_fifo/Mem" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "23" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    Mem_reg_0_15_18_23
       (.ADDRA({1'b0,fifo_head_reg_rep}),
        .ADDRB({1'b0,fifo_head_reg_rep}),
        .ADDRC({1'b0,fifo_head_reg_rep}),
        .ADDRD({1'b0,fifo_tail[3:0]}),
        .DIA(u2f_fifo_wr_dat[19:18]),
        .DIB(u2f_fifo_wr_dat[21:20]),
        .DIC(u2f_fifo_wr_dat[23:22]),
        .DID({1'b0,1'b0}),
        .DOA(rd_dout[19:18]),
        .DOB(rd_dout[21:20]),
        .DOC(rd_dout[23:22]),
        .DOD(NLW_Mem_reg_0_15_18_23_DOD_UNCONNECTED[1:0]),
        .WCLK(ACLK),
        .WE(Mem_reg_0_15_36_40_i_1_n_0));
  LUT6 #(
    .INIT(64'hFF00A0A0FF002020)) 
    Mem_reg_0_15_18_23_i_1__0
       (.I0(u2f_rd_data[3]),
        .I1(\WDATA[1]_0 [0]),
        .I2(\WDATA[1]_0 [1]),
        .I3(u2f_rd_data[19]),
        .I4(\WDATA[1] [5]),
        .I5(\WDATA[1] [4]),
        .O(u2f_fifo_wr_dat[19]));
  LUT6 #(
    .INIT(64'hFF00A0A0FF002020)) 
    Mem_reg_0_15_18_23_i_2__0
       (.I0(u2f_rd_data[2]),
        .I1(\WDATA[1]_0 [0]),
        .I2(\WDATA[1]_0 [1]),
        .I3(u2f_rd_data[18]),
        .I4(\WDATA[1] [5]),
        .I5(\WDATA[1] [4]),
        .O(u2f_fifo_wr_dat[18]));
  LUT6 #(
    .INIT(64'hFF00A0A0FF002020)) 
    Mem_reg_0_15_18_23_i_3__0
       (.I0(u2f_rd_data[5]),
        .I1(\WDATA[1]_0 [0]),
        .I2(\WDATA[1]_0 [1]),
        .I3(u2f_rd_data[21]),
        .I4(\WDATA[1] [5]),
        .I5(\WDATA[1] [4]),
        .O(u2f_fifo_wr_dat[21]));
  LUT6 #(
    .INIT(64'hFF00A0A0FF002020)) 
    Mem_reg_0_15_18_23_i_4__0
       (.I0(u2f_rd_data[4]),
        .I1(\WDATA[1]_0 [0]),
        .I2(\WDATA[1]_0 [1]),
        .I3(u2f_rd_data[20]),
        .I4(\WDATA[1] [5]),
        .I5(\WDATA[1] [4]),
        .O(u2f_fifo_wr_dat[20]));
  LUT6 #(
    .INIT(64'hFF00A0A0FF002020)) 
    Mem_reg_0_15_18_23_i_5__0
       (.I0(u2f_rd_data[7]),
        .I1(\WDATA[1]_0 [0]),
        .I2(\WDATA[1]_0 [1]),
        .I3(u2f_rd_data[23]),
        .I4(\WDATA[1] [5]),
        .I5(\WDATA[1] [4]),
        .O(u2f_fifo_wr_dat[23]));
  LUT6 #(
    .INIT(64'hFF00A0A0FF002020)) 
    Mem_reg_0_15_18_23_i_6__0
       (.I0(u2f_rd_data[6]),
        .I1(\WDATA[1]_0 [0]),
        .I2(\WDATA[1]_0 [1]),
        .I3(u2f_rd_data[22]),
        .I4(\WDATA[1] [5]),
        .I5(\WDATA[1] [4]),
        .O(u2f_fifo_wr_dat[22]));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "656" *) 
  (* RTL_RAM_NAME = "u_trx_axi/u_u2f_fifo/Mem" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "29" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    Mem_reg_0_15_24_29
       (.ADDRA({1'b0,fifo_head_reg_rep}),
        .ADDRB({1'b0,fifo_head_reg_rep}),
        .ADDRC({1'b0,fifo_head_reg_rep}),
        .ADDRD({1'b0,fifo_tail[3:0]}),
        .DIA(u2f_fifo_wr_dat[25:24]),
        .DIB(u2f_fifo_wr_dat[27:26]),
        .DIC(u2f_fifo_wr_dat[29:28]),
        .DID({1'b0,1'b0}),
        .DOA(rd_dout[25:24]),
        .DOB(rd_dout[27:26]),
        .DOC(rd_dout[29:28]),
        .DOD(NLW_Mem_reg_0_15_24_29_DOD_UNCONNECTED[1:0]),
        .WCLK(ACLK),
        .WE(Mem_reg_0_15_36_40_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    Mem_reg_0_15_24_29_i_1__0
       (.I0(\WDATA[1] [5]),
        .I1(u2f_rd_data[25]),
        .I2(Mem_reg_0_15_30_35_i_7_n_0),
        .I3(u2f_rd_data[9]),
        .I4(u2f_rd_data[1]),
        .I5(Mem_reg_0_15_30_35_i_8_n_0),
        .O(u2f_fifo_wr_dat[25]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    Mem_reg_0_15_24_29_i_2__0
       (.I0(\WDATA[1] [5]),
        .I1(u2f_rd_data[24]),
        .I2(Mem_reg_0_15_30_35_i_7_n_0),
        .I3(u2f_rd_data[8]),
        .I4(u2f_rd_data[0]),
        .I5(Mem_reg_0_15_30_35_i_8_n_0),
        .O(u2f_fifo_wr_dat[24]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    Mem_reg_0_15_24_29_i_3__0
       (.I0(\WDATA[1] [5]),
        .I1(u2f_rd_data[27]),
        .I2(Mem_reg_0_15_30_35_i_7_n_0),
        .I3(u2f_rd_data[11]),
        .I4(u2f_rd_data[3]),
        .I5(Mem_reg_0_15_30_35_i_8_n_0),
        .O(u2f_fifo_wr_dat[27]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    Mem_reg_0_15_24_29_i_4__0
       (.I0(\WDATA[1] [5]),
        .I1(u2f_rd_data[26]),
        .I2(Mem_reg_0_15_30_35_i_7_n_0),
        .I3(u2f_rd_data[10]),
        .I4(u2f_rd_data[2]),
        .I5(Mem_reg_0_15_30_35_i_8_n_0),
        .O(u2f_fifo_wr_dat[26]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    Mem_reg_0_15_24_29_i_5__0
       (.I0(\WDATA[1] [5]),
        .I1(u2f_rd_data[29]),
        .I2(Mem_reg_0_15_30_35_i_7_n_0),
        .I3(u2f_rd_data[13]),
        .I4(u2f_rd_data[5]),
        .I5(Mem_reg_0_15_30_35_i_8_n_0),
        .O(u2f_fifo_wr_dat[29]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    Mem_reg_0_15_24_29_i_6__0
       (.I0(\WDATA[1] [5]),
        .I1(u2f_rd_data[28]),
        .I2(Mem_reg_0_15_30_35_i_7_n_0),
        .I3(u2f_rd_data[12]),
        .I4(u2f_rd_data[4]),
        .I5(Mem_reg_0_15_30_35_i_8_n_0),
        .O(u2f_fifo_wr_dat[28]));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "656" *) 
  (* RTL_RAM_NAME = "u_trx_axi/u_u2f_fifo/Mem" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "35" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    Mem_reg_0_15_30_35
       (.ADDRA({1'b0,fifo_head_reg_rep}),
        .ADDRB({1'b0,fifo_head_reg_rep}),
        .ADDRC({1'b0,fifo_head_reg_rep}),
        .ADDRD({1'b0,fifo_tail[3:0]}),
        .DIA(u2f_fifo_wr_dat[31:30]),
        .DIB(u2f_fifo_wr_dat[33:32]),
        .DIC(u2f_fifo_wr_dat[35:34]),
        .DID({1'b0,1'b0}),
        .DOA(rd_dout[31:30]),
        .DOB(rd_dout[33:32]),
        .DOC(rd_dout[35:34]),
        .DOD(NLW_Mem_reg_0_15_30_35_DOD_UNCONNECTED[1:0]),
        .WCLK(ACLK),
        .WE(Mem_reg_0_15_36_40_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    Mem_reg_0_15_30_35_i_1
       (.I0(\WDATA[1] [5]),
        .I1(u2f_rd_data[31]),
        .I2(Mem_reg_0_15_30_35_i_7_n_0),
        .I3(u2f_rd_data[15]),
        .I4(u2f_rd_data[7]),
        .I5(Mem_reg_0_15_30_35_i_8_n_0),
        .O(u2f_fifo_wr_dat[31]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    Mem_reg_0_15_30_35_i_2
       (.I0(\WDATA[1] [5]),
        .I1(u2f_rd_data[30]),
        .I2(Mem_reg_0_15_30_35_i_7_n_0),
        .I3(u2f_rd_data[14]),
        .I4(u2f_rd_data[6]),
        .I5(Mem_reg_0_15_30_35_i_8_n_0),
        .O(u2f_fifo_wr_dat[30]));
  LUT4 #(
    .INIT(16'hFDDC)) 
    Mem_reg_0_15_30_35_i_3
       (.I0(\WDATA[1]_0 [1]),
        .I1(\WDATA[1] [5]),
        .I2(\WDATA[1]_0 [0]),
        .I3(\WDATA[1] [4]),
        .O(u2f_fifo_wr_dat[33]));
  LUT4 #(
    .INIT(16'hFDCD)) 
    Mem_reg_0_15_30_35_i_4
       (.I0(\WDATA[1]_0 [1]),
        .I1(\WDATA[1] [5]),
        .I2(\WDATA[1]_0 [0]),
        .I3(\WDATA[1] [4]),
        .O(u2f_fifo_wr_dat[32]));
  LUT4 #(
    .INIT(16'hFEEC)) 
    Mem_reg_0_15_30_35_i_5
       (.I0(\WDATA[1]_0 [1]),
        .I1(\WDATA[1] [5]),
        .I2(\WDATA[1]_0 [0]),
        .I3(\WDATA[1] [4]),
        .O(u2f_fifo_wr_dat[35]));
  LUT4 #(
    .INIT(16'hFECE)) 
    Mem_reg_0_15_30_35_i_6
       (.I0(\WDATA[1]_0 [1]),
        .I1(\WDATA[1] [5]),
        .I2(\WDATA[1]_0 [0]),
        .I3(\WDATA[1] [4]),
        .O(u2f_fifo_wr_dat[34]));
  LUT3 #(
    .INIT(8'h08)) 
    Mem_reg_0_15_30_35_i_7
       (.I0(\WDATA[1]_0 [1]),
        .I1(\WDATA[1] [4]),
        .I2(\WDATA[1] [5]),
        .O(Mem_reg_0_15_30_35_i_7_n_0));
  LUT4 #(
    .INIT(16'h0200)) 
    Mem_reg_0_15_30_35_i_8
       (.I0(\WDATA[1]_0 [0]),
        .I1(\WDATA[1] [4]),
        .I2(\WDATA[1] [5]),
        .I3(\WDATA[1]_0 [1]),
        .O(Mem_reg_0_15_30_35_i_8_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "656" *) 
  (* RTL_RAM_NAME = "u_trx_axi/u_u2f_fifo/Mem" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "36" *) 
  (* ram_slice_end = "40" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    Mem_reg_0_15_36_40
       (.ADDRA({1'b0,fifo_head_reg_rep}),
        .ADDRB({1'b0,fifo_head_reg_rep}),
        .ADDRC({1'b0,fifo_head_reg_rep}),
        .ADDRD({1'b0,fifo_tail[3:0]}),
        .DIA(\WDATA[1] [1:0]),
        .DIB(\WDATA[1] [3:2]),
        .DIC({1'b0,CO}),
        .DID({1'b0,1'b0}),
        .DOA(rd_dout[37:36]),
        .DOB(rd_dout[39:38]),
        .DOC({NLW_Mem_reg_0_15_36_40_DOC_UNCONNECTED[1],u2f_fifo_rd_dat}),
        .DOD(NLW_Mem_reg_0_15_36_40_DOD_UNCONNECTED[1:0]),
        .WCLK(ACLK),
        .WE(Mem_reg_0_15_36_40_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000002000)) 
    Mem_reg_0_15_36_40_i_1
       (.I0(out[1]),
        .I1(out[2]),
        .I2(\fifo_tail_reg[4]_0 ),
        .I3(u2f_rd_valid),
        .I4(out[0]),
        .I5(rd_cnt_reg_n_0_[4]),
        .O(Mem_reg_0_15_36_40_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "656" *) 
  (* RTL_RAM_NAME = "u_trx_axi/u_u2f_fifo/Mem" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "11" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    Mem_reg_0_15_6_11
       (.ADDRA({1'b0,fifo_head_reg_rep}),
        .ADDRB({1'b0,fifo_head_reg_rep}),
        .ADDRC({1'b0,fifo_head_reg_rep}),
        .ADDRD({1'b0,fifo_tail[3:0]}),
        .DIA(u2f_fifo_wr_dat[7:6]),
        .DIB(u2f_fifo_wr_dat[9:8]),
        .DIC(u2f_fifo_wr_dat[11:10]),
        .DID({1'b0,1'b0}),
        .DOA(rd_dout[7:6]),
        .DOB(rd_dout[9:8]),
        .DOC(rd_dout[11:10]),
        .DOD(NLW_Mem_reg_0_15_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(ACLK),
        .WE(Mem_reg_0_15_36_40_i_1_n_0));
  LUT5 #(
    .INIT(32'hAAEF0000)) 
    Mem_reg_0_15_6_11_i_1__0
       (.I0(\WDATA[1] [5]),
        .I1(\WDATA[1] [4]),
        .I2(\WDATA[1]_0 [0]),
        .I3(\WDATA[1]_0 [1]),
        .I4(u2f_rd_data[7]),
        .O(u2f_fifo_wr_dat[7]));
  LUT5 #(
    .INIT(32'hAAEF0000)) 
    Mem_reg_0_15_6_11_i_2__0
       (.I0(\WDATA[1] [5]),
        .I1(\WDATA[1] [4]),
        .I2(\WDATA[1]_0 [0]),
        .I3(\WDATA[1]_0 [1]),
        .I4(u2f_rd_data[6]),
        .O(u2f_fifo_wr_dat[6]));
  LUT6 #(
    .INIT(64'hF0F0F0F000F00088)) 
    Mem_reg_0_15_6_11_i_3__0
       (.I0(u2f_rd_data[1]),
        .I1(\WDATA[1]_0 [0]),
        .I2(u2f_rd_data[9]),
        .I3(\WDATA[1]_0 [1]),
        .I4(\WDATA[1] [4]),
        .I5(\WDATA[1] [5]),
        .O(u2f_fifo_wr_dat[9]));
  LUT6 #(
    .INIT(64'hF0F0F0F000F00088)) 
    Mem_reg_0_15_6_11_i_4__0
       (.I0(u2f_rd_data[0]),
        .I1(\WDATA[1]_0 [0]),
        .I2(u2f_rd_data[8]),
        .I3(\WDATA[1]_0 [1]),
        .I4(\WDATA[1] [4]),
        .I5(\WDATA[1] [5]),
        .O(u2f_fifo_wr_dat[8]));
  LUT6 #(
    .INIT(64'hF0F0F0F000F00088)) 
    Mem_reg_0_15_6_11_i_5__0
       (.I0(u2f_rd_data[3]),
        .I1(\WDATA[1]_0 [0]),
        .I2(u2f_rd_data[11]),
        .I3(\WDATA[1]_0 [1]),
        .I4(\WDATA[1] [4]),
        .I5(\WDATA[1] [5]),
        .O(u2f_fifo_wr_dat[11]));
  LUT6 #(
    .INIT(64'hF0F0F0F000F00088)) 
    Mem_reg_0_15_6_11_i_6__0
       (.I0(u2f_rd_data[2]),
        .I1(\WDATA[1]_0 [0]),
        .I2(u2f_rd_data[10]),
        .I3(\WDATA[1]_0 [1]),
        .I4(\WDATA[1] [4]),
        .I5(\WDATA[1] [5]),
        .O(u2f_fifo_wr_dat[10]));
  LUT6 #(
    .INIT(64'h7DFFFF7D00000000)) 
    WLAST_INST_0
       (.I0(WLAST_INST_0_i_1_n_0),
        .I1(fifo_tail[0]),
        .I2(fifo_head[0]),
        .I3(fifo_tail[4]),
        .I4(fifo_head[4]),
        .I5(u2f_fifo_rd_dat),
        .O(WLAST));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    WLAST_INST_0_i_1
       (.I0(fifo_tail[3]),
        .I1(fifo_head[3]),
        .I2(fifo_tail[1]),
        .I3(fifo_head[1]),
        .I4(fifo_head[2]),
        .I5(fifo_tail[2]),
        .O(WLAST_INST_0_i_1_n_0));
  LUT5 #(
    .INIT(32'h7DFFFF7D)) 
    WVALID_INST_0
       (.I0(WLAST_INST_0_i_1_n_0),
        .I1(fifo_tail[0]),
        .I2(fifo_head[0]),
        .I3(fifo_tail[4]),
        .I4(fifo_head[4]),
        .O(WVALID));
  LUT2 #(
    .INIT(4'h2)) 
    \countW[5]_i_3 
       (.I0(out[1]),
        .I1(out[2]),
        .O(\^state_write_reg [1]));
  LUT1 #(
    .INIT(2'h1)) 
    \fifo_head[4]_i_1 
       (.I0(\fifo_head[4]_i_2__0_n_0 ),
        .O(fifo_head0));
  LUT6 #(
    .INIT(64'h82000082FFFFFFFF)) 
    \fifo_head[4]_i_2__0 
       (.I0(WLAST_INST_0_i_1_n_0),
        .I1(fifo_tail[0]),
        .I2(fifo_head[0]),
        .I3(fifo_tail[4]),
        .I4(fifo_head[4]),
        .I5(WREADY),
        .O(\fifo_head[4]_i_2__0_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \fifo_head_reg[0] 
       (.C(ACLK),
        .CE(fifo_head0),
        .CLR(ARESETn_0),
        .D(next_head_reg[0]),
        .Q(fifo_head[0]));
  FDCE #(
    .INIT(1'b0)) 
    \fifo_head_reg[1] 
       (.C(ACLK),
        .CE(fifo_head0),
        .CLR(ARESETn_0),
        .D(next_head_reg[1]),
        .Q(fifo_head[1]));
  FDCE #(
    .INIT(1'b0)) 
    \fifo_head_reg[2] 
       (.C(ACLK),
        .CE(fifo_head0),
        .CLR(ARESETn_0),
        .D(next_head_reg[2]),
        .Q(fifo_head[2]));
  FDCE #(
    .INIT(1'b0)) 
    \fifo_head_reg[3] 
       (.C(ACLK),
        .CE(fifo_head0),
        .CLR(ARESETn_0),
        .D(next_head_reg[3]),
        .Q(fifo_head[3]));
  FDCE #(
    .INIT(1'b0)) 
    \fifo_head_reg[4] 
       (.C(ACLK),
        .CE(fifo_head0),
        .CLR(ARESETn_0),
        .D(next_head_reg[4]),
        .Q(fifo_head[4]));
  FDCE #(
    .INIT(1'b0)) 
    \fifo_head_reg_rep[0] 
       (.C(ACLK),
        .CE(fifo_head0),
        .CLR(ARESETn_0),
        .D(next_head_reg[0]),
        .Q(fifo_head_reg_rep[0]));
  FDCE #(
    .INIT(1'b0)) 
    \fifo_head_reg_rep[1] 
       (.C(ACLK),
        .CE(fifo_head0),
        .CLR(ARESETn_0),
        .D(next_head_reg[1]),
        .Q(fifo_head_reg_rep[1]));
  FDCE #(
    .INIT(1'b0)) 
    \fifo_head_reg_rep[2] 
       (.C(ACLK),
        .CE(fifo_head0),
        .CLR(ARESETn_0),
        .D(next_head_reg[2]),
        .Q(fifo_head_reg_rep[2]));
  FDCE #(
    .INIT(1'b0)) 
    \fifo_head_reg_rep[3] 
       (.C(ACLK),
        .CE(fifo_head0),
        .CLR(ARESETn_0),
        .D(next_head_reg[3]),
        .Q(fifo_head_reg_rep[3]));
  FDCE #(
    .INIT(1'b0)) 
    \fifo_tail_reg[0] 
       (.C(ACLK),
        .CE(Mem_reg_0_15_36_40_i_1_n_0),
        .CLR(ARESETn_0),
        .D(next_tail_reg[0]),
        .Q(fifo_tail[0]));
  FDCE #(
    .INIT(1'b0)) 
    \fifo_tail_reg[1] 
       (.C(ACLK),
        .CE(Mem_reg_0_15_36_40_i_1_n_0),
        .CLR(ARESETn_0),
        .D(next_tail_reg[1]),
        .Q(fifo_tail[1]));
  FDCE #(
    .INIT(1'b0)) 
    \fifo_tail_reg[2] 
       (.C(ACLK),
        .CE(Mem_reg_0_15_36_40_i_1_n_0),
        .CLR(ARESETn_0),
        .D(next_tail_reg[2]),
        .Q(fifo_tail[2]));
  FDCE #(
    .INIT(1'b0)) 
    \fifo_tail_reg[3] 
       (.C(ACLK),
        .CE(Mem_reg_0_15_36_40_i_1_n_0),
        .CLR(ARESETn_0),
        .D(next_tail_reg[3]),
        .Q(fifo_tail[3]));
  FDCE #(
    .INIT(1'b0)) 
    \fifo_tail_reg[4] 
       (.C(ACLK),
        .CE(Mem_reg_0_15_36_40_i_1_n_0),
        .CLR(ARESETn_0),
        .D(next_tail_reg[4]),
        .Q(fifo_tail[4]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT5 #(
    .INIT(32'h15FFFFFF)) 
    i_807
       (.I0(rd_cnt_reg_n_0_[4]),
        .I1(rd_cnt_reg_n_0_[2]),
        .I2(rd_cnt_reg_n_0_[3]),
        .I3(\fifo_tail_reg[4]_0 ),
        .I4(u2f_rd_valid),
        .O(n_0_807));
  LUT1 #(
    .INIT(2'h1)) 
    \next_head[0]_i_1 
       (.I0(next_head_reg[0]),
        .O(\next_head[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \next_head[1]_i_1__0 
       (.I0(next_head_reg[0]),
        .I1(next_head_reg[1]),
        .O(\next_head[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \next_head[2]_i_1__0 
       (.I0(next_head_reg[0]),
        .I1(next_head_reg[1]),
        .I2(next_head_reg[2]),
        .O(\next_head[2]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \next_head[3]_i_1__0 
       (.I0(next_head_reg[3]),
        .I1(next_head_reg[0]),
        .I2(next_head_reg[1]),
        .I3(next_head_reg[2]),
        .O(\next_head[3]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \next_head[4]_i_1__0 
       (.I0(next_head_reg[3]),
        .I1(next_head_reg[0]),
        .I2(next_head_reg[1]),
        .I3(next_head_reg[2]),
        .I4(next_head_reg[4]),
        .O(\next_head[4]_i_1__0_n_0 ));
  FDPE #(
    .INIT(1'b1)) 
    \next_head_reg[0] 
       (.C(ACLK),
        .CE(fifo_head0),
        .D(\next_head[0]_i_1_n_0 ),
        .PRE(ARESETn_0),
        .Q(next_head_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \next_head_reg[1] 
       (.C(ACLK),
        .CE(fifo_head0),
        .CLR(ARESETn_0),
        .D(\next_head[1]_i_1__0_n_0 ),
        .Q(next_head_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \next_head_reg[2] 
       (.C(ACLK),
        .CE(fifo_head0),
        .CLR(ARESETn_0),
        .D(\next_head[2]_i_1__0_n_0 ),
        .Q(next_head_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \next_head_reg[3] 
       (.C(ACLK),
        .CE(fifo_head0),
        .CLR(ARESETn_0),
        .D(\next_head[3]_i_1__0_n_0 ),
        .Q(next_head_reg[3]));
  FDCE #(
    .INIT(1'b0)) 
    \next_head_reg[4] 
       (.C(ACLK),
        .CE(fifo_head0),
        .CLR(ARESETn_0),
        .D(\next_head[4]_i_1__0_n_0 ),
        .Q(next_head_reg[4]));
  LUT1 #(
    .INIT(2'h1)) 
    \next_tail[0]_i_1 
       (.I0(next_tail_reg[0]),
        .O(\next_tail[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \next_tail[1]_i_1 
       (.I0(next_tail_reg[0]),
        .I1(next_tail_reg[1]),
        .O(\next_tail[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \next_tail[2]_i_1 
       (.I0(next_tail_reg[0]),
        .I1(next_tail_reg[1]),
        .I2(next_tail_reg[2]),
        .O(\next_tail[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \next_tail[3]_i_1__0 
       (.I0(next_tail_reg[3]),
        .I1(next_tail_reg[0]),
        .I2(next_tail_reg[1]),
        .I3(next_tail_reg[2]),
        .O(\next_tail[3]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \next_tail[4]_i_1__0 
       (.I0(next_tail_reg[3]),
        .I1(next_tail_reg[0]),
        .I2(next_tail_reg[1]),
        .I3(next_tail_reg[2]),
        .I4(next_tail_reg[4]),
        .O(\next_tail[4]_i_1__0_n_0 ));
  FDPE #(
    .INIT(1'b1)) 
    \next_tail_reg[0] 
       (.C(ACLK),
        .CE(Mem_reg_0_15_36_40_i_1_n_0),
        .D(\next_tail[0]_i_1_n_0 ),
        .PRE(ARESETn_0),
        .Q(next_tail_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \next_tail_reg[1] 
       (.C(ACLK),
        .CE(Mem_reg_0_15_36_40_i_1_n_0),
        .CLR(ARESETn_0),
        .D(\next_tail[1]_i_1_n_0 ),
        .Q(next_tail_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \next_tail_reg[2] 
       (.C(ACLK),
        .CE(Mem_reg_0_15_36_40_i_1_n_0),
        .CLR(ARESETn_0),
        .D(\next_tail[2]_i_1_n_0 ),
        .Q(next_tail_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \next_tail_reg[3] 
       (.C(ACLK),
        .CE(Mem_reg_0_15_36_40_i_1_n_0),
        .CLR(ARESETn_0),
        .D(\next_tail[3]_i_1__0_n_0 ),
        .Q(next_tail_reg[3]));
  FDCE #(
    .INIT(1'b0)) 
    \next_tail_reg[4] 
       (.C(ACLK),
        .CE(Mem_reg_0_15_36_40_i_1_n_0),
        .CLR(ARESETn_0),
        .D(\next_tail[4]_i_1__0_n_0 ),
        .Q(next_tail_reg[4]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \rd_cnt[0]_i_1__0 
       (.I0(rd_cnt_reg_n_0_[0]),
        .O(\rd_cnt[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \rd_cnt[1]_i_1__0 
       (.I0(rd_cnt_reg_n_0_[1]),
        .I1(rd_cnt13_out),
        .I2(rd_cnt_reg_n_0_[0]),
        .O(\rd_cnt[1]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \rd_cnt[1]_i_2 
       (.I0(\fifo_head[4]_i_2__0_n_0 ),
        .I1(\^state_write_reg [1]),
        .I2(\fifo_tail_reg[4]_0 ),
        .I3(u2f_rd_valid),
        .I4(out[0]),
        .I5(rd_cnt_reg_n_0_[4]),
        .O(rd_cnt13_out));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \rd_cnt[2]_i_1 
       (.I0(rd_cnt_reg_n_0_[2]),
        .I1(rd_cnt_reg_n_0_[1]),
        .I2(\rd_cnt[4]_i_3__0_n_0 ),
        .O(\rd_cnt[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'h6AA9)) 
    \rd_cnt[3]_i_1 
       (.I0(rd_cnt_reg_n_0_[3]),
        .I1(rd_cnt_reg_n_0_[2]),
        .I2(rd_cnt_reg_n_0_[1]),
        .I3(\rd_cnt[4]_i_3__0_n_0 ),
        .O(\rd_cnt[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h10000000EFFFFFFF)) 
    \rd_cnt[4]_i_1 
       (.I0(rd_cnt_reg_n_0_[4]),
        .I1(out[0]),
        .I2(u2f_rd_valid),
        .I3(\fifo_tail_reg[4]_0 ),
        .I4(\^state_write_reg [1]),
        .I5(\fifo_head[4]_i_2__0_n_0 ),
        .O(\rd_cnt[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT5 #(
    .INIT(32'h6AAAAAA9)) 
    \rd_cnt[4]_i_2 
       (.I0(rd_cnt_reg_n_0_[4]),
        .I1(rd_cnt_reg_n_0_[3]),
        .I2(rd_cnt_reg_n_0_[2]),
        .I3(rd_cnt_reg_n_0_[1]),
        .I4(\rd_cnt[4]_i_3__0_n_0 ),
        .O(\rd_cnt[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hD4)) 
    \rd_cnt[4]_i_3__0 
       (.I0(rd_cnt_reg_n_0_[1]),
        .I1(rd_cnt13_out),
        .I2(rd_cnt_reg_n_0_[0]),
        .O(\rd_cnt[4]_i_3__0_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \rd_cnt_reg[0] 
       (.C(ACLK),
        .CE(\rd_cnt[4]_i_1_n_0 ),
        .CLR(ARESETn_0),
        .D(\rd_cnt[0]_i_1__0_n_0 ),
        .Q(rd_cnt_reg_n_0_[0]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_cnt_reg[1] 
       (.C(ACLK),
        .CE(\rd_cnt[4]_i_1_n_0 ),
        .CLR(ARESETn_0),
        .D(\rd_cnt[1]_i_1__0_n_0 ),
        .Q(rd_cnt_reg_n_0_[1]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_cnt_reg[2] 
       (.C(ACLK),
        .CE(\rd_cnt[4]_i_1_n_0 ),
        .CLR(ARESETn_0),
        .D(\rd_cnt[2]_i_1_n_0 ),
        .Q(rd_cnt_reg_n_0_[2]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_cnt_reg[3] 
       (.C(ACLK),
        .CE(\rd_cnt[4]_i_1_n_0 ),
        .CLR(ARESETn_0),
        .D(\rd_cnt[3]_i_1_n_0 ),
        .Q(rd_cnt_reg_n_0_[3]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_cnt_reg[4] 
       (.C(ACLK),
        .CE(\rd_cnt[4]_i_1_n_0 ),
        .CLR(ARESETn_0),
        .D(\rd_cnt[4]_i_2_n_0 ),
        .Q(rd_cnt_reg_n_0_[4]));
  LUT6 #(
    .INIT(64'hAAAAFFFFAAAAAAAE)) 
    \state_write[0]_i_1 
       (.I0(\state_write[0]_i_2_n_0 ),
        .I1(\^state_write_reg [0]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[2]),
        .I5(\state_write[0]_i_3_n_0 ),
        .O(D));
  LUT6 #(
    .INIT(64'h00FFAC000000AC00)) 
    \state_write[0]_i_2 
       (.I0(\^state_write_reg [0]),
        .I1(BVALID),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(Q[1]),
        .I5(\state_write[0]_i_4_n_0 ),
        .O(\state_write[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hDDD1D1D100000000)) 
    \state_write[0]_i_3 
       (.I0(AWREADY),
        .I1(Q[1]),
        .I2(rd_cnt_reg_n_0_[4]),
        .I3(rd_cnt_reg_n_0_[2]),
        .I4(rd_cnt_reg_n_0_[3]),
        .I5(Q[0]),
        .O(\state_write[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000088888000)) 
    \state_write[0]_i_4 
       (.I0(u2f_rd_valid),
        .I1(\fifo_tail_reg[4]_0 ),
        .I2(rd_cnt_reg_n_0_[3]),
        .I3(rd_cnt_reg_n_0_[2]),
        .I4(rd_cnt_reg_n_0_[4]),
        .I5(CO),
        .O(\state_write[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00C8FFFF00C80000)) 
    u2f_ready_i_1
       (.I0(out[1]),
        .I1(out[0]),
        .I2(AWREADY),
        .I3(out[2]),
        .I4(u2f_ready_i_2_n_0),
        .I5(\fifo_tail_reg[4]_0 ),
        .O(\state_write_reg[1]_0 ));
  LUT6 #(
    .INIT(64'hBAAAFAEABAAAEAEA)) 
    u2f_ready_i_2
       (.I0(u2f_ready_reg),
        .I1(out[0]),
        .I2(out[1]),
        .I3(BREADY1__0),
        .I4(u2f_fifo_fullN),
        .I5(CO),
        .O(u2f_ready_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    u2f_ready_i_4
       (.I0(rd_cnt_reg_n_0_[4]),
        .I1(rd_cnt_reg_n_0_[2]),
        .I2(rd_cnt_reg_n_0_[3]),
        .O(u2f_fifo_fullN));
endmodule

(* ORIG_REF_NAME = "trx_fifo_sync_small" *) 
module design_riscv_cache_bfm_axi_if_0_0_trx_fifo_sync_small__parameterized0
   (ACLK,
    ARREADY,
    BVALID,
    RREADY,
    RRESP_0_sp_1,
    RRESP_1_sp_1,
    RVALID,
    addrR_reg,
    f2u_wr_ready,
    f2u_wr_valid,
    last_resp_reg,
    \next_tail_reg[1]_0 ,
    read_done_reg,
    read_go,
    \state_read_reg[1]_0 ,
    \state_read_reg[1]_1 ,
    state_read_reg,
    ACLK_0,
    BRESP,
    CO,
    D,
    E,
    Mem_reg_0_15_0_5_i_3_0,
    Mem_reg_0_15_0_5_i_3_1,
    Mem_reg_0_15_30_31_0,
    Q,
    RDATA,
    RRESP,
    \last_resp_reg[1] ,
    out,
    \state_read_reg[1] );
  input ACLK;
  input ARREADY;
  input BVALID;
  output RREADY;
  output RRESP_0_sp_1;
  output RRESP_1_sp_1;
  input RVALID;
  input [0:0]addrR_reg;
  input f2u_wr_ready;
  output f2u_wr_valid;
  input [0:0]last_resp_reg;
  input \next_tail_reg[1]_0 ;
  input read_done_reg;
  input read_go;
  output \state_read_reg[1]_0 ;
  input \state_read_reg[1]_1 ;
  input [2:2]state_read_reg;
  output [31:0]ACLK_0;
  input [1:0]BRESP;
  input [0:0]CO;
  output [2:0]D;
  output [0:0]E;
  input [3:0]Mem_reg_0_15_0_5_i_3_0;
  input [1:0]Mem_reg_0_15_0_5_i_3_1;
  input [25:0]Mem_reg_0_15_30_31_0;
  input [2:0]Q;
  input [31:0]RDATA;
  input [1:0]RRESP;
  input [1:0]\last_resp_reg[1] ;
  input [2:0]out;
  output [0:0]\state_read_reg[1] ;

  wire ACLK;
  wire [31:0]ACLK_0;
  wire ARREADY;
  wire [1:0]BRESP;
  wire BVALID;
  wire [0:0]CO;
  wire [2:0]D;
  wire [0:0]E;
  wire Mem_reg_0_15_0_5_i_10_n_0;
  wire Mem_reg_0_15_0_5_i_11_n_0;
  wire Mem_reg_0_15_0_5_i_12_n_0;
  wire Mem_reg_0_15_0_5_i_13_n_0;
  wire Mem_reg_0_15_0_5_i_14_n_0;
  wire Mem_reg_0_15_0_5_i_15_n_0;
  wire Mem_reg_0_15_0_5_i_16_n_0;
  wire Mem_reg_0_15_0_5_i_17_n_0;
  wire Mem_reg_0_15_0_5_i_1__0_n_0;
  wire [3:0]Mem_reg_0_15_0_5_i_3_0;
  wire [1:0]Mem_reg_0_15_0_5_i_3_1;
  wire Mem_reg_0_15_0_5_i_8_n_0;
  wire Mem_reg_0_15_0_5_i_9_n_0;
  wire [25:0]Mem_reg_0_15_30_31_0;
  wire Mem_reg_0_15_6_11_i_10_n_0;
  wire Mem_reg_0_15_6_11_i_11_n_0;
  wire Mem_reg_0_15_6_11_i_7_n_0;
  wire Mem_reg_0_15_6_11_i_8_n_0;
  wire Mem_reg_0_15_6_11_i_9_n_0;
  wire [2:0]Q;
  wire [31:0]RDATA;
  wire RREADY;
  wire [1:0]RRESP;
  wire RRESP_0_sn_1;
  wire RRESP_1_sn_1;
  wire RVALID;
  wire \WIDTH_34.BLK_512.u_fifo_i_3_n_0 ;
  wire [0:0]addrR_reg;
  wire [31:0]f2u_fifo_wr_dat;
  wire f2u_wr_ready;
  wire f2u_wr_valid;
  wire [4:0]fifo_head;
  wire fifo_head0;
  wire \fifo_head[4]_i_2_n_0 ;
  wire [3:0]fifo_head_reg_rep;
  wire [4:0]fifo_tail;
  wire last_resp0__0;
  wire [0:0]last_resp_reg;
  wire [1:0]\last_resp_reg[1] ;
  wire \next_head[0]_i_1__0_n_0 ;
  wire \next_head[1]_i_1_n_0 ;
  wire \next_head[2]_i_1_n_0 ;
  wire \next_head[3]_i_1_n_0 ;
  wire \next_head[4]_i_1_n_0 ;
  wire [4:0]next_head_reg;
  wire \next_tail[0]_i_1__0_n_0 ;
  wire \next_tail[1]_i_1__0_n_0 ;
  wire \next_tail[2]_i_1__0_n_0 ;
  wire \next_tail[3]_i_1_n_0 ;
  wire \next_tail[4]_i_1_n_0 ;
  wire [4:0]next_tail_reg;
  wire \next_tail_reg[1]_0 ;
  wire [2:0]out;
  wire rd_cnt13_out;
  wire \rd_cnt[0]_i_1_n_0 ;
  wire \rd_cnt[1]_i_1_n_0 ;
  wire \rd_cnt[2]_i_1__0_n_0 ;
  wire \rd_cnt[2]_i_2_n_0 ;
  wire \rd_cnt[3]_i_1__0_n_0 ;
  wire \rd_cnt[4]_i_1__0_n_0 ;
  wire \rd_cnt[4]_i_2__0_n_0 ;
  wire \rd_cnt[4]_i_3_n_0 ;
  wire [4:0]rd_cnt_reg_n_0_;
  wire read_done_i_2_n_0;
  wire read_done_i_3_n_0;
  wire read_done_i_4_n_0;
  wire read_done_reg;
  wire read_go;
  wire \state_read[2]_i_2_n_0 ;
  wire [2:2]state_read_reg;
  wire [0:0]\state_read_reg[1] ;
  wire \state_read_reg[1]_0 ;
  wire \state_read_reg[1]_1 ;
  wire [1:0]NLW_Mem_reg_0_15_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_Mem_reg_0_15_12_17_DOD_UNCONNECTED;
  wire [1:0]NLW_Mem_reg_0_15_18_23_DOD_UNCONNECTED;
  wire [1:0]NLW_Mem_reg_0_15_24_29_DOD_UNCONNECTED;
  wire [1:0]NLW_Mem_reg_0_15_30_31_DOB_UNCONNECTED;
  wire [1:0]NLW_Mem_reg_0_15_30_31_DOC_UNCONNECTED;
  wire [1:0]NLW_Mem_reg_0_15_30_31_DOD_UNCONNECTED;
  wire [1:0]NLW_Mem_reg_0_15_6_11_DOD_UNCONNECTED;

  assign RRESP_0_sp_1 = RRESP_0_sn_1;
  assign RRESP_1_sp_1 = RRESP_1_sn_1;
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "512" *) 
  (* RTL_RAM_NAME = "u_trx_axi/u_f2u_fifo/Mem" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "5" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    Mem_reg_0_15_0_5
       (.ADDRA({1'b0,fifo_head_reg_rep}),
        .ADDRB({1'b0,fifo_head_reg_rep}),
        .ADDRC({1'b0,fifo_head_reg_rep}),
        .ADDRD({1'b0,fifo_tail[3:0]}),
        .DIA(f2u_fifo_wr_dat[1:0]),
        .DIB(f2u_fifo_wr_dat[3:2]),
        .DIC(f2u_fifo_wr_dat[5:4]),
        .DID({1'b0,1'b0}),
        .DOA(ACLK_0[1:0]),
        .DOB(ACLK_0[3:2]),
        .DOC(ACLK_0[5:4]),
        .DOD(NLW_Mem_reg_0_15_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(ACLK),
        .WE(Mem_reg_0_15_0_5_i_1__0_n_0));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    Mem_reg_0_15_0_5_i_10
       (.I0(Mem_reg_0_15_0_5_i_16_n_0),
        .I1(RDATA[1]),
        .I2(Mem_reg_0_15_30_31_0[1]),
        .I3(Mem_reg_0_15_6_11_i_11_n_0),
        .I4(RDATA[17]),
        .I5(Mem_reg_0_15_0_5_i_17_n_0),
        .O(Mem_reg_0_15_0_5_i_10_n_0));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    Mem_reg_0_15_0_5_i_11
       (.I0(Mem_reg_0_15_0_5_i_16_n_0),
        .I1(RDATA[0]),
        .I2(Mem_reg_0_15_30_31_0[0]),
        .I3(Mem_reg_0_15_6_11_i_11_n_0),
        .I4(RDATA[16]),
        .I5(Mem_reg_0_15_0_5_i_17_n_0),
        .O(Mem_reg_0_15_0_5_i_11_n_0));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    Mem_reg_0_15_0_5_i_12
       (.I0(Mem_reg_0_15_0_5_i_16_n_0),
        .I1(RDATA[3]),
        .I2(Mem_reg_0_15_30_31_0[3]),
        .I3(Mem_reg_0_15_6_11_i_11_n_0),
        .I4(RDATA[19]),
        .I5(Mem_reg_0_15_0_5_i_17_n_0),
        .O(Mem_reg_0_15_0_5_i_12_n_0));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    Mem_reg_0_15_0_5_i_13
       (.I0(Mem_reg_0_15_0_5_i_16_n_0),
        .I1(RDATA[2]),
        .I2(Mem_reg_0_15_30_31_0[2]),
        .I3(Mem_reg_0_15_6_11_i_11_n_0),
        .I4(RDATA[18]),
        .I5(Mem_reg_0_15_0_5_i_17_n_0),
        .O(Mem_reg_0_15_0_5_i_13_n_0));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    Mem_reg_0_15_0_5_i_14
       (.I0(Mem_reg_0_15_0_5_i_16_n_0),
        .I1(RDATA[5]),
        .I2(Mem_reg_0_15_30_31_0[5]),
        .I3(Mem_reg_0_15_6_11_i_11_n_0),
        .I4(RDATA[21]),
        .I5(Mem_reg_0_15_0_5_i_17_n_0),
        .O(Mem_reg_0_15_0_5_i_14_n_0));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    Mem_reg_0_15_0_5_i_15
       (.I0(Mem_reg_0_15_0_5_i_16_n_0),
        .I1(RDATA[4]),
        .I2(Mem_reg_0_15_30_31_0[4]),
        .I3(Mem_reg_0_15_6_11_i_11_n_0),
        .I4(RDATA[20]),
        .I5(Mem_reg_0_15_0_5_i_17_n_0),
        .O(Mem_reg_0_15_0_5_i_15_n_0));
  LUT5 #(
    .INIT(32'h0000FDCD)) 
    Mem_reg_0_15_0_5_i_16
       (.I0(Mem_reg_0_15_0_5_i_3_1[1]),
        .I1(Mem_reg_0_15_0_5_i_3_0[3]),
        .I2(Mem_reg_0_15_0_5_i_3_1[0]),
        .I3(Mem_reg_0_15_0_5_i_3_0[2]),
        .I4(Mem_reg_0_15_6_11_i_11_n_0),
        .O(Mem_reg_0_15_0_5_i_16_n_0));
  LUT6 #(
    .INIT(64'h000000000000BF00)) 
    Mem_reg_0_15_0_5_i_17
       (.I0(out[2]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(Mem_reg_0_15_0_5_i_3_1[1]),
        .I4(Mem_reg_0_15_0_5_i_3_0[3]),
        .I5(Mem_reg_0_15_0_5_i_3_1[0]),
        .O(Mem_reg_0_15_0_5_i_17_n_0));
  LUT5 #(
    .INIT(32'h000000E0)) 
    Mem_reg_0_15_0_5_i_1__0
       (.I0(out[0]),
        .I1(RVALID),
        .I2(out[1]),
        .I3(out[2]),
        .I4(rd_cnt_reg_n_0_[4]),
        .O(Mem_reg_0_15_0_5_i_1__0_n_0));
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    Mem_reg_0_15_0_5_i_2
       (.I0(Mem_reg_0_15_0_5_i_8_n_0),
        .I1(RDATA[9]),
        .I2(Mem_reg_0_15_0_5_i_9_n_0),
        .I3(RDATA[25]),
        .I4(Mem_reg_0_15_0_5_i_10_n_0),
        .O(f2u_fifo_wr_dat[1]));
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    Mem_reg_0_15_0_5_i_3
       (.I0(Mem_reg_0_15_0_5_i_8_n_0),
        .I1(RDATA[8]),
        .I2(Mem_reg_0_15_0_5_i_9_n_0),
        .I3(RDATA[24]),
        .I4(Mem_reg_0_15_0_5_i_11_n_0),
        .O(f2u_fifo_wr_dat[0]));
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    Mem_reg_0_15_0_5_i_4
       (.I0(Mem_reg_0_15_0_5_i_8_n_0),
        .I1(RDATA[11]),
        .I2(Mem_reg_0_15_0_5_i_9_n_0),
        .I3(RDATA[27]),
        .I4(Mem_reg_0_15_0_5_i_12_n_0),
        .O(f2u_fifo_wr_dat[3]));
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    Mem_reg_0_15_0_5_i_5
       (.I0(Mem_reg_0_15_0_5_i_8_n_0),
        .I1(RDATA[10]),
        .I2(Mem_reg_0_15_0_5_i_9_n_0),
        .I3(RDATA[26]),
        .I4(Mem_reg_0_15_0_5_i_13_n_0),
        .O(f2u_fifo_wr_dat[2]));
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    Mem_reg_0_15_0_5_i_6
       (.I0(Mem_reg_0_15_0_5_i_8_n_0),
        .I1(RDATA[13]),
        .I2(Mem_reg_0_15_0_5_i_9_n_0),
        .I3(RDATA[29]),
        .I4(Mem_reg_0_15_0_5_i_14_n_0),
        .O(f2u_fifo_wr_dat[5]));
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    Mem_reg_0_15_0_5_i_7
       (.I0(Mem_reg_0_15_0_5_i_8_n_0),
        .I1(RDATA[12]),
        .I2(Mem_reg_0_15_0_5_i_9_n_0),
        .I3(RDATA[28]),
        .I4(Mem_reg_0_15_0_5_i_15_n_0),
        .O(f2u_fifo_wr_dat[4]));
  LUT5 #(
    .INIT(32'h00000002)) 
    Mem_reg_0_15_0_5_i_8
       (.I0(Mem_reg_0_15_0_5_i_3_1[0]),
        .I1(Mem_reg_0_15_0_5_i_3_0[3]),
        .I2(Mem_reg_0_15_0_5_i_3_0[2]),
        .I3(Mem_reg_0_15_6_11_i_11_n_0),
        .I4(Mem_reg_0_15_0_5_i_3_1[1]),
        .O(Mem_reg_0_15_0_5_i_8_n_0));
  LUT5 #(
    .INIT(32'h00020000)) 
    Mem_reg_0_15_0_5_i_9
       (.I0(Mem_reg_0_15_0_5_i_3_1[0]),
        .I1(Mem_reg_0_15_0_5_i_3_0[3]),
        .I2(Mem_reg_0_15_0_5_i_3_0[2]),
        .I3(Mem_reg_0_15_6_11_i_11_n_0),
        .I4(Mem_reg_0_15_0_5_i_3_1[1]),
        .O(Mem_reg_0_15_0_5_i_9_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "512" *) 
  (* RTL_RAM_NAME = "u_trx_axi/u_f2u_fifo/Mem" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "17" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    Mem_reg_0_15_12_17
       (.ADDRA({1'b0,fifo_head_reg_rep}),
        .ADDRB({1'b0,fifo_head_reg_rep}),
        .ADDRC({1'b0,fifo_head_reg_rep}),
        .ADDRD({1'b0,fifo_tail[3:0]}),
        .DIA(f2u_fifo_wr_dat[13:12]),
        .DIB(f2u_fifo_wr_dat[15:14]),
        .DIC(f2u_fifo_wr_dat[17:16]),
        .DID({1'b0,1'b0}),
        .DOA(ACLK_0[13:12]),
        .DOB(ACLK_0[15:14]),
        .DOC(ACLK_0[17:16]),
        .DOD(NLW_Mem_reg_0_15_12_17_DOD_UNCONNECTED[1:0]),
        .WCLK(ACLK),
        .WE(Mem_reg_0_15_0_5_i_1__0_n_0));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    Mem_reg_0_15_12_17_i_1
       (.I0(Mem_reg_0_15_6_11_i_9_n_0),
        .I1(RDATA[13]),
        .I2(Mem_reg_0_15_6_11_i_10_n_0),
        .I3(RDATA[29]),
        .I4(Mem_reg_0_15_6_11_i_11_n_0),
        .I5(Mem_reg_0_15_30_31_0[13]),
        .O(f2u_fifo_wr_dat[13]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    Mem_reg_0_15_12_17_i_2
       (.I0(Mem_reg_0_15_6_11_i_9_n_0),
        .I1(RDATA[12]),
        .I2(Mem_reg_0_15_6_11_i_10_n_0),
        .I3(RDATA[28]),
        .I4(Mem_reg_0_15_6_11_i_11_n_0),
        .I5(Mem_reg_0_15_30_31_0[12]),
        .O(f2u_fifo_wr_dat[12]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    Mem_reg_0_15_12_17_i_3
       (.I0(Mem_reg_0_15_6_11_i_9_n_0),
        .I1(RDATA[15]),
        .I2(Mem_reg_0_15_6_11_i_10_n_0),
        .I3(RDATA[31]),
        .I4(Mem_reg_0_15_6_11_i_11_n_0),
        .I5(Mem_reg_0_15_30_31_0[15]),
        .O(f2u_fifo_wr_dat[15]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    Mem_reg_0_15_12_17_i_4
       (.I0(Mem_reg_0_15_6_11_i_9_n_0),
        .I1(RDATA[14]),
        .I2(Mem_reg_0_15_6_11_i_10_n_0),
        .I3(RDATA[30]),
        .I4(Mem_reg_0_15_6_11_i_11_n_0),
        .I5(Mem_reg_0_15_30_31_0[14]),
        .O(f2u_fifo_wr_dat[14]));
  LUT6 #(
    .INIT(64'hAAAAAAAACCC0C0C0)) 
    Mem_reg_0_15_12_17_i_5
       (.I0(Mem_reg_0_15_30_31_0[16]),
        .I1(RDATA[17]),
        .I2(Mem_reg_0_15_0_5_i_3_0[3]),
        .I3(Mem_reg_0_15_0_5_i_3_1[0]),
        .I4(Mem_reg_0_15_0_5_i_3_0[2]),
        .I5(Mem_reg_0_15_6_11_i_11_n_0),
        .O(f2u_fifo_wr_dat[17]));
  LUT5 #(
    .INIT(32'h55400000)) 
    Mem_reg_0_15_12_17_i_6
       (.I0(Mem_reg_0_15_6_11_i_11_n_0),
        .I1(Mem_reg_0_15_0_5_i_3_0[2]),
        .I2(Mem_reg_0_15_0_5_i_3_1[0]),
        .I3(Mem_reg_0_15_0_5_i_3_0[3]),
        .I4(RDATA[16]),
        .O(f2u_fifo_wr_dat[16]));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "512" *) 
  (* RTL_RAM_NAME = "u_trx_axi/u_f2u_fifo/Mem" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "23" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    Mem_reg_0_15_18_23
       (.ADDRA({1'b0,fifo_head_reg_rep}),
        .ADDRB({1'b0,fifo_head_reg_rep}),
        .ADDRC({1'b0,fifo_head_reg_rep}),
        .ADDRD({1'b0,fifo_tail[3:0]}),
        .DIA(f2u_fifo_wr_dat[19:18]),
        .DIB(f2u_fifo_wr_dat[21:20]),
        .DIC(f2u_fifo_wr_dat[23:22]),
        .DID({1'b0,1'b0}),
        .DOA(ACLK_0[19:18]),
        .DOB(ACLK_0[21:20]),
        .DOC(ACLK_0[23:22]),
        .DOD(NLW_Mem_reg_0_15_18_23_DOD_UNCONNECTED[1:0]),
        .WCLK(ACLK),
        .WE(Mem_reg_0_15_0_5_i_1__0_n_0));
  LUT6 #(
    .INIT(64'hAAAAAAAACCC0C0C0)) 
    Mem_reg_0_15_18_23_i_1
       (.I0(Mem_reg_0_15_30_31_0[17]),
        .I1(RDATA[19]),
        .I2(Mem_reg_0_15_0_5_i_3_0[3]),
        .I3(Mem_reg_0_15_0_5_i_3_1[0]),
        .I4(Mem_reg_0_15_0_5_i_3_0[2]),
        .I5(Mem_reg_0_15_6_11_i_11_n_0),
        .O(f2u_fifo_wr_dat[19]));
  LUT5 #(
    .INIT(32'h55400000)) 
    Mem_reg_0_15_18_23_i_2
       (.I0(Mem_reg_0_15_6_11_i_11_n_0),
        .I1(Mem_reg_0_15_0_5_i_3_0[2]),
        .I2(Mem_reg_0_15_0_5_i_3_1[0]),
        .I3(Mem_reg_0_15_0_5_i_3_0[3]),
        .I4(RDATA[18]),
        .O(f2u_fifo_wr_dat[18]));
  LUT5 #(
    .INIT(32'h55400000)) 
    Mem_reg_0_15_18_23_i_3
       (.I0(Mem_reg_0_15_6_11_i_11_n_0),
        .I1(Mem_reg_0_15_0_5_i_3_0[2]),
        .I2(Mem_reg_0_15_0_5_i_3_1[0]),
        .I3(Mem_reg_0_15_0_5_i_3_0[3]),
        .I4(RDATA[21]),
        .O(f2u_fifo_wr_dat[21]));
  LUT5 #(
    .INIT(32'h55400000)) 
    Mem_reg_0_15_18_23_i_4
       (.I0(Mem_reg_0_15_6_11_i_11_n_0),
        .I1(Mem_reg_0_15_0_5_i_3_0[2]),
        .I2(Mem_reg_0_15_0_5_i_3_1[0]),
        .I3(Mem_reg_0_15_0_5_i_3_0[3]),
        .I4(RDATA[20]),
        .O(f2u_fifo_wr_dat[20]));
  LUT5 #(
    .INIT(32'h55400000)) 
    Mem_reg_0_15_18_23_i_5
       (.I0(Mem_reg_0_15_6_11_i_11_n_0),
        .I1(Mem_reg_0_15_0_5_i_3_0[2]),
        .I2(Mem_reg_0_15_0_5_i_3_1[0]),
        .I3(Mem_reg_0_15_0_5_i_3_0[3]),
        .I4(RDATA[23]),
        .O(f2u_fifo_wr_dat[23]));
  LUT5 #(
    .INIT(32'h55400000)) 
    Mem_reg_0_15_18_23_i_6
       (.I0(Mem_reg_0_15_6_11_i_11_n_0),
        .I1(Mem_reg_0_15_0_5_i_3_0[2]),
        .I2(Mem_reg_0_15_0_5_i_3_1[0]),
        .I3(Mem_reg_0_15_0_5_i_3_0[3]),
        .I4(RDATA[22]),
        .O(f2u_fifo_wr_dat[22]));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "512" *) 
  (* RTL_RAM_NAME = "u_trx_axi/u_f2u_fifo/Mem" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "29" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    Mem_reg_0_15_24_29
       (.ADDRA({1'b0,fifo_head_reg_rep}),
        .ADDRB({1'b0,fifo_head_reg_rep}),
        .ADDRC({1'b0,fifo_head_reg_rep}),
        .ADDRD({1'b0,fifo_tail[3:0]}),
        .DIA(f2u_fifo_wr_dat[25:24]),
        .DIB(f2u_fifo_wr_dat[27:26]),
        .DIC(f2u_fifo_wr_dat[29:28]),
        .DID({1'b0,1'b0}),
        .DOA(ACLK_0[25:24]),
        .DOB(ACLK_0[27:26]),
        .DOC(ACLK_0[29:28]),
        .DOD(NLW_Mem_reg_0_15_24_29_DOD_UNCONNECTED[1:0]),
        .WCLK(ACLK),
        .WE(Mem_reg_0_15_0_5_i_1__0_n_0));
  LUT6 #(
    .INIT(64'hAAAAAAAACCC0C0C0)) 
    Mem_reg_0_15_24_29_i_1
       (.I0(Mem_reg_0_15_30_31_0[19]),
        .I1(RDATA[25]),
        .I2(Mem_reg_0_15_0_5_i_3_0[3]),
        .I3(Mem_reg_0_15_0_5_i_3_1[0]),
        .I4(Mem_reg_0_15_0_5_i_3_0[2]),
        .I5(Mem_reg_0_15_6_11_i_11_n_0),
        .O(f2u_fifo_wr_dat[25]));
  LUT6 #(
    .INIT(64'hAAAAAAAACCC0C0C0)) 
    Mem_reg_0_15_24_29_i_2
       (.I0(Mem_reg_0_15_30_31_0[18]),
        .I1(RDATA[24]),
        .I2(Mem_reg_0_15_0_5_i_3_0[3]),
        .I3(Mem_reg_0_15_0_5_i_3_1[0]),
        .I4(Mem_reg_0_15_0_5_i_3_0[2]),
        .I5(Mem_reg_0_15_6_11_i_11_n_0),
        .O(f2u_fifo_wr_dat[24]));
  LUT6 #(
    .INIT(64'hAAAAAAAACCC0C0C0)) 
    Mem_reg_0_15_24_29_i_3
       (.I0(Mem_reg_0_15_30_31_0[21]),
        .I1(RDATA[27]),
        .I2(Mem_reg_0_15_0_5_i_3_0[3]),
        .I3(Mem_reg_0_15_0_5_i_3_1[0]),
        .I4(Mem_reg_0_15_0_5_i_3_0[2]),
        .I5(Mem_reg_0_15_6_11_i_11_n_0),
        .O(f2u_fifo_wr_dat[27]));
  LUT6 #(
    .INIT(64'hAAAAAAAACCC0C0C0)) 
    Mem_reg_0_15_24_29_i_4
       (.I0(Mem_reg_0_15_30_31_0[20]),
        .I1(RDATA[26]),
        .I2(Mem_reg_0_15_0_5_i_3_0[3]),
        .I3(Mem_reg_0_15_0_5_i_3_1[0]),
        .I4(Mem_reg_0_15_0_5_i_3_0[2]),
        .I5(Mem_reg_0_15_6_11_i_11_n_0),
        .O(f2u_fifo_wr_dat[26]));
  LUT6 #(
    .INIT(64'hAAAAAAAACCC0C0C0)) 
    Mem_reg_0_15_24_29_i_5
       (.I0(Mem_reg_0_15_30_31_0[23]),
        .I1(RDATA[29]),
        .I2(Mem_reg_0_15_0_5_i_3_0[3]),
        .I3(Mem_reg_0_15_0_5_i_3_1[0]),
        .I4(Mem_reg_0_15_0_5_i_3_0[2]),
        .I5(Mem_reg_0_15_6_11_i_11_n_0),
        .O(f2u_fifo_wr_dat[29]));
  LUT6 #(
    .INIT(64'hAAAAAAAACCC0C0C0)) 
    Mem_reg_0_15_24_29_i_6
       (.I0(Mem_reg_0_15_30_31_0[22]),
        .I1(RDATA[28]),
        .I2(Mem_reg_0_15_0_5_i_3_0[3]),
        .I3(Mem_reg_0_15_0_5_i_3_1[0]),
        .I4(Mem_reg_0_15_0_5_i_3_0[2]),
        .I5(Mem_reg_0_15_6_11_i_11_n_0),
        .O(f2u_fifo_wr_dat[28]));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "512" *) 
  (* RTL_RAM_NAME = "u_trx_axi/u_f2u_fifo/Mem" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "31" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    Mem_reg_0_15_30_31
       (.ADDRA({1'b0,fifo_head_reg_rep}),
        .ADDRB({1'b0,fifo_head_reg_rep}),
        .ADDRC({1'b0,fifo_head_reg_rep}),
        .ADDRD({1'b0,fifo_tail[3:0]}),
        .DIA(f2u_fifo_wr_dat[31:30]),
        .DIB({1'b0,1'b0}),
        .DIC({1'b0,1'b0}),
        .DID({1'b0,1'b0}),
        .DOA(ACLK_0[31:30]),
        .DOB(NLW_Mem_reg_0_15_30_31_DOB_UNCONNECTED[1:0]),
        .DOC(NLW_Mem_reg_0_15_30_31_DOC_UNCONNECTED[1:0]),
        .DOD(NLW_Mem_reg_0_15_30_31_DOD_UNCONNECTED[1:0]),
        .WCLK(ACLK),
        .WE(Mem_reg_0_15_0_5_i_1__0_n_0));
  LUT6 #(
    .INIT(64'hAAAAAAAACCC0C0C0)) 
    Mem_reg_0_15_30_31_i_1
       (.I0(Mem_reg_0_15_30_31_0[25]),
        .I1(RDATA[31]),
        .I2(Mem_reg_0_15_0_5_i_3_0[3]),
        .I3(Mem_reg_0_15_0_5_i_3_1[0]),
        .I4(Mem_reg_0_15_0_5_i_3_0[2]),
        .I5(Mem_reg_0_15_6_11_i_11_n_0),
        .O(f2u_fifo_wr_dat[31]));
  LUT6 #(
    .INIT(64'hAAAAAAAACCC0C0C0)) 
    Mem_reg_0_15_30_31_i_2
       (.I0(Mem_reg_0_15_30_31_0[24]),
        .I1(RDATA[30]),
        .I2(Mem_reg_0_15_0_5_i_3_0[3]),
        .I3(Mem_reg_0_15_0_5_i_3_1[0]),
        .I4(Mem_reg_0_15_0_5_i_3_0[2]),
        .I5(Mem_reg_0_15_6_11_i_11_n_0),
        .O(f2u_fifo_wr_dat[30]));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "512" *) 
  (* RTL_RAM_NAME = "u_trx_axi/u_f2u_fifo/Mem" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "11" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    Mem_reg_0_15_6_11
       (.ADDRA({1'b0,fifo_head_reg_rep}),
        .ADDRB({1'b0,fifo_head_reg_rep}),
        .ADDRC({1'b0,fifo_head_reg_rep}),
        .ADDRD({1'b0,fifo_tail[3:0]}),
        .DIA(f2u_fifo_wr_dat[7:6]),
        .DIB(f2u_fifo_wr_dat[9:8]),
        .DIC(f2u_fifo_wr_dat[11:10]),
        .DID({1'b0,1'b0}),
        .DOA(ACLK_0[7:6]),
        .DOB(ACLK_0[9:8]),
        .DOC(ACLK_0[11:10]),
        .DOD(NLW_Mem_reg_0_15_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(ACLK),
        .WE(Mem_reg_0_15_0_5_i_1__0_n_0));
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    Mem_reg_0_15_6_11_i_1
       (.I0(Mem_reg_0_15_0_5_i_8_n_0),
        .I1(RDATA[15]),
        .I2(Mem_reg_0_15_0_5_i_9_n_0),
        .I3(RDATA[31]),
        .I4(Mem_reg_0_15_6_11_i_7_n_0),
        .O(f2u_fifo_wr_dat[7]));
  LUT5 #(
    .INIT(32'h00001000)) 
    Mem_reg_0_15_6_11_i_10
       (.I0(Mem_reg_0_15_6_11_i_11_n_0),
        .I1(Mem_reg_0_15_0_5_i_3_1[0]),
        .I2(Mem_reg_0_15_0_5_i_3_1[1]),
        .I3(Mem_reg_0_15_0_5_i_3_0[2]),
        .I4(Mem_reg_0_15_0_5_i_3_0[3]),
        .O(Mem_reg_0_15_6_11_i_10_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    Mem_reg_0_15_6_11_i_11
       (.I0(out[2]),
        .I1(out[1]),
        .I2(out[0]),
        .O(Mem_reg_0_15_6_11_i_11_n_0));
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    Mem_reg_0_15_6_11_i_2
       (.I0(Mem_reg_0_15_0_5_i_8_n_0),
        .I1(RDATA[14]),
        .I2(Mem_reg_0_15_0_5_i_9_n_0),
        .I3(RDATA[30]),
        .I4(Mem_reg_0_15_6_11_i_8_n_0),
        .O(f2u_fifo_wr_dat[6]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    Mem_reg_0_15_6_11_i_3
       (.I0(Mem_reg_0_15_6_11_i_9_n_0),
        .I1(RDATA[9]),
        .I2(Mem_reg_0_15_6_11_i_10_n_0),
        .I3(RDATA[25]),
        .I4(Mem_reg_0_15_6_11_i_11_n_0),
        .I5(Mem_reg_0_15_30_31_0[9]),
        .O(f2u_fifo_wr_dat[9]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    Mem_reg_0_15_6_11_i_4
       (.I0(Mem_reg_0_15_6_11_i_9_n_0),
        .I1(RDATA[8]),
        .I2(Mem_reg_0_15_6_11_i_10_n_0),
        .I3(RDATA[24]),
        .I4(Mem_reg_0_15_6_11_i_11_n_0),
        .I5(Mem_reg_0_15_30_31_0[8]),
        .O(f2u_fifo_wr_dat[8]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    Mem_reg_0_15_6_11_i_5
       (.I0(Mem_reg_0_15_6_11_i_9_n_0),
        .I1(RDATA[11]),
        .I2(Mem_reg_0_15_6_11_i_10_n_0),
        .I3(RDATA[27]),
        .I4(Mem_reg_0_15_6_11_i_11_n_0),
        .I5(Mem_reg_0_15_30_31_0[11]),
        .O(f2u_fifo_wr_dat[11]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    Mem_reg_0_15_6_11_i_6
       (.I0(Mem_reg_0_15_6_11_i_9_n_0),
        .I1(RDATA[10]),
        .I2(Mem_reg_0_15_6_11_i_10_n_0),
        .I3(RDATA[26]),
        .I4(Mem_reg_0_15_6_11_i_11_n_0),
        .I5(Mem_reg_0_15_30_31_0[10]),
        .O(f2u_fifo_wr_dat[10]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    Mem_reg_0_15_6_11_i_7
       (.I0(Mem_reg_0_15_0_5_i_16_n_0),
        .I1(RDATA[7]),
        .I2(Mem_reg_0_15_30_31_0[7]),
        .I3(Mem_reg_0_15_6_11_i_11_n_0),
        .I4(RDATA[23]),
        .I5(Mem_reg_0_15_0_5_i_17_n_0),
        .O(Mem_reg_0_15_6_11_i_7_n_0));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    Mem_reg_0_15_6_11_i_8
       (.I0(Mem_reg_0_15_0_5_i_16_n_0),
        .I1(RDATA[6]),
        .I2(Mem_reg_0_15_30_31_0[6]),
        .I3(Mem_reg_0_15_6_11_i_11_n_0),
        .I4(RDATA[22]),
        .I5(Mem_reg_0_15_0_5_i_17_n_0),
        .O(Mem_reg_0_15_6_11_i_8_n_0));
  LUT5 #(
    .INIT(32'h0000FBAA)) 
    Mem_reg_0_15_6_11_i_9
       (.I0(Mem_reg_0_15_0_5_i_3_0[3]),
        .I1(Mem_reg_0_15_0_5_i_3_1[1]),
        .I2(Mem_reg_0_15_0_5_i_3_1[0]),
        .I3(Mem_reg_0_15_0_5_i_3_0[2]),
        .I4(Mem_reg_0_15_6_11_i_11_n_0),
        .O(Mem_reg_0_15_6_11_i_9_n_0));
  LUT4 #(
    .INIT(16'h0100)) 
    RREADY_INST_0
       (.I0(rd_cnt_reg_n_0_[4]),
        .I1(out[0]),
        .I2(out[2]),
        .I3(out[1]),
        .O(RREADY));
  LUT5 #(
    .INIT(32'h6FF6FFFF)) 
    \WIDTH_34.BLK_512.u_fifo_i_1 
       (.I0(fifo_head[4]),
        .I1(fifo_tail[4]),
        .I2(fifo_head[0]),
        .I3(fifo_tail[0]),
        .I4(\WIDTH_34.BLK_512.u_fifo_i_3_n_0 ),
        .O(f2u_wr_valid));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \WIDTH_34.BLK_512.u_fifo_i_3 
       (.I0(fifo_tail[3]),
        .I1(fifo_head[3]),
        .I2(fifo_tail[1]),
        .I3(fifo_head[1]),
        .I4(fifo_head[2]),
        .I5(fifo_tail[2]),
        .O(\WIDTH_34.BLK_512.u_fifo_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00200000)) 
    \addrR[31]_i_1 
       (.I0(last_resp0__0),
        .I1(out[0]),
        .I2(out[1]),
        .I3(Mem_reg_0_15_0_5_i_3_0[1]),
        .I4(Mem_reg_0_15_0_5_i_3_0[0]),
        .I5(addrR_reg),
        .O(E));
  LUT5 #(
    .INIT(32'hFFFF0020)) 
    \countR[8]_i_1 
       (.I0(last_resp0__0),
        .I1(CO),
        .I2(out[1]),
        .I3(out[0]),
        .I4(addrR_reg),
        .O(\state_read_reg[1] ));
  LUT5 #(
    .INIT(32'h00040000)) 
    \countR[8]_i_3 
       (.I0(out[0]),
        .I1(RVALID),
        .I2(rd_cnt_reg_n_0_[4]),
        .I3(out[2]),
        .I4(out[1]),
        .O(last_resp0__0));
  LUT1 #(
    .INIT(2'h1)) 
    \fifo_head[4]_i_1__0 
       (.I0(\fifo_head[4]_i_2_n_0 ),
        .O(fifo_head0));
  LUT6 #(
    .INIT(64'h90090000FFFFFFFF)) 
    \fifo_head[4]_i_2 
       (.I0(fifo_head[4]),
        .I1(fifo_tail[4]),
        .I2(fifo_head[0]),
        .I3(fifo_tail[0]),
        .I4(\WIDTH_34.BLK_512.u_fifo_i_3_n_0 ),
        .I5(f2u_wr_ready),
        .O(\fifo_head[4]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \fifo_head_reg[0] 
       (.C(ACLK),
        .CE(fifo_head0),
        .CLR(\next_tail_reg[1]_0 ),
        .D(next_head_reg[0]),
        .Q(fifo_head[0]));
  FDCE #(
    .INIT(1'b0)) 
    \fifo_head_reg[1] 
       (.C(ACLK),
        .CE(fifo_head0),
        .CLR(\next_tail_reg[1]_0 ),
        .D(next_head_reg[1]),
        .Q(fifo_head[1]));
  FDCE #(
    .INIT(1'b0)) 
    \fifo_head_reg[2] 
       (.C(ACLK),
        .CE(fifo_head0),
        .CLR(\next_tail_reg[1]_0 ),
        .D(next_head_reg[2]),
        .Q(fifo_head[2]));
  FDCE #(
    .INIT(1'b0)) 
    \fifo_head_reg[3] 
       (.C(ACLK),
        .CE(fifo_head0),
        .CLR(\next_tail_reg[1]_0 ),
        .D(next_head_reg[3]),
        .Q(fifo_head[3]));
  FDCE #(
    .INIT(1'b0)) 
    \fifo_head_reg[4] 
       (.C(ACLK),
        .CE(fifo_head0),
        .CLR(\next_tail_reg[1]_0 ),
        .D(next_head_reg[4]),
        .Q(fifo_head[4]));
  FDCE #(
    .INIT(1'b0)) 
    \fifo_head_reg_rep[0] 
       (.C(ACLK),
        .CE(fifo_head0),
        .CLR(\next_tail_reg[1]_0 ),
        .D(next_head_reg[0]),
        .Q(fifo_head_reg_rep[0]));
  FDCE #(
    .INIT(1'b0)) 
    \fifo_head_reg_rep[1] 
       (.C(ACLK),
        .CE(fifo_head0),
        .CLR(\next_tail_reg[1]_0 ),
        .D(next_head_reg[1]),
        .Q(fifo_head_reg_rep[1]));
  FDCE #(
    .INIT(1'b0)) 
    \fifo_head_reg_rep[2] 
       (.C(ACLK),
        .CE(fifo_head0),
        .CLR(\next_tail_reg[1]_0 ),
        .D(next_head_reg[2]),
        .Q(fifo_head_reg_rep[2]));
  FDCE #(
    .INIT(1'b0)) 
    \fifo_head_reg_rep[3] 
       (.C(ACLK),
        .CE(fifo_head0),
        .CLR(\next_tail_reg[1]_0 ),
        .D(next_head_reg[3]),
        .Q(fifo_head_reg_rep[3]));
  FDCE #(
    .INIT(1'b0)) 
    \fifo_tail_reg[0] 
       (.C(ACLK),
        .CE(Mem_reg_0_15_0_5_i_1__0_n_0),
        .CLR(\next_tail_reg[1]_0 ),
        .D(next_tail_reg[0]),
        .Q(fifo_tail[0]));
  FDCE #(
    .INIT(1'b0)) 
    \fifo_tail_reg[1] 
       (.C(ACLK),
        .CE(Mem_reg_0_15_0_5_i_1__0_n_0),
        .CLR(\next_tail_reg[1]_0 ),
        .D(next_tail_reg[1]),
        .Q(fifo_tail[1]));
  FDCE #(
    .INIT(1'b0)) 
    \fifo_tail_reg[2] 
       (.C(ACLK),
        .CE(Mem_reg_0_15_0_5_i_1__0_n_0),
        .CLR(\next_tail_reg[1]_0 ),
        .D(next_tail_reg[2]),
        .Q(fifo_tail[2]));
  FDCE #(
    .INIT(1'b0)) 
    \fifo_tail_reg[3] 
       (.C(ACLK),
        .CE(Mem_reg_0_15_0_5_i_1__0_n_0),
        .CLR(\next_tail_reg[1]_0 ),
        .D(next_tail_reg[3]),
        .Q(fifo_tail[3]));
  FDCE #(
    .INIT(1'b0)) 
    \fifo_tail_reg[4] 
       (.C(ACLK),
        .CE(Mem_reg_0_15_0_5_i_1__0_n_0),
        .CLR(\next_tail_reg[1]_0 ),
        .D(next_tail_reg[4]),
        .Q(fifo_tail[4]));
  LUT6 #(
    .INIT(64'hCCAFAFAFCCA0A0A0)) 
    \last_resp[0]_i_1 
       (.I0(RRESP[0]),
        .I1(BRESP[0]),
        .I2(last_resp0__0),
        .I3(last_resp_reg),
        .I4(BVALID),
        .I5(\last_resp_reg[1] [0]),
        .O(RRESP_0_sn_1));
  LUT6 #(
    .INIT(64'hCCAFAFAFCCA0A0A0)) 
    \last_resp[1]_i_1 
       (.I0(RRESP[1]),
        .I1(BRESP[1]),
        .I2(last_resp0__0),
        .I3(last_resp_reg),
        .I4(BVALID),
        .I5(\last_resp_reg[1] [1]),
        .O(RRESP_1_sn_1));
  LUT1 #(
    .INIT(2'h1)) 
    \next_head[0]_i_1__0 
       (.I0(next_head_reg[0]),
        .O(\next_head[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \next_head[1]_i_1 
       (.I0(next_head_reg[0]),
        .I1(next_head_reg[1]),
        .O(\next_head[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \next_head[2]_i_1 
       (.I0(next_head_reg[0]),
        .I1(next_head_reg[1]),
        .I2(next_head_reg[2]),
        .O(\next_head[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \next_head[3]_i_1 
       (.I0(next_head_reg[3]),
        .I1(next_head_reg[0]),
        .I2(next_head_reg[1]),
        .I3(next_head_reg[2]),
        .O(\next_head[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \next_head[4]_i_1 
       (.I0(next_head_reg[3]),
        .I1(next_head_reg[0]),
        .I2(next_head_reg[1]),
        .I3(next_head_reg[2]),
        .I4(next_head_reg[4]),
        .O(\next_head[4]_i_1_n_0 ));
  FDPE #(
    .INIT(1'b1)) 
    \next_head_reg[0] 
       (.C(ACLK),
        .CE(fifo_head0),
        .D(\next_head[0]_i_1__0_n_0 ),
        .PRE(\next_tail_reg[1]_0 ),
        .Q(next_head_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \next_head_reg[1] 
       (.C(ACLK),
        .CE(fifo_head0),
        .CLR(\next_tail_reg[1]_0 ),
        .D(\next_head[1]_i_1_n_0 ),
        .Q(next_head_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \next_head_reg[2] 
       (.C(ACLK),
        .CE(fifo_head0),
        .CLR(\next_tail_reg[1]_0 ),
        .D(\next_head[2]_i_1_n_0 ),
        .Q(next_head_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \next_head_reg[3] 
       (.C(ACLK),
        .CE(fifo_head0),
        .CLR(\next_tail_reg[1]_0 ),
        .D(\next_head[3]_i_1_n_0 ),
        .Q(next_head_reg[3]));
  FDCE #(
    .INIT(1'b0)) 
    \next_head_reg[4] 
       (.C(ACLK),
        .CE(fifo_head0),
        .CLR(\next_tail_reg[1]_0 ),
        .D(\next_head[4]_i_1_n_0 ),
        .Q(next_head_reg[4]));
  LUT1 #(
    .INIT(2'h1)) 
    \next_tail[0]_i_1__0 
       (.I0(next_tail_reg[0]),
        .O(\next_tail[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \next_tail[1]_i_1__0 
       (.I0(next_tail_reg[0]),
        .I1(next_tail_reg[1]),
        .O(\next_tail[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \next_tail[2]_i_1__0 
       (.I0(next_tail_reg[0]),
        .I1(next_tail_reg[1]),
        .I2(next_tail_reg[2]),
        .O(\next_tail[2]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \next_tail[3]_i_1 
       (.I0(next_tail_reg[3]),
        .I1(next_tail_reg[0]),
        .I2(next_tail_reg[1]),
        .I3(next_tail_reg[2]),
        .O(\next_tail[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \next_tail[4]_i_1 
       (.I0(next_tail_reg[3]),
        .I1(next_tail_reg[0]),
        .I2(next_tail_reg[1]),
        .I3(next_tail_reg[2]),
        .I4(next_tail_reg[4]),
        .O(\next_tail[4]_i_1_n_0 ));
  FDPE #(
    .INIT(1'b1)) 
    \next_tail_reg[0] 
       (.C(ACLK),
        .CE(Mem_reg_0_15_0_5_i_1__0_n_0),
        .D(\next_tail[0]_i_1__0_n_0 ),
        .PRE(\next_tail_reg[1]_0 ),
        .Q(next_tail_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \next_tail_reg[1] 
       (.C(ACLK),
        .CE(Mem_reg_0_15_0_5_i_1__0_n_0),
        .CLR(\next_tail_reg[1]_0 ),
        .D(\next_tail[1]_i_1__0_n_0 ),
        .Q(next_tail_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \next_tail_reg[2] 
       (.C(ACLK),
        .CE(Mem_reg_0_15_0_5_i_1__0_n_0),
        .CLR(\next_tail_reg[1]_0 ),
        .D(\next_tail[2]_i_1__0_n_0 ),
        .Q(next_tail_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \next_tail_reg[3] 
       (.C(ACLK),
        .CE(Mem_reg_0_15_0_5_i_1__0_n_0),
        .CLR(\next_tail_reg[1]_0 ),
        .D(\next_tail[3]_i_1_n_0 ),
        .Q(next_tail_reg[3]));
  FDCE #(
    .INIT(1'b0)) 
    \next_tail_reg[4] 
       (.C(ACLK),
        .CE(Mem_reg_0_15_0_5_i_1__0_n_0),
        .CLR(\next_tail_reg[1]_0 ),
        .D(\next_tail[4]_i_1_n_0 ),
        .Q(next_tail_reg[4]));
  LUT1 #(
    .INIT(2'h1)) 
    \rd_cnt[0]_i_1 
       (.I0(rd_cnt_reg_n_0_[0]),
        .O(\rd_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \rd_cnt[1]_i_1 
       (.I0(rd_cnt_reg_n_0_[1]),
        .I1(rd_cnt13_out),
        .I2(rd_cnt_reg_n_0_[0]),
        .O(\rd_cnt[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000000000A800)) 
    \rd_cnt[1]_i_2__0 
       (.I0(\fifo_head[4]_i_2_n_0 ),
        .I1(out[0]),
        .I2(RVALID),
        .I3(out[1]),
        .I4(out[2]),
        .I5(rd_cnt_reg_n_0_[4]),
        .O(rd_cnt13_out));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \rd_cnt[2]_i_1__0 
       (.I0(\rd_cnt[2]_i_2_n_0 ),
        .I1(rd_cnt_reg_n_0_[1]),
        .I2(rd_cnt_reg_n_0_[2]),
        .O(\rd_cnt[2]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hD4)) 
    \rd_cnt[2]_i_2 
       (.I0(rd_cnt_reg_n_0_[1]),
        .I1(rd_cnt13_out),
        .I2(rd_cnt_reg_n_0_[0]),
        .O(\rd_cnt[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \rd_cnt[3]_i_1__0 
       (.I0(rd_cnt_reg_n_0_[3]),
        .I1(rd_cnt_reg_n_0_[2]),
        .I2(\rd_cnt[4]_i_3_n_0 ),
        .O(\rd_cnt[3]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h10101000EFEFEFFF)) 
    \rd_cnt[4]_i_1__0 
       (.I0(rd_cnt_reg_n_0_[4]),
        .I1(out[2]),
        .I2(out[1]),
        .I3(RVALID),
        .I4(out[0]),
        .I5(\fifo_head[4]_i_2_n_0 ),
        .O(\rd_cnt[4]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'h6AA9)) 
    \rd_cnt[4]_i_2__0 
       (.I0(rd_cnt_reg_n_0_[4]),
        .I1(rd_cnt_reg_n_0_[3]),
        .I2(rd_cnt_reg_n_0_[2]),
        .I3(\rd_cnt[4]_i_3_n_0 ),
        .O(\rd_cnt[4]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'h8E)) 
    \rd_cnt[4]_i_3 
       (.I0(\rd_cnt[2]_i_2_n_0 ),
        .I1(rd_cnt_reg_n_0_[1]),
        .I2(rd_cnt_reg_n_0_[2]),
        .O(\rd_cnt[4]_i_3_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \rd_cnt_reg[0] 
       (.C(ACLK),
        .CE(\rd_cnt[4]_i_1__0_n_0 ),
        .CLR(\next_tail_reg[1]_0 ),
        .D(\rd_cnt[0]_i_1_n_0 ),
        .Q(rd_cnt_reg_n_0_[0]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_cnt_reg[1] 
       (.C(ACLK),
        .CE(\rd_cnt[4]_i_1__0_n_0 ),
        .CLR(\next_tail_reg[1]_0 ),
        .D(\rd_cnt[1]_i_1_n_0 ),
        .Q(rd_cnt_reg_n_0_[1]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_cnt_reg[2] 
       (.C(ACLK),
        .CE(\rd_cnt[4]_i_1__0_n_0 ),
        .CLR(\next_tail_reg[1]_0 ),
        .D(\rd_cnt[2]_i_1__0_n_0 ),
        .Q(rd_cnt_reg_n_0_[2]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_cnt_reg[3] 
       (.C(ACLK),
        .CE(\rd_cnt[4]_i_1__0_n_0 ),
        .CLR(\next_tail_reg[1]_0 ),
        .D(\rd_cnt[3]_i_1__0_n_0 ),
        .Q(rd_cnt_reg_n_0_[3]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_cnt_reg[4] 
       (.C(ACLK),
        .CE(\rd_cnt[4]_i_1__0_n_0 ),
        .CLR(\next_tail_reg[1]_0 ),
        .D(\rd_cnt[4]_i_2__0_n_0 ),
        .Q(rd_cnt_reg_n_0_[4]));
  LUT6 #(
    .INIT(64'hBBBBBABB88888A88)) 
    read_done_i_1
       (.I0(read_done_i_2_n_0),
        .I1(read_done_i_3_n_0),
        .I2(read_done_i_4_n_0),
        .I3(out[1]),
        .I4(out[0]),
        .I5(read_done_reg),
        .O(\state_read_reg[1]_0 ));
  LUT6 #(
    .INIT(64'h002200F20022FFF2)) 
    read_done_i_2
       (.I0(read_go),
        .I1(out[1]),
        .I2(CO),
        .I3(out[0]),
        .I4(out[2]),
        .I5(rd_cnt_reg_n_0_[4]),
        .O(read_done_i_2_n_0));
  LUT5 #(
    .INIT(32'hDDCCCC0C)) 
    read_done_i_3
       (.I0(rd_cnt_reg_n_0_[4]),
        .I1(out[2]),
        .I2(read_go),
        .I3(out[0]),
        .I4(out[1]),
        .O(read_done_i_3_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFF7FFFF)) 
    read_done_i_4
       (.I0(CO),
        .I1(out[1]),
        .I2(out[2]),
        .I3(rd_cnt_reg_n_0_[4]),
        .I4(RVALID),
        .I5(out[0]),
        .O(read_done_i_4_n_0));
  LUT6 #(
    .INIT(64'h0000CC55000000F0)) 
    \state_read[0]_i_1 
       (.I0(ARREADY),
        .I1(rd_cnt_reg_n_0_[4]),
        .I2(read_go),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(D[0]));
  LUT4 #(
    .INIT(16'hFF40)) 
    \state_read[1]_i_1 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(\state_read[2]_i_2_n_0 ),
        .I3(\state_read_reg[1]_1 ),
        .O(D[1]));
  LUT5 #(
    .INIT(32'h00330A00)) 
    \state_read[2]_i_1 
       (.I0(read_go),
        .I1(\state_read[2]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(Q[1]),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hFF55FF55FF15FF55)) 
    \state_read[2]_i_2 
       (.I0(Q[0]),
        .I1(CO),
        .I2(state_read_reg),
        .I3(rd_cnt_reg_n_0_[4]),
        .I4(RVALID),
        .I5(out[0]),
        .O(\state_read[2]_i_2_n_0 ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
