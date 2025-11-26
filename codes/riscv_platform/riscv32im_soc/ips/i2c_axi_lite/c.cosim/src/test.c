//--------------------------------------------------------
// Copyright (c) 2022 by Future Design Systems Co., Ltd.
// All right reserved.
//
// http://www.future-ds.com
//--------------------------------------------------------
// VERSION = 2022.10.11.
//--------------------------------------------------------
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>
#include <assert.h>
#include <unistd.h>
#include "i2c_master_api.h"

#define I2C_DEV_ADDR_D7R8   0x41 //0b100_0001
#define I2C_DEV_ADDR_D7R16  0x45 //0b100_0101
#define I2C_DEV_ADDR_D10R8  0x201 //0b10_0000_0001
#define I2C_DEV_ADDR_D10R16 0x205 //0b10_0000_0101

int test(void)
{
     int ret;

     i2c_set_addr(0xC0060000);

     printf("I2C MST CSR ======\n");
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
     }
     int error = 0;
     for (reg_addr=0x00; reg_addr<reg_num; reg_addr++) {
         reg_dataW = reg_addr;
         ret = i2c_read_d7r8( dev_addr //7-bit format
                            , reg_addr
                            ,&reg_dataR);
         if (reg_dataR!=reg_dataW) {
             error++;
             printf("Dev:0x%08X A=0x%02X D=0x%02X, but 0x%02X expected.\n", dev_addr, reg_addr, reg_dataR, reg_dataW);
         }
     }
     if (error==0) printf("Dev:0x%08X %d OK\n", dev_addr, reg_num);
     else          printf("Dev:0x%08X %d out of %d error\n", dev_addr, error, reg_num);

     i2c_disable();
     i2c_rst();

     return 0;
}
//--------------------------------------------------------
// Revision History
//
// 2022.10.11: Start by Ando Ki (adki@future-ds.com)
//--------------------------------------------------------
