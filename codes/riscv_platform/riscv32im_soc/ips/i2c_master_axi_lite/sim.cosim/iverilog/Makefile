#------------------------------------------------------------------
SHELL    = /bin/sh
MAKEFILE = Makefile
#--------------------------------------------------------
ifeq ($(MAKECMDGOALS),$(findstring $(MAKECMDGOALS), "" "all" "elab" "compile" "hw" "sim" "run"))
    ifeq (, $(shell which iverilog))
       $(error iverilog not found.)
    endif
    ifndef COSIM_HOME
       $(error COSIM_HOME environment variable updated)
    endif
    PLATFORM  = $(shell uname -s | tr '[:upper:]' '[:lower:]')
    MACHINE   = $(shell uname -m)
    export COSIM_LIB      = cosim_vpi_bfm.vpi
    export DIR_COSIM_INC  = $(COSIM_HOME)/include
    export DIR_COSIM_LIB  = $(COSIM_HOME)/lib
    export DIR_COSIM_ROOT = $(COSIM_HOME)/lib/iverilog/$(PLATFORM)_$(MACHINE)
    export DIR_VPI_BFM    = $(COSIM_HOME)/include/verilog
    export VPI_BFM        = $(DIR_VPI_BFM)/cosim_bfm_axi_vpi.v
endif
#--------------------------------------------------------
ILOG	 = iverilog
ISIM	 = vvp
#--------------------------------------------------------
TOP	  = top
DIR_BEH   = ../../beh/verilog
DIR_BENCH = ../../bench.cosim/verilog
DIR_RTL   = ../../rtl/verilog
#--------------------------------------------------------
all:

#-g2012
elab compile hw:
	($(ILOG) -g 2012 -o $(TOP).vvp -s $(TOP)\
		-DAMBA_AXI4=1\
		-DSIM=1 -DVCD=1\
		-I ${DIR_BENCH}\
		   ${DIR_BENCH}/top.sv\
                   ${DIR_BENCH}/axi4_to_lite.v\
		   ${DIR_BENCH}/cosim_bfm_axi_lite.sv\
		-I ${DIR_BEH}\
		   ${DIR_BEH}/i2c_slave.v\
		-I ${DIR_COSIM_INC}/verilog\
		   ${DIR_COSIM_INC}/verilog/cosim_bfm_axi_vpi.v\
		-I ${DIR_RTL}\
		   ${DIR_RTL}/i2c_master_axi_lite.v\
		|| exit -1) 2>&1 | tee compile.log

sim run:
	$(ISIM) -l vvp.log\
		-M$(DIR_COSIM_ROOT) -mcosim_vpi_bfm\
		$(TOP).vvp $(OPTIONS)

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
