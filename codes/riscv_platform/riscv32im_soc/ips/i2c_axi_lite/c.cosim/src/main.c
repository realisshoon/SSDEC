#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#if defined(COSIM_LIB) && (COSIM_LIB==1)
    #include "cosim_bfm_api.h"
    int cid = 0;
#elif defined(TRX_BFM) && (TRX_BFM==1)
    #include "trx_axi_api.h" /*#include "conapi.h"*/
    con_Handle_t handle = NULL;
    int cid = 0;
#endif

int get_args(int argc, char* argv[]);
int test(void);

int verbose  = 0;
int rigor    = 0;
int level    = 3;

int main(int argc, char* argv[])
{
    if (get_args(argc, argv) != 0) {
        return 0;
    }

#if defined(COSIM_LIB) && (COSIM_LIB==1)
    bfm_set_verbose(verbose);
    bfm_open(cid);
    bfm_barrier(cid);
#elif defined(TRX_BFM) && (TRX_BFM==1)
    if ((handle = conInit(cid, CON_MODE_CMD, CONAPI_LOG_LEVEL_INFO)) == NULL) {
         printf("cannot initialize CON-FMC\n");
         printf("%d %s\n", conGetErrorConapi(), conErrorMsgConapi(conGetErrorConapi()));
         return 0;
    }
#endif

    test();

#if defined(COSIM_LIB) && (COSIM_LIB==1)
    bfm_close(cid);
#elif defined(TRX_BFM) && (TRX_BFM==1)
    if (handle != NULL) conRelease(handle);
#endif
    return 0;
}

int get_args(int argc, char* argv[])
{
    for (int a = 1; a < argc; a++) {
        if ((!strcmp(argv[a], "-h")) || (!strcmp(argv[a], "-?"))) {
            printf("%s [options]\n", argv[0]);
            printf("   -cid  cid   : set commumicate channel id\n");
            printf("   -t    level : set test level\n");
            printf("   -v    level : set verbose level\n");
            printf("   -r    level : set rigor level\n");
            printf("   -h          : print help\n");
            printf("   -?          : print help\n");
            return 1;
        } else if (!(strcmp(argv[a], "-cid"))) {
            cid = atoi(argv[++a]);
        } else if (!(strcmp(argv[a], "-t"))) {
            level = atoi(argv[++a]);
        } else if (!(strcmp(argv[a], "-v"))) {
            verbose = atoi(argv[++a]);
        } else if (!(strcmp(argv[a], "-r"))) {
            rigor = atoi(argv[++a]);
        } else {
            printf("un-known option %s\n", argv[a]);
            return -1;
        }
    }
    return 0;
}


