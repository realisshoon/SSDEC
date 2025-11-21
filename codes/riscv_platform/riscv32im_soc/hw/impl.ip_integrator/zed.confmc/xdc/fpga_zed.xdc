#--------------------------------------------------------
# CLOCK
set_property PACKAGE_PIN Y9 [get_ports BOARD_CLK_IN]
set_property IOSTANDARD LVCMOS33 [get_ports BOARD_CLK_IN]

#--------------------------------------------------------
# BOARD RESET (Bank 34/35, J18 점퍼로 2.5V 설정)
# 주의: J18 점퍼를 2.5V로 설정했으므로 LVCMOS25 사용
set_property PACKAGE_PIN P16 [get_ports BOARD_RST_SW]
set_property IOSTANDARD LVCMOS25 [get_ports BOARD_RST_SW]

#--------------------------------------------------------
set_false_path -reset_path -from [get_ports BOARD_RST_SW]
create_clock -period 10.000 -name BOARD_CLK_IN [get_ports BOARD_CLK_IN]

#--------------------------------------------------------
# JA PMOD - Bank 13
#    +--+--+--+--+--+--+
#    |V |G |4 |3 |2 |1 | upper
#    +--+--+--+--+--+--+
#    |V |G |10|9 |8 |7 | lower
#  --+--+--+--+--+--+--+--
#  -----------------------PCB
#
# USBUART
#
#   VCC  GND CTSn TXD RXD RTSn
#             ||  /\  ||  / #   +------------------------+
#   |  6   5   4   3   2   1 |
#
set_property PACKAGE_PIN Y11 [get_ports uart_cts_n]
set_property PACKAGE_PIN AA11 [get_ports uart_txd]
set_property PACKAGE_PIN Y10 [get_ports uart_rxd]
set_property PACKAGE_PIN AA9 [get_ports uart_rts_n]
#set_property PACKAGE_PIN AB11 [get_ports {JA7}];  # "JA7"
#set_property PACKAGE_PIN AB10 [get_ports {JA8}];  # "JA8"
#set_property PACKAGE_PIN AB9  [get_ports {JA9}];  # "JA9"
#set_property PACKAGE_PIN AA8  [get_ports {JA10}]; # "JA10"

set_property IOSTANDARD LVCMOS33 [getrealisshoon


#--------------------------------------------------------
# GPIO 8비트 핀 할당 (ZedBoard 내장 LED 및 스위치)
#--------------------------------------------------------
# GPIO Output -> ZedBoard 8개 LED (LD0-LD7) - Bank 33 (3.3V 고정)
set_property PACKAGE_PIN T22 [get_ports {gpio_out[0]}]
set_property PACKAGE_PIN T21 [get_ports {gpio_out[1]}]
set_property PACKAGE_PIN U22 [get_ports {gpio_out[2]}]
set_property PACKAGE_PIN U21 [get_ports {gpio_out[3]}]
set_property PACKAGE_PIN V22 [get_ports {gpio_out[4]}]
set_property PACKAGE_PIN W22 [get_ports {gpio_out[5]}]
set_property PACKAGE_PIN U19 [get_ports {gpio_out[6]}]
set_property PACKAGE_PIN U14 [get_ports {gpio_out[7]}]

# GPIO Input -> ZedBoard 8개 스위치 (SW0-SW7) - Bank 34/35 (J18 점퍼로 2.5V 설정)
set_property PACKAGE_PIN F22 [get_ports {gpio_in[0]}]
set_property PACKAGE_PIN G22 [get_ports {gpio_in[1]}]
set_property PACKAGE_PIN H22 [get_ports {gpio_in[2]}]
set_property PACKAGE_PIN F21 [get_ports {gpio_in[3]}]
set_property PACKAGE_PIN H19 [get_ports {gpio_in[4]}]
set_property PACKAGE_PIN H18 [get_ports {gpio_in[5]}]
set_property PACKAGE_PIN H17 [get_ports {gpio_in[6]}]
set_property PACKAGE_PIN M15 [get_ports {gpio_in[7]}]

# GPIO Direction (gpio_dir)은 내부 신호로만 사용 (외부 핀 할당 안 함)
# GPIO 방향 제어는 GPIO 컨트롤러 내부에서만 사용되므로 외부 핀 불필요

# I/O 표준 설정
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_out[*]}]
set_property IOSTANDARD LVCMOS25 [get_ports {gpio_in[*]}]

#--------------------------------------------------------
# 4x4 Matrix Keypad 시뮬레이션을 위한 GPIO 핀 할당
# ZedBoard 내장 스위치/버튼 사용
#--------------------------------------------------------
# Column 출력 핀 (Column을 LOW로 설정하여 스캔)
set_property PACKAGE_PIN W6 [get_ports {keypad_col[3]}]
set_property PACKAGE_PIN W5 [get_ports {keypad_col[2]}]
set_property PACKAGE_PIN U6 [get_ports {keypad_col[1]}]
set_property PACKAGE_PIN U5 [get_ports {keypad_col[0]}]

# Row 입력 핀 (버튼이 눌리면 LOW 감지)
set_property PACKAGE_PIN V7 [get_ports {keypad_row[3]}]
set_property PACKAGE_PIN W7 [get_ports {keypad_row[2]}]
set_property PACKAGE_PIN V5 [get_ports {keypad_row[1]}]
set_property PACKAGE_PIN V4 [get_ports {keypad_row[0]}]





# I/O 표준 설정
set_property IOSTANDARD LVCMOS33 [get_ports {keypad_col[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {keypad_col[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {keypad_col[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {keypad_col[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {keypad_row[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {keypad_row[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {keypad_row[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {keypad_row[0]}]


# Pull-up 설정 (Row 핀은 버튼이 안 눌렸을 때 HIGH)
set_property PULLUP true [get_ports {keypad_row[3]}]
set_property PULLUP true [get_ports {keypad_row[2]}]
set_property PULLUP true [get_ports {keypad_row[1]}]
set_property PULLUP true [get_ports {keypad_row[0]}]

#--------------------------------------------------------
# I2C for AT24C02 EEPROM - JB PMOD Connector (Bank 13, 3.3V)
#--------------------------------------------------------
# JB3: SDA (Data)
# JB4: SCL (Clock)
#
# 주의사항:
# 1. 외부 4.7kΩ 풀업 저항 필수 (SCL, SDA 각각을 VCC 3.3V에 연결)
# 2. AT24C02 주소 설정: A0=A1=A2=GND → Device Address = 0x50
# 3. WP 핀을 GND에 연결 (쓰기 허용)
#--------------------------------------------------------
set_property PACKAGE_PIN V10 [get_ports i2c_sda]
set_property PACKAGE_PIN W8 [get_ports i2c_scl]

set_property IOSTANDARD LVCMOS33 [get_ports i2c_sda]
set_property IOSTANDARD LVCMOS33 [get_ports i2c_scl]

# I2C 400kHz를 위한 빠른 신호 전환
set_property SLEW FAST [get_ports i2c_sda]
set_property SLEW FAST [get_ports i2c_scl]

# I2C SDA 양방향 포트 설정 (open-drain 방식)
set_property DRIVE 4 [get_ports i2c_sda]
set_property PULLUP true [get_ports i2c_sda]


#--------------------------------------------------------
# RFID (MFRC522) via SPI - PMOD JC Connector (Bank 13, 3.3V)
#--------------------------------------------------------
# PMOD JC 핀 배치:
#    +--+--+--+--+--+--+
#    |V |G |4 |3 |2 |1 | upper
#    +--+--+--+--+--+--+
#    |V |G |10|9 |8 |7 | lower
#  --+--+--+--+--+--+--+--
#
# MFRC522 → PMOD JC 연결 매핑:
#   - VCC (3.3V) → JC 핀 6 (PMOD VCC)
#   - GND        → JC 핀 5 (PMOD GND)
#   - RST        → JC 핀 7 (JC3_N, T6) → spi_rst
#   - SDA        → JC 핀 2 (JC1_P, AB7) → spi_mosi
#   - SCK        → JC 핀 1 (JC1_N, AB6) → spi_sck
#   - NSS/CS     → JC 핀 4 (JC2_P, Y4) → spi_cs_n
#   - MISO       → JC 핀 3 (JC2_N, AA4) → spi_miso
#   - IRQ        → (선택사항, 연결 안 해도 됨)
#
# 주의사항:
#   1. MFRC522는 3.3V 전원 사용 (5V 사용 금지!)
#   2. RST 핀은 필수입니다 (하드웨어 리셋 필요)
#   3. SPI 통신 속도는 10MHz 이하 권장
#   4. 상위 모듈(riscv_cache_soc.v)에 spi_rst 포트 추가 필요
#--------------------------------------------------------
# SPI 핀 할당
set_property PACKAGE_PIN AB6 [get_ports spi_sck]    # JC1_N (핀 1)
set_property PACKAGE_PIN AB7 [get_ports spi_mosi]   # JC1_P (핀 2)
set_property PACKAGE_PIN AA4 [get_ports spi_miso]   # JC2_N (핀 3)
set_property PACKAGE_PIN Y4  [get_ports spi_cs_n]   # JC2_P (핀 4)

# RST 핀 할당 (PMOD JC 핀 7)
set_property PACKAGE_PIN T6 [get_ports spi_rst]     # JC3_N (핀 7)

# I/O 표준 설정
set_property IOSTANDARD LVCMOS33 [get_ports spi_sck]
set_property IOSTANDARD LVCMOS33 [get_ports spi_mosi]
set_property IOSTANDARD LVCMOS33 [get_ports spi_miso]
set_property IOSTANDARD LVCMOS33 [get_ports spi_cs_n]
set_property IOSTANDARD LVCMOS33 [get_ports spi_rst]