//------------------------------------------------------------------------------
// Door Lock System with RFID Card Key
//------------------------------------------------------------------------------
#include "card_db.h"
#include "gpio_api.h"
#include "mfrc522_api.h"
#include "my_printf.h"
#include "spi_api.h"
#include "uart_api.h"
#include <stdint.h>

#ifndef BAUD_RATE
#define BAUD_RATE 115200
#endif

#define UART_BASE_ADDR 0x90020000
#define GPIO_BASE_ADDR 0x90030000
#define SPI_BASE_ADDR                                                          \
  0xA0000000 // SPI moved outside PERIPHERAL range to avoid AXI address overlap

// Master Key UID (Example: 4 bytes)
// In simulation with simple dummy, we might need to adjust this or the dummy
// model. For now, let's define a target UID.
static const uint8_t MASTER_UID[4] = {0x93, 0x20, 0x55, 0xAA};

// Track current GPIO state (lower 8 bits: keypad, upper 8: LED)
static uint32_t gpio_value = 0x00;

// LED Control (GPIO [15:8])
static void led_set(uint8_t pattern) {
  // Read current GPIO state to preserve other bits if needed,
  // Keep lower 8 bits (keypad), update upper 8 bits (LED)
  // gpio_value = (gpio_value & 0x000000FF) | ((uint32_t)pattern << 8);

  // FIX: Hardware is 8-bit. LEDs are on [7:0].
  gpio_value = pattern;
  gpio_write(gpio_value);
}

static void led_on(void) {
  led_set(0xFF); // All LEDs ON
}

static void led_off(void) {
  led_set(0x00); // All LEDs OFF
}

static void delay_ms(uint32_t ms) {
  volatile uint32_t i, j;
  for (i = 0; i < ms; i++) {
    for (j = 0; j < 1000; j++) {
      // Adjust based on clock
    }
  }
}

// Check if detected UID matches Master UID
static int check_uid(uint8_t *uid) {
  for (int i = 0; i < 4; i++) {
    if (uid[i] != MASTER_UID[i]) {
      return 0; // Mismatch
    }
  }
  return 1; // Match
}

int main() {
  // 1. UART Initialization
  uart_set_addr(UART_BASE_ADDR);
  uart_init(100000000, BAUD_RATE, 8, 0, 1);

  // Delay to allow UART to settle
  volatile int i;
  for (i = 0; i < 100000; i++)
    ;

  my_printf("\r\n[System] UART Initialized\r\n");

  // 2. GPIO Initialization
  my_printf("[DEBUG] Before GPIO init\r\n");
  for (i = 0; i < 100000; i++)
    ; // Wait for print

  gpio_set_addr(GPIO_BASE_ADDR);
  // Set direction: Lower 8 bits as output
  gpio_init(0xFF, 0, 0, 0);

  led_off();
  my_printf("[System] GPIO Initialized (LEDs OFF)\r\n");

  // 3. SPI & MFRC522 Initialization  // Initialize SPI controller
  my_printf("[System] Initializing SPI controller...\r\n");
  spi_set_addr(SPI_BASE_ADDR);
  spi_init();
  my_printf("[System] SPI controller initialized\r\n");

  // Initialize MFRC522
  my_printf("[MFRC522] Initializing RFID reader...\r\n");
  // SKIP full init - causes hang on TX_CONTROL read
  // MFRC522_Init();

  // Just do soft reset
  my_printf("[MFRC522] Soft reset only...\r\n");
  MFRC522_WriteReg(MFRC522_REG_COMMAND, PCD_RESETPHASE);
  delay_ms(10);

  my_printf("[MFRC522] Init skipped (AntennaOn causes hang)\r\n");

  // Read version - simple check
  my_printf("[MFRC522] Reading Version...\r\n");
  uint8_t version = MFRC522_ReadReg(MFRC522_REG_VERSION);
  my_printf("[MFRC522] Version: 0x%02x\r\n", version);

  my_printf("[CardDB] Initializing card database...\r\n");
  card_db_init();
  my_printf("[CardDB] Registered cards: %d\r\n", card_db_count());

skip_spi_init:
  my_printf("\r\n");
  my_printf("========================================\r\n");
  my_printf("   SPI MISO Diagnostic Test\r\n");
  my_printf("========================================\r\n");
  my_printf("\r\n");

  while (1) {
    my_printf("--- Test Cycle Start ---\r\n");

    // Test 1: Read multiple registers
    my_printf("\r\n[Test 1] Reading various MFRC522 registers:\r\n");
    uint8_t ver = MFRC522_ReadReg(0x37); // Version
    my_printf("  Version (0x37):      0x%02x\r\n", ver);

    uint8_t mode = MFRC522_ReadReg(0x11); // Mode
    my_printf("  Mode (0x11):         0x%02x\r\n", mode);

    uint8_t cmd = MFRC522_ReadReg(0x01); // Command
    my_printf("  Command (0x01):      0x%02x\r\n", cmd);

    uint8_t status = MFRC522_ReadReg(0x07); // Status1
    my_printf("  Status1 (0x07):      0x%02x\r\n", status);

    // Test 2: Write then Read back
    my_printf("\r\n[Test 2] Write/Read test:\r\n");
    my_printf("  Writing 0xAA to Mode register...\r\n");
    MFRC522_WriteReg(0x11, 0xAA);
    delay_ms(10);

    uint8_t readback = MFRC522_ReadReg(0x11);
    my_printf("  Read back: 0x%02x %s\r\n", readback,
              (readback == 0xAA) ? "✓ MATCH" : "✗ MISMATCH");

    // Test 3: Sequential reads
    my_printf(
        "\r\n[Test 3] Sequential Version reads (should be consistent):\r\n");
    for (uint8_t i = 0; i < 5; i++) {
      uint8_t v = MFRC522_ReadReg(0x37);
      my_printf("  #%d: 0x%02x\r\n", i + 1, v);
      delay_ms(50);
    }

    // Analysis
    my_printf("\r\n[Analysis]\r\n");
    if (ver == 0x00 || ver == 0xFF) {
      my_printf("  ✗ MISO problem: All reads return 0x%02x\r\n", ver);
      my_printf("  → Check MISO wire connection!\r\n");
    } else if (ver == 0x91 || ver == 0x92) {
      my_printf("  ✓ Version correct: SPI working!\r\n");
    } else {
      my_printf("  ? Unexpected version: 0x%02x\r\n", ver);
    }

    my_printf("\r\n--- Waiting 3 seconds... (Press 'q' to exit) ---\r\n\r\n");

    // Check for exit
    for (int i = 0; i < 30; i++) {
      uint32_t ch = uart_get_char_nb();
      if (ch == 'q' || ch == 'Q') {
        my_printf("\r\n[Exit] Test stopped\r\n");
        goto exit_loop;
      }
      delay_ms(100);
    }
  }

exit_loop:
  my_printf("[System] Program ended\r\n");
  return 0;
}
