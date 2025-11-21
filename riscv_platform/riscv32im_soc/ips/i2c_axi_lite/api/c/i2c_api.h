//------------------------------------------------------------------------------
//  Copyright (c) 2024 by Ando Ki.
//  All right reserved.
//------------------------------------------------------------------------------
// i2c_api.h - I2C AXI-Lite API Header
//------------------------------------------------------------------------------
// VERSION = 2024.10.03.
//------------------------------------------------------------------------------

#ifndef I2C_API_H
#define I2C_API_H

//------------------------------------------------------------------------------
// I2C Base Address (from SoC memory map)
//------------------------------------------------------------------------------
#define I2C_BASE_ADDR    0x90030000

//------------------------------------------------------------------------------
// I2C Register Offsets
//------------------------------------------------------------------------------
#define I2C_CTRL_OFFSET    0x00
#define I2C_STATUS_OFFSET  0x04
#define I2C_DATA_OFFSET    0x08
#define I2C_ADDR_OFFSET    0x0C
#define I2C_CLK_DIV_OFFSET 0x10

//------------------------------------------------------------------------------
// I2C Register Addresses
//------------------------------------------------------------------------------
#define I2C_CTRL_REG    (I2C_BASE_ADDR + I2C_CTRL_OFFSET)
#define I2C_STATUS_REG  (I2C_BASE_ADDR + I2C_STATUS_OFFSET)
#define I2C_DATA_REG    (I2C_BASE_ADDR + I2C_DATA_OFFSET)
#define I2C_ADDR_REG    (I2C_BASE_ADDR + I2C_ADDR_OFFSET)
#define I2C_CLK_DIV_REG (I2C_BASE_ADDR + I2C_CLK_DIV_OFFSET)

//------------------------------------------------------------------------------
// I2C Control Register Bits
//------------------------------------------------------------------------------
#define I2C_CTRL_ENABLE     (1 << 0)
#define I2C_CTRL_START      (1 << 1)
#define I2C_CTRL_STOP       (1 << 2)
#define I2C_CTRL_WRITE      (1 << 3)
#define I2C_CTRL_READ       (1 << 4)
#define I2C_CTRL_ACK        (1 << 5)
#define I2C_CTRL_INT_EN     (1 << 6)
#define I2C_CTRL_RESET      (1 << 7)

//------------------------------------------------------------------------------
// I2C Status Register Bits
//------------------------------------------------------------------------------
#define I2C_STATUS_BUSY     (1 << 0)
#define I2C_STATUS_ERROR    (1 << 1)
#define I2C_STATUS_RX_VALID (1 << 2)
#define I2C_STATUS_TX_READY (1 << 3)
#define I2C_STATUS_ACK      (1 << 4)
#define I2C_STATUS_ARB_LOST (1 << 5)

//------------------------------------------------------------------------------
// I2C Clock Divider Values
//------------------------------------------------------------------------------
#define I2C_CLK_DIV_100KHZ  100  // 100kHz I2C clock
#define I2C_CLK_DIV_400KHZ  25   // 400kHz I2C clock

//------------------------------------------------------------------------------
// Function Prototypes
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// I2C Initialization
//------------------------------------------------------------------------------
void i2c_init(void);
void i2c_reset(void);
void i2c_set_clock_divider(uint32_t div);

//------------------------------------------------------------------------------
// I2C Control Functions
//------------------------------------------------------------------------------
void i2c_enable(void);
void i2c_disable(void);
void i2c_start(void);
void i2c_stop(void);

//------------------------------------------------------------------------------
// I2C Status Functions
//------------------------------------------------------------------------------
uint32_t i2c_get_status(void);
int i2c_is_busy(void);
int i2c_is_error(void);
int i2c_is_rx_valid(void);
int i2c_is_tx_ready(void);

//------------------------------------------------------------------------------
// I2C Data Transfer Functions
//------------------------------------------------------------------------------
int i2c_write_byte(uint8_t slave_addr, uint8_t data);
int i2c_read_byte(uint8_t slave_addr, uint8_t *data);
int i2c_write_data(uint8_t slave_addr, uint8_t *data, uint32_t len);
int i2c_read_data(uint8_t slave_addr, uint8_t *data, uint32_t len);

//------------------------------------------------------------------------------
// I2C EEPROM Functions
//------------------------------------------------------------------------------
int i2c_eeprom_write(uint8_t slave_addr, uint8_t addr, uint8_t data);
int i2c_eeprom_read(uint8_t slave_addr, uint8_t addr, uint8_t *data);
int i2c_eeprom_write_page(uint8_t slave_addr, uint8_t start_addr, uint8_t *data, uint32_t len);
int i2c_eeprom_read_page(uint8_t slave_addr, uint8_t start_addr, uint8_t *data, uint32_t len);

//------------------------------------------------------------------------------
// I2C Utility Functions
//------------------------------------------------------------------------------
void i2c_wait_idle(void);
void i2c_delay(uint32_t cycles);

//------------------------------------------------------------------------------
// Helper Macros
//------------------------------------------------------------------------------
#define I2C_WRITE_REG(reg, val)    (*(volatile uint32_t*)(reg) = (val))
#define I2C_READ_REG(reg)          (*(volatile uint32_t*)(reg))

#endif // I2C_API_H
