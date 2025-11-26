# Implementation 및 Bitstream 생성 스크립트

# 프로젝트 열기
open_project project_design_riscv_cache/project_design_riscv_cache.xpr

# Implementation 리셋 및 실행
reset_run impl_1
launch_runs impl_1 -jobs 8
wait_on_run impl_1

# 결과 확인
if {[get_property PROGRESS [get_runs impl_1]] != "100%"} {
    puts "ERROR: Implementation did not complete"
    exit 1
}

if {[get_property STATUS [get_runs impl_1]] != "route_design Complete!"} {
    puts "ERROR: Implementation failed"
    puts "Status: [get_property STATUS [get_runs impl_1]]"
    exit 1
}

puts "SUCCESS: Implementation completed successfully!"

# Bitstream 생성
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1

# Bitstream 생성 확인
if {[get_property STATUS [get_runs impl_1]] != "write_bitstream Complete!"} {
    puts "ERROR: Bitstream generation failed"
    exit 1
}

puts "SUCCESS: Bitstream generated successfully!"
puts "Bitstream location: project_design_riscv_cache.runs/impl_1/design_riscv_cache_wrapper.bit"

close_project
