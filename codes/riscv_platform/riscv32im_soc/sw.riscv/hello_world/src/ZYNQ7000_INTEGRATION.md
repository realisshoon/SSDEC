# Zynq-7000 보드에 Keypad 통합 가이드

## 1. 개요

이 가이드는 Zynq-7000 (ZedBoard) 보드에 4x4 키패드를 연결하고 합성하여 동작을 확인하는 과정을 설명합니다.

## 2. 하드웨어 연결 (PMODKYPD)

### 2.1 필요한 부품
- **PMODKYPD**: Digilent 4x4 매트릭스 키패드 PMOD 모듈
  - Reference: [PMODKYPD Manual](https://digilent.com/reference/_media/pmod:pmod:pmodkypd_rm.pdf)
  - **내장 풀업 저항**: 별도 풀업 저항 불필요
- PMOD 커넥터 (ZedBoard에 내장)

### 2.2 PMODKYPD 핀 연결

PMODKYPD는 표준 PMOD 인터페이스(12핀)를 사용합니다.

#### PMODKYPD 핀 배치
```
PMOD 커넥터 (2x6):
     ┌─────┬─────┐
 12  │ VCC │ GND │  6
     ├─────┼─────┤
 11  │     │     │  5 (미사용)
     ├─────┼─────┤
 10  │Col3 │Col2 │  4
     ├─────┼─────┤
  9  │Col1 │Col0 │  3
     ├─────┼─────┤
  8  │Row3 │Row2 │  2
     ├─────┼─────┤
  7  │Row1 │Row0 │  1
     └─────┴─────┘
```

#### GPIO 핀 매핑
| PMODKYPD 핀 | 신호 | GPIO 핀 | 방향 | 설명 |
|-------------|------|---------|------|------|
| 1           | Row 0 | GPIO[0] | 출력 | PMOD JA[0] |
| 2           | Row 1 | GPIO[1] | 출력 | PMOD JA[1] |
| 3           | Row 2 | GPIO[2] | 출력 | PMOD JA[2] |
| 4           | Row 3 | GPIO[3] | 출력 | PMOD JA[3] |
| 6           | GND   | -       | -    | 접지 (자동) |
| 7           | Col 0 | GPIO[4] | 입력 | PMOD JA[4] (풀업 내장) |
| 8           | Col 1 | GPIO[5] | 입력 | PMOD JA[5] (풀업 내장) |
| 9           | Col 2 | GPIO[6] | 입력 | PMOD JA[6] (풀업 내장) |
| 10          | Col 3 | GPIO[7] | 입력 | PMOD JA[7] (풀업 내장) |
| 12          | VCC   | -       | -    | 3.3V (자동) |

### 2.3 연결 방법
1. **PMODKYPD를 ZedBoard PMOD 커넥터에 연결**
   - PMODKYPD의 12핀을 JA(또는 다른 PMOD) 커넥터에 직접 연결
   - 방향 확인: 핀 1이 커넥터 상단 왼쪽에 위치

2. **별도 연결 불필요**
   - 전원: PMOD VCC에서 자동 공급
   - 풀업 저항: PMODKYPD 내장 (별도 저항 불필요)
   - GND: PMOD GND에서 자동 연결

### 2.4 XDC 파일에 핀 할당 추가

XDC 파일 위치: `hw/impl.ip_integrator/zed.confmc/xdc/fpga_zed.xdc`

현재 파일에는 일부 키패드 핀 할당이 있지만, GPIO를 통해 동작하므로 GPIO 핀 할당을 확인/수정해야 합니다.

## 3. 소프트웨어 빌드 및 준비

### 3.1 소프트웨어 빌드
```bash
cd codes/riscv_platform/riscv32im_soc/sw.riscv/hello_world
make sw
```

생성되는 파일:
- `uart_test.elf`: 실행 파일
- `uart_test.bin`: 바이너리 파일
- `uart_test.hex`: 헥스 파일

### 3.2 빌드 확인
```bash
ls -lh uart_test.*
```

## 4. 하드웨어 합성 및 구현

### 4.1 환경 변수 설정
```bash
export XILINX_VIVADO=/opt/Xilinx/Vivado/2021.2  # Vivado 경로
export DESIGN_NAME=design_riscv_cache
export PROJECT_NAME=project_design_riscv_cache
export PROJECT_DIR=$(pwd)/hw/impl.ip_integrator/zed.confmc/project_design_riscv_cache
export PART=xc7z020clg484-1
export BOARD_PART=digilentinc.com:zedboard:part0:1.0
```

### 4.2 Vivado 프로젝트 생성 (이미 있는 경우 생략)
```bash
cd codes/riscv_platform/riscv32im_soc/hw/impl.ip_integrator/zed.confmc
vivado -mode batch -source run_vivado.tcl
```

### 4.3 합성 및 구현
```bash
# Vivado 열기
vivado project_design_riscv_cache/project_design_riscv_cache.xpr

# 또는 배치 모드로 합성
vivado -mode batch -source run_vivado.tcl -tclargs synth_impl
```

### 4.4 합성 확인 사항
1. **GPIO 모듈 포함 확인**
   - Block Design에 GPIO AXI Lite IP가 포함되어 있는지 확인
   - Address: 0x90030000

2. **핀 할당 확인**
   - XDC 파일에서 GPIO 핀 할당 확인
   - I/O 표준: LVCMOS33

3. **타이밍 제약 확인**
   - 클록 제약이 올바르게 설정되었는지 확인
   - GPIO 핀의 setup/hold time 확인

## 5. FPGA 프로그래밍

### 5.1 비트스트림 생성
합성이 완료되면 `design_riscv_cache_wrapper.bit` 파일이 생성됩니다.

### 5.2 FPGA 프로그래밍
```bash
cd codes/riscv_platform/riscv32im_soc/sw.riscv/hello_world
make program
```

또는 수동으로:
```bash
cd hw/impl.ip_integrator/zed.confmc
./program_fpga.sh design_riscv_cache_wrapper.bit
```

## 6. 소프트웨어 다운로드

### 6.1 ELF 파일 다운로드
```bash
cd codes/riscv_platform/riscv32im_soc/sw.riscv/hello_world
make download
```

또는 수동으로:
```bash
../../sw.confmc/elf_download/elf_download -A uart_test.elf -B u.bin -D
```

## 7. 동작 확인

### 7.1 시리얼 터미널 연결
- **Baud Rate**: 115200
- **포트**: ZedBoard USB-UART 포트
- **도구**: minicom, screen, 또는 Putty

```bash
# Linux 예시
minicom -D /dev/ttyUSB0 -b 115200

# 또는 screen
screen /dev/ttyUSB0 115200
```

### 7.2 예상 출력
```
Hello world!
Nice to see you!

=== GPIO Test ===
GPIO initialized at address 0x90030000
GPIO ADDR: 0x90030000
GPIO INPUT: 0xXXXXXXXX
GPIO Test Complete!

=== Keypad Test ===
Keypad initialized using GPIO at 0x90030000
Press any key on keypad...
Keypad layout:
  1  2  3  A
  4  5  6  B
  7  8  9  C
  *  0  #  D
(Press keys to test)
```

### 7.3 키 입력 테스트
1. 키패드의 '1' 키를 누름
2. 시리얼 터미널에 "Key pressed: '1'" 메시지 확인
3. 다른 키들도 순차적으로 테스트

## 8. 디버깅

### 8.1 키가 감지되지 않는 경우

#### 1) 하드웨어 연결 확인
- 멀티미터로 연결 확인
- 풀업 저항 확인
- 전압 레벨 확인 (3.3V)

#### 2) GPIO 레지스터 확인
코드에 디버그 출력 추가:
```c
uint32_t dir = gpio_read_dir();
my_printf("GPIO DIR: 0x%08X\r\n", dir);
// 예상값: 0x0000000F (하위 4비트만 출력)

uint32_t input = gpio_read();
my_printf("GPIO INPUT: 0x%08X\r\n", input);
// 키를 누르기 전: 0x000000F0 (모든 Column HIGH)
// 키를 누른 후: 해당 Column이 LOW로 변경됨
```

#### 3) Vivado Hardware Manager로 신호 확인
- ILA (Integrated Logic Analyzer) 추가
- GPIO 신호를 프로브하여 실제 동작 확인

### 8.2 잘못된 키가 감지되는 경우
1. 핀 연결 재확인
2. 키패드 하드웨어 결함 확인
3. 디바운싱 시간 조정

## 9. 전체 프로세스 요약

```bash
# 1. 소프트웨어 빌드
cd sw.riscv/hello_world
make sw

# 2. 하드웨어 합성 및 구현
cd hw/impl.ip_integrator/zed.confmc
vivado -mode batch -source run_vivado.tcl -tclargs synth_impl

# 3. FPGA 프로그래밍
cd sw.riscv/hello_world
make program

# 4. 소프트웨어 다운로드
make download

# 5. 시리얼 터미널로 확인
minicom -D /dev/ttyUSB0 -b 115200
```

## 10. 주의사항

1. **전원 확인**: 키패드와 보드가 모두 전원이 공급되었는지 확인
2. **접지**: 키패드와 보드의 GND가 연결되어 있는지 확인
3. **전압 레벨**: GPIO는 3.3V LVCMOS이므로 키패드도 3.3V 호환인지 확인
4. **풀업 저항**: Column 핀에는 반드시 풀업 저항이 필요
5. **디바운싱**: 하드웨어 디바운싱이 없으면 소프트웨어 디바운싱 필수

## 11. 추가 개선 사항

1. **인터럽트 기반 키 감지**: GPIO IRQ 활용
2. **하드웨어 디바운싱**: RC 필터 추가
3. **LED 피드백**: 키 입력 시 LED 표시
4. **다중 키 감지**: 동시에 여러 키 누름 감지 (고급)

