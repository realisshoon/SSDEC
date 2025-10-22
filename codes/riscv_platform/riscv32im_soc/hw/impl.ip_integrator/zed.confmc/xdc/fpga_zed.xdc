#--------------------------------------------------------
# CLOCK
set_property PACKAGE_PIN Y9 [get_ports BOARD_CLK_IN]
set_property IOSTANDARD LVCMOS33 [get_ports BOARD_CLK_IN]

#--------------------------------------------------------
# BOARD RESET
set_property PACKAGE_PIN P16 [get_ports BOARD_RST_SW]
set_property IOSTANDARD LVCMOS25 [get_ports BOARD_RST_SW]

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
#             ||  /\  ||  /\
#   +------------------------+
#   |  6   5   4   3   2   1 |
#
set_property PACKAGE_PIN Y11  [get_ports uart_cts_n];# "JA1"
set_property PACKAGE_PIN AA11 [get_ports uart_txd];  # "JA2"
set_property PACKAGE_PIN Y10  [get_ports uart_rxd];  # "JA3"
set_property PACKAGE_PIN AA9  [get_ports uart_rts_n];# "JA4"
#set_property PACKAGE_PIN AB11 [get_ports {JA7}];  # "JA7"
#set_property PACKAGE_PIN AB10 [get_ports {JA8}];  # "JA8"
#set_property PACKAGE_PIN AB9  [get_ports {JA9}];  # "JA9"
#set_property PACKAGE_PIN AA8  [get_ports {JA10}]; # "JA10"

set_property IOSTANDARD LVCMOS33 [get_ports uart_*]
# Note that the bank voltage for IO Bank 13 is fixed to 3.3V on ZedBoard.
#set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 13]];



#--------------------------------------------------------
# 4x4 Matrix Keypad 시뮬레이션을 위한 GPIO 핀 할당
# ZedBoard 내장 스위치/버튼 사용
#--------------------------------------------------------
# DIP 스위치 (SW0-SW7)를 keypad 입력으로 사용
set_property PACKAGE_PIN T22 [get_ports {gpio_in[0]}]   # SW0 -> Keypad Row0/Col0
set_property PACKAGE_PIN T21 [get_ports {gpio_in[1]}]   # SW1 -> Keypad Row0/Col1
set_property PACKAGE_PIN U22 [get_ports {gpio_in[2]}]   # SW2 -> Keypad Row1/Col0
set_property PACKAGE_PIN U21 [get_ports {gpio_in[3]}]   # SW3 -> Keypad Row1/Col1
set_property PACKAGE_PIN V22 [get_ports {gpio_in[4]}]   # SW4 -> Keypad Row2/Col0
set_property PACKAGE_PIN W22 [get_ports {gpio_in[5]}]   # SW5 -> Keypad Row2/Col1
set_property PACKAGE_PIN U19 [get_ports {gpio_in[6]}]   # SW6 -> Keypad Row3/Col0
set_property PACKAGE_PIN U14 [get_ports {gpio_in[7]}]   # SW7 -> Keypad Row3/Col1

# I/O 표준 설정 (Bank 14 - 3.3V)
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_in[7:0]}]

#--------------------------------------------------------
# GPIO 출력 핀 할당 (향후 확장용)
#--------------------------------------------------------
# GPIO 출력 핀들 (현재는 사용하지 않지만 향후 keypad Row 제어용)
set_property PACKAGE_PIN AA12 [get_ports {gpio_out[0]}]  # GPIO_OUT[0] - 향후 Row0 제어용
set_property PACKAGE_PIN AB12 [get_ports {gpio_out[1]}]  # GPIO_OUT[1] - 향후 Row1 제어용
set_property PACKAGE_PIN AB11 [get_ports {gpio_out[2]}]  # GPIO_OUT[2] - 향후 Row2 제어용
set_property PACKAGE_PIN AB10 [get_ports {gpio_out[3]}]  # GPIO_OUT[3] - 향후 Row3 제어용

set_property IOSTANDARD LVCMOS33 [get_ports {gpio_out[3:0]}]

#--------------------------------------------------------
# GPIO Direction 핀 할당 (향후 확장용)
#--------------------------------------------------------
# GPIO direction 핀들 (현재는 사용하지 않지만 향후 keypad direction 제어용)
set_property PACKAGE_PIN AB9  [get_ports {gpio_dir[0]}]   # GPIO_DIR[0] - 향후 Row0 direction 제어용
set_property PACKAGE_PIN AA8  [get_ports {gpio_dir[1]}]   # GPIO_DIR[1] - 향후 Row1 direction 제어용
set_property PACKAGE_PIN AA7  [get_ports {gpio_dir[2]}]   # GPIO_DIR[2] - 향후 Row2 direction 제어용
set_property PACKAGE_PIN AB8  [get_ports {gpio_dir[3]}]   # GPIO_DIR[3] - 향후 Row3 direction 제어용

set_property IOSTANDARD LVCMOS33 [get_ports {gpio_dir[3:0]}]