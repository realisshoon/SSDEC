/**
 * @file spi_api.c
 * @brief This file contains SPI API implementation.
 *
 * @author Ando Ki
 */
//------------------------------------------------------------------------------
// Copyright (c) 2025 by Ando Ki
// All right reserved.
//------------------------------------------------------------------------------

#include "spi_api.h"
#include <stdint.h>

extern int my_printf(const char *format, ...);

#ifdef __cplusplus
extern "C" {
#endif

//------------------------------------------------------------------------------
// Register access macros
#if defined(TRX_BFM) && (TRX_BFM == 1)
#include "trx_axi_api.h"
extern con_Handle_t con_handle;
#define CSR_READ(A, D)                                                         \
  BfmRead(con_handle, (unsigned int)(A), (unsigned int *)&(D), 4, 1)
#define CSR_WRITE(A, D)                                                        \
  BfmWrite(con_handle, (unsigned int)(A), (unsigned int *)&(D), 4, 1)
#elif defined(COSIM_LIB) && (COSIM_LIB == 1)
#include "cosim_bfm_api.h"
#define CSR_READ(A, D) bfm_read((uint32_t)(A), (uint8_t *)&(D), 4, 1)
#define CSR_WRITE(A, D) bfm_write((uint32_t)(A), (uint8_t *)&(D), 4, 1)
#else
#define CSR_WRITE(A, B) *(volatile unsigned *)A = B;
#define CSR_READ(A, B) B = *(volatile unsigned *)A;
#endif

//------------------------------------------------------------------------------
static uint32_t ADDR_SPI_BASE =
    0xC0000000; // Default base address, should be set by spi_set_addr

static uint32_t CSRA_CTRL;
static uint32_t CSRA_ADDR;
static uint32_t CSRA_DATA_IN;
static uint32_t CSRA_DATA_OUT;
static uint32_t CSRA_STATUS;

/**
 * @brief Set base (offset) address.
 *
 * @param offset offset address
 *
 * @return 0 on success, otherwise negative number.
 */
int spi_set_addr(uint32_t offset) {
  ADDR_SPI_BASE = offset;
  CSRA_CTRL = ADDR_SPI_BASE + 0x00;
  CSRA_ADDR = ADDR_SPI_BASE + 0x04;
  CSRA_DATA_IN = ADDR_SPI_BASE + 0x08;
  CSRA_DATA_OUT = ADDR_SPI_BASE + 0x0C;
  CSRA_STATUS = ADDR_SPI_BASE + 0x10;
  return 0;
}

/**
 * @brief Get base (offset) address.
 *
 * @return current base (offset) address.
 */
uint32_t spi_get_addr(void) { return ADDR_SPI_BASE; }

/**
 * @brief Initialize SPI controller.
 *
 * @return void
 */
void spi_init(void) {
  // Reset or configure SPI controller if needed
  // Currently, the hardware reset is sufficient
}

/**
 * @brief Check if SPI is busy.
 *
 * @return 1 if busy, 0 otherwise
 */
int spi_busy(void) {
  uint32_t status;
  CSR_READ(CSRA_STATUS, status);

  // Detect bus error - if read returns all 1s, peripheral not responding
  if (status == 0xFFFFFFFF) {
    return -1; // Bus error detected
  }

  return (status & 0x1) ? 1 : 0;
}

/**
 * @brief Write a byte to SPI register.
 *
 * @param addr 7-bit register address
 * @param data 8-bit data to write
 *
 * @return void
 */
void spi_write_reg(uint8_t addr, uint8_t data) {
  uint32_t ctrl;

  // SKIP busy check (assume SPI ready)

  // Set address (Write mode: MSB=0)
  CSR_WRITE(CSRA_ADDR, ((addr << 1) & 0x7E));

  // Set data
  CSR_WRITE(CSRA_DATA_IN, data);

  // Start SPI transaction
  ctrl = 0x001; // en=1, rw=0, num_bytes=1
  CSR_WRITE(CSRA_CTRL, ctrl);
}

/**
 * @brief Read a byte from SPI register.
 *
 * @param addr 7-bit register address
 *
 * @return 8-bit data read
 */
uint8_t spi_read_reg(uint8_t addr) {
  uint32_t ctrl;
  uint32_t data;

  // SKIP busy check (assume SPI ready, like Write)

  // Set address (Read mode: MSB=1)
  CSR_WRITE(CSRA_ADDR, ((addr << 1) | 0x80));

  // Start SPI Read transaction
  ctrl = 0x003; // en=1, rw=1 (Read)
  CSR_WRITE(CSRA_CTRL, ctrl);

  // SKIP completion wait (assume immediate completion)

  // Read result
  CSR_READ(CSRA_DATA_OUT, data);

  return (uint8_t)data;
}

#ifdef __cplusplus
}
#endif
