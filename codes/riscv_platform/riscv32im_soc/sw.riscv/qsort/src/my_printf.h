#ifndef __MY_PRINTF_H_
#	define __MY_PRINTF_H_

#include <stdarg.h>

#ifdef __cplusplus
extern "C" {
#endif

#ifndef NULL
#       define NULL 0
#endif
#ifndef EOF
#       define EOF (-1)
#endif
#ifndef FILE
#	define FILE int
#endif
#ifdef putchar
#       undef putchar
#endif
#ifdef getchar
#       undef getchar
#endif

extern int my_putc(int ch, FILE *fp);
extern int my_putchar(int ch);
extern int my_getc(FILE *fp);
extern int my_getchar(void);
extern int my_puts(char *str);
extern int my_printf(const char *fmt, ...);

#ifdef FILE
#	undef FILE
#endif

#ifdef __cplusplus
}
#endif

#endif
