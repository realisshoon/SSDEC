#-------------------------------------------------------------------------------
SHELL	=/bin/bash

ifeq ($(MAKECMDGOALS),$(findstring $(MAKECMDGOALS), "" "all" "vivado"))
    ifndef XILINX_VIVADO
       $(error XILINX_VIVADO environment variable not defined)
    else
        export VIVADO         = $(XILINX_VIVADO)/bin/vivado
        export VIVADO_VERSION = $(shell vivado -version | sed -n 1p | cut -d" " -f 2 | cut -c 2-7)
        export VIVADO_VER     = vivado.$(VIVADO_VERSION)
    endif
    ifndef CONFMC_HOME
       $(error CONFMC_HOME environment variable not defined)
    endif
endif

#-------------------------------------------------------------------------------
export VIVADO       = vivado
export DESIGN       = gpio_axi_lite
export DESIGN_NAME  = design_$(DESIGN)
export PROJECT_NAME = project_$(DESIGN_NAME)
export PROJECT_DIR  = $(PROJECT_NAME)
export FPGA_TYPE    = z7
export PART         = xc7z020-clg484-1
export BOARD        = zedboard
#export BOARD        = zed
#export BOARD_PART   = avnet.com:$(BOARD):part0:1.4
export XDC_DIR      = xdc

export DIR_RTL           = ../../rtl/verilog
#export DIR_DESIGN        = ../../design/verilog

export TOP          = fpga
export SOURCE       = run_vivado.tcl
export GUI         ?= 1

#-------------------------------------------------------------------------------
all:
	if [ "$(GUI)" = "1" ]; then\
		$(VIVADO) -mode gui -source $(SOURCE);\
	else\
		$(VIVADO) -mode batch -source $(SOURCE);\
	fi

.PHONY: program
program:
	./program_fpga.sh design_$(DESIGN).bit

#-------------------------------------------------------------------------------
.PHONY: clean cleanup

clean:
	/bin/rm   -f  vivado.jou
	/bin/rm   -f  vivado.log
	/bin/rm   -f  vivado_*.backup.jou
	/bin/rm   -f  vivado_*.backup.log
	/bin/rm   -f  hs_err_*.log
	/bin/rm   -f  vivado_pid*.str
	/bin/rm   -f  vivado_pid*.zip
	if [ -d .Xil ]; then /bin/rm -fr .Xil; fi
	if [ -d hd_visual ]; then /bin/rm -fr hd_visual; fi

cleanup: clean
	/bin/rm -f  $(DESIGN_NAME)_wrapper.v

cleanupall: cleanup
	/bin/rm -f  $(DESIGN_NAME)_wrapper.bit
	/bin/rm -f  $(DESIGN_NAME)_wrapper.ltx
	/bin/rm -f  $(DESIGN_NAME).pdf
	/bin/rm -f  AddressMap.cvs AddressMapGui.csv
	if [ -d $(PROJECT_DIR) ]; then /bin/rm -fr $(PROJECT_DIR); fi

#-------------------------------------------------------------------------------
