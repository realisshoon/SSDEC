# I2C Master Read 동작 프로세스 설명

## 개요
I2C Master는 두 가지 Read 방식을 지원합니다:
1. **Sequential Read (Current Address Read)**: 이전 Write 동작에서 설정된 주소에서 읽기
2. **Random Read**: 특정 메모리 주소를 지정하여 읽기

---

## 1. Sequential Read (Current Address Read)

### 상태 전이도
```
idle → start → r_d_addr → r_d_addr_a → r_data → r_data_a → r_data (반복) → stop → idle
```

### 상태별 상세 동작

#### 1.1 `r_d_addr` (State 8)
**목적**: Device Address + R/W=1 (Read) 전송

**입력 데이터**:
- `mem[0][7:1]`: Device Address (7-bit)
- `mem[0][0]`: R/W bit (1 = Read)

**동작**:
- `counter_data`: 7 → 6 → ... → 0 (MSB first)
- SCL Low일 때: `sda_out_next = mem[0][counter_data]` (비트 출력)
- SCL High일 때: Slave가 샘플링
- 8비트 전송 완료 후 (`counter_data == 0`): `state_flag = 1`
- 다음 상태: `r_d_addr_a`

**신호 변화**:
```
SCL: Low → High → Low → High → ... (8번 반복)
SDA: mem[0][7] → mem[0][6] → ... → mem[0][0] (MSB first)
```

#### 1.2 `r_d_addr_a` (State 9)
**목적**: Slave의 ACK 수신

**동작**:
- SCL High일 때: `sda_i == 0` 확인 (ACK)
- ACK 수신 시: `ack_flag = 1`
- `page_flag` 설정: `mem[0][17] == 0`이면 `page_flag = 1` (단일 바이트 읽기)
- 다음 상태: `r_data`

**신호 변화**:
```
SCL: Low → High (ACK 클럭)
SDA: High-Z (Slave가 Low로 구동, ACK)
```

#### 1.3 `r_data` (State 10)
**목적**: Slave로부터 데이터 읽기 (8비트)

**데이터 샘플링** (별도 always 블록, `posedge clk`):
```verilog
if (state == r_data && scl == 1 && counter_half && data_flag == 1) begin
    mem[2][counter_data + (counter_page * 8)] <= sda_i;
end
```

**동작**:
- `counter_data`: 7 → 6 → ... → 0 (MSB first)
- SCL High일 때: `sda_i` 샘플링 → `mem[2][counter_data]`에 저장
- SCL Low일 때: SDA를 High-Z로 유지 (Slave가 구동)
- 8비트 읽기 완료 후: `state_flag = 1`
- ACK/NACK 출력:
  - `page_flag == 1`: NACK (High-Z) - 읽기 종료
  - `page_flag == 0`: ACK (Low) - 다음 바이트 읽기
- 다음 상태: `r_data_a`

**신호 변화**:
```
SCL: Low → High → Low → High → ... (8번 반복)
SDA: Slave가 구동 (데이터 비트)
     - MSB: mem[2][7]에 저장
     - LSB: mem[2][0]에 저장
```

#### 1.4 `r_data_a` (State 11)
**목적**: ACK/NACK 전송 후 다음 동작 결정

**동작**:
- `page_flag == 1` (단일 바이트):
  - ACK 전송 후 `stop` 상태로 전이
- `page_flag == 0` (다중 바이트):
  - `counter_page < 3`: 다음 바이트 읽기 (`r_data`로 복귀)
  - `counter_page >= 3`: 마지막 바이트, `page_flag = 1` 설정 후 `r_data`로 복귀

**신호 변화**:
```
SCL: Low → High (ACK 클럭)
SDA: 
  - ACK: Low (Master가 구동)
  - NACK: High-Z (Master가 해제)
```

---

## 2. Random Read

### 상태 전이도
```
idle → start → rr_w_d_addr → rr_w_d_addr_a → rr_w_w_addr → rr_w_w_addr_a 
→ rr_start → rr_r_d_addr → rr_r_d_addr_a → rr_r_data → rr_r_data_a 
→ rr_r_data (반복) → stop → idle
```

### 상태별 상세 동작

#### 2.1 `rr_w_d_addr` (State 12)
**목적**: 첫 번째 트랜잭션 - Device Address + R/W=0 (Write) 전송

**입력 데이터**:
- `mem[0][7:1]`: Device Address (7-bit)
- `mem[0][0]`: R/W bit (0 = Write, Random Read 모드에서 강제)

**동작**:
- `counter_data`: 7 → 6 → ... → 0 (MSB first)
- SCL Low일 때: 
  - `counter_data == 0`: `sda_out_next = ~mem[0][0]` (R/W=0 강제)
  - `counter_data != 0`: `sda_out_next = mem[0][counter_data]` (Device Address)
- 8비트 전송 완료 후: `state_flag = 1`
- 다음 상태: `rr_w_d_addr_a`

**신호 변화**:
```
SCL: Low → High → Low → High → ... (8번 반복)
SDA: mem[0][7] → mem[0][6] → ... → ~mem[0][0] (R/W=0)
```

#### 2.2 `rr_w_d_addr_a` (State 13)
**목적**: Slave의 ACK 수신

**동작**:
- SCL High일 때: `sda_i == 0` 확인 (ACK)
- ACK 수신 시: `ack_flag = 1`
- 다음 상태: `rr_w_w_addr`

**신호 변화**:
```
SCL: Low → High (ACK 클럭)
SDA: High-Z (Slave가 Low로 구동, ACK)
```

#### 2.3 `rr_w_w_addr` (State 14)
**목적**: Memory Address (Word Address) 전송

**입력 데이터**:
- `mem[0][15:8]`: Memory Address (8-bit)

**동작**:
- `counter_data`: 7 → 6 → ... → 0 (MSB first)
- SCL Low일 때: `sda_out_next = mem[0][counter_data + 8]` (Memory Address 비트)
- 8비트 전송 완료 후: `state_flag = 1`
- 다음 상태: `rr_w_w_addr_a`

**신호 변화**:
```
SCL: Low → High → Low → High → ... (8번 반복)
SDA: mem[0][15] → mem[0][14] → ... → mem[0][8] (MSB first)
```

#### 2.4 `rr_w_w_addr_a` (State 15)
**목적**: Slave의 ACK 수신 및 Repeated START 준비

**동작**:
- SCL High일 때: `sda_i == 0` 확인 (ACK)
- ACK 수신 시: `ack_flag = 1`
- SCL Low일 때: SDA를 High로 설정 (Repeated START 준비)
- 다음 상태: `rr_start`

**신호 변화**:
```
SCL: Low → High (ACK 클럭)
SDA: High-Z (Slave가 Low로 구동, ACK) → High (Master가 해제)
```

#### 2.5 `rr_start` (State 16)
**목적**: Repeated START 조건 생성

**동작**:
- SCL High일 때: `sda_out_next = 0` (START 조건: SCL High, SDA High→Low)
- SCL Low일 때: Device Address 비트 출력 시작
- 다음 상태: `rr_r_d_addr`

**신호 변화**:
```
SCL: High (유지)
SDA: High → Low (START 조건)
```

#### 2.6 `rr_r_d_addr` (State 17)
**목적**: 두 번째 트랜잭션 - Device Address + R/W=1 (Read) 전송

**입력 데이터**:
- `mem[0][7:1]`: Device Address (7-bit)
- R/W bit: 1 (Read, 강제)

**동작**:
- `counter_data`: 7 → 6 → ... → 0 (MSB first)
- SCL Low일 때:
  - `counter_data == 0`: `sda_out_next = 1'b1` (R/W=1 강제)
  - `counter_data != 0`: `sda_out_next = mem[0][counter_data]` (Device Address)
- 8비트 전송 완료 후: `state_flag = 1`
- 다음 상태: `rr_r_d_addr_a`

**신호 변화**:
```
SCL: Low → High → Low → High → ... (8번 반복)
SDA: mem[0][7] → mem[0][6] → ... → 1 (R/W=1)
```

#### 2.7 `rr_r_d_addr_a` (State 18)
**목적**: Slave의 ACK 수신

**동작**:
- SCL High일 때: `sda_i == 0` 확인 (ACK)
- ACK 수신 시: `ack_flag = 1`
- `page_flag` 설정: `mem[0][17] == 0`이면 `page_flag = 1` (단일 바이트 읽기)
- 다음 상태: `rr_r_data`

**신호 변화**:
```
SCL: Low → High (ACK 클럭)
SDA: High-Z (Slave가 Low로 구동, ACK)
```

#### 2.8 `rr_r_data` (State 19)
**목적**: Slave로부터 데이터 읽기 (8비트)

**데이터 샘플링** (별도 always 블록, `posedge clk`):
```verilog
if (state == rr_r_data && scl == 1 && counter_half && data_flag == 1) begin
    mem[2][counter_data + (counter_page * 8)] <= sda_i;
end
```

**동작**:
- `counter_data`: 7 → 6 → ... → 0 (MSB first)
- SCL High일 때: `sda_i` 샘플링 → `mem[2][counter_data]`에 저장
- SCL Low일 때: SDA를 High-Z로 유지 (Slave가 구동)
- 8비트 읽기 완료 후: `state_flag = 1`
- ACK/NACK 출력:
  - `page_flag == 1`: NACK (High-Z) - 읽기 종료
  - `page_flag == 0`: ACK (Low) - 다음 바이트 읽기
- 다음 상태: `rr_r_data_a`

**신호 변화**:
```
SCL: Low → High → Low → High → ... (8번 반복)
SDA: Slave가 구동 (데이터 비트)
     - MSB: mem[2][7]에 저장
     - LSB: mem[2][0]에 저장
```

#### 2.9 `rr_r_data_a` (State 20)
**목적**: ACK/NACK 전송 후 다음 동작 결정

**동작**:
- `page_flag == 1` (단일 바이트):
  - ACK 전송 후 `stop` 상태로 전이
- `page_flag == 0` (다중 바이트):
  - `counter_page < 3`: 다음 바이트 읽기 (`rr_r_data`로 복귀)
  - `counter_page >= 3`: 마지막 바이트, `page_flag = 1` 설정 후 `rr_r_data`로 복귀

**신호 변화**:
```
SCL: Low → High (ACK 클럭)
SDA: 
  - ACK: Low (Master가 구동)
  - NACK: High-Z (Master가 해제)
```

---

## 3. 데이터 흐름 및 메모리 매핑

### 3.1 입력 데이터 (`mem[0]` - i2c_ctrl)
```
mem[0][31]: START trigger (1 = 트랜잭션 시작)
mem[0][30:18]: Reserved
mem[0][17]: Page mode (0 = 단일 바이트, 1 = 페이지 모드)
mem[0][16]: Random Read mode (0 = Sequential, 1 = Random)
mem[0][15:8]: Memory Address (Random Read용)
mem[0][7:1]: Device Address (7-bit)
mem[0][0]: R/W bit (Sequential Read용, Random Read에서는 무시됨)
```

### 3.2 출력 데이터 (`mem[2]` - rdata)
```
mem[2][7:0]: 첫 번째 바이트 (counter_page = 0)
mem[2][15:8]: 두 번째 바이트 (counter_page = 1)
mem[2][23:16]: 세 번째 바이트 (counter_page = 2)
mem[2][31:24]: 네 번째 바이트 (counter_page = 3)
```

### 3.3 데이터 샘플링 타이밍
- **샘플링 시점**: SCL High, `counter_half` (SCL High 구간의 중간)
- **저장 위치**: `mem[2][counter_data + (counter_page * 8)]`
- **비트 순서**: MSB first (counter_data: 7 → 0)

---

## 4. 상태 전이 조건

### 4.1 Sequential Read 시작
```verilog
if (mem[0][31] == 1 && mem[0][0] == 1 && mem[0][16] == 0) begin
    // start → r_d_addr
end
```

### 4.2 Random Read 시작
```verilog
if (mem[0][31] == 1 && mem[0][0] == 1 && mem[0][16] == 1) begin
    // start → rr_w_d_addr
end
```

### 4.3 읽기 완료 조건
- 단일 바이트: `page_flag == 1` → `stop` 상태
- 다중 바이트: `counter_page >= 3` → `page_flag = 1` → `stop` 상태

---

## 5. 주요 신호 및 변수

### 5.1 제어 신호
- `data_flag`: 데이터 전송/수신 중 플래그 (1 = 전송 중)
- `ack_flag`: ACK 수신 플래그 (1 = ACK 수신)
- `state_flag`: 상태 내 단계 구분 플래그
- `page_flag`: 페이지 모드 종료 플래그 (1 = 마지막 바이트)

### 5.2 카운터
- `counter_data`: 비트 카운터 (7 → 0, MSB first)
- `counter_page`: 바이트 카운터 (0 → 3, 페이지 모드)
- `counter`: SCL 클럭 카운터
- `counter_half`: SCL High 구간의 중간 시점
- `counter_clr`: SCL 클럭 카운터 클리어 시점

### 5.3 클럭 및 데이터
- `scl`: I2C 클럭 신호
- `sda_i`: SDA 입력 (Slave → Master)
- `sda_o`: SDA 출력 (Master → Slave, 항상 0)
- `sda_t`: SDA 트라이스테이트 제어 (1 = High-Z, 0 = Low)
- `sda_out`: 내부 SDA 제어 신호 (1 = High-Z, 0 = Low)

---

## 6. 문제점 및 해결 방법

### 6.1 Random Read R/W 비트 문제
**문제**: Random Read의 첫 번째 트랜잭션에서 R/W=0 (Write)이어야 하는데, `control_reg[1]`이 Read로 설정되어 있음

**해결**: `i2c_axi_lite_if.v`에서 Random Read 모드일 때 R/W 비트를 0 (Write)으로 강제
```verilog
assign i2c_dev_addr = (control_reg[2] == 1'b1) ? 
                      {dev_addr_reg[7:1], 1'b0} :  // Random Read: Write
                      (control_reg[1] ? 
                       {dev_addr_reg[7:1], 1'b1} :  // Read
                       {dev_addr_reg[7:1], 1'b0});  // Write
```

### 6.2 두 번째 트랜잭션 R/W 비트 문제
**문제**: Random Read의 두 번째 트랜잭션에서 R/W=1 (Read)이어야 하는데, `mem[0][0]`이 0 (Write)으로 설정되어 있음

**해결**: `rr_r_d_addr` 상태에서 `counter_data == 0`일 때 R/W=1로 강제
```verilog
if (counter_data == 0) begin
    sda_out_next = 1'b1;  // R/W = 1 (Read)
end
```

### 6.3 데이터 샘플링 타이밍
**문제**: 데이터 샘플링이 `counter_half` 시점에 이루어지는데, 이 시점이 안정적인지 확인 필요

**해결**: SCL High 구간의 중간(`counter_half`)에서 샘플링하여 안정적인 타이밍 확보

---

## 7. 디버깅 팁

### 7.1 상태 확인
- `state[4:0]`: 현재 상태 확인
- `nxt[4:0]`: 다음 상태 확인
- `i2c_master_idle`: I2C Master가 idle 상태인지 확인

### 7.2 데이터 확인
- `mem[0]`: 입력 제어 데이터 확인
- `mem[2]`: 읽은 데이터 확인
- `rdata`: 최종 출력 데이터 확인

### 7.3 신호 확인
- `scl`: I2C 클럭 신호 확인
- `sda_i`, `sda_o`, `sda_t`: SDA 신호 확인
- `data_flag`, `ack_flag`, `state_flag`: 제어 플래그 확인

---

## 8. 참고 사항

### 8.1 I2C 프로토콜 규칙
- **START 조건**: SCL High, SDA High→Low
- **STOP 조건**: SCL High, SDA Low→High
- **데이터 샘플링**: SCL High일 때
- **데이터 변경**: SCL Low일 때
- **ACK**: SDA Low (구동)
- **NACK**: SDA High (High-Z, 풀업)

### 8.2 오픈 드레인
- I2C는 오픈 드레인 방식
- `sda_out = 1`: High-Z (풀업으로 High)
- `sda_out = 0`: Low (구동)

### 8.3 비트 순서
- MSB first (Most Significant Bit first)
- `counter_data`: 7 → 6 → ... → 0

---

## 9. 코드 위치

### 9.1 상태 정의
- 파일: `i2c_master_ver2.v`
- 라인: 48-67

### 9.2 Sequential Read
- `r_d_addr`: 라인 551-583
- `r_d_addr_a`: 라인 586-606
- `r_data`: 라인 609-648
- `r_data_a`: 라인 651-687

### 9.3 Random Read
- `rr_w_d_addr`: 라인 692-720
- `rr_w_d_addr_a`: 라인 723-740
- `rr_w_w_addr`: 라인 743-765
- `rr_w_w_addr_a`: 라인 768-784
- `rr_start`: 라인 787-802
- `rr_r_d_addr`: 라인 805-838
- `rr_r_d_addr_a`: 라인 841-860
- `rr_r_data`: 라인 863-902
- `rr_r_data_a`: 라인 905-941

### 9.4 데이터 샘플링
- 파일: `i2c_master_ver2.v`
- 라인: 305-319 (Sequential Read), 290-298 (Random Read)

