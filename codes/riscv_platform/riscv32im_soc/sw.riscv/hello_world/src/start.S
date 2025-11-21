.section .text.init
.global _start
.global main
_start:
.option push
.option norelax
    # initialize global pointer
    la      gp, __global_pointer$

.option pop
    # initialize stack pointer
    la      sp, _stack_end

    # Clear BSS
    la      t3, _bss_start
    la      t4, _bss_end
    j       clear_bss_end
#clear_bss64:
#    sd      zero, 0(t3)
#    addi    t3, t3, 8
clear_bss32:
    sw      zero, 0(t3)
    addi    t3, t3, 4
clear_bss_end:
    bltu    t3, t4, clear_bss32

main_entry:
    # jump to main program entry point (argc = argv = 0)
    addi    x10, x0, 0
    addi    x11, x0, 0
    call    main       #jal     x1, main
    mv      a0, s0

terminate:
    # Write the value 1 to tohost, telling Spike to quit with an exit code of 0.
    li t0, 1
    la t1, tohost
    sw t0, 0(t1)

    # Spin until Spike terminates the run.
    1: j 1b

# Expose tohost and fromhost to Spike so we can communicate with it.
.data

.align 3
.global tohost
tohost:
.dword 0

.align 3
.global fromhost
fromhost:
.dword 0