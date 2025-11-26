#include "mfrc522_api.h"
#include "spi_api.h"
#include <stdint.h>
#include <stdio.h>

// SPI Controller Base Address
#define SPI_BASE_ADDR 0xC0000000

int main(int argc, char **argv) {
  uint8_t version;

  printf("\n[TEST] MFRC522 SPI Communication Test\n");

  // 1. Initialize SPI Controller
  printf("[INFO] Initializing SPI Controller at 0x%08X...\n", SPI_BASE_ADDR);
  if (spi_set_addr(SPI_BASE_ADDR) != 0) {
    printf("[ERROR] Failed to set SPI base address.\n");
    return -1;
  }
  spi_init();

  // 2. Initialize MFRC522
  printf("[INFO] Initializing MFRC522...\n");
  MFRC522_Init();

  // 3. Read Version Register
  printf("[INFO] Reading Version Register (0x37)...\n");
  version = MFRC522_ReadReg(MFRC522_REG_VERSION);

  printf("[RESULT] MFRC522 Version: 0x%02X\n", version);

  // 4. Verify Result
  // Expected version for MFRC522 is usually 0x92 (v2.0) or 0x91 (v1.0)
  // The BFM model (mfrc522_dummy.v) should return 0x92 based on previous
  // context.
  if (version == 0x92 || version == 0x91) {
    printf("[SUCCESS] MFRC522 detected successfully.\n");
  } else {
    printf("[FAILURE] Unexpected version. Check connection or simulation "
           "model.\n");
  }

  return 0;
}
