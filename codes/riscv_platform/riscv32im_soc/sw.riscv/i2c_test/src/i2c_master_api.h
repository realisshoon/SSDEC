#ifndef I2C_MASTER_API_H
#define I2C_MASTER_API_H
//------------------------------------------------------------------------------
// Copyright (c) 2019 by Future Design Systems.
// All right reserved.
//
// http://www.future-ds.com
//------------------------------------------------------------------------------
// i2c_master_api.h
//------------------------------------------------------------------------------
// VERSION = 2019.01.14.
//------------------------------------------------------------------------------
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

extern int i2c_read_d7r8( uint8_t  dev_addr //7-bit format
                        , uint8_t  reg_addr
                        , uint8_t *reg_data );
extern int i2c_readN_d7r8( uint8_t  dev_addr //7-bit format
                         , uint8_t  reg_addr
                         , uint8_t *reg_data
                         , uint8_t  reg_num );
extern int i2c_write_d7r8( uint8_t  dev_addr //7-bit format
                         , uint8_t  reg_addr
                         , uint8_t  reg_data );
extern int i2c_writeN_d7r8( uint8_t  dev_addr //7-bit format
                          , uint8_t  reg_addr
                          , uint8_t *reg_data
                          , uint8_t  reg_num );
extern int i2c_read_d7r16( uint8_t  dev_addr //7-bit format
                         , unsigned short reg_addr
                         , uint8_t *reg_data );
extern int i2c_readN_d7r16( uint8_t  dev_addr //7-bit format
                          , unsigned short reg_addr
                          , uint8_t *reg_data
                         , uint8_t  reg_num );
extern int i2c_write_d7r16( uint8_t  dev_addr //7-bit format
                          , unsigned short reg_addr
                          , uint8_t  reg_data );
extern int i2c_writeN_d7r16( uint8_t  dev_addr //7-bit format
                           , unsigned short reg_addr
                           , uint8_t *reg_data
                           , uint8_t  reg_num );

extern int i2c_rst( void );
extern int i2c_enable( void );
extern int i2c_disable ( void );
extern int i2c_sel    ( uint32_t sel ); // 4-bit (0 by default)
extern int i2c_config ( uint32_t gap  // 4-bit (1 by default)
                      , uint32_t post // 4-bit (1 by default)
                      , uint32_t mid  // 4-bit (1 by default)
                      , uint32_t pre);// 4-bit (1 by default)
extern int i2c_init ( uint32_t  i2c_freq ); // SCL frequency

extern int i2c_csr_read( uint32_t  reg_addr // I2C MASTER CSR REG
                       , uint32_t *reg_data );
extern int i2c_csr_write( uint32_t reg_addr // I2C MASTER CSR REG
                        , uint32_t reg_data );
extern int i2c_get_config ( uint32_t *gap   // 4-bit (1 by default)
                          , uint32_t *post  // 4-bit (1 by default)
                          , uint32_t *mid   // 4-bit (1 by default)
                          , uint32_t *pre );// 4-bit (1 by default)
extern uint32_t i2c_get_busy ( void );
extern uint32_t i2c_get_sel( void );
extern uint32_t i2c_get_clk_freq( void );
extern uint32_t i2c_get_clk_div ( void );
extern int i2c_csr_check( void );

extern int i2c_set_addr( uint32_t offset );
extern uint32_t i2c_get_addr( void );

#ifdef __cplusplus
}
#endif
//------------------------------------------------------------------------------
// Revision History
//
// 2018.01.14: i2c_readN_d7r16()/i2c_writeN_d7R16() added.
// 2018.01.13: i2c_readN_d7r8()/i2c_writeN_d7R8() added.
// 2019.01.02: Start by Ando Ki (adki@future-ds.com)
//------------------------------------------------------------------------------
#endif
