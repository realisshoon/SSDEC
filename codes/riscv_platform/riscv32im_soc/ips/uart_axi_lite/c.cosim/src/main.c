#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "cosim_bfm_axi.h"
#include "my_printf.h"

int get_args(int argc, char* argv[]);

int cid=0;
int port  = 0x2300;
int level = 0;

int main(int argc, char* argv[])
{
    get_args(argc, argv);
    cosim_set_verbose(level);
    int ret = cosim_bfm_axi_open( cid, port );

    my_printf("%s\n", "Hello world!.");

    cosim_bfm_axi_finish(cid);
    cosim_bfm_axi_close(cid);
    return(0);
}

int get_args(int argc, char* argv[])
{
    for (int a=1; a<argc; a++) {
         if ((!strcmp(argv[a],"-h"))||(!strcmp(argv[a],"-?"))) {
            printf("%s [options]\n", argv[0]);
            printf("   -cid  cid   : set commumicate channel id\n");
            printf("   -port port  : set socket port\n");
            printf("   -v    level : set verbose level\n");
            printf("   -h          : print help\n");
            printf("   -?          : print help\n");
            return 0;
         } else if (!(strcmp(argv[a],"-cid"))) {
            cid = atoi(argv[++a]);
         } else if (!(strcmp(argv[a],"-port"))) {
            port = strtol(argv[++a], NULL, 0);
         } else if (!(strcmp(argv[a],"-v"))) {
            level = atoi(argv[++a]);
         } else {
            printf("un-known option %s\n", argv[a]);
            return(-1);
         }
    }
    return(0);
}
