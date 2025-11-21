#include "my_printf.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>
#include <time.h>

#if defined(COSIM_LIB) && (COSIM_LIB==1)
    #include "cosim_bfm_api.h"
#elif defined(TRX_BFM) && (TRX_BFM==1)
    #include "trx_axi_api.h"
    con_Handle_t handle=NULL;
#endif

//------------------------------------------------------------------------------
// SPI AXI Controller 레지스터 정의
//------------------------------------------------------------------------------
#define SPI_BASE      0x02000000  // MEM_OFFCHIP_ADDR
#define SPI_CTRL      (SPI_BASE + 0x00)
#define SPI_ADDR      (SPI_BASE + 0x04)
#define SPI_DATA_IN   (SPI_BASE + 0x08)
#define SPI_DATA_OUT  (SPI_BASE + 0x0C)
#define SPI_STATUS    (SPI_BASE + 0x10)

//------------------------------------------------------------------------------
// MFRC522 레지스터 주소 정의
//------------------------------------------------------------------------------
#define MFRC522_REG_VERSION    0x37
#define MFRC522_REG_COMMAND    0x01
#define MFRC522_REG_FIFO_DATA  0x09
#define MFRC522_REG_FIFO_LEVEL 0x0A
#define MFRC522_REG_CONTROL    0x0C
#define MFRC522_REG_STATUS     0x07

//------------------------------------------------------------------------------
// 시뮬레이션용 DUMMY 응답 값 (mfrc522_dummy.v와 일치해야 함)
//------------------------------------------------------------------------------
#define MFRC522_DUMMY_ID       0xAA 

//------------------------------------------------------------------------------
// 전역 변수
//------------------------------------------------------------------------------
int cid     = 0;
int verbose = 0;
int rigor   = 0;
int level   = 3;

//------------------------------------------------------------------------------
// 함수 선언
//------------------------------------------------------------------------------
int get_args(int argc, char* argv[]);
void spi_write_reg(uint32_t addr, uint32_t data);
uint32_t spi_read_reg(uint32_t addr);
void spi_start_transaction(int rw, int num_bytes);
void spi_wait_done(void);
void mfrc522_write(uint8_t reg_addr, uint8_t data);
uint8_t mfrc522_read(uint8_t reg_addr);
void mfrc522_check_version(void);
void mfrc522_init(void);
void test_spi_axi(void);

//------------------------------------------------------------------------------
// SPI 컨트롤러 레지스터 쓰기
//------------------------------------------------------------------------------
void spi_write_reg(uint32_t addr, uint32_t data)
{
    uint8_t data_buf[4];
    
    // 32-bit 데이터를 바이트 배열로 변환 (little-endian)
    data_buf[0] = (data >>  0) & 0xFF;
    data_buf[1] = (data >>  8) & 0xFF;
    data_buf[2] = (data >> 16) & 0xFF;
    data_buf[3] = (data >> 24) & 0xFF;
    
    if (verbose) {
        printf("[%ld] spi_write_reg: addr=0x%08X, data=0x%08X\n", 
               (long)time(NULL), addr, data);
    }
    
    #if defined(COSIM_LIB) && (COSIM_LIB==1)
        bfm_write(addr, data_buf, 4, 1);  // 4 bytes, 1 beat
    #elif defined(TRX_BFM) && (TRX_BFM==1)
        // TRX_BFM 방식 (필요시 구현)
        printf("TRX_BFM not implemented yet\n");
    #endif
}

//------------------------------------------------------------------------------
// SPI 컨트롤러 레지스터 읽기
//------------------------------------------------------------------------------
uint32_t spi_read_reg(uint32_t addr)
{
    uint8_t data_buf[4] = {0, 0, 0, 0};
    uint32_t data;
    
    #if defined(COSIM_LIB) && (COSIM_LIB==1)
        bfm_read(addr, data_buf, 4, 1);  // 4 bytes, 1 beat
    #endif
    
    // 바이트 배열을 32-bit로 변환 (little-endian)
    data = (uint32_t)data_buf[0] | 
           ((uint32_t)data_buf[1] <<  8) |
           ((uint32_t)data_buf[2] << 16) |
           ((uint32_t)data_buf[3] << 24);
    
    if (verbose) {
        printf("[%ld] spi_read_reg: addr=0x%08X, data=0x%08X\n", 
               (long)time(NULL), addr, data);
    }
    
    return data;
}

//------------------------------------------------------------------------------
// SPI 트랜잭션 시작 (enable 비트 설정)
//------------------------------------------------------------------------------
void spi_start_transaction(int rw, int num_bytes)
{
    uint32_t ctrl_data;
    // Control register: [0]=enable, [1]=rw, [15:8]=num_bytes
    ctrl_data = ((uint32_t)num_bytes << 8) | ((uint32_t)rw << 1) | 1;
    spi_write_reg(SPI_CTRL, ctrl_data);
}

//------------------------------------------------------------------------------
// SPI 트랜잭션 완료 대기
//------------------------------------------------------------------------------
void spi_wait_done(void)
{
    uint32_t status;
    int timeout = 10000;
    
    while (timeout > 0) {
        status = spi_read_reg(SPI_STATUS);
        
        if (!(status & 0x1)) {  // busy가 0이면 완료
            if (status & 0x2) {  // done 체크
                if (status & 0x4 && verbose) {
                    printf("ERROR: SPI transaction error\n");
                }
                break;
            }
        }
        timeout--;
        // 시뮬레이션 속도를 위해 usleep은 최소화하거나 제거 가능
        // usleep(100); 
    }
    
    if (timeout == 0 && verbose) {
        printf("ERROR: SPI transaction timeout\n");
    }
    
    // Enable 비트 해제
    spi_write_reg(SPI_CTRL, 0);
}

//------------------------------------------------------------------------------
// MFRC522 레지스터 쓰기
//------------------------------------------------------------------------------
void mfrc522_write(uint8_t reg_addr, uint8_t data)
{
    uint32_t addr_to_send;

    // [중요] 실제 MFRC522 칩 통신 프로토콜:
    // Write 시 주소 포맷: (Address << 1) & 0x7E
    // RTL(하드웨어)이 이를 자동으로 처리해주지 않는다면 아래 코드를 써야 합니다.
    // addr_to_send = ((uint32_t)reg_addr << 1) & 0x7E;
    
    // 현재 시뮬레이션(Dummy)은 Raw Address(0x37 등)를 그대로 인식하도록 만들었으므로
    // 기존대로 그냥 보냅니다.
    addr_to_send = (uint32_t)reg_addr;

    // 주소 설정
    spi_write_reg(SPI_ADDR, addr_to_send);
    
    // 데이터 설정
    spi_write_reg(SPI_DATA_IN, (uint32_t)data);
    
    // 트랜잭션 시작 (Write, 1 byte)
    spi_start_transaction(0, 1);
    
    // 완료 대기
    spi_wait_done();
}

//------------------------------------------------------------------------------
// MFRC522 레지스터 읽기
//------------------------------------------------------------------------------
uint8_t mfrc522_read(uint8_t reg_addr)
{
    uint32_t read_data;
    uint32_t addr_to_send;

    // [중요] 실제 MFRC522 칩 통신 프로토콜:
    // Read 시 주소 포맷: ((Address << 1) & 0x7E) | 0x80
    // RTL(하드웨어)이 이를 자동으로 처리해주지 않는다면 아래 코드를 써야 합니다.
    // addr_to_send = (((uint32_t)reg_addr << 1) & 0x7E) | 0x80;

    // 시뮬레이션용 (Dummy Model은 Raw Address에 반응함)
    addr_to_send = (uint32_t)reg_addr;

    // 주소 설정
    spi_write_reg(SPI_ADDR, addr_to_send);
    
    // 트랜잭션 시작 (Read, 1 byte)
    spi_start_transaction(1, 1);
    
    // 완료 대기
    spi_wait_done();
    
    // 읽기 데이터 읽기
    read_data = spi_read_reg(SPI_DATA_OUT);
    
    return (uint8_t)(read_data & 0xFF);
}

//------------------------------------------------------------------------------
// [수정됨] MFRC522 버전 확인
//------------------------------------------------------------------------------
void mfrc522_check_version(void)
{
    uint8_t version;
    
    if (verbose) printf("Checking MFRC522 version...\n");
    version = mfrc522_read(MFRC522_REG_VERSION);
    
    if (verbose) printf("MFRC522 Read Result: 0x%02X\n", version);
    
    // [수정] Dummy ID (0xAA)도 정상으로 인정하도록 조건 추가
    if (verbose) {
        if (version == MFRC522_DUMMY_ID) {
            printf("SUCCESS: MFRC522 Dummy Model detected (Simulation OK)\n");
        } else if (version == 0x91 || version == 0x92) {
            printf("SUCCESS: Real MFRC522 Chip detected (0x%02X)\n", version);
        } else {
            printf("ERROR: Invalid version! (Expected: 0x91, 0x92, or 0xAA)\n");
            printf("DEBUG: Check if MISO line is connected properly in Testbench.\n");
        }
    }
}

//------------------------------------------------------------------------------
// MFRC522 초기화
//------------------------------------------------------------------------------
void mfrc522_init(void)
{
    if (verbose) printf("Initializing MFRC522...\n");
    
    // Soft Reset
    mfrc522_write(MFRC522_REG_COMMAND, 0x0F);
    // usleep(10000);  // 시뮬레이션에서는 주석 처리 가능
    
    // 버전 확인
    mfrc522_check_version();
    
    if (verbose) printf("MFRC522 initialization complete\n");
}

//------------------------------------------------------------------------------
// SPI AXI 테스트
//------------------------------------------------------------------------------
void test_spi_axi(void)
{
    uint32_t status;
    uint8_t version;
    
    if (verbose) {
        printf("========================================\n");
        printf("SPI AXI Controller Test (BFM)\n");
        printf("========================================\n");
    }
    
    // Status 레지스터 읽기 (초기 상태 확인)
    status = spi_read_reg(SPI_STATUS);
    if (verbose) printf("Initial Status: busy=%d, done=%d, error=%d\n",
           (int)(status & 0x1), (int)((status >> 1) & 0x1), (int)((status >> 2) & 0x1));
    
    // MFRC522 초기화 & 버전체크
    mfrc522_init();
    
    // Write 테스트: Control 레지스터
    if (verbose) printf("\n--- Control Register Write Test ---\n");
    mfrc522_write(MFRC522_REG_CONTROL, 0x37);
    
    // Read 테스트: 여러 레지스터 읽기 (항상 실행, verbose는 출력만 제어)
    if (verbose) printf("\n--- Register Read Test ---\n");
    
    // Version Register 읽기 (0x37) - 항상 실행
    version = mfrc522_read(MFRC522_REG_VERSION);
    if (verbose) printf("Read MFRC522_REG_VERSION (0x37): 0x%02X\n", version);
    
    // Status Register 읽기 (0x07) - 항상 실행
    uint8_t status_reg = mfrc522_read(MFRC522_REG_STATUS);
    if (verbose) printf("Read MFRC522_REG_STATUS (0x07): 0x%02X\n", status_reg);
    
    // FIFO Level 읽기 (0x0A) - 항상 실행
    uint8_t fifo_level = mfrc522_read(MFRC522_REG_FIFO_LEVEL);
    if (verbose) printf("Read MFRC522_REG_FIFO_LEVEL (0x0A): 0x%02X\n", fifo_level);
    
    // Read 결과 검증 (verbose와 무관하게 항상 검증)
    if (version != MFRC522_DUMMY_ID && version != 0x91 && version != 0x92) {
        printf("ERROR: Invalid version read: 0x%02X (Expected: 0xAA, 0x91, or 0x92)\n", version);
    }
    if (status_reg != 0x55 && status_reg != 0xAA) {
        printf("WARNING: Unexpected status value: 0x%02X\n", status_reg);
    }
    if (fifo_level != 0x55 && fifo_level != 0xAA) {
        printf("WARNING: Unexpected FIFO level value: 0x%02X\n", fifo_level);
    }
    
    if (verbose) {
        printf("\n========================================\n");
        printf("SPI AXI Controller Test Complete\n");
        printf("========================================\n");
    }
}

//------------------------------------------------------------------------------
// 메인 함수
//------------------------------------------------------------------------------
int main(int argc, char* argv[])
{
    if (get_args(argc, argv) != 0) {
        return 0;
    }
    
    #if defined(COSIM_LIB) && (COSIM_LIB==1)
        bfm_set_verbose(verbose);
        if (bfm_open(cid) != 0) {
            if (verbose) printf("ERROR: Failed to open BFM channel %d\n", cid);
            return -1;
        }
        // bfm_barrier(cid); // 필요 시 활성화
    #endif
    
    // 테스트 실행
    test_spi_axi();
    
    #if defined(COSIM_LIB) && (COSIM_LIB==1)
        bfm_close(cid);
    #endif
    
    return 0;
}

int get_args(int argc, char* argv[])
{
    for (int a = 1; a < argc; a++) {
        if ((!strcmp(argv[a], "-h")) || (!strcmp(argv[a], "-?"))) {
            printf("%s [options]\n", argv[0]);
            printf("   -cid  cid   : set communicate channel id\n");
            printf("   -v    level : set verbose level\n");
            return 1;
        } else if (!(strcmp(argv[a], "-cid"))) {
            cid = atoi(argv[++a]);
        } else if (!(strcmp(argv[a], "-v"))) {
            verbose = atoi(argv[++a]);
        }
    }
    return (0);
}