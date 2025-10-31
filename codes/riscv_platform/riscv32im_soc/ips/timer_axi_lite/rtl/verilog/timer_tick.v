//------------------------------------------------------------------------------
//  Copyright (c) 2024 by Ando Ki.
//  All right reserved.
//
// This program is distributed in the hope that it
// will be useful to understand Ando Ki's work,
// BUT WITHOUT ANY WARRANTY.
//------------------------------------------------------------------------------
// timer_tick.v
//------------------------------------------------------------------------------
// VERSION = 2024.08.10.
//------------------------------------------------------------------------------
// CSR access signals
//              __    __    __    __    __
// clk       __|  |__|  |__|  |__|  |__|  |
//              _____             _____
// addr[..]  XXX_____XXXXXXXXXXXXX_____XXX
//              _____
// rden      __|     |____________________
//                    _____
// rdata[..] XXXXXXXXX_____XXXXXXXXXXXXXXX
//                                _____
// wren      ____________________|     |__
//                                _____
// wdata[..] XXXXXXXXXXXXXXXXXXXXX_____XXX
//------------------------------------------------------------------------------
module timer_tick
     #(parameter CLK_FREQ=100_000_000
               , VERSION =32'h2024_0810
               , NAME    ="TIME")
(
      input  wire        reset_n// reset (asynchronous active low)
    , input  wire        clk // clock
    , input  wire [ 7:0] addr // address
    , input  wire        rden  // read enable
    , input  wire        wren  // write enable
    , input  wire [31:0] wdata // data output
    , output reg  [31:0] rdata // data input
    , output wire        interrupt
);
    //--------------------------------------------------------------------------
    localparam TT_DISABLE=2'b00;
    localparam TT_RESTART=2'b01;
    localparam TT_ONE    =2'b10;
    localparam TT_CONT   =2'b11;
    //--------------------------------------------------------------------------
    // csr address
    localparam CSRA_VERSION = 8'h00
             , CSRA_NAME    = 8'h04
             , CSRA_CONTROL = 8'h10
             , CSRA_PERIOD  = 8'h14
             , CSRA_COUNTER = 8'h18
             , CSRA_CLK_FREQ= 8'h20;
    //--------------------------------------------------------------------------
    reg  [1:0]  mode;
    reg         ie;   // interrupt enable
    reg         ip;   // interrupt pending
    reg  [31:0] csr_counter;
    reg  [31:0] csr_period;   // timer period
    wire [31:0] csr_control = {28'h0, ip, ie, mode};
    //--------------------------------------------------------------------------
    assign interrupt = ip;
    //--------------------------------------------------------------------------
    // CSR read
    always @ (posedge clk or negedge reset_n) begin
        if (reset_n==1'b0) begin
            rdata <= 32'h0;
        end else if (rden) begin
            case (addr)
            CSRA_VERSION : rdata <= VERSION;
            CSRA_NAME    : rdata <= NAME;
            CSRA_CONTROL : rdata <= csr_control;
            CSRA_PERIOD  : rdata <= csr_period ;
            CSRA_COUNTER : rdata <= csr_counter;
            CSRA_CLK_FREQ: rdata <= CLK_FREQ;
            default      : rdata <= 32'h0;
            endcase
        end
    end
    //--------------------------------------------------------------------------
    // CSR write
    always @ (posedge clk or negedge reset_n) begin
        if (reset_n==1'b0) begin
           mode       <=  TT_DISABLE; // 2'b00;
           ie         <=  1'b0;
           csr_period <= 32'h0;
        end else begin
           if (wren) begin
               case (addr)
               CSRA_CONTROL: {ie, mode} <= wdata[2:0];
               CSRA_PERIOD : csr_period <= wdata;
               endcase
           end
        end
    end
    //--------------------------------------------------------------------------
    always @ (posedge clk or negedge reset_n) begin
        if (reset_n==1'b0) begin
           ip   <= 1'b0;
        end else begin
           if (wren&(addr==CSRA_CONTROL)) begin
               if (rdata[3]) ip <= 1'b0;
           end else begin
               ip <= ie & (ip|(csr_period==csr_counter));
           end
        end
    end
    //--------------------------------------------------------------------------
    always @ (posedge clk or negedge reset_n) begin
        if (reset_n==1'b0) begin
           csr_counter <= 32'h1;
        end else begin
           if (wren&(addr==CSRA_COUNTER)) begin
               csr_counter <= rdata;
           end else begin
               case (mode)
               TT_DISABLE: // 00
                  csr_counter <= 32'h1;
               TT_RESTART: // 01
                  csr_counter <= (csr_counter==csr_period) ? 32'h1 : csr_counter + 1;
               TT_ONE:     // 10
                  csr_counter <= (csr_counter==csr_period) ? csr_counter : csr_counter + 1;
               TT_CONT:    // 11
                  csr_counter <= csr_counter + 1;
               default: csr_counter <= 32'h1;
               endcase
           end
        end
    end
endmodule
// A timer interrupt will happen everytime
// CONTROL[IE](2) bit is set and PERIOD(31:0)
// matches the COUNTER.
// When an interrupt is pending the CONTROL[IP](3) bit will be set
// and the interrupt will be asserted to 1 
// until CONTROL[IP](3) is cleared by writting a 0 to the CONTROL[IP] bit.
//
// mode: 00 tick timer is disabled (default)
// mode: 01 timer is restarted when PERIOD matches COUNTER
// mode: 10 timer stops when PERIOD matches COUNTER
// mode: 11 timer does not stop when PERIOD matches COUNTER
//
// interrupt enable: 0 disabled (default)
// interrupt enable: 1 enabled
//
// interrupt pending: 0 none (default)
// interrupt pending: 1 tick timer interrupt pending (write 0 to clear it)
//
// time period:
//---------------------------------------------------------------
