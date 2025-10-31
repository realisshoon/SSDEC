#!/bin/bash -f
#------------------------------------------------------
# Copyright (c) 2024 by Ando Ki
#------------------------------------------------------
# VERSION: 2024.08.20.
#------------------------------------------------------
SHELL=/bin/bash

# rv32i/ilp32
# rv32i_zicsr/ilp32
# rv32imac/ilp32
# rv32imac/ilp32
# rv32imafc/ilp32f

# -arch      rv32im_zicsr
# -arch      rv32gc_zicsr
# rv32gc_zicsr_zifencei
# rv32imafdc_zicsr_zifencei
# rv32imafd_zicsr_zifencei

# riscv32-unknown-elf-gcc --print-multi-lib

./BuildRiscvCore.sh -prefix    ${HOME}/pjt/team2/riscv32im\
                    -host      riscv32-unknown-elf\
                    -arch      rv32im_zicsr\
                    -multi     1\
                    -compiler  1\
                    -gdb       0\
                    -simulator 0\
                    -pk        0\
                    -build     build32

#------------------------------------------------------
# Revision history:
#
# 2024.08.20: Started by Ando Ki (andoki@gmail.com)
#------------------------------------------------------
