#-------------------------------------------------------------------------------
# Copyright (c) 2025 by Ando Ki.
# All rights are reserved by Ando Ki.
#-------------------------------------------------------------------------------
SHELL    = /bin/sh
MAKEFILE = Makefile

RUN_TYPE=TRX_AXI

#-------------------------------------------------------------------------------
ifeq ($(MAKECMDGOALS),$(findstring $(MAKECMDGOALS), sw hw run run_all run.all cosim run_dpi dpi_run))
    ifeq ($(RUN_TYPE),COSIM_BFM)
        ifndef XILINX_VIVADO
           $(error "XILINX_VIVADO" environment variable not defined.)
        endif
        ifndef COSIM_HOME
           $(error "COSIM_HOME" environment variable not defined.)
        endif
        PLATFORM  := $(shell uname -s | tr '[:upper:]' '[:lower:]')
        MACHINE   := $(shell uname -m)
        export DIR_COSIM_INC  := $(COSIM_HOME)/include
        export SIMULATOR      ?= xsim
        export DIR_COSIM_LIB  := $(COSIM_HOME)/lib/$(SIMULATOR)/$(PLATFORM)_$(MACHINE)
        ifeq ("$(wildcard $(DIR_COSIM_INC))", "")
             $(error $(DIR_COSIM_INC) not found.)
        endif
        ifeq ("$(wildcard $(DIR_COSIM_LIB))", "")
             $(error $(DIR_COSIM_LIB) not found.)
        endif
    else ifeq ($(RUN_TYPE),TRX_AXI)
        ifndef CONFMC_HOME
           $(error "CONFMC_HOME" environment variable not defined.)
        endif
        PLATFORM  := $(shell uname -s | tr '[:upper:]' '[:lower:]')
        MACHINE   := $(shell uname -m)
        export DIR_CONFMC_INC  := $(CONFMC_HOME)/include
        export DIR_CONFMC_LIB  := $(CONFMC_HOME)/lib/$(PLATFORM)_$(MACHINE)
        export DIR_CONFMC_BFM  := $(CONFMC_HOME)/hwlib/trx_axi/api/c
    endif
endif
export DIR_HW := ../../hw

#-------------------------------------------------------------------------------
TARGET  := elf_download

#-------------------------------------------------------------------------------
all:

sw:
    ifeq ($(RUN_TYPE),COSIM_BFM)
	gcc -o $(TARGET) -g -DCOSIM_BFM=1\
		src/main.c\
		-Isrc -I$(DIR_COSIM_INC)\
		-Wl,-Bstatic -L$(DIR_COSIM_LIB) -lcosim_bfm\
		-Wl,-Bdynamic -lelf
    else
	gcc -o $(TARGET) -g -DTRX_AXI\
		src/main.c\
		$(DIR_CONFMC_BFM)/trx_axi_api.c\
		-Isrc -I$(DIR_CONFMC_INC) -I$(DIR_CONFMC_BFM)\
		`pkg-config --cflags libusb-1.0`\
		-Wl,-Bstatic -L$(DIR_CONFMC_LIB) -lconapi\
		-Wl,-Bdynamic `pkg-config --libs libusb-1.0` -lelf
    endif

#ELF ?= ../../sw.riscv/sieve/sieve_test.elf
#ELF ?= ../../sw.riscv/qsort/qsort_test.elf
#ELF ?= ../../sw.riscv/fft/fft_test.elf
#ELF ?= ../../sw.riscv/aes/aes_test.elf
#ELF ?= ../../sw.riscv/mmul/mmul_test.elf
ELF ?= ../../sw.riscv/hello_world/gpio_test.elf
#ELF ?= ../../sw.riscv.mon/mon/monitor.elf
#ELF ?= ../../sw.riscv/timer_interrupt/timer_test.elf
#ELF ?= /home/adki/work/projects/RISC-V/riscv_hw/UltraEmbedded/riscv32im_soc_rom/sw.riscv.monitor/monitor/v1.2/bld/rv32db/monitor.elf

run download:
	./$(TARGET) -g 1 -D -A $(ELF) -B u.bin

#------------------------------------------------------------------------
hw:
	make -C $(DIR_HW)/sim.fpga_zed/$(SIMULATOR) COSIM_BFM=1 elab

cosim run_dpi dpi_run:
	@if [ ! -z "`(ipcs -q | grep "^0x" | cut -d' ' -f 2) 2>/dev/null`" ]; then\
		echo "IPC message queue is still working. Use \"$$ ipcs -q\" and \"$$ ipcrm -q mid.\"";\
	fi
	@if [ -z "`which xelab 2>/dev/null`" ]; then\
		echo "xelab not found."; exit 1;\
	fi
	if [ ! -f $(TARGET) ]; then make; fi
	gnome-terminal --window -- bash -c "cd $(DIR_HW)/sim.fpga_zed/$(SIMULATOR);\
			make COSIM_BFM=1 sim; bash"
	make COSIM_BFM=1 run 2>&1 | tee run.log | sed '/ERROR/q'

#------------------------------------------------------------------------
#BIT=../../hw/impl.ip_integrator/zed.confmc/project_1/project_1.runs/impl_1/fpga.bit
BIT=../../hw/impl.ip_integrator/zed.confmc/design_riscv_cache_wrapper.bit
program:
	bash ./program_fpga.sh $(BIT)

clean:
	/bin/rm -f $(TARGET)
	/bin/rm -f u.bin  x  y

cleanup clobber: clean

cleanupall distclean: cleanup
