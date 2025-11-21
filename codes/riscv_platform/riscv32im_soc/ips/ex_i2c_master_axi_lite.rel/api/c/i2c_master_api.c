//------------------------------------------------------------------------------
// Copyright (c) 2019 by Future Design Systems , Inc.
// All right reserved.
//
// http://www.future-ds.com
//------------------------------------------------------------------------------
// i2c_master_api.c
//------------------------------------------------------------------------------
// VERSION = 2019.01.14.
//------------------------------------------------------------------------------
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#ifdef TRX_BFM
#	include "bfm_api.h"
#endif
#include "i2c_master_int.h"
#include "i2c_master_api.h"

//------------------------------------------------------------------------------
// Register access macros
#if defined(TRX_BFM) && (TRX_BFM==1)
    #include "trx_axi_api.h"
    extern con_Handle_t con_handle;
    #define REGRD(A, D)\
            BfmRead(con_handle, (uint32_t)(A), (uint32_t*)&(D), 4, 1)
    #define REGWR(A, D)\
            BfmWrite(con_handle, (uint32_t)(A), (uint32_t*)&(D), 4, 1)
#elif defined(COSIM_LIB) && (COSIM_LIB==1)
    #include "cosim_bfm_api.h"
    #define REGRD(A, D)\
            bfm_read((uint32_t)(A), (uint8_t*)&(D), 4, 1)
    #define REGWR(A, D)\
            bfm_write((uint32_t)(A), (uint8_t*)&(D), 4, 1)
#elif defined(XDMA_LIB) && (XDMA_LIB==1)
    #include "xdma_api.h"
    extern XdmaHandle_t xdma_handle;
    #define REGRD(A, D)\
            xdmaUserRegRead(xdma_handle, A, &(D))
    #define REGWR(A, D)\
            xdmaUserRegWrite(xdma_handle, A, D)
#else
#       define REGWR(A, B)   *(volatile unsigned *)A = B;
#       define REGRD(A, B)    B = *(volatile unsigned *)A;
#endif

//------------------------------------------------------------------------------
static uint32_t current_i2c_id=0;
static uint32_t frx_num=8; // num of entries for RX (refer to P_RX_DEPTH in HW)
static uint32_t ftx_num=8; // num of entries for TX (refer to P_TX_DEPTH in HW)

// repeat(0),stop(0),receive(0),drive(1),start(1)
#define DEV_ADDR_SND(d,rw)\
     dataW = (0x3<<I2C_TX_DATA_start)\
           | (((d)&0x7F)<<1) | (rw&0x1);\
     REGWR(CSRA_I2C_TX_DATA, dataW)
// repeat(r),stop(s),receive(0),drive(1),start(0)
#define REG_ADDR_SND(a,s,r)\
     dataW = (((r)&0x1)<<I2C_TX_DATA_repeat)\
           | (((s)&0x1)<<I2C_TX_DATA_stop)\
           | ((0x2)<<I2C_TX_DATA_start)\
           | ((a)&0xFF);\
     REGWR(CSRA_I2C_TX_DATA, dataW)
// repeat(0),stop(s),receive(1),drive(0),start(0)
#define REG_DATA_RCV(s)\
     dataW = (((s)&0x1)<<I2C_TX_DATA_stop)\
           | ((0x4)<<I2C_TX_DATA_start);\
     REGWR(CSRA_I2C_TX_DATA, dataW)
// repeat(0),stop(s),receive(0),drive(1),start(0)
#define REG_DATA_SND(d,s)\
     dataW = (((s)&0x1)<<I2C_TX_DATA_stop)\
           | ((0x2)<<I2C_TX_DATA_start)\
           | ((d)&0xFF);\
     REGWR(CSRA_I2C_TX_DATA, dataW)
// go n transactions
#define GO_I2C(n)\
     dataW = (((n)&0xFF)<<I2C_RUN_num)\
           | I2C_RUN_go_MSK;\
     REGWR(CSRA_I2C_RUN, dataW)
// wait until done
#define WAIT_I2C(n)\
     do { REGRD(CSRA_I2C_RUN, dataR);\
     } while (dataR&I2C_RUN_go_MSK)

//------------------------------------------------------------------------------
// read I2C with 7-bit device address and 8-bit register address.
int i2c_read_d7r8( uint8_t  dev_addr // device address in lower 7-bit
                 , uint8_t  reg_addr
                 , uint8_t *reg_data )
{
     if (reg_data==NULL) return 0;
     uint32_t dataR, dataW;
     //----------------------------------------------
     #if defined(RIGOR)
     REGRD(CSRA_I2C_RUN, dataR);
     if (((dataR&I2C_RUN_snd_rooms_MSK)>>I2C_RUN_snd_rooms)!=ftx_num) {
          printf("none empty for tx buffer: %d\n", ((dataR&I2C_RUN_snd_rooms_MSK)>>I2C_RUN_snd_rooms));
     }
     #endif
     //----------------------------------------------
     // fill SND-FIFO
     DEV_ADDR_SND(dev_addr,0); // control byte with write
     REG_ADDR_SND(reg_addr,0,1); // stop(0),repeat(1)
     DEV_ADDR_SND(dev_addr,1); // control byte with read
     REG_DATA_RCV(1); // stop
     uint32_t num = 4;
     GO_I2C(num);
     WAIT_I2C(num);
     if (((dataR&I2C_RUN_num_MSK)>>I2C_RUN_num)!=num) {
         return -1;
     }
     int err=0;
     int idx;
     for (idx=0; idx<(num-1); idx++) {
          REGRD(CSRA_I2C_RX_DATA, dataR);
          if (!(dataR&I2C_RX_DATA_ack_MSK)) { // should be ACK
              err++;
              printf("%s(0x%02X, 0x%02X): ACK error %d\n", __FUNCTION__, dev_addr, reg_addr, idx);
          }
     }
     REGRD(CSRA_I2C_RX_DATA, dataR);
     if ((dataR&I2C_RX_DATA_ack_MSK)) { // should be NACK
         err++;
         printf("%s(): NACK error %d (end of read should be NACK)\n", __FUNCTION__, idx);
     }
     *reg_data = (dataR&I2C_RX_DATA_dat_MSK);
     //----------------------------------------------
     #if defined(RIGOR)
     REGRD(CSRA_I2C_RUN, dataR);
     if (((dataR&I2C_RUN_rcv_items_MSK)>>I2C_RUN_rcv_items)!=0) {
          printf("none empty for rx buffer: %d\n", ((dataR&I2C_RUN_rcv_items)>>I2C_RUN_rcv_items));
     }
     #endif
     //----------------------------------------------
     return (err) ? -1 : 0;
}

//------------------------------------------------------------------------------
// read multiple I2C with 7-bit device address and 8-bit register address.
int i2c_readN_d7r8( uint8_t  dev_addr // device address in lower 7-bit
                  , uint8_t  reg_addr
                  , uint8_t *reg_data
                  , uint8_t  reg_num )
{
     if (reg_data==NULL) return 0;
     uint32_t dataR, dataW;
     //----------------------------------------------
     #if defined(RIGOR)
     REGRD(CSRA_I2C_RUN, dataR);
     if (((dataR&I2C_RUN_snd_rooms_MSK)>>I2C_RUN_snd_rooms)!=ftx_num) {
          printf("none empty for tx buffer: %d\n", ((dataR&I2C_RUN_snd_rooms_MSK)>>I2C_RUN_snd_rooms));
     }
     #endif
     //----------------------------------------------
     // fill SND-FIFO
     DEV_ADDR_SND(dev_addr,0); // control byte with write
     REG_ADDR_SND(reg_addr,0,1); // stop(0),repeat(1)
     DEV_ADDR_SND(dev_addr,1); // control byte with read
     for (uint8_t idx=0; idx<(reg_num-1); idx++) {
          REG_DATA_RCV(0);
     }
     REG_DATA_RCV(1); // stop
     uint32_t num = 3 + reg_num;
     GO_I2C(num);
     WAIT_I2C(num);
     if (((dataR&I2C_RUN_num_MSK)>>I2C_RUN_num)!=num) {
         return -1;
     }
     int err=0;
     int idx;
     for (idx=0; idx<3; idx++) {
          REGRD(CSRA_I2C_RX_DATA, dataR);
          if (!(dataR&I2C_RX_DATA_ack_MSK)) { // should be ACK
              err++;
              printf("%s(0x%02X, 0x%02X): ACK error %d\n", __FUNCTION__, dev_addr, reg_addr, idx);
          }
     }
     uint8_t idy=0;
     for (idy=0; idy<(reg_num-1); idy++) {
          REGRD(CSRA_I2C_RX_DATA, dataR);
          if (!(dataR&I2C_RX_DATA_ack_MSK)) { // should be ACK
                   err++;
              printf("%s(): ACK error %d \n", __FUNCTION__, idx+idy);
          }
          reg_data[idy] = (dataR&I2C_RX_DATA_dat_MSK);
     }
     REGRD(CSRA_I2C_RX_DATA, dataR);
     if ((dataR&I2C_RX_DATA_ack_MSK)) { // should be NACK
              err++;
         printf("%s(): NACK error %d (end of read should be NACK)\n", __FUNCTION__, idx);
     }
     reg_data[idy] = (dataR&I2C_RX_DATA_dat_MSK);
     //----------------------------------------------
     #if defined(RIGOR)
     REGRD(CSRA_I2C_RUN, dataR);
     if (((dataR&I2C_RUN_rcv_items_MSK)>>I2C_RUN_rcv_items)!=0) {
          printf("none empty for rx buffer: %d\n", ((dataR&I2C_RUN_rcv_items)>>I2C_RUN_rcv_items));
     }
     #endif
     //----------------------------------------------
     return (err) ? -1 : 0;
}

//------------------------------------------------------------------------------
// Do not forget to add sufficient dealy after write.
// write I2C with 7-bit device address and 8-bit register address.
int i2c_write_d7r8( uint8_t  dev_addr
                  , uint8_t  reg_addr
                  , uint8_t  reg_data )
{
     uint32_t dataR, dataW;
     //----------------------------------------------
     #if defined(RIGOR)
     REGRD(CSRA_I2C_RUN, dataR);
     if (((dataR&I2C_RUN_snd_rooms_MSK)>>I2C_RUN_snd_rooms)!=ftx_num) {
          printf("none empty for tx buffer: %d\n", ((dataR&I2C_RUN_snd_rooms_MSK)>>I2C_RUN_snd_rooms));
     }
     #endif
     //----------------------------------------------
     // fill SND-FIFO
     DEV_ADDR_SND(dev_addr,0);
     REG_ADDR_SND(reg_addr,0,0); // stop(0), repeat(0)
     REG_DATA_SND(reg_data,1); // stop
     uint32_t num = 3;
     GO_I2C(num);
     WAIT_I2C(num);
     if (((dataR&I2C_RUN_num_MSK)>>I2C_RUN_num)!=num) {
         return -1;
     }
     int err=0;
     for (int idx=0; idx<num; idx++) { // pop all response
          REGRD(CSRA_I2C_RX_DATA, dataR);
          if (!(dataR&I2C_RX_DATA_ack_MSK)) { // should be ACK
              err++;
              printf("%s(0x%02X, 0x%02X): ACK error %d\n", __FUNCTION__, dev_addr, reg_addr, idx);
          }
     }
     //----------------------------------------------
     #if defined(RIGOR)
     REGRD(CSRA_I2C_RUN, dataR);
     if (((dataR&I2C_RUN_rcv_items_MSK)>>I2C_RUN_rcv_items)!=0) {
          printf("none empty for rx buffer: %d\n", ((dataR&I2C_RUN_rcv_items)>>I2C_RUN_rcv_items));
     }
     #endif
     //----------------------------------------------
     return (err) ? -1 : 0;
}

//------------------------------------------------------------------------------
// Do not forget to add sufficient dealy after write.
// write I2C with 7-bit device address and 8-bit register address.
int i2c_writeN_d7r8( uint8_t  dev_addr
                   , uint8_t  reg_addr
                   , uint8_t *reg_data
                   , uint8_t  reg_num )
{
     uint32_t dataR, dataW;
     //----------------------------------------------
     #if defined(RIGOR)
     REGRD(CSRA_I2C_RUN, dataR);
     if (((dataR&I2C_RUN_snd_rooms_MSK)>>I2C_RUN_snd_rooms)!=ftx_num) {
          printf("none empty for tx buffer: %d\n", ((dataR&I2C_RUN_snd_rooms_MSK)>>I2C_RUN_snd_rooms));
     }
     #endif
     //----------------------------------------------
     // fill SND-FIFO
     DEV_ADDR_SND(dev_addr,0);
     REG_ADDR_SND(reg_addr,0,0); // stop(0), repeat(0)
     uint8_t idx;
     for (idx=0; idx<(reg_num-1); idx++) {
          REG_DATA_SND(reg_data[idx],0); // stop
     }
     REG_DATA_SND(reg_data[idx],1); // stop
     uint32_t num = 2+reg_num;
     GO_I2C(num);
     WAIT_I2C(num);
     if (((dataR&I2C_RUN_num_MSK)>>I2C_RUN_num)!=num) {
         return -1;
     }
     int err=0;
     for (int idx=0; idx<num; idx++) { // pop all response
          REGRD(CSRA_I2C_RX_DATA, dataR);
          if (!(dataR&I2C_RX_DATA_ack_MSK)) { // should be ACK
              err++;
              printf("%s(0x%02X, 0x%02X): ACK error %d\n", __FUNCTION__, dev_addr, reg_addr, idx);
          }
     }
     //----------------------------------------------
     #if defined(RIGOR)
     REGRD(CSRA_I2C_RUN, dataR);
     if (((dataR&I2C_RUN_rcv_items_MSK)>>I2C_RUN_rcv_items)!=0) {
          printf("none empty for rx buffer: %d\n", ((dataR&I2C_RUN_rcv_items)>>I2C_RUN_rcv_items));
     }
     #endif
     //----------------------------------------------
     return (err) ? -1 : 0;
}

//------------------------------------------------------------------------------
// read I2C with 7-bit device address and 16-bit register address.
int i2c_read_d7r16( uint8_t  dev_addr
                  , unsigned short reg_addr
                  , uint8_t *reg_data )
{
     if (reg_data==NULL) return 0;
     uint32_t dataR, dataW;
     //----------------------------------------------
     #if defined(RIGOR)
     REGRD(CSRA_I2C_RUN, dataR);
     if (((dataR&I2C_RUN_snd_rooms_MSK)>>I2C_RUN_snd_rooms)!=ftx_num) {
          printf("none empty for tx buffer: %d\n", ((dataR&I2C_RUN_snd_rooms_MSK)>>I2C_RUN_snd_rooms));
     }
     #endif
     //----------------------------------------------
     // fill SND-FIFO
     DEV_ADDR_SND(dev_addr,0); // control byte with write
     REG_ADDR_SND(((reg_addr&0xFF00)>>8),0,0); // stop
     REG_ADDR_SND((reg_addr&0xFF),0,1); // stop(0),repeat(1)
     DEV_ADDR_SND(dev_addr,1); // control byte with read
     REG_DATA_RCV(1); // stop
     uint32_t num = 5;
     GO_I2C(num);
     WAIT_I2C(num);
     if (((dataR&I2C_RUN_num_MSK)>>I2C_RUN_num)!=num) {
         return -1;
     }
     int err=0;
     int idx;
     for (idx=0; idx<(num-1); idx++) {
          REGRD(CSRA_I2C_RX_DATA, dataR);
          if (!(dataR&I2C_RX_DATA_ack_MSK)) {
              err++;
              printf("%s(0x%02X, 0x%02X): ACK error %d\n", __FUNCTION__, dev_addr, reg_addr, idx);
          }
     }
     REGRD(CSRA_I2C_RX_DATA, dataR);
     if ((dataR&I2C_RX_DATA_ack_MSK)) {
         err++;
         printf("%s(): NACK error %d (end of read should be NACK)\n", __FUNCTION__, idx);
     }
     *reg_data = (dataR&I2C_RX_DATA_dat_MSK);
     //----------------------------------------------
     #if defined(RIGOR)
     REGRD(CSRA_I2C_RUN, dataR);
     if (((dataR&I2C_RUN_rcv_items_MSK)>>I2C_RUN_rcv_items)!=0) {
          printf("none empty for rx buffer: %d\n", ((dataR&I2C_RUN_rcv_items)>>I2C_RUN_rcv_items));
     }
     #endif
     //----------------------------------------------
     return (err) ? -1 : 0;
}

//------------------------------------------------------------------------------
// read multiple I2C with 7-bit device address and 8-bit register address.
int i2c_readN_d7r16( uint8_t  dev_addr // device address in lower 7-bit
                   , unsigned short reg_addr
                   , uint8_t *reg_data
                   , uint8_t  reg_num )
{
     if (reg_data==NULL) return 0;
     uint32_t dataR, dataW;
     //----------------------------------------------
     #if defined(RIGOR)
     REGRD(CSRA_I2C_RUN, dataR);
     if (((dataR&I2C_RUN_snd_rooms_MSK)>>I2C_RUN_snd_rooms)!=ftx_num) {
          printf("none empty for tx buffer: %d\n", ((dataR&I2C_RUN_snd_rooms_MSK)>>I2C_RUN_snd_rooms));
     }
     #endif
     //----------------------------------------------
     // fill SND-FIFO
     DEV_ADDR_SND(dev_addr,0); // control byte with write
     REG_ADDR_SND(((reg_addr&0xFF00)>>8),0,0); // stop
     REG_ADDR_SND((reg_addr&0xFF),0,1); // stop(0),repeat(1)
     DEV_ADDR_SND(dev_addr,1); // control byte with read
     for (uint8_t idx=0; idx<(reg_num-1); idx++) {
          REG_DATA_RCV(0);
     }
     REG_DATA_RCV(1); // stop
     uint32_t num = 4 + reg_num;
     GO_I2C(num);
     WAIT_I2C(num);
     if (((dataR&I2C_RUN_num_MSK)>>I2C_RUN_num)!=num) {
         return -1;
     }
     int err=0;
     int idx;
     for (idx=0; idx<4; idx++) {
          REGRD(CSRA_I2C_RX_DATA, dataR);
          if (!(dataR&I2C_RX_DATA_ack_MSK)) { // should be ACK
              err++;
              printf("%s(0x%02X, 0x%02X): ACK error %d\n", __FUNCTION__, dev_addr, reg_addr, idx);
          }
     }
     uint8_t idy=0;
     for (idy=0; idy<(reg_num-1); idy++) {
          REGRD(CSRA_I2C_RX_DATA, dataR);
          if (!(dataR&I2C_RX_DATA_ack_MSK)) { // should be ACK
                   err++;
              printf("%s(): ACK error %d \n", __FUNCTION__, idx+idy);
          }
          reg_data[idy] = (dataR&I2C_RX_DATA_dat_MSK);
     }
     REGRD(CSRA_I2C_RX_DATA, dataR);
     if ((dataR&I2C_RX_DATA_ack_MSK)) { // should be NACK
              err++;
         printf("%s(): NACK error %d (end of read should be NACK)\n", __FUNCTION__, idx);
     }
     reg_data[idy] = (dataR&I2C_RX_DATA_dat_MSK);
     //----------------------------------------------
     #if defined(RIGOR)
     REGRD(CSRA_I2C_RUN, dataR);
     if (((dataR&I2C_RUN_rcv_items_MSK)>>I2C_RUN_rcv_items)!=0) {
          printf("none empty for rx buffer: %d\n", ((dataR&I2C_RUN_rcv_items)>>I2C_RUN_rcv_items));
     }
     #endif
     //----------------------------------------------
     return (err) ? -1 : 0;
}

//------------------------------------------------------------------------------
// write I2C with 7-bit device address and 16-bit register address.
int i2c_write_d7r16( uint8_t  dev_addr
                   , unsigned short reg_addr
                   , uint8_t  reg_data )
{
     uint32_t dataR, dataW;
     //----------------------------------------------
     #if defined(RIGOR)
     REGRD(CSRA_I2C_RUN, dataR);
     if (((dataR&I2C_RUN_snd_rooms_MSK)>>I2C_RUN_snd_rooms)!=ftx_num) {
          printf("none empty for tx buffer: %d\n", ((dataR&I2C_RUN_snd_rooms_MSK)>>I2C_RUN_snd_rooms));
     }
     #endif
     //----------------------------------------------
     // fill SND-FIFO
     DEV_ADDR_SND(dev_addr,0);
     REG_ADDR_SND(((reg_addr&0xFF00)>>8),0,0); // not stop yet
     REG_ADDR_SND((reg_addr&0xFF),0,0); // not stop yet
     REG_DATA_SND(reg_data,1); // stop
     uint32_t num = 4;
     GO_I2C(num);
     WAIT_I2C(num);
     if (((dataR&I2C_RUN_num_MSK)>>I2C_RUN_num)!=num) {
         return -1;
     }
     int err=0;
     for (int idx=0; idx<num; idx++) {
          REGRD(CSRA_I2C_RX_DATA, dataR);
          if (!(dataR&I2C_RX_DATA_ack_MSK)) {
              err++;
              printf("%s(0x%02X, 0x%02X): ACK error %d\n", __FUNCTION__, dev_addr, reg_addr, idx);
          }
     }
     //----------------------------------------------
     #if defined(RIGOR)
     REGRD(CSRA_I2C_RUN, dataR);
     if (((dataR&I2C_RUN_rcv_items_MSK)>>I2C_RUN_rcv_items)!=0) {
          printf("none empty for rx buffer: %d\n", ((dataR&I2C_RUN_rcv_items)>>I2C_RUN_rcv_items));
     }
     #endif
     //----------------------------------------------
     return (err) ? -1 : 0;
}

//------------------------------------------------------------------------------
// Do not forget to add sufficient dealy after write.
// write I2C with 7-bit device address and 8-bit register address.
int i2c_writeN_d7r16( uint8_t  dev_addr
                    , unsigned short reg_addr
                    , uint8_t *reg_data
                    , uint8_t  reg_num )
{
     uint32_t dataR, dataW;
     //----------------------------------------------
     #if defined(RIGOR)
     REGRD(CSRA_I2C_RUN, dataR);
     if (((dataR&I2C_RUN_snd_rooms_MSK)>>I2C_RUN_snd_rooms)!=ftx_num) {
          printf("none empty for tx buffer: %d\n", ((dataR&I2C_RUN_snd_rooms_MSK)>>I2C_RUN_snd_rooms));
     }
     #endif
     //----------------------------------------------
     // fill SND-FIFO
     DEV_ADDR_SND(dev_addr,0);
     REG_ADDR_SND(((reg_addr&0xFF00)>>8),0,0); // not stop yet
     REG_ADDR_SND((reg_addr&0xFF),0,0); // not stop yet
     uint8_t idx;
     for (idx=0; idx<(reg_num-1); idx++) {
          REG_DATA_SND(reg_data[idx],0); // stop
     }
     REG_DATA_SND(reg_data[idx],1); // stop
     uint32_t num = 3+reg_num;
     GO_I2C(num);
     WAIT_I2C(num);
     if (((dataR&I2C_RUN_num_MSK)>>I2C_RUN_num)!=num) {
         return -1;
     }
     int err=0;
     for (int idx=0; idx<num; idx++) { // pop all response
          REGRD(CSRA_I2C_RX_DATA, dataR);
          if (!(dataR&I2C_RX_DATA_ack_MSK)) { // should be ACK
              err++;
              printf("%s(0x%02X, 0x%02X): ACK error %d\n", __FUNCTION__, dev_addr, reg_addr, idx);
          }
     }
     //----------------------------------------------
     #if defined(RIGOR)
     REGRD(CSRA_I2C_RUN, dataR);
     if (((dataR&I2C_RUN_rcv_items_MSK)>>I2C_RUN_rcv_items)!=0) {
          printf("none empty for rx buffer: %d\n", ((dataR&I2C_RUN_rcv_items)>>I2C_RUN_rcv_items));
     }
     #endif
     //----------------------------------------------
     return (err) ? -1 : 0;
}

//------------------------------------------------------------------------------
// It generates RESET for I2C related blocks, but it does not affect
// enable and interrupt_enable.
//
int i2c_rst( void )
{
     uint32_t dataR, dataW;
     REGRD(CSRA_I2C_CONTROL, dataR);
     dataW = dataR|I2C_CTL_rst_MSK;
     REGWR(CSRA_I2C_CONTROL, dataW);
     dataW = dataR&~I2C_CTL_rst_MSK;
     REGWR(CSRA_I2C_CONTROL, dataW);
     return 0;
}

//------------------------------------------------------------------------------
int i2c_enable( void )
{
     uint32_t dataR, dataW;
     REGRD(CSRA_I2C_CONTROL, dataR);
     dataW = dataR|I2C_CTL_en_MSK;
     REGWR(CSRA_I2C_CONTROL, dataW);
     return 0;
}

//------------------------------------------------------------------------------
int i2c_disable( void )
{
     uint32_t dataR, dataW;
     REGRD(CSRA_I2C_CONTROL, dataR);
     dataW = dataR&~I2C_CTL_en_MSK;
     REGWR(CSRA_I2C_CONTROL, dataW);
     return 0;
}

//------------------------------------------------------------------------------
int i2c_sel ( uint32_t sel )// 4-bit (0 by default)
{
     uint32_t data;
     data = (sel&I2C_SEL_sel_MSK);
     REGWR(CSRA_I2C_SEL, data);
     current_i2c_id=sel&I2C_SEL_sel_MSK;
     return 0;
}

//------------------------------------------------------------------------------
//               __    __    __        __    __    __    __       __    __    __    __    __
// hidden SCL __|  |__|  |__|  |__|...|  |__|  |__|  |__|  |__|...  |__|  |__|  |__|  |__|
//            _____|_____    __        __    __          __       __    __       ____________
// SCL             |     \__| 1|__|...| 8|__|A |________| 1|__|...  |__|A |_____/
//            _____|      _____ ___....__             _____ ________            |      _____
// SDA             \_____X_____X___....__X_____X_____X_____X________X_____X_____|_____/
//                 |PRE  |                      |MID |                          |POST |GAP

//------------------------------------------------------------------------------
// gap      : GAP. 4-bit (1 by default)
// post     : POST. 4-bit (1 by default)
// mid      : MID. 4-bit (1 by default)
// pre      : PRE. 4-bit (1 by default)
int i2c_config ( uint32_t gap  // 4-bit (1 by default)
               , uint32_t post // 4-bit (1 by default)
               , uint32_t mid  // 4-bit (1 by default)
               , uint32_t pre )// 4-bit (1 by default)
{
     uint32_t data;
     if ((gap>0xF)||(post>0xF)||(mid>0xF)||(pre>0xF)) return -1;
     
     i2c_disable( );
     data = ((gap &0xF)<<I2C_CONF_gap )
          | ((post&0xF)<<I2C_CONF_post)
          | ((mid &0xF)<<I2C_CONF_mid )
          | ((pre &0xF)<<I2C_CONF_pre );
     REGWR(CSRA_I2C_CONFIG, data);
     return 0;
}

//------------------------------------------------------------------------------
// It disables the I2C master on entry.
int i2c_init ( uint32_t  i2c_freq )
{
     uint32_t dataR;
     i2c_disable( );

     REGRD(CSRA_I2C_STATUS, dataR);
     ftx_num = (dataR&I2C_STS_tx_depth_MSK)>>I2C_STS_tx_depth;
     frx_num = (dataR&I2C_STS_rx_depth_MSK)>>I2C_STS_rx_depth;

     REGRD (CSRA_I2C_CLK_FREQ, dataR);
     uint32_t clkfreq = dataR;

     double Fclkdiv = ((double)clkfreq/(double)i2c_freq)+0.5;
     uint32_t clkdiv = (uint32_t)Fclkdiv;

     REGWR(CSRA_I2C_SPEED, i2c_freq);
     REGWR(CSRA_I2C_CLKDIV, clkdiv);
     return 0;
}

//------------------------------------------------------------------------------
// accessing I2C Master CSR
int i2c_csr_read ( uint32_t  reg_addr // I2C data not items (i2c_items=2*items)
                 , uint32_t *reg_data )
{
     uint32_t value;
     if (reg_data==NULL) return 0;
     REGRD(reg_addr, value );
     *reg_data = value;
     return 0;
}

//------------------------------------------------------------------------------
// accessing I2C Master CSR
int i2c_csr_write( uint32_t  reg_addr // I2C data not items (i2c_items=2*items)
                 , uint32_t  reg_data )
{
     REGWR(reg_addr, reg_data);
     return 0;
}

//------------------------------------------------------------------------------
// accessing Intan I2C Master CSR
int i2c_csr_check( void )
{
     uint32_t dataR;
     REGRD(CSRA_I2C_VERSION , dataR); printf("VERSION  0x%08X\n", dataR);
     REGRD(CSRA_I2C_CONTROL , dataR); printf("CONTROL  0x%08X\n", dataR);
     REGRD(CSRA_I2C_STATUS  , dataR); printf("STATUS   0x%08X\n", dataR);
     REGRD(CSRA_I2C_CONFIG  , dataR); printf("CONFIG   0x%08X\n", dataR);
     REGRD(CSRA_I2C_SEL     , dataR); printf("SEL      0x%08X\n", dataR);
     REGRD(CSRA_I2C_CLK_FREQ, dataR); printf("CLK_FREQ 0x%08X:%.3f-MHz\n", dataR, (float)dataR/1000000.0);
     REGRD(CSRA_I2C_SPEED   , dataR); printf("SPEED    0x%08X:%.3f-kHz\n", dataR, (float)dataR/1000.0);
     REGRD(CSRA_I2C_CLKDIV  , dataR); printf("CLKDIV   0x%08X\n", dataR);
     REGRD(CSRA_I2C_RUN     , dataR); printf("RUN      0x%08X\n", dataR);
     REGRD(CSRA_I2C_TX_DATA , dataR); printf("TX_DATA  0x%08X\n", dataR);
     REGRD(CSRA_I2C_RX_DATA , dataR); printf("RX_DATA  0x%08X\n", dataR);
     return 0;
}

//------------------------------------------------------------------------------
int i2c_get_config ( uint32_t *gap  // 4-bit (1 by default)
                   , uint32_t *post // 4-bit (1 by default)
                   , uint32_t *mid  // 4-bit (1 by default)
                   , uint32_t *pre )// 4-bit (1 by default)
{
     uint32_t data;
     REGRD(CSRA_I2C_CONFIG, data);
     if (gap !=NULL) *gap  = (data&I2C_CONF_gap_MSK )>>I2C_CONF_gap ;
     if (post!=NULL) *post = (data&I2C_CONF_post_MSK)>>I2C_CONF_post;
     if (mid !=NULL) *mid  = (data&I2C_CONF_mid_MSK)>>I2C_CONF_mid  ;
     if (pre !=NULL) *pre  = (data&I2C_CONF_pre_MSK )>>I2C_CONF_pre ;
     return 0;
}

//------------------------------------------------------------------------------
uint32_t i2c_get_busy ( void )
{
     uint32_t data;
     REGRD(CSRA_I2C_STATUS, data);
     return (data&I2C_STS_busy_MSK);
}

//------------------------------------------------------------------------------
uint32_t i2c_get_sel ( void )
{
     uint32_t data;
     REGRD(CSRA_I2C_SEL, data);
     return (data&I2C_SEL_sel_MSK);
}

//------------------------------------------------------------------------------
uint32_t i2c_get_clk_freq( void )
{
     uint32_t dataR;
     REGRD(CSRA_I2C_CLK_FREQ, dataR);
     return dataR;
}

//------------------------------------------------------------------------------
uint32_t i2c_get_clk_div ( void )
{
     uint32_t dataR;
     REGRD(CSRA_I2C_CLKDIV  , dataR);
     return dataR;
}

//------------------------------------------------------------------------------
int i2c_set_addr( uint32_t offset )
{
    CSRA_I2C_BASE    = offset;
    CSRA_I2C_VERSION =(offset+0x00);
    CSRA_I2C_CONTROL =(offset+0x04);
    CSRA_I2C_STATUS  =(offset+0x08);
    CSRA_I2C_CONFIG  =(offset+0x0C);
    CSRA_I2C_SEL     =(offset+0x10);
    CSRA_I2C_CLK_FREQ=(offset+0x20);
    CSRA_I2C_SPEED   =(offset+0x24);
    CSRA_I2C_CLKDIV  =(offset+0x28);
    CSRA_I2C_RUN     =(offset+0x30);
    CSRA_I2C_TX_DATA =(offset+0x40);
    CSRA_I2C_RX_DATA =(offset+0x50);

    return 0;
}

//------------------------------------------------------------------------------
uint32_t i2c_get_addr( void )
{
    return CSRA_I2C_BASE;
}
//------------------------------------------------------------------------------
// Revision History
//
// 2018.01.14: i2c_readN_d7r16()/i2c_writeN_d7R16() added.
// 2018.01.13: i2c_readN_d7r8()/i2c_writeN_d7R8() added.
// 2019.01.02: Start by Ando Ki (adki@future-ds.com)
//------------------------------------------------------------------------------
