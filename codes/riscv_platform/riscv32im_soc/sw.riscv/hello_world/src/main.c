#include "uart_api.h"
#include "my_printf.h"
#include "gpio_api.h"
#include "keypad_api.h"
#include "i2c_api.h"
#include <stdint.h>

#ifndef BAUD_RATE
#    define BAUD_RATE  115200
#endif

#define UART_BASE_ADDR   0x90020000
#define GPIO_BASE_ADDR   0x90030000
#define I2C_BASE_ADDR    0x90040000
#define PASSWORD_LENGTH  4
#define EEPROM_PASSWORD_ADDR  0x00  // EEPROM에 비밀번호 저장할 주소

// 간단한 지연 함수
static void delay_ms(volatile uint32_t ms) {
    volatile uint32_t count = ms * 10000; // 클럭에 따라 조정
    while (count--);
}

// LED 제어 함수 (GPIO 비트 8-15 사용, 0=OFF, 1=ON)
// GPIO 출력 레지스터를 직접 사용
static uint32_t gpio_output_value = 0x0000000F;  // 기본값: 키패드 Column만 HIGH

static void led_set(uint32_t led_mask) {
    // GPIO 출력의 상위 비트(8-15)를 LED로 사용
    gpio_output_value = (gpio_output_value & 0x000000FF) | (led_mask << 8);
    gpio_write(gpio_output_value);
}

// LED 모두 끄기
static void led_clear(void) {
    gpio_output_value = gpio_output_value & 0x000000FF;  // LED 비트만 클리어
    gpio_write(gpio_output_value);
}

// EEPROM에서 비밀번호 읽기
static int read_password_from_eeprom(char *password) {
    uint8_t data[PASSWORD_LENGTH];
    if (i2c_eeprom_read_bytes(EEPROM_PASSWORD_ADDR, data, PASSWORD_LENGTH) != 0) {
        return -1;
    }
    for (int i = 0; i < PASSWORD_LENGTH; i++) {
        password[i] = (char)data[i];
    }
    return 0;
}

// EEPROM에 비밀번호 저장
static int save_password_to_eeprom(const char *password) {
    uint8_t data[PASSWORD_LENGTH];
    for (int i = 0; i < PASSWORD_LENGTH; i++) {
        data[i] = (uint8_t)password[i];
    }
    if (i2c_eeprom_write_bytes(EEPROM_PASSWORD_ADDR, data, PASSWORD_LENGTH) != 0) {
        return -1;
    }
    return 0;
}

// EEPROM에 비밀번호가 저장되어 있는지 확인
static int is_password_set(void) {
    uint8_t data[PASSWORD_LENGTH];
    // EEPROM 읽기 실패 시 비밀번호 없음으로 간주 (블로킹 방지)
    if (i2c_eeprom_read_bytes(EEPROM_PASSWORD_ADDR, data, PASSWORD_LENGTH) != 0) {
        return 0;
    }
    for (int i = 0; i < PASSWORD_LENGTH; i++) {
        if (data[i] != 0xFF) {
            return 1;
        }
    }
    return 0;
}

int main()
{
    // UART 초기화 - 클럭 주파수를 명시적으로 지정 (100MHz)
    uart_set_addr(UART_BASE_ADDR);
    uart_init(100000000, BAUD_RATE, 8, 0, 1);  // 100MHz 클럭 명시
    

    // GPIO 및 키패드 초기화
    gpio_set_addr(GPIO_BASE_ADDR);
    keypad_init(GPIO_BASE_ADDR);
    
    uint32_t key_release_count = 0;
    // GPIO 설정: 하위 8비트는 키패드용, 상위 비트는 LED용
    gpio_init(0x0000FFFF, 0, 0, 0);
    gpio_write(0x0000000F);  // 키패드 Column 초기화
    led_clear();
    
    my_printf("GPIO initialized\r\n");
    delay_ms(100);
    
    // I2C 초기화 (EEPROM 읽기는 나중에)
    i2c_set_addr(I2C_BASE_ADDR);
    
    my_printf("I2C initialized\r\n");
    delay_ms(100);
    
    // 시스템 상태
    enum {
        MODE_INIT,          // [init] - 비밀번호 등록 안됨
        MODE_SET_PASSWORD,  // [set_password] - 비밀번호 설정 중
        MODE_HOME,          // [home] - 비밀번호 입력 대기
        MODE_UNLOCK         // [unlock] - 잠금 해제됨
    } system_mode;
    
    // 저장된 비밀번호
    char stored_password[PASSWORD_LENGTH];
    // EEPROM 읽기 시도 (실패해도 계속 진행)
    int password_exists = 0;
    if (is_password_set()) {
        if (read_password_from_eeprom(stored_password) == 0) {
            password_exists = 1;
            system_mode = MODE_HOME;
            my_printf("\r\n=== HOME MODE ===\r\n");
            my_printf("Enter 4-digit password to unlock\r\n");
            my_printf("If you want to set new password, Press A to set new password\r\n");
        } else {
            password_exists = 0;
            system_mode = MODE_INIT;
            my_printf("\r\n=== INIT MODE ===\r\n");
            my_printf("등록된 비밀번호가 없습니다.\r\n");
            my_printf("A를 눌러 비밀번호 4자리를 등록해주세요\r\n");
        }
    } else {
        password_exists = 0;
        system_mode = MODE_INIT;
        my_printf("\r\n=== INIT MODE ===\r\n");
        my_printf("등록된 비밀번호가 없습니다.\r\n");
        my_printf("A를 눌러 비밀번호 4자리를 등록해주세요\r\n");
    }
    
    // 입력 버퍼
    char input_buffer[PASSWORD_LENGTH];
    uint8_t input_count = 0;
        // 키패드 디바운싱을 단순화
        char last_key = 0;
        uint32_t key_press_count = 0;
        uint32_t key_release_count = 0;
        uint8_t key_processed = 0;  // 키가 처리되었는지 추적
        const uint32_t KEY_PRESS_THRESHOLD = 5;    // 키 눌림 안정화
        const uint32_t KEY_RELEASE_THRESHOLD = 10; // 키 릴리즈 안정화
    
        while (1) {
            char key = keypad_get_char();
            
            if (key != 0) {
                // 키가 눌림
                if (key == last_key) {
                    key_press_count++;
                    key_release_count = 0;
                    
                    // 키가 안정적으로 눌림 (한 번만 처리)
                    if (key_press_count >= KEY_PRESS_THRESHOLD && key_processed == 0) {
                        key_processed = 1;  // 처리 플래그 설정
                        // 키 처리 로직
                        if (key == 'A') {
                            if (system_mode == MODE_INIT || system_mode == MODE_HOME) {
                                system_mode = MODE_SET_PASSWORD;
                                input_count = 0;
                                my_printf("\r\n=== SET PASSWORD MODE ===\r\n");
                                my_printf("Enter 4-digit password, then press D\r\n");
                                my_printf("Press B to cancel\r\n");
                            }
                        }
                        else if (key == 'B') {
                            if (system_mode == MODE_SET_PASSWORD) {
                                system_mode = MODE_HOME;
                                input_count = 0;
                                my_printf("\r\n=== HOME MODE ===\r\n");
                                my_printf("Enter 4-digit password to unlock\r\n");
                                my_printf("Press A to set new password\r\n");
                            }
                        }
                        else if (key == 'D') {
                            if (system_mode == MODE_SET_PASSWORD) {
                                if (input_count == PASSWORD_LENGTH) {
                                    if (save_password_to_eeprom(input_buffer) == 0) {
                                        for (int i = 0; i < PASSWORD_LENGTH; i++) {
                                            stored_password[i] = input_buffer[i];
                                        }
                                        my_printf("\r\nPassword saved successfully!\r\n");
                                        system_mode = MODE_HOME;
                                        input_count = 0;
                                        my_printf("=== HOME MODE ===\r\n");
                                        my_printf("Enter 4-digit password to unlock\r\n");
                                        my_printf("Press A to set new password\r\n");
                                    } else {
                                        my_printf("\r\nError: Failed to save password\r\n");
                                        system_mode = MODE_INIT;
                                        input_count = 0;
                                        my_printf("=== INIT MODE ===\r\n");
                                        my_printf("등록된 비밀번호가 없습니다.\r\n");
                                        my_printf("A를 눌러 비밀번호 4자리를 등록해주세요\r\n");
                                    }
                                } else {
                                    my_printf("\r\n다시 입력해주세요\r\n");
                                    input_count = 0;
                                    system_mode = MODE_INIT;
                                    my_printf("=== INIT MODE ===\r\n");
                                    my_printf("등록된 비밀번호가 없습니다.\r\n");
                                    my_printf("A를 눌러 비밀번호 4자리를 등록해주세요\r\n");
                                }
                            }
                            else if (system_mode == MODE_HOME) {
                                if (input_count == PASSWORD_LENGTH) {
                                    int match = 1;
                                    for (int i = 0; i < PASSWORD_LENGTH; i++) {
                                        if (input_buffer[i] != stored_password[i]) {
                                            match = 0;
                                            break;
                                        }
                                    }
                                    
                                    if (match) {
                                        system_mode = MODE_UNLOCK;
                                        led_set(0x01);
                                        my_printf("\r\n*** UNLOCKED ***\r\n");
                                        delay_ms(3000);
                                        led_clear();
                                        system_mode = MODE_HOME;
                                        input_count = 0;
                                        my_printf("=== HOME MODE ===\r\n");
                                        my_printf("Enter 4-digit password to unlock\r\n");
                                        my_printf("Press A to set new password\r\n");
                                    } else {
                                        led_set(0x02);
                                        my_printf("\r\nIncorrect password\r\n");
                                        delay_ms(1000);
                                        led_clear();
                                        input_count = 0;
                                        my_printf("=== HOME MODE ===\r\n");
                                        my_printf("Enter 4-digit password to unlock\r\n");
                                        my_printf("Press A to set new password\r\n");
                                    }
                                } else {
                                    led_set(0x02);
                                    my_printf("\r\nIncorrect password\r\n");
                                    delay_ms(1000);
                                    led_clear();
                                    input_count = 0;
                                    my_printf("=== HOME MODE ===\r\n");
                                    my_printf("Enter 4-digit password to unlock\r\n");
                                    my_printf("Press A to set new password\r\n");
                                }
                            }
                        }
                        else if (key >= '0' && key <= '9') {
                            if (system_mode == MODE_SET_PASSWORD || system_mode == MODE_HOME) {
                                if (input_count < PASSWORD_LENGTH) {
                                    input_buffer[input_count] = key;
                                    input_count++;
                                    uart_put_char('*');
                                }
                            }
                        }
                    }
                } else {
                    // 새 키가 눌림
                    last_key = key;
                    key_press_count = 1;
                    key_release_count = 0;
                    key_processed = 0;  // 새 키이므로 처리 플래그 리셋
                }
            } else {
                // 키가 눌리지 않음
                if (last_key != 0) {
                    key_release_count++;
                    if (key_release_count >= KEY_RELEASE_THRESHOLD) {
                        last_key = 0;
                        key_press_count = 0;
                        key_release_count = 0;
                        key_processed = 0;  // 키 릴리즈 시 처리 플래그 리셋
                    }
                }
            }
            
            // 스캔 지연 (약 1ms)
            delay_ms(1);
        }
    
        return 0;
    }