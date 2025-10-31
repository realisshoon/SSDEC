/**
 * @file main_simple.c
 * @brief I2C 신호 검증용 간단한 테스트
 * 
 * EEPROM 없이 I2C 마스터가 신호를 제대로 출력하는지만 확인
 * Timeout 발생해도 파형에서 I2C 프로토콜은 관찰 가능
 */
#include "uart_api.h"
#include "i2c_api.h"
#include "my_printf.h"
#include <stdint.h>

// 간단한 지연
void delay_short(uint32_t count) {
    for(volatile uint32_t i = 0; i < count; i++);
}

int main() {
    // UART 초기화
    uart_set_addr(0x90020000);
    uart_init(0, 115200, 8, 0, 1);
    
    my_printf("\r\n");
    my_printf("==================================================\r\n");
    my_printf("  I2C 신호 검증 테스트 (간단 버전)\r\n");
    my_printf("==================================================\r\n");
    my_printf("UART 초기화 완료\r\n");
    
    // I2C 초기화
    i2c_set_addr(0x90040000);
    i2c_init();
    my_printf("I2C 초기화 완료 (베이스 주소: 0x90040000)\r\n");
    
    // 간단한 I2C Write 테스트 (ACK 무시)
    my_printf("\r\n=== I2C Write 신호 테스트 ===\r\n");
    my_printf("주소 0x00에 0xA5 쓰기 시도...\r\n");
    my_printf("(EEPROM 없어도 SDA/SCL 신호는 출력됨)\r\n");
    
    // I2C 레지스터 직접 접근 (timeout 무시)
    volatile uint32_t *i2c_base = (volatile uint32_t *)0x90040000;
    
    my_printf("\r\n=== 트랜잭션 1: 주소 0x00에 0xA5 쓰기 ===\r\n");
    // Device address 설정
    *(i2c_base + 1) = 0x50;  // 0x04: DEV_ADDR_REG = 0x50 (AT24C02)
    my_printf("Device Address: 0x50\r\n");
    
    // Memory address 설정  
    *(i2c_base + 2) = 0x00;  // 0x08: MEM_ADDR_REG = 0x00
    my_printf("Memory Address: 0x00\r\n");
    
    // Write data 설정
    *(i2c_base + 3) = 0xA5;  // 0x0C: WR_DATA_REG = 0xA5
    my_printf("Write Data: 0xA5\r\n");
    
    // START 명령 (Write)
    my_printf("I2C START...\r\n");
    *(i2c_base + 0) = 0x01;  // 0x00: CONTROL_REG = 0x01 (START + WRITE)
    
    // 대기 (I2C 신호가 출력되는 동안)
    delay_short(100000);  // I2C 통신 시간
    
    // Status 확인
    uint32_t status = *(i2c_base + 5);  // 0x14: STATUS_REG
    my_printf("Status: 0x%02X\r\n", status);
    
    // ========== 트랜잭션 2 ==========
    my_printf("\r\n=== 트랜잭션 2: 주소 0x10에 0x5A 쓰기 ===\r\n");
    *(i2c_base + 2) = 0x10;  // Memory Address: 0x10
    my_printf("Memory Address: 0x10\r\n");
    
    *(i2c_base + 3) = 0x5A;  // Write Data: 0x5A
    my_printf("Write Data: 0x5A\r\n");
    
    *(i2c_base + 0) = 0x01;  // START
    my_printf("I2C START...\r\n");
    
    delay_short(100000);
    status = *(i2c_base + 5);
    my_printf("Status: 0x%02X\r\n", status);
    
    // ========== 트랜잭션 3 ==========
    my_printf("\r\n=== 트랜잭션 3: 주소 0x20에 0xFF 쓰기 ===\r\n");
    *(i2c_base + 2) = 0x20;  // Memory Address: 0x20
    my_printf("Memory Address: 0x20\r\n");
    
    *(i2c_base + 3) = 0xFF;  // Write Data: 0xFF
    my_printf("Write Data: 0xFF\r\n");
    
    *(i2c_base + 0) = 0x01;  // START
    my_printf("I2C START...\r\n");
    
    delay_short(100000);
    status = *(i2c_base + 5);
    my_printf("Status: 0x%02X\r\n", status);
    
    // ========== 트랜잭션 4 ==========
    my_printf("\r\n=== 트랜잭션 4: 주소 0x30에 0x00 쓰기 ===\r\n");
    *(i2c_base + 2) = 0x30;  // Memory Address: 0x30
    my_printf("Memory Address: 0x30\r\n");
    
    *(i2c_base + 3) = 0x00;  // Write Data: 0x00
    my_printf("Write Data: 0x00\r\n");
    
    *(i2c_base + 0) = 0x01;  // START
    my_printf("I2C START...\r\n");
    
    delay_short(100000);
    status = *(i2c_base + 5);
    my_printf("Status: 0x%02X\r\n", status);
    
    my_printf("\r\n=== 파형 확인 포인트 ===\r\n");
    my_printf("1. i2c_scl: 클럭 신호 토글 확인\r\n");
    my_printf("2. i2c_sda: START 조건 확인 (SCL=H, SDA H->L)\r\n");
    my_printf("3. i2c_sda: Device Address 전송 (0xA0)\r\n");
    my_printf("4. i2c_sda: Word Address 전송 (0x00)\r\n");
    my_printf("5. i2c_sda: Data 전송 (0xA5)\r\n");
    
    my_printf("\r\n==================================================\r\n");
    my_printf("  테스트 완료 - 파형 확인하세요!\r\n");
    my_printf("==================================================\r\n");
    
    // 시뮬레이션 종료 (무한 루프 없음)
    my_printf("\r\n프로그램 종료\r\n");
    
    return 0;
}

