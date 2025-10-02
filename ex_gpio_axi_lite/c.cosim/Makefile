#-------------------------------------------------------------------------------
# Copyright (c) 2025 by Ando Ki.
# All rights are reserved by Ando Ki.
#-------------------------------------------------------------------------------
SHELL    = /bin/sh
MAKEFILE = Makefile

RUN_MODE ?= COSIM_LIB
#RUN_MODE ?= TRX_BFM
#-------------------------------------------------------------------------------
ifeq ("$(RUN_MODE)","COSIM_LIB")
    ifeq ($(MAKECMDGOALS),$(findstring $(MAKECMDGOALS), "" "all" "sw" "hw" "cosim"))
        ifndef COSIM_HOME
           $(error COSIM_HOME environment variable updated.)
        endif
        PLATFORM  = $(shell uname -s | tr '[:upper:]' '[:lower:]')
        MACHINE   = $(shell uname -m)
        export DIR_COSIM_ROOT = $(COSIM_HOME)
        export DIR_COSIM_INC  = $(DIR_COSIM_ROOT)/include
        export LIB_COSIM      = cosim_bfm
       #export SIMULATOR ?= xsim
        export SIMULATOR ?= iverilog
        export DIR_COSIM_LIB  = $(DIR_COSIM_ROOT)/lib/$(SIMULATOR)/$(PLATFORM)_$(MACHINE)
        export DIR_SIM    = ../sim.cosim/$(SIMULATOR)
    endif
    TARGET          := test_cosim
    C_SRCS          :=
    C_DEFS          := -DCOSIM_LIB=1 -DRIGOR
    C_INCS          := -I$(DIR_COSIM_INC)
    C_LDLIBS        := -Wl,-Bstatic -L$(DIR_COSIM_LIB) -l$(LIB_COSIM) -Wl,-Bdynamic
else ifeq ("$(RUN_MODE)","TRX_BFM")
    ifneq ("$(MAKECMDGOALS)", "")
        ifeq ($(MAKECMDGOALS),$(filter $(MAKECMDGOALS), hw sim run.cosim run_cosim))
           $(error "$(MAKECMDGOALS)" not available with BFM.)
        endif
    endif
    ifndef CONFMC_HOME
       $(error "CONFMC_HOME" environment variable not defined.)
    endif
    PLATFORM        := $(shell uname -s | tr '[:upper:]' '[:lower:]')
    MACHINE         := $(shell uname -m)
    DIR_CONFMC_INC  := $(CONFMC_HOME)/hwlib/trx_axi/include
    DIR_CONFMC_LIB  := $(CONFMC_HOME)/lib/$(PLATFORM)_$(MACHINE)
    DIR_CONFMC_BFM  := $(CONFMC_HOME)/hwlib/trx_axi/api/c
    LIB_CONFMC      := conapi
    TARGET          := test_bfm
    C_SRCS          := trx_axi_api.c
    C_DEFS          := -DTRX_BFM=1 -DRIGOR
    C_INCS          := -I$(DIR_CONFMC_INC) `pkg-config --cflags libusb-1.0`
    C_LDLIBS        := -Wl,-Bstatic -L$(DIR_CONFMC_LIB) -l$(LIB_CONFMC) -Wl,-Bdynamic\
                       `pkg-config --libs libusb-1.0`
endif
#-------------------------------------------------------------------------------
OBJECTDIR = obj
DUMMY    := $(shell [ -d $(OBJECTDIR) ] || mkdir $(OBJECTDIR) )
#-------------------------------------------------------------------------------
DIR_SRC          := ./src
DIR_GPIO         := ../api/c
#-------------------------------------------------------------------------------
SRCS   = main.c test.c gpio_api.c $(C_SRCS)

OBJS   = $(SRCS:.c=.o)
DEPS   = $(SRCS:.c=.d)
#-------------------------------------------------------------------------------
vpath %.h $(DIR_SRC) $(DIR_GPIO)
vpath %.c $(DIR_SRC) $(DIR_GPIO)

ifeq ("$(RUN_MODE)","COSIM_LIB")
vpath %.h $(DIR_COSIM_INC)
else ifeq ("$(RUN_MODE)","TRX_BFM")
vpath %.h $(DIR_CONFMC_INC)
vpath %.c $(DIR_CONFMC_BFM)
endif
#-------------------------------------------------------------------------------
CC             = gcc
#-------------------------------------------------------------------------------

CFLAGS   := $(C_DEFS)\
             -MMD -g -O0 -Werror\
             -I$(DIR_SRC)\
             -I$(DIR_GPIO)\
             $(C_INCS)
LDFLAGS  = -O0
LDLIBS   = $(C_LDLIBS)

#------------------------------------------------------------------------
$(OBJECTDIR)/%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@ 2>&1 | tee -a compile.log
#------------------------------------------------------------------------
.PHONY: all
all:

.PHONY: sw
sw: pre $(TARGET)

$(TARGET): $(addprefix $(OBJECTDIR)/,$(OBJS))
	$(CC) -o $(TARGET) $(LDFLAGS) $(addprefix $(OBJECTDIR)/,$(OBJS))\
		$(LDLIBS)

.PHONY: pre
pre:
	if [ -f compile.log ]; then /bin/rm -f compile.log; fi
	if [ -f run.log ]; then /bin/rm -f run.log; fi

export AXI_WIDTH_DATA   ?= 64
export AXIS_WIDTH_DATA  ?= 64
.PHONY: hw
hw:
	make -C $(DIR_SIM) \
		AXI_WIDTH_DATA=$(AXI_WIDTH_DATA) \
		AXIS_WIDTH_DATA=$(AXIS_WIDTH_DATA) \
		compile

DBUS = $(shell dbus-launch)
#TERM=GNOME
TERM=XTERM

.PHONY: run
run:
ifeq ("$(RUN_MODE)","TRX_BFM")
	@if [ ! -f $(TARGET) ]; then\
		echo "Need $(TARGET)."; exit 1;\
	else\
		./$(TARGET);\
	fi
else
	@echo "Must be RUN_MODE=TRX_BFM"
endif

.PHONY: cosim
cosim:
        ifeq ("$(SIMULATOR)","xsim")
		@if [ ! -x "`which xelab 2>/dev/null`" ]; then\
			echo "xelab not found."; exit 1;\
		fi
        else
		@if [ ! -x "`which iverilog 2>/dev/null`" ]; then\
			echo "iverilog not found."; exit 1;\
		fi
        endif
	@if [ ! -f $(TARGET) ]; then\
		echo "Need $(TARGET)."; exit 1;\
	fi
	export $(DBUS) > /dev/null 2>&1
        ifeq ("$(TERM)","XTERM")
		xterm -T "client" -fg 'black' -bg 'white' -fa 'Monospace' -fs 10\
			-e /bin/bash -l -c\
			"cd $(DIR_SIM); make sim; bash"&
		./$(TARGET) -v 1 -r 1 2>&1 | tee -a run.log
        else
		gnome-terminal --title="client" --window -- bash -c\
			"cd $(DIR_SIM); make sim; bash"
		./$(TARGET) 2>&1 | tee -a run.log
        endif

#-------------------------------------------------------------------------------
BIT_FILE = ../impl.ip_integrator/design_bfm_adc_dac_wrapper.bit
.PHONY: program
program:
	@if [ ! -f $(BIT_FILE) ]; then\
		echo "Need $(BIT_FILE)."; exit 1;\
	else\
		./program_fpga.sh ${BIT_FILE};\
	fi

#-------------------------------------------------------------------------------
-include $(addprefix $(DIR_OBJ)/,$(C_DEPS))

#------------------------------------------------------------------------
doc:
	doxygen Doxyfile
	@if [ -f doxygen_out/latex/Makefile ]; then\
		make -C doxygen_out/latex;\
	fi
	@if [ -f doxygen_out/latex/refman.pdf ]; then\
		cp doxygen_out/latex/refman.pdf refman.pdf;\
	fi

#------------------------------------------------------------------------
.PHONY: clean
clean:
	rm -rf $(OBJECTDIR)
	rm -f  *.log
	rm -f  *.o
	rm -f *stackdump
	rm -f *.exe.core
	rm -f compile.log
	rm -f lock_file*.txt
	rm -fr doxygen_out html latex refman.pdf

.PHONY: cleanup clobber
cleanup clobber: clean
	rm -f  $(TARGET) $(TARGET).exe

.PHONY: cleanupall distclean
cleanupall distclean: cleanup

#----------------------------------------------------------------------------
# Revision history
#
# 2025.04.18: Started by Ando Ki (andoki@gmail.com)
#----------------------------------------------------------------------------
