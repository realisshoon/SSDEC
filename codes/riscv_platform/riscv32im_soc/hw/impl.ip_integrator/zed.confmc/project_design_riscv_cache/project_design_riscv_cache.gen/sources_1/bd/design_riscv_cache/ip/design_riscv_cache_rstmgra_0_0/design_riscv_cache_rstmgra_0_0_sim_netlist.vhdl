-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
-- Date        : Wed Nov  5 18:59:29 2025
-- Host        : sogang-500TGA-500SGA running 64-bit Ubuntu 22.04.5 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/sogang/pjt/team2/codes/riscv_platform/riscv32im_soc/hw/impl.ip_integrator/zed.confmc/project_design_riscv_cache/project_design_riscv_cache.gen/sources_1/bd/design_riscv_cache/ip/design_riscv_cache_rstmgra_0_0/design_riscv_cache_rstmgra_0_0_sim_netlist.vhdl
-- Design      : design_riscv_cache_rstmgra_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_riscv_cache_rstmgra_0_0_rstmgra is
  port (
    GPIN : out STD_LOGIC_VECTOR ( 1 downto 0 );
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC;
    GPOUT : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_riscv_cache_rstmgra_0_0_rstmgra : entity is "rstmgra";
end design_riscv_cache_rstmgra_0_0_rstmgra;

architecture STRUCTURE of design_riscv_cache_rstmgra_0_0_rstmgra is
  signal \^gpin\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \cpu_resetn_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \cpu_resetn_reg_reg_n_0_[4]\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 4 downto 1 );
begin
  GPIN(1 downto 0) <= \^gpin\(1 downto 0);
bus_resetn_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => rstn,
      I1 => GPOUT(0),
      O => \^gpin\(0)
    );
cpu_resetn_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => p_0_in(3),
      I1 => p_0_in(2),
      I2 => \cpu_resetn_reg_reg_n_0_[4]\,
      I3 => p_0_in(4),
      I4 => p_0_in(1),
      I5 => GPOUT(1),
      O => \^gpin\(1)
    );
\cpu_resetn_reg[4]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rstn,
      O => \cpu_resetn_reg[4]_i_1_n_0\
    );
\cpu_resetn_reg_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \cpu_resetn_reg[4]_i_1_n_0\,
      D => \^gpin\(0),
      Q => p_0_in(1)
    );
\cpu_resetn_reg_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \cpu_resetn_reg[4]_i_1_n_0\,
      D => p_0_in(1),
      Q => p_0_in(2)
    );
\cpu_resetn_reg_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \cpu_resetn_reg[4]_i_1_n_0\,
      D => p_0_in(2),
      Q => p_0_in(3)
    );
\cpu_resetn_reg_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \cpu_resetn_reg[4]_i_1_n_0\,
      D => p_0_in(3),
      Q => p_0_in(4)
    );
\cpu_resetn_reg_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \cpu_resetn_reg[4]_i_1_n_0\,
      D => p_0_in(4),
      Q => \cpu_resetn_reg_reg_n_0_[4]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_riscv_cache_rstmgra_0_0 is
  port (
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC;
    GPIN : out STD_LOGIC_VECTOR ( 15 downto 0 );
    GPOUT : in STD_LOGIC_VECTOR ( 15 downto 0 );
    bus_resetn : out STD_LOGIC;
    cpu_resetn : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_riscv_cache_rstmgra_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_riscv_cache_rstmgra_0_0 : entity is "design_riscv_cache_rstmgra_0_0,rstmgra,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_riscv_cache_rstmgra_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_riscv_cache_rstmgra_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_riscv_cache_rstmgra_0_0 : entity is "rstmgra,Vivado 2021.2";
end design_riscv_cache_rstmgra_0_0;

architecture STRUCTURE of design_riscv_cache_rstmgra_0_0 is
  signal \^gpin\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^gpout\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of bus_resetn : signal is "xilinx.com:signal:reset:1.0 bus_resetn RST";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of bus_resetn : signal is "XIL_INTERFACENAME bus_resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET rstn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of cpu_resetn : signal is "xilinx.com:signal:reset:1.0 cpu_resetn RST";
  attribute X_INTERFACE_PARAMETER of cpu_resetn : signal is "XIL_INTERFACENAME cpu_resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of rstn : signal is "xilinx.com:signal:reset:1.0 rstn RST";
  attribute X_INTERFACE_PARAMETER of rstn : signal is "XIL_INTERFACENAME rstn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
  GPIN(15 downto 2) <= \^gpout\(15 downto 2);
  GPIN(1 downto 0) <= \^gpin\(1 downto 0);
  \^gpout\(15 downto 0) <= GPOUT(15 downto 0);
  bus_resetn <= \^gpin\(0);
  cpu_resetn <= \^gpin\(1);
inst: entity work.design_riscv_cache_rstmgra_0_0_rstmgra
     port map (
      GPIN(1 downto 0) => \^gpin\(1 downto 0),
      GPOUT(1 downto 0) => \^gpout\(1 downto 0),
      clk => clk,
      rstn => rstn
    );
end STRUCTURE;
