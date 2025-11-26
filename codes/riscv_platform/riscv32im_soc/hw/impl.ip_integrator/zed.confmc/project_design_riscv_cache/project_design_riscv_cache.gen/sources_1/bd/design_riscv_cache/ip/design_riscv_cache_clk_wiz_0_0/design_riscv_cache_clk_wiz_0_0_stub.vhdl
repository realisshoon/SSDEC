-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
-- Date        : Wed Nov 26 10:28:15 2025
-- Host        : sogang-500TGA-500SGA running 64-bit Ubuntu 22.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/sogang/pjt/team2/codes/riscv_platform/riscv32im_soc/hw/impl.ip_integrator/zed.confmc/project_design_riscv_cache/project_design_riscv_cache.gen/sources_1/bd/design_riscv_cache/ip/design_riscv_cache_clk_wiz_0_0/design_riscv_cache_clk_wiz_0_0_stub.vhdl
-- Design      : design_riscv_cache_clk_wiz_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_riscv_cache_clk_wiz_0_0 is
  Port ( 
    clk_out1 : out STD_LOGIC;
    clk_out2 : out STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end design_riscv_cache_clk_wiz_0_0;

architecture stub of design_riscv_cache_clk_wiz_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out1,clk_out2,locked,clk_in1";
begin
end;
