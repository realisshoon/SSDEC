#-------------------------------------------------------------------------------
# Copyright (c) 2024 by Ando Ki.
# All rights are reserved by Ando Ki.
#-------------------------------------------------------------------------------
SHELL    = /bin/sh
MAKEFILE = Makefile
#-------------------------------------------------------------------------------
ifeq ($(MAKECMDGOALS),$(findstring $(MAKECMDGOALS), "hw" "sw" "sim" "run" "run_with_c" "run_with_python"))
    ifndef XILINX_VIVADO
       $(error XILINX_VIVADO environment variable not defined)
    endif
    ifndef COSIM_HOME
       export COSIM_HOME = $(abspath ../../../cosim_axi_lib)
       $(warning COSIM_HOME environment variable updated $(COSIM_HOME))
    endif
    ifneq ($(findstring "$(COSIM_HOME)/include/python",$(PYTHONPATH)),"$(COSIM_HOME)/include/python")
       ifdef PYTHONPATH
          export PYTHONPATH := $(COSIM_HOME)/include/python:$(PYTHONPATH)
       else
          export PYTHONPATH := $(COSIM_HOME)/include/python
       endif
       $(warning PYTHONPATH updated: $(PYTHONPATH))
    endif
    PLATFORM  = $(shell uname -s | tr '[:upper:]' '[:lower:]')
    MACHINE   = $(shell uname -m)
    export DIR_COSIM_INC      = $(COSIM_HOME)/include
    export DIR_COSIM_LIB      = $(COSIM_HOME)/lib
    export SIMULATOR         ?= xsim
    export DIR_COSIM_DPI_LIB  = $(COSIM_HOME)/lib/$(SIMULATOR)/$(PLATFORM)_$(MACHINE)
    export COSIM_LIB          = cosim
    ifneq ($(shell test -e $(DIR_COSIM_LIB)/libcosim.a && echo -n yes), yes)
        $(error "ERROR: cosim library not found: $(DIR_COSIM_LIB)/lib$(COSIM_LIB).a")
    endif
    ifneq ($(shell test -e $(DIR_COSIM_DPI_LIB)/$(COSIM_LIB)_dpi.so && echo -n yes), yes)
        $(error "ERROR: cosim dpi library not found: $(DIR_COSIM_DPI_LIB)/$(COSIM_LIB)_dpi.so")
    endif
endif

export DIR_C        = ../../c.cosim/src
export DIR_UART_API = ../../api/c
export DIR_BENCH    = ../../bench.cosim/verilog
export DIR_RTL      = ../../rtl/verilog

#-------------------------------------------------------------------------------
export CID=0
export PORT=0x2300
export VERBOSE=1
export RIGOR=1

#-------------------------------------------------------------------------------
all:

.PHONY: sw
sw:
	if [ ! -f $(DIR_COSIM_LIB)/lib$(COSIM_LIB).a ]; then\
		echo "Need $(DIR_COSIM_LIB)/lib$(COSIM_LIB).a";\
	else\
		gcc -o test $(DIR_C)/main.c $(DIR_C)/my_printf.c\
			$(DIR_UART_API)/uart_api.c\
                        -DTRX_BFM=1\
                        -I$(DIR_C) -I$(DIR_UART_API) -I$(DIR_COSIM_INC)\
                        -Wl,-Bstatic -L$(DIR_COSIM_LIB) -l$(COSIM_LIB) -Wl,-Bdynamic;\
	fi

.PHONY: hw
hw:
	@if [ ! -f $(DIR_COSIM_DPI_LIB)/$(COSIM_LIB)_dpi.a ]; then\
		echo "Need $(DIR_COSIM_DPI_LIB)/$(COSIM_LIB)_dpi.so";\
	else\
		xvlog -d COSIM_DPI=1 --sv -prj xsim.prj;\
		xelab -d COSIM_DPI=1\
			-sv_root $(DIR_COSIM_DPI_LIB)\
			-sv_lib $(COSIM_LIB)_dpi.so\
			-debug typical -top top -snapshot top_snapshot;\
	fi

.PHONY: sim
sim:
	@if [ ! -d xsim.dir/top_snapshot ]; then\
		echo "Need xsim.dir/top_snapshot.";\
	else\
		xsim top_snapshot -runall\
			-testplusarg "CID=$(CID)"\
			-testplusarg "PORT=$(PORT)"\
			-testplusarg "VERBOSE=$(VERBOSE)";\
	fi

DBUS = $(shell dbus-launch)
#TERM=GNOME
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
		echo "Need test.";\
	fi
else
	if [ -f test ]; then\
		gnome-terminal --title="client" --window -- bash -c\
			"make sim CID=$(CID) PORT=$(PORT) VERBOSE=$(VERBOSE); bash";\
		gnome-terminal --title="server" --window -- bash -c\
			"./test -cid $(CID) -port $(PORT) -v $(VERBOSE); bash";\
	else\
		echo "Need test.";\
	fi
endif

#------------------------------------------------------------------------
.PHONY: clean
clean:
	/bin/rm -rf $(OBJECTDIR)
	/bin/rm -f  *.log
	/bin/rm -f  *.o
	/bin/rm -f *stackdump
	/bin/rm -f *.exe.core
	/bin/rm -f compile.log
	/bin/rm -f lock_file*.txt
	/bin/rm -f  test
	/bin/rm -f  top_snapshot.wdb
	/bin/rm -f  wave.vcd
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
# 2024.08.15: Started by Ando Ki (andoki@gmail.com)
#----------------------------------------------------------------------------
