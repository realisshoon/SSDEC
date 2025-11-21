#include <stdio.h>
#include <stdint.h>
#include "i2c_api.h"

// 간단한 I2C EEPROM(24xx 계열 가정) 읽기/쓰기 예제
//  - dev7  : 7-bit device address (예: 0x50)
//  - word  : 8-bit word/offset address
//  - write : DATA1에 데이터를 쓰고, DATA0에 control + START 비트를 써서 트랜잭션 시작
//  - read  : control에 읽기 플래그를 세팅하고, DATA2에서 결과를 읽어옴

int test(void)
{
    uint8_t  dev7  = 0x50;          // I2C 디바이스 7-bit 주소 예제
    uint8_t  word  = 0x00;          // 워드/오프셋 주소
    uint32_t wdata = 0x11223344;    // 쓸 데이터 (최대 4바이트)
    uint32_t rdata;

    printf("---- I2C CSR dump ----\n");
    i2c_csr();
    printf("I2C base addr : 0x%08X\n", i2c_get_addr());

    // 1) I2C WRITE 트랜잭션
    printf("\n[I2C WRITE]\n");
    printf("  dev7=0x%02X word=0x%02X data=0x%08X\n", dev7, word, wdata);

    // DATA1(write buffer)에 데이터 쓰기
    i2c_write_data(wdata);

    // DATA0(control)에 트랜잭션 정보 + START 비트 설정
    // is_read = 0 (write), random = 0, page = 0
    i2c_start_simple(dev7,
                     word,
                     0 /* is_read: write */,
                     0 /* random */,
                     0 /* page */);

    printf("  write transaction issued.\n");

    // 2) I2C READ 트랜잭션
    //    실제 디바이스 특성에 따라 status polling, random read 등이 필요할 수 있음.
    printf("\n[I2C READ]\n");
    printf("  dev7=0x%02X word=0x%02X\n", dev7, word);
    // is_read = 1 (read), random = 0, page = 0
    i2c_start_simple(dev7,
                     word,
                     1 /* is_read: read */,
                     0 /* random */,
                     0 /* page */);

    // I2C 트랜잭션이 완료될 때까지 대기
    // 실제 하드웨어에서는 상태 레지스터를 폴링해야 하지만,
    // 시뮬레이션에서는 간단히 지연 시간을 두거나 상태 확인
    volatile int i;
    for (i = 0; i < 5000000; i++); // I2C 트랜잭션 완료를 위한 충분한 지연
    
    // 단순 예제: 바로 DATA2를 읽어서 값 확인
    rdata = i2c_read_data();
    printf("  read data   : 0x%08X\n", rdata);

    // 트랜잭션 이후 CSR 상태 다시 덤프 (DATA0/1/STATUS/DATA2 값 확인용)
    printf("\n---- I2C CSR dump after transactions ----\n");
    i2c_csr();

    printf("\nI2C cosim test done.\n");
    fflush(stdout);  // 출력 버퍼 플러시
    return 0;
}


