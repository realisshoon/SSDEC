//------------------------------------------------------------------------------
//  Copyright (c) 2024 by Ando Ki.
//  All right reserved.
//
// This program is distributed in the hope that it
// will be useful to understand Ando Ki's work,
// BUT WITHOUT ANY WARRANTY.
//------------------------------------------------------------------------------
// pic_core.v
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

module pic_core
     #(parameter NUM_IRQ=32
               , VERSION=32'h2024_0810
               , NAME   ="PIC")
(
      input  wire               clk // clock
    , input  wire               reset_n// reset (asynchronous active low)
    , input  wire [ 7:0]        addr // address
    , input  wire               rden  // read enable
    , input  wire               wren  // write enable
    , input  wire [31:0]        wdata // data output
    , output reg  [31:0]        rdata // data input
    , input  wire [NUM_IRQ-1:0] irq_in  // interrupt request inputs (must be clk synchronized)
    , output wire               irq_out // interrupt output
);
    //--------------------------------------------------------------------------
    // synthesis translate_off
    initial begin
        if(NUM_IRQ > 32)
          $display("%m: max. 32 irq_in sources supported, but %d", NUM_IRQ);
    end
    // synthesis translate_on
    //--------------------------------------------------------------------------
    // csr address
    localparam CSRA_VERSION = 8'h00
             , CSRA_NAME    = 8'h04
             , CSRA_EDGE    = 8'h10 // RW, edge enable 1=edge, 0=level
             , CSRA_POL     = 8'h14 // RW, polarity    1=high-level/rising-edge
             , CSRA_ENABLE  = 8'h18 // RW, enable      1=enable, 0=disable
             , CSRA_PENDING = 8'h1C // RO, pending     1=irq_out pending
             , CSRA_CLEAR   = 8'h20 // WO, clear       1=irq_in clear
             , CSRA_IRQ_IN  = 8'h24;// RO, current irq_in signal level
    //--------------------------------------------------------------------------
    // CSR
    reg  [NUM_IRQ-1:0] csr_edgen  ; // 1 for edge, 0 for level
    reg  [NUM_IRQ-1:0] csr_pol    ; // 1 for high/rising, 0 for low/falling
    reg  [NUM_IRQ-1:0] csr_enable ; // 1 for enable
    reg  [NUM_IRQ-1:0] csr_pending; // 1 for pending, i.e., irq_out
    reg  [NUM_IRQ-1:0] csr_clear  ; // 1 for clear bit
    //--------------------------------------------------------
    // CSR access read
    always @(posedge clk or negedge reset_n) begin
        if (reset_n==1'b0) begin
            rdata <= 32'h0;
        end else if ( rden ) begin
            rdata <= 32'h0;
            case (addr)
            CSRA_VERSION: rdata <= VERSION;
            CSRA_NAME   : rdata <= NAME;
            CSRA_EDGE   : rdata[NUM_IRQ-1:0] <= csr_edgen  ;
            CSRA_POL    : rdata[NUM_IRQ-1:0] <= csr_pol    ;
            CSRA_ENABLE : rdata[NUM_IRQ-1:0] <= csr_enable ;
            CSRA_PENDING: rdata[NUM_IRQ-1:0] <= csr_pending;
            CSRA_IRQ_IN : rdata[NUM_IRQ-1:0] <= irq_in     ;
            default     : rdata[NUM_IRQ-1:0] <= 32'h0;
            endcase
        end // if
    end // always
    //--------------------------------------------------------------------------
    // CSR access write
    always @(posedge clk or negedge reset_n) begin
        if (reset_n==1'b0) begin
              csr_edgen <= {{NUM_IRQ}{1'b0}};
              csr_pol   <= {{NUM_IRQ}{1'b0}};
              csr_enable<= {{NUM_IRQ}{1'b0}};
        end else if (wren) begin
            case (addr)
            CSRA_EDGE   : csr_edgen  <= wdata[NUM_IRQ-1:0]; // EDGE-ENABLE register
            CSRA_POL    : csr_pol    <= wdata[NUM_IRQ-1:0]; // POLARITY register
            CSRA_ENABLE : csr_enable <= wdata[NUM_IRQ-1:0]; // ENABLE register
            endcase
        end // if
    end // always
    //--------------------------------------------------------------------------
    reg  [NUM_IRQ-1:0] irq_in_reg    ;
    always @(posedge clk or negedge reset_n) begin
        if (reset_n==1'b0) begin
            irq_in_reg     <= {NUM_IRQ{1'b0}};
        end else begin
            irq_in_reg <= irq_in;
        end // if
    end // always
    //--------------------------------------------------------------------------
    wire [NUM_IRQ-1:0] irq_in_rising = irq_in&~irq_in_reg;
    wire [NUM_IRQ-1:0] irq_in_falling=~irq_in& irq_in_reg;
    reg  [NUM_IRQ-1:0] irq_event     ;
    integer idx;
    always @ ( * ) begin
        for (idx=0; idx<NUM_IRQ; idx=idx+1) begin
             if (csr_enable[idx]==1'b1) begin
                 if (csr_edgen[idx]) begin // edge-sensitive
                     irq_event[idx] = csr_pol[idx]~^irq_in[idx];
                 end else begin // pol-sensitive
                     irq_event[idx] = (csr_pol[idx]) ? irq_in_rising // rising
                                                     : irq_in_falling; // falling
                 end
             end else begin
                 irq_event[idx] = 1'b0;
             end
        end
    end
    //--------------------------------------------------------------------------
    // pending register is a special case
    always @(posedge clk or negedge reset_n) begin
        if (reset_n==1'b0) begin
              csr_pending <= {{NUM_IRQ}{1'b0}};
        end else begin
            if (wren==1'b1 && addr==CSRA_CLEAR) begin
                csr_pending <= (csr_pending & ~wdata[NUM_IRQ-1:0]) | irq_event;
            end else begin
                csr_pending <= csr_pending | irq_event;
            end
        end // if
    end // always
    //--------------------------------------------------------------------------
    // generate CPU irq_out signal
    assign irq_out = csr_pending;
    //--------------------------------------------------------------------------
endmodule
// This is a simple Programmable Interrupt Controller.
// The number of irq_outs is depending on the databus size.
// There's one irq_out input per databit (i.e. 16 irq_outs for a 16
// bit databus).
// All attached devices share the same CPU priority level.
//
// Registers:
//
// 0x00: EdgeEnable Register
//       bits 31:0 R/W  Edge Enable '1' = edge triggered irq_out source
//                                  '0' = level triggered irq_out source
// 0x01: PolarityRegister
//       bits 31:0 R/W Polarity     '1' = high level / rising edge
//                                  '0' = low level / falling edge
// 0x02: MaskRegister
//       bits 31:0 R/W Mask         '1' = irq_out masked (disabled)
//                                  '0' = irq_out not masked (enabled)
// 0x03: PendingRegister
//       bits 31:0 R/W Pending      '1' = irq_out pending
//                                  '0' = no irq_out pending
//
// A CPU irq_out is generated when an irq_out is pending and its
// MASK bit is cleared.
//
// HOWTO:
//
// Clearing pending irq_outs:
//     Writing a '1' to a bit in the clear register clears the
//     irq_out. Make sure to clear the irq_in at the source before
//     writing to the clear register. Otherwise the irq_out
//     will be set again.
//
// Priority based irq_outs:
//     Upon reception of an irq_out, check the irq_in register and
//     determine the highest priority irq_in. Mask all irq_outs from the
//     current level to the lowest level. This negates the irq_out line, and
//     makes sure only irq_outs with a higher level are triggered. After
//     completion of the irq_out service routine, clear the irq_out source,
//     the irq_out bit in the pending register, and restore the MASK register
//     to it's previous state.
//
// Addapt the core for fewer irq_out sources:
// If less than 8 irq_out sources are required, than the 'is' parameter
// can be set to the amount of required irq_outs. Interrupts are mapped
// starting at the LSBs. So only the 'is' LSBs per register are valid. All
// other bits (i.e. the 8-'is' MSBs) are set to zero '0'.
// Codesize is approximately linear to the amount of irq_outs. I.e. using
// 4 instead of 8 irq_out sources reduces the size by approx. half.
