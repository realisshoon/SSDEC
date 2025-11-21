log_wave -recursive /*
open_vcd wave.vcd
log_vcd [get_objects -r /*]
# Co-simulation: run until C program finishes
# C 프로그램이 bfm_close()를 호출하면 cosim_bfm_axi_core.v에서 $finish(2)가 호출되어
# 시뮬레이션이 자동으로 종료됩니다.
# run -all을 사용하면 C 프로그램이 완료될 때까지 기다립니다.
run -all
# 만약 C 프로그램이 정상 종료하지 않으면 시뮬레이션이 무한 대기할 수 있으므로,
# 필요시 Ctrl+C로 중단하거나 타임아웃을 설정할 수 있습니다 (예: run 10ms)
close_vcd
quit


