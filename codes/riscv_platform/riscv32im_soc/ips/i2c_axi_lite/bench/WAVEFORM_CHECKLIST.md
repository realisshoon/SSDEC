# 파형 확인 체크리스트

## 1. 기본 동작 확인 (필수)

### ✅ Reset 해제
- **신호**: `aresetn`
- **확인**: 0 → 1 전환 시점 (약 0.5us 이후)
- **의미**: 리셋이 해제되어 정상 동작 시작

### ✅ Clock 동작
- **신호**: `aclk` (파형에 추가 필요)
- **확인**: 규칙적인 클록 신호 (100MHz, 주기 10ns)
- **의미**: 시스템 클록이 정상 동작

---

## 2. AXI Write 동작 확인 (필수)

### ✅ AXI Write Address 채널
- **신호**: `s_axi_awaddr[31:0]`, `s_axi_awvalid`, `s_axi_awready`
- **확인 포인트**:
  1. `s_axi_awvalid`가 1일 때 `s_axi_awready`도 1 (핸드셰이크)
  2. `s_axi_awaddr` 값 확인:
     - `0x00000004`: DEV_ADDR 레지스터
     - `0x00000008`: MEM_ADDR 레지스터
     - `0x0000000C`: WR_DATA 레지스터
     - `0x00000000`: CONTROL 레지스터

### ✅ AXI Write Data 채널
- **신호**: `s_axi_wdata[31:0]`, `s_axi_wvalid`, `s_axi_wready`
- **확인 포인트**:
  1. `s_axi_wvalid`가 1일 때 `s_axi_wready`도 1 (핸드셰이크)
  2. `s_axi_wdata` 값 확인:
     - `0x00000050`: Device Address (0x50)
     - `0x00000000`: Memory Address (0x00)
     - `0x000000AB`: Write Data (0xAB)
     - `0x00000001`: CONTROL (START=1, R/W=0)

### ✅ AXI Write Response 채널
- **신호**: `s_axi_bvalid`, `s_axi_bready`, `s_axi_bresp[1:0]`
- **확인 포인트**:
  1. `s_axi_bvalid`가 1일 때 `s_axi_bready`도 1 (핸드셰이크)
  2. `s_axi_bresp`가 `00` (OKAY)인지 확인

---

## 3. AXI Read 동작 확인 (필수)

### ✅ AXI Read Address 채널
- **신호**: `s_axi_araddr[31:0]`, `s_axi_arvalid`, `s_axi_arready`
- **확인 포인트**:
  1. `s_axi_arvalid`가 1일 때 `s_axi_arready`도 1 (핸드셰이크)
  2. `s_axi_araddr` 값 확인:
     - `0x00000014`: STATUS 레지스터 읽기
     - `0x00000010`: RD_DATA 레지스터 읽기

### ✅ AXI Read Data 채널
- **신호**: `s_axi_rdata[31:0]`, `s_axi_rvalid`, `s_axi_rready`
- **확인 포인트**:
  1. `s_axi_rvalid`가 1일 때 `s_axi_rready`도 1 (핸드셰이크)
  2. `s_axi_rdata` 값 확인:
     - STATUS 레지스터: BUSY 비트 확인
     - RD_DATA 레지스터: `0x000000AB` (읽은 데이터)

---

## 4. I2C 프로토콜 확인 (가장 중요!)

### ✅ I2C Clock (SCL)
- **신호**: `scl`
- **확인 포인트**:
  1. 규칙적인 클록 신호 (약 400kHz, 주기 2.5us)
  2. START/STOP 조건에서 SCL이 High인지 확인
  3. 데이터 전송 중 SCL이 정상 동작하는지 확인

### ✅ I2C Data (SDA)
- **신호**: `sda_line`
- **확인 포인트**:

#### 4.1 START 조건
- **확인**: SCL이 High일 때 SDA가 High → Low로 전환
- **의미**: I2C 트랜잭션 시작

#### 4.2 Device Address 전송 (Write)
- **확인**: 
  - Device Address: `0xA0` (0x50 << 1 | 0 = Write)
  - 7비트 주소: `1010000` (0x50)
  - R/W 비트: `0` (Write)
- **비트 순서**: MSB 먼저 (7 → 0)
- **의미**: EEPROM(0x50)에 Write 모드로 접근

#### 4.3 ACK 확인
- **확인**: Device Address 전송 후 SDA가 Low (ACK)
- **의미**: EEPROM이 주소를 인식함

#### 4.4 Memory Address 전송
- **확인**: `0x00` (메모리 주소)
- **비트 순서**: MSB 먼저
- **의미**: EEPROM의 메모리 주소 지정

#### 4.5 Data 전송 (Write)
- **확인**: `0xAB` (쓸 데이터)
- **비트 순서**: MSB 먼저
- **의미**: EEPROM에 데이터 쓰기

#### 4.6 STOP 조건
- **확인**: SCL이 High일 때 SDA가 Low → High로 전환
- **의미**: I2C 트랜잭션 종료

#### 4.7 Device Address 전송 (Read)
- **확인**: 
  - Device Address: `0xA1` (0x50 << 1 | 1 = Read)
  - R/W 비트: `1` (Read)
- **의미**: EEPROM에서 Read 모드로 접근

#### 4.8 Data 읽기 (Read)
- **확인**: `0xAB` (읽은 데이터)
- **비트 순서**: MSB 먼저
- **의미**: EEPROM에서 데이터 읽기

#### 4.9 NACK 확인
- **확인**: 마지막 바이트 읽은 후 SDA가 High (NACK)
- **의미**: 읽기 완료 신호

---

## 5. 내부 신호 확인 (디버깅용)

### ✅ AXI Interface 내부
- **신호**: `dut.u_i2c_axi_lite_if.*`
- **확인 포인트**:
  1. `control_reg`: CONTROL 레지스터 값
  2. `dev_addr_reg`: Device Address 레지스터 (0x50)
  3. `mem_addr_reg`: Memory Address 레지스터 (0x00)
  4. `wr_data_reg`: Write Data 레지스터 (0xAB)
  5. `rd_data_reg`: Read Data 레지스터 (읽은 데이터)
  6. `i2c_start`: START 펄스 확인
  7. `i2c_busy`: BUSY 신호 확인
  8. `write_state`: Write 상태 머신 (STW_IDLE → STW_WRITE → STW_RESP)
  9. `read_state`: Read 상태 머신 (STR_IDLE → STR_READ → STR_RESP)

### ✅ I2C Master 내부
- **신호**: `dut.u_i2c_master.*`
- **확인 포인트**:
  1. `state`: I2C 상태 머신
     - `idle` → `start` → `w_d_addr` → `w_d_addr_a` → ...
     - `idle` → `start` → `r_d_addr` → `r_d_addr_a` → `r_data` → ...
  2. `mem[0]`: Control/Address 데이터 (i2c_ctrl)
  3. `mem[1]`: Write 데이터 (wdata)
  4. `mem[2]`: Read 데이터 (rdata)
  5. `sda_out`: SDA 출력 제어
  6. `counter_data`: 비트 카운터 (7 → 0)
  7. `counter_page`: 페이지 카운터

### ✅ EEPROM 모델
- **신호**: `eeprom.*`
- **확인 포인트**:
  1. `state`: EEPROM 상태 머신
  2. `mem_addr`: 메모리 주소
  3. `bit_cnt`: 비트 카운터
  4. 메모리 내용 확인 (쓴 데이터가 저장되었는지)

---

## 6. 데이터 일관성 확인 (검증)

### ✅ Write → Read 검증
1. **Write 데이터**: `0xAB`가 `wr_data_reg`에 저장
2. **I2C Write**: `0xAB`가 EEPROM에 전송
3. **I2C Read**: EEPROM에서 `0xAB` 읽기
4. **Read 데이터**: `rd_data_reg`에 `0xAB` 저장
5. **AXI Read**: `s_axi_rdata`에서 `0xAB` 확인
6. **검증**: 쓰기 데이터와 읽기 데이터가 일치하는지 확인

---

## 7. 타이밍 확인

### ✅ AXI 타이밍
- Address와 Data 채널의 핸드셰이크가 올바른 순서로 발생
- Response가 적절한 시간 내에 반환

### ✅ I2C 타이밍
- START 조건 후 Device Address 전송
- ACK 후 Memory Address 전송
- ACK 후 Data 전송
- STOP 조건 전에 모든 데이터 전송 완료

### ✅ BUSY 신호
- `i2c_busy`가 START 시 1로 설정
- I2C 트랜잭션 완료 후 0으로 해제
- STATUS 레지스터의 BUSY 비트와 일치

---

## 8. 문제 진단

### ❌ 문제: AXI 핸드셰이크가 안 될 때
- **증상**: `s_axi_awvalid`가 1인데 `s_axi_awready`가 0
- **원인**: AXI 인터페이스 상태 머신 문제
- **확인**: `write_state`, `read_state` 확인

### ❌ 문제: I2C START 조건이 안 될 때
- **증상**: SDA가 High → Low로 전환되지 않음
- **원인**: I2C 상태 머신이 `start` 상태로 전환되지 않음
- **확인**: `dut.u_i2c_master.state` 확인

### ❌ 문제: ACK가 안 올 때
- **증상**: Device Address 전송 후 SDA가 High (NACK)
- **원인**: 
  - EEPROM 주소 불일치
  - I2C 버스 문제
  - EEPROM 모델 문제
- **확인**: `dev_addr_reg`, `eeprom.state` 확인

### ❌ 문제: 데이터가 일치하지 않을 때
- **증상**: 읽은 데이터가 쓴 데이터와 다름
- **원인**:
  - I2C Write 실패
  - I2C Read 실패
  - 메모리 주소 불일치
- **확인**: 
  - `wr_data_reg` vs `rd_data_reg`
  - `mem[1]` vs `mem[2]`
  - EEPROM 메모리 내용

---

## 9. 파형 분석 순서

1. **Reset 해제 확인** (0.5us)
2. **AXI Write 동작 확인** (레지스터 설정)
3. **I2C Write 트랜잭션 확인** (START → Address → Data → STOP)
4. **AXI Read 동작 확인** (STATUS, RD_DATA 읽기)
5. **I2C Read 트랜잭션 확인** (START → Address → Data → STOP)
6. **데이터 일관성 확인** (Write 데이터 == Read 데이터)

---

## 10. 중요한 시점

- **0.5us**: Reset 해제
- **1-2us**: AXI Write (레지스터 설정)
- **2-10us**: I2C Write 트랜잭션
- **10-12us**: AXI Read (STATUS 확인)
- **12-14us**: AXI Write (CONTROL - Read)
- **14-22us**: I2C Read 트랜잭션
- **22-24us**: AXI Read (RD_DATA 읽기)

---

## 요약

**가장 중요한 확인 포인트:**
1. ✅ AXI 핸드셰이크 정상 동작
2. ✅ I2C START/STOP 조건 정상
3. ✅ I2C Device Address 전송 및 ACK
4. ✅ I2C Data 전송 정상
5. ✅ Write 데이터와 Read 데이터 일치

이 5가지만 확인해도 I2C와 AXI-Lite가 정상 동작하는지 알 수 있습니다!

