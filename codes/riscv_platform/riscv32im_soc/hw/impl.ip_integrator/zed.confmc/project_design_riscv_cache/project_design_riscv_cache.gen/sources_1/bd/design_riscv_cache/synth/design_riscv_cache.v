//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
//Date        : Fri Oct 24 16:28:09 2025
//Host        : sogang-500TGA-500SGA running 64-bit Ubuntu 22.04.5 LTS
//Command     : generate_target design_riscv_cache.bd
//Design      : design_riscv_cache
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_riscv_cache,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_riscv_cache,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=7,numReposBlks=7,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_riscv_cache.hwdef" *) 
module design_riscv_cache
   (BOARD_CLK_IN,
    BOARD_RST_SW,
    gpio_in,
    gpio_out,
    keypad_col,
    keypad_row,
    uart_cts_n,
    uart_rts_n,
    uart_rxd,
    uart_txd);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.BOARD_CLK_IN CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.BOARD_CLK_IN, CLK_DOMAIN design_riscv_cache_BOARD_CLK_IN, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input BOARD_CLK_IN;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.BOARD_RST_SW RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.BOARD_RST_SW, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input BOARD_RST_SW;
  input [7:0]gpio_in;
  output [7:0]gpio_out;
  output [3:0]keypad_col;
  input [3:0]keypad_row;
  input uart_cts_n;
  output uart_rts_n;
  input uart_rxd;
  output uart_txd;

  wire BOARD_CLK_IN_1;
  wire BOARD_RST_SW_1;
  wire [16:0]axi_bram_ctrl_0_BRAM_PORTA_ADDR;
  wire axi_bram_ctrl_0_BRAM_PORTA_CLK;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTA_DIN;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTA_DOUT;
  wire axi_bram_ctrl_0_BRAM_PORTA_EN;
  wire axi_bram_ctrl_0_BRAM_PORTA_RST;
  wire [3:0]axi_bram_ctrl_0_BRAM_PORTA_WE;
  wire [16:0]axi_bram_ctrl_0_BRAM_PORTB_ADDR;
  wire axi_bram_ctrl_0_BRAM_PORTB_CLK;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTB_DIN;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTB_DOUT;
  wire axi_bram_ctrl_0_BRAM_PORTB_EN;
  wire axi_bram_ctrl_0_BRAM_PORTB_RST;
  wire [3:0]axi_bram_ctrl_0_BRAM_PORTB_WE;
  wire [15:0]bfm_axi_if_0_GPOUT;
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
  wire [7:0]gpio_in_1;
  wire [3:0]keypad_row_1;
  wire [0:0]proc_sys_reset_0_interconnect_aresetn;
  wire [0:0]proc_sys_reset_0_peripheral_aresetn;
  wire [7:0]riscv_cache_soc_0_gpio_out;
  wire [3:0]riscv_cache_soc_0_keypad_col;
  wire [31:0]riscv_cache_soc_0_m_axi_mem_ARADDR;
  wire [1:0]riscv_cache_soc_0_m_axi_mem_ARBURST;
  wire [5:0]riscv_cache_soc_0_m_axi_mem_ARID;
  wire [7:0]riscv_cache_soc_0_m_axi_mem_ARLEN;
  wire riscv_cache_soc_0_m_axi_mem_ARREADY;
  wire [2:0]riscv_cache_soc_0_m_axi_mem_ARSIZE;
  wire riscv_cache_soc_0_m_axi_mem_ARVALID;
  wire [31:0]riscv_cache_soc_0_m_axi_mem_AWADDR;
  wire [1:0]riscv_cache_soc_0_m_axi_mem_AWBURST;
  wire [5:0]riscv_cache_soc_0_m_axi_mem_AWID;
  wire [7:0]riscv_cache_soc_0_m_axi_mem_AWLEN;
  wire riscv_cache_soc_0_m_axi_mem_AWREADY;
  wire [2:0]riscv_cache_soc_0_m_axi_mem_AWSIZE;
  wire riscv_cache_soc_0_m_axi_mem_AWVALID;
  wire [5:0]riscv_cache_soc_0_m_axi_mem_BID;
  wire riscv_cache_soc_0_m_axi_mem_BREADY;
  wire [1:0]riscv_cache_soc_0_m_axi_mem_BRESP;
  wire riscv_cache_soc_0_m_axi_mem_BVALID;
  wire [31:0]riscv_cache_soc_0_m_axi_mem_RDATA;
  wire [5:0]riscv_cache_soc_0_m_axi_mem_RID;
  wire riscv_cache_soc_0_m_axi_mem_RLAST;
  wire riscv_cache_soc_0_m_axi_mem_RREADY;
  wire [1:0]riscv_cache_soc_0_m_axi_mem_RRESP;
  wire riscv_cache_soc_0_m_axi_mem_RVALID;
  wire [31:0]riscv_cache_soc_0_m_axi_mem_WDATA;
  wire riscv_cache_soc_0_m_axi_mem_WLAST;
  wire riscv_cache_soc_0_m_axi_mem_WREADY;
  wire [3:0]riscv_cache_soc_0_m_axi_mem_WSTRB;
  wire riscv_cache_soc_0_m_axi_mem_WVALID;
  wire riscv_cache_soc_0_uart_rts_n;
  wire riscv_cache_soc_0_uart_txd;
  wire [15:0]rstmgra_0_GPIN;
  wire rstmgra_0_bus_resetn;
  wire rstmgra_0_cpu_resetn;
  wire uart_cts_n_1;
  wire uart_rxd_1;
  wire util_vector_logic_0_Res;

  assign BOARD_CLK_IN_1 = BOARD_CLK_IN;
  assign BOARD_RST_SW_1 = BOARD_RST_SW;
  assign gpio_in_1 = gpio_in[7:0];
  assign gpio_out[7:0] = riscv_cache_soc_0_gpio_out;
  assign keypad_col[3:0] = riscv_cache_soc_0_keypad_col;
  assign keypad_row_1 = keypad_row[3:0];
  assign uart_cts_n_1 = uart_cts_n;
  assign uart_rts_n = riscv_cache_soc_0_uart_rts_n;
  assign uart_rxd_1 = uart_rxd;
  assign uart_txd = riscv_cache_soc_0_uart_txd;
  design_riscv_cache_axi_bram_ctrl_0_0 axi_bram_ctrl_0
       (.bram_addr_a(axi_bram_ctrl_0_BRAM_PORTA_ADDR),
        .bram_addr_b(axi_bram_ctrl_0_BRAM_PORTB_ADDR),
        .bram_clk_a(axi_bram_ctrl_0_BRAM_PORTA_CLK),
        .bram_clk_b(axi_bram_ctrl_0_BRAM_PORTB_CLK),
        .bram_en_a(axi_bram_ctrl_0_BRAM_PORTA_EN),
        .bram_en_b(axi_bram_ctrl_0_BRAM_PORTB_EN),
        .bram_rddata_a(axi_bram_ctrl_0_BRAM_PORTA_DOUT),
        .bram_rddata_b(axi_bram_ctrl_0_BRAM_PORTB_DOUT),
        .bram_rst_a(axi_bram_ctrl_0_BRAM_PORTA_RST),
        .bram_rst_b(axi_bram_ctrl_0_BRAM_PORTB_RST),
        .bram_we_a(axi_bram_ctrl_0_BRAM_PORTA_WE),
        .bram_we_b(axi_bram_ctrl_0_BRAM_PORTB_WE),
        .bram_wrdata_a(axi_bram_ctrl_0_BRAM_PORTA_DIN),
        .bram_wrdata_b(axi_bram_ctrl_0_BRAM_PORTB_DIN),
        .s_axi_aclk(clk_wiz_0_clk_out2),
        .s_axi_araddr(riscv_cache_soc_0_m_axi_mem_ARADDR[16:0]),
        .s_axi_arburst(riscv_cache_soc_0_m_axi_mem_ARBURST),
        .s_axi_arcache({1'b0,1'b0,1'b1,1'b1}),
        .s_axi_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s_axi_arid(riscv_cache_soc_0_m_axi_mem_ARID),
        .s_axi_arlen(riscv_cache_soc_0_m_axi_mem_ARLEN),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arready(riscv_cache_soc_0_m_axi_mem_ARREADY),
        .s_axi_arsize(riscv_cache_soc_0_m_axi_mem_ARSIZE),
        .s_axi_arvalid(riscv_cache_soc_0_m_axi_mem_ARVALID),
        .s_axi_awaddr(riscv_cache_soc_0_m_axi_mem_AWADDR[16:0]),
        .s_axi_awburst(riscv_cache_soc_0_m_axi_mem_AWBURST),
        .s_axi_awcache({1'b0,1'b0,1'b1,1'b1}),
        .s_axi_awid(riscv_cache_soc_0_m_axi_mem_AWID),
        .s_axi_awlen(riscv_cache_soc_0_m_axi_mem_AWLEN),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awready(riscv_cache_soc_0_m_axi_mem_AWREADY),
        .s_axi_awsize(riscv_cache_soc_0_m_axi_mem_AWSIZE),
        .s_axi_awvalid(riscv_cache_soc_0_m_axi_mem_AWVALID),
        .s_axi_bid(riscv_cache_soc_0_m_axi_mem_BID),
        .s_axi_bready(riscv_cache_soc_0_m_axi_mem_BREADY),
        .s_axi_bresp(riscv_cache_soc_0_m_axi_mem_BRESP),
        .s_axi_bvalid(riscv_cache_soc_0_m_axi_mem_BVALID),
        .s_axi_rdata(riscv_cache_soc_0_m_axi_mem_RDATA),
        .s_axi_rid(riscv_cache_soc_0_m_axi_mem_RID),
        .s_axi_rlast(riscv_cache_soc_0_m_axi_mem_RLAST),
        .s_axi_rready(riscv_cache_soc_0_m_axi_mem_RREADY),
        .s_axi_rresp(riscv_cache_soc_0_m_axi_mem_RRESP),
        .s_axi_rvalid(riscv_cache_soc_0_m_axi_mem_RVALID),
        .s_axi_wdata(riscv_cache_soc_0_m_axi_mem_WDATA),
        .s_axi_wlast(riscv_cache_soc_0_m_axi_mem_WLAST),
        .s_axi_wready(riscv_cache_soc_0_m_axi_mem_WREADY),
        .s_axi_wstrb(riscv_cache_soc_0_m_axi_mem_WSTRB),
        .s_axi_wvalid(riscv_cache_soc_0_m_axi_mem_WVALID));
  design_riscv_cache_axi_bram_ctrl_0_bram_0 axi_bram_ctrl_0_bram
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,axi_bram_ctrl_0_BRAM_PORTA_ADDR}),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,axi_bram_ctrl_0_BRAM_PORTB_ADDR}),
        .clka(axi_bram_ctrl_0_BRAM_PORTA_CLK),
        .clkb(axi_bram_ctrl_0_BRAM_PORTB_CLK),
        .dina(axi_bram_ctrl_0_BRAM_PORTA_DIN),
        .dinb(axi_bram_ctrl_0_BRAM_PORTB_DIN),
        .douta(axi_bram_ctrl_0_BRAM_PORTA_DOUT),
        .doutb(axi_bram_ctrl_0_BRAM_PORTB_DOUT),
        .ena(axi_bram_ctrl_0_BRAM_PORTA_EN),
        .enb(axi_bram_ctrl_0_BRAM_PORTB_EN),
        .rsta(axi_bram_ctrl_0_BRAM_PORTA_RST),
        .rstb(axi_bram_ctrl_0_BRAM_PORTB_RST),
        .wea(axi_bram_ctrl_0_BRAM_PORTA_WE),
        .web(axi_bram_ctrl_0_BRAM_PORTB_WE));
  design_riscv_cache_bfm_axi_if_0_0 bfm_axi_if_0
       (.GPIN(rstmgra_0_GPIN),
        .GPOUT(bfm_axi_if_0_GPOUT),
        .SL_FLAGA(1'b0),
        .SL_FLAGB(1'b0),
        .SL_FLAGC(1'b0),
        .SL_FLAGD(1'b0),
        .SL_MODE({1'b0,1'b0}),
        .SL_RST_N(1'b0),
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
  design_riscv_cache_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(BOARD_CLK_IN_1),
        .clk_out1(clk_wiz_0_clk_out1),
        .clk_out2(clk_wiz_0_clk_out2),
        .locked(clk_wiz_0_locked));
  design_riscv_cache_proc_sys_reset_0_0 proc_sys_reset_0
       (.aux_reset_in(util_vector_logic_0_Res),
        .dcm_locked(clk_wiz_0_locked),
        .ext_reset_in(BOARD_RST_SW_1),
        .interconnect_aresetn(proc_sys_reset_0_interconnect_aresetn),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .slowest_sync_clk(clk_wiz_0_clk_out2));
  design_riscv_cache_riscv_cache_soc_0_0 riscv_cache_soc_0
       (.axi_aclk(clk_wiz_0_clk_out2),
        .axi_aresetn(rstmgra_0_bus_resetn),
        .cpu_resetn(rstmgra_0_cpu_resetn),
        .gpio_in(gpio_in_1),
        .gpio_out(riscv_cache_soc_0_gpio_out),
        .keypad_col(riscv_cache_soc_0_keypad_col),
        .keypad_row(keypad_row_1),
        .m_axi_mem_araddr(riscv_cache_soc_0_m_axi_mem_ARADDR),
        .m_axi_mem_arburst(riscv_cache_soc_0_m_axi_mem_ARBURST),
        .m_axi_mem_arid(riscv_cache_soc_0_m_axi_mem_ARID),
        .m_axi_mem_arlen(riscv_cache_soc_0_m_axi_mem_ARLEN),
        .m_axi_mem_arready(riscv_cache_soc_0_m_axi_mem_ARREADY),
        .m_axi_mem_arsize(riscv_cache_soc_0_m_axi_mem_ARSIZE),
        .m_axi_mem_arvalid(riscv_cache_soc_0_m_axi_mem_ARVALID),
        .m_axi_mem_awaddr(riscv_cache_soc_0_m_axi_mem_AWADDR),
        .m_axi_mem_awburst(riscv_cache_soc_0_m_axi_mem_AWBURST),
        .m_axi_mem_awid(riscv_cache_soc_0_m_axi_mem_AWID),
        .m_axi_mem_awlen(riscv_cache_soc_0_m_axi_mem_AWLEN),
        .m_axi_mem_awready(riscv_cache_soc_0_m_axi_mem_AWREADY),
        .m_axi_mem_awsize(riscv_cache_soc_0_m_axi_mem_AWSIZE),
        .m_axi_mem_awvalid(riscv_cache_soc_0_m_axi_mem_AWVALID),
        .m_axi_mem_bid(riscv_cache_soc_0_m_axi_mem_BID),
        .m_axi_mem_bready(riscv_cache_soc_0_m_axi_mem_BREADY),
        .m_axi_mem_bresp(riscv_cache_soc_0_m_axi_mem_BRESP),
        .m_axi_mem_bvalid(riscv_cache_soc_0_m_axi_mem_BVALID),
        .m_axi_mem_rdata(riscv_cache_soc_0_m_axi_mem_RDATA),
        .m_axi_mem_rid(riscv_cache_soc_0_m_axi_mem_RID),
        .m_axi_mem_rlast(riscv_cache_soc_0_m_axi_mem_RLAST),
        .m_axi_mem_rready(riscv_cache_soc_0_m_axi_mem_RREADY),
        .m_axi_mem_rresp(riscv_cache_soc_0_m_axi_mem_RRESP),
        .m_axi_mem_rvalid(riscv_cache_soc_0_m_axi_mem_RVALID),
        .m_axi_mem_wdata(riscv_cache_soc_0_m_axi_mem_WDATA),
        .m_axi_mem_wlast(riscv_cache_soc_0_m_axi_mem_WLAST),
        .m_axi_mem_wready(riscv_cache_soc_0_m_axi_mem_WREADY),
        .m_axi_mem_wstrb(riscv_cache_soc_0_m_axi_mem_WSTRB),
        .m_axi_mem_wvalid(riscv_cache_soc_0_m_axi_mem_WVALID),
        .s_axi_confmc_araddr(bfm_axi_if_0_m_axi_ARADDR),
        .s_axi_confmc_arburst(bfm_axi_if_0_m_axi_ARBURST),
        .s_axi_confmc_arid(bfm_axi_if_0_m_axi_ARID),
        .s_axi_confmc_arlen(bfm_axi_if_0_m_axi_ARLEN),
        .s_axi_confmc_arready(bfm_axi_if_0_m_axi_ARREADY),
        .s_axi_confmc_arsize(bfm_axi_if_0_m_axi_ARSIZE),
        .s_axi_confmc_arvalid(bfm_axi_if_0_m_axi_ARVALID),
        .s_axi_confmc_awaddr(bfm_axi_if_0_m_axi_AWADDR),
        .s_axi_confmc_awburst(bfm_axi_if_0_m_axi_AWBURST),
        .s_axi_confmc_awid(bfm_axi_if_0_m_axi_AWID),
        .s_axi_confmc_awlen(bfm_axi_if_0_m_axi_AWLEN),
        .s_axi_confmc_awready(bfm_axi_if_0_m_axi_AWREADY),
        .s_axi_confmc_awsize(bfm_axi_if_0_m_axi_AWSIZE),
        .s_axi_confmc_awvalid(bfm_axi_if_0_m_axi_AWVALID),
        .s_axi_confmc_bid(bfm_axi_if_0_m_axi_BID),
        .s_axi_confmc_bready(bfm_axi_if_0_m_axi_BREADY),
        .s_axi_confmc_bresp(bfm_axi_if_0_m_axi_BRESP),
        .s_axi_confmc_bvalid(bfm_axi_if_0_m_axi_BVALID),
        .s_axi_confmc_rdata(bfm_axi_if_0_m_axi_RDATA),
        .s_axi_confmc_rid(bfm_axi_if_0_m_axi_RID),
        .s_axi_confmc_rlast(bfm_axi_if_0_m_axi_RLAST),
        .s_axi_confmc_rready(bfm_axi_if_0_m_axi_RREADY),
        .s_axi_confmc_rresp(bfm_axi_if_0_m_axi_RRESP),
        .s_axi_confmc_rvalid(bfm_axi_if_0_m_axi_RVALID),
        .s_axi_confmc_wdata(bfm_axi_if_0_m_axi_WDATA),
        .s_axi_confmc_wlast(bfm_axi_if_0_m_axi_WLAST),
        .s_axi_confmc_wready(bfm_axi_if_0_m_axi_WREADY),
        .s_axi_confmc_wstrb(bfm_axi_if_0_m_axi_WSTRB),
        .s_axi_confmc_wvalid(bfm_axi_if_0_m_axi_WVALID),
        .uart_cts_n(uart_cts_n_1),
        .uart_rts_n(riscv_cache_soc_0_uart_rts_n),
        .uart_rxdd(1'b0),
        .uart_txd(riscv_cache_soc_0_uart_txd));
  design_riscv_cache_rstmgra_0_0 rstmgra_0
       (.GPIN(rstmgra_0_GPIN),
        .GPOUT(bfm_axi_if_0_GPOUT),
        .bus_resetn(rstmgra_0_bus_resetn),
        .clk(clk_wiz_0_clk_out2),
        .cpu_resetn(rstmgra_0_cpu_resetn),
        .rstn(proc_sys_reset_0_interconnect_aresetn));
endmodule
