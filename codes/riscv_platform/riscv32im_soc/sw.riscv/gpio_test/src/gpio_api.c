/**
 * @file gpio_axi_lite.c
 * @brief This file contains GPIO API.
 *
 * @author Ando Ki
 */
//------------------------------------------------------------------------------
// Copyright (c) 2025 by Ando Ki
// All right reserved.
//------------------------------------------------------------------------------
// DIR    : contols mode of each bit
//          - 0 for input, 1 for output
//          - default: 0x00000000
// LINE   : current value when read, drive value when write
// MASK   : interrupt mask
//          - 0 for enable, 1 for disable
//          - default: 0xFFFFFFFF
// IRQ    : interrupt status
//          - 1 for interrupt, 0 for normal
//          - default: 0x00000000
// EDGE   : edge/level sensitivity mode
//          - 0 for level, 1 for edge
//          - default: 0x00000000
// POL    : rising/falling/high/low mode
//          - 0 for active-low for level, falling-edge for edge
//          - 1 for active-high for level, rising-edge for edge
//          - default: 0x00000000
//------------------------------------------------------------------------------
#include <stdio.h>
#include <stdint.h>
#include "gpio_api.h"

#ifdef __cplusplus
extern "C" {
#endif

//------------------------------------------------------------------------------
// Register access macros
#if defined(TRX_BFM) && (TRX_BFM==1)
    #include "trx_axi_api.h"
    extern con_Handle_t con_handle;
    #define CSR_READ(A, D)\
            BfmRead(con_handle, (unsigned int)(A), (unsigned int*)&(D), 4, 1)
    #define CSR_WRITE(A, D)\
            BfmWrite(con_handle, (unsigned int)(A), (unsigned int*)&(D), 4, 1)
#elif defined(COSIM_LIB) && (COSIM_LIB==1)
    #include "cosim_bfm_api.h"
    #define CSR_READ(A, D)\
            bfm_read((uint32_t)(A), (uint8_t*)&(D), 4, 1)
    #define CSR_WRITE(A, D)\
            bfm_write((uint32_t)(A), (uint8_t*)&(D), 4, 1)
#elif defined(XDMA_LIB) && (XDMA_LIB==1)
    #include "xdma_api.h"
    extern XdmaHandle_t xdma_handle;
    #define CSR_READ(A, D)\
            xdmaUserRegRead(xdma_handle, A, &(D))
    #define CSR_WRITE(A, D)\
            xdmaUserRegWrite(xdma_handle, A, D)
#else
#       define CSR_WRITE(A, B)   *(volatile unsigned *)A = B;
#       define CSR_READ(A, B)    B = *(volatile unsigned *)A;
#endif

//------------------------------------------------------------------------------
static uint32_t ADDR_GPIO    =0x90030000;
static uint32_t CSRA_VERSION =0x90030000+0x00;
static uint32_t CSRA_NAME    =0x90030000+0x04;
static uint32_t CSRA_DIR     =0x90030000+0x10;
static uint32_t CSRA_INPUT   =0x90030000+0x14;
static uint32_t CSRA_OUTPUT  =0x90030000+0x18;
static uint32_t CSRA_MASK    =0x90030000+0x1C;
static uint32_t CSRA_IRQ     =0x90030000+0x20;
static uint32_t CSRA_EDGE    =0x90030000+0x24;
static uint32_t CSRA_POL     =0x90030000+0x28;

/**
 * @brief Get value on GPIO input line.
 *
 * @return the value of GPIO input line
 */
uint32_t gpio_read(void) {
   uint32_t value;
   CSR_READ(CSRA_INPUT, value);
   return value;
}

/**
 * @brief Set vlaue of GPIO output line.
 *
 * @param value  value to drive.
 *
 * @return void
 */
void gpio_write(uint32_t value) {
   CSR_WRITE(CSRA_OUTPUT, value);
}

/**
 * @brief Set GPIO operating modes.
 *
 * @param inout      bitwise setting of input or output
 *                   0=input, 1=output
 *                   (default: 0x0000_0000 - all input)
 * @param level      bitwise setting of interrupt level or edge
 *                   0=level, 1=edge
 *                   (default: 0x0000_0000 - all edge)
 * @param pol        bitwise setting of interrupt mode
 *                   0=low/falling, 1=high/rising
 *                   (default: 0xFFFF_FFFF - all high/rising)
 * @param irq_enable bitwise setting of interrupt
 *                   0=disable, 1=enable
 *                   (default: 0x0000_0000 - all disabled)
 *
 * @return 0 on success, otherwise negative number.
 */
void gpio_init( uint32_t inout // 0 by default, all input mode
              , uint32_t edge  // 0 by default, all level-sesitive
              , uint32_t pol   //~0 by default, all active-high
              , uint32_t irq_enable) // 0 by default, all disabled
{
   uint32_t value;
   value = 0;
   CSR_WRITE(CSRA_DIR,     inout); // all input mode
   CSR_WRITE(CSRA_OUTPUT,  value); // all output value 0
   CSR_WRITE(CSRA_EDGE,    edge); // 0: level, 1: edge
   CSR_WRITE(CSRA_POL,     pol); // 0: low/falling, 1: high/rising
   value = ~irq_enable;
   CSR_WRITE(CSRA_MASK,    value); // 0: enable, 1: masking-out
}

/**
 * @brief Set GPIO interrupt.
 *
 * @param value      bitwise setting of enable or disable
 *                   0=disalbe, 1=enable
 *                   (default: 0x0000_0000 - all disabled)
 *
 * @return interrupt settings on success, otherwise negative number.
 */
uint32_t gpio_irq_enable(uint32_t value) {
   uint32_t xval = ~value;
   CSR_WRITE(CSRA_MASK, xval);
   CSR_READ(CSRA_MASK, xval);
   return xval;
}

/**
 * @brief Set GPIO interrupt mode.
 *
 * @param value      bitwise setting of level or edge
 *                   0=level, 1=edge
 *                   (default: 0x0000_0000 - all level)
 *
 * @return interrupt mode on success, otherwise negative number.
 */
uint32_t gpio_irq_edge(uint32_t value) {
   CSR_WRITE(CSRA_EDGE, value);
   CSR_READ(CSRA_EDGE, value);
   return value;
}

/**
 * @brief Set GPIO interrupt mode.
 *
 * @param value      bitwise setting of level or edge
 *                   for level: 0=active-low, 1=active-high
 *                   for edge: 0=falling, 1=rising
 *                   (default: 0x0000_0000 - all level)
 *
 * @return interrupt mode on success, otherwise negative number.
 */
uint32_t gpio_irq_pol(uint32_t value) {
   CSR_WRITE(CSRA_POL, value);
   CSR_READ(CSRA_POL, value);
   return value;
}

/**
 * @brief Set GPIO interrupt mode.
 *
 * @return interrupt value.
 */
uint32_t gpio_irq_read(void) {
   uint32_t value;
   CSR_READ(CSRA_IRQ, value);
   return value;
}

/**
 * @brief Clear GPIO interrupt mode;  clear 'IRQ' bit according to bit value of 'value'.
 *
 * @param value      bitwise setting of level or edge
 *                    Bit value '0' of 'value' clear corresponding bit of 'IRQ'.
 *
 * @return interrupt value.
 */
uint32_t gpio_irq_clear(uint32_t value) {
   uint32_t irq;
   CSR_READ(CSRA_IRQ, irq);
   irq &=  value;
   CSR_WRITE(CSRA_IRQ, irq);
   CSR_READ(CSRA_IRQ, value);
   return value;
}

/**
 * @brief Get all values of CSR.
 *
 * @return void
 */
void gpio_csr(void)
{
     uint32_t dataR;

     CSR_READ(CSRA_VERSION, dataR); // GPIO VERSION
     CSR_READ(CSRA_NAME   , dataR); // GPIO NAME
     CSR_READ(CSRA_DIR    , dataR); // GPIO DIR
     CSR_READ(CSRA_INPUT  , dataR); // GPIO INPUT
     CSR_READ(CSRA_OUTPUT , dataR); // GPIO OUTPUT
     CSR_READ(CSRA_MASK   , dataR); // GPIO MASK
     CSR_READ(CSRA_IRQ    , dataR); // GPIO IRQ
     CSR_READ(CSRA_EDGE   , dataR); // GPIO EDGE
     CSR_READ(CSRA_POL    , dataR); // GPIO POL
}

/**
 * @brief Set base (offset) address.
 *
 * @param offset offset address
 *
 * @return 0 on success, otherwise negative number.
 */
int gpio_set_addr( uint32_t offset )
{
    ADDR_GPIO    = offset;
    CSRA_VERSION = offset+0x00;
    CSRA_NAME    = offset+0x04;
    CSRA_DIR     = offset+0x10;
    CSRA_INPUT   = offset+0x14;
    CSRA_OUTPUT  = offset+0x18;
    CSRA_MASK    = offset+0x1C;
    CSRA_IRQ     = offset+0x20;
    CSRA_EDGE    = offset+0x24;
    CSRA_POL     = offset+0x28;

    return 0;
}

/**
 * @brief Get base (offset) address.
 *
 * @return current base (offset) address.
 */
uint32_t gpio_get_addr( void )
{
    return ADDR_GPIO;
}

//--------------------------------------------------------
#undef CSR_WRITE
#undef CSR_READ

#ifdef __cplusplus
}
#endif

//--------------------------------------------------------
// Revision History
//
// 2025.09.10: Re-written by Ando Ki (andoki@gmail.com)
//--------------------------------------------------------
