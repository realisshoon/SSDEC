//------------------------------------------------------------------------------
//  Copyright (c) 2024 by Ando Ki.
//  All right reserved.
//  All rights are reserved by Ando Ki.
//  Do not use in any means or/and methods without Ando Ki's permission.
//------------------------------------------------------------------------------
// tasks_tty.sv
//------------------------------------------------------------------------------
// VERSION: 2024.09.05.
//------------------------------------------------------------------------------
`timescale 1ns/1ps

module tty
     #(parameter integer BAUD=115200
      ,parameter integer PARITY=0 // 0:none, 1:odd, 2:even
      ,parameter integer STOP=1   // 0:no, 1:1-bit, 2:2-bit
      ,parameter integer WIDTH=8) // 8-bit data width
(
    input  wire uart_rx,
    output reg  uart_tx
);
    //------------------------------------------------------------------------------
    integer baud;
    integer parity;
    integer stop;
    integer width;
    real    interval;
    integer code;
    string  str_val, str_hex;
    initial begin
        baud    = BAUD  ;
        parity  = PARITY;
        stop    = STOP  ;
        width   = WIDTH ;
        if ($test$plusargs("BAUD_RATE")) begin
            code = $value$plusargs("BAUD_RATE=%s", str_val);
            if (code==0) begin
                $display("%m ERROR cannot get baud rate.");
                $finish(2);
            end
            if (str_val.substr(0,1)=="0x") begin
                 str_hex = str_val.substr(2,str_val.len()-1);
                 baud = str_hex.atohex();
            end else begin
                 baud = str_val.atoi();
            end
        end
        interval=(1_000_000_000/baud);// nsec
    end
    //------------------------------------------------------------------------------
    reg       pebit;
    reg [7:0] data;
    //------------------------------------------------------------------------------
    always @ ( negedge uart_rx ) begin // wait start
        pebit = 1'b0;
        data  = 8'h0;
        #(interval*1.5);
        pebit = 1'b0;
        for (int idy=0; idy<width; idy=idy+1) begin
            data[idy] = uart_rx;
            pebit = pebit^uart_rx; // 1 for odd
            #(interval);
        end // for (int idy
        case (parity)
            2: begin if (pebit^uart_rx) begin // check even
                         $display($time,,"%m even-parity error");
                     end
                     #(interval);
               end
            1: begin if (!(pebit^uart_rx)) begin // check odd
                         $display($time,,"%m odd-parity error");
                     end
                     #(interval);
               end
            0: begin end // no parity
            default: $display("%m unknown parity mode");
        endcase
        case (stop)
            2: begin if (uart_rx!=1'b1) begin // two stop bits
                         $display($time,,"%m first two-stop bit error");
                     end
                     #(interval);
                     if (uart_rx!=1'b1) begin // two stop bits
                         $display($time,,"%m second two-stop bit error");
                     end
               end
            1: begin if (uart_rx!=1'b1) begin // one stop bit
                         $display($time,,"%m one-stop bit error: %b", uart_rx);
                     end
               end
            default: $display("%m unknown stop mode");
        endcase
        $write("%c", data); $fflush();
    end
    //------------------------------------------------------------------------------
    initial uart_tx=1'b1;
    //------------------------------------------------------------------------------
    // Send 'msg_len' characters
    task tty_send;
        input [ 7:0]  msg[];
        input integer msg_len; // num of characters
        input integer baud;
        input integer width; // 8 or 7
        input integer parity; // 0:no, 1:odd, 2:even
        input integer stop; // 0:no, 1:1-bit, 2:2-bit
    
        integer   interval;
        reg       pebit;
        reg [7:0] data;
    begin
        if (msg_len>msg.size()) begin
            $display("%m msg length mis-match.");
            disable tty_send;
        end
        interval = (1_000_000_000/baud); // nsec
        pebit = 1'b0;
        for (int idx=0; idx<msg_len; idx=idx+1) begin
            data = msg[idx];
            uart_tx = 1'b0; // start bit
            #(interval);
            pebit = 1'b0;
            for (int idy=0; idy<width; idy=idy+1) begin
                uart_tx = data[idy];
                pebit = pebit^data[idy]; // 1 for odd
                #(interval);
            end // for (int idy
            case (parity)
                2: begin uart_tx = pebit; // make even
                         #(interval);
                   end
                1: begin uart_tx = ~pebit; // make odd
                         #(interval);
                   end
                0: begin end // no parity
                default: $display("%m unknown parity mode");
            endcase
            case (stop)
                2: begin uart_tx = 1'b1; // two stop bits
                         #(interval);
                         #(interval);
                   end
                1: begin uart_tx = 1'b1; // one stop bit
                         #(interval);
                   end
                default: $display("%m unknown stop mode");
            endcase
        end // for (int idx
    end
    endtask
endmodule
//------------------------------------------------------------------------------
// Revision History
//
// 2024.09.05: Minor bug-fixed of 'stop'.
// 2024.08.10: Started by Ando Ki (andoki@gmail.com)
//------------------------------------------------------------------------------
