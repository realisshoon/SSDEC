#ifndef _TIMER_API_H_
#define _TIMER_API_H_
//--------------------------------------------------------
//  Copyright (c) 2024 by Ando Ki.
//  All right reserved.
//
// This program is distributed in the hope that it
// will be useful to understand Ando Ki's work,
// BUT WITHOUT ANY WARRANTY.
//--------------------------------------------------------
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

void     timer_set_ms   ( uint32_t period_ms, uint32_t mode );
void     timer_set_us   ( uint32_t period_us, uint32_t mode );
void     timer_clear_irq( void );
void     timer_restart  ( void );
void     timer_disable  ( void );
void     timer_get      ( uint32_t *counter, uint32_t *period );
void     timer_init     ( void );
void     timer_set_addr ( uint32_t addr );
uint32_t timer_get_addr ( void );

// tick timer CSR bit fields mask
#define TICK_MODE_BIT_MASK  0x00000003 // bit 1-0 Mode bits
#define TICK_IE_BIT_MASK    0x00000004 // bit 2   Interrupt enable bit
#define TICK_IP_BIT_MASK    0x00000008 // bit 3   Interrupt pending bit

// tick timer mode
#define TICK_MODE_DISABLE  0x0 // tick timer is disabled
#define TICK_MODE_RESTART  0x1 // timer is restarted when period=counter
#define TICK_MODE_ONETIME  0x2 // timer is stop when period=counter
#define TICK_MODE_CONTI    0x3 // timer does not stop, keep incrementing

// tick timer interrupt
#define TICK_INT_DISABLE   0x0 // make bit-2 (ie) zero
#define TICK_INT_ENABLE    0x4 // make bit-2 (ie) one

#define TICK_INT_CLEAR     TICK_IP_BIT_MASK // write one to bit-3 (ip) to clear ip

#ifdef __cplusplus
}
#endif
//--------------------------------------------------------
// Revision history
//
// 2024.08.10: Started by Ando Ki (andoki@gmail.com)
//--------------------------------------------------------
#endif
