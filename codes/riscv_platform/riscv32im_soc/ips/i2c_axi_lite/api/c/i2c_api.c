//------------------------------------------------------------------------------
//  I2C AXI-Lite API Implementation
//  AT24C02 EEPROM 통신을 위한 I2C API
//------------------------------------------------------------------------------
//  Copyright (c) 2025
//------------------------------------------------------------------------------
#include <stdint.h>
#include "i2c_api.h"

//------------------------------------------------------------------------------
// Register access macros
#define CSR_WRITE(A, B)   *(volatile uint32_t *)(A) = (B)
#define CSR_READ(A, B)    (B) = *(volatile uint32_t *)(A)

//------------------------------------------------------------------------------
static uint32_t I2C_BASE_ADDR = 0x90040000;

// 레지스터 주소
static uint32_t I2C_CONTROL   = 0x90040000;
static uint32_t I2C_DEV_ADDR  = 0x90040004;
static uint32_t I2C_MEM_ADDR  = 0x90040008;
static uint32_t I2C_WR_DATA   = 0x9004000C;
static uint32_t I2C_RD_DATA   = 0x90040010;
static uint32_t I2C_STATUS    = 0x90040014;

//------------------------------------------------------------------------------
// 간단한 지연 함수 (약 1ms @ 100MHz)
static void delay_us(volatile uint32_t us) {
    volatile uint32_t count = us * 100;  // 클럭에 따라 조정 필요
    while (count--);
}

//------------------------------------------------------------------------------
void i2c_set_addr(uint32_t addr) {
    I2C_BASE_ADDR = addr;
    I2C_CONTROL   = addr + 0x00;
    I2C_DEV_ADDR  = addr + 0x04;
    I2C_MEM_ADDR  = addr + 0x08;
    I2C_WR_DATA   = addr + 0x0C;
    I2C_RD_DATA   = addr + 0x10;
    I2C_STATUS    = addr + 0x14;
}

//------------------------------------------------------------------------------
uint32_t i2c_get_addr(void) {
    return I2C_BASE_ADDR;
}

//------------------------------------------------------------------------------
int i2c_wait_ready(void) {
    volatile uint32_t status;
    volatile uint32_t timeout = 10000;  // 타임아웃 카운터
    
    do {
        CSR_READ(I2C_STATUS, status);
        if (!(status & I2C_STATUS_BUSY)) {
            // BUSY가 해제됨
            if (status & I2C_STATUS_ERROR) {
                return -1;  // 에러 발생
            }
            return 0;  // 성공
        }
        delay_us(10);  // 10us 대기
        timeout--;
    } while (timeout > 0);
    
    return -1;  // 타임아웃
}

//------------------------------------------------------------------------------
int i2c_eeprom_write_byte(uint8_t mem_addr, uint8_t data) {
    volatile uint32_t val;
    
    // 디바이스 주소 설정 (Write 모드)
    CSR_WRITE(I2C_DEV_ADDR, EEPROM_DEV_ADDR);
    
    // 메모리 주소 설정
    CSR_WRITE(I2C_MEM_ADDR, mem_addr);
    
    // 쓰기 데이터 설정
    CSR_WRITE(I2C_WR_DATA, data);
    
    // Write 모드로 START (Control[0]=START, Control[1]=0 for Write)
    CSR_WRITE(I2C_CONTROL, I2C_START_BIT);
    
    // I2C 작업 완료 대기
    if (i2c_wait_ready() != 0) {
        return -1;
    }
    
    // EEPROM 쓰기 사이클 대기 (약 5ms)
    delay_us(5000);
    
    return 0;
}

//------------------------------------------------------------------------------
int i2c_eeprom_read_byte(uint8_t mem_addr, uint8_t *data) {
    volatile uint32_t val;
    
    // 먼저 메모리 주소를 설정하기 위해 Write 모드로 주소 전송
    CSR_WRITE(I2C_DEV_ADDR, EEPROM_DEV_ADDR);
    CSR_WRITE(I2C_MEM_ADDR, mem_addr);
    CSR_WRITE(I2C_WR_DATA, 0);  // 더미 데이터
    CSR_WRITE(I2C_CONTROL, I2C_START_BIT);  // Write 모드로 주소 설정
    
    if (i2c_wait_ready() != 0) {
        return -1;
    }
    
    delay_us(1000);  // EEPROM 내부 처리 시간
    
    // 이제 Read 모드로 데이터 읽기
    CSR_WRITE(I2C_DEV_ADDR, EEPROM_DEV_ADDR);
    CSR_WRITE(I2C_CONTROL, I2C_START_BIT | I2C_READ_BIT);  // Read 모드
    
    if (i2c_wait_ready() != 0) {
        return -1;
    }
    
    // 읽은 데이터 가져오기
    CSR_READ(I2C_RD_DATA, val);
    *data = (uint8_t)(val & 0xFF);
    
    return 0;
}

//------------------------------------------------------------------------------
int i2c_eeprom_write_bytes(uint8_t mem_addr, const uint8_t *data, uint8_t len) {
    // AT24C02는 최대 4바이트 페이지 쓰기 지원
    if (len > 4) {
        return -1;
    }
    
    // 각 바이트를 순차적으로 쓰기 (간단한 구현)
    for (uint8_t i = 0; i < len; i++) {
        if (i2c_eeprom_write_byte(mem_addr + i, data[i]) != 0) {
            return -1;
        }
    }
    
    return 0;
}

//------------------------------------------------------------------------------
int i2c_eeprom_read_bytes(uint8_t mem_addr, uint8_t *data, uint8_t len) {
    // 각 바이트를 순차적으로 읽기
    for (uint8_t i = 0; i < len; i++) {
        if (i2c_eeprom_read_byte(mem_addr + i, &data[i]) != 0) {
            return -1;
        }
    }
    
    return 0;
}

