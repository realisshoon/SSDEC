set sim_dir [file dirname [info script]]
set rtl_dir [file normalize "$sim_dir/../rtl/verilog"]

exec xvlog -sv \
    [file join $rtl_dir i2c_core.v] \
    [file join $rtl_dir i2c_csr.v] \
    [file join $rtl_dir i2c_axi_lite_if.v] \
    [file join $sim_dir i2c_tb.v]

exec xelab iic_controller_tb -s i2c_tb_sim --debug typical

set run_script [file join $sim_dir xsim_do.tcl]
if {![file exists $run_script]} {
    puts "WARNING: $run_script not found; creating default"
    set fp [open $run_script w]
    puts $fp {log_wave -recursive /*}
    puts $fp {run 20 us}
    puts $fp {write_vcd i2c_tb.vcd}
    puts $fp {exit}
    close $fp
}

exec xsim i2c_tb_sim -tclbatch $run_script
