/**
 * @file main.c
 * @brief I2C EEPROM (AT24C02) Test Program
 *
 * @author Team 2
 */
#include "uart_api.h"
#include "i2c_api.h"
#include "my_printf.h"
#include <stdint.h>

// 지연 함수
void delay_ms(uint32_t ms) {
    for(volatile uint32_t i = 0; i < ms * 10000; i++);
}

// I2C 상태 출력
void print_i2c_status(void) {
    uint32_t status = i2c_get_status();
    my_printf("I2C Status: 0x%02X ", status);
    if (status & 0x01) {
        my_printf("[BUSY] ");
    } else {
        my_printf("[READY] ");
    }
    if (status & 0x02) {
        my_printf("[ERROR]");
    }
    my_printf("\r\n");
}

// 단일 바이트 테스트
void test_single_byte(void) {
    uint8_t addr = 0x00;
    uint8_t write_data = 0xA5;
    uint8_t read_data;
    
    my_printf("\r\n=== 단일 바이트 읽기/쓰기 테스트 ===\r\n");
    my_printf("주소: 0x%02X, 쓰기 데이터: 0x%02X\r\n", addr, write_data);
    
    // Write
    my_printf("EEPROM에 쓰기 중...\r\n");
    i2c_eeprom_write(addr, write_data);
    print_i2c_status();
    
    // Read
    my_printf("EEPROM에서 읽기 중...\r\n");
    read_data = i2c_eeprom_read(addr);
    print_i2c_status();
    
    // 결과 확인
    my_printf("읽은 데이터: 0x%02X\r\n", read_data);
    if (read_data == write_data) {
        my_printf("✓ 테스트 성공!\r\n");
    } else {
        my_printf("✗ 테스트 실패! (기대값: 0x%02X, 실제값: 0x%02X)\r\n", 
                  write_data, read_data);
    }
}

// 연속 주소 테스트
void test_sequential_addresses(void) {
    my_printf("\r\n=== 연속 주소 읽기/쓰기 테스트 ===\r\n");
    
    uint8_t test_data[16];
    uint8_t read_data[16];
    int errors = 0;
    
    // 테스트 데이터 생성
    for (int i = 0; i < 16; i++) {
        test_data[i] = 0x10 + i;
    }
    
    // Write
    my_printf("0x00-0x0F에 데이터 쓰기 중...\r\n");
    for (int i = 0; i < 16; i++) {
        my_printf("  [0x%02X] = 0x%02X\r\n", i, test_data[i]);
        i2c_eeprom_write(i, test_data[i]);
        delay_ms(10);  // Write Cycle Time
    }
    
    // Read
    my_printf("\r\n0x00-0x0F에서 데이터 읽기 중...\r\n");
    for (int i = 0; i < 16; i++) {
        read_data[i] = i2c_eeprom_read(i);
        my_printf("  [0x%02X] = 0x%02X", i, read_data[i]);
        
        if (read_data[i] != test_data[i]) {
            my_printf(" ✗ 오류!\r\n");
            errors++;
        } else {
            my_printf(" ✓\r\n");
        }
        delay_ms(5);
    }
    
    // 결과
    my_printf("\r\n테스트 결과: %d개 / 16개 성공\r\n", 16 - errors);
    if (errors == 0) {
        my_printf("✓ 모든 테스트 통과!\r\n");
    } else {
        my_printf("✗ %d개 오류 발생\r\n", errors);
    }
}

// 패턴 테스트
void test_patterns(void) {
    my_printf("\r\n=== 데이터 패턴 테스트 ===\r\n");
    
    uint8_t patterns[] = {0x00, 0xFF, 0xAA, 0x55, 0x0F, 0xF0};
    int pattern_count = sizeof(patterns) / sizeof(patterns[0]);
    uint8_t addr = 0x10;
    int errors = 0;
    
    for (int i = 0; i < pattern_count; i++) {
        uint8_t pattern = patterns[i];
        uint8_t read_val;
        
        my_printf("패턴 0x%02X 테스트...\r\n", pattern);
        
        // Write
        i2c_eeprom_write(addr, pattern);
        delay_ms(10);
        
        // Read
        read_val = i2c_eeprom_read(addr);
        
        // Verify
        my_printf("  쓰기: 0x%02X, 읽기: 0x%02X ", pattern, read_val);
        if (read_val == pattern) {
            my_printf("✓\r\n");
        } else {
            my_printf("✗\r\n");
            errors++;
        }
    }
    
    my_printf("\r\n패턴 테스트 결과: %d개 / %d개 성공\r\n", 
              pattern_count - errors, pattern_count);
}

// 메모리 덤프
void dump_eeprom(uint8_t start, uint8_t len) {
    my_printf("\r\n=== EEPROM 메모리 덤프 ===\r\n");
    my_printf("주소 범위: 0x%02X - 0x%02X\r\n", start, start + len - 1);
    my_printf("\r\n     ");
    
    // 헤더
    for (int i = 0; i < 16; i++) {
        my_printf(" %X ", i);
    }
    my_printf("\r\n");
    my_printf("-----");
    for (int i = 0; i < 16; i++) {
        my_printf("---");
    }
    my_printf("\r\n");
    
    // 데이터
    for (int addr = start; addr < start + len; addr++) {
        if ((addr % 16) == 0) {
            my_printf("%02X | ", addr);
        }
        
        uint8_t data = i2c_eeprom_read(addr);
        my_printf("%02X ", data);
        
        if ((addr % 16) == 15 || addr == start + len - 1) {
            my_printf("\r\n");
        }
        
        delay_ms(5);
    }
}

int main() {
    // UART 초기화
    uart_set_addr(0x90020000);
    uart_init(0, 115200, 8, 0, 1);
    
    my_printf("\r\n");
    my_printf("==================================================\r\n");
    my_printf("  I2C EEPROM (AT24C02) 테스트 프로그램\r\n");
    my_printf("==================================================\r\n");
    my_printf("UART 초기화 완료 (115200bps)\r\n");
    
    // I2C 초기화
    i2c_set_addr(0x90040000);  // I2C 베이스 주소 (실제 주소에 맞게 수정)
    i2c_init();
    my_printf("I2C 초기화 완료\r\n");
    
    print_i2c_status();
    
    // 테스트 시작
    my_printf("\r\n테스트 시작...\r\n");
    delay_ms(100);
    
    // 1. 단일 바이트 테스트
    test_single_byte();
    delay_ms(100);
    
    // 2. 연속 주소 테스트
    test_sequential_addresses();
    delay_ms(100);
    
    // 3. 패턴 테스트
    test_patterns();
    delay_ms(100);
    
    // 4. 메모리 덤프
    dump_eeprom(0x00, 32);
    
    // 완료
    my_printf("\r\n");
    my_printf("==================================================\r\n");
    my_printf("  모든 테스트 완료!\r\n");
    my_printf("==================================================\r\n");
    
#ifdef SIMULATION
    // 시뮬레이션: 테스트 후 종료
    my_printf("\r\n[SIMULATION MODE] 시뮬레이션 종료\r\n");
    my_printf("$finish 호출\r\n");
    // Note: Verilog $finish는 C에서 직접 호출 불가, 시간 제한으로 종료됨
#else
    // 실제 하드웨어: 무한 루프 (계속 모니터링)
    my_printf("\r\nEEPROM 모니터링 모드 (주소 0x00-0x0F)...\r\n");
    while(1) {
        delay_ms(5000);  // 5초마다
        dump_eeprom(0x00, 16);
    }
#endif
    
    return 0;
}

