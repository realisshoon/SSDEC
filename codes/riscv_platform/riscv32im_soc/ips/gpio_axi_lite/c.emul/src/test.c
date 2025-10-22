//------------------------------------------------------------------------------
// Copyright (c) 2025 by Ando Ki.
// All right reserved.
//------------------------------------------------------------------------------
// tester.c
//------------------------------------------------------------------------------
// VERSION = 2025.08.10.
//------------------------------------------------------------------------------
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include "gpio_api.h"

#if defined(TRX_BFM) && (TRX_BFM==1)
    #include "trx_axi_api.h"
    extern con_Handle_t handle;
#elif defined(COSIM_LIB) && (COSIM_LIB==1)
    #include "cosim_bfm_api.h"
#endif

int test( void )
{
    uint32_t valueW, valueR;

    gpio_csr();

    //gpio_init(~0x0, 0x0, 0x0, 0x0);

    while (1) {
        valueR = gpio_read();
        gpio_write(valueR);
    }

    return 0;
}

//------------------------------------------------------------------------------
// Revision History
//
// 2025.08.10: Start by Ando Ki (andoki@gmail.com)
//------------------------------------------------------------------------------
