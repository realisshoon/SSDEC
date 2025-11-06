# Makefile 문제점 및 수정 사항

## 발견된 문제점

### 1. start.S 파일 누락
- **문제**: Makefile에서 `start.S`를 소스 파일로 지정했으나 실제 파일이 없음
- **해결**: `src/start.S` 부트 코드 파일 생성
  - 스택 포인터 초기화
  - BSS 섹션 클리어
  - main() 함수 호출

### 2. RISCV 경로 오류
- **문제**: Makefile에서 기본 RISCV 경로가 `$(HOME)/riscv32)`로 잘못 설정됨 (괄호 포함 및 잘못된 경로)
- **해결**: `.bashrc`의 `set_riscv()` 함수 참고하여 올바른 경로로 수정
  - 변경 전: `export RISCV = $(HOME)/riscv32)`
  - 변경 후: `export RISCV = $(HOME)/pjt/team2/codes/riscv32im`

### 3. start.S 주석 형식 오류
- **문제**: 어셈블리 파일에 C++ 스타일 주석(`//`) 사용 → 어셈블러가 인식하지 못함
- **해결**: 어셈블리 스타일 주석(`/* */`)으로 변경

### 4. 링커 경고 (선택적)
- **경고**: 시스템 콜 관련 undefined reference 경고 발생
- **영향**: 실제 하드웨어에서는 문제 없음 (표준 입출력 함수 미사용)
- **참고**: 필요 시 시스템 콜 스텁 구현 가능

## 수정된 파일

1. `src/start.S` - 새로 생성
2. `Makefile` - RISCV 경로 수정 (14번째 줄)

## 빌드 확인

```bash
cd codes/riscv_platform/riscv32im_soc/sw.riscv/hello_world

# 환경 변수 설정 (선택사항, .bashrc에서 set_riscv 실행 시 자동 설정)
export RISCV=/home/sogang/pjt/team2/codes/riscv32im
export PATH=$RISCV/bin:$PATH

# 빌드
make clean
make sw
```

빌드 성공 시 다음 파일들이 생성됩니다:
- `gpio_test.elf` - ELF 실행 파일
- `gpio_test.bin` - 바이너리 파일 (하드웨어/시뮬레이션용)
- `gpio_test.hex` - HEX 파일
- `gpio_test.ihex` - Intel HEX 파일

## 시뮬레이션 Makefile 확인

시뮬레이션 Makefile (`hw/sim.riscv_cache_soc/xsim/Makefile`)은 올바르게 설정되어 있습니다:
- `FILE_BIN` 기본값이 `gpio_test.bin`으로 설정됨
- `hello_world/Makefile`의 `sim` 타겟에서 절대 경로로 `FILE_BIN` 전달

