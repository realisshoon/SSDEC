# I2C EEPROM 비밀번호 저장/읽기 기능

## 개요

I2C EEPROM을 사용하여 비밀번호를 저장하고 읽을 수 있는 기능을 제공합니다.

## 비밀번호 저장 영역

- **비밀번호 데이터**: EEPROM 주소 0x00-0x0F (최대 16바이트)
- **비밀번호 길이**: EEPROM 주소 0x10 (1바이트)

## API 함수

### 1. 비밀번호 저장
```c
int i2c_password_write(const uint8_t *password, uint8_t len);
```
- **기능**: EEPROM에 비밀번호 저장
- **매개변수**:
  - `password`: 비밀번호 데이터 포인터
  - `len`: 비밀번호 길이 (최대 16바이트)
- **반환값**: 0 (성공), -1 (실패)

### 2. 비밀번호 읽기
```c
int i2c_password_read(uint8_t *password, uint8_t *len);
```
- **기능**: EEPROM에서 비밀번호 읽기
- **매개변수**:
  - `password`: 비밀번호를 저장할 버퍼 포인터
  - `len`: 읽은 비밀번호 길이를 저장할 포인터 (출력)
- **반환값**: 0 (성공), -1 (실패)

### 3. 비밀번호 검증
```c
int i2c_password_verify(const uint8_t *password, uint8_t len);
```
- **기능**: 입력된 비밀번호와 저장된 비밀번호 비교
- **매개변수**:
  - `password`: 검증할 비밀번호 데이터 포인터
  - `len`: 비밀번호 길이
- **반환값**: 1 (일치), 0 (불일치), -1 (에러)

### 4. 비밀번호 변경
```c
int i2c_password_change(const uint8_t *old_password, uint8_t old_len,
                        const uint8_t *new_password, uint8_t new_len);
```
- **기능**: 기존 비밀번호를 검증한 후 새 비밀번호로 변경
- **매개변수**:
  - `old_password`: 기존 비밀번호 데이터 포인터
  - `old_len`: 기존 비밀번호 길이
  - `new_password`: 새 비밀번호 데이터 포인터
  - `new_len`: 새 비밀번호 길이
- **반환값**: 0 (성공), -1 (실패: 기존 비밀번호 불일치 또는 저장 실패)

## 사용 예제

### 비밀번호 저장
```c
#include "i2c_api.h"

uint8_t password[] = "MyPassword123";
uint8_t len = 12;

// I2C 주소 설정
i2c_set_addr(0x90040000);

// 비밀번호 저장
if (i2c_password_write(password, len) == 0) {
    // 저장 성공
} else {
    // 저장 실패
}
```

### 비밀번호 검증
```c
uint8_t input_password[] = "MyPassword123";
uint8_t input_len = 12;

// 비밀번호 검증
int result = i2c_password_verify(input_password, input_len);
if (result == 1) {
    // 비밀번호 일치
} else if (result == 0) {
    // 비밀번호 불일치
} else {
    // 에러 발생
}
```

### 비밀번호 변경
```c
uint8_t old_password[] = "MyPassword123";
uint8_t new_password[] = "NewPass456";

// 비밀번호 변경
if (i2c_password_change(old_password, 12, new_password, 9) == 0) {
    // 변경 성공
} else {
    // 변경 실패 (기존 비밀번호 불일치 또는 저장 실패)
}
```

## 테스트벤치

테스트벤치 (`bench/verilog/top.v`)에서 다음 테스트를 수행합니다:

1. **비밀번호 저장 테스트**: 비밀번호를 EEPROM에 저장
2. **비밀번호 읽기 테스트**: 저장된 비밀번호 읽기
3. **비밀번호 검증 테스트 (올바른 비밀번호)**: 올바른 비밀번호로 검증
4. **비밀번호 검증 테스트 (잘못된 비밀번호)**: 잘못된 비밀번호로 검증 (거부 확인)
5. **비밀번호 변경 테스트**: 비밀번호 변경 및 검증

## 실행 방법

```bash
cd codes/riscv_platform/riscv32im_soc/ips/i2c_axi_lite/bench
make clean
make run
```

## 주의사항

1. **비밀번호 길이**: 최대 16바이트까지 저장 가능
2. **EEPROM 쓰기 시간**: 각 바이트 쓰기 후 약 5ms 대기 시간 필요
3. **보안**: 실제 응용에서는 비밀번호를 평문으로 저장하지 않고 해시값을 저장하는 것을 권장합니다.

## 레지스터 맵

I2C AXI-Lite 레지스터 맵:
- `0x00`: CONTROL_REG - [0]: START, [1]: R/W (0=Write, 1=Read)
- `0x04`: DEV_ADDR_REG - [7:0]: Device Address (AT24C02 = 0x50)
- `0x08`: MEM_ADDR_REG - [7:0]: Memory Address (0x00-0xFF)
- `0x0C`: WR_DATA_REG - [7:0]: Write Data
- `0x10`: RD_DATA_REG - [7:0]: Read Data (읽기 전용)
- `0x14`: STATUS_REG - [0]: BUSY, [1]: ERROR

## 파일 구조

- `api/c/i2c_api.h`: API 헤더 파일
- `api/c/i2c_api.c`: API 구현 파일
- `bench/verilog/top.v`: 테스트벤치
- `bench/verilog/tester.v`: EEPROM 모델

