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
# GPIO 8비트 핀 할당 (ZedBoard 내장 LED 및 스위치)
#--------------------------------------------------------
# GPIO Output -> ZedBoard 8개 LED (LD0-LD7) - Bank 33 (3.3V 고정)
set_property PACKAGE_PIN T22 [get_ports {gpio_out[0]}]  # LD0
set_property PACKAGE_PIN T21 [get_ports {gpio_out[1]}]  # LD1
set_property PACKAGE_PIN U22 [get_ports {gpio_out[2]}]  # LD2
set_property PACKAGE_PIN U21 [get_ports {gpio_out[3]}]  # LD3
set_property PACKAGE_PIN V22 [get_ports {gpio_out[4]}]  # LD4
set_property PACKAGE_PIN W22 [get_ports {gpio_out[5]}]  # LD5
set_property PACKAGE_PIN U19 [get_ports {gpio_out[6]}]  # LD6
set_property PACKAGE_PIN U14 [get_ports {gpio_out[7]}]  # LD7

# GPIO Input -> ZedBoard 8개 스위치 (SW0-SW7) - Bank 35 (1.8V 고정)
set_property PACKAGE_PIN F22 [get_ports {gpio_in[0]}]   # SW0
set_property PACKAGE_PIN G22 [get_ports {gpio_in[1]}]   # SW1
set_property PACKAGE_PIN H22 [get_ports {gpio_in[2]}]   # SW2
set_property PACKAGE_PIN F21 [get_ports {gpio_in[3]}]   # SW3
set_property PACKAGE_PIN H19 [get_ports {gpio_in[4]}]   # SW4
set_property PACKAGE_PIN H18 [get_ports {gpio_in[5]}]   # SW5
set_property PACKAGE_PIN H17 [get_ports {gpio_in[6]}]   # SW6
set_property PACKAGE_PIN M15 [get_ports {gpio_in[7]}]   # SW7

# GPIO Direction (gpio_dir)은 내부 신호로만 사용 (외부 핀 할당 안 함)
# GPIO 방향 제어는 GPIO 컨트롤러 내부에서만 사용되므로 외부 핀 불필요

# I/O 표준 설정
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_out[*]}]  # Bank 33: 3.3V 고정
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_in[*]}]   # Bank 35: 1.8V 고정

#--------------------------------------------------------
# 4x4 Matrix Keypad 시뮬레이션을 위한 GPIO 핀 할당
# ZedBoard 내장 스위치/버튼 사용
#--------------------------------------------------------
# Column 출력 핀 (Column을 LOW로 설정하여 스캔)
set_property PACKAGE_PIN T12 [get_ports {keypad_col[3]}]  # JD1 -> COL4
set_property PACKAGE_PIN U12 [get_ports {keypad_col[2]}]  # JD2 -> COL3
set_property PACKAGE_PIN V12 [get_ports {keypad_col[1]}]  # JD3 -> COL2
set_property PACKAGE_PIN W13 [get_ports {keypad_col[0]}]  # JD4 -> COL1

# Row 입력 핀 (버튼이 눌리면 LOW 감지)
set_property PACKAGE_PIN T11 [get_ports {keypad_row[3]}]  # JD7 -> ROW4
set_property PACKAGE_PIN T10 [get_ports {keypad_row[2]}]  # JD8 -> ROW3
set_property PACKAGE_PIN V13 [get_ports {keypad_row[1]}]  # JD9 -> ROW2
set_property PACKAGE_PIN W14 [get_ports {keypad_row[0]}]  # JD10 -> ROW1

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
set_property PULLUP TRUE [get_ports {keypad_row[*]}]