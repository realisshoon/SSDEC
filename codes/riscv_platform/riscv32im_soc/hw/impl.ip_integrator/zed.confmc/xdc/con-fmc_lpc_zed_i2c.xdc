########################################################
## zedboard FMC I2C (FMC C30: SCL, FMC C31: SDA)
########################################################
set_property PACKAGE_PIN R7      [get_ports "FMC_SCL"] ; # FMC C30
set_property PACKAGE_PIN U7      [get_ports "FMC_SDA"] ; # FMC C31

set_property IOSTANDARD LVCMOS33 [get_ports {FMC_SCL}]
set_property IOSTANDARD LVCMOS33 [get_ports {FMC_SDA}]

# I2C 신호 특성 설정
set_property SLEW       FAST     [get_ports {FMC_SCL}]
set_property SLEW       FAST     [get_ports {FMC_SDA}]

# I2C SDA는 양방향 신호이므로 open-drain 방식 사용
# 주의: 외부 풀업 저항(4.7kΩ)이 필요합니다
set_property DRIVE 4             [get_ports {FMC_SDA}]
set_property PULLUP true          [get_ports {FMC_SDA}]
set_property PULLUP true          [get_ports {FMC_SCL}]
