# Keypad 동작 확인 가이드

## 개요

이 문서는 `hello_world` 프로젝트의 keypad 코드가 정상적으로 동작하는지 확인하는 방법을 설명합니다.

## 테스트 방법

### 방법 1: 하드웨어 시뮬레이션 (XSim)

시뮬레이션을 통해 keypad 동작을 확인할 수 있습니다. 하지만 시뮬레이션에서는 실제 keypad 입력을 제공하기 어려우므로, keypad 코드가 정상적으로 컴파일되고 실행되는지만 확인 가능합니다.

#### 단계:

1. **소프트웨어 빌드**
```bash
cd codes/riscv_platform/riscv32im_soc/sw.riscv/hello_world

# 환경 변수 설정 (필요 시)
export RISCV=/home/sogang/pjt/team2/codes/riscv32im
export PATH=$RISCV/bin:$PATH

# 빌드
make clean
make sw
```

2. **시뮬레이션 실행**
```bash
# XSim 시뮬레이션
make sim

# 또는 GUI 모드로 실행
make sim GUI=1
```

3. **확인 사항**
- 시뮬레이션이 정상적으로 시작되는지 확인
- UART 출력이 정상적으로 표시되는지 확인
- 시뮬레이션 로그에서 에러가 없는지 확인

**참고**: 시뮬레이션에서는 실제 keypad 입력을 제공할 수 없으므로, 키 입력은 감지되지 않습니다. 코드 실행 흐름과 UART 출력만 확인 가능합니다.

### 방법 2: 실제 하드웨어 테스트 (Zynq-7000/ZedBoard)

실제 하드웨어에서 PMODKYPD를 연결하여 keypad 동작을 확인합니다.

#### 하드웨어 준비

1. **PMODKYPD 연결**
   - PMODKYPD를 ZedBoard의 PMOD 포트에 연결
   - GPIO 핀 매핑 확인 (PMODKYPD_INTEGRATION.md 참고)

2. **UART 연결**
   - ZedBoard의 UART 포트를 PC와 연결
   - 시리얼 터미널 설정: 115200 baud, 8N1

#### 단계:

1. **소프트웨어 빌드**
```bash
cd codes/riscv_platform/riscv32im_soc/sw.riscv/hello_world

# 빌드
make clean
make sw
```

빌드 완료 시 `gpio_test.bin` 파일이 생성됩니다.

2. **FPGA 프로그래밍**
```bash
# FPGA에 비트스트림 다운로드
make program

# 또는 직접 실행
cd ../../hw/impl.ip_integrator/zed.confmc
./program_fpga.sh design_riscv_cache_wrapper.bit
```

3. **소프트웨어 다운로드**
```bash
# ELF 파일을 보드에 다운로드
make download

# 또는 직접 실행
../../sw.confmc/elf_download/elf_download -A gpio_test.elf -B u.bin -D
```

4. **시리얼 터미널 모니터링**
   - 시리얼 터미널 프로그램 실행 (minicom, screen, putty 등)
   - 예: `screen /dev/ttyUSB0 115200`

5. **Keypad 테스트**
   - PMODKYPD에서 키를 누릅니다
   - 시리얼 터미널에 다음 형식으로 출력되어야 합니다:
     ```
     Key: 1
     Key: 2
     Key: A
     ...
     ```

## 예상 출력

정상 동작 시 시리얼 터미널에는 다음과 같은 출력이 표시됩니다:

```
Key: 1
Key: 2
Key: 3
Key: A
Key: 4
Key: 5
Key: 6
Key: B
...
```

## 문제 해결

### 키 입력이 감지되지 않는 경우

1. **하드웨어 연결 확인**
   - PMODKYPD가 올바르게 연결되었는지 확인
   - GPIO 핀 매핑이 올바른지 확인 (`PMODKYPD_INTEGRATION.md` 참고)

2. **GPIO 주소 확인**
   - `main.c`의 `GPIO_BASE_ADDR`가 하드웨어와 일치하는지 확인
   - 기본값: `0x90030000`

3. **디바운싱 문제**
   - 키가 너무 빨리 눌리면 감지되지 않을 수 있음
   - `keypad_api.c`의 디바운싱 지연 시간 조정 가능

### UART 출력이 없는 경우

1. **UART 연결 확인**
   - 시리얼 케이블 연결 확인
   - 볼트레이트 설정 확인 (115200)

2. **UART 주소 확인**
   - `main.c`의 `UART_BASE_ADDR` 확인
   - 기본값: `0x90020000`

3. **초기화 확인**
   - `main.c`에서 UART 초기화가 정상적으로 실행되는지 확인

### 빌드 오류

1. **RISCV 환경 변수 확인**
   ```bash
   echo $RISCV
   # 출력: /home/sogang/pjt/team2/codes/riscv32im
   ```

2. **툴체인 확인**
   ```bash
   riscv32-unknown-elf-gcc --version
   ```

3. **start.S 파일 확인**
   - `src/start.S` 파일이 존재하는지 확인

## 디버깅 팁

### 코드 수정 없이 테스트

실제 keypad가 연결되지 않은 상태에서도 코드 실행은 가능합니다. 키 입력이 없으면 아무 출력도 없지만, 프로그램은 계속 실행됩니다.

### 시리얼 출력 확인

프로그램 시작 시 UART 초기화 메시지가 출력되는지 확인합니다. 출력이 없다면 UART 초기화에 문제가 있을 수 있습니다.

### GPIO 레지스터 확인

필요 시 `gpio_read()` 함수를 사용하여 GPIO 레지스터 값을 직접 확인할 수 있습니다.

## 추가 참고 자료

- `KEYPAD_CODE_EXPLANATION.md` - Keypad 코드 상세 설명
- `PMODKYPD_INTEGRATION.md` - PMODKYPD 하드웨어 연결 가이드
- `ZYNQ7000_INTEGRATION.md` - Zynq-7000 통합 가이드

