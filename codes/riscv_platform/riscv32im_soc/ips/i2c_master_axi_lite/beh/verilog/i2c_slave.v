//------------------------------------------------------------------------------
// FILE: i2c_slave.v
//------------------------------------------------------------------------------
// DESCRIPTION: I2C Slave Model
//------------------------------------------------------------------------------
// VERSION: 2019.01.02.
//------------------------------------------------------------------------------
// Note
//------------------------------------------------------------------------------
`include "i2c_slave_if.v"
`include "i2c_slave_mem.v"
`timescale 1ns/1ns

module i2c_slave
     #(parameter P_I2C_DEV_ADDR_LEN=7 // can be 7, 10
               , P_I2C_DEV_ADDR    =7'h33
               , P_I2C_REG_ADDR_LEN=8 // can be 8, 16
               , P_I2C_MEM_SIZE    =9'h100)
(
       input   wire  SCL
     , inout   wire  SDA
);
   //---------------------------------------------------------------------------
   reg   rst_n=1'b0; initial begin #55; rst_n = 1'b1; end
   wire  wp=1'b0;
   //---------------------------------------------------------------------------
   wire  sda_i;
   wire  sda_o;
   wire  sda_t;
   assign SDA = (sda_t==1'b0) ? sda_o : 1'bZ;
   assign sda_i = SDA;
   //---------------------------------------------------------------------------
   wire [P_I2C_REG_ADDR_LEN-1:0] addr;
   wire [ 7:0] wdata, rdata;
   wire        wr, en, ack;
   i2c_slave_if #(.P_I2C_DEV_ADDR_LEN(P_I2C_DEV_ADDR_LEN)
                 ,.P_I2C_DEV_ADDR    (P_I2C_DEV_ADDR    )
                 ,.P_I2C_REG_ADDR_LEN(P_I2C_REG_ADDR_LEN)
                 )
   u_if (
       .rst_n (rst_n )
      ,.scl_i (SCL   )
      ,.sda_i (sda_i )
      ,.sda_o (sda_o )
      ,.sda_t (sda_t )
      ,.wp    (wp    )
      ,.addr       (addr)
      ,.wdata      (wdata)
      ,.rdata      (rdata)
      ,.wr         (wr)
      ,.en         (en)
      ,.ack        (ack)
      ,.i2c_reset  () 
   );
   //---------------------------------------------------------------------------
   i2c_slave_mem #(.ADDR_LEN(P_I2C_REG_ADDR_LEN)
                  ,.MEM_SIZE(P_I2C_MEM_SIZE))
   u_mem (
       .rst_n (rst_n )
      ,.addr  (addr)
      ,.wdata (wdata)
      ,.rdata (rdata)
      ,.wr    (wr)
      ,.en    (en)
      ,.ack   (ack)
   );
   //---------------------------------------------------------------------------
endmodule
//------------------------------------------------------------------------------
// Revision history
//
// 2019.01.02: Started by Ando Ki based on DIP_0047_i2c_slave.
//------------------------------------------------------------------------------
