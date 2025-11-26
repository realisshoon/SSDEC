#pragma once
/**
 * @file card_db.h
 * @brief Card Key Database Management for Door Lock System
 */

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

// Maximum number of registered cards
#define MAX_CARDS 10

// Card UID length (4 bytes for Mifare Classic)
#define CARD_UID_LEN 4

/**
 * @brief Card entry structure
 */
typedef struct {
  uint8_t uid[CARD_UID_LEN];  // Card UID
  uint8_t enabled;            // 1 if enabled, 0 if disabled
  char name[16];               // Card name/description
} card_entry_t;

/**
 * @brief Initialize card database
 */
void card_db_init(void);

/**
 * @brief Add a card to the database
 * @param uid Card UID (4 bytes)
 * @param name Card name/description
 * @return 1 if successful, 0 if database is full
 */
uint8_t card_db_add(uint8_t *uid, const char *name);

/**
 * @brief Remove a card from the database
 * @param uid Card UID (4 bytes)
 * @return 1 if found and removed, 0 if not found
 */
uint8_t card_db_remove(uint8_t *uid);

/**
 * @brief Check if a card is registered
 * @param uid Card UID (4 bytes)
 * @return 1 if registered and enabled, 0 otherwise
 */
uint8_t card_db_check(uint8_t *uid);

/**
 * @brief Enable/disable a card
 * @param uid Card UID (4 bytes)
 * @param enable 1 to enable, 0 to disable
 * @return 1 if found and updated, 0 if not found
 */
uint8_t card_db_set_enable(uint8_t *uid, uint8_t enable);

/**
 * @brief Get number of registered cards
 * @return Number of registered cards
 */
uint8_t card_db_count(void);

/**
 * @brief List all registered cards (for debugging)
 */
void card_db_list(void);

#ifdef __cplusplus
}
#endif

