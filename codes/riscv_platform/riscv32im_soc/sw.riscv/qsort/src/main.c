#include "uart_api.h"
#include "my_printf.h"
#include <stdint.h>

#ifndef BAUD_RATE
    #define BAUD_RATE 115200
#endif

int main()
{
    uint32_t base_addr=0x90020000;
    uint32_t baud_rate=BAUD_RATE;
    extern void qsort_main(void);

    uart_set_addr(base_addr);
    uart_init( 100000000
             , baud_rate
             , 8  // width
             , 0  // parity
             , 1);// stop

    qsort_main();
    uart_put_string("...end...\n");
    return 0;
}
