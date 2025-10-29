#--------------------------------------------------------
# CLOCK
set_property PACKAGE_PIN Y9 [get_ports BOARD_CLK_IN]
set_property IOSTANDARD LVCMOS33 [get_ports BOARD_CLK_IN]

#--------------------------------------------------------
# BOARD RESET (Bank 35, 1.8V - SW7 버튼)
# 주의: Bank 35는 1.8V 고정이므로 LVCMOS18 사용
set_property PACKAGE_PIN P16 [get_ports BOARD_RST_SW]
set_property IOSTANDARD LVCMOS18 [get_ports BOARD_RST_SW]

#--------------------------------------------------------
set_false_path -reset_path -from [get_ports BOARD_RST_SW]
create_clock -period 10.000 -name BOARD_CLK_IN [get_ports BOARD_CLK_IN]

#--------------------------------------------------------
# JA PMOD - Bank 13
#    +--+--+--+--+--+--+
#    |V |G |4 |3 |2 |1 | upper
#    +--+--+--+--+--+--+
#    |V |G |10|9 |8 |7 | lower
#  --+--+--+--+--+--+--+--
#  -----------------------PCB
#
# USBUART
#
#   VCC  GND CTSn TXD RXD RTSn
#             ||  /\  ||  / #   +------------------------+
#   |  6   5   4   3   2   1 |
#
set_property PACKAGE_PIN Y11 [get_ports uart_cts_n]
set_property PACKAGE_PIN AA11 [get_ports uart_txd]
set_property PACKAGE_PIN Y10 [get_ports uart_rxd]
set_property PACKAGE_PIN AA9 [get_ports uart_rts_n]
#set_property PACKAGE_PIN AB11 [get_ports {JA7}];  # "JA7"
#set_property PACKAGE_PIN AB10 [get_ports {JA8}];  # "JA8"
#set_property PACKAGE_PIN AB9  [get_ports {JA9}];  # "JA9"
#set_property PACKAGE_PIN AA8  [get_ports {JA10}]; # "JA10"

set_property IOSTANDARD LVCMOS33 [get_ports uart_*]
# Note that the bank voltage for IO Bank 13 is fixed to 3.3V on ZedBoard.
#set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 13]];



#--------------------------------------------------------
# GPIO 8비트 핀 할당 (ZedBoard 내장 LED 및 스위치)
#--------------------------------------------------------
# GPIO Output -> ZedBoard 8개 LED (LD0-LD7) - Bank 33 (3.3V 고정)
set_property PACKAGE_PIN T22 [get_ports {gpio_out[0]}]
set_property PACKAGE_PIN T21 [get_ports {gpio_out[1]}]
set_property PACKAGE_PIN U22 [get_ports {gpio_out[2]}]
set_property PACKAGE_PIN U21 [get_ports {gpio_out[3]}]
set_property PACKAGE_PIN V22 [get_ports {gpio_out[4]}]
set_property PACKAGE_PIN W22 [get_ports {gpio_out[5]}]
set_property PACKAGE_PIN U19 [get_ports {gpio_out[6]}]
set_property PACKAGE_PIN U14 [get_ports {gpio_out[7]}]

# GPIO Input -> ZedBoard 8개 스위치 (SW0-SW7) - Bank 35 (1.8V 고정)
set_property PACKAGE_PIN F22 [get_ports {gpio_in[0]}]
set_property PACKAGE_PIN G22 [get_ports {gpio_in[1]}]
set_property PACKAGE_PIN H22 [get_ports {gpio_in[2]}]
set_property PACKAGE_PIN F21 [get_ports {gpio_in[3]}]
set_property PACKAGE_PIN H19 [get_ports {gpio_in[4]}]
set_property PACKAGE_PIN H18 [get_ports {gpio_in[5]}]
set_property PACKAGE_PIN H17 [get_ports {gpio_in[6]}]
set_property PACKAGE_PIN M15 [get_ports {gpio_in[7]}]

# GPIO Direction (gpio_dir)은 내부 신호로만 사용 (외부 핀 할당 안 함)
# GPIO 방향 제어는 GPIO 컨트롤러 내부에서만 사용되므로 외부 핀 불필요

# I/O 표준 설정
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_out[*]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_in[*]}]

#--------------------------------------------------------
# 4x4 Matrix Keypad 시뮬레이션을 위한 GPIO 핀 할당
# ZedBoard 내장 스위치/버튼 사용
#--------------------------------------------------------
# Column 출력 핀 (Column을 LOW로 설정하여 스캔)
set_property PACKAGE_PIN W6 [get_ports {keypad_col[3]}]
set_property PACKAGE_PIN W5 [get_ports {keypad_col[2]}]
set_property PACKAGE_PIN U6 [get_ports {keypad_col[1]}]
set_property PACKAGE_PIN U5 [get_ports {keypad_col[0]}]

# Row 입력 핀 (버튼이 눌리면 LOW 감지)
set_property PACKAGE_PIN V7 [get_ports {keypad_row[3]}]
set_property PACKAGE_PIN W7 [get_ports {keypad_row[2]}]
set_property PACKAGE_PIN V5 [get_ports {keypad_row[1]}]
set_property PACKAGE_PIN V4 [get_ports {keypad_row[0]}]





# I/O 표준 설정
set_property IOSTANDARD LVCMOS33 [get_ports {keypad_col[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {keypad_col[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {keypad_col[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {keypad_col[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {keypad_row[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {keypad_row[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {keypad_row[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {keypad_row[0]}]


# Pull-up 설정 (Row 핀은 버튼이 안 눌렸을 때 HIGH)
set_property PULLUP true [get_ports {keypad_row[3]}]
set_property PULLUP true [get_ports {keypad_row[2]}]
set_property PULLUP true [get_ports {keypad_row[1]}]
set_property PULLUP true [get_ports {keypad_row[0]}]

#--------------------------------------------------------
# I2C for AT24C02 EEPROM - JB PMOD Connector (Bank 13, 3.3V)
#--------------------------------------------------------
# JB3: SDA (Data)
# JB4: SCL (Clock)
#
# 주의사항:
# 1. 외부 4.7kΩ 풀업 저항 필수 (SCL, SDA 각각을 VCC 3.3V에 연결)
# 2. AT24C02 주소 설정: A0=A1=A2=GND → Device Address = 0x50
# 3. WP 핀을 GND에 연결 (쓰기 허용)
#--------------------------------------------------------
set_property PACKAGE_PIN V10 [get_ports i2c_sda]
set_property PACKAGE_PIN W8 [get_ports i2c_scl]

set_property IOSTANDARD LVCMOS33 [get_ports i2c_sda]
set_property IOSTANDARD LVCMOS33 [get_ports i2c_scl]

# I2C 400kHz를 위한 빠른 신호 전환
set_property SLEW FAST [get_ports i2c_sda]
set_property SLEW FAST [get_ports i2c_scl]

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list design_riscv_cache_i/clk_wiz_0/inst/clk_out2]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 2 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_arburst[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_arburst[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wdata[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wdata[1]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wdata[2]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wdata[3]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wdata[4]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wdata[5]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wdata[6]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wdata[7]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wdata[8]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wdata[9]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wdata[10]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wdata[11]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wdata[12]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wdata[13]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wdata[14]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wdata[15]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wdata[16]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wdata[17]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wdata[18]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wdata[19]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wdata[20]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wdata[21]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wdata[22]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wdata[23]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wdata[24]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wdata[25]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wdata[26]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wdata[27]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wdata[28]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wdata[29]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wdata[30]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wdata[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 8 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_arlen[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_arlen[1]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_arlen[2]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_arlen[3]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_arlen[4]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_arlen[5]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_arlen[6]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_arlen[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 32 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_araddr[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_araddr[1]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_araddr[2]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_araddr[3]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_araddr[4]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_araddr[5]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_araddr[6]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_araddr[7]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_araddr[8]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_araddr[9]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_araddr[10]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_araddr[11]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_araddr[12]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_araddr[13]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_araddr[14]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_araddr[15]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_araddr[16]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_araddr[17]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_araddr[18]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_araddr[19]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_araddr[20]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_araddr[21]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_araddr[22]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_araddr[23]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_araddr[24]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_araddr[25]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_araddr[26]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_araddr[27]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_araddr[28]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_araddr[29]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_araddr[30]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_araddr[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 3 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awsize[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awsize[1]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awsize[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 32 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wdata[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wdata[1]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wdata[2]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wdata[3]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wdata[4]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wdata[5]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wdata[6]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wdata[7]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wdata[8]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wdata[9]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wdata[10]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wdata[11]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wdata[12]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wdata[13]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wdata[14]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wdata[15]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wdata[16]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wdata[17]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wdata[18]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wdata[19]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wdata[20]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wdata[21]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wdata[22]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wdata[23]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wdata[24]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wdata[25]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wdata[26]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wdata[27]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wdata[28]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wdata[29]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wdata[30]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wdata[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 2 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rresp[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rresp[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 4 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rid[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rid[1]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rid[2]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rid[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 4 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wstrb[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wstrb[1]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wstrb[2]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wstrb[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 8 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awlen[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awlen[1]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awlen[2]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awlen[3]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awlen[4]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awlen[5]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awlen[6]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awlen[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 32 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awaddr[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awaddr[1]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awaddr[2]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awaddr[3]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awaddr[4]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awaddr[5]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awaddr[6]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awaddr[7]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awaddr[8]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awaddr[9]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awaddr[10]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awaddr[11]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awaddr[12]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awaddr[13]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awaddr[14]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awaddr[15]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awaddr[16]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awaddr[17]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awaddr[18]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awaddr[19]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awaddr[20]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awaddr[21]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awaddr[22]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awaddr[23]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awaddr[24]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awaddr[25]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awaddr[26]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awaddr[27]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awaddr[28]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awaddr[29]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awaddr[30]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awaddr[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 4 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_bid[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_bid[1]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_bid[2]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_bid[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 2 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_bresp[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_bresp[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 3 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_arsize[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_arsize[1]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_arsize[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 4 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awid[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awid[1]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awid[2]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awid[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 2 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awburst[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awburst[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 4 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wstrb[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wstrb[1]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wstrb[2]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wstrb[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 3 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_arsize[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_arsize[1]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_arsize[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 32 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rdata[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rdata[1]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rdata[2]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rdata[3]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rdata[4]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rdata[5]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rdata[6]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rdata[7]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rdata[8]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rdata[9]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rdata[10]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rdata[11]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rdata[12]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rdata[13]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rdata[14]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rdata[15]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rdata[16]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rdata[17]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rdata[18]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rdata[19]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rdata[20]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rdata[21]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rdata[22]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rdata[23]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rdata[24]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rdata[25]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rdata[26]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rdata[27]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rdata[28]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rdata[29]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rdata[30]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rdata[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 4 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awid[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awid[1]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awid[2]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awid[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 2 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_arburst[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_arburst[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 2 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_bresp[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_bresp[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 4 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_arid[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_arid[1]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_arid[2]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_arid[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 2 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awburst[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awburst[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 4 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_bid[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_bid[1]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_bid[2]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_bid[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 8 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awlen[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awlen[1]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awlen[2]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awlen[3]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awlen[4]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awlen[5]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awlen[6]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awlen[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 4 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_arid[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_arid[1]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_arid[2]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_arid[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 4 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rid[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rid[1]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rid[2]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rid[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 3 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awsize[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awsize[1]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awsize[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 32 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awaddr[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awaddr[1]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awaddr[2]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awaddr[3]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awaddr[4]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awaddr[5]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awaddr[6]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awaddr[7]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awaddr[8]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awaddr[9]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awaddr[10]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awaddr[11]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awaddr[12]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awaddr[13]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awaddr[14]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awaddr[15]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awaddr[16]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awaddr[17]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awaddr[18]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awaddr[19]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awaddr[20]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awaddr[21]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awaddr[22]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awaddr[23]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awaddr[24]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awaddr[25]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awaddr[26]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awaddr[27]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awaddr[28]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awaddr[29]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awaddr[30]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awaddr[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 8 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_arlen[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_arlen[1]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_arlen[2]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_arlen[3]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_arlen[4]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_arlen[5]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_arlen[6]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_arlen[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 2 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rresp[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rresp[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 32 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_araddr[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_araddr[1]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_araddr[2]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_araddr[3]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_araddr[4]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_araddr[5]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_araddr[6]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_araddr[7]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_araddr[8]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_araddr[9]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_araddr[10]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_araddr[11]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_araddr[12]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_araddr[13]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_araddr[14]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_araddr[15]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_araddr[16]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_araddr[17]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_araddr[18]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_araddr[19]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_araddr[20]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_araddr[21]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_araddr[22]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_araddr[23]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_araddr[24]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_araddr[25]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_araddr[26]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_araddr[27]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_araddr[28]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_araddr[29]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_araddr[30]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_araddr[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 32 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rdata[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rdata[1]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rdata[2]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rdata[3]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rdata[4]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rdata[5]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rdata[6]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rdata[7]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rdata[8]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rdata[9]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rdata[10]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rdata[11]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rdata[12]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rdata[13]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rdata[14]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rdata[15]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rdata[16]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rdata[17]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rdata[18]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rdata[19]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rdata[20]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rdata[21]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rdata[22]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rdata[23]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rdata[24]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rdata[25]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rdata[26]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rdata[27]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rdata[28]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rdata[29]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rdata[30]} {design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rdata[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 4 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/gpio_out[4]} {design_riscv_cache_i/riscv_cache_soc_0/inst/gpio_out[5]} {design_riscv_cache_i/riscv_cache_soc_0/inst/gpio_out[6]} {design_riscv_cache_i/riscv_cache_soc_0/inst/gpio_out[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 4 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/keypad_col[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/keypad_col[1]} {design_riscv_cache_i/riscv_cache_soc_0/inst/keypad_col[2]} {design_riscv_cache_i/riscv_cache_soc_0/inst/keypad_col[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 8 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/gpio_in[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/gpio_in[1]} {design_riscv_cache_i/riscv_cache_soc_0/inst/gpio_in[2]} {design_riscv_cache_i/riscv_cache_soc_0/inst/gpio_in[3]} {design_riscv_cache_i/riscv_cache_soc_0/inst/gpio_in[4]} {design_riscv_cache_i/riscv_cache_soc_0/inst/gpio_in[5]} {design_riscv_cache_i/riscv_cache_soc_0/inst/gpio_in[6]} {design_riscv_cache_i/riscv_cache_soc_0/inst/gpio_in[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
set_property port_width 8 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/gpio_dir[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/gpio_dir[1]} {design_riscv_cache_i/riscv_cache_soc_0/inst/gpio_dir[2]} {design_riscv_cache_i/riscv_cache_soc_0/inst/gpio_dir[3]} {design_riscv_cache_i/riscv_cache_soc_0/inst/gpio_dir[4]} {design_riscv_cache_i/riscv_cache_soc_0/inst/gpio_dir[5]} {design_riscv_cache_i/riscv_cache_soc_0/inst/gpio_dir[6]} {design_riscv_cache_i/riscv_cache_soc_0/inst/gpio_dir[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
set_property port_width 3 [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/u_uart/u_core/u_tx/state[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/u_uart/u_core/u_tx/state[1]} {design_riscv_cache_i/riscv_cache_soc_0/inst/u_uart/u_core/u_tx/state[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
set_property port_width 3 [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list {design_riscv_cache_i/riscv_cache_soc_0/inst/u_uart/u_core/u_rx/state[0]} {design_riscv_cache_i/riscv_cache_soc_0/inst/u_uart/u_core/u_rx/state[1]} {design_riscv_cache_i/riscv_cache_soc_0/inst/u_uart/u_core/u_rx/state[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe40]
set_property port_width 1 [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list design_riscv_cache_i/riscv_cache_soc_0/inst/axi_aresetn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe41]
set_property port_width 1 [get_debug_ports u_ila_0/probe41]
connect_debug_port u_ila_0/probe41 [get_nets [list design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_arready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe42]
set_property port_width 1 [get_debug_ports u_ila_0/probe42]
connect_debug_port u_ila_0/probe42 [get_nets [list design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_arvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe43]
set_property port_width 1 [get_debug_ports u_ila_0/probe43]
connect_debug_port u_ila_0/probe43 [get_nets [list design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe44]
set_property port_width 1 [get_debug_ports u_ila_0/probe44]
connect_debug_port u_ila_0/probe44 [get_nets [list design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_awvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe45]
set_property port_width 1 [get_debug_ports u_ila_0/probe45]
connect_debug_port u_ila_0/probe45 [get_nets [list design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_bready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe46]
set_property port_width 1 [get_debug_ports u_ila_0/probe46]
connect_debug_port u_ila_0/probe46 [get_nets [list design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_bvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe47]
set_property port_width 1 [get_debug_ports u_ila_0/probe47]
connect_debug_port u_ila_0/probe47 [get_nets [list design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe48]
set_property port_width 1 [get_debug_ports u_ila_0/probe48]
connect_debug_port u_ila_0/probe48 [get_nets [list design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe49]
set_property port_width 1 [get_debug_ports u_ila_0/probe49]
connect_debug_port u_ila_0/probe49 [get_nets [list design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_rvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe50]
set_property port_width 1 [get_debug_ports u_ila_0/probe50]
connect_debug_port u_ila_0/probe50 [get_nets [list design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe51]
set_property port_width 1 [get_debug_ports u_ila_0/probe51]
connect_debug_port u_ila_0/probe51 [get_nets [list design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe52]
set_property port_width 1 [get_debug_ports u_ila_0/probe52]
connect_debug_port u_ila_0/probe52 [get_nets [list design_riscv_cache_i/riscv_cache_soc_0/inst/axi_data_wvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe53]
set_property port_width 1 [get_debug_ports u_ila_0/probe53]
connect_debug_port u_ila_0/probe53 [get_nets [list design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_arready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe54]
set_property port_width 1 [get_debug_ports u_ila_0/probe54]
connect_debug_port u_ila_0/probe54 [get_nets [list design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_arvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe55]
set_property port_width 1 [get_debug_ports u_ila_0/probe55]
connect_debug_port u_ila_0/probe55 [get_nets [list design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe56]
set_property port_width 1 [get_debug_ports u_ila_0/probe56]
connect_debug_port u_ila_0/probe56 [get_nets [list design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_awvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe57]
set_property port_width 1 [get_debug_ports u_ila_0/probe57]
connect_debug_port u_ila_0/probe57 [get_nets [list design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_bready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe58]
set_property port_width 1 [get_debug_ports u_ila_0/probe58]
connect_debug_port u_ila_0/probe58 [get_nets [list design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_bvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe59]
set_property port_width 1 [get_debug_ports u_ila_0/probe59]
connect_debug_port u_ila_0/probe59 [get_nets [list design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe60]
set_property port_width 1 [get_debug_ports u_ila_0/probe60]
connect_debug_port u_ila_0/probe60 [get_nets [list design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe61]
set_property port_width 1 [get_debug_ports u_ila_0/probe61]
connect_debug_port u_ila_0/probe61 [get_nets [list design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_rvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe62]
set_property port_width 1 [get_debug_ports u_ila_0/probe62]
connect_debug_port u_ila_0/probe62 [get_nets [list design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe63]
set_property port_width 1 [get_debug_ports u_ila_0/probe63]
connect_debug_port u_ila_0/probe63 [get_nets [list design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe64]
set_property port_width 1 [get_debug_ports u_ila_0/probe64]
connect_debug_port u_ila_0/probe64 [get_nets [list design_riscv_cache_i/riscv_cache_soc_0/inst/axi_inst_wvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe65]
set_property port_width 1 [get_debug_ports u_ila_0/probe65]
connect_debug_port u_ila_0/probe65 [get_nets [list design_riscv_cache_i/riscv_cache_soc_0/inst/cpu_resetn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe66]
set_property port_width 1 [get_debug_ports u_ila_0/probe66]
connect_debug_port u_ila_0/probe66 [get_nets [list design_riscv_cache_i/riscv_cache_soc_0/inst/i2c_scl]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe67]
set_property port_width 1 [get_debug_ports u_ila_0/probe67]
connect_debug_port u_ila_0/probe67 [get_nets [list design_riscv_cache_i/riscv_cache_soc_0/inst/i2c_sda]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe68]
set_property port_width 1 [get_debug_ports u_ila_0/probe68]
connect_debug_port u_ila_0/probe68 [get_nets [list design_riscv_cache_i/riscv_cache_soc_0/inst/uart_cts_n]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe69]
set_property port_width 1 [get_debug_ports u_ila_0/probe69]
connect_debug_port u_ila_0/probe69 [get_nets [list design_riscv_cache_i/riscv_cache_soc_0/inst/uart_rts_n]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe70]
set_property port_width 1 [get_debug_ports u_ila_0/probe70]
connect_debug_port u_ila_0/probe70 [get_nets [list design_riscv_cache_i/riscv_cache_soc_0/inst/uart_rxd]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe71]
set_property port_width 1 [get_debug_ports u_ila_0/probe71]
connect_debug_port u_ila_0/probe71 [get_nets [list design_riscv_cache_i/riscv_cache_soc_0/inst/uart_txd]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_clk_out2]
