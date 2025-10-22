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



