#include "uart_api.h"
#include "my_printf.h"
#include "i2c_master_api.h"
#include <stdint.h>

#ifndef BAUD_RATE
#    define BAUD_RATE  115200
#endif

#define I2C_DEV_ADDR_D7R8   0x41 //0b100_0001

int i2c_test(void)
{
     int ret;

     // Set I2C Base Address for SoC
     i2c_set_addr(0x90040000);

     my_printf("I2C MST CSR ======\n");
     i2c_csr_check();

     i2c_init( 200000 );
     ret = i2c_config ( 2 //gap  
                      , 2 //post 
                      , 2 //mid
                      , 2 //pre
                      );
     i2c_enable();

     uint8_t  dev_addr=I2C_DEV_ADDR_D7R8;
     uint8_t  reg_addr=0x00;
     uint8_t  reg_dataW=0x01;
     uint8_t  reg_dataR;
     int      reg_num=10;
     for (reg_addr=0x00; reg_addr<reg_num; reg_addr++) {
         reg_dataW = reg_addr;
         ret = i2c_write_d7r8( dev_addr //7-bit format
                             , reg_addr
                             , reg_dataW );
         my_printf("Write: Dev=0x%02X Reg=0x%02X Data=0x%02X\n", dev_addr, reg_addr, reg_dataW);
     }
     int error = 0;
     for (reg_addr=0x00; reg_addr<reg_num; reg_addr++) {
         reg_dataW = reg_addr;
         ret = i2c_read_d7r8( dev_addr //7-bit format
                            , reg_addr
                            ,&reg_dataR);
         my_printf("Read : Dev=0x%02X Reg=0x%02X Data=0x%02X\n", dev_addr, reg_addr, reg_dataR);
         if (reg_dataR!=reg_dataW) {
             error++;
             my_printf("Error: Dev:0x%08X A=0x%02X D=0x%02X, but 0x%02X expected.\n", dev_addr, reg_addr, reg_dataR, reg_dataW);
         }
     }
     if (error==0) my_printf("Dev:0x%08X %d OK\n", dev_addr, reg_num);
     else          my_printf("Dev:0x%08X %d out of %d error\n", dev_addr, error, reg_num);

     i2c_disable();
     i2c_rst();

     return 0;
}

int main()
{
#if 1
    uint32_t base_addr=0x90020000;
    uint32_t baud_rate=BAUD_RATE;
    uart_set_addr(base_addr);
    uart_init( 0 // 100Mhz
             , baud_rate
             , 8  // width
             , 0  // parity
             , 1);// stop
    my_printf("%d Hz\r\n", uart_get_clk_freq());
#endif

    my_puts("Starting I2C Test...\r\n");
    i2c_test();
    my_puts("I2C Test Completed.\r\n");

    return 0;
}
