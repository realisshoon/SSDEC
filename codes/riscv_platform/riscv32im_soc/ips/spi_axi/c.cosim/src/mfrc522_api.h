#pragma once
/**
 * @file mfrc522_api.h
 * @brief MFRC522 RFID Reader API
 */

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

//------------------------------------------------------------------------------
// MFRC522 Registers
//------------------------------------------------------------------------------
// Page 0: Command and Status
#define MFRC522_REG_COMMAND 0x01
#define MFRC522_REG_COM_IEN 0x02
#define MFRC522_REG_DIV_IEN 0x03
#define MFRC522_REG_COM_IRQ 0x04
#define MFRC522_REG_DIV_IRQ 0x05
#define MFRC522_REG_ERROR 0x06
#define MFRC522_REG_STATUS1 0x07
#define MFRC522_REG_STATUS2 0x08
#define MFRC522_REG_FIFO_DATA 0x09
#define MFRC522_REG_FIFO_LEVEL 0x0A
#define MFRC522_REG_WATER_LEVEL 0x0B
#define MFRC522_REG_CONTROL 0x0C
#define MFRC522_REG_BIT_FRAMING 0x0D
#define MFRC522_REG_COLL 0x0E

// Page 1: Command
#define MFRC522_REG_MODE 0x11
#define MFRC522_REG_TX_MODE 0x12
#define MFRC522_REG_RX_MODE 0x13
#define MFRC522_REG_TX_CONTROL 0x14
#define MFRC522_REG_TX_ASK 0x15
#define MFRC522_REG_TX_SEL 0x16
#define MFRC522_REG_RX_SEL 0x17
#define MFRC522_REG_RX_THRESHOLD 0x18
#define MFRC522_REG_DEMOD 0x19

// Page 2: Configuration
#define MFRC522_REG_MIFARE 0x1C
#define MFRC522_REG_T_MODE 0x2A
#define MFRC522_REG_T_PRESCALER 0x2B
#define MFRC522_REG_T_RELOAD_H 0x2C
#define MFRC522_REG_T_RELOAD_L 0x2D
#define MFRC522_REG_T_COUNTER_VALUE_H 0x2E
#define MFRC522_REG_T_COUNTER_VALUE_L 0x2F

// Page 3: Test Register
#define MFRC522_REG_VERSION 0x37
#define MFRC522_REG_CRC_RESULT_L 0x21
#define MFRC522_REG_CRC_RESULT_H 0x22

//------------------------------------------------------------------------------
// MFRC522 Commands
//------------------------------------------------------------------------------
#define PCD_IDLE 0x00
#define PCD_AUTHENT 0x0E
#define PCD_RECEIVE 0x08
#define PCD_TRANSMIT 0x04
#define PCD_TRANSCEIVE 0x0C
#define PCD_RESETPHASE 0x0F
#define PCD_CALCCRC 0x03

// PICC Commands
#define PICC_REQIDL 0x26        // Request for idle
#define PICC_REQALL 0x52        // Request for all
#define PICC_ANTICOLL 0x93      // Anti-collision
#define PICC_SELECTTAG 0x93     // Select tag
#define PICC_AUTHENT1A 0x60     // Authentication key A
#define PICC_AUTHENT1B 0x61     // Authentication key B
#define PICC_READ 0x30          // Read block
#define PICC_WRITE 0xA0         // Write block
#define PICC_DECREMENT 0xC0     // Decrement
#define PICC_INCREMENT 0xC1     // Increment
#define PICC_RESTORE 0xC2       // Restore
#define PICC_TRANSFER 0xB0      // Transfer
#define PICC_HALT 0x50          // Halt

// Constants
#define MAX_LEN 16
#define MFRC522_MAX_LEN 16

//------------------------------------------------------------------------------
// Functions
//------------------------------------------------------------------------------

/**
 * @brief Initialize MFRC522
 */
void MFRC522_Init(void);

/**
 * @brief Reset MFRC522 (Soft Reset)
 */
void MFRC522_Reset(void);

/**
 * @brief Write to MFRC522 Register
 * @param addr Register Address
 * @param val Value to write
 */
void MFRC522_WriteReg(uint8_t addr, uint8_t val);

/**
 * @brief Read from MFRC522 Register
 * @param addr Register Address
 * @return Value read
 */
uint8_t MFRC522_ReadReg(uint8_t addr);

/**
 * @brief Set bit mask in register
 */
void MFRC522_SetBitMask(uint8_t reg, uint8_t mask);

/**
 * @brief Clear bit mask in register
 */
void MFRC522_ClearBitMask(uint8_t reg, uint8_t mask);

/**
 * @brief Turn on Antenna
 */
void MFRC522_AntennaOn(void);

/**
 * @brief Turn off Antenna
 */
void MFRC522_AntennaOff(void);

//------------------------------------------------------------------------------
// Card Detection and UID Reading Functions
//------------------------------------------------------------------------------

/**
 * @brief Request card (PICC_REQALL)
 * @return 1 if card detected, 0 otherwise
 */
uint8_t MFRC522_Request(uint8_t reqMode, uint8_t *TagType);

/**
 * @brief Anti-collision detection
 * @param serNum Buffer to store UID (4 or 7 bytes)
 * @return 1 if successful, 0 otherwise
 */
uint8_t MFRC522_Anticoll(uint8_t *serNum);

/**
 * @brief Select card
 * @param serNum UID buffer
 * @return 1 if successful, 0 otherwise
 */
uint8_t MFRC522_SelectTag(uint8_t *serNum);

/**
 * @brief Check if card is present
 * @param uid Buffer to store UID (4 bytes for Mifare Classic)
 * @return 1 if card detected and UID read, 0 otherwise
 */
uint8_t MFRC522_IsCardPresent(uint8_t *uid);

/**
 * @brief Calculate CRC
 */
void MFRC522_CalculateCRC(uint8_t *pIndata, uint8_t len, uint8_t *pOutData);

/**
 * @brief Send command to MFRC522
 */
uint8_t MFRC522_ToCard(uint8_t command, uint8_t *sendData, uint8_t sendLen, 
                       uint8_t *backData, uint16_t *backLen);

#ifdef __cplusplus
}
#endif
