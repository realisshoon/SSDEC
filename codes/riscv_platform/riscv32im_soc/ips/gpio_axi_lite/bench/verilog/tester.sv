//------------------------------------------------------------------------------
// Copyright (c) 2025 by Ando Ki
//------------------------------------------------------------------------------
// tester.v
//------------------------------------------------------------------------------
`timescale 1ns/1ps

module tester
     #(parameter P_WIDTH=32)
(
      input  wire        axil_aresetn
    , input  wire        axil_aclk
    , output reg  [31:0] m_axi_lite_awaddr
    , output reg         m_axi_lite_awvalid
    , input  wire        m_axi_lite_awready
    , output reg  [31:0] m_axi_lite_wdata
    , output reg         m_axi_lite_wvalid
    , input  wire        m_axi_lite_wready
    , input  wire [ 1:0] m_axi_lite_bresp
    , input  wire        m_axi_lite_bvalid
    , output reg         m_axi_lite_bready
    , output reg  [31:0] m_axi_lite_araddr
    , output reg         m_axi_lite_arvalid
    , input  wire        m_axi_lite_arready
    , input  wire [31:0] m_axi_lite_rdata
    , input  wire [ 1:0] m_axi_lite_rresp
    , input  wire        m_axi_lite_rvalid
    , output reg         m_axi_lite_rready
    , inout  wire [P_WIDTH-1:0] GPIO
    , input  wire               interrupt
);
    //--------------------------------------------------------------------------
    `include "tasks_axi_lite.sv"
    //--------------------------------------------------------------------------
    localparam CSRA_GPIO    =32'hC005_0000;
    localparam CSRA_VERSION =CSRA_GPIO+'h00
             , CSRA_NAME    =CSRA_GPIO+'h04
             , CSRA_DIR     =CSRA_GPIO+'h10
             , CSRA_INPUT   =CSRA_GPIO+'h14
             , CSRA_OUTPUT  =CSRA_GPIO+'h18
             , CSRA_MASK    =CSRA_GPIO+'h1C
             , CSRA_IRQ     =CSRA_GPIO+'h20
             , CSRA_EDGE    =CSRA_GPIO+'h24
             , CSRA_POL     =CSRA_GPIO+'h28;
    //--------------------------------------------------------------------------
    initial begin
       m_axi_lite_awaddr  = 'h0;
       m_axi_lite_awvalid = 'h0;
       m_axi_lite_wdata   = 'h0;
       m_axi_lite_wvalid  = 'h0;
       m_axi_lite_bready  = 'h0;
       m_axi_lite_araddr  = 'h0;
       m_axi_lite_arvalid = 'h0;
       m_axi_lite_rready  = 'h0;
       wait (axil_aresetn==1'b0);
       wait (axil_aresetn==1'b1);
       repeat (10) @ (posedge axil_aclk);
       gpio_csr();
       repeat (20) @ (posedge axil_aclk);
       $finish(2);
    end
    //--------------------------------------------------------------------------
    task gpio_csr;
        reg [31:0] dataR;
    begin
        axi_lite_read(CSRA_VERSION, dataR); $display("VERSION 0x%08X", dataR);
        axi_lite_read(CSRA_NAME   , dataR); $display("NAME    0x%08X", dataR);
        axi_lite_read(CSRA_DIR    , dataR); $display("DIR     0x%08X", dataR);
        axi_lite_read(CSRA_INPUT  , dataR); $display("INPUT   0x%08X", dataR);
        axi_lite_read(CSRA_OUTPUT , dataR); $display("OUTPUT  0x%08X", dataR);
        axi_lite_read(CSRA_MASK   , dataR); $display("MASK    0x%08X", dataR);
        axi_lite_read(CSRA_IRQ    , dataR); $display("IRQ     0x%08X", dataR);
        axi_lite_read(CSRA_EDGE   , dataR); $display("EDGE    0x%08X", dataR);
        axi_lite_read(CSRA_POL    , dataR); $display("POL     0x%08X", dataR);
    end
    endtask
    //--------------------------------------------------------------------------
endmodule
//------------------------------------------------------------------------------
// Revision History
//
// 2025.09.10: Started by Ando Ki (andoki@gmail.com)
//------------------------------------------------------------------------------
