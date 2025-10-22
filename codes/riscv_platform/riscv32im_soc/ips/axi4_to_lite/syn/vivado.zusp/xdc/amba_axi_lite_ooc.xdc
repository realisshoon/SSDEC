#--------------------------------------------------------
# AXI CLOCK
create_clock   -name aclk -period  2.0 [get_ports aclk]

#--------------------------------------------------------
# AXI RESET
set_false_path -from [get_clocks aclk] -to [get_ports aresetn]

#--------------------------------------------------------
