# 🔐 RISC-V 기반 Door Lock 시스템

---

## 📋 프로젝트 정보

| 항목 | 내용 |
|------|------|
| **프로젝트명** | RISC-V 기반 보안 접근 제어 플랫폼 (Door Lock System) |
| **개발 기간** | 2024.09.29 ~ 2024.11.28 (9주) |
| **개발 인원** | 2명 (팀 프로젝트) |
| **플랫폼** | Xilinx ZedBoard (Zynq-7000 SoC FPGA) |
| **GitHub** | [프로젝트 링크] |

---

## 🎯 프로젝트 개요

본 프로젝트는 **FPGA 기반 SoC 설계**를 통해 **RISC-V 프로세서 코어**와 **AXI-Lite Bus** 표준에 따른 다양한 Peripheral(GPIO, UART, I²C, SPI 등)을 통합하여 **HW/SW Co-design 기반의 Door Lock 보안 시스템**을 구현한 프로젝트입니다.

RFID 카드 인증과 키패드 비밀번호 입력의 **2단계 인증 방식**을 적용하여 보안성을 강화하였으며, EEPROM을 통한 영구 데이터 저장 및 실시간 인증 피드백 시스템을 구현했습니다.

---

## 💡 개발 동기 및 목표

### 개발 동기
- 임베디드 시스템 및 디지털 회로 설계 역량 강화 필요
- SoC 아키텍처 및 버스 프로토콜(AXI) 이해
- Hardware-Software Co-design 실전 경험 축적
- 실생활 적용 가능한 보안 시스템 구현

### 프로젝트 목표
1. **SoC 아키텍처 및 Co-design 역량 확보**
   - RISC-V Core와 AXI-Lite Bus를 활용한 시스템 통합 아키텍처 구축
   - Peripheral FSM/Register Map 설계 및 제어 → HW/SW 공동 설계 능력 배양

2. **핵심 Peripheral RTL 구현**
   - GPIO, UART, I²C 등 필수 임베디드 Peripheral RTL 직접 설계
   - EEPROM 활용 데이터 저장/관리 로직 구현

3. **시스템 검증 및 신뢰성 확보**
   - Testbench 기반 시뮬레이션 및 FPGA 포팅
   - Door Lock 로직의 기능적 신뢰성 확보, 디버깅 경험 축적

4. **추가 확장 기능 구현**
   - RFID 인증(SPI): 카드 UID 기반 인증 기능 추가
   - 오디오 출력(I²S/PWM): 인증 성공/실패에 따른 효과음 출력

---

## ✨ 주요 기능

### 1. 2단계 인증 시스템
- **1단계**: RFID 카드 인증 (SPI 통신)
- **2단계**: 키패드 비밀번호 입력 (GPIO)
- EEPROM에 저장된 카드 UID 및 비밀번호와 비교 인증

### 2. 보안 정책
- 3회 이상 실패 시 **Lockdown 모드** 진입
- 관리자 모드를 통한 비밀번호 초기화 기능 (UART)

### 3. 실시간 피드백
- **LED**: 접근 허가/거부 상태 표시
- **UART**: PC를 통한 디버그 로그 출력
- **오디오**: 인증 성공/실패 효과음 재생 (확장)

### 4. 데이터 영구 저장
- I²C EEPROM을 통한 비밀번호 및 카드 UID 저장
- 전원 차단 후에도 데이터 유지

---

## 🛠️ 사용 기술 스택

### Hardware
- **FPGA**: Xilinx Zynq-7000 SoC (ZedBoard)
- **Processor**: RISC-V RV32IM Core (5-stage Pipeline)
- **Bus Protocol**: AMBA AXI4-Lite
- **HDL**: Verilog, SystemVerilog

### Peripherals (직접 설계)
- **GPIO**: 키패드 입력 및 LED 제어
- **UART**: Debug Console 및 Status 출력
- **I²C Master**: EEPROM(AT24C) 제어
- **SPI Master**: RFID Reader(RC522) 통신
- **Timer**: 시스템 타이머
- **PIC**: Interrupt Controller

### Development Tools
- **EDA Tool**: Xilinx Vivado 2021.2
- **Simulation**: Xilinx Vivado Simulator, Icarus Verilog
- **Toolchain**: RISC-V GCC Toolchain
- **OS**: Ubuntu 22.04
- **Version Control**: Git/GitHub

### Software
- **Language**: C (Firmware)
- **Build System**: Make
- **Co-simulation**: DPI/VPI (BFM Library)

---

## 🏗️ 시스템 아키텍처

### 전체 시스템 구조

```
┌─────────────────────────────────────────────────────────────┐
│                         AXI Switch                           │
│                       (Crossbar)                             │
└─────────────────────────────────────────────────────────────┘
       ↑          ↑              ↑              ↓        ↓
   RISC-V        BFM          AXI Data        MEM      Bridge
   Core         (Test)       Interface      (RAM)      (AXI4→Lite)
  (RV32IM)                                                 ↓
                                              ┌────────────────────┐
                                              │  AXI-Lite Bus      │
                                              └────────────────────┘
                                     ↓     ↓      ↓      ↓      ↓
                                   PIC  Timer  UART  GPIO   I2C
                                                       ↓      ↓
                                                  Keypad  EEPROM
                                                    LED
```

### 메모리 맵

| 주소 | Peripheral | 설명 |
|------|-----------|------|
| `0x9000_0000` | **PIC** | Programmable Interrupt Controller |
| `0x9001_0000` | **Timer** | System Timer |
| `0x9002_0000` | **UART** | Debug Console / Status Output |
| `0x9003_0000` | **I2C** | EEPROM Controller (비밀번호 저장) |
| `0x9004_0000` | **GPIO** | Keypad Input / LED Output |
| `0x4xxx_xxxx` | **SPI** | RFID Reader (via AXI Switch s2) |

---

## 👨‍💻 담당 역할 및 기여도

### 본인 담당 역할
- **I²C Master Peripheral RTL 설계 및 구현** (100%)
  - FSM 기반 I²C 프로토콜 구현 (Start → Addr → Data R/W → Stop)
  - EEPROM(AT24C) Write/Read 로직 구현
  - Busy/ACK 신호 처리 및 Register Map 설계

- **Door Lock FSM 설계 및 통합** (50%)
  - 상태 기반 인증 로직 설계: Idle → Input → Compare → Granted/Denied
  - 3회 실패 시 Lockdown 모드 구현
  - 각 Peripheral 제어 신호 통합

- **RISC-V Firmware 개발** (60%)
  - I²C EEPROM Driver 개발
  - Keypad 스캔 코드 해석 로직
  - UART Debug 출력 인터페이스

- **System 통합 및 검증** (50%)
  - AXI-Lite Bus 연결 검증
  - FPGA 통합 테스트 및 디버깅
  - 최종 시스템 시연 시나리오 구성

### 팀원 역할
- GPIO Peripheral 설계 및 구현
- SPI Master 설계 및 RFID 통신
- UART Peripheral 설계
- 시스템 문서화 및 발표 자료 작성

---

## 📅 개발 과정 (Timeline)

### Phase 1: 기획 및 설계 (1-2주차)
- 요구사항 분석 및 기능 정의
- Use Case Diagram 작성
- Peripheral 선정 및 역할 분담
- 블록 다이어그램 및 시스템 아키텍처 설계
- RISC-V 플랫폼 분석 및 IP 파악

### Phase 2: RTL 설계 및 시뮬레이션 (3-4주차)
- I²C Master RTL 설계
  - FSM 상태 천이 설계
  - SCL/SDA 신호 생성 로직
  - Register Interface 구현
- GPIO RTL 설계 (팀원)
- Testbench 작성 및 시뮬레이션 검증
- 파형 분석 및 디버깅

### Phase 3: FPGA 검증 (5주차)
- Vivado Synthesis 실행
- Pin Mapping 및 Constraints 설정
- Implementation (Place & Route)
- Timing Analysis 및 최적화
- 개별 Peripheral FPGA 검증
  - GPIO: Keypad 입력 → LED 반응 확인
  - UART: PC ↔ FPGA 문자 송수신 확인
  - I²C: EEPROM Write/Read 테스트

### Phase 4: Firmware 개발 및 통합 (6주차)
- RISC-V Firmware 개발
  - I²C EEPROM Driver API 설계
  - Keypad 스캔 코드 해석
  - UART Debug 로그 출력
- Door Lock FSM 통합
- EEPROM 비밀번호 저장/검증 로직
- HW/SW Co-verification

### Phase 5: 시스템 통합 및 시연 (7주차)
- 전체 시스템 통합 테스트
- 시나리오별 동작 검증
  - 정상 인증 (RFID + 비밀번호 일치)
  - 인증 실패 (비밀번호 불일치)
  - Lockdown 모드 (3회 이상 실패)
- DR-II 발표 및 FPGA 실연
- 최종 보고서 작성

### Phase 6: 확장 기능 구현 (8-9주차, 선택)
- SPI Master 설계 및 RFID 통신 구현
- I²S/PWM 오디오 출력 구현
- DR-III 최종 발표

---

## 🔧 기술적 도전과 해결

### 1. I²C 타이밍 이슈
**문제**
- EEPROM Write 후 즉시 Read 시 ACK 신호 수신 실패
- I²C 스펙상 Write Cycle Time (5ms) 미준수

**해결**
```verilog
// Write 후 대기 FSM 추가
case (state)
    WRITE_DONE: begin
        wait_counter <= wait_counter + 1;
        if (wait_counter >= WRITE_WAIT_CYCLES) begin
            state <= IDLE;
            wait_counter <= 0;
        end
    end
endcase
```
- Write 완료 후 충분한 대기 시간(5ms) 확보
- Busy 플래그를 통한 Write 완료 확인 로직 추가

### 2. AXI-Lite Bus 인터페이스 오동작
**문제**
- CPU에서 Peripheral Register 접근 시 간헐적으로 응답 없음
- AWREADY/WREADY 신호 타이밍 문제

**해결**
```verilog
// Handshake 신호 동기화
always @(posedge clk) begin
    if (AWVALID && AWREADY && WVALID && WREADY) begin
        // Write 트랜잭션 동시 완료 보장
        reg_write_enable <= 1'b1;
    end
end
```
- AXI-Lite 프로토콜 상 AWVALID/WVALID 동시 어서션 규칙 준수
- 상태 기계를 통한 명확한 핸드셰이크 순서 정의

### 3. Keypad 채터링 (Chattering) 현상
**문제**
- 키 입력 시 여러 번 눌린 것으로 인식
- 기계식 스위치 특성상 발생하는 바운싱 현상

**해결**
```c
// 소프트웨어 디바운싱
#define DEBOUNCE_DELAY 50000  // 50ms

uint8_t read_keypad_debounced() {
    uint8_t key1 = read_keypad();
    delay_us(DEBOUNCE_DELAY);
    uint8_t key2 = read_keypad();
    
    return (key1 == key2) ? key1 : 0xFF;  // 불일치 시 무효
}
```
- 소프트웨어 디바운싱 로직 추가 (50ms 딜레이)
- 두 번의 샘플링 값이 일치할 때만 유효 입력으로 인정

### 4. RFID 카드 인식 불안정
**문제**
- SPI 통신 속도 불일치로 카드 UID 읽기 실패
- RC522 모듈의 클럭 요구사항 미준수

**해결**
```verilog
// SPI Clock Divider 조정
parameter SPI_CLK_DIV = 8;  // 100MHz → 12.5MHz
// RC522 최대 10MHz 지원, 여유 있게 설정

always @(posedge clk) begin
    if (spi_clk_counter == SPI_CLK_DIV-1) begin
        spi_clk_counter <= 0;
        spi_clk <= ~spi_clk;
    end else begin
        spi_clk_counter <= spi_clk_counter + 1;
    end
end
```
- SPI 클럭 주파수를 RC522 스펙에 맞게 조정 (10MHz 이하)
- 데이터 샘플링 시점 최적화 (클럭 에지 기준)

---

## 📊 프로젝트 성과

### 기능 구현 완성도
- ✅ **필수 기능**: 100% 구현 완료
  - RISC-V Core 통합
  - AXI-Lite Bus 인터페이스
  - GPIO (Keypad/LED)
  - UART (Debug Console)
  - I²C (EEPROM 제어)
  
- ✅ **확장 기능**: 80% 구현
  - SPI (RFID 인증) - 완료
  - I²S (오디오 출력) - 부분 완료

### 검증 결과
- **시뮬레이션**: 모든 Peripheral 개별 검증 완료
- **FPGA 실증**: 2단계 인증 시스템 정상 동작 확인
- **성공률**: 카드 인증 98%, 비밀번호 인증 100%

### 정량적 성과
- **RTL 코드**: 약 5,000 lines (Verilog/SystemVerilog)
- **Firmware**: 약 1,200 lines (C)
- **개발 기간**: 9주 (계획 대비 100% 준수)
- **리소스 사용률**:
  - LUTs: 15,234 / 53,200 (28%)
  - FFs: 8,921 / 106,400 (8%)
  - BRAM: 24 / 140 (17%)

---

## 🎓 배운 점 및 회고

### 기술적 성장
1. **SoC 아키텍처 이해**
   - AXI 버스 프로토콜의 실무적 이해
   - Memory-Mapped IO 설계 경험
   - 멀티 마스터/슬레이브 시스템 통합 역량

2. **RTL 설계 능력 향상**
   - FSM 기반 복잡한 프로토콜 구현 경험
   - 타이밍 제약 및 동기화 이슈 해결
   - Testbench 작성 및 디버깅 능력 향상

3. **HW/SW Co-design 경험**
   - Hardware Register Interface 설계
   - Device Driver 개발 경험
   - Bare-metal Firmware 프로그래밍

### 프로젝트 관리
- **협업**: Git을 통한 버전 관리 및 코드 리뷰
- **문서화**: 체계적인 README 및 기술 문서 작성
- **일정 관리**: 주차별 목표 설정 및 진행률 추적

### 아쉬운 점 및 개선 방향
1. **테스트 자동화 부족**
   - 개선 방향: CI/CD 파이프라인 구축, 자동화된 Regression Test

2. **전력 최적화 미고려**
   - 개선 방향: Clock Gating, Power Domain 분리

3. **확장성 고려 부족**
   - 개선 방향: 모듈화 개선, Parameterizable Design

---

## 📂 관련 링크

- **GitHub Repository**: [링크 추가]
- **시연 영상**: [링크 추가]
- **발표 자료**: [링크 추가]
- **기술 블로그**: [링크 추가]

---

## 📸 프로젝트 이미지

### 시스템 구조도
![시스템 아키텍처](docs/images/image.png)

### 시연 화면
- [FPGA 보드 사진]
- [시리얼 콘솔 로그]
- [동작 시연 영상]

---

## 📌 Keywords

`#RISC-V` `#FPGA` `#SoC` `#Verilog` `#SystemVerilog` `#AXI-Lite` 
`#Embedded` `#RTL-Design` `#Door-Lock` `#I2C` `#SPI` `#UART` `#GPIO`
`#Hardware-Software-Codesign` `#Xilinx` `#Vivado`

---

**Last Updated**: 2024.11.13

