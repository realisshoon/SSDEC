# GTKWave 설정 파일 생성 스크립트
# 이 스크립트는 GTKWave에서 주요 신호들을 자동으로 추가합니다.

# 색상 설정
set color0 {#000000}
set color1 {#0000FF}
set color2 {#00FF00}
set color3 {#FF0000}
set color4 {#FFFF00}
set color5 {#FF00FF}
set color6 {#00FFFF}
set color7 {#FFFFFF}

# 신호 추가 함수
proc add_signals {group_name signals} {
    set signal_list [split $signals "\n"]
    foreach signal $signal_list {
        if {[string trim $signal] != ""} {
            set full_path "top.$signal"
            if {[lsearch [gtkwave::getSignals] $full_path] == -1} {
                # 신호가 없으면 추가
                append full_path
            }
            gtkwave::addSignalsFromList "$full_path"
        }
    }
}

# Clock & Reset
gtkwave::addSignalsFromList "top.aclk"
gtkwave::addSignalsFromList "top.aresetn"

# AXI Write Channels
gtkwave::addSignalsFromList "top.s_axi_awaddr"
gtkwave::addSignalsFromList "top.s_axi_awvalid"
gtkwave::addSignalsFromList "top.s_axi_awready"
gtkwave::addSignalsFromList "top.s_axi_wdata"
gtkwave::addSignalsFromList "top.s_axi_wvalid"
gtkwave::addSignalsFromList "top.s_axi_wready"
gtkwave::addSignalsFromList "top.s_axi_bresp"
gtkwave::addSignalsFromList "top.s_axi_bvalid"
gtkwave::addSignalsFromList "top.s_axi_bready"

# AXI Read Channels
gtkwave::addSignalsFromList "top.s_axi_araddr"
gtkwave::addSignalsFromList "top.s_axi_arvalid"
gtkwave::addSignalsFromList "top.s_axi_arready"
gtkwave::addSignalsFromList "top.s_axi_rdata"
gtkwave::addSignalsFromList "top.s_axi_rvalid"
gtkwave::addSignalsFromList "top.s_axi_rready"

# I2C Signals
gtkwave::addSignalsFromList "top.scl"
gtkwave::addSignalsFromList "top.sda_line"
gtkwave::addSignalsFromList "top.dut_sda_o"
gtkwave::addSignalsFromList "top.dut_sda_t"

# DUT 내부 신호 (I2C AXI Lite Interface)
gtkwave::addSignalsFromList "top.dut.u_i2c_axi_lite_if.control_reg"
gtkwave::addSignalsFromList "top.dut.u_i2c_axi_lite_if.dev_addr_reg"
gtkwave::addSignalsFromList "top.dut.u_i2c_axi_lite_if.mem_addr_reg"
gtkwave::addSignalsFromList "top.dut.u_i2c_axi_lite_if.wr_data_reg"
gtkwave::addSignalsFromList "top.dut.u_i2c_axi_lite_if.rd_data_reg"
gtkwave::addSignalsFromList "top.dut.u_i2c_axi_lite_if.i2c_start"
gtkwave::addSignalsFromList "top.dut.u_i2c_axi_lite_if.i2c_busy"
gtkwave::addSignalsFromList "top.dut.u_i2c_axi_lite_if.write_state"
gtkwave::addSignalsFromList "top.dut.u_i2c_axi_lite_if.read_state"

# DUT 내부 신호 (I2C Master)
gtkwave::addSignalsFromList "top.dut.u_i2c_master.state"
gtkwave::addSignalsFromList "top.dut.u_i2c_master.mem[0]"
gtkwave::addSignalsFromList "top.dut.u_i2c_master.mem[1]"
gtkwave::addSignalsFromList "top.dut.u_i2c_master.mem[2]"
gtkwave::addSignalsFromList "top.dut.u_i2c_master.sda_out"
gtkwave::addSignalsFromList "top.dut.u_i2c_master.counter_data"
gtkwave::addSignalsFromList "top.dut.u_i2c_master.counter_page"

# EEPROM 모델
gtkwave::addSignalsFromList "top.eeprom.state"
gtkwave::addSignalsFromList "top.eeprom.mem_addr"
gtkwave::addSignalsFromList "top.eeprom.bit_cnt"

# 시간 범위 설정 (전체 시뮬레이션)
gtkwave::setZoomRange 0 265035000

# 색상 설정
gtkwave::highlightSignalsFromList "top.aclk" $color1
gtkwave::highlightSignalsFromList "top.aresetn" $color2
gtkwave::highlightSignalsFromList "top.scl" $color3
gtkwave::highlightSignalsFromList "top.sda_line" $color4

puts "GTKWave 설정 완료!"

