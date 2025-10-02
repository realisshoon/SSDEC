#-------------------------------------------------------------------------------
SHELL           = /bin/sh
MAKEFILE        = Makefile
#-------------------------------------------------------------------------------
ifeq ($(MAKECMDGOALS),$(findstring $(MAKECMDGOALS), "" "all" "elab" "compile" "hw" "sim" "run"))
    ifndef XILINX_VIVADO
       $(error XILINX_VIVADO environment variable not defined)
    endif
    export VIVADO         = $(XILINX_VIVADO)/bin/vivado
    export VIVADO_VERSION = $(shell vivado -version | sed -n 1p | cut -d" " -f 2 | cut -c 2-7)
    export VIVADO_VER     = vivado.$(VIVADO_VERSION)
    ifndef COSIM_HOME
       $(error COSIM_HOME environment variable updated.)
    endif
    PLATFORM  = $(shell uname -s | tr '[:upper:]' '[:lower:]')
    MACHINE   = $(shell uname -m)
    export COSIM_LIB      = cosim_dpi_bfm.so
    export DIR_COSIM_INC  = $(COSIM_HOME)/include
    export DIR_COSIM_LIB  = $(COSIM_HOME)/lib
    export DIR_COSIM_ROOT = $(COSIM_HOME)/lib/xsim/$(PLATFORM)_$(MACHINE)
    export DIR_DPI_BFM    = $(COSIM_HOME)/include/verilog
    export DPI_BFM        = $(DIR_DPI_BFM)/cosim_bfm_axi_dpi.sv
endif

#-------------------------------------------------------------------------------
export DIR_BENCH    = ../../bench.cosim/verilog
export DIR_RTL      = ../../rtl/verilog

export GUI        ?= 0
#-------------------------------------------------------------------------------
all:

elab compile hw:
	xelab -prj xsim.prj\
		-debug typical\
		-sv_root $(DIR_COSIM_ROOT) -sv_lib $(COSIM_LIB)\
		top -s top_snapshot

sim run:
	@if [ "$(GUI)" = "0" ]; then\
		xsim top_snapshot -t xsim_run.tcl $(OPTIONS);\
	else\
		xsim top_snapshot -gui -t xsim_run.tcl $(OPTIONS);\
	fi

clean:
	/bin/rm -f  top_snapshot.wdb
	/bin/rm -f  wave.vcd
	/bin/rm -f  webtalk_*.backup.jou
	/bin/rm -f  webtalk_*.backup.log
	/bin/rm -f  webtalk.jou
	/bin/rm -f  webtalk.log
	/bin/rm -f  xelab.log
	/bin/rm -f  xelab.pb
	/bin/rm -fr .Xil/
	/bin/rm -f  xsim_*.backup.jou
	/bin/rm -f  xsim_*.backup.log
	/bin/rm -fr xsim.dir/
	/bin/rm -f  xsim.jou
	/bin/rm -f  xsim.log
	/bin/rm -f  xvlog.log
	/bin/rm -f  xvlog.pb

cleanup clobber: clean

cleanupall distclean: cleanup
