#-------------------------------------------------------------------------------
# I2C Master Ver2 Latch Check Script
#-------------------------------------------------------------------------------

# 환경 변수 설정
set DIR_I2C_AXI_LITE "../../../ips/i2c_axi_lite"
set PART "xc7z020clg484-1"

# 프로젝트 생성 또는 열기
set proj_name "i2c_latch_check"
if {[file exists ${proj_name}]} {
    file delete -force ${proj_name}
}

create_project ${proj_name} ${proj_name} -part ${PART} -force

# 소스 파일 추가
puts "=== Adding source files ==="
add_files -norecurse ${DIR_I2C_AXI_LITE}/rtl/verilog/i2c_master_ver2.v

# 합성 설정
set_property top mem_axi_lite [current_fileset]

# Out-of-context 합성 실행
puts "=== Starting synthesis ==="
synth_design -top mem_axi_lite -part ${PART} -mode out_of_context

# 합성 완료 대기
wait_on_run synth_1

# 래치 검색
puts "\n=== Checking for latches ==="
set latches [get_cells -hierarchical -filter {REF_NAME =~ LD*}]

if {[llength $latches] > 0} {
    puts "\n=========================================="
    puts "WARNING: [llength $latches] Latch(es) detected!"
    puts "=========================================="
    foreach latch $latches {
        set cell_name [get_property NAME $latch]
        set ref_name [get_property REF_NAME $latch]
        puts "  Latch: $cell_name (Type: $ref_name)"
    }
    puts "=========================================="
} else {
    puts "\n=========================================="
    puts "SUCCESS: No latches detected!"
    puts "=========================================="
}

# 상세 리포트 생성
puts "\n=== Generating reports ==="
report_utilization -file ${proj_name}/utilization.rpt
report_timing_summary -file ${proj_name}/timing_summary.rpt

# 래치 상세 정보
if {[llength $latches] > 0} {
    set latch_rpt [open "${proj_name}/latch_details.rpt" w]
    puts $latch_rpt "=== Latch Detection Report ==="
    puts $latch_rpt "Total Latches Found: [llength $latches]\n"
    
    foreach latch $latches {
        set cell_name [get_property NAME $latch]
        set ref_name [get_property REF_NAME $latch]
        set parent [get_property PARENT $latch]
        
        puts $latch_rpt "Latch: $cell_name"
        puts $latch_rpt "  Type: $ref_name"
        puts $latch_rpt "  Parent: $parent"
        puts $latch_rpt ""
    }
    close $latch_rpt
    puts "Latch details saved to: ${proj_name}/latch_details.rpt"
}

puts "\n=== Synthesis complete ==="
puts "Reports saved in: ${proj_name}/"
puts "  - utilization.rpt"
puts "  - timing_summary.rpt"
if {[llength $latches] > 0} {
    puts "  - latch_details.rpt"
}

# 결과 요약
puts "\n=========================================="
puts "SUMMARY"
puts "=========================================="
puts "Design: mem_axi_lite"
puts "Part: ${PART}"
puts "Latches: [llength $latches]"
puts "=========================================="

