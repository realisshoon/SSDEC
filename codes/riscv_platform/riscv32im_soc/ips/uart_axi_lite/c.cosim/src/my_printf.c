//------------------------------------------------------------------------------
// my_printf.c
//  
// Copyright (c) 2024 by Ando Ki
//
// This software is provided 'as-is', without any express or implied
// warranty.  In no event will the authors be held liable for any damages
// arising from the use of this software.
//------------------------------------------------------------------------------
#include "my_printf.h"
#include "uart_api.h"

#define STDIO_DECIMAL   10
#define STDIO_OCTAL     8
#define STDIO_HEXA      16
#define STDIO_SPACE     0x20
#define STDIO_TAB       0x9
#ifndef FILE
#	define FILE int
#endif

int my_putc(int ch, FILE *fp)
{
    if (ch=='\n') uart_put_char((unsigned int)'\r');
    return(uart_put_char(ch));
}

int my_putchar(int ch)
{
    if (ch=='\n') uart_put_char((unsigned int)'\r');
    return(uart_put_char(ch));
}

int my_getc(FILE *fp)
{
    return(uart_get_char());
}

int my_getchar(void)
{
    return(uart_get_char());
}

int my_puts(char *str)
{
    int i;
    i = uart_put_string(str);
    if (str[i-1]=='\n') uart_put_char('\r');
    return(i);
}

int my_printf(const char *fmt, ...)
{
    va_list     ap;
    int         ret;
    int my_vprintf(const char *fmt, va_list ap);
    va_start(ap, fmt);
    ret = my_vprintf(fmt, ap);
    va_end(ap);
    return(ret);
}

int
my_printn(unsigned n, int b, int m)
{
    unsigned a;
    int count = 0;

    if( b == 10 && (int)n < 0 ){
        count += uart_put_char('-');
        n = -n;
    }
    if( (a = n/b) || m > 1 ) count += my_printn(a,b,--m);
    count += uart_put_char("0123456789ABCDEF"[(int)(n%b)]);
    return count;
}

int
my_printflt(float fval, int m)
{
  int i, d;
  int count = 0;

  if (fval<0) {
    count += uart_put_char('-');
    fval = -fval;
  }

  d = (int)fval;
  count += my_printn(d, STDIO_DECIMAL, m);
  count += uart_put_char('.');
  fval -= (float)d;
  i = 0;
  do {
    fval *= 10.0;
    d = (int)fval;
    count += uart_put_char('0'+d);
    fval -= (float)d;
    i++;
  } while (fval!=0.0&&i<6);
  return count;
}

int
my_vprintf(const char *fmt, va_list ap)
{
    int m, c;
    //char *s;
    int ival;
    float fval;
    char *sval;
    char cval;
    int count;

    count = 0;
    while( (c = *fmt++) ){
        if( c == '%' ){
            c = *fmt;
            m = 0;
            while ( c >= '0' && c <= '9' ) {m = m * 10 + c - '0'; fmt++; c = *fmt; }
            switch( c = *fmt++ ){
            case 'c':
                cval = va_arg(ap, int);
                count += uart_put_char(cval);
                break;
            case 'o':
                ival = va_arg(ap, int);
                count += my_printn(ival,STDIO_OCTAL,m);
                break;
            case 'd':
                ival = va_arg(ap, int);
                count += my_printn(ival,STDIO_DECIMAL,m);
                break;
            case 'x':
                ival = va_arg(ap, int);
                count += my_printn(ival,STDIO_HEXA,m);
                break;
            case 's':
                for (sval = va_arg(ap, char *); *sval; sval++) {
                    count += uart_put_char(*sval);
                    if (*sval=='\n') {uart_put_char('\r');}
                }
                break;
            case 'f':
                fval = (float)va_arg(ap, double);
                count += my_printflt(fval, m);
                break;
            case '%':
                count += uart_put_char('%');
                                break;
            default : count += uart_put_char('%'), --fmt;
            }
        } else {
                 count += uart_put_char(c);
                 if (c=='\n') uart_put_char('\r');
        }
    }
    return count;
}

#ifdef FILE
#	undef FILE
#endif
#undef STDIO_MAXSTRING
#undef STDIO_DECIMAL
#undef STDIO_OCTAL
#undef STDIO_HEXA
#undef STDIO_SPACE
#undef STDIO_TAB
//------------------------------------------------------------------------------
