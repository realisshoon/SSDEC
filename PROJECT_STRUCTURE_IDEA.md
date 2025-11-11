# 프로젝트 구조 분리 아이디어

## 🎯 목표
- **소스 코드**: Git 추적 ✅
- **빌드 출력**: Git 무시 ❌
- **Makefile, tcl, sh**: Git 추적 ✅

---

## 📁 추천 구조: Build 디렉토리 분리

### 현재 구조
```
sw.riscv/hello_world/
├── src/              # 소스
├── obj/              # 빌드 출력 (.o)
├── *.elf             # 빌드 출력 (현재 디렉토리)
├── *.bin             # 빌드 출력
├── *.log             # 로그 파일
├── Makefile          # ✅ 추적
└── README.md         # ✅ 추적
```

### 개선된 구조
```
sw.riscv/hello_world/
├── src/              # ✅ 소스 코드 (Git 추적)
│   ├── main.c
│   ├── *.h
│   └── *.S
├── build/            # ❌ 빌드 출력 (Git 무시)
│   ├── obj/          # .o 파일들
│   ├── bin/          # .elf, .bin 파일들
│   └── log/          # .log, .jou 파일들
├── Makefile          # ✅ 추적
├── *.tcl             # ✅ 추적
├── *.sh              # ✅ 추적
└── README.md         # ✅ 추적
```

---

## 🔧 Makefile 수정 예시

### Before
```makefile
DIR_OBJ  := obj
$(TARGET).elf: $(addprefix $(DIR_OBJ)/,$(OBJS))
	$(HOST)-ld -o $@ $^ $(LDFLAGS)
```

### After
```makefile
# Build directories
BUILD_DIR := build
OBJ_DIR   := $(BUILD_DIR)/obj
BIN_DIR   := $(BUILD_DIR)/bin
LOG_DIR   := $(BUILD_DIR)/log

# Create directories
DUMMY := $(shell mkdir -p $(OBJ_DIR) $(BIN_DIR) $(LOG_DIR))

# Object files in build/obj/
$(OBJ_DIR)/%.o: %.c
	$(HOST)-gcc -c $(CFLAGS) $(INCS) -o $@ $< 2>&1 | tee -a $(LOG_DIR)/compile.log

# Executables in build/bin/
$(BIN_DIR)/$(TARGET).elf: $(addprefix $(OBJ_DIR)/,$(OBJS))
	$(HOST)-ld -o $@ $^ $(LDFLAGS)

# Convenience: create symlink in current dir (optional)
$(TARGET).elf: $(BIN_DIR)/$(TARGET).elf
	ln -sf $(BIN_DIR)/$(TARGET).elf $@
```

---

## 📝 .gitignore 전략

### 방법 A: 디렉토리 기반 (간단)
```gitignore
# Build outputs
**/build/
**/obj/
**/project_*/
**/xsim.dir/
**/.Xil/

# Log files
*.log
*.jou
*.wdb
*.vcd

# Executables
*.elf
*.bin
*.hex

# But always track source
!**/src/**/*
!**/rtl/**/*
!**/api/**/*
!**/Makefile
!**/*.tcl
!**/*.sh
```

### 방법 B: 파일 타입 기반 (세밀)
```gitignore
# ============================================
# 소스 코드는 항상 추적
# ============================================
!**/rtl/**/*.v
!**/rtl/**/*.sv
!**/src/**/*.c
!**/src/**/*.h
!**/api/**/*.c
!**/api/**/*.h

# ============================================
# 스크립트는 항상 추적
# ============================================
!**/Makefile
!**/*.tcl
!**/*.sh

# ============================================
# 빌드 출력 무시
# ============================================
*.elf
*.bin
*.hex
*.log
*.jou
*.wdb
*.vcd
*.o
*.a

# 빌드 디렉토리
**/build/
**/obj/
**/project_*/
**/xsim.dir/
```

---

## 🚀 마이그레이션 단계

### Step 1: .gitignore 업데이트
```bash
# build/ 디렉토리 추가
echo "**/build/" >> .gitignore
echo "**/obj/" >> .gitignore
```

### Step 2: Makefile 수정
각 프로젝트의 Makefile에서:
1. `DIR_OBJ := obj` → `OBJ_DIR := build/obj`
2. 출력 경로를 `build/bin/`으로 변경
3. 로그를 `build/log/`로 리다이렉트

### Step 3: 기존 빌드 파일 정리
```bash
# 기존 빌드 파일 삭제
find . -name "*.elf" -delete
find . -name "*.bin" -delete
find . -name "obj" -type d -exec rm -rf {} +
```

### Step 4: 테스트
```bash
# 빌드 테스트
make clean
make sw

# 확인: build/ 디렉토리에만 파일 생성되는지
ls -la build/
```

---

## 💡 추가 아이디어

### 아이디어 A: 공통 Makefile 설정
```makefile
# common.mk
BUILD_DIR ?= build
OBJ_DIR   ?= $(BUILD_DIR)/obj
BIN_DIR   ?= $(BUILD_DIR)/bin
LOG_DIR   ?= $(BUILD_DIR)/log

# 각 Makefile에서
include ../../common.mk
```

### 아이디어 B: 환경 변수로 제어
```makefile
# Makefile
BUILD_DIR ?= build
ifdef CI
  BUILD_DIR := /tmp/build  # CI에서는 임시 디렉토리
endif
```

### 아이디어 C: 빌드 아티팩트 아카이브
```makefile
# 빌드 결과를 별도 저장소나 아티팩트 서버에 업로드
.PHONY: archive
archive:
	tar czf build-artifacts-$(TARGET)-$(DATE).tar.gz $(BIN_DIR)/
	# Upload to artifact server
```

---

## ✅ 장단점 비교

| 방법 | 장점 | 단점 |
|------|------|------|
| **아이디어 1** (build/ 분리) | ✅ 깔끔한 분리<br>✅ .gitignore 간단 | ⚠️ Makefile 수정 필요 |
| **아이디어 2** (상위 build/) | ✅ 완전 분리<br>✅ 일관성 | ⚠️ 대규모 리팩토링 필요 |
| **아이디어 3** (스마트 .gitignore) | ✅ 기존 구조 유지<br>✅ 빠른 적용 | ⚠️ .gitignore 복잡 |
| **아이디어 4** (Makefile 변수) | ✅ 유연성<br>✅ 환경별 제어 | ⚠️ 모든 Makefile 수정 |

---

## 🎯 최종 추천

**아이디어 1 (Build 디렉토리 분리) + 아이디어 3 (스마트 .gitignore)**

1. **단기**: .gitignore로 소스만 추적 (즉시 적용 가능)
2. **장기**: Makefile을 점진적으로 수정하여 `build/` 디렉토리 사용

이렇게 하면:
- ✅ 즉시 적용 가능 (gitignore만 수정)
- ✅ 점진적 개선 가능 (Makefile은 나중에)
- ✅ 팀원들에게 영향 최소화

