-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
-- Date        : Wed Nov 26 10:28:15 2025
-- Host        : sogang-500TGA-500SGA running 64-bit Ubuntu 22.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_riscv_cache_bfm_axi_if_0_0_stub.vhdl
-- Design      : design_riscv_cache_bfm_axi_if_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    SYS_CLK_STABLE : in STD_LOGIC;
    SYS_CLK : in STD_LOGIC;
    SYS_RST_N : out STD_LOGIC;
    SL_RST_N : in STD_LOGIC;
    SL_CS_N : out STD_LOGIC;
    SL_PCLK : out STD_LOGIC;
    SL_FLAGA : in STD_LOGIC;
    SL_FLAGB : in STD_LOGIC;
    SL_FLAGC : in STD_LOGIC;
    SL_FLAGD : in STD_LOGIC;
    SL_RD_N : out STD_LOGIC;
    SL_WR_N : out STD_LOGIC;
    SL_OE_N : out STD_LOGIC;
    SL_PKTEND_N : out STD_LOGIC;
    SL_AD : out STD_LOGIC_VECTOR ( 1 downto 0 );
    SL_DT : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    SL_MODE : in STD_LOGIC_VECTOR ( 1 downto 0 );
    GPOUT : out STD_LOGIC_VECTOR ( 15 downto 0 );
    GPIN : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axi_aclk : in STD_LOGIC;
    m_axi_aresetn : in STD_LOGIC;
    m_axi_awid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awlock : out STD_LOGIC;
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_arid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arlock : out STD_LOGIC;
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_rid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "SYS_CLK_STABLE,SYS_CLK,SYS_RST_N,SL_RST_N,SL_CS_N,SL_PCLK,SL_FLAGA,SL_FLAGB,SL_FLAGC,SL_FLAGD,SL_RD_N,SL_WR_N,SL_OE_N,SL_PKTEND_N,SL_AD[1:0],SL_DT[31:0],SL_MODE[1:0],GPOUT[15:0],GPIN[15:0],m_axi_aclk,m_axi_aresetn,m_axi_awid[3:0],m_axi_awaddr[31:0],m_axi_awlen[7:0],m_axi_awlock,m_axi_awsize[2:0],m_axi_awburst[1:0],m_axi_awcache[3:0],m_axi_awprot[2:0],m_axi_awvalid,m_axi_awready,m_axi_awqos[3:0],m_axi_awregion[3:0],m_axi_wid[3:0],m_axi_wdata[31:0],m_axi_wstrb[3:0],m_axi_wlast,m_axi_wvalid,m_axi_wready,m_axi_bid[3:0],m_axi_bresp[1:0],m_axi_bvalid,m_axi_bready,m_axi_arid[3:0],m_axi_araddr[31:0],m_axi_arlen[7:0],m_axi_arlock,m_axi_arsize[2:0],m_axi_arburst[1:0],m_axi_arcache[3:0],m_axi_arprot[2:0],m_axi_arvalid,m_axi_arready,m_axi_arqos[3:0],m_axi_arregion[3:0],m_axi_rid[3:0],m_axi_rdata[31:0],m_axi_rresp[1:0],m_axi_rlast,m_axi_rvalid,m_axi_rready";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "bfm_axi_if,Vivado 2021.2";
begin
end;
