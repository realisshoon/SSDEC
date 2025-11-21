#-------------------------------------------------------------------------------
# Copyright (c) 2024 by Ando Ki.
# All rights are reserved by Ando Ki.
#-------------------------------------------------------------------------------
SHELL    = /bin/sh
MAKEFILE = Makefile
#-------------------------------------------------------------------------------
ifeq ($(MAKECMDGOALS),$(findstring $(MAKECMDGOALS), "hw" "sw" "sim" "run" "run_with_c"))
    ifndef XILINX_VIVADO
       $(error XILINX_VIVADO environment variable not defined)
    endif
    ifndef COSIM_HOME
       export COSIM_HOME = $(abspath ../../../../cosim_bfm_library)
       $(warning COSIM_HOME environment variable updated $(COSIM_HOME))
    endif
    PLATFORM  = $(shell uname -s | tr '[:upper:]' '[:lower:]')
    MACHINE   = $(shell uname -m)
    export DIR_COSIM_INC      = $(COSIM_HOME)/include
    export DIR_COSIM_LIB      = $(COSIM_HOME)/lib
    export SIMULATOR         ?= xsim
    export DIR_COSIM_DPI_LIB  = $(COSIM_HOME)/lib/$(SIMULATOR)/$(PLATFORM)_$(MACHINE)
    export COSIM_LIB          = cosim_bfm
    export COSIM_DPI_LIB      = cosim_dpi_bfm
    ifneq ($(shell test -e $(DIR_COSIM_LIB)/lib$(COSIM_LIB).a && echo -n yes), yes)
        $(error "ERROR: cosim library not found: $(DIR_COSIM_LIB)/lib$(COSIM_LIB).a")
    endif
    ifneq ($(shell test -e $(DIR_COSIM_DPI_LIB)/$(COSIM_DPI_LIB).so && echo -n yes), yes)
        $(error "ERROR: cosim dpi library not found: $(DIR_COSIM_DPI_LIB)/$(COSIM_DPI_LIB).so")
    endif
endif

export DIR_C        = ../../c.cosim/src
export DIR_BENCH    = ../../bench.cosim/verilog
export DIR_INTEGRATION = ../../bench/integration/verilog
export DIR_RTL      = ../../rtl/verilog

#-------------------------------------------------------------------------------
export CID=0
export PORT=0x2300
export VERBOSE=0
export RIGOR=0

#-------------------------------------------------------------------------------
all:

xsim.prj: 
	@if [ -z "$(COSIM_HOME)" ]; then \
		export COSIM_HOME=$(abspath ../../../../cosim_bfm_library); \
	fi
	@export DIR_COSIM_INC=$${COSIM_HOME:-$(abspath ../../../../cosim_bfm_library)}/include; \
	echo "Creating xsim.prj..."; \
	echo "sv work -d AMBA_AXI4 -d AMBA_AXI_CACHE -d AMBA_AXI_PROT -d COSIM_DPI \\" > xsim.prj; \
	echo "        -i $(DIR_BENCH) \\" >> xsim.prj; \
	echo "           $(DIR_BENCH)/top_bfm.sv \\" >> xsim.prj; \
	echo "           $(DIR_BENCH)/cosim_bfm_axi_full.sv \\" >> xsim.prj; \
	echo "           $(DIR_BENCH)/mfrc522_dummy.v \\" >> xsim.prj; \
	echo "        -i $${DIR_COSIM_INC}/verilog \\" >> xsim.prj; \
	echo "           $${DIR_COSIM_INC}/verilog/cosim_bfm_axi_dpi.sv \\" >> xsim.prj; \
	echo "        -i ../../../axi_switch/rtl/verilog \\" >> xsim.prj; \
	echo "           ../../../axi_switch/rtl/verilog/axi_switch_m3s3.v \\" >> xsim.prj; \
	echo "        -i $(DIR_RTL) \\" >> xsim.prj; \
	echo "           $(DIR_RTL)/spi_axi_if.v \\" >> xsim.prj; \
	echo "           $(DIR_RTL)/spi_master.v" >> xsim.prj

.PHONY: sw
sw:
	@if [ ! -f $(DIR_COSIM_LIB)/lib$(COSIM_LIB).a ]; then\
		echo "Need $(DIR_COSIM_LIB)/lib$(COSIM_LIB).a";\
	else\
		gcc -o test $(DIR_C)/main.c\
                        -DCOSIM_LIB=1\
                        -I$(DIR_C) -I$(DIR_COSIM_INC)\
                        -Wl,-Bstatic -L$(DIR_COSIM_LIB) -l$(COSIM_LIB) -Wl,-Bdynamic;\
	fi

.PHONY: hw
hw: xsim.prj
	@if [ ! -f $(DIR_COSIM_DPI_LIB)/$(COSIM_DPI_LIB).so ]; then\
		echo "Need $(DIR_COSIM_DPI_LIB)/$(COSIM_DPI_LIB).so";\
	else\
		xvlog -d COSIM_DPI=1 --sv -prj xsim.prj;\
		xelab -d COSIM_DPI=1\
			-sv_root $(DIR_COSIM_DPI_LIB)\
			-sv_lib $(COSIM_DPI_LIB)\
			-debug typical -top top_bfm -snapshot top_bfm_snapshot;\
	fi

GUI ?= 0

.PHONY: sim
sim:
	@if [ ! -d xsim.dir/top_bfm_snapshot ]; then \
		echo "Need xsim.dir/top_bfm_snapshot. Run 'make hw' first."; \
	else \
		if [ "$(GUI)" = "1" ]; then \
			xsim top_bfm_snapshot -gui \
				-testplusarg "CID=$(CID)" \
				-testplusarg "PORT=$(PORT)" \
				-testplusarg "VERBOSE=$(VERBOSE)"; \
		else \
			echo "run -all" > xsim_run.tcl; \
			echo "quit" >> xsim_run.tcl; \
			xsim top_bfm_snapshot -t xsim_run.tcl \
				-testplusarg "CID=$(CID)" \
				-testplusarg "PORT=$(PORT)" \
				-testplusarg "VERBOSE=$(VERBOSE)"; \
			rm -f xsim_run.tcl; \
		fi; \
	fi

.PHONY: wave
wave:
	@if [ -f wave_bfm.vcd ]; then\
		gtkwave wave_bfm.vcd;\
	elif [ -f wave_bfm_fixed.vcd ]; then\
		gtkwave wave_bfm_fixed.vcd;\
	else\
		echo "VCD file not found: wave_bfm.vcd or wave_bfm_fixed.vcd";\
		echo "Run 'make hw sim' first to generate waveform.";\
	fi

DBUS = $(shell dbus-launch)
TERM=XTERM

.PHONY: run
run:
	export $(DBUS) > /dev/null 2>&1
ifeq ("$(TERM)","XTERM")
	if [ -f test ]; then\
		xterm -T "client" -fg 'black' -bg 'white' -fa 'Monospace' -fs 10\
			-e /bin/bash -l -c\
			"make sim CID=$(CID) PORT=$(PORT) VERBOSE=$(VERBOSE); bash"&\
		xterm -T "server" -fg 'black' -bg 'white' -fa 'Monospace' -fs 10\
			-e /bin/bash -l -c\
			"./test -cid $(CID) -port $(PORT) -v $(VERBOSE); bash";\
	else\
		echo "Need test. Run 'make sw' first.";\
	fi
else
	if [ -f test ]; then\
		gnome-terminal --title="client" --window -- bash -c\
			"make sim CID=$(CID) PORT=$(PORT) VERBOSE=$(VERBOSE); bash";\
		gnome-terminal --title="server" --window -- bash -c\
			"./test -cid $(CID) -port $(PORT) -v $(VERBOSE); bash";\
	else\
		echo "Need test. Run 'make sw' first.";\
	fi
endif

#------------------------------------------------------------------------
.PHONY: clean
clean:
	@if [ -n "$(OBJECTDIR)" ]; then /bin/rm -rf $(OBJECTDIR); fi
	/bin/rm -f  *.log
	/bin/rm -f  *.o
	/bin/rm -f *stackdump
	/bin/rm -f *.exe.core
	/bin/rm -f compile.log
	/bin/rm -f lock_file*.txt
	/bin/rm -f  test
	/bin/rm -f  xsim.prj
	/bin/rm -f  top_snapshot.wdb top_bfm_snapshot.wdb
	/bin/rm -f  wave.vcd wave_bfm.vcd wave_bfm_fixed.vcd
	/bin/rm -f  xelab.pb
	/bin/rm -f  xsim_*.backup.jou
	/bin/rm -fr xsim.dir
	/bin/rm -f  xsim.jou
	/bin/rm -f  xvlog.pb
	/bin/rm -f  run.log

.PHONY: cleanup clobber
cleanup clobber: clean
	rm -f $(TARGET) $(TARGET).exe

.PHONY: cleanupall distclean
cleanupall distclean: cleanup

#----------------------------------------------------------------------------
# Revision history
#
# 2024.12.XX: Started by Ando Ki (andoki@gmail.com)
#----------------------------------------------------------------------------
