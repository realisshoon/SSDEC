//------------------------------------------------------------------------------
// LED and UART Test (No SPI, No MFRC522)
// Purpose: Verify basic GPIO and UART connectivity
//------------------------------------------------------------------------------
#include "gpio_api.h"
#include "my_printf.h"
#include "uart_api.h"
#include <stdint.h>

#ifndef BAUD_RATE
#define BAUD_RATE 115200
#endif

#define UART_BASE_ADDR 0x90020000
#define GPIO_BASE_ADDR 0x90030000

// Simple delay function
static void delay_ms(uint32_t ms) {
  volatile uint32_t i, j;
  for (i = 0; i < ms; i++) {
    for (j = 0; j < 10000; j++) {
      // Adjust based on clock frequency
    }
  }
}

int main() {
  // 1. UART Initialization
  uart_set_addr(UART_BASE_ADDR);
  uart_init(100000000, BAUD_RATE, 8, 0, 1);

  my_printf("\r\n");
  my_printf("========================================\r\n");
  my_printf("  LED and UART Test Program\r\n");
  my_printf("========================================\r\n");
  my_printf("[System] UART Initialized at %d baud\r\n", BAUD_RATE);

  // 2. GPIO Initialization
  my_printf("[System] Initializing GPIO...\r\n");
  gpio_set_addr(GPIO_BASE_ADDR);
  // Set all 16 bits as output for testing
  gpio_init(0xFFFF, 0, 0, 0);
  gpio_write(0x0000); // All LEDs off initially
  my_printf("[System] GPIO Initialized (All LEDs OFF)\r\n");

  my_printf("\r\n");
  my_printf("========================================\r\n");
  my_printf("  Starting LED Pattern Test\r\n");
  my_printf("========================================\r\n");
  my_printf("LED Pattern: Rotating bit (upper 8 bits)\r\n");
  my_printf("Press Ctrl+C to stop\r\n");
  my_printf("\r\n");

  // 3. LED Pattern Test
  uint8_t pattern = 0x01;
  uint32_t count = 0;

  while (1) {
    // Write pattern to LOWER 8 bits (gpio_out[7:0] -> LED)
    // Hardware is currently 8-bit GPIO.
    uint16_t gpio_val = (uint16_t)pattern;
    gpio_write(gpio_val);

    // Print status
    my_printf("[%4d] LED Pattern: 0x%02X (GPIO: 0x%04X)\r\n", count, pattern,
              gpio_val);

    // Wait
    delay_ms(500);

    // Rotate pattern
    pattern = (pattern << 1);
    if (pattern == 0x00) {
      pattern = 0x01;
      count++;
      my_printf("\r\n=== Cycle %d Complete ===\r\n\r\n", count);
    }
  }

  return 0;
}
