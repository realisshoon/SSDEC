#include "mfrc522_api.h"
#include "my_printf.h"
#include "spi_api.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

#if defined(COSIM_LIB) && (COSIM_LIB == 1)
#include "cosim_bfm_api.h"
#elif defined(TRX_BFM) && (TRX_BFM == 1)
#include "trx_axi_api.h"
con_Handle_t handle = NULL;
#endif

//------------------------------------------------------------------------------
// 전역 변수
//------------------------------------------------------------------------------
int cid = 0;
int verbose = 0;
int rigor = 0;
int level = 3;

//------------------------------------------------------------------------------
// 함수 선언
//------------------------------------------------------------------------------
int get_args(int argc, char *argv[]);
void test_spi_axi(void);

//------------------------------------------------------------------------------
// SPI AXI 테스트
//------------------------------------------------------------------------------
void test_spi_axi(void) {
  uint8_t version;

  if (verbose) {
    printf("========================================\n");
    printf("SPI AXI Controller Test (BFM)\n");
    printf("========================================\n");
  }

  // 1. SPI 초기화
  if (verbose)
    printf("[INFO] Initializing SPI Controller...\n");
  spi_set_addr(0xC0000000); // Base Address 설정 (필요시 수정)
  spi_init();

  // 2. MFRC522 초기화
  if (verbose)
    printf("[INFO] Initializing MFRC522...\n");
  MFRC522_Init();

  // 3. 버전 레지스터 읽기
  if (verbose)
    printf("[INFO] Reading Version Register (0x37)...\n");
  version = MFRC522_ReadReg(MFRC522_REG_VERSION);

  printf("[RESULT] MFRC522 Version: 0x%02X\n", version);

  // 4. 결과 검증
  // Dummy Model: 0x92 (또는 이전 코드의 0xAA, 0x91 등)
  if (version == 0x92 || version == 0x91 || version == 0xAA) {
    printf("[SUCCESS] MFRC522 detected successfully.\n");
  } else {
    printf("[FAILURE] Unexpected version. Check connection or simulation "
           "model.\n");
  }

  if (verbose) {
    printf("========================================\n");
    printf("SPI AXI Controller Test Complete\n");
    printf("========================================\n");
  }
}

//------------------------------------------------------------------------------
// 메인 함수
//------------------------------------------------------------------------------
int main(int argc, char *argv[]) {
  setvbuf(stdout, NULL, _IOLBF, 0); // stdout 라인 버퍼링 설정

  if (get_args(argc, argv) != 0) {
    return 0;
  }

#if defined(COSIM_LIB) && (COSIM_LIB == 1)
  bfm_set_verbose(verbose);
  if (bfm_open(cid) != 0) {
    if (verbose)
      printf("ERROR: Failed to open BFM channel %d\n", cid);
    return -1;
  }
#endif

  // 테스트 실행
  test_spi_axi();

#if defined(COSIM_LIB) && (COSIM_LIB == 1)
  bfm_close(cid);
#endif

  return 0;
}

int get_args(int argc, char *argv[]) {
  for (int a = 1; a < argc; a++) {
    if ((!strcmp(argv[a], "-h")) || (!strcmp(argv[a], "-?"))) {
      printf("%s [options]\n", argv[0]);
      printf("   -cid  cid   : set communicate channel id\n");
      printf("   -v    level : set verbose level\n");
      return 1;
    } else if (!(strcmp(argv[a], "-cid"))) {
      cid = atoi(argv[++a]);
    } else if (!(strcmp(argv[a], "-v"))) {
      verbose = atoi(argv[++a]);
    }
  }
  return (0);
}