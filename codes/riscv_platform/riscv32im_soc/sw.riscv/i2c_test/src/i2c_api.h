/**
 * @file i2c_api.h
 * @brief I2C AXI-Lite API for AT24C02 EEPROM
 *
 * @author Team 2
 */
#ifndef _I2C_API_H_
#define _I2C_API_H_

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

// I2C 레지스터 오프셋
#define I2C_CONTROL_REG   0x00  // [0]: START, [1]: R/W (0=Write, 1=Read)
#define I2C_DEV_ADDR_REG  0x04  // [7:0]: Device Address
#define I2C_MEM_ADDR_REG  0x08  // [7:0]: Memory Address
#define I2C_WR_DATA_REG   0x0C  // [7:0]: Write Data
#define I2C_RD_DATA_REG   0x10  // [7:0]: Read Data
#define I2C_STATUS_REG    0x14  // [0]: BUSY, [1]: ERROR

// AT24C02 EEPROM 주소
#define EEPROM_ADDR       0x50  // 7-bit address

// API 함수
void i2c_set_addr(uint32_t base_addr);
void i2c_init(void);
uint8_t i2c_eeprom_read(uint8_t mem_addr);
void i2c_eeprom_write(uint8_t mem_addr, uint8_t data);
int i2c_wait_ready(void);
uint32_t i2c_get_status(void);

#ifdef __cplusplus
}
#endif

#endif // _I2C_API_H_

