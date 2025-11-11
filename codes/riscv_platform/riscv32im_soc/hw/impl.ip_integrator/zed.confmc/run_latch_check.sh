#!/bin/bash
#-------------------------------------------------------------------------------
# I2C Latch Check Script Runner
#-------------------------------------------------------------------------------

echo "=========================================="
echo "I2C Master Ver2 Latch Check"
echo "=========================================="

# Vivado 환경 확인
if [ -z "$XILINX_VIVADO" ]; then
    echo "ERROR: XILINX_VIVADO environment variable not set"
    echo "Please source Vivado settings:"
    echo "  source /tools/Xilinx/Vivado/2021.2/settings64.sh"
    exit 1
fi

echo "Using Vivado: $XILINX_VIVADO"
echo ""

# 이전 결과 정리
if [ -d "i2c_latch_check" ]; then
    echo "Cleaning previous results..."
    rm -rf i2c_latch_check
fi

# Vivado 실행
echo "Running Vivado synthesis..."
echo ""
vivado -mode batch -source check_i2c_latch.tcl -log latch_check.log -journal latch_check.jou

# 결과 확인
echo ""
echo "=========================================="
echo "Check Complete"
echo "=========================================="
echo "Log file: latch_check.log"
echo "Journal: latch_check.jou"
echo ""

# 래치 결과 출력
if [ -f "i2c_latch_check/latch_details.rpt" ]; then
    echo "!!! LATCHES DETECTED !!!"
    echo "See details in: i2c_latch_check/latch_details.rpt"
    echo ""
    cat i2c_latch_check/latch_details.rpt
else
    echo "No latches detected!"
fi

echo ""
echo "=========================================="

