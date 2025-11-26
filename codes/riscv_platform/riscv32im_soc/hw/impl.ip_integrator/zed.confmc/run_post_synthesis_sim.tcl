#------------------------------------------------------------------------------
# Post-Synthesis Simulation Script
# 합성 후 시뮬레이션 실행
#------------------------------------------------------------------------------

# 프로젝트 열기
open_project project_design_riscv_cache/project_design_riscv_cache.xpr

# 합성 결과 확인
if {[get_property PROGRESS [get_runs synth_1]] != "100%"} {
    puts "WARNING: Synthesis not completed. Running synthesis first..."
    launch_runs synth_1 -jobs 8
    wait_on_run synth_1
}

# 시뮬레이션 파일셋 설정
set_property top design_riscv_cache_wrapper [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]

# 합성 후 시뮬레이션 실행
puts "Launching post-synthesis functional simulation..."

# 시뮬레이션 실행 (GUI 모드)
launch_simulation -mode post-synthesis -type functional

puts "Post-synthesis simulation launched in GUI mode!"
puts "You can now add signals to waveform and run simulation."
