#-------------------------------------------------------------------------------
# I2C AXI-Lite HW/SW co-simulation (C side)
#   - COSIM_LIB : cosim_bfm_library (xsim / iverilog)
#   - TRX_BFM   : CON-FMC / trx_axi_api (for emulation)
#-------------------------------------------------------------------------------
SHELL    = /bin/sh
MAKEFILE = Makefile

RUN_MODE ?= COSIM_LIB
#RUN_MODE ?= TRX_BFM
#-------------------------------------------------------------------------------
ifeq ("$(RUN_MODE)","COSIM_LIB")
    ifeq ($(MAKECMDGOALS),$(findstring $(MAKECMDGOALS), "" "all" "sw" "hw" "cosim"))
        COSIM_HOME ?= /home/sogang/pjt/team2/codes/cosim_bfm_library
        PLATFORM  = $(shell uname -s | tr '[:upper:]' '[:lower:]')
        MACHINE   = $(shell uname -m)
        export DIR_COSIM_ROOT = $(COSIM_HOME)
        export DIR_COSIM_INC  = $(DIR_COSIM_ROOT)/include
        export LIB_COSIM      = cosim_bfm
        export SIMULATOR ?= xsim
        #export SIMULATOR ?= iverilog
        export DIR_COSIM_LIB  = $(DIR_COSIM_ROOT)/lib/$(SIMULATOR)/$(PLATFORM)_$(MACHINE)
        export DIR_SIM    = ../sim.cosim/$(SIMULATOR)
    endif
    TARGET          := test_cosim_i2c
    C_SRCS          :=
    C_DEFS          := -DCOSIM_LIB=1 -DRIGOR -DI2C_API_USE_STDIO
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
    TARGET          := test_bfm_i2c
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
DIR_I2C          := ../api/c
#-------------------------------------------------------------------------------
SRCS   = main.c test.c i2c_api.c $(C_SRCS)

OBJS   = $(SRCS:.c=.o)
DEPS   = $(SRCS:.c=.d)
#-------------------------------------------------------------------------------
vpath %.h $(DIR_SRC) $(DIR_I2C)
vpath %.c $(DIR_SRC) $(DIR_I2C)

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
             -I$(DIR_I2C)\
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
//TERM=GNOME
TERM=XTERM

.PHONY: run
run:
ifeq ("$(RUN_MODE)","TRX_BFM")
	./$(TARGET) -cid 0 -v 0 -r 0 2>&1 | tee -a run.log
else
	@echo "Use 'make cosim' for HW/SW co-simulation (COSIM_LIB)."
endif

.PHONY: run_cosim run.cosim cosim
run_cosim run.cosim cosim:
ifeq ("$(RUN_MODE)","COSIM_LIB")
	( cd $(DIR_SIM); \
	  if [ "$(SIMULATOR)" = "xsim" ]; then \
	    make -s sim OPTIONS="$(OPTIONS)"; \
	  else \
	    make -s run OPTIONS="$(OPTIONS)"; \
	  fi ) &
	( sleep 1; ./$(TARGET) -cid 0 -v 0 -r 0 2>&1 | tee -a run.log )
else
	@echo "COSIM_LIB mode required for HW/SW cosim."
endif

.PHONY: clean
clean:
	if [ -d $(OBJECTDIR) ]; then /bin/rm -fr $(OBJECTDIR); fi
	/bin/rm -f $(TARGET)
	/bin/rm -f compile.log
	/bin/rm -f run.log

.PHONY: cleanup clobber
cleanup clobber: clean

.PHONY: cleanupall distclean
cleanupall distclean: cleanup


