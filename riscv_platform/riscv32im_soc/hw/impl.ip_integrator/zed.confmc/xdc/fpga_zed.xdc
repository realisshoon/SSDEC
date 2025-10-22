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





