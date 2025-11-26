/**
 * @file card_db.c
 * @brief Card Key Database Management Implementation
 */

#include "card_db.h"

// Card database storage
static card_entry_t card_db[MAX_CARDS];
static uint8_t card_count = 0;

/**
 * @brief Simple memset implementation
 */
static void simple_memset(void *ptr, int value, uint32_t num) {
  uint8_t *p = (uint8_t *)ptr;
  for (uint32_t i = 0; i < num; i++) {
    p[i] = (uint8_t)value;
  }
}

/**
 * @brief Simple memcpy implementation
 */
static void simple_memcpy(void *dest, const void *src, uint32_t num) {
  uint8_t *d = (uint8_t *)dest;
  const uint8_t *s = (const uint8_t *)src;
  for (uint32_t i = 0; i < num; i++) {
    d[i] = s[i];
  }
}

/**
 * @brief Simple strncpy implementation
 */
static void simple_strncpy(char *dest, const char *src, uint32_t num) {
  uint32_t i;
  for (i = 0; i < num && src[i] != '\0'; i++) {
    dest[i] = src[i];
  }
  for (; i < num; i++) {
    dest[i] = '\0';
  }
}

/**
 * @brief Compare two UIDs
 */
static uint8_t uid_compare(uint8_t *uid1, uint8_t *uid2) {
  for (uint8_t i = 0; i < CARD_UID_LEN; i++) {
    if (uid1[i] != uid2[i]) {
      return 0;
    }
  }
  return 1;
}

/**
 * @brief Find card index by UID
 */
static int card_db_find_index(uint8_t *uid) {
  for (uint8_t i = 0; i < card_count; i++) {
    if (uid_compare(card_db[i].uid, uid)) {
      return i;
    }
  }
  return -1;
}

/**
 * @brief Initialize card database
 */
void card_db_init(void) {
  card_count = 0;
  simple_memset(card_db, 0, sizeof(card_db));

  // Add default authorized cards
  uint8_t card1_uid[] = {0x11, 0x22, 0x33, 0x44};
  card_db_add(card1_uid, "Master Card");

  uint8_t card2_uid[] = {0xAA, 0xBB, 0xCC, 0xDD};
  card_db_add(card2_uid, "User Card");
}

/**
 * @brief Add a card to the database
 */
uint8_t card_db_add(uint8_t *uid, const char *name) {
  if (card_count >= MAX_CARDS) {
    return 0; // Database full
  }

  // Check if card already exists
  if (card_db_find_index(uid) >= 0) {
    return 0; // Card already exists
  }

  // Add new card
  simple_memcpy(card_db[card_count].uid, uid, CARD_UID_LEN);
  card_db[card_count].enabled = 1;
  simple_strncpy(card_db[card_count].name, name, 15);
  card_db[card_count].name[15] = '\0';
  card_count++;

  return 1;
}

/**
 * @brief Remove a card from the database
 */
uint8_t card_db_remove(uint8_t *uid) {
  int index = card_db_find_index(uid);
  if (index < 0) {
    return 0; // Card not found
  }

  // Shift remaining cards using simple_memcpy to avoid memcpy dependency
  for (uint8_t i = index; i < card_count - 1; i++) {
    simple_memcpy(&card_db[i], &card_db[i + 1], sizeof(card_entry_t));
  }
  card_count--;

  return 1;
}

/**
 * @brief Check if a card is registered
 */
uint8_t card_db_check(uint8_t *uid) {
  int index = card_db_find_index(uid);
  if (index < 0) {
    return 0; // Card not found
  }

  return card_db[index].enabled; // Return enabled status
}

/**
 * @brief Enable/disable a card
 */
uint8_t card_db_set_enable(uint8_t *uid, uint8_t enable) {
  int index = card_db_find_index(uid);
  if (index < 0) {
    return 0; // Card not found
  }

  card_db[index].enabled = enable;
  return 1;
}

/**
 * @brief Get number of registered cards
 */
uint8_t card_db_count(void) { return card_count; }

/**
 * @brief List all registered cards (for debugging)
 */
void card_db_list(void) {
  // This function can be used for debugging
  // Implementation depends on printf availability
}
