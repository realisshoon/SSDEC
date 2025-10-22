//----------------------------------------------------------------
//  Copyright (c) 2024 by Ando Ki.
//  All right reserved.
//
// This program is distributed in the hope that it
// will be useful to understand Ando Ki's work,
// BUT WITHOUT ANY WARRANTY.
//----------------------------------------------------------------
// tty.v
//----------------------------------------------------------------
// VERSION: 2024.08.10.
//----------------------------------------------------------------
`timescale 1ns/1ps

module tty #(parameter BAUD_RATE=115200
                     , WIDTH=8 // 8-bit, 7-bit
                     , PARITY=0 // 0=no-parity, 1=odd, 2=even
                     , STOP=1 // 1=1-bit, 2=2-bit
                     )
(
   output  reg   STX,
   input   wire  SRX
);
   //--------------------------------------------
   localparam INTERVAL = (1_000_000_000/BAUD_RATE); // nsec
   //--------------------------------------------
   reg [3:0] width;
   reg [7:0] data;
   reg [7:0] x;
   reg       pebit; // even parity
   //--------------------------------------------
   initial begin STX = 1'b1; data = 0; x = 0; end
   //--------------------------------------------
   always @ (negedge SRX) begin
          width = WIDTH;
          pebit = 1'b0;
          x = 0;
          #(INTERVAL*1.5);
          repeat (width) begin // LSB comes first
                  data[x] = SRX;
                  pebit = pebit ^ SRX;
                  x = x + 1;
                  #(INTERVAL);
          end
          if (PARITY) begin
              pebit = pebit ^ SRX;
              if (PARITY==2) begin // even-parity
                  if (pebit) $display($time,,"%m even parity error");
              end else if (PARITY==1) begin // odd-parity
                  if (!pebit) $display($time,,"%m odd parity error");
              end else begin
                  $display($time,,"%m parity unknown.");
              end
              #(INTERVAL);
          end
          if (STOP>=1) begin
              if (SRX!=1'b1) $display($time,,"%m stop-bit error first");
          end
          if (STOP>=2) begin
              #(INTERVAL);
              if (SRX!=1'b1) $display($time,,"%m stop-bit error second");
          end
          #(INTERVAL*0.2);
         `ifdef DEBUG
              if ((data>=8'h20)&&(data<=8'h7E)) begin
                   $display($time," 0x%x(%c) received!", data, data);
              end else begin
                   $display($time," 0x%x  received!", data);
              end
              $fflush();
         `else
             $write("%c", data);
             $fflush();
         `endif
   end

endmodule

//----------------------------------------------------------------
//   RS232-C signal at the end of UART not on the cable.
//   ___    __ __ __ __ __ __ __ ________
//      |  |  |  |  |  |  |  |  |  |   
//      |  |D0|D1|D2|D3|D4|D5|D6|D7|S
//      |__|__|__|__|__|__|__|__|__|
//        |
//        0
//  starts by changing 1 to 0.
//  stops by returing to 1.
//----------------------------------------------------------------
// Revision History
//
// 2024.08.10.: Starting by Ando Ki (adki@gmail.com)
//----------------------------------------------------------------
