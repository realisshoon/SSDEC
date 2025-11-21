# I2C 타이밍 검증 가이드

## 개요
I2C 프로토콜의 타이밍 규격을 검증하기 위한 방법을 설명합니다.

## 검증 방법

### 1. 자동 타이밍 체크 모듈 사용

`i2c_timing_checker.sv` 모듈이 자동으로 다음을 검증합니다:

#### START 조건 검증
- **조건**: SCL=HIGH일 때 SDA가 HIGH→LOW로 전환
- **검증 항목**:
  - `tSU_STA`: START 조건 전 SCL HIGH 유지 시간 (최소 4.7μs @ 100kHz)
  - START 조건 감지 및 로깅

#### STOP 조건 검증
- **조건**: SCL=HIGH일 때 SDA가 LOW→HIGH로 전환
- **검증 항목**:
  - `tSU_STO`: STOP 조건 전 SCL HIGH 유지 시간 (최소 4.0μs @ 100kHz)
  - STOP 조건 감지 및 로깅

#### Repeated START 조건 검증
- **조건**: START와 동일 (이전 START 이후 다시 START 발생)
- **검증 항목**: Repeated START 감지 및 로깅

#### 데이터 타이밍 검증
- **데이터 변경**: SCL이 LOW일 때만 허용 (START/STOP 제외)
- **데이터 샘플링**: SCL rising edge에서 수행
- **검증 항목**:
  - SCL HIGH 중 SDA 변경 시 경고
  - `tSU_DAT`: 데이터 설정 시간 (최소 250ns @ 100kHz)

#### SCL 클럭 검증
- **tLOW**: SCL LOW 시간 (최소 4.7μs @ 100kHz)
- **tHIGH**: SCL HIGH 시간 (최소 4.0μs @ 100kHz)
- **주파수**: 최대 400kHz 제한

### 2. 시뮬레이션 실행 및 로그 확인

```bash
# 시뮬레이션 실행
cd sim.cosim/xsim
make

# 로그에서 타이밍 경고 확인
grep "TIMING" xsim.log
grep "VIOLATION" xsim.log
```

**예상 출력:**
```
[TIMING] START condition detected at time 1000 ns
[TIMING] SCL rising edge at 1500 ns, SDA=0
[TIMING] SCL falling edge at 2000 ns, SDA=0
[TIMING] SDA changed to 1 at 2500 ns (SCL is LOW - OK)
[TIMING] STOP condition detected at time 5000 ns
```

**경고 예시:**
```
[TIMING VIOLATION] tSU_STA violation: 3000 ns (required: 4700 ns)
[TIMING VIOLATION] SDA changed while SCL is HIGH at 3500 ns
```

### 3. VCD 웨이브폼 분석

#### GTKWave 사용
```bash
# VCD 파일 열기
gtkwave wave.vcd

# 확인할 신호:
# - scl, sda
# - u_i2c.u_i2c.state (상태 머신)
# - u_i2c.u_i2c.counter (타이밍 카운터)
```

#### 확인 포인트

1. **START 조건 확인**
   - SCL이 HIGH인 상태에서 SDA가 HIGH→LOW로 전환되는지 확인
   - SCL HIGH 유지 시간이 충분한지 확인

2. **STOP 조건 확인**
   - SCL이 HIGH인 상태에서 SDA가 LOW→HIGH로 전환되는지 확인
   - SCL HIGH 유지 시간이 충분한지 확인

3. **Repeated START 확인**
   - Random Read 시퀀스에서 START → ... → Repeated START → ... → STOP
   - Repeated START가 올바른 타이밍에 발생하는지 확인

4. **데이터 전송 확인**
   - SCL LOW 중에만 SDA가 변경되는지 확인
   - SCL rising edge에서 데이터가 안정적인지 확인

5. **ACK 확인**
   - 9번째 클럭 사이클에서 SDA가 LOW로 풀다운되는지 확인
   - ACK 타이밍이 올바른지 확인

### 4. 수동 타이밍 측정

#### Verilog 코드에 타이밍 측정 추가

```verilog
// 예시: START 조건 타이밍 측정
real start_scl_high_time;
real start_sda_fall_time;

always @(posedge scl) begin
    if (sda_prev == 1'b1 && sda == 1'b0) begin
        start_scl_high_time = $realtime;
        $display("START: SCL HIGH time before START = %0t ns", 
                 start_scl_high_time - last_scl_high_time);
    end
end
```

### 5. 테스트 케이스 작성

#### 기본 테스트 시퀀스

1. **Byte Write 타이밍 테스트**
   ```c
   // test.c에 추가
   i2c_start_simple(0x50, 0x00, 0, 0, 0);  // Write
   // 타이밍 체크: START → DevAddr → WordAddr → Data → STOP
   ```

2. **Random Read 타이밍 테스트**
   ```c
   i2c_start_simple(0x50, 0x00, 1, 1, 0);  // Random Read
   // 타이밍 체크: START → DevAddr(W) → WordAddr → Repeated START → DevAddr(R) → Data → STOP
   ```

3. **Page Write 타이밍 테스트**
   ```c
   i2c_write_data(0x11223344);
   i2c_start_simple(0x50, 0x00, 0, 0, 1);  // Page Write
   // 타이밍 체크: 여러 바이트 전송 시 ACK 타이밍 확인
   ```

### 6. 타이밍 파라미터 조정

`i2c_timing_checker.sv`에서 I2C 클럭 주파수에 맞게 파라미터 조정:

```systemverilog
// 100kHz 기준
localparam real tHD_STA = 4000.0;  // 4.0μs
localparam real tSU_STA = 4700.0;  // 4.7μs
localparam real tSU_STO = 4000.0;  // 4.0μs
localparam real tLOW    = 4700.0;  // 4.7μs
localparam real tHIGH   = 4000.0;  // 4.0μs

// 400kHz 기준 (더 빠른 클럭)
localparam real tHD_STA = 600.0;   // 0.6μs
localparam real tSU_STA = 600.0;   // 0.6μs
localparam real tSU_STO = 600.0;   // 0.6μs
localparam real tLOW    = 1300.0;  // 1.3μs
localparam real tHIGH   = 600.0;  // 0.6μs
```

### 7. 문제 해결

#### START/STOP 조건이 감지되지 않는 경우
1. VCD에서 SCL과 SDA의 실제 타이밍 확인
2. `i2c_core.v`의 `start` 및 `stop` 상태 로직 확인
3. `counter_half`와 `counter_clr` 타이밍 확인

#### 타이밍 위반이 발생하는 경우
1. `Hz_counter` 파라미터 확인 (I2C 클럭 주파수 설정)
2. `counter` 로직이 올바른 주기를 생성하는지 확인
3. 실제 클럭 주파수와 설정값이 일치하는지 확인

#### Repeated START가 올바르게 동작하지 않는 경우
1. `rr_start` 상태에서 SDA 제어 로직 확인
2. SCL HIGH 상태에서 SDA High→Low 전환이 올바른지 확인
3. 이전 트랜잭션의 STOP이 완료되었는지 확인

## 검증 체크리스트

- [ ] START 조건이 올바른 타이밍에 발생하는가?
- [ ] STOP 조건이 올바른 타이밍에 발생하는가?
- [ ] Repeated START가 올바르게 동작하는가?
- [ ] 데이터는 SCL LOW 중에만 변경되는가?
- [ ] SCL 주기가 스펙 범위 내인가?
- [ ] ACK 타이밍이 올바른가?
- [ ] 모든 타이밍 파라미터가 스펙을 만족하는가?

## 참고 자료

- I2C Specification (NXP)
- AT24C EEPROM Datasheet
- `i2c_core.v`: I2C 코어 구현
- `i2c_timing_checker.sv`: 타이밍 검증 모듈

