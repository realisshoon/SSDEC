-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
-- Date        : Wed Nov  5 18:58:44 2025
-- Host        : sogang-500TGA-500SGA running 64-bit Ubuntu 22.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/sogang/pjt/team2/codes/riscv_platform/riscv32im_soc/hw/impl.ip_integrator/zed.confmc/project_design_riscv_cache/project_design_riscv_cache.gen/sources_1/bd/design_riscv_cache/ip/design_riscv_cache_riscv_cache_soc_0_0/design_riscv_cache_riscv_cache_soc_0_0_stub.vhdl
-- Design      : design_riscv_cache_riscv_cache_soc_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_riscv_cache_riscv_cache_soc_0_0 is
  Port ( 
    uart_txd : out STD_LOGIC;
    uart_rxd : in STD_LOGIC;
    uart_rts_n : out STD_LOGIC;
    uart_cts_n : in STD_LOGIC;
    gpio_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    gpio_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    keypad_col : out STD_LOGIC_VECTOR ( 3 downto 0 );
    keypad_row : in STD_LOGIC_VECTOR ( 3 downto 0 );
    i2c_sda : inout STD_LOGIC;
    i2c_scl : out STD_LOGIC;
    cpu_resetn : in STD_LOGIC;
    axi_aresetn : in STD_LOGIC;
    axi_aclk : in STD_LOGIC;
    s_axi_confmc_awid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_confmc_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_confmc_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_confmc_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_confmc_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_confmc_awvalid : in STD_LOGIC;
    s_axi_confmc_awready : out STD_LOGIC;
    s_axi_confmc_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_confmc_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_confmc_wlast : in STD_LOGIC;
    s_axi_confmc_wvalid : in STD_LOGIC;
    s_axi_confmc_wready : out STD_LOGIC;
    s_axi_confmc_bid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_confmc_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_confmc_bvalid : out STD_LOGIC;
    s_axi_confmc_bready : in STD_LOGIC;
    s_axi_confmc_arid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_confmc_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_confmc_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_confmc_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_confmc_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_confmc_arvalid : in STD_LOGIC;
    s_axi_confmc_arready : out STD_LOGIC;
    s_axi_confmc_rid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_confmc_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_confmc_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_confmc_rlast : out STD_LOGIC;
    s_axi_confmc_rvalid : out STD_LOGIC;
    s_axi_confmc_rready : in STD_LOGIC;
    m_axi_mem_awid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_mem_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_mem_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_mem_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_mem_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mem_awvalid : out STD_LOGIC;
    m_axi_mem_awready : in STD_LOGIC;
    m_axi_mem_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_mem_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_mem_wlast : out STD_LOGIC;
    m_axi_mem_wvalid : out STD_LOGIC;
    m_axi_mem_wready : in STD_LOGIC;
    m_axi_mem_bid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_mem_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mem_bvalid : in STD_LOGIC;
    m_axi_mem_bready : out STD_LOGIC;
    m_axi_mem_arid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_mem_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_mem_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_mem_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_mem_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mem_arvalid : out STD_LOGIC;
    m_axi_mem_arready : in STD_LOGIC;
    m_axi_mem_rid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_mem_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_mem_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mem_rlast : in STD_LOGIC;
    m_axi_mem_rvalid : in STD_LOGIC;
    m_axi_mem_rready : out STD_LOGIC
  );

end design_riscv_cache_riscv_cache_soc_0_0;

architecture stub of design_riscv_cache_riscv_cache_soc_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "uart_txd,uart_rxd,uart_rts_n,uart_cts_n,gpio_in[7:0],gpio_out[7:0],keypad_col[3:0],keypad_row[3:0],i2c_sda,i2c_scl,cpu_resetn,axi_aresetn,axi_aclk,s_axi_confmc_awid[3:0],s_axi_confmc_awaddr[31:0],s_axi_confmc_awlen[7:0],s_axi_confmc_awsize[2:0],s_axi_confmc_awburst[1:0],s_axi_confmc_awvalid,s_axi_confmc_awready,s_axi_confmc_wdata[31:0],s_axi_confmc_wstrb[3:0],s_axi_confmc_wlast,s_axi_confmc_wvalid,s_axi_confmc_wready,s_axi_confmc_bid[3:0],s_axi_confmc_bresp[1:0],s_axi_confmc_bvalid,s_axi_confmc_bready,s_axi_confmc_arid[3:0],s_axi_confmc_araddr[31:0],s_axi_confmc_arlen[7:0],s_axi_confmc_arsize[2:0],s_axi_confmc_arburst[1:0],s_axi_confmc_arvalid,s_axi_confmc_arready,s_axi_confmc_rid[3:0],s_axi_confmc_rdata[31:0],s_axi_confmc_rresp[1:0],s_axi_confmc_rlast,s_axi_confmc_rvalid,s_axi_confmc_rready,m_axi_mem_awid[5:0],m_axi_mem_awaddr[31:0],m_axi_mem_awlen[7:0],m_axi_mem_awsize[2:0],m_axi_mem_awburst[1:0],m_axi_mem_awvalid,m_axi_mem_awready,m_axi_mem_wdata[31:0],m_axi_mem_wstrb[3:0],m_axi_mem_wlast,m_axi_mem_wvalid,m_axi_mem_wready,m_axi_mem_bid[5:0],m_axi_mem_bresp[1:0],m_axi_mem_bvalid,m_axi_mem_bready,m_axi_mem_arid[5:0],m_axi_mem_araddr[31:0],m_axi_mem_arlen[7:0],m_axi_mem_arsize[2:0],m_axi_mem_arburst[1:0],m_axi_mem_arvalid,m_axi_mem_arready,m_axi_mem_rid[5:0],m_axi_mem_rdata[31:0],m_axi_mem_rresp[1:0],m_axi_mem_rlast,m_axi_mem_rvalid,m_axi_mem_rready";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "riscv_cache_soc,Vivado 2021.2";
begin
end;
