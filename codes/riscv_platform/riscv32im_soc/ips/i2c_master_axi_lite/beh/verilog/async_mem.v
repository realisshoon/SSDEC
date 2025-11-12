/*********************************************************
 * Copyright (c) 2018 by Ando Ki.
 * All right reserved.
 *
 * http://www.future-ds.com
 * adki@future-ds.com
 *********************************************************
 */
module async_mem (
    resetb,
    addr,
    wdata,
    rdata,
    wr,
    en,
    ack
);
parameter MEM_SIZE=9'h100;
    input        resetb; wire       resetb;
    input  [7:0] addr;   wire [7:0] addr;
    input  [7:0] wdata;  wire [7:0] wdata;
    output [7:0] rdata;  reg  [7:0] rdata;
    input        wr;     wire       wr;     // wr
    input        en;     wire       en;     // enable
    output       ack;    wire       ack = en;
    //--------------------------------------------------
    reg [7:0] mem[0:MEM_SIZE-1];
    //--------------------------------------------------
    always @ (addr or en) begin
        rdata <= mem[addr&(MEM_SIZE-1)];
    end
    always @ (negedge en or negedge resetb) begin
        if (resetb==1'b0) begin 
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
