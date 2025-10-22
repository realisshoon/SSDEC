//------------------------------------------------------------------------------
// Copyright (c) 2024 by Ando Ki.
//------------------------------------------------------------------------------
// tester.v
//------------------------------------------------------------------------------
`timescale 1ns/1ps

module tester
     #(parameter CLK_FREQ=100_000_000)
(
      input  wire        aresetn
    , input  wire        aclk
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
    , input  wire        interrupt
);
    //--------------------------------------------------------------------------
    `include "tasks_axi_lite.sv"
    `include "tasks_timer_axi_lite.sv"
    //--------------------------------------------------------------------------
    initial begin
        m_axi_lite_awaddr  <=  'h0;
        m_axi_lite_awvalid <= 1'b0;
        m_axi_lite_wdata   <=  'h0;
        m_axi_lite_wvalid  <= 1'b0;
        m_axi_lite_bready  <= 1'b0;
        m_axi_lite_araddr  <=  'h0;
        m_axi_lite_arvalid <= 1'b0;
        m_axi_lite_rready  <= 1'b0;
        wait (aresetn==1'b0);
        wait (aresetn==1'b1);
        repeat (10) @ (posedge aclk);
        timer_csr();
        repeat (20) @ (posedge aclk);
        $finish(2);
    end
    //--------------------------------------------------------------------------
endmodule
//------------------------------------------------------------------------------
// Revision History
//
// 2024.08.10: Started by Ando Ki (andoki@gmail.com)
//------------------------------------------------------------------------------
