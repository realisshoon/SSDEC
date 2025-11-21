SHELL=/bin/bash

GUI ?= 0

ifeq ($(MAKECMDGOALS),$(findstring $(MAKECMDGOALS), "" "all" "elab" "sim"))
    ifndef XILINX_VIVADO
       $(error XILINX_VIVADO environment variable not defined)
    else
        XELAB = $(XILINX_VIVADO)/bin/xelab
        XSIM  = $(XILINX_VIVADO)/bin/xsim
        XVLOG = $(XILINX_VIVADO)/bin/xvlog
    endif
endif

DIR_BENCH = ../../../bench/integration/verilog
DIR_RTL   = ../../../rtl/verilog
DIR_AXI_SWITCH = ../../../../axi_switch/rtl/verilog

# 테스트벤치 선택: "direct" 또는 "axi_switch"
TB ?= axi_switch

all: elab sim

xsim.prj:
	@echo "Creating xsim.prj..."
	@if [ "$(TB)" = "axi_switch" ]; then \
		echo "sv work $(DIR_BENCH)/top_axi_switch.sv -i $(DIR_BENCH)" > xsim.prj; \
		echo "sv work $(DIR_BENCH)/mfrc522_model.sv -i $(DIR_BENCH)" >> xsim.prj; \
		echo "sv work $(DIR_BENCH)/tester.sv -i $(DIR_BENCH)" >> xsim.prj; \
		echo "sv work $(DIR_RTL)/spi_axi_if.v -i $(DIR_RTL)" >> xsim.prj; \
		echo "sv work $(DIR_AXI_SWITCH)/axi_switch_m3s3.v -i $(DIR_AXI_SWITCH)" >> xsim.prj; \
	else \
		echo "sv work $(DIR_BENCH)/top.sv -i $(DIR_BENCH)" > xsim.prj; \
		echo "sv work $(DIR_BENCH)/mfrc522_model.sv -i $(DIR_BENCH)" >> xsim.prj; \
		echo "sv work $(DIR_BENCH)/tasks_spi_axi.sv -i $(DIR_BENCH)" >> xsim.prj; \
		echo "sv work $(DIR_BENCH)/tasks_axi_full.sv -i $(DIR_BENCH)" >> xsim.prj; \
		echo "sv work $(DIR_BENCH)/tester.sv -i $(DIR_BENCH)" >> xsim.prj; \
		echo "sv work $(DIR_RTL)/spi_axi_if.v -i $(DIR_RTL)" >> xsim.prj; \
	fi

elab: xsim.prj
	@if [ "$(TB)" = "axi_switch" ]; then \
		$(XELAB) -prj xsim.prj -d AMBA_AXI_CACHE -d AMBA_AXI_PROT -debug typical top_axi_switch -s top_axi_switch; \
	else \
		$(XELAB) -prj xsim.prj -debug typical top -s top; \
	fi

xsim_run.tcl:
	@echo "log_wave -recursive *" > xsim_run.tcl
	@echo "run 200us" >> xsim_run.tcl
	@if [ "$(GUI)" != "1" ]; then \
		echo "quit" >> xsim_run.tcl; \
	fi

sim: xsim_run.tcl
	@if [ "$(TB)" = "axi_switch" ]; then \
		if [ "$(GUI)" = "1" ]; then \
			$(XSIM) top_axi_switch -gui -t xsim_run.tcl; \
		else \
			$(XSIM) top_axi_switch -t xsim_run.tcl; \
		fi \
	else \
		if [ "$(GUI)" = "1" ]; then \
			$(XSIM) top -gui -t xsim_run.tcl; \
		else \
			$(XSIM) top -t xsim_run.tcl; \
		fi \
	fi

wave:
	@if [ -f wave.vcd ]; then\
		gtkwave wave.vcd;\
	fi

clean:
	/bin/rm -f  xsim.prj
	/bin/rm -f  top.wdb
	/bin/rm -f  wave.vcd
	/bin/rm -f  xsim_run.tcl
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

