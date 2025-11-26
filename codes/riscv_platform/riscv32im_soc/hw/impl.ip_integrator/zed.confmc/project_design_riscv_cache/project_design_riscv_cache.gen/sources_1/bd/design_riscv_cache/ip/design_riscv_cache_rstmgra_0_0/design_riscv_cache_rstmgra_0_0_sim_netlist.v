// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Wed Nov 26 10:28:15 2025
// Host        : sogang-500TGA-500SGA running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/sogang/pjt/team2/codes/riscv_platform/riscv32im_soc/hw/impl.ip_integrator/zed.confmc/project_design_riscv_cache/project_design_riscv_cache.gen/sources_1/bd/design_riscv_cache/ip/design_riscv_cache_rstmgra_0_0/design_riscv_cache_rstmgra_0_0_sim_netlist.v
// Design      : design_riscv_cache_rstmgra_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_riscv_cache_rstmgra_0_0,rstmgra,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "rstmgra,Vivado 2021.2" *) 
(* NotValidForBitStream *)
module design_riscv_cache_rstmgra_0_0
   (clk,
    rstn,
    GPIN,
    GPOUT,
    bus_resetn,
    cpu_resetn);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rstn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rstn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rstn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rstn;
  output [15:0]GPIN;
  input [15:0]GPOUT;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 bus_resetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME bus_resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) output bus_resetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 cpu_resetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME cpu_resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) output cpu_resetn;

  wire [1:0]\^GPIN ;
  wire [15:0]GPOUT;
  wire clk;
  wire rstn;

  assign GPIN[15:2] = GPOUT[15:2];
  assign GPIN[1:0] = \^GPIN [1:0];
  assign bus_resetn = \^GPIN [0];
  assign cpu_resetn = \^GPIN [1];
  design_riscv_cache_rstmgra_0_0_rstmgra inst
       (.GPIN(\^GPIN ),
        .GPOUT(GPOUT[1:0]),
        .clk(clk),
        .rstn(rstn));
endmodule

(* ORIG_REF_NAME = "rstmgra" *) 
module design_riscv_cache_rstmgra_0_0_rstmgra
   (GPIN,
    clk,
    rstn,
    GPOUT);
  output [1:0]GPIN;
  input clk;
  input rstn;
  input [1:0]GPOUT;

  wire [1:0]GPIN;
  wire [1:0]GPOUT;
  wire clk;
  wire \cpu_resetn_reg[4]_i_1_n_0 ;
  wire \cpu_resetn_reg_reg_n_0_[4] ;
  wire [4:1]p_0_in;
  wire rstn;

  LUT2 #(
    .INIT(4'h2)) 
    bus_resetn_INST_0
       (.I0(rstn),
        .I1(GPOUT[0]),
        .O(GPIN[0]));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    cpu_resetn_INST_0
       (.I0(p_0_in[3]),
        .I1(p_0_in[2]),
        .I2(\cpu_resetn_reg_reg_n_0_[4] ),
        .I3(p_0_in[4]),
        .I4(p_0_in[1]),
        .I5(GPOUT[1]),
        .O(GPIN[1]));
  LUT1 #(
    .INIT(2'h1)) 
    \cpu_resetn_reg[4]_i_1 
       (.I0(rstn),
        .O(\cpu_resetn_reg[4]_i_1_n_0 ));
  FDCE \cpu_resetn_reg_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\cpu_resetn_reg[4]_i_1_n_0 ),
        .D(GPIN[0]),
        .Q(p_0_in[1]));
  FDCE \cpu_resetn_reg_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\cpu_resetn_reg[4]_i_1_n_0 ),
        .D(p_0_in[1]),
        .Q(p_0_in[2]));
  FDCE \cpu_resetn_reg_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\cpu_resetn_reg[4]_i_1_n_0 ),
        .D(p_0_in[2]),
        .Q(p_0_in[3]));
  FDCE \cpu_resetn_reg_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\cpu_resetn_reg[4]_i_1_n_0 ),
        .D(p_0_in[3]),
        .Q(p_0_in[4]));
  FDCE \cpu_resetn_reg_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\cpu_resetn_reg[4]_i_1_n_0 ),
        .D(p_0_in[4]),
        .Q(\cpu_resetn_reg_reg_n_0_[4] ));
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
