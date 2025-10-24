// (c) Copyright 1995-2025 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:riscv_cache_soc:1.0
// IP Revision: 1

(* X_CORE_INFO = "riscv_cache_soc,Vivado 2021.2" *)
(* CHECK_LICENSE_TYPE = "design_riscv_cache_riscv_cache_soc_0_0,riscv_cache_soc,{}" *)
(* CORE_GENERATION_INFO = "design_riscv_cache_riscv_cache_soc_0_0,riscv_cache_soc,{x_ipProduct=Vivado 2021.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=riscv_cache_soc,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,BOOT_VECTOR=0x00000000,CORE_ID=0,SUPPORT_SUPER=0,SUPPORT_MMU=0,SUPPORT_MULDIV=1,SUPPORT_LOAD_BYPASS=1,SUPPORT_MUL_BYPASS=1,SUPPORT_REGFILE_XILINX=0,EXTRA_DECODE_STAGE=0,MEM_CACHE_ADDR_MIN=0x00000000,MEM_CACHE_ADDR_MAX=0x0FFFFFFF,MEM_ONCHIP_ADDR=0x00000000,MEM_ONCHIP_SIZ\
E=131072,MEM_OFFCHIP_ADDR=0x02000000,MEM_OFFCHIP_SIZE=131072,ADDR_PERIPHERAL=0x90000000,SIZE_PERIPHERAL=0x10000000,BAUD_RATE=115200,ACLK_FREQ=100000000,ADDR_PIC=0x90000000,ADDR_TIMER=0x90010000,ADDR_UART=0x90020000,ADDR_GPIO=0x90030000,SIZE_PIC=0x00001000,SIZE_TIMER=0x00001000,SIZE_UART=0x00001000,SIZE_GPIO=0x00001000,NUM_IRQ=3,IRQ_TIMER=0,IRQ_UART=1,IRQ_GPIO=2,AXI_WIDTH_CID=2,AXI_WIDTH_ID=4,AXI_WIDTH_SID=6,AXI_WIDTH_ADDR=32,AXI_WIDTH_DATA=32,AXI_WIDTH_STRB=4}" *)
(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_riscv_cache_riscv_cache_soc_0_0 (
  uart_txd,
  uart_rxdd,
  uart_rts_n,
  uart_cts_n,
  gpio_in,
  gpio_out,
  keypad_col,
  keypad_row,
  cpu_resetn,
  axi_aresetn,
  axi_aclk,
  s_axi_confmc_awid,
  s_axi_confmc_awaddr,
  s_axi_confmc_awlen,
  s_axi_confmc_awsize,
  s_axi_confmc_awburst,
  s_axi_confmc_awvalid,
  s_axi_confmc_awready,
  s_axi_confmc_wdata,
  s_axi_confmc_wstrb,
  s_axi_confmc_wlast,
  s_axi_confmc_wvalid,
  s_axi_confmc_wready,
  s_axi_confmc_bid,
  s_axi_confmc_bresp,
  s_axi_confmc_bvalid,
  s_axi_confmc_bready,
  s_axi_confmc_arid,
  s_axi_confmc_araddr,
  s_axi_confmc_arlen,
  s_axi_confmc_arsize,
  s_axi_confmc_arburst,
  s_axi_confmc_arvalid,
  s_axi_confmc_arready,
  s_axi_confmc_rid,
  s_axi_confmc_rdata,
  s_axi_confmc_rresp,
  s_axi_confmc_rlast,
  s_axi_confmc_rvalid,
  s_axi_confmc_rready,
  m_axi_mem_awid,
  m_axi_mem_awaddr,
  m_axi_mem_awlen,
  m_axi_mem_awsize,
  m_axi_mem_awburst,
  m_axi_mem_awvalid,
  m_axi_mem_awready,
  m_axi_mem_wdata,
  m_axi_mem_wstrb,
  m_axi_mem_wlast,
  m_axi_mem_wvalid,
  m_axi_mem_wready,
  m_axi_mem_bid,
  m_axi_mem_bresp,
  m_axi_mem_bvalid,
  m_axi_mem_bready,
  m_axi_mem_arid,
  m_axi_mem_araddr,
  m_axi_mem_arlen,
  m_axi_mem_arsize,
  m_axi_mem_arburst,
  m_axi_mem_arvalid,
  m_axi_mem_arready,
  m_axi_mem_rid,
  m_axi_mem_rdata,
  m_axi_mem_rresp,
  m_axi_mem_rlast,
  m_axi_mem_rvalid,
  m_axi_mem_rready
);

output wire uart_txd;
input wire uart_rxdd;
output wire uart_rts_n;
input wire uart_cts_n;
input wire [7 : 0] gpio_in;
output wire [7 : 0] gpio_out;
output wire [3 : 0] keypad_col;
input wire [3 : 0] keypad_row;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME cpu_resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 cpu_resetn RST" *)
input wire cpu_resetn;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 axi_aresetn RST" *)
input wire axi_aresetn;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axi_aclk, ASSOCIATED_RESET axi_aresetn, ASSOCIATED_BUSIF s_axi_confmc:m_axi_mem, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 axi_aclk CLK" *)
input wire axi_aclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc AWID" *)
input wire [3 : 0] s_axi_confmc_awid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc AWADDR" *)
input wire [31 : 0] s_axi_confmc_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc AWLEN" *)
input wire [7 : 0] s_axi_confmc_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc AWSIZE" *)
input wire [2 : 0] s_axi_confmc_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc AWBURST" *)
input wire [1 : 0] s_axi_confmc_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc AWVALID" *)
input wire s_axi_confmc_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc AWREADY" *)
output wire s_axi_confmc_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc WDATA" *)
input wire [31 : 0] s_axi_confmc_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc WSTRB" *)
input wire [3 : 0] s_axi_confmc_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc WLAST" *)
input wire s_axi_confmc_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc WVALID" *)
input wire s_axi_confmc_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc WREADY" *)
output wire s_axi_confmc_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc BID" *)
output wire [3 : 0] s_axi_confmc_bid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc BRESP" *)
output wire [1 : 0] s_axi_confmc_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc BVALID" *)
output wire s_axi_confmc_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc BREADY" *)
input wire s_axi_confmc_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc ARID" *)
input wire [3 : 0] s_axi_confmc_arid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc ARADDR" *)
input wire [31 : 0] s_axi_confmc_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc ARLEN" *)
input wire [7 : 0] s_axi_confmc_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc ARSIZE" *)
input wire [2 : 0] s_axi_confmc_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc ARBURST" *)
input wire [1 : 0] s_axi_confmc_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc ARVALID" *)
input wire s_axi_confmc_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc ARREADY" *)
output wire s_axi_confmc_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc RID" *)
output wire [3 : 0] s_axi_confmc_rid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc RDATA" *)
output wire [31 : 0] s_axi_confmc_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc RRESP" *)
output wire [1 : 0] s_axi_confmc_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc RLAST" *)
output wire s_axi_confmc_rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc RVALID" *)
output wire s_axi_confmc_rvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_confmc, ASSOCIATED_BUSIF s_axi_confmc:m_axi_mem, ASSOCIATED_RESET axi_aresetn, RUSER_WIDTH 0, WUSER_WIDTH 0, ARUSER_WIDTH 0, AWUSER_WIDTH 0, PROTOCOL AXI4, HAS_BURST 1, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_wstrb 1, HAS_bresp 1, HAS_rresp 1, DATA_WIDTH 32, FREQ_HZ 100000000, ID_WIDTH 4, ADDR_WIDTH 32, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE \
0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc RREADY" *)
input wire s_axi_confmc_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem AWID" *)
output wire [5 : 0] m_axi_mem_awid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem AWADDR" *)
output wire [31 : 0] m_axi_mem_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem AWLEN" *)
output wire [7 : 0] m_axi_mem_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem AWSIZE" *)
output wire [2 : 0] m_axi_mem_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem AWBURST" *)
output wire [1 : 0] m_axi_mem_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem AWVALID" *)
output wire m_axi_mem_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem AWREADY" *)
input wire m_axi_mem_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem WDATA" *)
output wire [31 : 0] m_axi_mem_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem WSTRB" *)
output wire [3 : 0] m_axi_mem_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem WLAST" *)
output wire m_axi_mem_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem WVALID" *)
output wire m_axi_mem_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem WREADY" *)
input wire m_axi_mem_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem BID" *)
input wire [5 : 0] m_axi_mem_bid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem BRESP" *)
input wire [1 : 0] m_axi_mem_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem BVALID" *)
input wire m_axi_mem_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem BREADY" *)
output wire m_axi_mem_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem ARID" *)
output wire [5 : 0] m_axi_mem_arid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem ARADDR" *)
output wire [31 : 0] m_axi_mem_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem ARLEN" *)
output wire [7 : 0] m_axi_mem_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem ARSIZE" *)
output wire [2 : 0] m_axi_mem_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem ARBURST" *)
output wire [1 : 0] m_axi_mem_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem ARVALID" *)
output wire m_axi_mem_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem ARREADY" *)
input wire m_axi_mem_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem RID" *)
input wire [5 : 0] m_axi_mem_rid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem RDATA" *)
input wire [31 : 0] m_axi_mem_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem RRESP" *)
input wire [1 : 0] m_axi_mem_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem RLAST" *)
input wire m_axi_mem_rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem RVALID" *)
input wire m_axi_mem_rvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_mem, ASSOCIATED_BUSIF s_axi_confmc:m_axi_mem, ASSOCIATED_RESET axi_aresetn, RUSER_WIDTH 0, WUSER_WIDTH 0, ARUSER_WIDTH 0, AWUSER_WIDTH 0, PROTOCOL AXI4, HAS_BURST 1, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_wstrb 1, HAS_bresp 1, HAS_rresp 1, DATA_WIDTH 32, FREQ_HZ 100000000, ID_WIDTH 6, ADDR_WIDTH 32, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0\
, CLK_DOMAIN /clk_wiz_0_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem RREADY" *)
output wire m_axi_mem_rready;

  riscv_cache_soc #(
    .BOOT_VECTOR(32'H00000000),
    .CORE_ID(0),
    .SUPPORT_SUPER(0),
    .SUPPORT_MMU(0),
    .SUPPORT_MULDIV(1),
    .SUPPORT_LOAD_BYPASS(1),
    .SUPPORT_MUL_BYPASS(1),
    .SUPPORT_REGFILE_XILINX(0),
    .EXTRA_DECODE_STAGE(0),
    .MEM_CACHE_ADDR_MIN(32'H00000000),
    .MEM_CACHE_ADDR_MAX(32'H0FFFFFFF),
    .MEM_ONCHIP_ADDR(32'H00000000),
    .MEM_ONCHIP_SIZE(131072),
    .MEM_OFFCHIP_ADDR(32'H02000000),
    .MEM_OFFCHIP_SIZE(131072),
    .ADDR_PERIPHERAL(32'H90000000),
    .SIZE_PERIPHERAL(32'H10000000),
    .BAUD_RATE(115200),
    .ACLK_FREQ(100000000),
    .ADDR_PIC(32'H90000000),
    .ADDR_TIMER(32'H90010000),
    .ADDR_UART(32'H90020000),
    .ADDR_GPIO(32'H90030000),
    .SIZE_PIC(32'H00001000),
    .SIZE_TIMER(32'H00001000),
    .SIZE_UART(32'H00001000),
    .SIZE_GPIO(32'H00001000),
    .NUM_IRQ(3),
    .IRQ_TIMER(0),
    .IRQ_UART(1),
    .IRQ_GPIO(2),
    .AXI_WIDTH_CID(2),
    .AXI_WIDTH_ID(4),
    .AXI_WIDTH_SID(6),
    .AXI_WIDTH_ADDR(32),
    .AXI_WIDTH_DATA(32),
    .AXI_WIDTH_STRB(4)
  ) inst (
    .uart_txd(uart_txd),
    .uart_rxdd(uart_rxdd),
    .uart_rts_n(uart_rts_n),
    .uart_cts_n(uart_cts_n),
    .gpio_in(gpio_in),
    .gpio_out(gpio_out),
    .keypad_col(keypad_col),
    .keypad_row(keypad_row),
    .cpu_resetn(cpu_resetn),
    .axi_aresetn(axi_aresetn),
    .axi_aclk(axi_aclk),
    .s_axi_confmc_awid(s_axi_confmc_awid),
    .s_axi_confmc_awaddr(s_axi_confmc_awaddr),
    .s_axi_confmc_awlen(s_axi_confmc_awlen),
    .s_axi_confmc_awsize(s_axi_confmc_awsize),
    .s_axi_confmc_awburst(s_axi_confmc_awburst),
    .s_axi_confmc_awvalid(s_axi_confmc_awvalid),
    .s_axi_confmc_awready(s_axi_confmc_awready),
    .s_axi_confmc_wdata(s_axi_confmc_wdata),
    .s_axi_confmc_wstrb(s_axi_confmc_wstrb),
    .s_axi_confmc_wlast(s_axi_confmc_wlast),
    .s_axi_confmc_wvalid(s_axi_confmc_wvalid),
    .s_axi_confmc_wready(s_axi_confmc_wready),
    .s_axi_confmc_bid(s_axi_confmc_bid),
    .s_axi_confmc_bresp(s_axi_confmc_bresp),
    .s_axi_confmc_bvalid(s_axi_confmc_bvalid),
    .s_axi_confmc_bready(s_axi_confmc_bready),
    .s_axi_confmc_arid(s_axi_confmc_arid),
    .s_axi_confmc_araddr(s_axi_confmc_araddr),
    .s_axi_confmc_arlen(s_axi_confmc_arlen),
    .s_axi_confmc_arsize(s_axi_confmc_arsize),
    .s_axi_confmc_arburst(s_axi_confmc_arburst),
    .s_axi_confmc_arvalid(s_axi_confmc_arvalid),
    .s_axi_confmc_arready(s_axi_confmc_arready),
    .s_axi_confmc_rid(s_axi_confmc_rid),
    .s_axi_confmc_rdata(s_axi_confmc_rdata),
    .s_axi_confmc_rresp(s_axi_confmc_rresp),
    .s_axi_confmc_rlast(s_axi_confmc_rlast),
    .s_axi_confmc_rvalid(s_axi_confmc_rvalid),
    .s_axi_confmc_rready(s_axi_confmc_rready),
    .m_axi_mem_awid(m_axi_mem_awid),
    .m_axi_mem_awaddr(m_axi_mem_awaddr),
    .m_axi_mem_awlen(m_axi_mem_awlen),
    .m_axi_mem_awsize(m_axi_mem_awsize),
    .m_axi_mem_awburst(m_axi_mem_awburst),
    .m_axi_mem_awvalid(m_axi_mem_awvalid),
    .m_axi_mem_awready(m_axi_mem_awready),
    .m_axi_mem_wdata(m_axi_mem_wdata),
    .m_axi_mem_wstrb(m_axi_mem_wstrb),
    .m_axi_mem_wlast(m_axi_mem_wlast),
    .m_axi_mem_wvalid(m_axi_mem_wvalid),
    .m_axi_mem_wready(m_axi_mem_wready),
    .m_axi_mem_bid(m_axi_mem_bid),
    .m_axi_mem_bresp(m_axi_mem_bresp),
    .m_axi_mem_bvalid(m_axi_mem_bvalid),
    .m_axi_mem_bready(m_axi_mem_bready),
    .m_axi_mem_arid(m_axi_mem_arid),
    .m_axi_mem_araddr(m_axi_mem_araddr),
    .m_axi_mem_arlen(m_axi_mem_arlen),
    .m_axi_mem_arsize(m_axi_mem_arsize),
    .m_axi_mem_arburst(m_axi_mem_arburst),
    .m_axi_mem_arvalid(m_axi_mem_arvalid),
    .m_axi_mem_arready(m_axi_mem_arready),
    .m_axi_mem_rid(m_axi_mem_rid),
    .m_axi_mem_rdata(m_axi_mem_rdata),
    .m_axi_mem_rresp(m_axi_mem_rresp),
    .m_axi_mem_rlast(m_axi_mem_rlast),
    .m_axi_mem_rvalid(m_axi_mem_rvalid),
    .m_axi_mem_rready(m_axi_mem_rready)
  );
endmodule
