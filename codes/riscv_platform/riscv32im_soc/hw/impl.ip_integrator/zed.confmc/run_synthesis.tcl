# Synthesis 실행 스크립트

# 프로젝트 열기
open_project project_design_riscv_cache/project_design_riscv_cache.xpr

# Synthesis 리셋 및 실행
reset_run synth_1
launch_runs synth_1 -jobs 8
wait_on_run synth_1

# 결과 확인
if {[get_property PROGRESS [get_runs synth_1]] != "100%"} {
    puts "ERROR: Synthesis did not complete"
    exit 1
}

if {[get_property STATUS [get_runs synth_1]] != "synth_design Complete!"} {
    puts "ERROR: Synthesis failed"
    exit 1
}

puts "SUCCESS: Synthesis completed successfully!"

close_project
