#ifndef _PIC_API_H_
#define _PIC_API_H_
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

void     pic_init( uint32_t enable
                 , uint32_t edge
                 , uint32_t pol);
void     pic_enable  ( int loc, int edge, int pol );
void     pic_disable ( int loc );
void     pic_clear   ( uint32_t clear );
uint32_t pic_get_edge     ( void );
uint32_t pic_get_pol      ( void );
uint32_t pic_get_enable   ( void );
uint32_t pic_get_interrupt( void );
uint32_t pic_get_irq      ( void );
void     pic_set_addr( uint32_t addr);
uint32_t pic_get_addr( void );

#ifdef __cplusplus
}
#endif
//--------------------------------------------------------
// Revision history
//
// 2024.08.10: Started by Ando Ki (andoki@gmail.com)
//--------------------------------------------------------
#endif
