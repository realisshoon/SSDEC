#-------------------------------------------------------------------------------
# Copyright (c) 2024 by Ando Ki.
# All rights are reserved by Ando Ki.
#-------------------------------------------------------------------------------
SHELL    = /bin/sh
MAKEFILE = Makefile
#-------------------------------------------------------------------------------
ifeq ($(MAKECMDGOALS),$(findstring $(MAKECMDGOALS), "hw" "sw" "sim" "run" "run_with_c" "run_with_python"))
    ifndef COSIM_HOME
       export COSIM_HOME = $(abspath ../../..)
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
    export DIR_COSIM_HW_LIB   = $(COSIM_HOME)/lib/$(SIMULATOR)/$(PLATFORM)_$(MACHINE)
    export COSIM_LIB          = cosim
    ifneq ($(shell test -e $(DIR_COSIM_LIB)/libcosim.a && echo -n yes), yes)
        $(error "ERROR: cosim library not found: $(DIR_COSIM_LIB)/lib$(COSIM_LIB).a")
    endif
    ifeq ($(SIMULATOR), "xsim")
        ifndef XILINX_VIVADO
           $(error XILINX_VIVADO environment variable not defined)
        endif
        ifneq ($(shell test -e $(DIR_COSIM_HW_LIB)/$(COSIM_LIB)_dpi.so && echo -n yes), yes)
            $(error "ERROR: cosim dpi library not found: $(DIR_COSIM_HW_LIB)/$(COSIM_LIB)_dpi.so")
        endif
    else ifeq ($(SIMULATOR), "iverilog")
        ifeq (, $(shell which iverilog))
           $(error iverilog not found.)
        endif
        ifneq ($(shell test -e $(DIR_COSIM_HW_LIB)/$(COSIM_LIB)_vpi.vpi && echo -n yes), yes)
            $(error "ERROR: cosim dpi library not found: $(DIR_COSIM_HW_LIB)/$(COSIM_LIB)_vpi.vpi")
        endif
    endif
endif

DIR_C        = src
DIR_UART_API = ../api/c
DIR_SIM      = ../sim.cosim/$(SIMULATOR)

#-------------------------------------------------------------------------------
export CID     ?=0
export PORT    ?=0x2300
export VERBOSE ?=1
export RIGOR   ?=1

#-------------------------------------------------------------------------------
all:

.PHONY: sw
sw:
	@echo "Nothing to do with it."

.PHONY: hw
hw:
	make -C $(DIR_SIM) hw

.PHONY: sim
sim:
	make -C $(DIR_SIM) sim $CID=$(CID) PORT=$(PORT) VERBOSE=$(VERBOSE)

DBUS = $(shell dbus-launch)
#TERM=GNOME
TERM=XTERM

.PHONY: run
run:
	export $(dbus-launch) > /dev/null 2>&1
ifeq ("$(TERM)","XTERM")
	xterm -T "client" -fg 'black' -bg 'white' -fa 'Monospace' -fs 10\
		-e /bin/bash -l -c\
		"export PYTHONPATH=$(PYTHONPATH);\
		python3 uart_test.py --verbose=$(VERBOSE); bash"&
	sleep 2
	xterm -T "client" -fg 'black' -bg 'white' -fa 'Monospace' -fs 10\
		-e /bin/bash -l -c\
		"make sim CID=$(CID) PORT=$(PORT) VERBOSE=$(VERBOSE); bash"&
else
	gnome-terminal --title="server" --window -- bash -c\
		"export PYTHONPATH=$(PYTHONPATH);\
		python3 uart_test.py --verbose=$(VERBOSE); bash"
	sleep 2
	gnome-terminal --title="client" --window -- bash -c\
		"make sim CID=$(CID) PORT=$(PORT) VERBOSE=$(VERBOSE); bash"
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
