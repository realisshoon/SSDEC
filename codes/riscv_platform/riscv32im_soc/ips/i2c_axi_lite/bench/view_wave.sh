#!/bin/bash
# I2C AXI-Lite 파형 뷰어 스크립트

VCD_FILE="i2c_axi_lite.vcd"
GTKWAVE_SAVE_FILE="i2c_axi_lite.gtkw"
GTKWAVE_SCRIPT="create_gtkwave_config.tcl"

# VCD 파일 존재 확인
if [ ! -f "$VCD_FILE" ]; then
    echo "ERROR: $VCD_FILE 파일이 없습니다."
    echo "먼저 'make run'을 실행하여 시뮬레이션을 실행하세요."
    exit 1
fi

# GTKWave 실행
if command -v gtkwave &> /dev/null; then
    echo "GTKWave로 파형을 엽니다..."
    echo "VCD 파일: $VCD_FILE"
    echo ""
    echo "주요 신호:"
    echo "  - Clock & Reset: aclk, aresetn"
    echo "  - AXI Signals: s_axi_*"
    echo "  - I2C Signals: scl, sda_line"
    echo "  - DUT Internal: dut.u_i2c_axi_lite_if.*, dut.u_i2c_master.*"
    echo ""
    
    # GTKWave 설정 파일이 있으면 사용, 없으면 기본 설정으로 실행
    if [ -f "$GTKWAVE_SAVE_FILE" ]; then
        echo "GTKWave 설정 파일을 사용합니다: $GTKWAVE_SAVE_FILE"
        gtkwave "$VCD_FILE" "$GTKWAVE_SAVE_FILE" &
    else
        echo "기본 설정으로 GTKWave를 실행합니다."
        echo "신호를 추가하려면:"
        echo "  1. Signals 창에서 원하는 신호를 찾아서"
        echo "  2. 우클릭 -> 'Send to Waveform' 선택"
        echo ""
        gtkwave "$VCD_FILE" &
    fi
    
    echo "GTKWave가 실행되었습니다."
    echo "파형을 보려면 신호를 추가하세요."
else
    echo "GTKWave가 설치되어 있지 않습니다."
    echo ""
    echo "설치 방법:"
    echo "  Ubuntu/Debian: sudo apt-get install gtkwave"
    echo "  또는 Vivado GUI 사용: make gui"
    echo ""
    echo "VCD 파일 위치: $(pwd)/$VCD_FILE"
    exit 1
fi
