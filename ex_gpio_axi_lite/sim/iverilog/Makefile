#------------------------------------------------------------------
SHELL		= /bin/sh
MAKEFILE	= Makefile
#--------------------------------------------------------
ILOG	= iverilog
ISIM	= vvp

#--------------------------------------------------------
TOP	  = top
export DIR_BENCH = ../../bench/verilog
export DIR_RTL   = ../../rtl/verilog
export OPTIONS  ?= +TEST_CSR=1

#--------------------------------------------------------
all: elab sim

.PHONY: elab compile
elab compile:
	($(ILOG) -g 2012 -o $(TOP).vvp\
		-s $(TOP)\
		-I$(DIR_BENCH)\
		-I$(DIR_RTL)\
		$(DIR_BENCH)/top.sv\
		$(DIR_BENCH)/tester.sv\
		$(DIR_RTL)/gpio_axi_lite.v\
		|| exit -1) 2>&1 | tee compile.log

.PHONY: sim simulate
sim simulate:
	$(ISIM) -l vvp.log $(TOP).vvp ${OPTIONS} 2>&1 | tee -a run.log

#--------------------------------------------------------
clean:
	/bin/rm -f  $(TOP).vvp
	/bin/rm -f  compile.log
	/bin/rm -f  wave.vcd
	/bin/rm -f  vvp.log
	/bin/rm -f  run.log

cleanup clobber: clean

cleanupall distclean: cleanup
#--------------------------------------------------------
