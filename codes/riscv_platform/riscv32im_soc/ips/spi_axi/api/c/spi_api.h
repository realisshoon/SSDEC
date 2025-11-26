#pragma once
/**
 * @file spi_api.h
 * @brief This file contains SPI API for MFRC522.
 *
 * @author Ando Ki
 */
//------------------------------------------------------------------------------
// Copyright (c) 2025 by Ando Ki
// All right reserved.
//------------------------------------------------------------------------------

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

//------------------------------------------------------------------------------
// Register Offsets
//------------------------------------------------------------------------------
#define SPI_REG_CTRL 0x00     // Control register
#define SPI_REG_ADDR 0x04     // Address register
#define SPI_REG_DATA_IN 0x08  // Data input register
#define SPI_REG_DATA_OUT 0x0C // Data output register
#define SPI_REG_STATUS 0x10   // Status register

//------------------------------------------------------------------------------
// Control Register Bits
//------------------------------------------------------------------------------
#define SPI_CTRL_ENABLE (1 << 0)
#define SPI_CTRL_RW (1 << 1) // 0: Write, 1: Read

//------------------------------------------------------------------------------
// Status Register Bits
//------------------------------------------------------------------------------
#define SPI_STATUS_BUSY (1 << 0)
#define SPI_STATUS_DONE (1 << 1)
#define SPI_STATUS_ERROR (1 << 2)

/**
 * @brief Set base (offset) address.
 *
 * @param offset offset address
 *
 * @return 0 on success, otherwise negative number.
 */
int spi_set_addr(uint32_t offset);

/**
 * @brief Get base (offset) address.
 *
 * @return current base (offset) address.
 */
uint32_t spi_get_addr(void);

/**
 * @brief Initialize SPI controller.
 *
 * @return void
 */
void spi_init(void);

/**
 * @brief Write a byte to a register.
 *
 * @param addr  Register address (6-bit)
 * @param data  Data to write
 *
 * @return void
 */
void spi_write_reg(uint8_t addr, uint8_t data);

/**
 * @brief Read a byte from a register.
 *
 * @param addr  Register address (6-bit)
 *
 * @return Data read
 */
uint8_t spi_read_reg(uint8_t addr);

/**
 * @brief Check if SPI is busy.
 *
 * @return 1 if busy, 0 otherwise
 */
int spi_busy(void);

#ifdef __cplusplus
}
#endif
