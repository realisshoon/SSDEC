log_wave -recursive /*
open_vcd i2c_tb.vcd
log_vcd [get_objects -r /*]
run 100 us
close_vcd
exit
