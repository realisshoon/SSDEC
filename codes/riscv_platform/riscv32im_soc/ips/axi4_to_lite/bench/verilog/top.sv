//------------------------------------------------------------------------------
//  Copyright (c) 2024 by Ando Ki.
//  All right reserved.
//  http://www.future-ds.com
//  All rights are reserved by Ando Ki.
//  Do not use in any means or/and methods without Ando Ki's permission.
//------------------------------------------------------------------------------
// top.v
//------------------------------------------------------------------------------
// VERSION: 2024.06.16.
//------------------------------------------------------------------------------
`timescale 1ns/1ps

`ifdef __ICARUS__
`define NET_DELAY
`else
`define NET_DELAY  #(0.1)
`endif

module top ;
    localparam integer AXI_WIDTH_ID  =2;
    localparam integer AXI_WIDTH_ADDR=32;
    localparam integer AXI_WIDTH_DATA=32;
    localparam integer AXI_WIDTH_STRB=(AXI_WIDTH_DATA/8);
    localparam integer MEM_SIZE_IN_BYTES=1024*1024;
    //--------------------------------------------------------------------------
    reg  axi_aresetn=1'b0; initial #111 axi_aresetn=1'b1;
    reg  axi_aclk=1'b0; always #10 axi_aclk = ~axi_aclk;
    //--------------------------------------------------------------------------
    wire [AXI_WIDTH_ID-1:0]   `NET_DELAY s_axi_awid   ;
    wire [AXI_WIDTH_ADDR-1:0] `NET_DELAY s_axi_awaddr ;
    wire [ 7:0]               `NET_DELAY s_axi_awlen  ;
    wire [ 2:0]               `NET_DELAY s_axi_awsize ;
    wire [ 1:0]               `NET_DELAY s_axi_awburst;
    wire                      `NET_DELAY s_axi_awvalid;
    wire                      `NET_DELAY s_axi_awready;
  //wire [AXI_WIDTH_ID-1:0]   `NET_DELAY s_axi_wid    ;
    wire [AXI_WIDTH_DATA-1:0] `NET_DELAY s_axi_wdata  ;
    wire [AXI_WIDTH_STRB-1:0] `NET_DELAY s_axi_wstrb  ;
    wire                      `NET_DELAY s_axi_wlast  ;
    wire                      `NET_DELAY s_axi_wvalid ;
    wire                      `NET_DELAY s_axi_wready ;
    wire [AXI_WIDTH_ID-1:0]   `NET_DELAY s_axi_bid    ;
    wire [ 1:0]               `NET_DELAY s_axi_bresp  ;
    wire                      `NET_DELAY s_axi_bvalid ;
    wire                      `NET_DELAY s_axi_bready ;
    wire [AXI_WIDTH_ID-1:0]   `NET_DELAY s_axi_arid   ;
    wire [AXI_WIDTH_ADDR-1:0] `NET_DELAY s_axi_araddr ;
    wire [ 7:0]               `NET_DELAY s_axi_arlen  ;
    wire [ 2:0]               `NET_DELAY s_axi_arsize ;
    wire [ 1:0]               `NET_DELAY s_axi_arburst;
    wire                      `NET_DELAY s_axi_arvalid;
    wire                      `NET_DELAY s_axi_arready;
    wire [AXI_WIDTH_ID-1:0]   `NET_DELAY s_axi_rid    ;
    wire [AXI_WIDTH_DATA-1:0] `NET_DELAY s_axi_rdata  ;
    wire [ 1:0]               `NET_DELAY s_axi_rresp  ;
    wire                      `NET_DELAY s_axi_rlast  ;
    wire                      `NET_DELAY s_axi_rvalid ;
    wire                      `NET_DELAY s_axi_rready ;
    //--------------------------------------------------------------------------
    wire [31:0] `NET_DELAY m_axil_awaddr ;
    wire        `NET_DELAY m_axil_awvalid;
    wire        `NET_DELAY m_axil_awready;
    wire [31:0] `NET_DELAY m_axil_wdata  ;
    wire        `NET_DELAY m_axil_wvalid ;
    wire        `NET_DELAY m_axil_wready ;
    wire [ 1:0] `NET_DELAY m_axil_bresp  ;
    wire        `NET_DELAY m_axil_bvalid ;
    wire        `NET_DELAY m_axil_bready ;
    wire [31:0] `NET_DELAY m_axil_araddr ;
    wire        `NET_DELAY m_axil_arvalid;
    wire        `NET_DELAY m_axil_arready;
    wire [31:0] `NET_DELAY m_axil_rdata  ;
    wire [ 1:0] `NET_DELAY m_axil_rresp  ;
    wire        `NET_DELAY m_axil_rvalid ;
    wire        `NET_DELAY m_axil_rready ;
    //--------------------------------------------------------------------------
    axi4_to_lite #(.AXI_WIDTH_ID  (AXI_WIDTH_ID  )
                  ,.AXI_WIDTH_ADDR(AXI_WIDTH_ADDR)
                  ,.AXI_WIDTH_DATA(AXI_WIDTH_DATA))
    u_axi4_to_lite (
          .axi_aresetn     ( axi_aresetn    )
        , .axi_aclk        ( axi_aclk       )
        , .s_axi_awid      ( s_axi_awid     )
        , .s_axi_awaddr    ( s_axi_awaddr   )
        , .s_axi_awlen     ( s_axi_awlen    )
        , .s_axi_awsize    ( s_axi_awsize   )
        , .s_axi_awburst   ( s_axi_awburst  )
        , .s_axi_awvalid   ( s_axi_awvalid  )
        , .s_axi_awready   ( s_axi_awready  )
      //, .s_axi_wid       ( s_axi_wid      )
        , .s_axi_wdata     ( s_axi_wdata    )
        , .s_axi_wstrb     ( s_axi_wstrb    )
        , .s_axi_wlast     ( s_axi_wlast    )
        , .s_axi_wvalid    ( s_axi_wvalid   )
        , .s_axi_wready    ( s_axi_wready   )
        , .s_axi_bid       ( s_axi_bid      )
        , .s_axi_bresp     ( s_axi_bresp    )
        , .s_axi_bvalid    ( s_axi_bvalid   )
        , .s_axi_bready    ( s_axi_bready   )
        , .s_axi_arid      ( s_axi_arid     )
        , .s_axi_araddr    ( s_axi_araddr   )
        , .s_axi_arlen     ( s_axi_arlen    )
        , .s_axi_arsize    ( s_axi_arsize   )
        , .s_axi_arburst   ( s_axi_arburst  )
        , .s_axi_arvalid   ( s_axi_arvalid  )
        , .s_axi_arready   ( s_axi_arready  )
        , .s_axi_rid       ( s_axi_rid      )
        , .s_axi_rdata     ( s_axi_rdata    )
        , .s_axi_rresp     ( s_axi_rresp    )
        , .s_axi_rlast     ( s_axi_rlast    )
        , .s_axi_rvalid    ( s_axi_rvalid   )
        , .s_axi_rready    ( s_axi_rready   )
        , .m_axil_awaddr   ( m_axil_awaddr  )
        , .m_axil_awvalid  ( m_axil_awvalid )
        , .m_axil_awready  ( m_axil_awready )
        , .m_axil_wdata    ( m_axil_wdata   )
        , .m_axil_wvalid   ( m_axil_wvalid  )
        , .m_axil_wready   ( m_axil_wready  )
        , .m_axil_bresp    ( m_axil_bresp   )
        , .m_axil_bvalid   ( m_axil_bvalid  )
        , .m_axil_bready   ( m_axil_bready  )
        , .m_axil_araddr   ( m_axil_araddr  )
        , .m_axil_arvalid  ( m_axil_arvalid )
        , .m_axil_arready  ( m_axil_arready )
        , .m_axil_rdata    ( m_axil_rdata   )
        , .m_axil_rresp    ( m_axil_rresp   )
        , .m_axil_rvalid   ( m_axil_rvalid  )
        , .m_axil_rready   ( m_axil_rready  )
    );
    //--------------------------------------------------------------------------
    mem_axi_lite #(.MEM_SIZE_IN_BYTES(MEM_SIZE_IN_BYTES))
    u_mem (
          .aresetn        ( axi_aresetn    )
        , .aclk           ( axi_aclk       )
        , .s_axi_awaddr   ( m_axil_awaddr  )
        , .s_axi_awvalid  ( m_axil_awvalid )
        , .s_axi_awready  ( m_axil_awready )
        , .s_axi_wdata    ( m_axil_wdata   )
        , .s_axi_wvalid   ( m_axil_wvalid  )
        , .s_axi_wready   ( m_axil_wready  )
        , .s_axi_bresp    ( m_axil_bresp   )
        , .s_axi_bvalid   ( m_axil_bvalid  )
        , .s_axi_bready   ( m_axil_bready  )
        , .s_axi_araddr   ( m_axil_araddr  )
        , .s_axi_arvalid  ( m_axil_arvalid )
        , .s_axi_arready  ( m_axil_arready )
        , .s_axi_rdata    ( m_axil_rdata   )
        , .s_axi_rresp    ( m_axil_rresp   )
        , .s_axi_rvalid   ( m_axil_rvalid  )
        , .s_axi_rready   ( m_axil_rready  )
    );
    //--------------------------------------------------------------------------
    bfm_axi #(.WIDTH_ID(AXI_WIDTH_ID)
             ,.WIDTH_AD(AXI_WIDTH_ADDR)
             ,.WIDTH_DA(AXI_WIDTH_DATA))
    u_bfm (
          .aresetn       ( axi_aresetn   )
        , .aclk          ( axi_aclk      )
        , .m_axi_awid    ( s_axi_awid    )
        , .m_axi_awaddr  ( s_axi_awaddr  )
        , .m_axi_awlen   ( s_axi_awlen   )
        , .m_axi_awlock  (               )
        , .m_axi_awsize  ( s_axi_awsize  )
        , .m_axi_awburst ( s_axi_awburst )
        , .m_axi_awvalid ( s_axi_awvalid )
        , .m_axi_awready ( s_axi_awready )
        , .m_axi_wid     (               ) //, .m_axi_wid     ( s_axi_wid     )
        , .m_axi_wdata   ( s_axi_wdata   )
        , .m_axi_wstrb   ( s_axi_wstrb   )
        , .m_axi_wlast   ( s_axi_wlast   )
        , .m_axi_wvalid  ( s_axi_wvalid  )
        , .m_axi_wready  ( s_axi_wready  )
        , .m_axi_bid     ( s_axi_bid     )
        , .m_axi_bresp   ( s_axi_bresp   )
        , .m_axi_bvalid  ( s_axi_bvalid  )
        , .m_axi_bready  ( s_axi_bready  )
        , .m_axi_arid    ( s_axi_arid    )
        , .m_axi_araddr  ( s_axi_araddr  )
        , .m_axi_arlen   ( s_axi_arlen   )
        , .m_axi_arlock  (               )
        , .m_axi_arsize  ( s_axi_arsize  )
        , .m_axi_arburst ( s_axi_arburst )
        , .m_axi_arvalid ( s_axi_arvalid )
        , .m_axi_arready ( s_axi_arready )
        , .m_axi_rid     ( s_axi_rid     )
        , .m_axi_rdata   ( s_axi_rdata   )
        , .m_axi_rresp   ( s_axi_rresp   )
        , .m_axi_rlast   ( s_axi_rlast   )
        , .m_axi_rvalid  ( s_axi_rvalid  )
        , .m_axi_rready  ( s_axi_rready  )
    );
    //--------------------------------------------------------------------------
    initial begin
       wait (axi_aresetn==1'b0);
       wait (axi_aresetn==1'b1);
       repeat (3) @ (posedge axi_aclk);
       wait(u_bfm.DONE==1'b1);
       repeat (10) @ (posedge axi_aclk);
       $finish(2);
    end
    //--------------------------------------------------------------------------
    `ifdef VCD
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0);
    end
    `endif
    //--------------------------------------------------------------------------
endmodule
//------------------------------------------------------------------------------
// Revision History
//
// 2024.06.16: Started by Ando Ki (adki@future-ds.com)
//------------------------------------------------------------------------------
