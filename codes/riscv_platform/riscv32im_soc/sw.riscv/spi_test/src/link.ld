/*----------------------------------------------------------------------------
 * THE MEMORY MODEL ASSUMED BY THIS IMPLEMENTATION
 *
 *       +----------------+    <--- top of memory (high address)
 *       | Stack space    |         (_stack_end)
 *       |................|    <--- stack pointer (sp)
 *       | Free stack     |
 *       |................|    <--- stack limit pointer (sl)
 *       +----------------+    <--- stack low-water mark (sl - StackSlop)
 *       |                |
 *       | Unused memory  |
 *       +----------------+    <--- top of heap (HeapLimit)
 *       | Heap space     |
 *       |                |
 *       +----------------+    <--- top of application (Image_RW_Limit)
 *       | Static data    |  }
 *       |................|  } the application's memory image
 *       | Code           |  }
 *       +----------------+    <--- application load address
 *----------------------------------------------------------------------------
 */

OUTPUT_ARCH( "riscv" )

ENTRY( _start )

MEMORY
{
  RAM (RWXA) : ORIGIN = 0x00000000, LENGTH = 128K
  ROM (RX): ORIGIN = 0x93000000, LENGTH = 32K
}

SECTIONS
{
    .text : {
        PROVIDE(_text_start = .);
        *(.text.init);
        *(.tohost);
        *(.fromhost);
        *(.text .text.*);
        PROVIDE(_text_end = .);
        . = ALIGN(8);
    } >RAM
    
      . = ALIGN(8);
      PROVIDE(__global_pointer$ = .);
    
    .rodata : {
        . = ALIGN(8);
        PROVIDE(_rodata_start = .);
        *(.rodata .rodata.*);
        *(.srodata .srodata.*);
        PROVIDE(_rodata_end = .);
        . = ALIGN(8);
    } >RAM

    .data : {
        . = ALIGN(8);
        PROVIDE(_data_start = .);
        *(.data .data.*);
        *(.sdata .sdata.*);
        PROVIDE(_data_end = .);
        . = ALIGN(8);
    } >RAM

    .bss (NOLOAD) : {
        . = ALIGN(8);
        PROVIDE(_bss_start = .);
        *(.bss .bss.*);
        *(.sbss .sbss.*);
        PROVIDE(_bss_end = .);
        . = ALIGN(8);
    } >RAM
    
    PROVIDE(_memory_start = ORIGIN(RAM));
    PROVIDE(_memory_end   = ORIGIN(RAM)+LENGTH(RAM));
    PROVIDE(_stack_end    = _memory_end);
    PROVIDE(_start_of_ram = ORIGIN(RAM));
    PROVIDE(_start_of_ram = ORIGIN(RAM)+LENGTH(RAM));
    PROVIDE(_start_of_rom = ORIGIN(ROM));
    PROVIDE(_start_of_rom = ORIGIN(ROM)+LENGTH(ROM));
/*
    PROVIDE(_heap_size    = 1M);
    PROVIDE(_heap_start   = _bss_end);
    PROVIDE(_heap_end     = _heap_start + _heap_size);
    PROVIDE(_stack_size   = 1M);
    PROVIDE(_stack_start  = _heap_end);
    PROVIDE(_stack_end    = _stack_start + _stack_size);
*/
}
