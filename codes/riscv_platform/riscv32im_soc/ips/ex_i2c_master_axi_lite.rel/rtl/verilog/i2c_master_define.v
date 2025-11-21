`ifndef I2C_MASTER_DEFINE_V
`define I2C_MASTER_DEFINE_V
//------------------------------------------------------------------------------
// Copyright (c) 2025 by Ando Ki
// All right reserved.
//------------------------------------------------------------------------------
// i2c_master_define.v
//------------------------------------------------------------------------------
// It defines current version of RTL.
`define    I2C_MASTER_VERSION  32'h20250910

//------------------------------------------------------------------------------
// AT24C02C EEPROM 사양 관련 추가 정의 (<<-- 이 부분이 추가됨)
//------------------------------------------------------------------------------

// EEPROM 슬레이브 주소 정의 (P1, P0 비트가 00일 때)
`define EEPROM_SLAVE_ADDR       7'b1010000 

// AT24C02C 페이지 쓰기 크기 정의 (8바이트)
`define I2C_PAGE_SIZE           8'd8     

//------------------------------------------------------------------------------
// I2C FSM 상태 정의 (필수 추가)
// 기존 FSM 상태 코드에 다음을 추가합니다. (5-bit width 가정)
//------------------------------------------------------------------------------
// I2C Command Codes
`define I2C_CMD_START           5'h01
`define I2C_CMD_SEND_BYTE       5'h02
`define I2C_CMD_RECEIVE_BYTE    5'h03
`define I2C_CMD_STOP            5'h04
`define I2C_CMD_REPEATED_START  5'h05 // 반복 START 명령 코드

// I2C Status Codes
`define I2C_STATE_IDLE          5'h00
`define I2C_STATE_START         5'h01
`define I2C_STATE_SEND_ADDR     5'h02
`define I2C_STATE_SEND_WADDR    5'h03 // Word Address 전송
`define I2C_STATE_SEND_DATA     5'h04
`define I2C_STATE_RECEIVE_DATA  5'h05
`define I2C_STATE_STOP          5'h06

// EEPROM 특화 상태 추가 (ACK Polling, Random Read)
`define I2C_STATE_REPEATED_START        5'h07 // 워드 주소 전송 후 반복 START 조건 생성
`define I2C_STATE_SEND_READ_ADDR        5'h08 // 반복 START 후 R=1 주소 전송

// ACK Polling 상태 추가 (쓰기 완료 대기 FSM)
`define I2C_STATE_ACK_POLLING_START     5'h10 // START 조건 생성
`define I2C_STATE_ACK_POLLING_SLAVE     5'h11 // 슬레이브 주소(W=0) 전송
`define I2C_STATE_ACK_POLLING_WAIT      5'h12 // ACK 응답 대기 및 폴링 반복/종료 결정

//------------------------------------------------------------------------------
// Revision History:
//
// 2025.09.10.: Started
//------------------------------------------------------------------------------
`endif