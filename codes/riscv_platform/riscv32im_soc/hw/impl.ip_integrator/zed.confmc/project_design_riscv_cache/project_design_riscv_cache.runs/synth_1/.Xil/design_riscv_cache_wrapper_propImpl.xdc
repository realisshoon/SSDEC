set_property SRC_FILE_INFO {cfile:/home/sogang/pjt/team2/codes/riscv_platform/riscv32im_soc/hw/impl.ip_integrator/zed.confmc/xdc/fpga_zed.xdc rfile:../../../../xdc/fpga_zed.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:3 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN Y9 [get_ports BOARD_CLK_IN]
set_property src_info {type:XDC file:1 line:8 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN P16 [get_ports BOARD_RST_SW]
set_property src_info {type:XDC file:1 line:12 export:INPUT save:INPUT read:READ} [current_design]
set_false_path -reset_path -from [get_ports BOARD_RST_SW]
set_property src_info {type:XDC file:1 line:31 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN Y11  [get_ports uart_cts_n];# "JA1"
set_property src_info {type:XDC file:1 line:32 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AA11 [get_ports uart_txd];  # "JA2"
set_property src_info {type:XDC file:1 line:33 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN Y10  [get_ports uart_rxd];  # "JA3"
set_property src_info {type:XDC file:1 line:34 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AA9  [get_ports uart_rts_n];# "JA4"
set_property src_info {type:XDC file:1 line:50 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T22 [get_ports {gpio_out[0]}]  # LD0
set_property src_info {type:XDC file:1 line:51 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T21 [get_ports {gpio_out[1]}]  # LD1
set_property src_info {type:XDC file:1 line:52 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U22 [get_ports {gpio_out[2]}]  # LD2
set_property src_info {type:XDC file:1 line:53 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U21 [get_ports {gpio_out[3]}]  # LD3
set_property src_info {type:XDC file:1 line:54 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V22 [get_ports {gpio_out[4]}]  # LD4
set_property src_info {type:XDC file:1 line:55 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN W22 [get_ports {gpio_out[5]}]  # LD5
set_property src_info {type:XDC file:1 line:56 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U19 [get_ports {gpio_out[6]}]  # LD6
set_property src_info {type:XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U14 [get_ports {gpio_out[7]}]  # LD7
set_property src_info {type:XDC file:1 line:60 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN F22 [get_ports {gpio_in[0]}]   # SW0
set_property src_info {type:XDC file:1 line:61 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN G22 [get_ports {gpio_in[1]}]   # SW1
set_property src_info {type:XDC file:1 line:62 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN H22 [get_ports {gpio_in[2]}]   # SW2
set_property src_info {type:XDC file:1 line:63 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN F21 [get_ports {gpio_in[3]}]   # SW3
set_property src_info {type:XDC file:1 line:64 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN H19 [get_ports {gpio_in[4]}]   # SW4
set_property src_info {type:XDC file:1 line:65 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN H18 [get_ports {gpio_in[5]}]   # SW5
set_property src_info {type:XDC file:1 line:66 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN H17 [get_ports {gpio_in[6]}]   # SW6
set_property src_info {type:XDC file:1 line:67 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN M15 [get_ports {gpio_in[7]}]   # SW7
set_property src_info {type:XDC file:1 line:73 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_out[*]}]  # Bank 33: 3.3V 고정
set_property src_info {type:XDC file:1 line:74 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_in[*]}]   # Bank 35: 1.8V 고정
set_property src_info {type:XDC file:1 line:81 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T12 [get_ports {keypad_col[3]}]  # JD1 -> COL4
set_property src_info {type:XDC file:1 line:82 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U12 [get_ports {keypad_col[2]}]  # JD2 -> COL3
set_property src_info {type:XDC file:1 line:83 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V12 [get_ports {keypad_col[1]}]  # JD3 -> COL2
set_property src_info {type:XDC file:1 line:84 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN W13 [get_ports {keypad_col[0]}]  # JD4 -> COL1
set_property src_info {type:XDC file:1 line:87 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T11 [get_ports {keypad_row[3]}]  # JD7 -> ROW4
set_property src_info {type:XDC file:1 line:88 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T10 [get_ports {keypad_row[2]}]  # JD8 -> ROW3
set_property src_info {type:XDC file:1 line:89 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V13 [get_ports {keypad_row[1]}]  # JD9 -> ROW2
set_property src_info {type:XDC file:1 line:90 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN W14 [get_ports {keypad_row[0]}]  # JD10 -> ROW1
