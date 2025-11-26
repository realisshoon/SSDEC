# Vivado Tcl Script to create the RISC-V SoC Verification Project
# Usage: Open Vivado -> Tools -> Run Tcl Script -> Select this file

# 1. Define Project Name and Directory
set project_name "riscv_soc_verify"
set project_dir "vivado_soc_project"

# 2. Create Project
create_project -force $project_name $project_dir -part xc7z020clg484-1

# 3. Define Variables for Paths (Absolute paths for safety)
set BASE_DIR "/home/sogang/test1/codes/riscv_platform/riscv32im_soc"
set HW_DIR "$BASE_DIR/hw"
set IPS_DIR "$BASE_DIR/ips"

# 4. Add Source Files
# We add files in groups for clarity
add_files -norecurse [list \
    "$HW_DIR/rtl/verilog/riscv_cache_soc_tb.v" \
    "$HW_DIR/rtl/verilog/riscv_cache_soc_top.v" \
    "$HW_DIR/rtl/verilog/riscv_cache_soc.v" \
    "$HW_DIR/rtl/verilog/riscv_cache_core.v" \
    "$IPS_DIR/axi_switch_m3s3.rel/rtl/verilog/axi_switch_m3s3.v" \
    "$IPS_DIR/mem_axi.rel/rtl/verilog/mem_axi.v" \
    "$IPS_DIR/axi2lite.rel/rtl/verilog/axi4_to_lite.v" \
    "$IPS_DIR/amba_axi_lite.rel/rtl/verilog/amba_axi_lite_m5.v" \
    "$IPS_DIR/pic_axi_lite.rel/rtl/verilog/pic_axi_lite.v" \
    "$IPS_DIR/timer_axi_lite.rel/rtl/verilog/timer_axi_lite.v" \
    "$IPS_DIR/uart_axi_lite.rel/rtl/verilog/uart_axi_lite.v" \
    "$IPS_DIR/gpio_axi_lite.rel/rtl/verilog/gpio_axi_lite.v" \
    "$IPS_DIR/gpio_axi_lite.rel/rtl/verilog/gpio_axi_lite_if.v" \
    "$IPS_DIR/ex_i2c_master_axi_lite.rel/rtl/verilog/i2c_master_axi_lite.v" \
    "$IPS_DIR/ex_i2c_master_axi_lite.rel/rtl/verilog/i2c_axi_lite.v" \
    "$IPS_DIR/ex_i2c_master_axi_lite.rel/rtl/verilog/i2c_master_core.v" \
    "$IPS_DIR/ex_i2c_master_axi_lite.rel/rtl/verilog/i2c_master_csr.v" \
    "$IPS_DIR/ex_i2c_master_axi_lite.rel/rtl/verilog/i2c_master_byte.v" \
    "$IPS_DIR/ex_i2c_master_axi_lite.rel/rtl/verilog/i2c_fifo_sync_small.v" \
    "$IPS_DIR/ex_i2c_master_axi_lite.rel/beh/verilog/i2c_slave.v" \
    "$IPS_DIR/ex_i2c_master_axi_lite.rel/beh/verilog/i2c_slave_if.v" \
    "$IPS_DIR/ex_i2c_master_axi_lite.rel/beh/verilog/i2c_slave_mem.v" \
]

# Add RISC-V Core Files (Recursive add for simplicity as there are many)
add_files "$BASE_DIR/ips/riscv.rel/top_cache_axi/src_v"
add_files "$BASE_DIR/ips/riscv.rel/core/riscv"

# 5. Add Include Directories
set_property include_dirs [list \
    "$HW_DIR/rtl/verilog" \
    "$IPS_DIR/ex_i2c_master_axi_lite.rel/rtl/verilog" \
    "$IPS_DIR/ex_i2c_master_axi_lite.rel/beh/verilog" \
    "$IPS_DIR/riscv.rel/core/riscv" \
] [get_filesets sources_1]

# 6. Set Top Module
set_property top riscv_cache_soc_tb [get_filesets sources_1]
set_property top riscv_cache_soc_tb [get_filesets sim_1]

# 7. Simulation Settings
set_property -name {xsim.simulate.log_all_signals} -value {true} -objects [get_filesets sim_1]
# Remove the EEPROM_TEST generic as it was for the standalone testbench
# set_property generic {EEPROM_TEST=1} [get_filesets sim_1] 

# 8. Update Compile Order
update_compile_order -fileset sources_1

puts "-----------------------------------------------------------"
puts "SoC Project created successfully!"
puts "Top module set to: riscv_cache_soc_tb"
puts "-----------------------------------------------------------"
