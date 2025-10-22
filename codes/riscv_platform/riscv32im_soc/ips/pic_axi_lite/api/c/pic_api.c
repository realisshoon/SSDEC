//------------------------------------------------------------------------------
//  Copyright (c) 2024 by Ando Ki.
//  All right reserved.
//
// This program is distributed in the hope that it
// will be useful to understand Ando Ki's work,
// BUT WITHOUT ANY WARRANTY.
//------------------------------------------------------------------------------
#include <stdint.h>
#include "pic_api.h"

//------------------------------------------------------------------------------
// edge: Edge Enable Register (0x10)
//      bits 31:0 R/W  Edge Enable '1' = edge triggered interrupt source
//                                 '0' = level triggered interrupt source
// pol: Polarity Register (0x14)
//      bits 31:0 R/W Polarity     '1' = high level / rising edge
//                                 '0' = low level / falling edge
// enabe: Enable Register (0x18)
//      bits 31:0 R/W Enable       '1' = interrupt enabled (enabled)
//                                 '0' = interrupt masked (disabled)
// pend: Pending Register (0x1C)
//      bits 31:0 R/W Pending      '1' = interrupt pending
//                                 '0' = no interrupt pending
// clear: Clear register (0x20)    '1' = clear
//      bits 31:0 RO Clear         '0' = don't care
//
// An interrupt is generated when an interrupt is pending and its
// Enable bit is 1.
//------------------------------------------------------------------------------
static volatile uint32_t  PIC_ADDR_BASE=0x90000000;
static volatile uint32_t  PIC_VERSION  =0x90000000;
static volatile uint32_t  PIC_NAME     =0x90000004;
static volatile uint32_t  PIC_EDGE     =0x90000010;// RW, edge enable 1=edge, 0=level
static volatile uint32_t  PIC_POL      =0x90000014;// RW, polarity    1=high-level/rising-edge
static volatile uint32_t  PIC_ENABLE   =0x90000018;// RW, enable      1=enable, 0=disable
static volatile uint32_t  PIC_PENDING  =0x9000001C;// RO, pending     1=irq_out pending
static volatile uint32_t  PIC_CLEAR    =0x90000020;// WO, clear       1=irq_in clear
static volatile uint32_t  PIC_IRQ_IN   =0x90000024;// RO, current irq_in signal level

//------------------------------------------------------------------------------
#if defined(TRX_BFM)
#include "cosim_bfm_axi.h"
        extern int cid;
#       define CSR_WRITE(A,B)   cosim_bfm_axi_lite_write((uint32_t)(A), (uint32_t)(B), cid)
#       define CSR_READ(A,B)    cosim_bfm_axi_lite_read((uint32_t)(A), (uint32_t*)&(B), cid)
#else
#define reinterpret_cast(TO, VAR)\
       ({ union { __typeof__((VAR)) source; TO dest; } u = { .source = (VAR) }; (TO)u.dest; })
#       define CSR_WRITE(A,B)   *(reinterpret_cast(uint32_t *, (A))) = B;
#       define CSR_READ(A,B)    B = *(reinterpret_cast(uint32_t *, A));
#endif

//------------------------------------------------------------------------------
// dealing with all bits.
//
// enable[i]: 1=enable
// edge  [i]: 1=edge, 0=level
// pol   [i]: 1=rising or high; 0=falling or low
//
// pic_init(0  // all disabled
//         ,0  // level-triggered
//         ,0) // active-low
void pic_init( uint32_t enable
             , uint32_t edge
             , uint32_t pol)
{
     CSR_WRITE( PIC_EDGE  , edge   );
     CSR_WRITE( PIC_POL   , pol    );
     CSR_WRITE( PIC_ENABLE, enable );
}

//------------------------------------------------------------------------------
// dealing with a single bit.
//
// loc: which bit for 0 to NUM_IRQ-1
// edge: 1 for edge sensitive
// pol:  1 for rising or level.
void pic_enable( int loc, int edge, int pol )
{
     volatile uint32_t val;
     CSR_READ (PIC_EDGE,   val); if (edge) val |=  (0x1<<loc);// edge sensitive
                                 else      val &= ~(0x1<<loc);
     CSR_WRITE(PIC_EDGE,   val);
     CSR_READ (PIC_POL,    val); if (pol) val |=  (0x1<<loc);// rising or high-level
                                 else     val &= ~(0x1<<loc);
     CSR_WRITE(PIC_POL,    val);
     CSR_READ (PIC_ENABLE, val); val |= (0x1<<loc);
     CSR_WRITE(PIC_ENABLE, val);
}

//------------------------------------------------------------------------------
// loc: which bit for 0 to NUM_IRQ-1
void pic_disable( int loc )
{
     volatile uint32_t val;
     CSR_READ(PIC_ENABLE, val); val |= (0x1<<loc);
     CSR_WRITE(PIC_ENABLE, val);
}

//------------------------------------------------------------------------------
// clear[i]: 1=irq_in_clear, i.e., clear pending[i]
void pic_clear( uint32_t clear )
{
     CSR_WRITE( PIC_CLEAR, clear );
}

//------------------------------------------------------------------------------
// Returns edge
uint32_t pic_get_edge( void )
{
     volatile uint32_t val;
     CSR_READ( PIC_EDGE, val );
     return val;
}

//------------------------------------------------------------------------------
// Returns pol
uint32_t pic_get_pol( void )
{
     volatile uint32_t val;
     CSR_READ( PIC_POL, val );
     return val;
}

//------------------------------------------------------------------------------
// Returns enable
uint32_t pic_get_enable( void )
{
     volatile uint32_t val;
     CSR_READ( PIC_ENABLE, val );
     return val;
}

//------------------------------------------------------------------------------
// Returns pending
uint32_t pic_get_interrupt( void )
{
     volatile uint32_t val;
     CSR_READ( PIC_PENDING, val );
     return val;
}

//------------------------------------------------------------------------------
// Returns irq_in
uint32_t pic_get_irq( void )
{
     volatile uint32_t val;
     CSR_READ( PIC_IRQ_IN, val );
     return val;
}

//------------------------------------------------------------------------------
void pic_set_addr( uint32_t addr ) {
    PIC_ADDR_BASE  = addr;
    PIC_VERSION    = addr+0x00;
    PIC_NAME       = addr+0x04;
    PIC_EDGE       = addr+0x10;
    PIC_POL        = addr+0x14;
    PIC_ENABLE     = addr+0x18;
    PIC_PENDING    = addr+0x1C;
    PIC_CLEAR      = addr+0x20;
    PIC_IRQ_IN     = addr+0x24;
}

//------------------------------------------------------------------------------
uint32_t pic_get_addr( void ) {
    return PIC_ADDR_BASE;
}

//------------------------------------------------------------------------------
// Revision history
//
// 2024.08.10: Started by Ando Ki (andoki@gmail.com)
//------------------------------------------------------------------------------
