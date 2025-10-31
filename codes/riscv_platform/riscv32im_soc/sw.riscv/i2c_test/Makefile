#-------------------------------------------------------------------------------
# I2C EEPROM Test Makefile
# Copyright (c) 2025 by Team 2
#-------------------------------------------------------------------------------
SHELL    = /bin/sh
MAKEFILE = Makefile
PLATFORM = $(shell uname -s | tr '[:upper:]' '[:lower:]')
MACHINE  = $(shell uname -m)

export TARGET   = i2c_test
#-------------------------------------------------------------------------------
ifeq ($(MAKECMDGOALS),$(findstring $(MAKECMDGOALS), "" "all" "sw" "sim"))
    ifndef RISCV
       export RISCV = $(HOME)/pjt/team2/riscv32im
       $(warning RISCV environment variable updated $(RISCV))
    endif
    export HOST = riscv32-unknown-elf
    export GCCVER = $(shell $(HOST)-gcc --version | grep gcc | cut -d" " -f3)
    ifneq ("$(wildcard $(TARGET).elf)", "")
        export ADDR_ENTRY := $(shell $(HOST)-readelf -h $(TARGET).elf\
                                    | grep -i 'Entry point' | tr -s [:blank:]\
                                    | cut -d':' -f2 | tr -d ' ')
    endif
endif

#-------------------------------------------------------------------------------
export DIR_SRC    := ./src
export DIR_I2C    := ../../ips/i2c_axi_lite
export BAUD_RATE  := 115200
export VCD := 1

# 간단한 I2C 신호 테스트용: main_simple.c 사용
# 전체 테스트용: main.c 사용
SRC.C   = main_simple.c my_printf.c uart_api.c i2c_api.c
#SRC.C   = main.c my_printf.c uart_api.c i2c_api.c
SRC.S   = start.S
OBJS    = $(SRC.S:.S=.o) $(SRC.C:.c=.o)

#-------------------------------------------------------------------------------
DIR_OBJ  := obj
DUMMY    := $(shell [ -d $(DIR_OBJ) ] || mkdir $(DIR_OBJ) )

#-------------------------------------------------------------------------------
ARCH    = rv32im
ABI     = ilp32

ASFLAGS = -march=$(ARCH) -mabi=$(ABI)
# SIMULATION 플래그: 시뮬레이션용 빌드 시 정의됨
CFLAGS  = -march=$(ARCH) -mabi=$(ABI) -DBAUD_RATE=$(BAUD_RATE) -DSIMULATION
INCS    = -I $(DIR_SRC) -I $(DIR_I2C)/api/c\
          -I $(RISCV)/$(HOST)/include\
          -I $(RISCV)/lib/gcc/$(HOST)/$(GCCVER)/include
LDFLAGS = -nostdlib -static\
          -T $(DIR_SRC)/link.ld\
          -Map $(TARGET).map\
          -L $(RISCV)/lib/gcc/$(HOST)/$(GCCVER)/$(ARCH)/$(ABI)\
          --start-group -lgcc --end-group

#-------------------------------------------------------------------------------
vpath %.h   $(DIR_SRC):$(DIR_I2C)/api/c
vpath %.c   $(DIR_SRC):$(DIR_I2C)/api/c
vpath %.S   $(DIR_SRC)

$(DIR_OBJ)/%.o: %.c
	$(HOST)-gcc -c $(CFLAGS) $(INCS) -o $@ $<
$(DIR_OBJ)/%.o: %.S
	$(HOST)-as $(ASFLAGS) -o $@ $<

#-------------------------------------------------------------------------------
all: sw

sw: $(TARGET).elf $(TARGET).bin $(TARGET)-bin.asm $(TARGET)-elf.asm\
    $(TARGET).hex $(TARGET).sym $(TARGET).info $(TARGET).ihex

$(TARGET).elf: $(addprefix $(DIR_OBJ)/,$(OBJS))
	$(HOST)-ld -o $@ $^ $(LDFLAGS)

$(TARGET).bin: $(TARGET).elf
	$(HOST)-objcopy -O binary $< $@

$(TARGET)-elf.asm: $(TARGET).elf
	$(HOST)-objdump --disassemble $< > $@

$(TARGET)-bin.asm: $(TARGET).bin
	$(HOST)-objdump -D -b binary -m riscv $< > $@

$(TARGET).hexa: $(TARGET).bin
	od -v -t x1 $< > $@

$(TARGET).hex: $(TARGET).hexa
	awk '{print $$5$$4$$3$$2,$$9$$8$$7$$6,$$13$$12$$11$$10,$$17$$16$$15$$14}' $< > $@

$(TARGET).sym: $(TARGET).elf
	$(HOST)-objdump -t $< > $@

$(TARGET).srec: $(TARGET).elf
	$(HOST)-objcopy -O srec $< $@

$(TARGET).ihex: $(TARGET).elf
	$(HOST)-objcopy -O ihex $< $@

$(TARGET).info: $(TARGET).elf
	$(HOST)-readelf -l $(TARGET).elf
	$(HOST)-objdump -h $(TARGET).elf

#-------------------------------------------------------------------------------
DIR_BIT = ../../hw/impl.ip_integrator/zed.confmc

program:
	$(DIR_BIT)/program_fpga.sh $(DIR_BIT)/design_riscv_cache_wrapper.bit

download:
	../../sw.confmc/elf_download/elf_download -A $(TARGET).elf -B u.bin -D

#-------------------------------------------------------------------------------
export SIMULATOR ?= xsim
ifeq ($(MAKECMDGOALS),$(findstring $(MAKECMDGOALS), "hw" "sim"))
    ifeq ($(SIMULATOR),xsim)
        ifndef XILINX_VIVADO
           $(error XILINX_VIVADO environment variable not defined)
        endif
        export DIR_HW_SIM = ../../hw/sim.riscv_cache_soc/xsim
    else ifeq ($(SIMULATOR),iverilog)
        ifeq (, $(shell which iverilog))
           $(error iverilog not found.)
        endif
        export DIR_HW_SIM = ../../hw/sim.riscv_cache_soc/iverilog
    endif
    FILE_BIN = $(abspath $(TARGET).bin)
endif

hw:
	(cd $(DIR_HW_SIM); make cleanup; make elab)

sim:
	(cd $(DIR_HW_SIM);\
		make sim ADDR_ENTRY=$(ADDR_ENTRY)\
			FILE_BIN=$(FILE_BIN)\
			CHECK_BIN=1\
			BAUD_RATE=$(BAUD_RATE)\
			VCD=$(VCD))

#-------------------------------------------------------------------------------
.PHONY: clean cleanup clobber cleanupall distclean
clean cleanup clobber cleanupall distclean:
	/bin/rm -f  $(TARGET).elf
	/bin/rm -f  $(TARGET).bin
	/bin/rm -f  $(TARGET)-elf.asm
	/bin/rm -f  $(TARGET)-bin.asm
	/bin/rm -f  $(TARGET).hexa
	/bin/rm -f  $(TARGET).hex
	/bin/rm -f  $(TARGET).sym
	/bin/rm -f  $(TARGET).srec
	/bin/rm -f  $(TARGET).ihex
	/bin/rm -f  $(TARGET).map
	/bin/rm -fr $(DIR_OBJ)
	/bin/rm -f  $(TARGET).elf.bin u.bin

#-------------------------------------------------------------------------------
# Revision history
#
# 2025.10.30: Created for I2C EEPROM Test
#-------------------------------------------------------------------------------

