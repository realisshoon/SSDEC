#include "uart_api.h"
#include "my_printf.h"
#include "gpio_api.h"
#include <stdint.h>

#ifndef BAUD_RATE
#    define BAUD_RATE  115200
#endif

int main()
{
#if 1
    uint32_t base_addr=0x90020000;
    uint32_t baud_rate=BAUD_RATE;
    uart_set_addr(base_addr);
    uart_init( 0 // 100Mhz
             , baud_rate
             , 8  // width
             , 0  // parity
             , 1);// stop
    my_printf("%d Hz\r\n", uart_get_clk_freq());
#endif
#if 0
    extern char _start_of_ram, _end_of_ram;
    extern char _start_of_rom, _end_of_rom;
    extern char _text_start, _data_end;
    int *src=(int*)&_start_of_rom;
    int *dst=(int*)&_start_of_ram;
    int *end=(int*)&_data_end;
    my_printf("%x %x %x\n\r", src, dst, end);
#endif
do {
    my_puts("Hello world!\r\n");
    my_puts("Nice to see you!\r\n");
    
    // GPIO 테스트 추가
    my_puts("\r\n=== GPIO Test ===\r\n");
    
    // GPIO 초기화
    uint32_t gpio_base_addr = 0x90030000;
    gpio_set_addr(gpio_base_addr);
    my_printf("GPIO initialized at address 0x%08X\r\n", gpio_base_addr);
    
    // GPIO 레지스터 읽기 테스트
    uint32_t version = gpio_read_version();
    my_printf("GPIO VERSION: 0x%08X\r\n", version);
    
    uint32_t name = gpio_read_name();
    my_printf("GPIO NAME: 0x%08X\r\n", name);
    
    uint32_t dir = gpio_read_dir();
    my_printf("GPIO DIR: 0x%08X\r\n", dir);
    
    uint32_t input = gpio_read_input();
    my_printf("GPIO INPUT: 0x%08X\r\n", input);
    
    uint32_t output = gpio_read_output();
    my_printf("GPIO OUTPUT: 0x%08X\r\n", output);
    
    my_puts("GPIO Test Complete!\r\n");
    
} while (0);

    return 0;
}
