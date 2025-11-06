//------------------------------------------------------------------------------
// Copyright (c) 2025
// 4x4 Matrix Keypad API using GPIO
// PMODKYPD (Digilent PMOD Keypad) 호환
//------------------------------------------------------------------------------
#include <stdint.h>
#include "keypad_api.h"
#include "gpio_api.h"


static uint32_t keypad_gpio_addr = 0x90030000;

// 키 매핑: [row][col] = key_value
// PMODKYPD 표준 레이아웃: 4x4 매트릭스 키패드
// 하드웨어 연결이 반대이므로 전치된 형태로 정의
static const char keypad_map[4][4] = {
    {'1', '2', '3', 'A'},  // Row 0
    {'4', '5', '6', 'B'},  // Row 1
    {'7', '8', '9', 'C'},  // Row 2
    {'0', 'F', 'E', 'D'}   // Row 3
};


void keypad_init(uint32_t gpio_base_addr) {
    keypad_gpio_addr = gpio_base_addr;
    
    // GPIO 초기화: 하위 4비트는 출력(Column), 상위 4비트는 입력(Row)
    gpio_set_addr(gpio_base_addr);
    
    uint32_t dir = 0x0000000F;  // 하위 4비트만 출력 
    
    // PMODKYPD: Column을 HIGH로 설정 (기본 상태)
    // 키 스캔 시 Column을 LOW로 만들어 Row를 읽음
    gpio_write(0x0000000F);  // 모든 Column을 HIGH (0x0F = 0b00001111)
    
    // GPIO 설정
    // dir=0x0F: 하위 4비트(Column)는 출력, 상위 4비트(Row)는 입력
    gpio_init(dir, 0, 0, 0);
}


int keypad_scan(void) {
    gpio_set_addr(keypad_gpio_addr);
    
    // 각 Column을 순차적으로 LOW로 설정하고 Row를 읽음
    // PMODKYPD: Column을 출력(LOW)로 만들면, 키가 눌리면 해당 Row가 LOW가 됨
    for (int col = 0; col < 4; col++) {
        // Column을 LOW로 설정 (나머지는 HIGH)
        uint32_t col_pattern = 0x0000000F & ~(1 << col);
        gpio_write(col_pattern);
        
        // 디바운싱 지연 (신호 안정화)
        // PMODKYPD는 하드웨어 디바운싱이 없으므로 소프트웨어 처리 필요
        // 스캔 속도 향상을 위해 지연 시간 단축
        volatile int delay = 100;  // 약 1μs @ 100MHz (최소 지연)
        while (delay--);
        
        // Row 입력 읽기 (GPIO bit 7-4에 keypad_row[3:0]이 연결됨)
        uint32_t input = gpio_read();
        uint32_t rows = (input >> 4) & 0x0F;
        
        // 키 감지 확인
        // PMODKYPD는 키가 눌리지 않았을 때 모든 Row가 HIGH (풀업)
        // 키가 눌리면 해당 Row가 LOW로 변경됨
        if (rows != 0x0F) {  // 모든 Row가 HIGH(0x0F)가 아니면 키가 눌림
            // 눌린 Row 찾기
            for (int row = 0; row < 4; row++) {
                // 해당 Row 비트가 LOW인지 확인
                if (!(rows & (1 << row))) {
                    // 키가 눌림: row와 col 조합으로 키 인덱스 계산
                    // 키 인덱스 = row * 4 + col (0-15)
                    // 반환 전에 모든 Column을 HIGH로 복원
                    gpio_write(0x0000000F);
                    return row * 4 + col;
                }
            }
        }
    }
    
    // 모든 Column을 HIGH로 복원 (기본 상태)
    gpio_write(0x0000000F);
    
    return -1;  // 키가 눌리지 않음
}


char keypad_get_char(void) {
    int key = keypad_scan();
    if (key >= 0 && key < 16) {
        // key = row * 4 + col이므로
        // key / 4 = row, key % 4 = col
        // keypad_map은 [row][col] 형태
        // 하드웨어 연결이 반대이므로 [col][row]로 접근하여 전치
        int row = key / 4;
        int col = key % 4;
        return keypad_map[col][row];
    }
    return 0;
}







