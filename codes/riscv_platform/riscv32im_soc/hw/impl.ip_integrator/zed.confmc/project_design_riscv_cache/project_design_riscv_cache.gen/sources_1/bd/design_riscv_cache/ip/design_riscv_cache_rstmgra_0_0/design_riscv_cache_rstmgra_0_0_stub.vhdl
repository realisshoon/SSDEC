-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
-- Date        : Wed Nov  5 18:59:29 2025
-- Host        : sogang-500TGA-500SGA running 64-bit Ubuntu 22.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/sogang/pjt/team2/codes/riscv_platform/riscv32im_soc/hw/impl.ip_integrator/zed.confmc/project_design_riscv_cache/project_design_riscv_cache.gen/sources_1/bd/design_riscv_cache/ip/design_riscv_cache_rstmgra_0_0/design_riscv_cache_rstmgra_0_0_stub.vhdl
-- Design      : design_riscv_cache_rstmgra_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_riscv_cache_rstmgra_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC;
    GPIN : out STD_LOGIC_VECTOR ( 15 downto 0 );
    GPOUT : in STD_LOGIC_VECTOR ( 15 downto 0 );
    bus_resetn : out STD_LOGIC;
    cpu_resetn : out STD_LOGIC
  );

end design_riscv_cache_rstmgra_0_0;

architecture stub of design_riscv_cache_rstmgra_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rstn,GPIN[15:0],GPOUT[15:0],bus_resetn,cpu_resetn";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "rstmgra,Vivado 2021.2";
begin
end;
