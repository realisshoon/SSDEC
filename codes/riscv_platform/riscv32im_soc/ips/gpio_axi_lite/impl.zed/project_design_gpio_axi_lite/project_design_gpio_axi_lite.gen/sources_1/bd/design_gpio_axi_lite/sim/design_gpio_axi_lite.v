//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
//Date        : Mon Oct 20 13:11:00 2025
//Host        : sogang-500TGA-500SGA running 64-bit Ubuntu 22.04.5 LTS
//Command     : generate_target design_gpio_axi_lite.bd
//Design      : design_gpio_axi_lite
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_gpio_axi_lite,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_gpio_axi_lite,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=10,numReposBlks=10,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_gpio_axi_lite.hwdef" *) 
module design_gpio_axi_lite
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.BOARD_CLK_IN CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.BOARD_CLK_IN, CLK_DOMAIN design_gpio_axi_lite_BOARD_CLK_IN, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input BOARD_CLK_IN;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.BOARD_RST_SW RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.BOARD_RST_SW, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input BOARD_RST_SW;
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.SL_RST_N RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.SL_RST_N, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input SL_RST_N;
  output SL_WR_N;

  wire BOARD_CLK_IN_1;
  wire BOARD_RST_SW_1;
  wire BTND_1;
  wire BTNL_1;
  wire BTNR_1;
  wire BTNU_1;
  wire [31:0]Net;
  wire SL_FLAGA_0_1;
  wire SL_FLAGB_0_1;
  wire SL_FLAGC_0_1;
  wire SL_FLAGD_0_1;
  wire [1:0]SL_MODE_0_1;
  wire SL_RST_N_0_1;
  wire [31:0]axi4_to_lite_0_m_axil_ARADDR;
  wire axi4_to_lite_0_m_axil_ARREADY;
  wire axi4_to_lite_0_m_axil_ARVALID;
  wire [31:0]axi4_to_lite_0_m_axil_AWADDR;
  wire axi4_to_lite_0_m_axil_AWREADY;
  wire axi4_to_lite_0_m_axil_AWVALID;
  wire axi4_to_lite_0_m_axil_BREADY;
  wire [1:0]axi4_to_lite_0_m_axil_BRESP;
  wire axi4_to_lite_0_m_axil_BVALID;
  wire [31:0]axi4_to_lite_0_m_axil_RDATA;
  wire axi4_to_lite_0_m_axil_RREADY;
  wire [1:0]axi4_to_lite_0_m_axil_RRESP;
  wire axi4_to_lite_0_m_axil_RVALID;
  wire [31:0]axi4_to_lite_0_m_axil_WDATA;
  wire axi4_to_lite_0_m_axil_WREADY;
  wire axi4_to_lite_0_m_axil_WVALID;
  wire [15:0]bfm_axi_if_0_GPOUT;
  wire [1:0]bfm_axi_if_0_SL_AD;
  wire bfm_axi_if_0_SL_CS_N;
  wire bfm_axi_if_0_SL_OE_N;
  wire bfm_axi_if_0_SL_PCLK;
  wire bfm_axi_if_0_SL_PKTEND_N;
  wire bfm_axi_if_0_SL_RD_N;
  wire bfm_axi_if_0_SL_WR_N;
  wire [31:0]bfm_axi_if_0_m_axi_ARADDR;
  wire [1:0]bfm_axi_if_0_m_axi_ARBURST;
  wire [3:0]bfm_axi_if_0_m_axi_ARID;
  wire [7:0]bfm_axi_if_0_m_axi_ARLEN;
  wire bfm_axi_if_0_m_axi_ARREADY;
  wire [2:0]bfm_axi_if_0_m_axi_ARSIZE;
  wire bfm_axi_if_0_m_axi_ARVALID;
  wire [31:0]bfm_axi_if_0_m_axi_AWADDR;
  wire [1:0]bfm_axi_if_0_m_axi_AWBURST;
  wire [3:0]bfm_axi_if_0_m_axi_AWID;
  wire [7:0]bfm_axi_if_0_m_axi_AWLEN;
  wire bfm_axi_if_0_m_axi_AWREADY;
  wire [2:0]bfm_axi_if_0_m_axi_AWSIZE;
  wire bfm_axi_if_0_m_axi_AWVALID;
  wire [3:0]bfm_axi_if_0_m_axi_BID;
  wire bfm_axi_if_0_m_axi_BREADY;
  wire [1:0]bfm_axi_if_0_m_axi_BRESP;
  wire bfm_axi_if_0_m_axi_BVALID;
  wire [31:0]bfm_axi_if_0_m_axi_RDATA;
  wire [3:0]bfm_axi_if_0_m_axi_RID;
  wire bfm_axi_if_0_m_axi_RLAST;
  wire bfm_axi_if_0_m_axi_RREADY;
  wire [1:0]bfm_axi_if_0_m_axi_RRESP;
  wire bfm_axi_if_0_m_axi_RVALID;
  wire [31:0]bfm_axi_if_0_m_axi_WDATA;
  wire bfm_axi_if_0_m_axi_WLAST;
  wire bfm_axi_if_0_m_axi_WREADY;
  wire [3:0]bfm_axi_if_0_m_axi_WSTRB;
  wire bfm_axi_if_0_m_axi_WVALID;
  wire clk_wiz_0_clk_out1;
  wire clk_wiz_0_clk_out2;
  wire clk_wiz_0_locked;
  wire [3:0]gpio_axi_lite_0_gpio_out;
  wire [0:0]proc_sys_reset_0_interconnect_aresetn;
  wire [0:0]proc_sys_reset_0_peripheral_aresetn;
  wire util_vector_logic_0_Res;
  wire [3:0]xlconcat_0_dout;
  wire [0:0]xlslice_0_Dout;
  wire [0:0]xlslice_1_Dout;
  wire [0:0]xlslice_2_Dout;
  wire [0:0]xlslice_3_Dout;

  assign BOARD_CLK_IN_1 = BOARD_CLK_IN;
  assign BOARD_RST_SW_1 = BOARD_RST_SW;
  assign BTND_1 = BTND;
  assign BTNL_1 = BTNL;
  assign BTNR_1 = BTNR;
  assign BTNU_1 = BTNU;
  assign LED0[0] = xlslice_0_Dout;
  assign LED1[0] = xlslice_1_Dout;
  assign LED2[0] = xlslice_2_Dout;
  assign LED3[0] = xlslice_3_Dout;
  assign SL_AD[1:0] = bfm_axi_if_0_SL_AD;
  assign SL_CS_N = bfm_axi_if_0_SL_CS_N;
  assign SL_FLAGA_0_1 = SL_FLAGA;
  assign SL_FLAGB_0_1 = SL_FLAGB;
  assign SL_FLAGC_0_1 = SL_FLAGC;
  assign SL_FLAGD_0_1 = SL_FLAGD;
  assign SL_MODE_0_1 = SL_MODE[1:0];
  assign SL_OE_N = bfm_axi_if_0_SL_OE_N;
  assign SL_PCLK = bfm_axi_if_0_SL_PCLK;
  assign SL_PKTEND_N = bfm_axi_if_0_SL_PKTEND_N;
  assign SL_RD_N = bfm_axi_if_0_SL_RD_N;
  assign SL_RST_N_0_1 = SL_RST_N;
  assign SL_WR_N = bfm_axi_if_0_SL_WR_N;
  design_gpio_axi_lite_axi4_to_lite_0_0 axi4_to_lite_0
       (.axi_aclk(clk_wiz_0_clk_out2),
        .axi_aresetn(proc_sys_reset_0_interconnect_aresetn),
        .axil_aclk(clk_wiz_0_clk_out2),
        .axil_aresetn(proc_sys_reset_0_interconnect_aresetn),
        .m_axil_araddr(axi4_to_lite_0_m_axil_ARADDR),
        .m_axil_arready(axi4_to_lite_0_m_axil_ARREADY),
        .m_axil_arvalid(axi4_to_lite_0_m_axil_ARVALID),
        .m_axil_awaddr(axi4_to_lite_0_m_axil_AWADDR),
        .m_axil_awready(axi4_to_lite_0_m_axil_AWREADY),
        .m_axil_awvalid(axi4_to_lite_0_m_axil_AWVALID),
        .m_axil_bready(axi4_to_lite_0_m_axil_BREADY),
        .m_axil_bresp(axi4_to_lite_0_m_axil_BRESP),
        .m_axil_bvalid(axi4_to_lite_0_m_axil_BVALID),
        .m_axil_rdata(axi4_to_lite_0_m_axil_RDATA),
        .m_axil_rready(axi4_to_lite_0_m_axil_RREADY),
        .m_axil_rresp(axi4_to_lite_0_m_axil_RRESP),
        .m_axil_rvalid(axi4_to_lite_0_m_axil_RVALID),
        .m_axil_wdata(axi4_to_lite_0_m_axil_WDATA),
        .m_axil_wready(axi4_to_lite_0_m_axil_WREADY),
        .m_axil_wvalid(axi4_to_lite_0_m_axil_WVALID),
        .s_axi_araddr(bfm_axi_if_0_m_axi_ARADDR),
        .s_axi_arburst(bfm_axi_if_0_m_axi_ARBURST),
        .s_axi_arid(bfm_axi_if_0_m_axi_ARID),
        .s_axi_arlen(bfm_axi_if_0_m_axi_ARLEN),
        .s_axi_arready(bfm_axi_if_0_m_axi_ARREADY),
        .s_axi_arsize(bfm_axi_if_0_m_axi_ARSIZE),
        .s_axi_arvalid(bfm_axi_if_0_m_axi_ARVALID),
        .s_axi_awaddr(bfm_axi_if_0_m_axi_AWADDR),
        .s_axi_awburst(bfm_axi_if_0_m_axi_AWBURST),
        .s_axi_awid(bfm_axi_if_0_m_axi_AWID),
        .s_axi_awlen(bfm_axi_if_0_m_axi_AWLEN),
        .s_axi_awready(bfm_axi_if_0_m_axi_AWREADY),
        .s_axi_awsize(bfm_axi_if_0_m_axi_AWSIZE),
        .s_axi_awvalid(bfm_axi_if_0_m_axi_AWVALID),
        .s_axi_bid(bfm_axi_if_0_m_axi_BID),
        .s_axi_bready(bfm_axi_if_0_m_axi_BREADY),
        .s_axi_bresp(bfm_axi_if_0_m_axi_BRESP),
        .s_axi_bvalid(bfm_axi_if_0_m_axi_BVALID),
        .s_axi_rdata(bfm_axi_if_0_m_axi_RDATA),
        .s_axi_rid(bfm_axi_if_0_m_axi_RID),
        .s_axi_rlast(bfm_axi_if_0_m_axi_RLAST),
        .s_axi_rready(bfm_axi_if_0_m_axi_RREADY),
        .s_axi_rresp(bfm_axi_if_0_m_axi_RRESP),
        .s_axi_rvalid(bfm_axi_if_0_m_axi_RVALID),
        .s_axi_wdata(bfm_axi_if_0_m_axi_WDATA),
        .s_axi_wlast(bfm_axi_if_0_m_axi_WLAST),
        .s_axi_wready(bfm_axi_if_0_m_axi_WREADY),
        .s_axi_wstrb(bfm_axi_if_0_m_axi_WSTRB),
        .s_axi_wvalid(bfm_axi_if_0_m_axi_WVALID));
  design_gpio_axi_lite_bfm_axi_if_0_0 bfm_axi_if_0
       (.GPIN(bfm_axi_if_0_GPOUT),
        .GPOUT(bfm_axi_if_0_GPOUT),
        .SL_AD(bfm_axi_if_0_SL_AD),
        .SL_CS_N(bfm_axi_if_0_SL_CS_N),
        .SL_DT(SL_DT[31:0]),
        .SL_FLAGA(SL_FLAGA_0_1),
        .SL_FLAGB(SL_FLAGB_0_1),
        .SL_FLAGC(SL_FLAGC_0_1),
        .SL_FLAGD(SL_FLAGD_0_1),
        .SL_MODE(SL_MODE_0_1),
        .SL_OE_N(bfm_axi_if_0_SL_OE_N),
        .SL_PCLK(bfm_axi_if_0_SL_PCLK),
        .SL_PKTEND_N(bfm_axi_if_0_SL_PKTEND_N),
        .SL_RD_N(bfm_axi_if_0_SL_RD_N),
        .SL_RST_N(SL_RST_N_0_1),
        .SL_WR_N(bfm_axi_if_0_SL_WR_N),
        .SYS_CLK(clk_wiz_0_clk_out1),
        .SYS_CLK_STABLE(clk_wiz_0_locked),
        .SYS_RST_N(util_vector_logic_0_Res),
        .m_axi_aclk(clk_wiz_0_clk_out2),
        .m_axi_araddr(bfm_axi_if_0_m_axi_ARADDR),
        .m_axi_arburst(bfm_axi_if_0_m_axi_ARBURST),
        .m_axi_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .m_axi_arid(bfm_axi_if_0_m_axi_ARID),
        .m_axi_arlen(bfm_axi_if_0_m_axi_ARLEN),
        .m_axi_arready(bfm_axi_if_0_m_axi_ARREADY),
        .m_axi_arsize(bfm_axi_if_0_m_axi_ARSIZE),
        .m_axi_arvalid(bfm_axi_if_0_m_axi_ARVALID),
        .m_axi_awaddr(bfm_axi_if_0_m_axi_AWADDR),
        .m_axi_awburst(bfm_axi_if_0_m_axi_AWBURST),
        .m_axi_awid(bfm_axi_if_0_m_axi_AWID),
        .m_axi_awlen(bfm_axi_if_0_m_axi_AWLEN),
        .m_axi_awready(bfm_axi_if_0_m_axi_AWREADY),
        .m_axi_awsize(bfm_axi_if_0_m_axi_AWSIZE),
        .m_axi_awvalid(bfm_axi_if_0_m_axi_AWVALID),
        .m_axi_bid(bfm_axi_if_0_m_axi_BID),
        .m_axi_bready(bfm_axi_if_0_m_axi_BREADY),
        .m_axi_bresp(bfm_axi_if_0_m_axi_BRESP),
        .m_axi_bvalid(bfm_axi_if_0_m_axi_BVALID),
        .m_axi_rdata(bfm_axi_if_0_m_axi_RDATA),
        .m_axi_rid(bfm_axi_if_0_m_axi_RID),
        .m_axi_rlast(bfm_axi_if_0_m_axi_RLAST),
        .m_axi_rready(bfm_axi_if_0_m_axi_RREADY),
        .m_axi_rresp(bfm_axi_if_0_m_axi_RRESP),
        .m_axi_rvalid(bfm_axi_if_0_m_axi_RVALID),
        .m_axi_wdata(bfm_axi_if_0_m_axi_WDATA),
        .m_axi_wlast(bfm_axi_if_0_m_axi_WLAST),
        .m_axi_wready(bfm_axi_if_0_m_axi_WREADY),
        .m_axi_wstrb(bfm_axi_if_0_m_axi_WSTRB),
        .m_axi_wvalid(bfm_axi_if_0_m_axi_WVALID));
  design_gpio_axi_lite_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(BOARD_CLK_IN_1),
        .clk_out1(clk_wiz_0_clk_out1),
        .clk_out2(clk_wiz_0_clk_out2),
        .locked(clk_wiz_0_locked));
  design_gpio_axi_lite_gpio_axi_lite_0_0 gpio_axi_lite_0
       (.aclk(clk_wiz_0_clk_out2),
        .aresetn(proc_sys_reset_0_peripheral_aresetn),
        .gpio_in(xlconcat_0_dout),
        .gpio_out(gpio_axi_lite_0_gpio_out),
        .s_axi_lite_araddr(axi4_to_lite_0_m_axil_ARADDR),
        .s_axi_lite_arready(axi4_to_lite_0_m_axil_ARREADY),
        .s_axi_lite_arvalid(axi4_to_lite_0_m_axil_ARVALID),
        .s_axi_lite_awaddr(axi4_to_lite_0_m_axil_AWADDR),
        .s_axi_lite_awready(axi4_to_lite_0_m_axil_AWREADY),
        .s_axi_lite_awvalid(axi4_to_lite_0_m_axil_AWVALID),
        .s_axi_lite_bready(axi4_to_lite_0_m_axil_BREADY),
        .s_axi_lite_bresp(axi4_to_lite_0_m_axil_BRESP),
        .s_axi_lite_bvalid(axi4_to_lite_0_m_axil_BVALID),
        .s_axi_lite_rdata(axi4_to_lite_0_m_axil_RDATA),
        .s_axi_lite_rready(axi4_to_lite_0_m_axil_RREADY),
        .s_axi_lite_rresp(axi4_to_lite_0_m_axil_RRESP),
        .s_axi_lite_rvalid(axi4_to_lite_0_m_axil_RVALID),
        .s_axi_lite_wdata(axi4_to_lite_0_m_axil_WDATA),
        .s_axi_lite_wready(axi4_to_lite_0_m_axil_WREADY),
        .s_axi_lite_wvalid(axi4_to_lite_0_m_axil_WVALID));
  design_gpio_axi_lite_proc_sys_reset_0_0 proc_sys_reset_0
       (.aux_reset_in(util_vector_logic_0_Res),
        .dcm_locked(clk_wiz_0_locked),
        .ext_reset_in(BOARD_RST_SW_1),
        .interconnect_aresetn(proc_sys_reset_0_interconnect_aresetn),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .slowest_sync_clk(clk_wiz_0_clk_out2));
  design_gpio_axi_lite_xlconcat_0_0 xlconcat_0
       (.In0(BTNU_1),
        .In1(BTND_1),
        .In2(BTNL_1),
        .In3(BTNR_1),
        .dout(xlconcat_0_dout));
  design_gpio_axi_lite_xlslice_0_0 xlslice_0
       (.Din(gpio_axi_lite_0_gpio_out),
        .Dout(xlslice_0_Dout));
  design_gpio_axi_lite_xlslice_1_0 xlslice_1
       (.Din(gpio_axi_lite_0_gpio_out),
        .Dout(xlslice_1_Dout));
  design_gpio_axi_lite_xlslice_2_0 xlslice_2
       (.Din(gpio_axi_lite_0_gpio_out),
        .Dout(xlslice_2_Dout));
  design_gpio_axi_lite_xlslice_3_0 xlslice_3
       (.Din(gpio_axi_lite_0_gpio_out),
        .Dout(xlslice_3_Dout));
endmodule
