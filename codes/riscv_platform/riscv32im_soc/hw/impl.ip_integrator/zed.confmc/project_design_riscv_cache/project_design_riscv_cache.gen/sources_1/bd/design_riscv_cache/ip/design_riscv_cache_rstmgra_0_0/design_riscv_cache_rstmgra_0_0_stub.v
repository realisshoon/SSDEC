// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Wed Nov 26 10:28:15 2025
// Host        : sogang-500TGA-500SGA running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/sogang/pjt/team2/codes/riscv_platform/riscv32im_soc/hw/impl.ip_integrator/zed.confmc/project_design_riscv_cache/project_design_riscv_cache.gen/sources_1/bd/design_riscv_cache/ip/design_riscv_cache_rstmgra_0_0/design_riscv_cache_rstmgra_0_0_stub.v
// Design      : design_riscv_cache_rstmgra_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "rstmgra,Vivado 2021.2" *)
module design_riscv_cache_rstmgra_0_0(clk, rstn, GPIN, GPOUT, bus_resetn, cpu_resetn)
/* synthesis syn_black_box black_box_pad_pin="clk,rstn,GPIN[15:0],GPOUT[15:0],bus_resetn,cpu_resetn" */;
  input clk;
  input rstn;
  output [15:0]GPIN;
  input [15:0]GPOUT;
  output bus_resetn;
  output cpu_resetn;
endmodule
