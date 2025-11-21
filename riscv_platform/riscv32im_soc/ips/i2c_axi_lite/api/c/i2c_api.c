//------------------------------------------------------------------------------
//  Copyright (c) 2024 by Ando Ki.
//  All right reserved.
//------------------------------------------------------------------------------
// i2c_api.c - I2C AXI-Lite API Implementation
//------------------------------------------------------------------------------
// VERSION = 2024.10.03.
//------------------------------------------------------------------------------

#include "i2c_api.h"
#include <stdint.h>

//------------------------------------------------------------------------------
// I2C Initialization
//------------------------------------------------------------------------------
void i2c_init(void)
{
    // Reset I2C controller
    i2c_reset();
    
    // Set clock divider for 100kHz
    i2c_set_clock_divider(I2C_CLK_DIV_100KHZ);
    
    // Enable I2C controller with interrupt
    I2C_WRITE_REG(I2C_CTRL_REG, I2C_CTRL_ENABLE | I2C_CTRL_INT_EN);
}

void i2c_reset(void)
{
    // Reset I2C controller
    I2C_WRITE_REG(I2C_CTRL_REG, I2C_CTRL_RESET);
    
    // Wait for reset to complete
    i2c_delay(100);
    
    // Clear reset
    I2C_WRITE_REG(I2C_CTRL_REG, 0x00);
}

void i2c_set_clock_divider(uint32_t div)
{
    I2C_WRITE_REG(I2C_CLK_DIV_REG, div);
}

//------------------------------------------------------------------------------
// I2C Control Functions
//------------------------------------------------------------------------------
void i2c_enable(void)
{
    uint32_t ctrl = I2C_READ_REG(I2C_CTRL_REG);
    I2C_WRITE_REG(I2C_CTRL_REG, ctrl | I2C_CTRL_ENABLE);
}

void i2c_disable(void)
{
    uint32_t ctrl = I2C_READ_REG(I2C_CTRL_REG);
    I2C_WRITE_REG(I2C_CTRL_REG, ctrl & ~I2C_CTRL_ENABLE);
}

void i2c_start(void)
{
    uint32_t ctrl = I2C_READ_REG(I2C_CTRL_REG);
    I2C_WRITE_REG(I2C_CTRL_REG, ctrl | I2C_CTRL_START);
}

void i2c_stop(void)
{
    uint32_t ctrl = I2C_READ_REG(I2C_CTRL_REG);
    I2C_WRITE_REG(I2C_CTRL_REG, ctrl | I2C_CTRL_STOP);
}

//------------------------------------------------------------------------------
// I2C Status Functions
//------------------------------------------------------------------------------
uint32_t i2c_get_status(void)
{
    return I2C_READ_REG(I2C_STATUS_REG);
}

int i2c_is_busy(void)
{
    return (i2c_get_status() & I2C_STATUS_BUSY) ? 1 : 0;
}

int i2c_is_error(void)
{
    return (i2c_get_status() & I2C_STATUS_ERROR) ? 1 : 0;
}

int i2c_is_rx_valid(void)
{
    return (i2c_get_status() & I2C_STATUS_RX_VALID) ? 1 : 0;
}

int i2c_is_tx_ready(void)
{
    return (i2c_get_status() & I2C_STATUS_TX_READY) ? 1 : 0;
}

//------------------------------------------------------------------------------
// I2C Data Transfer Functions
//------------------------------------------------------------------------------
int i2c_write_byte(uint8_t slave_addr, uint8_t data)
{
    // Set slave address
    I2C_WRITE_REG(I2C_ADDR_REG, slave_addr);
    
    // Set data to write
    I2C_WRITE_REG(I2C_DATA_REG, data);
    
    // Start write operation
    I2C_WRITE_REG(I2C_CTRL_REG, I2C_CTRL_ENABLE | I2C_CTRL_START | I2C_CTRL_WRITE);
    
    // Wait for operation to complete
    i2c_wait_idle();
    
    // Check for error
    if (i2c_is_error()) {
        return -1;
    }
    
    return 0;
}

int i2c_read_byte(uint8_t slave_addr, uint8_t *data)
{
    // Set slave address
    I2C_WRITE_REG(I2C_ADDR_REG, slave_addr);
    
    // Start read operation
    I2C_WRITE_REG(I2C_CTRL_REG, I2C_CTRL_ENABLE | I2C_CTRL_START | I2C_CTRL_READ);
    
    // Wait for operation to complete
    i2c_wait_idle();
    
    // Check for error
    if (i2c_is_error()) {
        return -1;
    }
    
    // Read data
    *data = I2C_READ_REG(I2C_DATA_REG) & 0xFF;
    
    return 0;
}

int i2c_write_data(uint8_t slave_addr, uint8_t *data, uint32_t len)
{
    uint32_t i;
    
    for (i = 0; i < len; i++) {
        if (i2c_write_byte(slave_addr, data[i]) != 0) {
            return -1;
        }
    }
    
    return 0;
}

int i2c_read_data(uint8_t slave_addr, uint8_t *data, uint32_t len)
{
    uint32_t i;
    
    for (i = 0; i < len; i++) {
        if (i2c_read_byte(slave_addr, &data[i]) != 0) {
            return -1;
        }
    }
    
    return 0;
}

//------------------------------------------------------------------------------
// I2C EEPROM Functions
//------------------------------------------------------------------------------
int i2c_eeprom_write(uint8_t slave_addr, uint8_t addr, uint8_t data)
{
    // Write address first
    if (i2c_write_byte(slave_addr, addr) != 0) {
        return -1;
    }
    
    // Write data
    if (i2c_write_byte(slave_addr, data) != 0) {
        return -1;
    }
    
    return 0;
}

int i2c_eeprom_read(uint8_t slave_addr, uint8_t addr, uint8_t *data)
{
    // Write address first
    if (i2c_write_byte(slave_addr, addr) != 0) {
        return -1;
    }
    
    // Read data
    if (i2c_read_byte(slave_addr, data) != 0) {
        return -1;
    }
    
    return 0;
}

int i2c_eeprom_write_page(uint8_t slave_addr, uint8_t start_addr, uint8_t *data, uint32_t len)
{
    uint32_t i;
    
    // Write starting address
    if (i2c_write_byte(slave_addr, start_addr) != 0) {
        return -1;
    }
    
    // Write data bytes
    for (i = 0; i < len; i++) {
        if (i2c_write_byte(slave_addr, data[i]) != 0) {
            return -1;
        }
    }
    
    return 0;
}

int i2c_eeprom_read_page(uint8_t slave_addr, uint8_t start_addr, uint8_t *data, uint32_t len)
{
    uint32_t i;
    
    // Write starting address
    if (i2c_write_byte(slave_addr, start_addr) != 0) {
        return -1;
    }
    
    // Read data bytes
    for (i = 0; i < len; i++) {
        if (i2c_read_byte(slave_addr, &data[i]) != 0) {
            return -1;
        }
    }
    
    return 0;
}

//------------------------------------------------------------------------------
// I2C Utility Functions
//------------------------------------------------------------------------------
void i2c_wait_idle(void)
{
    while (i2c_is_busy()) {
        // Wait for I2C to become idle
    }
}

void i2c_delay(uint32_t cycles)
{
    volatile uint32_t i;
    for (i = 0; i < cycles; i++) {
        // Simple delay loop
    }
}

//------------------------------------------------------------------------------
// Revision history
//
// 2024.10.03: Started by Ando Ki (andoki@gmail.com)
//------------------------------------------------------------------------------
