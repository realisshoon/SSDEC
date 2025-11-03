#include "uart_api.h"
#include "my_printf.h"
#include "gpio_api.h"
#include "keypad_api.h"
#include <stdint.h>

#ifndef BAUD_RATE
#    define BAUD_RATE  115200
#endif

#define UART_BASE_ADDR   0x90020000
#define GPIO_BASE_ADDR   0x90030000


// 간단한 지연 함수
static void delay_ms(volatile uint32_t ms) {
    volatile uint32_t count = ms * 10000; // 클럭에 따라 조정
    while (count--);
}

int main()
{
    // UART 초기화
    uint32_t baud_rate = BAUD_RATE;
    uart_set_addr(UART_BASE_ADDR);
    uart_init(0, baud_rate, 8, 0, 1);
    
    // GPIO 및 키패드 초기화
    gpio_set_addr(GPIO_BASE_ADDR);
    keypad_init(GPIO_BASE_ADDR); 

    // 초기화 완료 메시지
    my_printf("Keypad initialized. Press any key...\r\n");

    char last_key = 0;

    while (1) {
        char key = keypad_get_char();
        
        // 키가 눌렸고, 이전 키와 다르면 UART로 출력
        if (key != 0 && key != last_key) {
            my_printf("%c\r\n", key);
            last_key = key;
            
            // 키가 떼어질 때까지 대기 (debounce)
            while (keypad_get_char() != 0) {
                delay_ms(10);
            }
            delay_ms(50);
        } else if (key == 0) {
            last_key = 0;
        }
        
        delay_ms(10);
    }

    return 0;
}



// #include "uart_api.h"
// #include "my_printf.h"
// #include "gpio_api.h"
// #include "keypad_api.h"
// #include <stdint.h>

// #ifndef BAUD_RATE
// #    define BAUD_RATE  115200
// #endif

// int main()
// {
// #if 1
//     uint32_t base_addr=0x90020000;
//     uint32_t baud_rate=BAUD_RATE;
//     uart_set_addr(base_addr);
//     uart_init( 0 // 100Mhz
//              , baud_rate
//              , 8  // width
//              , 0  // parity
//              , 1);// stop

             
//     my_printf("%d Hz\r\n", uart_get_clk_freq());
// #endif
// #if 0
//     extern char _start_of_ram, _end_of_ram;
//     extern char _start_of_rom, _end_of_rom;
//     extern char _text_start, _data_end;
//     int *src=(int*)&_start_of_rom;
//     int *dst=(int*)&_start_of_ram;
//     int *end=(int*)&_data_end;
//     my_printf("%x %x %x\n\r", src, dst, end);
// #endif
// do {
//     my_puts("Hello world!\r\n");
//     my_puts("Nice to see you!\r\n");
    
//     // GPIO 테스트 추가
//     my_puts("\r\n=== GPIO Test ===\r\n");
    
//     // GPIO 초기화
//     uint32_t gpio_base_addr = 0x90030000;
//     gpio_set_addr(gpio_base_addr);
//     my_printf("GPIO initialized at address 0x%08X\r\n", gpio_base_addr);
    
//     // GPIO 레지스터 읽기 테스트
//     my_printf("GPIO ADDR: 0x%08X\r\n", gpio_get_addr());
    
//     // GPIO 입력/출력 테스트
//     uint32_t input = gpio_read();
//     my_printf("GPIO INPUT: 0x%08X\r\n", input);
    
//     // GPIO 출력 테스트 (초기값 설정)
//     gpio_write(0x00000000);
//     my_puts("GPIO Test Complete!\r\n");
    
//     // Keypad 테스트 추가
//     my_puts("\r\n=== Keypad Test ===\r\n");
    
//     // GPIO 하드웨어 키패드 모드 (실제 키패드 사용)
//     // Keypad 초기화 (GPIO 주소 사용)
//     uint32_t keypad_gpio_addr = 0x90030000;
//     keypad_init(keypad_gpio_addr);
//     my_printf("Keypad initialized using GPIO at 0x%08X\r\n", keypad_gpio_addr);
    
//     my_puts("Press any key on keypad...\r\n");
//     my_puts("Keypad layout:\r\n");
//     my_puts("  1  2  3  A\r\n");
//     my_puts("  4  5  6  B\r\n");
//     my_puts("  7  8  9  C\r\n");
//     my_puts("  *  0  #  D\r\n");
//     my_puts("(Press keys to test)\r\n\r\n");
    
//     // 실제 키패드 스캔 루프 (무한 루프로 변경하여 계속 키 입력 받기)
//     while (1) {
//         char key = keypad_get_char();
//         if (key != 0) {
//             // 실제 키패드에서 키가 눌림
//             my_printf("Key pressed: '%c'\r\n", key);
//             // 키 릴리즈 대기 (debounce)
//             volatile int delay = 50000;
//             while (delay--);
//             while (keypad_scan() >= 0) {
//                 delay = 10000;
//                 while (delay--);
//             }
//         }
//         // 약간의 지연 (CPU 부하 감소)
//         volatile int delay = 5000;
//         while (delay--);
//     }
    
// } while (0);

//     return 0;
// }