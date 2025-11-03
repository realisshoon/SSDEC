/*------------------------------------------------------------------------------
 * Copyright (c) 2025
 * System Call Stubs for Bare Metal RISC-V
 *------------------------------------------------------------------------------
 * These stubs are required when linking with -lc (libc)
 * They provide minimal implementations for system calls
 *------------------------------------------------------------------------------*/

#include <sys/stat.h>
#include <errno.h>

/* File I/O stubs */
int _close(int fd) {
    (void)fd;
    return -1;
}

int _lseek(int fd, int ptr, int dir) {
    (void)fd;
    (void)ptr;
    (void)dir;
    return 0;
}

int _read(int fd, char *ptr, int len) {
    (void)fd;
    (void)ptr;
    (void)len;
    return 0;
}

int _write(int fd, char *ptr, int len) {
    (void)fd;
    (void)ptr;
    (void)len;
    return len;
}

int _fstat(int fd, struct stat *st) {
    (void)fd;
    (void)st;
    return -1;
}

int _isatty(int fd) {
    (void)fd;
    return 0;
}

/* Memory allocation stubs */
void *_sbrk(int incr) {
    (void)incr;
    /* Heap not implemented - return error */
    return (void *)-1;
}

/* Process control stubs */
void _exit(int status) {
    (void)status;
    /* In bare metal, just loop forever */
    while(1) {
        __asm__ volatile ("nop");
    }
}

int _kill(int pid, int sig) {
    (void)pid;
    (void)sig;
    return -1;
}

int _getpid(void) {
    return 1;
}

/*------------------------------------------------------------------------------
 * End of file
 *------------------------------------------------------------------------------*/

