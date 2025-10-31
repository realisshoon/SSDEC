/**
 * @file i2c_api.c
 * @brief I2C AXI-Lite API Implementation
 *
 * @author Team 2
 */
#include <stdint.h>
#include "i2c_api.h"

// Register access macros
#define CSR_READ(A, D)  do { (D) = *((volatile uint32_t*)(A)); } while(0)
#define CSR_WRITE(A, D) do { *((volatile uint32_t*)(A)) = (D); } while(0)

static uint32_t i2c_base_addr = 0x90040000;  // 기본 I2C 베이스 주소

/**
 * @brief I2C 베이스 주소 설정
 */
void i2c_set_addr(uint32_t base_addr) {
    i2c_base_addr = base_addr;
}

/**
 * @brief I2C 초기화
 */
void i2c_init(void) {
    uint32_t data;
    
    // Device address 설정 (AT24C02)
    data = EEPROM_ADDR;
    CSR_WRITE(i2c_base_addr + I2C_DEV_ADDR_REG, data);
    
    // Control register 초기화
    data = 0x00;
    CSR_WRITE(i2c_base_addr + I2C_CONTROL_REG, data);
}

/**
 * @brief BUSY 대기
 * @return 0: 성공, -1: 타임아웃
 */
int i2c_wait_ready(void) {
    uint32_t status;
    uint32_t timeout = 100000;
    
    while (timeout--) {
        CSR_READ(i2c_base_addr + I2C_STATUS_REG, status);
        if ((status & 0x01) == 0) {  // BUSY 비트가 0이면 준비됨
            return 0;
        }
    }
    
    return -1;  // 타임아웃
}

/**
 * @brief I2C 상태 레지스터 읽기
 */
uint32_t i2c_get_status(void) {
    uint32_t status;
    CSR_READ(i2c_base_addr + I2C_STATUS_REG, status);
    return status;
}

/**
 * @brief EEPROM에서 1바이트 읽기
 * @param mem_addr 메모리 주소 (0x00-0xFF)
 * @return 읽은 데이터
 */
uint8_t i2c_eeprom_read(uint8_t mem_addr) {
    uint32_t data;
    
    // Memory address 설정
    data = mem_addr;
    CSR_WRITE(i2c_base_addr + I2C_MEM_ADDR_REG, data);
    
    // Read 명령 (control[1]=1, control[0]=1)
    data = 0x03;  // START + READ
    CSR_WRITE(i2c_base_addr + I2C_CONTROL_REG, data);
    
    // BUSY 대기
    i2c_wait_ready();
    
    // 읽은 데이터 반환
    CSR_READ(i2c_base_addr + I2C_RD_DATA_REG, data);
    
    return (uint8_t)(data & 0xFF);
}

/**
 * @brief EEPROM에 1바이트 쓰기
 * @param mem_addr 메모리 주소 (0x00-0xFF)
 * @param data 쓸 데이터
 */
void i2c_eeprom_write(uint8_t mem_addr, uint8_t data) {
    uint32_t reg_data;
    
    // Memory address 설정
    reg_data = mem_addr;
    CSR_WRITE(i2c_base_addr + I2C_MEM_ADDR_REG, reg_data);
    
    // Write data 설정
    reg_data = data;
    CSR_WRITE(i2c_base_addr + I2C_WR_DATA_REG, reg_data);
    
    // Write 명령 (control[1]=0, control[0]=1)
    reg_data = 0x01;  // START + WRITE
    CSR_WRITE(i2c_base_addr + I2C_CONTROL_REG, reg_data);
    
    // BUSY 대기
    i2c_wait_ready();
    
    // EEPROM Write Cycle Time (5ms) 대기
    for (volatile uint32_t i = 0; i < 50000; i++);
}

