# Hello World 프로젝트 실행 가이드

## 현재 main.c 기능
- UART 초기화 및 통신
- GPIO/Keypad 초기화
- 키패드 입력 감지 및 UART로 출력

## 실행 확인 방법

### 방법 1: 시뮬레이션 (빠른 확인)

#### 1단계: 소프트웨어 빌드
```bash
cd codes/riscv_platform/riscv32im_soc/sw.riscv/hello_world
make sw
```

**확인:**
```bash
ls -lh uart_test.elf uart_test.bin
```

#### 2단계: 시뮬레이션 실행

**옵션 A: XSim (Vivado 시뮬레이터)**
```bash
# 환경 변수 확인
echo $XILINX_VIVADO
# 없으면: export XILINX_VIVADO=/opt/Xilinx/Vivado/2021.2

# 하드웨어 elaboration
make hw

# 시뮬레이션 실행
make sim
```

**옵션 B: iverilog**
```bash
SIMULATOR=iverilog make sim
```

**예상 출력:** 콘솔에 키패드 입력이 나타남
```
Key: 1
Key: 2
...
```

### 방법 2: 실제 하드웨어 (ZedBoard)

#### 1단계: 소프트웨어 빌드
```bash
cd codes/riscv_platform/riscv32im_soc/sw.riscv/hello_world
make sw
```

#### 2단계: FPGA 프로그래밍
```bash
make program
```

**수동 실행:**
```bash
cd ../../hw/impl.ip_integrator/zed.confmc
./program_fpga.sh design_riscv_cache_wrapper.bit
```

#### 3단계: 소프트웨어 다운로드
```bash
cd codes/riscv_platform/riscv32im_soc/sw.riscv/hello_world
make download
```

**수동 실행:**
```bash
../../sw.confmc/elf_download/elf_download -A uart_test.elf -B u.bin -D
```

#### 4단계: 시리얼 터미널 연결
```bash
# USB 포트 확인
ls /dev/ttyUSB*  # 또는 /dev/ttyACM*

# 시리얼 터미널 (Baud Rate: 115200)
minicom -D /dev/ttyUSB0 -b 115200

# 또는 screen
screen /dev/ttyUSB0 115200
```

#### 5단계: 키패드 테스트
- PMODKYPD 키패드를 ZedBoard에 연결
- 키를 누르면 시리얼 터미널에 출력됨:
```
Key: 1
Key: 2
Key: A
...
```

## Makefile 주요 타겟

| 타겟 | 설명 |
|------|------|
| `make sw` | 소프트웨어 빌드 (ELF, BIN 생성) |
| `make hw` | 하드웨어 elaboration (시뮬레이션 준비) |
| `make sim` | 시뮬레이션 실행 |
| `make program` | FPGA 프로그래밍 |
| `make download` | 소프트웨어 다운로드 |
| `make clean` | 빌드 파일 삭제 |

## 환경 변수

```bash
# RISC-V 툴체인
export RISCV=$HOME/riscv32

# Vivado (XSim 사용 시)
export XILINX_VIVADO=/opt/Xilinx/Vivado/2021.2

# 시뮬레이터 선택
export SIMULATOR=xsim      # 또는 iverilog
```

## 문제 해결

### 빌드 오류
```bash
# RISC-V 툴체인 확인
riscv32-unknown-elf-gcc --version

# 환경 변수 확인
echo $RISCV
```

### 시뮬레이션 오류
```bash
# XSim: Vivado 경로 확인
echo $XILINX_VIVADO

# iverilog 사용
SIMULATOR=iverilog make sim
```

### 하드웨어 연결 문제
```bash
# USB 포트 확인
lsusb
ls /dev/ttyUSB*

# 권한 설정
sudo chmod 666 /dev/ttyUSB0
```

## 빠른 실행 (요약)

```bash
# 1. 빌드
make sw

# 2-1. 시뮬레이션
make sim

# 2-2. 하드웨어
make program && make download
# 그 다음 시리얼 터미널 연결
```

