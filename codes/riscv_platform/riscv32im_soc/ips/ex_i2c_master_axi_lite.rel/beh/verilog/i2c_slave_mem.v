//------------------------------------------------------------------------------
// Copyright (c) 2019 Future Design Systems
//------------------------------------------------------------------------------
// FILE: i2c_slave_mem.v
//------------------------------------------------------------------------------
// DESCRIPTION: I2C Slave
//------------------------------------------------------------------------------
// VERSION: 2019.01.02.
//------------------------------------------------------------------------------
// Note
//------------------------------------------------------------------------------
`timescale 1ns/1ns

module i2c_slave_mem
    #(parameter ADDR_LEN=8
              , MEM_SIZE=9'h100)
(
       input   wire       rst_n
     , input   wire [ADDR_LEN-1:0] addr
     , input   wire [7:0] wdata
     , output  reg  [7:0] rdata
     , input   wire       wr     // wr
     , input   wire       en     // enable
     , output  wire       ack
);
    //--------------------------------------------------
    assign ack = en;
    //--------------------------------------------------
    reg [7:0] mem[0:MEM_SIZE-1];
    //--------------------------------------------------
    always @ (addr or en) begin
        rdata <= mem[addr&(MEM_SIZE-1)];
    end
    always @ (negedge en or negedge rst_n) begin
        if (rst_n==1'b0) begin 
        end else begin 
           if (wr==1'b1) begin
              mem[addr&(MEM_SIZE-1)] <= wdata;
//`ifdef DEBUG
//       $display("%m: mem[0x%x]<=0x%x written",
//              addr&(MEM_SIZE-1), wdata);
//`endif
           end
        end
    end
endmodule
