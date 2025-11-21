# SPI AXI Controller Test Environment

## 개요

이 디렉토리는 MFRC522 RFID 리더를 위한 SPI AXI 컨트롤러의 테스트 환경을 제공합니다.
uart_axi_lite와 동일한 구조로 단계별 테스트를 수행할 수 있습니다.

## 디렉토리 구조

```
spi_axi/
├── rtl/verilog/          # RTL 소스 코드
│   ├── spi_axi_if.v      # AXI4-Full 인터페이스 래퍼
│   └── spi_master.v      # SPI 마스터 코어
├── bench/
│   ├── unit/verilog/     # 1단계: SPI 프로토콜 단위 테스트
│   │   ├── top.sv        # SPI 마스터만 테스트
│   │   └── spi_checker.sv # SPI 프로토콜 체크러
│   │
│   └── integration/verilog/  # 2단계: MFRC522 모델 통합 테스트
│       ├── top.sv        # SPI 마스터 + MFRC522 모델
│       ├── tester.sv     # 테스트 시퀀스
│       ├── tasks_axi_full.sv # AXI4-Full 태스크
│       ├── tasks_spi_axi.sv  # SPI AXI 태스크
│       └── mfrc522_model.sv  # MFRC522 모델
├── bench.cosim/verilog/  # 3단계: BFM 코시뮬레이션
│   ├── top.sv            # BFM 연결된 top
│   └── mfrc522_model.sv  # MFRC522 모델
├── c.cosim/src/          # C 코드 테스트
│   └── main.c            # C 테스트 코드
└── sim/                  # 시뮬레이션 스크립트
    ├── unit/xsim/        # 1단계 단위 테스트
    ├── xsim/             # 2단계 통합 테스트
    └── cosim/xsim/       # 3단계 시스템 테스트
```

## 테스트 단계 (권장 순서)

### 1단계: SPI 프로토콜 단위 테스트 (bench/unit/verilog)

**목적**: SPI 마스터 모듈의 프로토콜 정확성만 검증

SPI 마스터만 테스트하며, MFRC522 모델 없이 SPI 신호의 프로토콜 준수를 확인합니다.

```bash
cd sim/unit/xsim
make
```

또는 GUI 모드로 실행:
```bash
cd sim/unit/xsim
make GUI=1
```

**검증 항목:**
- SPI Mode 0 프로토콜 준수 (CPOL=0, CPHA=0)
- CS_N 타이밍 (HIGH → LOW → HIGH)
- SCK 생성 및 타이밍
- MOSI 데이터 전송 순서 (MSB First)
- 주소 바이트 형식 (R/W bit 포함)
- 상태 머신 동작

**출력:**
- `wave.vcd`: 시뮬레이션 웨이브폼
- 콘솔 출력: SPI 체크러의 프로토콜 검증 결과

### 2단계: MFRC522 모델 통합 테스트 (bench/integration/verilog)

**목적**: MFRC522 모델과의 통신 호환성 검증

SPI 마스터와 MFRC522 모델을 함께 테스트하여 실제 디바이스 프로토콜을 검증합니다.

```bash
cd sim/xsim
make
```

또는 GUI 모드로 실행:
```bash
cd sim/xsim
make GUI=1
```

**테스트 내용:**
- 레지스터 읽기/쓰기
- MFRC522 초기화 및 버전 확인
- SPI 트랜잭션 분석
- 다중 바이트 전송

**출력:**
- `wave.vcd`: 시뮬레이션 웨이브폼
- 콘솔 출력: 각 트랜잭션의 상세 정보

### 3단계: BFM 코시뮬레이션 (bench.cosim/verilog)

**목적**: 전체 시스템 통합 및 소프트웨어 호환성 검증

C 코드와 하드웨어를 함께 시뮬레이션합니다.

**하드웨어 컴파일:**
```bash
cd sim.cosim/xsim
make hw
```

**소프트웨어 컴파일:**
```bash
cd sim.cosim/xsim
make sw
```

**실행:**
```bash
cd sim.cosim/xsim
make run
```

또는 수동으로:
```bash
# 터미널 1: C 프로그램 실행
./test -cid 0 -port 0x2300 -v 1

# 터미널 2: 시뮬레이터 실행
make sim CID=0 PORT=0x2300 VERBOSE=1
```

**테스트 내용:**
- C 코드에서 SPI 레지스터 접근
- MFRC522 통신 테스트
- 실제 RISC-V 소프트웨어와 유사한 환경

## 검증 순서의 중요성

일반적으로 하드웨어 검증은 다음 순서로 진행하는 것이 효율적입니다:

1. **Unit Test (단위 테스트)**: 프로토콜 정확성 검증
   - 가장 기본이 되는 프로토콜이 틀리면 모든 것이 실패
   - 빠르게 실행 가능
   - 문제 발견 시 수정이 용이

2. **Integration Test (통합 테스트)**: 디바이스 호환성 검증
   - 프로토콜이 맞아도 디바이스별 차이가 있을 수 있음
   - 실제 사용 패턴 검증

3. **System Test (시스템 테스트)**: 전체 시스템 검증
   - 실제 사용 환경과 유사
   - 소프트웨어 드라이버 검증

이 순서를 따르면 문제를 단계적으로 해결할 수 있어 디버깅이 용이합니다.

## 트랜잭션 분석

각 SPI 트랜잭션은 다음과 같이 분석됩니다:

1. **트랜잭션 시작**: CS_N이 LOW로 전환
2. **주소 전송**: 8비트 (MSB=R/W, 하위 7비트=주소)
3. **데이터 전송**: 
   - Write: MOSI로 데이터 전송
   - Read: MISO로 데이터 수신
4. **트랜잭션 완료**: CS_N이 HIGH로 전환

### 트랜잭션 모니터링

`top.sv`에는 SPI 트랜잭션을 모니터링하는 코드가 포함되어 있습니다:

```systemverilog
always @(posedge spi_sck) begin
    if (!spi_cs_n) begin
        $display("[%0t] SPI SCK rising edge - CS=%0d, MOSI=%0d, MISO=%0d", 
                 $time, spi_cs_n, spi_mosi, spi_miso);
    end
end
```

## MFRC522 모델

`mfrc522_model.sv`는 MFRC522의 SPI 인터페이스를 모델링합니다:

- **SPI Mode 0** (CPOL=0, CPHA=0) 지원
- **128개 레지스터** 모델링 (0x00~0x7F)
- **버전 레지스터** (0x37): 기본값 0x91 (v2.0)
- **디버그 신호**: last_addr, last_data, last_rw

## 레지스터 맵

### SPI 컨트롤러 레지스터

| 주소 | 레지스터 | 설명 |
|------|----------|------|
| 0x00 | CTRL     | [0]=enable, [1]=rw, [15:8]=num_bytes |
| 0x04 | ADDR     | [6:0]=7-bit MFRC522 주소 |
| 0x08 | DATA_IN  | [7:0]=쓰기 데이터 |
| 0x0C | DATA_OUT | [7:0]=읽기 데이터 |
| 0x10 | STATUS   | [0]=busy, [1]=done, [2]=error |

### 주요 MFRC522 레지스터

| 주소 | 레지스터 | 설명 |
|------|----------|------|
| 0x37 | Version  | 칩 버전 (0x91=v2.0, 0x92=v1.0) |
| 0x01 | Command  | 명령 레지스터 |
| 0x07 | Status   | 상태 레지스터 |
| 0x09 | FIFO Data| FIFO 데이터 레지스터 |
| 0x0C | Control  | 제어 레지스터 |

## 사용 예제

### SystemVerilog 테스트

```systemverilog
// MFRC522 버전 읽기
mfrc522_read(MFRC522_REG_VERSION, version);
$display("Version: 0x%02X", version);

// MFRC522 레지스터 쓰기
mfrc522_write(MFRC522_REG_CONTROL, 8'h10);

// 트랜잭션 분석
spi_analyze_transaction(1, MFRC522_REG_VERSION, 0);
```

### C 코드 테스트

```c
// MFRC522 초기화
mfrc522_init();

// 레지스터 읽기
unsigned char version = mfrc522_read(MFRC522_REG_VERSION);
printf("Version: 0x%02X\n", version);

// 레지스터 쓰기
mfrc522_write(MFRC522_REG_CONTROL, 0x10);
```

## 문제 해결

### 시뮬레이션이 시작되지 않음
- `XILINX_VIVADO` 환경 변수가 올바르게 설정되었는지 확인
- Vivado가 설치되어 있고 PATH에 포함되어 있는지 확인
- `COSIM_HOME` 환경 변수가 올바르게 설정되었는지 확인

### BFM 연결 실패
- 포트 번호가 충돌하지 않는지 확인 (기본값: 0x2300)
- 방화벽 설정 확인

### 트랜잭션 타임아웃
- SPI 클럭 분주 비율 확인
- MFRC522 모델이 올바르게 연결되었는지 확인

## 참고 자료

- MFRC522 데이터시트
- AXI4 프로토콜 사양
- uart_axi_lite 테스트 환경

