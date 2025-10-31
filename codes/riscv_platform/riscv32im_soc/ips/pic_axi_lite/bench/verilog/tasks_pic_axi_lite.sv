`ifndef TASKS_PIC_AXI_LITE_SV 
`define TASKS_PIC_AXI_LITE_SV 
//------------------------------------------------------------------------------
//  Copyright (c) 2024 by Ando Ki.
//  All right reserved.
//  All rights are reserved by Ando Ki.
//  Do not use in any means or/and methods without Ando Ki's permission.
//------------------------------------------------------------------------------
// tasks_pic_axi_lite.sv
//------------------------------------------------------------------------------
// VERSION: 2024.08.10.
//------------------------------------------------------------------------------
//  [MACROS]
//------------------------------------------------------------------------------
localparam CSRA_BASE    = 32'h9000_0000;
localparam CSRA_VERSION = CSRA_BASE+8'h00
         , CSRA_NAME    = CSRA_BASE+8'h04
         , CSRA_EDGE    = CSRA_BASE+8'h10 // RW, edge enable 1=edge, 0=level
         , CSRA_POL     = CSRA_BASE+8'h14 // RW, polarity    1=high-level/rising-edge
         , CSRA_ENABLE  = CSRA_BASE+8'h18 // RW, enable      1=enable, 0=disable
         , CSRA_PENDING = CSRA_BASE+8'h1C // RO, pending     1=irq_out pending
         , CSRA_CLEAR   = CSRA_BASE+8'h20 // WO, clear       1=irq_in clear
         , CSRA_IRQ_IN  = CSRA_BASE+8'h24;// RO, current irq_in signal level
//------------------------------------------------------------------------------
task pic_csr;
    reg [31:0] dataR;
begin
    axi_lite_read(CSRA_VERSION, dataR); $display("VERSION 0x%08X", dataR);
    axi_lite_read(CSRA_NAME   , dataR); $display("NAME    0x%08X", dataR);
    axi_lite_read(CSRA_EDGE   , dataR); $display("EDGE    0x%08X", dataR);
    axi_lite_read(CSRA_POL    , dataR); $display("POL     0x%08X", dataR);
    axi_lite_read(CSRA_ENABLE , dataR); $display("ENABLE  0x%08X", dataR);
    axi_lite_read(CSRA_PENDING, dataR); $display("PENDING 0x%08X", dataR);
    axi_lite_read(CSRA_CLEAR  , dataR); $display("CLEAR   0x%08X", dataR);
    axi_lite_read(CSRA_IRQ_IN , dataR); $display("IRQ_IN  0x%08X", dataR);
end
endtask
//------------------------------------------------------------------------------
// Revision History
//
// 2024.08.10: Started by Ando Ki (andoki@gmail.com)
//------------------------------------------------------------------------------
`endif // TASKS_PIC_AXI_LITE_SV 
