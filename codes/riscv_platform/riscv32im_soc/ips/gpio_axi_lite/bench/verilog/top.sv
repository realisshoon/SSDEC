//------------------------------------------------------------------------------
// Copyright (c) 2024 by Ando Ki.
// All right reserved.
//------------------------------------------------------------------------------
`timescale 1ns/1ps

`ifndef __ICARUS__
`define DELAY_LINE #(0.1)
`else
`define DELAY_LINE
`endif

module top ;
    localparam GPIO_WIDTH=32;
    //--------------------------------------------------------------------------
    reg  aresetn=1'b0;
    reg  aclk=1'b0; always #5 aclk <= ~aclk;
    //--------------------------------------------------------------------------
    wire [31:0] `DELAY_LINE s_axi_lite_awaddr ;
    wire        `DELAY_LINE s_axi_lite_awvalid;
    wire        `DELAY_LINE s_axi_lite_awready;
    wire [31:0] `DELAY_LINE s_axi_lite_wdata  ;
    wire        `DELAY_LINE s_axi_lite_wvalid ;
    wire        `DELAY_LINE s_axi_lite_wready ;
    wire [ 1:0] `DELAY_LINE s_axi_lite_bresp  ;
    wire        `DELAY_LINE s_axi_lite_bvalid ;
    wire        `DELAY_LINE s_axi_lite_bready ;
    wire [31:0] `DELAY_LINE s_axi_lite_araddr ;
    wire        `DELAY_LINE s_axi_lite_arvalid;
    wire        `DELAY_LINE s_axi_lite_arready;
    wire [31:0] `DELAY_LINE s_axi_lite_rdata  ;
    wire [ 1:0] `DELAY_LINE s_axi_lite_rresp  ;
    wire        `DELAY_LINE s_axi_lite_rvalid ;
    wire        `DELAY_LINE s_axi_lite_rready ;

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
          .aresetn   ( aresetn       )
        , .aclk      ( aclk          )
        , .s_axi_lite_awaddr  ( s_axi_lite_awaddr  )
        , .s_axi_lite_awvalid ( s_axi_lite_awvalid )
        , .s_axi_lite_awready ( s_axi_lite_awready )
        , .s_axi_lite_wdata   ( s_axi_lite_wdata   )
        , .s_axi_lite_wvalid  ( s_axi_lite_wvalid  )
        , .s_axi_lite_wready  ( s_axi_lite_wready  )
        , .s_axi_lite_bresp   ( s_axi_lite_bresp   )
        , .s_axi_lite_bvalid  ( s_axi_lite_bvalid  )
        , .s_axi_lite_bready  ( s_axi_lite_bready  )
        , .s_axi_lite_araddr  ( s_axi_lite_araddr  )
        , .s_axi_lite_arvalid ( s_axi_lite_arvalid )
        , .s_axi_lite_arready ( s_axi_lite_arready )
        , .s_axi_lite_rdata   ( s_axi_lite_rdata   )
        , .s_axi_lite_rresp   ( s_axi_lite_rresp   )
        , .s_axi_lite_rvalid  ( s_axi_lite_rvalid  )
        , .s_axi_lite_rready  ( s_axi_lite_rready  )
        , .gpio_in       ( gpio_in   )
        , .gpio_out      ( gpio_out  )
        , .gpio_dir      ( gpio_dir  )
        , .interrupt     ( interrupt )
    );
    //--------------------------------------------------------------------------
    tester #(.P_WIDTH(GPIO_WIDTH))
    u_tester (
          .axil_aresetn       ( aresetn   )
        , .axil_aclk          ( aclk      )
        , .m_axi_lite_awaddr  ( s_axi_lite_awaddr  )
        , .m_axi_lite_awvalid ( s_axi_lite_awvalid )
        , .m_axi_lite_awready ( s_axi_lite_awready )
        , .m_axi_lite_wdata   ( s_axi_lite_wdata   )
        , .m_axi_lite_wvalid  ( s_axi_lite_wvalid  )
        , .m_axi_lite_wready  ( s_axi_lite_wready  )
        , .m_axi_lite_bresp   ( s_axi_lite_bresp   )
        , .m_axi_lite_bvalid  ( s_axi_lite_bvalid  )
        , .m_axi_lite_bready  ( s_axi_lite_bready  )
        , .m_axi_lite_araddr  ( s_axi_lite_araddr  )
        , .m_axi_lite_arvalid ( s_axi_lite_arvalid )
        , .m_axi_lite_arready ( s_axi_lite_arready )
        , .m_axi_lite_rdata   ( s_axi_lite_rdata   )
        , .m_axi_lite_rresp   ( s_axi_lite_rresp   )
        , .m_axi_lite_rvalid  ( s_axi_lite_rvalid  )
        , .m_axi_lite_rready  ( s_axi_lite_rready  )
        , .GPIO     ( GPIO    )
        , .interrupt( interrupt )
    );
    //--------------------------------------------------------------------------
    initial begin
        aclk    = 0;
        aresetn = 0;
        repeat (20) @ (posedge aclk);
        aresetn = 1;
        repeat (10) @ (posedge aclk);
    end
    //--------------------------------------------------------------------------
    `ifdef VCD
    initial begin
        $dumpfile("wave.vcd"); //$dumplimit(1000000);
        $dumpvars(0);
    end
    `endif
endmodule
