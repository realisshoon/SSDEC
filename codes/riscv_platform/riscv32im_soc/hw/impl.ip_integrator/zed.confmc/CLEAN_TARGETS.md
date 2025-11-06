# Makefile Clean 타겟 설명

## 타겟 종류

### 1. `make clean`
**삭제되는 것:**
- 현재 디렉토리의 `vivado.jou`, `vivado.log`
- `vivado_*.backup.jou`, `vivado_*.backup.log`
- `hs_err_*.log`
- `vivado_pid*.str`, `vivado_pid*.zip`
- **프로젝트 디렉토리 내부의 `vivado.jou`, `vivado.log` (maxdepth 5까지)**
- `.Xil/` 디렉토리
- `hd_visual/` 디렉토리

**유지되는 것:**
- `design_riscv_cache_wrapper.v`
- `design_riscv_cache_wrapper.bit`
- `design_riscv_cache_wrapper.ltx`
- `project_design_riscv_cache/` 디렉토리 전체

**용도:** 로그 파일만 정리 (빌드 결과물은 유지)

---

### 2. `make cleanup`
**삭제되는 것:**
- `make clean`에서 삭제하는 모든 것 +
- `design_riscv_cache_wrapper.v`

**유지되는 것:**
- `design_riscv_cache_wrapper.bit`
- `design_riscv_cache_wrapper.ltx`
- `project_design_riscv_cache/` 디렉토리 전체

**용도:** 로그 + wrapper 파일 정리 (비트스트림은 유지)

---

### 3. `make cleanupall`
**삭제되는 것:**
- `make cleanup`에서 삭제하는 모든 것 +
- `design_riscv_cache_wrapper.bit`
- `design_riscv_cache_wrapper.ltx`
- `design_riscv_cache.pdf`
- `AddressMap.cvs`, `AddressMapGui.csv`
- **`project_design_riscv_cache/` 디렉토리 전체** (완전 삭제)

**유지되는 것:**
- 소스 파일들 (xdc, tcl, Makefile 등)
- IP 디렉토리들

**용도:** 완전히 깨끗하게 정리 (프로젝트 재생성 필요)

---

## 프로젝트 디렉토리 (`project_design_riscv_cache/`) 내용

프로젝트 디렉토리에는 다음이 포함됩니다:
- `project_design_riscv_cache.xpr` - Vivado 프로젝트 파일
- `project_design_riscv_cache.srcs/` - 소스 파일들
- `project_design_riscv_cache.runs/` - 합성/구현 결과물
- `project_design_riscv_cache.cache/` - 캐시 파일
- `project_design_riscv_cache.gen/` - 생성된 파일들
- `project_design_riscv_cache.hw/` - 하드웨어 관련 파일
- 기타 Vivado 생성 파일들

**프로젝트 디렉토리는 `cleanupall`에서만 삭제됩니다.**

---

## 사용 예시

```bash
# 로그 파일만 정리 (빌드 결과는 유지)
make clean

# 로그 + wrapper 파일 정리 (비트스트림은 유지)
make cleanup

# 완전히 깨끗하게 정리 (모든 빌드 결과 삭제)
make cleanupall
```

---

## 주의사항

- `cleanupall`을 실행하면 프로젝트 디렉토리 전체가 삭제되므로, 다시 `make all`을 실행해야 합니다.
- 프로젝트 디렉토리는 보통 수백 MB ~ 수 GB 크기입니다.
- `clean`은 로그 파일만 삭제하므로 빠르게 실행됩니다.

