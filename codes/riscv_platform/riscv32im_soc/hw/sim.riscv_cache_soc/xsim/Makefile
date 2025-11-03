SHELL=/bin/bash

export RISCV_CORE        = ../../../ips/riscv
export DIR_AXI_SWITCH    = ../../../ips/axi_switch
export DIR_AXI2LITE      = ../../../ips/axi4_to_lite
export DIR_AXI4_LITE_BUS = ../../../ips/axi_lite
export DIR_MEM_AXI       = ../../../ips/mem_axi
export DIR_PIC_AXI_LITE  = ../../../ips/pic_axi_lite
export DIR_TIMER_AXI_LITE= ../../../ips/timer_axi_lite
export DIR_UART_AXI_LITE = ../../../ips/uart_axi_lite
export DIR_GPIO_AXI_LITE = ../../../ips/gpio_axi_lite
export DIR_I2C_AXI_LITE  = ../../../ips/i2c_axi_lite
export DIR_BENCH         = ../../bench.riscv_cache_soc/verilog
export DIR_RTL           = ../../rtl/verilog

export GUI ?= 0

export ADDR_ENTRY ?= 0x00000000
#export FILE_BIN   ?= ../../../sw.riscv/hello_world/uart_test.bin
#export FILE_BIN   ?= ../../../sw.riscv/timer_interrupt/timer_test.bin
#export FILE_BIN   ?= ../../../sw.riscv.mon/mon/monitor.bin
export FILE_BIN   ?= gpio_test.bin
export CHECK_BIN  ?= 1
export BAUD_RATE  ?= 115200
export VCD        ?= 1

ifeq ($(MAKECMDGOALS),$(findstring $(MAKECMDGOALS), "" "all" "elab" "sim"))
    ifndef XILINX_VIVADO
       $(error XILINX_VIVADO environment variable not defined)
    else
        XELAB = $(XILINX_VIVADO)/bin/xelab
        XSIM  = $(XILINX_VIVADO)/bin/xsim
    endif
endif

all: elab sim

elab:
	@$(XELAB) -prj xsim.prj -debug typical top -s top

sim:
	if [ ! -f $(FILE_BIN) ]; then\
		echo "$(FILE_BIN) not found.";\
		exit -1;\
	fi
	@if [ "$(GUI)" = "1" ]; then\
		$(XSIM) top -gui;\
	else\
		$(XSIM) top -t xsim_run.tcl\
			-testplusarg "ADDR_ENTRY=$(ADDR_ENTRY)"\
			-testplusarg "FILE_BIN=$(FILE_BIN)"\
			-testplusarg "CHECK_BIN=$(CHECK_BIN)"\
			-testplusarg "BAUD_RATE=$(BAUD_RATE)"\
			-testplusarg "VCD=$(VCD)";\
	fi

wave:
	@if [ -f wave.vcd ]; then\
		gtkwave wave.vcd;\
	fi

clean:
	/bin/rm -f  top.wdb
	/bin/rm -f  wave.vcd
	/bin/rm -f  webtalk_*.backup.jou
	/bin/rm -f  webtalk_*.backup.log
	/bin/rm -f  webtalk.jou
	/bin/rm -f  webtalk.log
	/bin/rm -f  xelab.log
	/bin/rm -f  xelab.pb
	/bin/rm -fr .Xil
	/bin/rm -f  xsim_*.backup.jou
	/bin/rm -f  xsim_*.backup.log
	/bin/rm -fr xsim.dir
	/bin/rm -f  xsim.jou
	/bin/rm -f  xsim.log
	/bin/rm -f  xvlog.log
	/bin/rm -f  xvlog.pb

cleanup clobber: clean

cleanupall: cleanup

.PHONY: all elab sim wave clean clobber cleanup cleanupall
