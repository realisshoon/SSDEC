# 파형 확인 가이드

## 파형 뷰어 실행 방법

### 1. GTKWave 사용 (권장)
```bash
cd bench
make wave
```

또는
```bash
./view_wave.sh
```

### 2. Vivado GUI 사용
```bash
make gui
```

## GTKWave에서 신호 추가 방법

1. **GTKWave 창이 열리면:**
   - 왼쪽 상단의 "SST" 탭을 클릭
   - `top` 모듈을 확장하여 하위 모듈 및 신호 확인

2. **주요 신호 추가:**
   
   **Clock & Reset:**
   - `top.aclk` (클록)
   - `top.aresetn` (리셋)

   **AXI Write 채널:**
   - `top.s_axi_awaddr` (주소)
   - `top.s_axi_awvalid` / `top.s_axi_awready`
   - `top.s_axi_wdata` (데이터)
   - `top.s_axi_wvalid` / `top.s_axi_wready`
   - `top.s_axi_bvalid` / `top.s_axi_bready` (응답)

   **AXI Read 채널:**
   - `top.s_axi_araddr` (주소)
   - `top.s_axi_arvalid` / `top.s_axi_arready`
   - `top.s_axi_rdata` (데이터)
   - `top.s_axi_rvalid` / `top.s_axi_rready`

   **I2C 신호:**
   - `top.scl` (I2C 클록)
   - `top.sda_line` (I2C 데이터)
   - `top.dut_sda_o` / `top.dut_sda_t` (SDA 출력 제어)

   **DUT 내부 신호 (AXI Interface):**
   - `top.dut.u_i2c_axi_lite_if.control_reg` (제어 레지스터)
   - `top.dut.u_i2c_axi_lite_if.dev_addr_reg` (디바이스 주소)
   - `top.dut.u_i2c_axi_lite_if.mem_addr_reg` (메모리 주소)
   - `top.dut.u_i2c_axi_lite_if.wr_data_reg` (쓰기 데이터)
   - `top.dut.u_i2c_axi_lite_if.rd_data_reg` (읽기 데이터)
   - `top.dut.u_i2c_axi_lite_if.i2c_start` (시작 신호)
   - `top.dut.u_i2c_axi_lite_if.i2c_busy` (Busy 신호)
   - `top.dut.u_i2c_axi_lite_if.write_state` (Write 상태 머신)
   - `top.dut.u_i2c_axi_lite_if.read_state` (Read 상태 머신)

   **DUT 내부 신호 (I2C Master):**
   - `top.dut.u_i2c_master.state` (I2C 상태 머신)
   - `top.dut.u_i2c_master.mem[0]` (제어/주소 데이터)
   - `top.dut.u_i2c_master.mem[1]` (쓰기 데이터)
   - `top.dut.u_i2c_master.mem[2]` (읽기 데이터)
   - `top.dut.u_i2c_master.sda_out` (SDA 출력)
   - `top.dut.u_i2c_master.counter_data` (비트 카운터)
   - `top.dut.u_i2c_master.counter_page` (페이지 카운터)

   **EEPROM 모델:**
   - `top.eeprom.state` (EEPROM 상태)
   - `top.eeprom.mem_addr` (메모리 주소)
   - `top.eeprom.bit_cnt` (비트 카운터)

3. **신호 추가 방법:**
   - 신호를 찾아서 더블클릭하거나
   - 신호를 선택하고 우클릭 → "Send to Waveform" 선택
   - 또는 신호를 드래그하여 Waveform 창으로 이동

4. **시간 범위 조정:**
   - Zoom In/Out: 마우스 휠 사용
   - 특정 시간으로 이동: 시간 표시줄 클릭
   - 전체 시뮬레이션 보기: "Zoom Full" 버튼 클릭

## 확인할 주요 동작

### 1. Reset 해제
- `aresetn`이 0 → 1로 변하는 시점 확인
- 시간: 약 100ns 이후

### 2. AXI Write 동작
- `s_axi_awvalid` / `s_axi_awready` 핸드셰이크
- `s_axi_wvalid` / `s_axi_wready` 핸드셰이크
- 레지스터 쓰기 확인:
  - DEV_ADDR (0x04): 0x50
  - MEM_ADDR (0x08): 0x00
  - WR_DATA (0x0C): 0xAB
  - CONTROL (0x00): 0x01 (START=1, R/W=0)

### 3. I2C Write 트랜잭션
- `i2c_start` 펄스 확인
- `i2c_busy` 신호 확인
- I2C 상태 머신 동작:
  - `state` 변화: idle → start → w_d_addr → ...
- SCL/SDA 신호 확인:
  - START 조건: SCL=High, SDA High→Low
  - Device Address 전송: 0xA0 (0x50 << 1 | 0)
  - Memory Address 전송: 0x00
  - Data 전송: 0xAB
  - ACK 신호 확인

### 4. AXI Read 동작
- `s_axi_arvalid` / `s_axi_arready` 핸드셰이크
- `s_axi_rvalid` / `s_axi_rready` 핸드셰이크
- 읽은 데이터 확인:
  - RD_DATA (0x10): 0xAB (쓴 데이터와 일치해야 함)

### 5. I2C Read 트랜잭션
- CONTROL 레지스터: 0x03 (START=1, R/W=1)
- I2C 상태 머신 동작:
  - `state` 변화: idle → start → r_d_addr → r_data → ...
- SCL/SDA 신호 확인:
  - Device Address 전송: 0xA1 (0x50 << 1 | 1)
  - 데이터 읽기: 0xAB
  - ACK/NACK 신호 확인

## 문제 해결

### 파형이 보이지 않을 때
1. VCD 파일이 생성되었는지 확인:
   ```bash
   ls -lh i2c_axi_lite.vcd
   ```

2. 시뮬레이션 재실행:
   ```bash
   make clean
   make run
   ```

### 신호를 찾을 수 없을 때
1. "SST" 탭에서 `top` 모듈 확장
2. 하위 모듈들을 확장하여 신호 탐색
3. 신호 이름으로 검색 (Ctrl+F)

### 파형이 너무 길어서 보기 어려울 때
1. Zoom In/Out 사용
2. 특정 시간 구간 선택하여 확대
3. 마커 사용하여 특정 시간 표시

## 참고

- 시뮬레이션 시간 범위: 0 ~ 265,035,000 ps (약 265 μs)
- 클록 주기: 10 ns (100 MHz)
- I2C 클록 주기: 약 1200 ns (400 kHz, Hz_counter=120)

