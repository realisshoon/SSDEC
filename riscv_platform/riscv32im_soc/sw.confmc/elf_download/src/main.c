//------------------------------------------------------------------------------
// Copyright (c) 2025 by Ando Ki.
// All rights are reserved by Ando Ki.
//------------------------------------------------------------------------------
// main.cpp
//------------------------------------------------------------------------------
//  +----------+---+--------------+---+--------------+----+---------+
//  |EHDR      |   |PHDR          |   |SECTION DATA  |    |SHDR     |
//  +----------+---+--------------+---+--------------+----+---------+
//  ELF Executable header
//                 ELF Program Header Table
//                                    ELF Section Contents
//                                                        ELF Section Header Table
//
// refer to 'https://www.sco.com/developers/gabi/2000-07-17/ch4.eheader.html'
//------------------------------------------------------------------------------
#include <stdio.h>
#include <stdlib.h>
#include <libelf.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <errno.h>
#include <getopt.h>
#include <signal.h>
#if defined(COSIM_BFM)
#	include "cosim_bfm_api.h"
#elif defined(TRX_AXI)||defined(BFM_AXI)
#	include "trx_axi_api.h"
#endif

const char program[]="test";
const unsigned int version=0x20250517;
int   verbose=0;
char *file_elf=NULL;
char *file_bin=NULL;
// $ riscv32-unknown-elf-objdump -h uart_test.elf
// $ riscv32-unknown-elf-size -A -d uart_test.elf
char *sections[]={".text", ".rodata", ".srodata", ".data", ".sdata", ".bss", ".sbss", NULL};

int   confmc = 0; // use CON-FMC or cosim_bfm if 1
int   cid = 0;

#if defined(TRX_AXI)||defined(BFM_AXI)
con_Handle_t handle=NULL;
int  get_confmc( con_Handle_t handle );
#endif
unsigned long address=0x0;

//------------------------------------------------------------------------------
int main( int argc, char *argv[] )
{
    extern void sig_handle( int );
    extern void func_exit( void );
    extern int  arg_parser( int, char ** );
    extern int  check_elf( char *file_elf, int *bits, int *lsb
                         , int *abi, int *type, int *machine
                         , unsigned long long *entry );
    extern int  get_bin_elf32( char *file_bin, char *file_elf, char *sections[] );
    extern int  get_bin_elf64( char *file_bin, char *file_elf, char *sections[] );
    extern int  download_bin( char *file_bin, unsigned long address );

    if ((signal(SIGINT, sig_handle)==SIG_ERR)
            #ifndef WIN32
            ||(signal(SIGQUIT, sig_handle)==SIG_ERR)
            #endif
            ) {
          fprintf(stderr, "Error: signal error\n");
          exit(1);
    } else {
        atexit(func_exit);
    }
    
    if (arg_parser(argc, argv)) return 1;

    int bits, lsb, abi, type, machine;
    unsigned long long entry;
    if (check_elf(file_elf, &bits, &lsb, &abi, &type, &machine, &entry)!=0) return 1;

    if (bits==ELFCLASS32) {
        get_bin_elf32(file_bin, file_elf, sections );
    } else if (bits=ELFCLASS64) {
        get_bin_elf64(file_bin, file_elf, sections );
    }

    if (confmc) {
#if defined(COSIM_BFM)
        bfm_set_verbose(verbose); // optional
        bfm_open(cid); // mandatory
        bfm_barrier(cid); // mandatory

        if ((unsigned long long)address!=entry) {
           fprintf(stderr, "Warning: entry address mis-match");
        }
        uint32_t data=0x00000002;
        bfm_put_gp(cid, &data); // make cpu reset
        download_bin( file_bin, address );
        data=0x00000000;
        bfm_put_gp(cid, &data); // make cpu reset

        printf("Enter any to finish simulation: \n"); fflush(stdout);
        (void)getchar();

        bfm_close(cid); // mandatory
#elif defined(TRX_AXI)||defined(BFM_AXI)
        if ((handle=conInit(cid, CON_MODE_CMD, CONAPI_LOG_LEVEL_INFO))==NULL) {
           fprintf(stderr, "cannot initialize CON-FMC\n");
           fprintf(stderr, "%d %s\n", conGetErrorConapi(), conErrorMsgConapi(conGetErrorConapi()));
           return 0;
        } else {
            if (verbose>1) get_confmc(handle);
        }

        if ((unsigned long long)address!=entry) {
           fprintf(stderr, "Warning: entry address mis-match");
        }
        BfmGpout(handle, 0x00000002); // assert cpu reset
        download_bin( file_bin, address );
        BfmGpout(handle, 0x00000003); // assert cpu reset & bus reset
        BfmGpout(handle, 0x00000002); // deassert bus reset
        BfmGpout(handle, 0x00000000); // deassert cpu reset

        if (handle!=NULL) { conRelease(handle); handle=NULL; }
#endif
    }
    return 0;
}   

//------------------------------------------------------------------------------
#if defined(COSIM_BFM)
#      define MEM_WRITE(A, B)        bfm_write((uint32_t)(A), (uint8_t*)(B), 4, 1)
#      define MEM_READ(A, B)         bfm_read((uint32_t)(A), (uint8_t*)(B), 4, 1)
#      define MEM_WRITE_G(A,D,S,L)   bfm_write((uint32_t)(A), (uint8_t*)(D), (S), (L))
#      define MEM_READ_G(A,D,S,L)    bfm_read((uint32_t)(A), (uint8_t*)(D), (S), (L))
#elif defined(TRX_AXI)||defined(BFM_AXI)
#      define MEM_WRITE(A, B)        BfmWrite(handle, (unsigned int)(A), (unsigned int*)&(B), 4, 1)
#      define MEM_READ(A, B)         BfmRead (handle, (unsigned int)(A), (unsigned int*)&(B), 4, 1)
#      define MEM_WRITE_G(A,D,S,L)   BfmWrite(handle, (unsigned int)(A), (unsigned int*)(D), (unsigned int)(S), (unsigned int)(L))
#      define MEM_READ_G(A,D,S,L)    BfmRead (handle, (unsigned int)(A), (unsigned int*)(D), (unsigned int)(S), (unsigned int)(L))
#else
#      define MEM_WRITE(A, B)        *(unsigned *)A = B
#      define MEM_READ(A, B)         B = *(unsigned *)A
#      define MEM_WRITE_G(A,D,S,L)   memcpy((void*)(A),(void*)(D),((S)*(L)))
#      define MEM_READ_G(A,D,S,L)    memcpy((void*)(D),(void*)(A),((S)*(L)))
#endif

int download_bin( char *file_bin, unsigned long address )
{
    if (file_bin==NULL) return 0;
    int fd;
    struct stat s;
    int size;

    fd = open(file_bin, O_RDONLY, 0);
    if (fstat(fd, &s)==-1) {
         fprintf(stderr, "fstate(%d) returned errno=%d.", fd, errno);
    }
    size = s.st_size;
    #define BLENG 1024
    unsigned char dataBW[BLENG];
    
    unsigned long moved=0;
    while (moved<size) {
        int num = read(fd, (void*)dataBW, BLENG);
        int leng = (num+3)/4; // number of words
        MEM_WRITE_G(address+moved, (unsigned int*)dataBW, 4, leng);
        moved += num;
    }
    if (verbose) {
        printf("%s %ld moved for %s\n", __func__, moved, file_bin);
    }
    if (lseek(fd, 0, SEEK_SET)!=0) {
        fprintf(stderr, "leek error\n");
    }
    if (verbose>0) printf("%s %d byte(s) downloaded.\n", __func__, size);

    int error=0;
    unsigned char dataBR[BLENG];
    moved=0;
    while (moved<size) {
        int num = read(fd, (void*)dataBW, BLENG);
        int leng = (num+3)/4; // number of words
        MEM_READ_G(address+moved, (unsigned int*)dataBR, 4, leng);
        moved += num;
        for (int idx=0; idx<num; idx++) {
             if (dataBW[idx]!=dataBR[idx]) {
                 error++;
             }
        }
    }
    if (error>0) {
        fprintf(stderr, "%s %d out of %d byte(s) mis-match.\n", __func__, error, size);
    } else {
        if (verbose>0) printf("%s %d byte(s) matched.\n", __func__, size);
    }

    fflush(stdout);

    close(fd);
}

//------------------------------------------------------------------------------
// ['.text', '.data', '.bss', '.symtab', '.strtab', '.rel.text', '.rodata', '.rodata.cst4', '.note.GNU-stack', '.init', '.rel.init', '.gnu.linkonce.t.__x86.get_pc_thunk.bx', '.fini', '.rel.fini', '.text.unlikely', '.text.__x86.get_pc_thunk.bx', '.eh_frame', '.rel.eh_frame', '.preinit_array', '.init_array', '.fini_array', '.interp', '.dynsym', '.dynstr', '.hash', '.dynamic', '.got', '.plt', '.rel.got', '.shstrtab']
//
int get_bin_elf32( char *file_bin, char *file_elf, char *sections[] )
{
    if ((file_elf==NULL) || (file_bin==NULL)) return 0;
    int fd_in  = 0;
    int fd_out = 0;
    Elf        *elf  = NULL;
    Elf_Scn    *scn  = NULL;
    Elf32_Shdr *shdr = NULL;
    Elf_Data   *data = NULL;
    char       *name = NULL;
    size_t      shstrndx  = 0, n = 0;
    unsigned long nbytes=0;

    // Open main
    fd_in = open(file_elf, O_RDONLY, 0);

    // Necessary to call other libelf library functions
    elf_version(EV_CURRENT);

    // Convert the file descriptor to an ELF handle
    elf = elf_begin(fd_in, ELF_C_READ, NULL);

    // Retrieve the index of the section name string table
    elf_getshdrstrndx(elf, &shstrndx);

    // Open the binary output file
    fd_out = open(file_bin, O_CREAT | O_WRONLY | O_TRUNC, S_IRUSR | S_IWUSR);

    // Iterate through the sections
    while ((scn = elf_nextscn(elf, scn)) != NULL) {
        // Retrieve the section header
        shdr = elf32_getshdr(scn);
        // sh_name, sh_addr, sh_offset, sh_size

        // Get the name of the section
        name = elf_strptr(elf, shstrndx, shdr->sh_name);

        for (int i=0; sections[i]!=NULL; i++) {
            if (strcmp(name, sections[i]) == 0) {
                // Read the section and write it to the file
                while ((data = elf_getdata(scn, data)) != NULL) {
                    write(fd_out, data->d_buf, data->d_size);
                }
                nbytes += (unsigned long)shdr->sh_size;
                if (verbose>0) {
                    printf("%s() %s %s-section 0x%0X(%0d)-bytes read. (%ld)\n", __func__, file_elf, name, shdr->sh_size, shdr->sh_size, nbytes);
                }
            }
        }
    }
    // Close the file descriptor of output file
    close(fd_out);
    if (verbose>0) {
        printf("%s() %s 0x%0lX(%0ld)-bytes written to %s.\n", __func__, file_elf, nbytes, nbytes, file_bin);
    }

    // Release the ELF descriptor
    elf_end(elf);
    // Close main
    close(fd_in);
}

//------------------------------------------------------------------------------
int get_bin_elf64( char *file_bin, char *file_elf, char *sections[] )
{
    if ((file_elf==NULL) || (file_bin==NULL)) return 0;
    return 0;
}

//------------------------------------------------------------------------------
// bits: 32 or 64
// lsb :           1=big-endian, 2=little-endian
// abi :           0=SystemV, 3=Linux, 6=Solaris, 
// type: 0=No file 1=relocatable, 2: executable, 3: shared object
// machine:
int check_elf( char *file_elf, int *bits, int *lsb
             , int *abi, int *type,  int *machine
             , unsigned long long *entry )
{
    FILE *fp = fopen(file_elf, "rb");
    if (fp == NULL) {
      fprintf(stderr, "Unable to open '%s': %s\n", file_elf, strerror(errno));
      return -1;
    }
    
    Elf32_Ehdr ehdr;
    if (fread(&ehdr, sizeof(ehdr), 1, fp) != 1) {
      fprintf(stderr, "fread: %s\n", strerror(errno));
      fclose(fp);
      return -1;
    }
    
    if(ehdr.e_ident[EI_MAG0] != ELFMAG0) { // 0x7F
        fprintf(stderr, "ELF Header EI_MAG0 incorrect.\n");
        return -1;
    }
    if(ehdr.e_ident[EI_MAG1] != ELFMAG1) { // 'E'
        fprintf(stderr, "ELF Header EI_MAG1 incorrect.\n");
        return -1;
    }
    if(ehdr.e_ident[EI_MAG2] != ELFMAG2) { // 'L'
        fprintf(stderr, "ELF Header EI_MAG2 incorrect.\n");
        return -1;
    }
    if(ehdr.e_ident[EI_MAG3] != ELFMAG3) { // 'F'
        fprintf(stderr, "ELF Header EI_MAG3 incorrect.\n");
        return -1;
    }
    if (bits!=NULL) {
       *bits = ehdr.e_ident[EI_CLASS];
     //*bits = (ehdr.e_ident[EI_CLASS]==ELFCLASS32) ? 32
     //      : (ehdr.e_ident[EI_CLASS]==ELFCLASS64) ? 64 : 0;
    }
    if (lsb!=NULL) {
       *lsb = ehdr.e_ident[EI_DATA]==ELFDATA2LSB;
     //*lsb = (ehdr.e_ident[EI_DATA]==ELFDATA2LSB) ? 1
     //     : (ehdr.e_ident[EI_DATA]==ELFDATA2MSB) ? 2 : 0;
    }
    if (abi!=NULL) *abi = ehdr.e_ident[EI_OSABI];
    if (type!=NULL) *type = ehdr.e_type;
    if (machine!=NULL) *machine = ehdr.e_machine;
    if (entry!=NULL) *entry = ehdr.e_entry;

    if (verbose>0) {
        printf("%d-bit,", (ehdr.e_ident[EI_CLASS]==ELFCLASS32) ? 32
                        : (ehdr.e_ident[EI_CLASS]==ELFCLASS64) ? 64 : 0);
        printf(" %s,", (ehdr.e_ident[EI_DATA]==ELFDATA2LSB) ? "little-endian"
                     : (ehdr.e_ident[EI_DATA]==ELFDATA2MSB) ? "big-endian" : "unknown");
        printf(" %s,", (ehdr.e_ident[EI_OSABI]==0x00) ? "System V"
                     : (ehdr.e_ident[EI_OSABI]==0x03) ? "Linux" : "unknown");
        printf(" %s,", (ehdr.e_type==ET_REL) ? "Relocatable"
                     : (ehdr.e_type==ET_EXEC) ? "Executable" : "unknown");
        switch (ehdr.e_machine) {
        case 0x02: printf(" SPARC"); break;
        case 0x03: printf(" x86"); break;
        case 0x08: printf(" MIPS"); break;
        case 0x28: printf(" ARM32 (Armv7 to AArch32)"); break;
        case 0x32: printf(" IA-64"); break;
        case 0x3E: printf(" AMD x86_64"); break;
        case 0xB7: printf(" ARM64 (Armv8 to AArch64)"); break;
        case 0xF3: printf(" RISC-V"); break;
        default: printf(" 0x%02X", *type);
        }
        printf(", 0x%016X", ehdr.e_entry);
        printf("\n");
    }
    
    /* Don't forget to close the file. */
    fclose(fp);
    return 0;
}

static void
failure_elf( void )
{
    (void)fprintf(stderr, "%s\n", elf_errmsg(elf_errno()));
    exit(1);
}

//------------------------------------------------------------------------------
#if defined(TRX_AXI)||defined(BFM_AXI)
int get_confmc( con_Handle_t handle )
{
  struct _usb usb;
  conGetUsbInfo( handle, &usb);
  printf("USB information\n");
  printf("    DevSpeed         =%d%cbps\n", (usb.speed>10000) ? usb.speed/10000
                                                              : usb.speed/10
                                          , (usb.speed>10000) ? 'G' : 'M');
  printf("    BulkMaxPktSizeOut=%d\n", usb.bulk_max_pkt_size_out);
  printf("    BulkMaxPktSizeIn =%d\n", usb.bulk_max_pkt_size_in );
  printf("    IsoMaxPktSizeOut =%d\n", usb.iso_max_pkt_size_out );
  printf("    IsoMaxPktSizeIn  =%d\n", usb.iso_max_pkt_size_in  );
  fflush(stdout);

  con_MasterInfo_t gpif2mst_info;
  if (conGetMasterInfo(handle, &gpif2mst_info)) {
      fprintf(stderr, "cannot get gpif2mst info\n");
      return 1;
  }
  printf("gpif2mst information\n");
  printf("         version 0x%08X\n", gpif2mst_info.version);
  printf("         pclk_freq %d-Mhz (%s)\n", gpif2mst_info.clk_mhz
                                             , (gpif2mst_info.clk_inv)
                                             ? "inverted"
                                             : "not-inverted");
  printf("         DepthCu2f=%d, DepthDu2f=%d, DepthDf2u=%d\n"
                               , gpif2mst_info.depth_cmd
                               , gpif2mst_info.depth_u2f
                               , gpif2mst_info.depth_f2u);
  fflush(stdout);

  return 0;
}
#endif

//------------------------------------------------------------------------------
int arg_parser(int argc, char **argv)
{
    int opt;
    int longidx=0;
    extern void help(int, char **);
    extern void print_license(void);
    extern void print_version(void);

    struct option longopts[] = {
          {"elf"       , required_argument, 0, 'A'}
        , {"bin"       , required_argument, 0, 'B'}
        , {"address"   , required_argument, 0, 'C'}
        , {"confmc"    , no_argument      , 0, 'D'}
        , {"cid"       , required_argument, 0, 'c'}
        , {"verbose"   , required_argument, 0, 'g'}
        , {"version"   , no_argument      , 0, 'v'}
        , {"license"   , no_argument      , 0, 'l'}
        , {"help"      , no_argument      , 0, 'h'}
        , { 0          , 0                , 0,  0 }
    };

    while ((opt=getopt_long(argc, argv, "A:B:C:Dc:g:vlh?", longopts, &longidx))!=-1) {
       switch (opt) {
       case 'A': file_elf = calloc(strlen(optarg)+2, sizeof(char));
                 strcpy(file_elf,optarg); break;
       case 'B': file_bin = calloc(strlen(optarg)+2, sizeof(char));
                 strcpy(file_bin,optarg); break;
       case 'C': address = (unsigned long)strtoul(optarg, NULL, 0); break;
       case 'D': confmc = 1; break;
       case 'c': cid = atoi(optarg); break;
       case 'g': verbose = atoi(optarg); break;
       case 'v': print_version(); exit(0); break;
       case 'l': print_license(); exit(0); break;
       case 'h':
       case '?': help(argc, argv); exit(0); break;
       case  0 : return -1;
                 break;
       default: 
          fprintf(stderr, "undefined option: %c\n", optopt);
          help(argc, argv);
          exit(1);
       }
    }

    if ((file_elf!=NULL)&&(file_bin==NULL)) {
       file_bin = calloc(strlen(file_elf)+4, sizeof(char));
       sprintf(file_bin, "%s.bin", file_elf);
    }
    if ((file_elf==NULL)&&(file_bin!=NULL)) {
       file_elf = calloc(strlen(file_bin)+4, sizeof(char));
       sprintf(file_elf, "%s.elf", file_bin);
    }
    return 0;
}

//------------------------------------------------------------------------------
void help(int argc, char **argv)
{
  fprintf(stderr, "[Usage] %s [options]\n", argv[0]);
  fprintf(stderr, "\t-A,--elf=elf_file   elf file name to read\n");
  fprintf(stderr, "\t-B,--bin=bin_file   bin file name to write\n");
  fprintf(stderr, "\t-C,--addr=address   physical addres to write binary (default: 0x%08lX)\n", address);
  fprintf(stderr, "\t-D,--confmc         use CON-FMC when it defines (default: not use CON-FMC).\n");
  fprintf(stderr, "\t-c,--cid=num        channel id (default: %d)\n", cid);
  fprintf(stderr, "\t-g,--verbose=num    verbose level  (default: %d)\n", verbose);
  fprintf(stderr, "\t-v,--version        print version\n");
  fprintf(stderr, "\t-l,--license        print license message\n");
  fprintf(stderr, "\t-h                  print help message\n");
  fprintf(stderr, "\n");
  fprintf(stderr, "Extract executable codes (text, rodata, data, bss) from ELF.\n");
  fprintf(stderr, "\n");
}

//------------------------------------------------------------------------------
const char license[] =
"Copyright (c) 2025 by Ando Ki (andoki@gmail.com).\n\n\
This contents and its associated materials are licensed with the 2-clause BSD license to make the program and library useful in open and closed source products independent of their licensing scheme. Each contributor holds copyright over their respective contribution.\n\
All contents are provided as it is WITHOUT ANY WARRANTY and NO TECHNICAL SUPPORT will be provided for problems that might arise.\n";
void print_license( void )
{
     printf("%s %X\n\n", program, version);
     printf("%s", license);
}

//------------------------------------------------------------------------------
void print_version( void )
{
     printf("%X\n", version);
}

//------------------------------------------------------------------------------
void sig_handle(int sig)
{
   extern void cleanup();
   switch (sig) {
   case SIGINT:
   #ifndef WIN32
   case SIGQUIT:
   #endif
   case SIGSEGV:
        exit(0);
        break;
   }
}

//------------------------------------------------------------------------------
void func_exit( void )
{
    if (file_elf!=NULL) free(file_elf);
    if (file_bin!=NULL) free(file_bin);
#if defined(COSIM_BFM)
    bfm_close(cid);
#elif defined(TRX_AXI)||defined(BFM_AXI)
    if (handle!=NULL) conRelease(handle);
#endif
}

//------------------------------------------------------------------------------
// Revision history
//
// 2025.08.27: reset scheduling
// 2025.05.17: '.srodata', '.sdata', '.sbss' added
// 2025.02.20: Started by Ando Ki.
//------------------------------------------------------------------------------
