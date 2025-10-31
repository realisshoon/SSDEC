#include "uart_api.h"
#include "gpio_api.h"
#include "my_printf.h"
#include <stdint.h>

// 4x4 Matrix Keypad 정의
#define KEYPAD_ROWS 4
#define KEYPAD_COLS 4

// GPIO 핀 매핑 (ZedBoard 내장 스위치 사용)
#define SW_0  0x01  // GPIO[0] - SW0
#define SW_1  0x02  // GPIO[1] - SW1  
#define SW_2  0x04  // GPIO[2] - SW2
#define SW_3  0x08  // GPIO[3] - SW3
#define SW_4  0x10  // GPIO[4] - SW4
#define SW_5  0x20  // GPIO[5] - SW5
#define SW_6  0x40  // GPIO[6] - SW6  
#define SW_7  0x80  // GPIO[7] - SW7

// Keypad 매트릭스 (4x4)
const char keypad_matrix[KEYPAD_ROWS][KEYPAD_COLS] = {
    {'1', '2', '3', 'A'},
    {'4', '5', '6', 'B'}, 
    {'7', '8', '9', 'C'},
    {'*', '0', '#', 'D'}
};

// 시뮬레이션 모드 선택
#define SIMULATION_MODE_SOFTWARE 0
#define SIMULATION_MODE_HARDWARE  1
#define SIMULATION_MODE_HYBRID    2

// 현재 시뮬레이션 모드 (변경 가능)
#define CURRENT_MODE SIMULATION_MODE_HYBRID

// 시뮬레이션용 데이터
char simulated_sequence[] = {'1', '2', '3', 'A', '4', '5', '6', 'B', '7', '8', '9', 'C', '*', '0', '#', 'D'};
int sim_index = 0;
uint32_t last_switch_state = 0;
uint32_t key_count = 0;

// Debounce를 위한 지연 함수
void delay_ms(uint32_t ms) {
    for(volatile uint32_t i = 0; i < ms * 1000; i++);
}

// 소프트웨어 시뮬레이션 모드
char simulate_software_keypad() {
    if (sim_index < sizeof(simulated_sequence)) {
        char key = simulated_sequence[sim_index++];
        my_printf("[SOFTWARE] 키 입력: %c\r\n", key);
        return key;
    }
    return 0;
}

// 하드웨어 스위치를 이용한 keypad 시뮬레이션
char simulate_hardware_keypad() {
    uint32_t current_switch = gpio_read();
    uint32_t switch_changes = current_switch ^ last_switch_state;
    
    // 스위치 상태 변화 감지 (0->1, 즉 스위치 ON)
    for (int i = 0; i < 8; i++) {
        if (switch_changes & current_switch & (1 << i)) {
            last_switch_state = current_switch;
            
            // 스위치를 keypad 매트릭스로 매핑
            int row = i / 2;  // 0-3
            int col = i % 2;  // 0-1 (2x2 매트릭스로 축소)
            
            if (row < KEYPAD_ROWS && col < KEYPAD_COLS) {
                char key = keypad_matrix[row][col];
                my_printf("[HARDWARE] SW%d -> 키 입력: %c (Row:%d, Col:%d)\r\n", 
                         i, key, row, col);
                return key;
            }
        }
    }
    
    last_switch_state = current_switch;
    return 0;
}

// 하이브리드 모드 (소프트웨어 + 하드웨어)
char simulate_hybrid_keypad() {
    static uint32_t mode_counter = 0;
    char key = 0;
    
    // 교대로 소프트웨어와 하드웨어 모드 사용
    if (mode_counter % 2 == 0) {
        key = simulate_software_keypad();
        if (key == 0) {
            key = simulate_hardware_keypad();
        }
    } else {
        key = simulate_hardware_keypad();
        if (key == 0) {
            key = simulate_software_keypad();
        }
    }
    
    mode_counter++;
    return key;
}

// 통합 keypad 스캔 함수
char keypad_scan() {
    char key = 0;
    
    switch(CURRENT_MODE) {
        case SIMULATION_MODE_SOFTWARE:
            key = simulate_software_keypad();
            break;
        case SIMULATION_MODE_HARDWARE:
            key = simulate_hardware_keypad();
            break;
        case SIMULATION_MODE_HYBRID:
            key = simulate_hybrid_keypad();
            break;
        default:
            key = simulate_software_keypad();
            break;
    }
    
    return key;
}

// GPIO 초기화
void gpio_init_keypad() {
    // 모든 스위치를 입력으로 설정
    gpio_init(0x00000000, 0, ~0, 0);
    my_printf("GPIO 초기화 완료 - 모든 핀을 입력으로 설정\r\n");
}

// 키패드 매트릭스 출력
void print_keypad_matrix() {
    my_printf("\r\n=== 4x4 Keypad 매트릭스 ===\r\n");
    for (int i = 0; i < KEYPAD_ROWS; i++) {
        my_printf("Row %d: ", i);
        for (int j = 0; j < KEYPAD_COLS; j++) {
            my_printf("[%c] ", keypad_matrix[i][j]);
        }
        my_printf("\r\n");
    }
    my_printf("========================\r\n");
}

// 스위치 상태 모니터링
void monitor_switches() {
    uint32_t switch_state = gpio_read();
    my_printf("스위치 상태: 0x%02X (", switch_state);
    for (int i = 7; i >= 0; i--) {
        my_printf("%d", (switch_state >> i) & 1);
    }
    my_printf(")\r\n");
}

int main() {
    // UART 초기화
    uart_set_addr(0x90020000);
    uart_init(0, 115200, 8, 0, 1);
    my_printf("=== 4x4 Matrix Keypad 시뮬레이션 시작 ===\r\n");
    
    // GPIO 초기화
    gpio_set_addr(0x90030000);
    gpio_init_keypad();
    
    // 시뮬레이션 모드 정보 출력
    my_printf("시뮬레이션 모드: ");
    switch(CURRENT_MODE) {
        case SIMULATION_MODE_SOFTWARE:
            my_printf("SOFTWARE (소프트웨어 시뮬레이션)\r\n");
            break;
        case SIMULATION_MODE_HARDWARE:
            my_printf("HARDWARE (ZedBoard 스위치 사용)\r\n");
            break;
        case SIMULATION_MODE_HYBRID:
            my_printf("HYBRID (소프트웨어 + 하드웨어)\r\n");
            break;
    }
    
    // Keypad 매트릭스 출력
    print_keypad_matrix();
    
    // 초기 스위치 상태 확인
    my_printf("\r\n초기 스위치 상태:\r\n");
    monitor_switches();
    
    my_printf("\r\n=== Keypad 입력 테스트 시작 ===\r\n");
    my_printf("키패드 입력을 감지합니다...\r\n");
    
    char last_key = 0;
    uint32_t test_round = 0;
    
    while(1) {
        char key = keypad_scan();
        
        if (key != 0 && key != last_key) {
            key_count++;
            my_printf(">>> 키 입력 감지: %c (총 %d개)\r\n", key, key_count);
            last_key = key;
        } else if (key == 0) {
            last_key = 0;
        }
        
        // 주기적으로 상태 출력
        if (test_round % 100000 == 0) {
            my_printf("테스트 라운드: %d, 입력된 키: %d개\r\n", test_round, key_count);
            if (CURRENT_MODE != SIMULATION_MODE_SOFTWARE) {
                monitor_switches();
            }
        }
        
        test_round++;
        
        // Debounce를 위한 지연
        delay_ms(1);
    }
    
    return 0;
}