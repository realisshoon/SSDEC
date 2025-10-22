//------------------------------------------------------------------------------
//  Copyright (c) 2024 by Ando Ki.
//  All right reserved.
//
// This program is distributed in the hope that it
// will be useful to understand Ando Ki's work,
// BUT WITHOUT ANY WARRANTY.
//------------------------------------------------------------------------------
#include <stdint.h>
#include "timer_api.h"

//------------------------------------------------------------------------------
//             __    __    __    __    __    __    __
// clk      __|  |__|  |__|  |__|  |__|  |__|  |__|
//          __ _______________________________________
// mode     00X_______________________________________
//          ________ _____ _____ _____ _____ _____ ___
// count    ______1_X___2_X___3_X___4_X_____X___P_X___
//                                                 _________
// intr     ______________________________________|       
//
// Note: Internal counter starts from 1 and interrupt
//       occurs when counter equals period.
//       Interrupt stay 1 until 'IP' is written 0.
// Note: For re-start mode, every num of period clock
//       occurs interrupt, but interrupt should be
//       cleared before new period expires.
//------------------------------------------------------------------------------
static volatile uint32_t  TIMER_ADDR_BASE=0x90010000;
static volatile uint32_t  TIMER_VERSION  =0x90010000;
static volatile uint32_t  TIMER_NAME     =0x90010004;
static volatile uint32_t  TIMER_CONTROL  =0x90010010;
static volatile uint32_t  TIMER_PERIOD   =0x90010014;
static volatile uint32_t  TIMER_COUNTER  =0x90010018;
static volatile uint32_t  TIMER_CLK_FREQ =0x90010020;

// num of clocks for one milli-second
static volatile uint32_t  TICK_NUM_MILLI_SECOND=(100000000/1000);
static volatile uint32_t  TICK_NUM_MICRO_SECOND=(100000000/1000000);

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
// initialize Tick timer set mode 
// period: in milli-second
// mode:   0 (disable), 1 (restart), 2 (one-time), 3 (conti)
void timer_set_ms(uint32_t period_ms, uint32_t mode)
{
    volatile unsigned int val;
    val = TICK_INT_CLEAR|TICK_INT_DISABLE|TICK_MODE_DISABLE; // disable tick timer
    CSR_WRITE(TIMER_CONTROL, val);
    val = (period_ms*TICK_NUM_MILLI_SECOND);
    CSR_WRITE(TIMER_PERIOD, val);
    CSR_WRITE(TIMER_COUNTER, 0); // reset counter

    val = TICK_INT_ENABLE|(mode&0x3);
    CSR_WRITE(TIMER_CONTROL, val);
}

//------------------------------------------------------------------------------
// initialize Tick timer set mode 
// period: in micro-second
// mode:   0 (disable), 1 (restart), 2 (one-time), 3 (conti)
void timer_set_us(uint32_t period_us, uint32_t mode)
{
    volatile unsigned int val;
    val = TICK_INT_CLEAR|TICK_INT_DISABLE|TICK_MODE_DISABLE; // disable tick timer
    CSR_WRITE(TIMER_CONTROL,val);
    val = (period_us*TICK_NUM_MICRO_SECOND);
    CSR_WRITE(TIMER_PERIOD,val);
    CSR_WRITE(TIMER_COUNTER,0); // reset counter

    val = TICK_INT_ENABLE|(mode&0x3);
    CSR_WRITE(TIMER_CONTROL,val);
}

//------------------------------------------------------------------------------
// Clear interrupt pending bit by written 1 to ip-bit
void timer_clear_irq( void )
{
    volatile uint32_t val;
    CSR_READ(TIMER_CONTROL, val);
    val |= TICK_INT_CLEAR; // make ip-bit 1
    CSR_WRITE(TIMER_CONTROL, val);
}

//------------------------------------------------------------------------------
// Timer restart when when mode is one time 
void timer_restart( void )
{
    volatile uint32_t val;
    CSR_READ(TIMER_CONTROL,val);
    if ((val&TICK_MODE_BIT_MASK)==TICK_MODE_ONETIME) {
       CSR_WRITE(TIMER_COUNTER, 0);
    } else {
       val |= TICK_INT_ENABLE;
       CSR_WRITE(TIMER_CONTROL, val);
    }
}

//------------------------------------------------------------------------------
void timer_disable( void )
{
    volatile uint32_t val;
    CSR_READ(TIMER_CONTROL, val);
    val = TICK_INT_CLEAR|TICK_INT_DISABLE|TICK_MODE_DISABLE; // disable tick timer
    CSR_WRITE(TIMER_CONTROL, val);
}

//------------------------------------------------------------------------------
// return the value of counter and period
void timer_get(uint32_t *counter, uint32_t *period)
{
    volatile uint32_t val;
    if (counter!=0) {
        CSR_READ(TIMER_COUNTER, val);
        *counter = val;
    }
    if (period!=0) {
        CSR_READ(TIMER_PERIOD, val);
        *period = val;
    }
}

//------------------------------------------------------------------------------
// calculate TICK_NUM_MILLI_SECOND and TICK_NUM_MICRO_SECOND
void timer_init(void)
{
    volatile unsigned int val;
    CSR_READ(TIMER_CLK_FREQ, val);
    TICK_NUM_MILLI_SECOND = (val/1000);
    TICK_NUM_MICRO_SECOND = (val/1000000);
}

//------------------------------------------------------------------------------
void timer_set_addr( uint32_t addr )
{
    TIMER_ADDR_BASE= addr;
    TIMER_VERSION  = addr+0x00;
    TIMER_NAME     = addr+0x04;
    TIMER_CONTROL  = addr+0x10;
    TIMER_PERIOD   = addr+0x14;
    TIMER_COUNTER  = addr+0x18;
    TIMER_CLK_FREQ = addr+0x20;
}

//------------------------------------------------------------------------------
uint32_t timer_get_addr( void )
{
    return TIMER_ADDR_BASE;
}

//------------------------------------------------------------------------------
// Revision history
//
// 2024.08.10: Started by Ando Ki (andoki@gmail.com)
//------------------------------------------------------------------------------
