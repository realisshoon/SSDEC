# Simple simulation helper for i2c_axi_lite

# Toolchain commands (override if needed)
XVLOG   ?= xvlog
XELAB   ?= xelab
XSIM    ?= xsim
VIVADO  ?= vivado

# Snapshot name used by xelab/xsim
SNAPSHOT := top_snapshot

# Directory helpers
ROOT_DIR  := $(abspath ..)
RTL_DIR   := $(ROOT_DIR)/rtl/verilog
BENCH_DIR := $(abspath verilog)

# Source files
SRCS := \
	$(RTL_DIR)/i2c_axi_lite_if.v \
	$(RTL_DIR)/i2c_axi_lite.v \
	$(RTL_DIR)/i2c_master_ver2.v \
	$(BENCH_DIR)/tester.v \
	$(BENCH_DIR)/top.v

# Default target prints help
.DEFAULT_GOAL := help

help:
	@echo "Available targets:"
	@echo "  build   - Compile sources and elaborate snapshot"
	@echo "  run     - Run batch simulation (runs until '\$finish')"
	@echo "  gui     - Launch interactive simulation GUI"
	@echo "  wave    - View VCD waveform with GTKWave"
	@echo "  clean   - Remove generated simulator files"

build:
	$(XVLOG) -sv $(SRCS)
	$(XELAB) top -s $(SNAPSHOT) -debug typical

run: build
	$(XSIM) $(SNAPSHOT) --runall

# Launch Vivado simulator GUI (waveform) after building snapshot
# Use ctrl+c to exit when finished

.gui_env: build
	$(XSIM) $(SNAPSHOT) --gui &

gui: .gui_env

# View waveform with GTKWave
wave:
	@if [ -f i2c_axi_lite.vcd ]; then \
		if command -v gtkwave &> /dev/null; then \
			gtkwave i2c_axi_lite.vcd & \
		else \
			echo "ERROR: GTKWave가 설치되어 있지 않습니다."; \
			echo "설치: sudo apt-get install gtkwave"; \
			echo "또는 Vivado GUI 사용: make gui"; \
		fi \
	else \
		echo "ERROR: i2c_axi_lite.vcd 파일이 없습니다."; \
		echo "먼저 'make run'을 실행하세요."; \
	fi

clean:
	$(RM) -r xsim.dir *.pb *.jou *.log *.wdb *.vcd $(SNAPSHOT).mdl $(SNAPSHOT).wdb

.PHONY: help build run gui wave clean
