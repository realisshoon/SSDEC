#!/bin/bash

source /tools/Xilinx/Vivado/2021.2/settings64.sh

if [ -z "$1" ]; then
    FSBL_PATH="../../sw.arm/bootgen/fsbl.elf"
else
    FSBL_PATH="$1"
fi

if [ -z "$2" ]; then
    INIT_PATH="../../sw.arm/bootgen/ps7_init.tcl"
else
    INIT_PATH="$2"
fi


xsct -interactive << EOF
#connect -url TCP:127.0.0.1:3121
connect
targets -set -nocase -filter {name =~"APU*"}
source ${INIT_PATH}
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow ${FSBL_PATH}
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
after 2000
exit
EOF

##connect -url TCP:127.0.0.1:3121
#connect
#targets -set -nocase -filter {name =~"APU*"}
##source ../../sw.arm/bootgen/fsbl/fsbl/_ide/psinit/ps7_init.tcl
#source ps7_init.tcl
#ps7_init
#ps7_post_config
#targets -set -nocase -filter {name =~ "*A9*#0"}
##dow ../../sw.arm/bootgen/fsbl/fsbl/Debug/fsbl.elf
#dow fsbl.elf
#configparams force-mem-access 0
#targets -set -nocase -filter {name =~ "*A9*#0"}
#con
#after 2000
#exit
