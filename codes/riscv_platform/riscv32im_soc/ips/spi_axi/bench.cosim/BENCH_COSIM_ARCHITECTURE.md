# bench.cosim/verilog 디렉토리 구조 설명

## 개요
`bench.cosim/verilog` 디렉토리는 **Co-Simulation (코시뮬레이션)** 환경을 위한 테스트벤치 파일들을 포함합니다.
코시뮬레이션이란 Verilog/SystemVerilog 하드웨어 시뮬레이션과 C/C++ 소프트웨어를 동시에 실행하여 상호 작용하는 테스트 방법입니다.

---

## 파일 목록 및 역할

### 1. `top_bfm.sv` (주요 테스트벤치)
**역할**: BFM을 RISC-V 역할로 사용하여 AXI Switch를 통한 SPI AXI Controller 테스트

**구조**:
```
┌─────────────┐         ┌──────────────┐         ┌──────────────────┐         ┌──────────────┐
│  BFM AXI    │         │              │         │ SPI AXI          │         │  MFRC522     │
│  Master 2   │────────▶│ AXI Switch   │────────▶│ Controller       │────────▶│  Model       │
│  (C 코드)   │         │   (M2→S2)    │         │ (DUT)            │         │  (Slave)     │
│ (RISC-V역할)│         │              │         │                  │         │              │
└─────────────┘         └──────────────┘         └──────────────────┘         └──────────────┘
                        ADDR_BASE2 = 0x02000000
```

**주요 기능**:
- **AXI Switch 통합**: 실제 SoC 환경과 유사하게 AXI Switch를 통해 연결
- **BFM → M2 → S2 → SPI Controller**: RISC-V CPU가 BFM으로 대체되어 동일한 신호 전송
- **주소 디코딩**: AXI Switch가 주소에 따라 Slave 2 (SPI Controller)로 라우팅
  - `ADDR_BASE2 = 0x0200_0000` (SPI Controller)
  - Master 2 (BFM)의 트래픽만 Slave 2로 전달
- **MISO 강제 Toggle**: RX_DATA state에서 MISO 신호를 강제로 toggle하여 테스트
  - Step 1: RX_DATA state 감지 후 강제 toggle 패턴 생성
  - `spi_state_out` 신호로 SPI master의 state 모니터링
- **디버깅 기능**:
  - SPI master state 출력 (`spi_state_out`)
  - MISO 강제 toggle 모니터링
  - AXI 트랜잭션 및 SPI 트랜잭션 로깅

**사용 시나리오**:
- AXI Switch를 통한 실제 SoC 환경 테스트
- SPI AXI Controller의 AXI Switch 연결 검증
- MISO 신호 동작 단계별 디버깅

---

### 3. `cosim_bfm_axi_full.sv` (BFM 래퍼)
**역할**: AXI4-Full BFM 인터페이스 래퍼 모듈

**구조**:
```
┌─────────────────────┐
│ cosim_bfm_axi_full  │
│   (래퍼 모듈)       │
│                     │
│  ┌───────────────┐  │
│  │ cosim_bfm_axi │  │  ← 실제 BFM 코어 (DPI/VPI)
│  │   (DPI/VPI)   │  │
│  └───────────────┘  │
└─────────────────────┘
```

**주요 기능**:
- C 코드(DPI/VPI)와 Verilog 간 인터페이스 제공
- AXI4-Full 프로토콜 신호 래핑
- `cosim_bfm_axi` 코어 모듈 인스턴스화
- 파라미터화된 AXI 버스 폭 지원
  - `AXI_WIDTH_ID`: ID 비트 폭 (기본값: 4)
  - `AXI_WIDTH_ADDR`: 주소 비트 폭 (기본값: 32)
  - `AXI_WIDTH_DATA`: 데이터 비트 폭 (기본값: 32)

**인터페이스**:
- AXI4-Full Master 포트 (쓰기 채널: AW, W, B / 읽기 채널: AR, R)
- General Purpose I/O (`gpout`, `gpin`, `irq`)
- 코시뮬레이션 채널 ID (`COSIM_CHAN_ID`)

**사용 시나리오**:
- 모든 BFM 기반 테스트벤치에서 사용
- C 코드와 Verilog 간 통신 브릿지 역할

---

### 4. `mfrc522_model.sv` (SPI 슬레이브 모델)
**역할**: MFRC522 RFID 칩의 SPI 슬레이브 동작 모델

**구조**:
```
SPI Master (SPI Controller)  ←→  MFRC522 Model (Slave)
      │                                │
      ├─── CS_N (Chip Select) ────────┤
      ├─── SCK (Clock) ───────────────┤
      ├─── MOSI (Master Out) ─────────┤
      └─── MISO (Master In) ◄─────────┘
```

**주요 기능**:
- SPI Mode 0 (CPOL=0, CPHA=0) 지원
- MFRC522 레지스터 모델 (128개 레지스터, 0x00~0x7F)
- SPI Read/Write 트랜잭션 처리
  - 주소 바이트 수신 (MSB = R/W bit, 하위 7비트 = 주소)
  - 데이터 바이트 읽기/쓰기
- 디버그 신호 제공
  - `last_addr`: 마지막 접근 레지스터 주소
  - `last_data`: 마지막 읽기/쓰기 데이터
  - `last_rw`: 마지막 동작 (0=Write, 1=Read)

**내부 레지스터**:
- `0x37`: Version register (0x91 = MFRC522 v2.0)
- `0x01`: Command register
- `0x07`: Status register
- `0x0C`: Control register
- `0x09`: FIFO Data register
- `0x0A`: FIFO Level register

**사용 시나리오**:
- SPI 통신 프로토콜 검증
- MFRC522와의 통신 테스트
- SPI 마스터 로직 검증

---

## 파일 간 관계

```
┌─────────────────────────────────────────────────────────────┐
│                      C 코드 (main.c)                         │
│              bfm_write(), bfm_read() API                    │
└──────────────────┬──────────────────────────────────────────┘
                   │ DPI/VPI 통신
                   ▼
┌─────────────────────────────────────────────────────────────┐
│              cosim_bfm_axi_full.sv                          │
│         (BFM 래퍼, AXI4-Full 인터페이스)                    │
└──────────────────┬──────────────────────────────────────────┘
                   │ AXI 버스
                   ▼
        ┌──────────▼──────────┐
        │  top_bfm.sv          │
        │ (AXI Switch 포함)   │
        └──────────┬──────────┘
                   │ AXI Switch
                   ▼
┌─────────────────────────────────────────────────────────────┐
│              spi_axi_controller (DUT)                       │
│         (AXI4-Full → SPI 인터페이스 변환)                   │
└──────────────────┬──────────────────────────────────────────┘
                   │ SPI 버스
                   ▼
┌─────────────────────────────────────────────────────────────┐
│              mfrc522_model.sv                               │
│         (SPI Slave, MFRC522 모델)                           │
└─────────────────────────────────────────────────────────────┘
```

---

## 각 테스트벤치 선택 가이드

| 테스트벤치 | 사용 시기 | 장점 | 단점 |
|-----------|----------|------|------|
| `top_bfm.sv` | SPI AXI Controller 테스트 및 MISO 디버깅 | AXI Switch 통합, 실제 환경과 유사, MISO 강제 toggle 지원 | 직접 제어 복잡 |

---

## 코시뮬레이션 동작 흐름

1. **C 코드 실행** (`c.cosim/src/main.c`):
   - `bfm_open()`: BFM 채널 열기
   - `bfm_write()`: AXI 쓰기 트랜잭션 생성
   - `bfm_read()`: AXI 읽기 트랜잭션 생성

2. **DPI/VPI 호출**:
   - C 코드에서 DPI 함수 호출
   - Verilog 시뮬레이터로 신호 전달

3. **BFM 처리** (`cosim_bfm_axi_full.sv`):
   - DPI 신호를 AXI 버스 신호로 변환
   - AXI 프로토콜 준수하여 트랜잭션 생성

4. **테스트벤치 라우팅** (`top_bfm.sv`):
   - AXI 트랜잭션을 SPI AXI Controller로 전달
   - AXI Switch가 있는 경우 주소 디코딩 및 라우팅

5. **DUT 처리** (`spi_axi_controller`):
   - AXI 트랜잭션을 SPI 프로토콜로 변환
   - SPI 마스터로 MFRC522와 통신

6. **슬레이브 응답** (`mfrc522_model.sv`):
   - SPI 트랜잭션 처리
   - 레지스터 읽기/쓰기 수행
   - MISO 신호를 통해 데이터 반환

7. **응답 전달**:
   - DUT → BFM → DPI → C 코드로 응답 전달

---

## 참고사항

1. **Makefile 사용**: `sim.cosim/xsim/Makefile`에서 적절한 테스트벤치 선택
   - `top_bfm.sv`: 직접 테스트
   - `top_bfm.sv`: AXI Switch를 통한 통합 테스트

2. **디버깅**:
   - Waveform 파일: `wave_bfm.vcd`
   - 로그 메시지: `$display()` 출력 확인
   - 트랜잭션 모니터링: `top_bfm.sv`의 모니터링 블록 참고

3. **확장성**:
   - 새로운 테스트벤치는 `top_bfm.sv` 기반으로 생성 가능
   - MFRC522 모델 대신 다른 SPI 슬레이브 모델로 교체 가능

