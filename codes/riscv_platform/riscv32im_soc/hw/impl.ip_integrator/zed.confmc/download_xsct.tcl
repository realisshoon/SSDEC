#connect -url TCP:127.0.0.1:3121
connect
targets -set -nocase -filter {name =~"APU*"}
source ../../sw.arm/bootgen/fsbl/fsbl/_ide/psinit/ps7_init.tcl
#source ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
#dow fsbl.elf
dow ../../sw.arm/bootgen/fsbl/fsbl/Debug/fsbl.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
after 2000
exit
EOF
