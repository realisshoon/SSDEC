#pragma once
#include <stdint.h>
/**
 * @file gpio_axi_lite.c
 * @brief This file contains GPIO API.
 *
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
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif
/**
 * @brief Get value on GPIO input line.
 *
 * @return the value of GPIO input line
 */
uint32_t gpio_read(void);

/**
 * @brief Set vlaue f GPIO output line.
 *
 * @param value  value to drive.
 *
 * @return void
 */
void gpio_write(uint32_t value);

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
void gpio_init(uint32_t inout // 0 by default, all input mode
               ,
               uint32_t edge // 0 by default, all level-sesitive
               ,
               uint32_t pol //~0 by default, all active-high
               ,
               uint32_t irq_enable); // 0 by default, all disabled

/**
 * @brief Set GPIO interrupt.
 *
 * @param value      bitwise setting of enable or disable
 *                   0=disalbe, 1=enable
 *                   (default: 0x0000_0000 - all disabled)
 *
 * @return interrupt settings on success, otherwise negative number.
 */
uint32_t gpio_irq_enable(uint32_t value);

/**
 * @brief Set GPIO interrupt mode.
 *
 * @param value      bitwise setting of level or edge
 *                   0=level, 1=edge
 *                   (default: 0x0000_0000 - all level)
 *
 * @return interrupt mode on success, otherwise negative number.
 */
uint32_t gpio_irq_edge(uint32_t value);

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
uint32_t gpio_irq_pol(uint32_t value);

/**
 * @brief Set GPIO interrupt mode.
 *
 * @return interrupt value.
 */
uint32_t gpio_irq_read(void);

/**
 * @brief Clear GPIO interrupt mode;  clear 'IRQ' bit according to bit value of
 * 'value'.
 *
 * @param value      bitwise setting of level or edge
 *                    Bit value '0' of 'value' clear corresponding bit of 'IRQ'.
 *
 * @return interrupt value.
 */
uint32_t gpio_irq_clear(uint32_t value);

/**
 * @brief Get all values of CSR.
 *
 * @return void
 */
void gpio_csr(void);

/**
 * @brief Set base (offset) address.
 *
 * @param offset offset address
 *
 * @return 0 on success, otherwise negative number.
 */
int gpio_set_addr(uint32_t offset);

/**
 * @brief Get base (offset) address.
 *
 * @return current base (offset) address.
 */
uint32_t gpio_get_addr(void);

#ifdef __cplusplus
}
#endif

//--------------------------------------------------------
// Revision History
//
// 2025.09.10: Re-written by Ando Ki (andoki@gmail.com)
//--------------------------------------------------------
