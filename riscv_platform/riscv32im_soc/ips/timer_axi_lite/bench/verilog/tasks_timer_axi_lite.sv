`ifndef TASKS_TIMER_AXI_LITE_SV 
`define TASKS_TIMER_AXI_LITE_SV 
//------------------------------------------------------------------------------
//  Copyright (c) 2024 by Ando Ki.
//  All right reserved.
//  All rights are reserved by Ando Ki.
//  Do not use in any means or/and methods without Ando Ki's permission.
//------------------------------------------------------------------------------
// tasks_timer_axi_lite.sv
//------------------------------------------------------------------------------
// VERSION: 2024.08.10.
//------------------------------------------------------------------------------
//  [MACROS]
//------------------------------------------------------------------------------
localparam CSRA_BASE    = 32'h9000_0000;
localparam CSRA_VERSION = CSRA_BASE+8'h00
         , CSRA_NAME    = CSRA_BASE+8'h04
         , CSRA_CONTROL = CSRA_BASE+8'h10
         , CSRA_PERIOD  = CSRA_BASE+8'h14
         , CSRA_COUNTER = CSRA_BASE+8'h18
         , CSRA_CLK_FREQ= CSRA_BASE+8'h20;
//------------------------------------------------------------------------------
task timer_csr;
    reg [31:0] dataR;
begin
    axi_lite_read(CSRA_VERSION , dataR); $display("VERSION  0x%08X", dataR);
    axi_lite_read(CSRA_NAME    , dataR); $display("NAME     0x%08X", dataR);
    axi_lite_read(CSRA_CONTROL , dataR); $display("CONTROL  0x%08X", dataR);
    axi_lite_read(CSRA_PERIOD  , dataR); $display("PERIOD   0x%08X", dataR);
    axi_lite_read(CSRA_COUNTER , dataR); $display("COUNTER  0x%08X", dataR);
    axi_lite_read(CSRA_CLK_FREQ, dataR); $display("CLK_FREQ 0x%08X", dataR);
end
endtask
//------------------------------------------------------------------------------
// Revision History
//
// 2024.08.10: Started by Ando Ki (andoki@gmail.com)
//------------------------------------------------------------------------------
`endif // TASKS_TIMER_AXI_LITE_SV 
