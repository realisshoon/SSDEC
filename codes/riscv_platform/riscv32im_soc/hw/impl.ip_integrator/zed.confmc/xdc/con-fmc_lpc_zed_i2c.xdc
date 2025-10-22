########################################################
## zedboard FMC
########################################################
set_property PACKAGE_PIN R7      [get_ports "FMC_SCL"] ; # FMC C30
set_property PACKAGE_PIN U7      [get_ports "FMC_SDA"] ; # FMC C31
set_property IOSTANDARD LVCMOS33 [get_ports {FMC_SCL}]
set_property IOSTANDARD LVCMOS33 [get_ports {FMC_SDA}]
set_property SLEW       FAST     [get_ports {FMC_SCL}]
set_property SLEW       FAST     [get_ports {FMC_SDA}]
