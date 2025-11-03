#------------------------------------------------------------------
SHELL    = /bin/sh
MAKEFILE = Makefile

export RISCV_CORE        = ../../../ips/riscv
export DIR_AXI_SWITCH    = ../../../ips/axi_switch
export DIR_AXI2LITE      = ../../../ips/axi4_to_lite
export DIR_AXI4_LITE_BUS = ../../../ips/axi_lite
export DIR_MEM_AXI       = ../../../ips/mem_axi
export DIR_PIC_AXI_LITE  = ../../../ips/pic_axi_lite
export DIR_TIMER_AXI_LITE= ../../../ips/timer_axi_lite
export DIR_UART_AXI_LITE = ../../../ips/uart_axi_lite
export DIR_BENCH         = ../../bench.riscv_cache_soc/verilog
export DIR_RTL           = ../../rtl/verilog

export ADDR_ENTRY ?= 0x00000000
export FILE_BIN   ?= uart_test.bin
export CHECK_BIN  ?= 1
export BAUD_RATE  ?= 115200
export VCD        ?= 1
#--------------------------------------------------------
ifeq ($(MAKECMDGOALS),$(findstring $(MAKECMDGOALS), "" "all" "elab" "sim"))
    ifeq (, $(shell which iverilog))
       $(error iverilog not found.)
    endif
endif
#--------------------------------------------------------
ILOG	 = iverilog
ISIM	 = vvp
#--------------------------------------------------------
TOP	  = top
#--------------------------------------------------------
all: compile simulate

compile elab:
	($(ILOG) -g2012 -o $(TOP).vvp -s $(TOP)\
		-c files.f\
		|| exit -1) 2>&1 | tee compile.log


simulate sim: compile
	if [ ! -f $(FILE_BIN) ]; then\
		echo "$(FILE_BIN) not found.";\
		exit -1;\
	fi
	$(ISIM) -l vvp.log $(TOP).vvp\
		+ADDR_ENTRY=$(ADDR_ENTRY)\
		+FILE_BIN=$(FILE_BIN)\
		+CHECK_BIN=$(CHECK_BIN)\
		+BAUD_RATE=$(BAUD_RATE)\
		+VCD=$(VCD)

#--------------------------------------------------------
clean:
	/bin/rm -f  $(TOP).vvp
	/bin/rm -f  compile.log
	/bin/rm -f  wave.vcd
	/bin/rm -f  vvp.log
	/bin/rm -f  result.bmp

cleanup clobber: clean

cleanupall distclean: cleanup
#--------------------------------------------------------
