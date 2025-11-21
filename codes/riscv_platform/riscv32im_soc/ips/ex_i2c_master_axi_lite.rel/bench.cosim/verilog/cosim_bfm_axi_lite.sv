//----------------------------------------------------------------------------
// Copyright (c) 2025 by Ando Ki.
// All rights are reserved by Ando Ki.
//----------------------------------------------------------------------------
//      +---------------+      +--------------+
//      | cosim_bfm_axi |      | axi4_to_lite |
//      |               |<====>|              |
//      |               |      |              |
//      +---------------+      +--------------+

module cosim_bfm_axi_lite
     #(parameter integer AXI_WIDTH_ADDR=32
      ,parameter integer AXI_WIDTH_DATA=32)
(
      input  wire                      aresetn
    , input  wire                      aclk

    , output wire [AXI_WIDTH_ADDR-1:0] m_axi_lite_awaddr
    , output wire                      m_axi_lite_awvalid
    , input  wire                      m_axi_lite_awready

    , output wire [AXI_WIDTH_DATA-1:0] m_axi_lite_wdata
    , output wire                      m_axi_lite_wvalid
    , input  wire                      m_axi_lite_wready

    , input  wire [1:0]                m_axi_lite_bresp
    , input  wire                      m_axi_lite_bvalid
    , output wire                      m_axi_lite_bready

    , output wire [AXI_WIDTH_ADDR-1:0] m_axi_lite_araddr
    , output wire                      m_axi_lite_arvalid
    , input  wire                      m_axi_lite_arready

    , input  wire [AXI_WIDTH_DATA-1:0] m_axi_lite_rdata
    , input  wire [1:0]                m_axi_lite_rresp
    , input  wire                      m_axi_lite_rvalid
    , output wire                      m_axi_lite_rready
);
    //--------------------------------------------------------------------------
    localparam integer AXI_WIDTH_ID=2;
    localparam integer AXI_WIDTH_STRB=(AXI_WIDTH_DATA/8);
    //--------------------------------------------------------------------------
    wire [AXI_WIDTH_ID-1:0]   bfm_awid   ;
    wire [AXI_WIDTH_ADDR-1:0] bfm_awaddr ;
    wire [ 7:0]               bfm_awlen  ;
    wire [ 2:0]               bfm_awsize ;
    wire [ 1:0]               bfm_awburst;
    wire                      bfm_awvalid;
    wire                      bfm_awready;
    wire [AXI_WIDTH_DATA-1:0] bfm_wdata  ;
    wire [AXI_WIDTH_STRB-1:0] bfm_wstrb  ;
    wire                      bfm_wlast  ;
    wire                      bfm_wvalid ;
    wire                      bfm_wready ;
    wire [AXI_WIDTH_ID-1:0]   bfm_bid    ;
    wire [ 1:0]               bfm_bresp  ;
    wire                      bfm_bvalid ;
    wire                      bfm_bready ;
    wire [AXI_WIDTH_ID-1:0]   bfm_arid   ;
    wire [AXI_WIDTH_ADDR-1:0] bfm_araddr ;
    wire [ 7:0]               bfm_arlen  ;
    wire [ 2:0]               bfm_arsize ;
    wire [ 1:0]               bfm_arburst;
    wire                      bfm_arvalid;
    wire                      bfm_arready;
    wire [AXI_WIDTH_ID-1:0]   bfm_rid    ;
    wire [AXI_WIDTH_DATA-1:0] bfm_rdata  ;
    wire [ 1:0]               bfm_rresp  ;
    wire                      bfm_rlast  ;
    wire                      bfm_rvalid ;
    wire                      bfm_rready ;
    wire [31:0] GPOUT;
    wire [31:0] GPIN =GPOUT;
    //--------------------------------------------------------------------------
    cosim_bfm_axi #(.AXI_WIDTH_ID (AXI_WIDTH_ID  ) // ID width in bits
                   ,.AXI_WIDTH_AD (AXI_WIDTH_ADDR) // address width
                   ,.AXI_WIDTH_DA (AXI_WIDTH_DATA) // data width
                   ,.COSIM_CHAN_ID(0 )
                   ,.COSIM_VERBOSE(0 ))
    u_bfm_axi(
          .ARESETn   ( aresetn     )
        , .ACLK      ( aclk        )
        , .M_AWID    ( bfm_awid    )
        , .M_AWADDR  ( bfm_awaddr  )
        , .M_AWLEN   ( bfm_awlen   )
        , .M_AWLOCK  (             )
        , .M_AWSIZE  ( bfm_awsize  )
        , .M_AWBURST ( bfm_awburst )
        , .M_AWVALID ( bfm_awvalid )
        , .M_AWREADY ( bfm_awready )
        , .M_WDATA   ( bfm_wdata   )
        , .M_WSTRB   ( bfm_wstrb   )
        , .M_WLAST   ( bfm_wlast   )
        , .M_WVALID  ( bfm_wvalid  )
        , .M_WREADY  ( bfm_wready  )
        , .M_BID     ( bfm_bid     )
        , .M_BRESP   ( bfm_bresp   )
        , .M_BVALID  ( bfm_bvalid  )
        , .M_BREADY  ( bfm_bready  )
        , .M_ARID    ( bfm_arid    )
        , .M_ARADDR  ( bfm_araddr  )
        , .M_ARLEN   ( bfm_arlen   )
        , .M_ARLOCK  (             )
        , .M_ARSIZE  ( bfm_arsize  )
        , .M_ARBURST ( bfm_arburst )
        , .M_ARVALID ( bfm_arvalid )
        , .M_ARREADY ( bfm_arready )
        , .M_RID     ( bfm_rid     )
        , .M_RDATA   ( bfm_rdata   )
        , .M_RRESP   ( bfm_rresp   )
        , .M_RLAST   ( bfm_rlast   )
        , .M_RVALID  ( bfm_rvalid  )
        , .M_RREADY  ( bfm_rready  )
        , .IRQ       (             )
        , .GPIN      ( GPIN        )
        , .GPOUT     ( GPOUT       )
    );
    //--------------------------------------------------------------------------
    axi4_to_lite #(.AXI_WIDTH_ID  (AXI_WIDTH_ID  )
                  ,.AXI_WIDTH_ADDR(AXI_WIDTH_ADDR)
                  ,.AXI_WIDTH_DATA(AXI_WIDTH_DATA))
    u_axi4_to_lite (
          .axi_aresetn     ( aresetn       )
        , .axi_aclk        ( aclk          )
        , .s_axi_awid      ( bfm_awid      )
        , .s_axi_awaddr    ( bfm_awaddr    )
        , .s_axi_awlen     ( bfm_awlen     )
        , .s_axi_awsize    ( bfm_awsize    )
        , .s_axi_awburst   ( bfm_awburst   )
        , .s_axi_awvalid   ( bfm_awvalid   )
        , .s_axi_awready   ( bfm_awready   )
        , .s_axi_wdata     ( bfm_wdata     )
        , .s_axi_wstrb     ( bfm_wstrb     )
        , .s_axi_wlast     ( bfm_wlast     )
        , .s_axi_wvalid    ( bfm_wvalid    )
        , .s_axi_wready    ( bfm_wready    )
        , .s_axi_bid       ( bfm_bid       )
        , .s_axi_bresp     ( bfm_bresp     )
        , .s_axi_bvalid    ( bfm_bvalid    )
        , .s_axi_bready    ( bfm_bready    )
        , .s_axi_arid      ( bfm_arid      )
        , .s_axi_araddr    ( bfm_araddr    )
        , .s_axi_arlen     ( bfm_arlen     )
        , .s_axi_arsize    ( bfm_arsize    )
        , .s_axi_arburst   ( bfm_arburst   )
        , .s_axi_arvalid   ( bfm_arvalid   )
        , .s_axi_arready   ( bfm_arready   )
        , .s_axi_rid       ( bfm_rid       )
        , .s_axi_rdata     ( bfm_rdata     )
        , .s_axi_rresp     ( bfm_rresp     )
        , .s_axi_rlast     ( bfm_rlast     )
        , .s_axi_rvalid    ( bfm_rvalid    )
        , .s_axi_rready    ( bfm_rready    )
        , .axil_aresetn    ( aresetn            )
        , .axil_aclk       ( aclk               )
        , .m_axil_awaddr   ( m_axi_lite_awaddr  )
        , .m_axil_awvalid  ( m_axi_lite_awvalid )
        , .m_axil_awready  ( m_axi_lite_awready )
        , .m_axil_wdata    ( m_axi_lite_wdata   )
        , .m_axil_wvalid   ( m_axi_lite_wvalid  )
        , .m_axil_wready   ( m_axi_lite_wready  )
        , .m_axil_bresp    ( m_axi_lite_bresp   )
        , .m_axil_bvalid   ( m_axi_lite_bvalid  )
        , .m_axil_bready   ( m_axi_lite_bready  )
        , .m_axil_araddr   ( m_axi_lite_araddr  )
        , .m_axil_arvalid  ( m_axi_lite_arvalid )
        , .m_axil_arready  ( m_axi_lite_arready )
        , .m_axil_rdata    ( m_axi_lite_rdata   )
        , .m_axil_rresp    ( m_axi_lite_rresp   )
        , .m_axil_rvalid   ( m_axi_lite_rvalid  )
        , .m_axil_rready   ( m_axi_lite_rready  )
    );
endmodule
//----------------------------------------------------------------------------
// Revision history
//
// 2025.08.10: Started by Ando Ki (andoki@gmail.com)
//----------------------------------------------------------------------------
