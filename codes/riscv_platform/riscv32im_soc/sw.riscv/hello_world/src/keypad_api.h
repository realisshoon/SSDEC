//------------------------------------------------------------------------------
// Copyright (c) 2025
// 4x4 Matrix Keypad API
//------------------------------------------------------------------------------
#ifndef _KEYPAD_API_H_
#define _KEYPAD_API_H_

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

/**
 * @brief Initialize keypad using GPIO
 * @param gpio_base_addr GPIO base address (default: 0x90030000)
 */
void keypad_init(uint32_t gpio_base_addr);

/**
 * @brief Scan keypad and return pressed key
 * @return Key value (0-15) if pressed, -1 if no key pressed
 * 
 * Key layout:
 *   0  1  2  3
 *   4  5  6  7
 *   8  9 10 11
 *  12 13 14 15
 */
int keypad_scan(void);

/**
 * @brief Get keypad value as character
 * @return Character ('0'-'9', 'A'-'F') or 0 if no key
 */
char keypad_get_char(void);

/**
 * @brief Scan keypad using UART (simulation mode)
 * @return Key value (0-15) if pressed, -1 if no key pressed
 * 
 * This function reads UART input and converts it to keypad key.
 * Valid UART input: '0'-'9', 'A'-'D', '*', '#'
 */
int keypad_scan_uart(void);

/**
 * @brief Get keypad character from UART (simulation mode)
 * @return Character or 0 if no valid input
 */
char keypad_get_char_uart(void);

#ifdef __cplusplus
}
#endif

#endif // _KEYPAD_API_H_

