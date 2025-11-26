/**
 * @file mfrc522_api.c
 * @brief MFRC522 RFID Reader API Implementation
 */

#include "mfrc522_api.h"
#include "my_printf.h" // For debug output
#include "spi_api.h"
#include <stdint.h>
#include <stdio.h> // For debug prints if needed

void MFRC522_WriteReg(uint8_t addr, uint8_t val) {
  // MFRC522 SPI Address Format: (Address << 1) & 0x7E
  // The MSB is 0 for Write.
  uint8_t spi_addr = (addr << 1) & 0x7E;
  spi_write_reg(spi_addr, val);
}

uint8_t MFRC522_ReadReg(uint8_t addr) {
  // MFRC522 SPI Address Format: ((Address << 1) & 0x7E) | 0x80
  // The MSB is 1 for Read.
  uint8_t spi_addr = ((addr << 1) & 0x7E) | 0x80;
  return spi_read_reg(spi_addr);
}

void MFRC522_Reset(void) {
  MFRC522_WriteReg(MFRC522_REG_COMMAND, PCD_RESETPHASE);
}

void MFRC522_Init(void) {
  my_printf("[MFRC522_Init] Starting...\r\n");

  // 1. Soft Reset
  my_printf("[MFRC522_Init] Soft reset...\r\n");
  MFRC522_Reset();
  my_printf("[MFRC522_Init] Reset done\r\n");

  // 2. Timer: TPrescaler*TreloadVal/6.78MHz = 24ms
  my_printf("[MFRC522_Init] Configuring timer...\r\n");
  MFRC522_WriteReg(MFRC522_REG_T_MODE,
                   0x8D); // Tauto=1; f(Timer) = 6.78MHz/TPreScaler
  MFRC522_WriteReg(
      MFRC522_REG_T_PRESCALER,
      0x3E); // TPreScaler = TModeReg[3..0]:TPrescalerReg, ie 0x0D3E = 3390
  MFRC522_WriteReg(MFRC522_REG_T_RELOAD_L, 30);
  MFRC522_WriteReg(MFRC522_REG_T_RELOAD_H, 0);
  my_printf("[MFRC522_Init] Timer configured\r\n");

  my_printf("[MFRC522_Init] Setting TX/Mode regs...\r\n");
  MFRC522_WriteReg(MFRC522_REG_TX_ASK, 0x40); // 100%ASK
  MFRC522_WriteReg(MFRC522_REG_MODE, 0x3D);   // CRC Initial value 0x6363
  my_printf("[MFRC522_Init] TX/Mode regs done\r\n");

  // 3. Antenna On
  my_printf("[MFRC522_Init] Turning antenna on...\r\n");
  MFRC522_AntennaOn();
  my_printf("[MFRC522_Init] Init complete!\r\n");
}

void MFRC522_SetBitMask(uint8_t reg, uint8_t mask) {
  uint8_t tmp;
  tmp = MFRC522_ReadReg(reg);
  MFRC522_WriteReg(reg, tmp | mask);
}

void MFRC522_ClearBitMask(uint8_t reg, uint8_t mask) {
  uint8_t tmp;
  tmp = MFRC522_ReadReg(reg);
  MFRC522_WriteReg(reg, tmp & (~mask));
}

void MFRC522_AntennaOn(void) {
  uint8_t temp;
  my_printf("[AntennaOn] Reading TX_CONTROL reg...\r\n");
  temp = MFRC522_ReadReg(MFRC522_REG_TX_CONTROL);
  my_printf("[AntennaOn] TX_CONTROL = 0x%x\r\n", temp);
  if (!(temp & 0x03)) {
    my_printf("[AntennaOn] Setting antenna bits...\r\n");
    MFRC522_SetBitMask(MFRC522_REG_TX_CONTROL, 0x03);
  }
  my_printf("[AntennaOn] Done\r\n");
}

void MFRC522_AntennaOff(void) {
  MFRC522_ClearBitMask(MFRC522_REG_TX_CONTROL, 0x03);
}

//------------------------------------------------------------------------------
// Card Detection and UID Reading Functions
//------------------------------------------------------------------------------

/**
 * @brief Simple delay function
 */
static void delay_ms(uint32_t ms) {
  // Simple delay loop - adjust based on clock frequency
  volatile uint32_t i, j;
  for (i = 0; i < ms; i++) {
    for (j = 0; j < 1000; j++) {
      // Adjust this based on your clock frequency
    }
  }
}

/**
 * @brief Calculate CRC
 */
void MFRC522_CalculateCRC(uint8_t *pIndata, uint8_t len, uint8_t *pOutData) {
  uint8_t i, n;
  MFRC522_ClearBitMask(MFRC522_REG_DIV_IRQ, 0x04); // Clear CRCIRq bit
  MFRC522_SetBitMask(MFRC522_REG_FIFO_LEVEL,
                     0x80); // FlushBuffer=1, FIFO initialization

  // Write data to FIFO
  for (i = 0; i < len; i++) {
    MFRC522_WriteReg(MFRC522_REG_FIFO_DATA, *(pIndata + i));
  }

  MFRC522_WriteReg(MFRC522_REG_COMMAND, PCD_CALCCRC);

  // Wait for CRC calculation to complete
  i = 0xFF;
  do {
    n = MFRC522_ReadReg(MFRC522_REG_DIV_IRQ);
    i--;
  } while ((i != 0) && !(n & 0x04)); // CRCIRq bit

  // Read CRC result (Note: actual register addresses may need adjustment)
  pOutData[0] = MFRC522_ReadReg(MFRC522_REG_CRC_RESULT_L);
  pOutData[1] = MFRC522_ReadReg(MFRC522_REG_CRC_RESULT_H);
}

/**
 * @brief Send command to MFRC522
 */
uint8_t MFRC522_ToCard(uint8_t command, uint8_t *sendData, uint8_t sendLen,
                       uint8_t *backData, uint16_t *backLen) {
  uint8_t status = 0;
  uint8_t irqEn = 0x00;
  uint8_t waitIRq = 0x00;
  uint8_t lastBits;
  uint8_t n;
  uint16_t i;

  switch (command) {
  case PCD_AUTHENT: {
    irqEn = 0x12;
    waitIRq = 0x10;
    break;
  }
  case PCD_TRANSCEIVE: {
    irqEn = 0x77;
    waitIRq = 0x30;
    break;
  }
  default:
    break;
  }

  MFRC522_WriteReg(MFRC522_REG_COM_IEN, irqEn | 0x80);
  MFRC522_ClearBitMask(MFRC522_REG_COM_IRQ, 0x80);
  MFRC522_SetBitMask(MFRC522_REG_FIFO_LEVEL, 0x80);

  MFRC522_WriteReg(MFRC522_REG_COMMAND, PCD_IDLE);

  // Writing data to FIFO
  for (i = 0; i < sendLen; i++) {
    MFRC522_WriteReg(MFRC522_REG_FIFO_DATA, sendData[i]);
  }

  // Execute command
  MFRC522_WriteReg(MFRC522_REG_COMMAND, command);
  if (command == PCD_TRANSCEIVE) {
    MFRC522_SetBitMask(MFRC522_REG_BIT_FRAMING, 0x80);
  }

  // Wait for command completion
  i = 2000; // Timeout counter
  do {
    n = MFRC522_ReadReg(MFRC522_REG_COM_IRQ);
    i--;
  } while ((i != 0) && !(n & 0x01) && !(n & waitIRq));

  MFRC522_ClearBitMask(MFRC522_REG_BIT_FRAMING, 0x80);

  if (i != 0) {
    if (!(MFRC522_ReadReg(MFRC522_REG_ERROR) & 0x1B)) {
      status = 1;
      if (n & irqEn & 0x01) {
        status = 0;
      }

      if (command == PCD_TRANSCEIVE) {
        n = MFRC522_ReadReg(MFRC522_REG_FIFO_LEVEL);
        lastBits = MFRC522_ReadReg(MFRC522_REG_CONTROL) & 0x07;
        if (lastBits) {
          *backLen = (n - 1) * 8 + lastBits;
        } else {
          *backLen = n * 8;
        }

        if (n == 0) {
          n = 1;
        }
        if (n > MFRC522_MAX_LEN) {
          n = MFRC522_MAX_LEN;
        }

        // Reading data from FIFO
        for (i = 0; i < n; i++) {
          backData[i] = MFRC522_ReadReg(MFRC522_REG_FIFO_DATA);
        }
      }
    } else {
      status = 0;
    }
  }

  return status;
}

/**
 * @brief Request card (PICC_REQALL)
 */
uint8_t MFRC522_Request(uint8_t reqMode, uint8_t *TagType) {
  uint8_t status;
  uint16_t backBits;

  MFRC522_WriteReg(MFRC522_REG_BIT_FRAMING, 0x07);

  TagType[0] = reqMode;
  status = MFRC522_ToCard(PCD_TRANSCEIVE, TagType, 1, TagType, &backBits);

  if ((status != 1) || (backBits != 0x10)) {
    status = 0;
  }

  return status;
}

/**
 * @brief Anti-collision detection
 */
uint8_t MFRC522_Anticoll(uint8_t *serNum) {
  uint8_t status;
  uint8_t i;
  uint8_t serNumCheck = 0;
  uint16_t unLen;

  MFRC522_WriteReg(MFRC522_REG_BIT_FRAMING, 0x00);

  serNum[0] = PICC_ANTICOLL;
  serNum[1] = 0x20;
  status = MFRC522_ToCard(PCD_TRANSCEIVE, serNum, 2, serNum, &unLen);

  if (status == 1) {
    // Check card serial number
    for (i = 0; i < 4; i++) {
      serNumCheck ^= serNum[i];
    }
    if (serNumCheck != serNum[i]) {
      status = 0;
    }
  }

  return status;
}

/**
 * @brief Select card
 */
uint8_t MFRC522_SelectTag(uint8_t *serNum) {
  uint8_t i;
  uint8_t status;
  uint8_t size;
  uint16_t recvBits;
  uint8_t buffer[9];

  buffer[0] = PICC_SELECTTAG;
  buffer[1] = 0x70;
  for (i = 0; i < 5; i++) {
    buffer[i + 2] = *(serNum + i);
  }
  MFRC522_CalculateCRC(buffer, 7, &buffer[7]);

  status = MFRC522_ToCard(PCD_TRANSCEIVE, buffer, 9, buffer, &recvBits);

  if ((status == 1) && (recvBits == 0x18)) {
    size = buffer[0];
  } else {
    size = 0;
  }

  return size;
}

/**
 * @brief Check if card is present and read UID
 */
uint8_t MFRC522_IsCardPresent(uint8_t *uid) {
  uint8_t status;
  uint8_t str[MAX_LEN];

  // Request card
  status = MFRC522_Request(PICC_REQIDL, str);

  if (status == 1) {
    // Anti-collision
    status = MFRC522_Anticoll(str);
    if (status == 1) {
      // Copy UID (4 bytes for Mifare Classic)
      for (uint8_t i = 0; i < 4; i++) {
        uid[i] = str[i];
      }
      // Select card
      status = MFRC522_SelectTag(str);
    }
  }

  return status;
}
