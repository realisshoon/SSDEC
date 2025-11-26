# MFRC522 데이터시트 정리 및 SPI 연결 가이드

## 1. MFRC522 개요

### 1.1 기본 정보
- **제품명**: MFRC522 Contactless Reader IC
- **주파수**: 13.56 MHz
- **지원 프로토콜**: ISO 14443A / MIFARE®
- **통신 거리**: 최대 50mm (안테나 크기 및 튜닝에 따라 다름)
- **전원 전압**: 2.5V ~ 3.6V (권장: 3.0V 이상)

### 1.2 주요 기능
- ISO/IEC 14443A / MIFARE® 모드 지원
- MIFARE® Classic 암호화 지원
- 고속 통신 지원 (최대 848 kbit/s)
- 64바이트 송수신 FIFO 버퍼
- 내부 CRC 코프로세서
- 하드웨어 리셋 및 소프트웨어 파워다운 모드
- 내부 자가 테스트 기능

### 1.3 지원 인터페이스
- **SPI**: 최대 10 Mbit/s
- **I²C**: 최대 400 kbit/s (Fast mode), 최대 3400 kbit/s (High-speed mode)
- **UART**: 최대 1228.8 kbit/s (RS232 호환)

---

## 2. SPI 인터페이스 연결 가이드

### 2.1 SPI 핀 구성

MFRC522는 SPI 인터페이스를 위해 다음 핀을 사용합니다:

| 핀 이름 | 설명 | 역할 |
|--------|------|------|
| **SDA** | Serial Data | SPI 데이터 입출력 (MOSI/MISO) |
| **SCK** | Serial Clock | SPI 클럭 신호 |
| **NSS** | Slave Select | 칩 셀렉트 (Active Low) |
| **MOSI** | Master Out Slave In | 마스터 → 슬레이브 데이터 |
| **MISO** | Master In Slave Out | 슬레이브 → 마스터 데이터 |

**참고**: 일부 보드에서는 SDA가 MOSI/MISO로 사용되거나, 별도의 핀으로 분리될 수 있습니다.

### 2.2 SPI 연결 시 주의사항

#### 2.2.1 전원 공급
- **AVDD, DVDD, TVDD**: 2.5V ~ 3.6V (동일한 전압 레벨 유지 필수)
- **PVDD**: 1.6V ~ 3.6V (AVDD 이하 또는 동일)
- **SVDD**: 1.6V ~ 3.6V (MFIN/MFOUT용)
- **전류 소비**:
  - 디지털 전원: 6.5 ~ 9 mA (DVDD)
  - 아날로그 전원: 7 ~ 10 mA (AVDD, 수신기 ON)
  - 트랜스미터: 60 ~ 100 mA (TVDD, 연속파)

#### 2.2.2 클럭 신호
- **최대 SPI 클럭**: 10 Mbit/s
- **오실레이터**: 27.12 MHz 크리스탈 필요
- **클럭 안정화**: 오실레이터 시작 시간 고려 필요

#### 2.2.3 리셋 신호
- **NRESET**: 하드웨어 리셋 (Active Low)
- **리셋 타이밍**: 데이터시트 Section 17.1 참조
- **소프트웨어 리셋**: SoftReset 명령 사용 가능

### 2.3 SPI 통신 프로토콜

#### 2.3.1 주소 바이트 형식
SPI 통신 시 주소 바이트는 다음과 같은 형식을 가집니다:

```
Bit 7: MSB (항상 0)
Bit 6-1: 레지스터 주소 (6비트)
Bit 0: 읽기/쓰기 플래그 (0=쓰기, 1=읽기)
```

**예시**:
- 읽기: `0x80 | (주소 << 1) | 0x01`
- 쓰기: `0x80 | (주소 << 1) | 0x00`

#### 2.3.2 데이터 읽기
1. NSS를 LOW로 설정
2. 주소 바이트 전송 (읽기 플래그 설정)
3. 더미 바이트 전송 (데이터 수신을 위해)
4. 실제 데이터 수신
5. NSS를 HIGH로 설정

#### 2.3.3 데이터 쓰기
1. NSS를 LOW로 설정
2. 주소 바이트 전송 (쓰기 플래그 설정)
3. 데이터 바이트 전송
4. NSS를 HIGH로 설정

### 2.4 SPI 타이밍 요구사항

데이터시트 Section 23.8에 명시된 SPI 타이밍:
- **설정 시간(Setup Time)**: 최소 요구사항 확인 필요
- **유지 시간(Hold Time)**: 최소 요구사항 확인 필요
- **클럭 폴라리티**: CPOL, CPHA 설정 확인 필요
- **NSS 활성화**: 데이터 전송 전 NSS LOW, 전송 후 HIGH

### 2.5 초기화 순서

1. **전원 공급 확인**
   - 모든 전원 핀에 적절한 전압 공급
   - 전원 안정화 대기 (권장: 10ms 이상)

2. **하드웨어 리셋**
   - NRESET 핀을 LOW로 설정
   - 최소 100ns 유지
   - HIGH로 복귀
   - 오실레이터 안정화 대기 (권장: 1ms)

3. **소프트웨어 리셋**
   - SoftReset 명령 실행
   - 리셋 완료 대기

4. **인터페이스 모드 설정**
   - CommandReg에 적절한 명령 전송
   - 인터페이스 자동 감지 또는 수동 설정

5. **레지스터 초기화**
   - 필요한 레지스터 값 설정
   - FIFO 버퍼 초기화

### 2.6 주요 레지스터 (SPI 통신 시 자주 사용)

| 레지스터 | 주소 | 설명 |
|---------|------|------|
| **CommandReg** | 0x01 | 명령 실행 레지스터 |
| **ComIEnReg** | 0x02 | 인터럽트 활성화 레지스터 |
| **DivIEnReg** | 0x03 | 디바이더 인터럽트 활성화 |
| **ComIrqReg** | 0x04 | 인터럽트 요청 레지스터 |
| **DivIrqReg** | 0x05 | 디바이더 인터럽트 요청 |
| **ErrorReg** | 0x06 | 에러 레지스터 |
| **Status1Reg** | 0x07 | 상태 레지스터 1 |
| **Status2Reg** | 0x08 | 상태 레지스터 2 |
| **FIFODataReg** | 0x09 | FIFO 데이터 레지스터 |
| **FIFOLevelReg** | 0x0A | FIFO 레벨 레지스터 |
| **ControlReg** | 0x0C | 제어 레지스터 |
| **BitFramingReg** | 0x0D | 비트 프레이밍 레지스터 |
| **CollReg** | 0x0E | 충돌 레지스터 |
| **ModeReg** | 0x11 | 모드 레지스터 |
| **TxControlReg** | 0x14 | 송신 제어 레지스터 |
| **RxControlReg** | 0x19 | 수신 제어 레지스터 |

### 2.7 주요 명령어

| 명령 | 값 | 설명 |
|------|-----|------|
| **Idle** | 0x00 | 유휴 상태 |
| **Mem** | 0x01 | 메모리 전송 |
| **GenerateRandomID** | 0x02 | 랜덤 ID 생성 |
| **CalcCRC** | 0x03 | CRC 계산 |
| **Transmit** | 0x04 | 데이터 전송 |
| **NoCmdChange** | 0x07 | 명령 변경 없음 |
| **Receive** | 0x08 | 데이터 수신 |
| **Transceive** | 0x0C | 송수신 |
| **MFAuthent** | 0x0E | MIFARE 인증 |
| **SoftReset** | 0x0F | 소프트웨어 리셋 |

### 2.8 FIFO 버퍼 사용

- **크기**: 64바이트
- **읽기**: FIFODataReg를 반복 읽기
- **쓰기**: FIFODataReg를 반복 쓰기
- **레벨 확인**: FIFOLevelReg로 현재 데이터 개수 확인
- **플러시**: FIFOFlushReg 사용

### 2.9 인터럽트 처리

- **IRQ 핀**: 하드웨어 인터럽트 출력
- **ComIrqReg**: 인터럽트 상태 확인
- **주요 인터럽트 플래그**:
  - IdleIrq: 유휴 상태
  - RxIrq: 수신 완료
  - TxIrq: 송신 완료
  - ErrIrq: 에러 발생
  - TimerIrq: 타이머 만료

---

## 3. SPI 연결 체크리스트

### 하드웨어 연결
- [ ] 전원 공급 확인 (AVDD, DVDD, TVDD = 3.3V 권장)
- [ ] GND 연결 확인
- [ ] 27.12 MHz 크리스탈 연결 확인
- [ ] NRESET 핀 연결 (필요시)
- [ ] SPI 핀 연결:
  - [ ] SCK (클럭)
  - [ ] MOSI (마스터 → 슬레이브)
  - [ ] MISO (슬레이브 → 마스터)
  - [ ] NSS/CS (칩 셀렉트)
- [ ] IRQ 핀 연결 (인터럽트 사용 시)
- [ ] 안테나 연결 확인

### 소프트웨어 설정
- [ ] SPI 모드 설정 (CPOL, CPHA)
- [ ] SPI 클럭 속도 설정 (10 MHz 이하 권장)
- [ ] NSS 제어 로직 구현
- [ ] 초기화 순서 구현
- [ ] 레지스터 읽기/쓰기 함수 구현
- [ ] FIFO 버퍼 관리 구현
- [ ] 에러 처리 구현

### 테스트
- [ ] 전원 공급 확인
- [ ] 리셋 동작 확인
- [ ] 레지스터 읽기/쓰기 테스트
- [ ] VersionReg 읽기 (0x91 = MFRC522)
- [ ] 자가 테스트 실행
- [ ] 카드 감지 테스트

---

## 4. 참고 자료

- **데이터시트**: [MFRC522 Data Sheet](https://seengreat.com/upload/file/90/RC-522+FRID+HAT+Data+Sheet+MFRC522.pdf)
- **주요 섹션**:
  - Section 10.2: SPI Compatible interface
  - Section 9.2: Register descriptions
  - Section 18: MFRC522 Command Set
  - Section 12: FIFO Buffer
  - Section 14: Interrupt Request System

---

## 5. 일반적인 문제 해결

### 5.1 통신 실패
- SPI 클럭 속도 확인 (너무 빠르면 낮춤)
- NSS 타이밍 확인
- 전원 전압 확인
- GND 연결 확인

### 5.2 카드 감지 실패
- 안테나 연결 확인
- 안테나 튜닝 확인
- 전원 전압 확인 (3V 이상 권장)
- 거리 확인 (50mm 이내)

### 5.3 초기화 실패
- 리셋 타이밍 확인
- 오실레이터 안정화 시간 확인
- VersionReg 읽기로 칩 확인

---

**작성일**: 2024
**참고**: 실제 구현 시 데이터시트의 최신 버전을 확인하시기 바랍니다.

