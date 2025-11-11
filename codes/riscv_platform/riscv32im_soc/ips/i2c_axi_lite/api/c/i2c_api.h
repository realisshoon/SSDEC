//------------------------------------------------------------------------------
//  I2C AXI-Lite API Header
//  AT24C02 EEPROM 통신을 위한 I2C API
//------------------------------------------------------------------------------
//  Copyright (c) 2025
//------------------------------------------------------------------------------
#pragma once
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

// I2C 레지스터 오프셋
#define I2C_CONTROL_REG   0x00  // [0]: START, [1]: R/W (0=Write, 1=Read)
#define I2C_DEV_ADDR_REG  0x04  // [7:0]: Device Address
#define I2C_MEM_ADDR_REG  0x08  // [7:0]: Memory Address
#define I2C_WR_DATA_REG  0x0C  // [7:0]: Write Data
#define I2C_RD_DATA_REG  0x10  // [7:0]: Read Data
#define I2C_STATUS_REG    0x14  // [0]: BUSY, [1]: ERROR

// AT24C02 EEPROM 디바이스 주소
#define EEPROM_DEV_ADDR   0x50  // A0=A1=A2=GND

// I2C 제어 비트
#define I2C_START_BIT     0x01  // Control[0]: START
#define I2C_READ_BIT      0x02  // Control[1]: R/W (1=Read, 0=Write)
#define I2C_STATUS_BUSY   0x01  // Status[0]: BUSY
#define I2C_STATUS_ERROR  0x02  // Status[1]: ERROR

/**
 * @brief Set I2C base address
 * @param addr Base address of I2C controller
 */
void i2c_set_addr(uint32_t addr);

/**
 * @brief Get I2C base address
 * @return Current base address
 */
uint32_t i2c_get_addr(void);

/**
 * @brief Wait for I2C operation to complete
 * @return 0 on success, -1 on error
 */
int i2c_wait_ready(void);

/**
 * @brief Write a byte to EEPROM
 * @param mem_addr Memory address (0x00-0xFF)
 * @param data Data byte to write
 * @return 0 on success, -1 on error
 */
int i2c_eeprom_write_byte(uint8_t mem_addr, uint8_t data);

/**
 * @brief Read a byte from EEPROM
 * @param mem_addr Memory address (0x00-0xFF)
 * @param data Pointer to store read data
 * @return 0 on success, -1 on error
 */
int i2c_eeprom_read_byte(uint8_t mem_addr, uint8_t *data);

/**
 * @brief Write multiple bytes to EEPROM (page write)
 * @param mem_addr Starting memory address
 * @param data Pointer to data buffer
 * @param len Number of bytes to write (max 4 for page write)
 * @return 0 on success, -1 on error
 */
int i2c_eeprom_write_bytes(uint8_t mem_addr, const uint8_t *data, uint8_t len);

/**
 * @brief Read multiple bytes from EEPROM
 * @param mem_addr Starting memory address
 * @param data Pointer to data buffer
 * @param len Number of bytes to read
 * @return 0 on success, -1 on error
 */
int i2c_eeprom_read_bytes(uint8_t mem_addr, uint8_t *data, uint8_t len);

//------------------------------------------------------------------------------
// Password Management Functions
//------------------------------------------------------------------------------
// Password storage area:
//   0x00-0x0F: Password data (max 16 bytes)
//   0x10: Password length (1 byte)
//------------------------------------------------------------------------------

#define PASSWORD_START_ADDR  0x00  // Password data start address
#define PASSWORD_LEN_ADDR    0x10  // Password length address
#define MAX_PASSWORD_LEN     16    // Maximum password length (bytes)

/**
 * @brief Write password to EEPROM
 * @param password Pointer to password string
 * @param len Password length (max 16 bytes)
 * @return 0 on success, -1 on error
 */
int i2c_password_write(const uint8_t *password, uint8_t len);

/**
 * @brief Read password from EEPROM
 * @param password Pointer to buffer to store password
 * @param len Pointer to store password length (output)
 * @return 0 on success, -1 on error
 */
int i2c_password_read(uint8_t *password, uint8_t *len);

/**
 * @brief Verify password
 * @param password Pointer to password to verify
 * @param len Password length
 * @return 1 if password matches, 0 if not, -1 on error
 */
int i2c_password_verify(const uint8_t *password, uint8_t len);

/**
 * @brief Change password
 * @param old_password Pointer to old password
 * @param old_len Old password length
 * @param new_password Pointer to new password
 * @param new_len New password length
 * @return 0 on success, -1 on error (wrong old password or write error)
 */
int i2c_password_change(const uint8_t *old_password, uint8_t old_len,
                        const uint8_t *new_password, uint8_t new_len);

#ifdef __cplusplus
}
#endif
