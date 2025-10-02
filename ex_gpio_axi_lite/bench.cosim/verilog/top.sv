//----------------------------------------------------------------------------
// Copyright (c) 2025 by Ando Ki.
// All rights are reserved by Ando Ki.
//----------------------------------------------------------------------------
// top.v
//----------------------------------------------------------------------------
// |<-- SW --->|<-----------HW-------------------------->|
// +--------+     +--------+     +--------+     +--------+
// |        |     |        |     |        |     |        |
// | SW     |<...>| bfm    |     | axi4   |     | gpio   |
// |        |<...>|        |<===>| to     |<===>| axi    |
// |        |     |        |     | lite   |     | lite   |
// |        |     |        |     |        |     |        |
// +--------+     +--------+     +--------+     +--------+
//
//----------------------------------------------------------------------------
`timescale 1ns/1ps

`ifndef __ICARUS__
`define DELAY_LINE #(0.1)
`else
`define DELAY_LINE
`endif

//----------------------------------------------------------------------------
module top;
    localparam GPIO_WIDTH=32;
    //--------------------------------------------------------------------------
    // Oscillators
    localparam real CLOCK_FREQ =10_000_000.0;
    localparam real CLOCK_HALF =(1_000_000_000.0/CLOCK_FREQ/2.0);
    //--------------------------------------------------------------------------
    reg  axil_aclk=1'b0; always #(CLOCK_HALF) axil_aclk <= ~axil_aclk;
    reg  axil_aresetn=1'b0; initial begin #111; axil_aresetn=1'b1; end
    //------------------------------------------------------------------------
    wire [31:0] axi_lite_awaddr ;
    wire        axi_lite_awvalid;
    wire        axi_lite_awready;
    wire [31:0] axi_lite_wdata  ;
    wire        axi_lite_wvalid ;
    wire        axi_lite_wready ;
    wire [ 1:0] axi_lite_bresp  ;
    wire        axi_lite_bvalid ;
    wire        axi_lite_bready ;
    wire [31:0] axi_lite_araddr ;
    wire        axi_lite_arvalid;
    wire        axi_lite_arready;
    wire [31:0] axi_lite_rdata  ;
    wire [ 1:0] axi_lite_rresp  ;
    wire        axi_lite_rvalid ;
    wire        axi_lite_rready ;
    //--------------------------------------------------------------------------
    cosim_bfm_axi_lite
    u_bfm_axi_lite (
          .aresetn            ( axil_aresetn     )
        , .aclk               ( axil_aclk        )
        , .m_axi_lite_awaddr  ( axi_lite_awaddr  )
        , .m_axi_lite_awvalid ( axi_lite_awvalid )
        , .m_axi_lite_awready ( axi_lite_awready )
        , .m_axi_lite_wdata   ( axi_lite_wdata   )
        , .m_axi_lite_wvalid  ( axi_lite_wvalid  )
        , .m_axi_lite_wready  ( axi_lite_wready  )
        , .m_axi_lite_bresp   ( axi_lite_bresp   )
        , .m_axi_lite_bvalid  ( axi_lite_bvalid  )
        , .m_axi_lite_bready  ( axi_lite_bready  )
        , .m_axi_lite_araddr  ( axi_lite_araddr  )
        , .m_axi_lite_arvalid ( axi_lite_arvalid )
        , .m_axi_lite_arready ( axi_lite_arready )
        , .m_axi_lite_rdata   ( axi_lite_rdata   )
        , .m_axi_lite_rresp   ( axi_lite_rresp   )
        , .m_axi_lite_rvalid  ( axi_lite_rvalid  )
        , .m_axi_lite_rready  ( axi_lite_rready  )
    );
    //--------------------------------------------------------------------------
    wire [GPIO_WIDTH-1:0] `DELAY_LINE  gpio_in;
    wire [GPIO_WIDTH-1:0] `DELAY_LINE  gpio_out;
    wire [GPIO_WIDTH-1:0] `DELAY_LINE  gpio_dir;// 0 for output, 1 for input
    wire                  `DELAY_LINE  interrupt;
    wire [GPIO_WIDTH-1:0] `DELAY_LINE  GPIO; // didirectional signal line
    //--------------------------------------------------------------------------
    pullup u_pu[GPIO_WIDTH-1:0](GPIO);
    assign gpio_in = GPIO;
    generate
    genvar idx;
    for (idx=0; idx<GPIO_WIDTH; idx=idx+1) begin: DIX
         assign GPIO[idx] = (gpio_dir[idx]) ? 1'bZ : gpio_out[idx];
    end
    endgenerate
    //--------------------------------------------------------------------------
    gpio_axi_lite #(.P_WIDTH(GPIO_WIDTH))
    u_gpio (
          .aresetn            ( axil_aresetn     )
        , .aclk               ( axil_aclk        )
        , .s_axi_lite_awaddr  ( axi_lite_awaddr  )
        , .s_axi_lite_awvalid ( axi_lite_awvalid )
        , .s_axi_lite_awready ( axi_lite_awready )
        , .s_axi_lite_wdata   ( axi_lite_wdata   )
        , .s_axi_lite_wvalid  ( axi_lite_wvalid  )
        , .s_axi_lite_wready  ( axi_lite_wready  )
        , .s_axi_lite_bresp   ( axi_lite_bresp   )
        , .s_axi_lite_bvalid  ( axi_lite_bvalid  )
        , .s_axi_lite_bready  ( axi_lite_bready  )
        , .s_axi_lite_araddr  ( axi_lite_araddr  )
        , .s_axi_lite_arvalid ( axi_lite_arvalid )
        , .s_axi_lite_arready ( axi_lite_arready )
        , .s_axi_lite_rdata   ( axi_lite_rdata   )
        , .s_axi_lite_rresp   ( axi_lite_rresp   )
        , .s_axi_lite_rvalid  ( axi_lite_rvalid  )
        , .s_axi_lite_rready  ( axi_lite_rready  )
        , .gpio_in       ( gpio_in   )
        , .gpio_out      ( gpio_out  )
        , .gpio_dir      ( gpio_dir  )
        , .interrupt     ( interrupt )
    );
    //--------------------------------------------------------------------------
    initial begin
       $display("VCD dump enable.");
       $dumpfile("wave.vcd");
       $dumpvars(0);
    end
    //------------------------------------------------------------------------
endmodule

//----------------------------------------------------------------------------
// Revision history
//
// 2025.09.10: Started by Ando Ki (andoki@gmail.com)
//----------------------------------------------------------------------------
