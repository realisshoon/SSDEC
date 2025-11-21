/**
 * @file i2c_api.c
 * @brief I2C AXI-Lite peripheral API based on i2c_csr.v.
 */
//------------------------------------------------------------------------------
// Copyright (c) 2025
// All rights reserved.
//------------------------------------------------------------------------------
#include <stdio.h>
#include <stdint.h>
#include "i2c_api.h"
// If standard printf is unavailable (no libc), map to my_printf
#if !defined(I2C_API_USE_STDIO)
#include "my_printf.h"
#define printf my_printf
#endif

#ifdef __cplusplus
extern "C" {
#endif

//------------------------------------------------------------------------------
// Register access macros (same convention as gpio_api.c)
//------------------------------------------------------------------------------
#if defined(TRX_BFM) && (TRX_BFM==1)
    #include "trx_axi_api.h"
    extern con_Handle_t con_handle;
    #define CSR_READ(A, D)  BfmRead (con_handle, (unsigned int)(A), (unsigned int*)&(D), 4, 1)
    #define CSR_WRITE(A, D) BfmWrite(con_handle, (unsigned int)(A), (unsigned int*)&(D), 4, 1)
#elif defined(COSIM_LIB) && (COSIM_LIB==1)
    #include "cosim_bfm_api.h"
    #define CSR_READ(A, D)  bfm_read ((uint32_t)(A), (uint8_t*)&(D), 4, 1)
    #define CSR_WRITE(A, D) bfm_write((uint32_t)(A), (uint8_t*)&(D), 4, 1)
#elif defined(XDMA_LIB) && (XDMA_LIB==1)
    #include "xdma_api.h"
    extern XdmaHandle_t xdma_handle;
    #define CSR_READ(A, D)  xdmaUserRegRead (xdma_handle, A, &(D))
    #define CSR_WRITE(A, D) xdmaUserRegWrite(xdma_handle, A, D)
#else
#   define CSR_WRITE(A, B)   *(volatile unsigned *)(A) = (B);
#   define CSR_READ(A, B)    (B) = *(volatile unsigned *)(A);
#endif

//------------------------------------------------------------------------------
// MMIO safe helpers: use byte-wise reads on bare-metal to avoid bus quirks
//------------------------------------------------------------------------------
static inline void io_fence(void)
{
#if defined(__riscv)
    __asm__ __volatile__("fence iorw, iorw" ::: "memory");
#endif
}

static inline uint32_t mmio_read32_safe(uint32_t addr)
{
#if defined(TRX_BFM) && (TRX_BFM==1)
    uint32_t v; CSR_READ(addr, v); return v;
#elif defined(COSIM_LIB) && (COSIM_LIB==1)
    uint32_t v; CSR_READ(addr, v); return v;
#elif defined(XDMA_LIB) && (XDMA_LIB==1)
    uint32_t v; CSR_READ(addr, v); return v;
#else
    // 바이트 단위 읽기가 정지하는 환경이 있어 워드 단위로 읽도록 변경
    printf("mmio_read32_safe: addr=0x%08x 진입\n", addr);
    io_fence();
    volatile uint32_t* p = (volatile uint32_t*)addr;
    uint32_t v = *p;
    io_fence();
    printf("mmio_read32_safe: 완료 v=0x%08x\n", v);
    return v;
#endif
}

//------------------------------------------------------------------------------
// Base address and register offsets (see i2c_csr.v)
//------------------------------------------------------------------------------
static uint32_t ADDR_I2C    = 0x90040000U; // override via i2c_set_addr()
static uint32_t CSRA_VERSION;
static uint32_t CSRA_NAME;
static uint32_t CSRA_DATA0;
static uint32_t CSRA_DATA1;
static uint32_t CSRA_STATUS;
static uint32_t CSRA_DATA2;
static uint8_t  i2c_map_ready = 0;

static void i2c_recalc_map(void)
{
    CSRA_VERSION = ADDR_I2C + 0x00;
    CSRA_NAME    = ADDR_I2C + 0x04;
    CSRA_DATA0   = ADDR_I2C + 0x08;
    CSRA_DATA1   = ADDR_I2C + 0x0C;
    CSRA_STATUS  = ADDR_I2C + 0x10;
    CSRA_DATA2   = ADDR_I2C + 0x14;
    i2c_map_ready = 1;
}

static inline void i2c_ensure_mapped(void)
{
    if (!i2c_map_ready) {
        i2c_recalc_map();
    }
}

// initialize mapping at load time
__attribute__((constructor))
static void __i2c_api_ctor(void) { i2c_recalc_map(); }

//------------------------------------------------------------------------------
// Register-level helpers
//------------------------------------------------------------------------------
uint32_t i2c_read_data(void)
{
    i2c_ensure_mapped();
    return mmio_read32_safe(CSRA_DATA2);
}

void i2c_write_data(uint32_t value)
{
    i2c_ensure_mapped();
    CSR_WRITE(CSRA_DATA1, value);
}

uint32_t i2c_get_status(void)
{
    printf("i2c_get_status\n");
    i2c_ensure_mapped();
    printf("i2c_get_status 2\n");
    uint32_t status = mmio_read32_safe(CSRA_STATUS);
    printf("i2c_get_status 3: %u\n", status);
    return status;
}

void i2c_start_simple(uint8_t dev7,
                      uint8_t word,
                      uint8_t is_read,
                      uint8_t random,
                      uint8_t page)
{
    i2c_ensure_mapped();
    uint32_t ctrl = 0;
    ctrl |= I2C_CTRL_DEV7(dev7);
    ctrl |= I2C_CTRL_RW(is_read);
    ctrl |= I2C_CTRL_WORD(word);
    ctrl |= I2C_CTRL_RANDOM(random);
    ctrl |= I2C_CTRL_PAGE(page);
    ctrl |= I2C_CTRL_START;
    CSR_WRITE(CSRA_DATA0, ctrl);
}

//------------------------------------------------------------------------------
// CSR dump and base address management
//------------------------------------------------------------------------------
void i2c_csr(void)
{
    i2c_ensure_mapped();

    printf("CSR in\n");
    uint32_t dataR;
    volatile int i;
    
    // 각 레지스터 읽기 사이에 충분한 지연을 추가하여 파형에서 구분 가능하도록 함
    printf("=== Reading CSRA_VERSION (0x%08X) ===\n", CSRA_VERSION);
    fflush(stdout);
    for (i = 0; i < 100000; i++); // 읽기 전 지연
    dataR = mmio_read32_safe(CSRA_VERSION); 
    printf("I2C VERSION: 0x%08x\n", dataR);
    fflush(stdout);
    for (i = 0; i < 200000; i++); // 읽기 후 지연
    
    printf("=== Reading CSRA_NAME (0x%08X) ===\n", CSRA_NAME);
    fflush(stdout);
    for (i = 0; i < 100000; i++); // 읽기 전 지연
    dataR = mmio_read32_safe(CSRA_NAME); 
    printf("I2C NAME   : 0x%08x\n", dataR);
    fflush(stdout);
    for (i = 0; i < 200000; i++); // 읽기 후 지연
    
    printf("=== Reading CSRA_DATA0 (0x%08X) ===\n", CSRA_DATA0);
    fflush(stdout);
    for (i = 0; i < 100000; i++); // 읽기 전 지연
    dataR = mmio_read32_safe(CSRA_DATA0); 
    printf("I2C DATA0  : 0x%08x\n", dataR);
    fflush(stdout);
    for (i = 0; i < 200000; i++); // 읽기 후 지연
    
    printf("=== Reading CSRA_DATA1 (0x%08X) ===\n", CSRA_DATA1);
    fflush(stdout);
    for (i = 0; i < 100000; i++); // 읽기 전 지연
    dataR = mmio_read32_safe(CSRA_DATA1); 
    printf("I2C DATA1  : 0x%08x\n", dataR);
    fflush(stdout);
    for (i = 0; i < 200000; i++); // 읽기 후 지연
    
    printf("=== Reading CSRA_STATUS (0x%08X) ===\n", CSRA_STATUS);
    fflush(stdout);
    for (i = 0; i < 100000; i++); // 읽기 전 지연
    dataR = mmio_read32_safe(CSRA_STATUS); 
    printf("I2C STATUS : 0x%08x\n", dataR);
    fflush(stdout);
    for (i = 0; i < 200000; i++); // 읽기 후 지연
    
    printf("=== Reading CSRA_DATA2 (0x%08X) ===\n", CSRA_DATA2);
    fflush(stdout);
    for (i = 0; i < 100000; i++); // 읽기 전 지연
    dataR = mmio_read32_safe(CSRA_DATA2); 
    printf("I2C DATA2  : 0x%08x\n", dataR);
    fflush(stdout);
    for (i = 0; i < 200000; i++); // 읽기 후 지연
    
    printf("=== CSR dump complete ===\n");
    fflush(stdout);
}

int i2c_set_addr(uint32_t offset)
{
    ADDR_I2C = offset;
    i2c_recalc_map();
    return 0;
}

uint32_t i2c_get_addr(void)
{
    return ADDR_I2C;
}

//------------------------------------------------------------------------------
// EEPROM convenience functions (AT24C series, typically at 0x50)
//------------------------------------------------------------------------------
#define EEPROM_DEV7_ADDR  0x50  // 7-bit I2C address for AT24C EEPROM

static inline void i2c_delay_ms(volatile uint32_t ms)
{
    volatile uint32_t count = ms * 10000; // 클럭에 따라 조정
    while (count--);
}

int i2c_eeprom_read_bytes(uint8_t addr, uint8_t *data, uint8_t len)
{
    if (data == NULL || len == 0) {
        return -1;
    }
    
    // Random read: write address first, then read
    i2c_start_simple(EEPROM_DEV7_ADDR, addr, 0, 0, 0); // Write address
    // Wait for transaction to complete (simplified - should check status)
    i2c_delay_ms(1);
    
    // Now read the data
    i2c_start_simple(EEPROM_DEV7_ADDR, addr, 1, 1, 0); // Random read
    i2c_delay_ms(1);
    
    // Read data (simplified - should read in loop for len > 1)
    if (len > 0) {
        uint32_t read_val = i2c_read_data();
        data[0] = (uint8_t)(read_val & 0xFF);
    }
    
    return 0;
}

int i2c_eeprom_write_bytes(uint8_t addr, const uint8_t *data, uint8_t len)
{
    if (data == NULL || len == 0) {
        return -1;
    }
    
    // Write address and data
    i2c_write_data((uint32_t)data[0]);
    i2c_start_simple(EEPROM_DEV7_ADDR, addr, 0, 0, 0); // Write
    i2c_delay_ms(10); // EEPROM write cycle time
    
    return 0;
}

//------------------------------------------------------------------------------
#undef CSR_WRITE
#undef CSR_READ

#ifdef __cplusplus
}
#endif

//------------------------------------------------------------------------------
// Revision History
// 2025.11.07: Initial version.
//------------------------------------------------------------------------------
