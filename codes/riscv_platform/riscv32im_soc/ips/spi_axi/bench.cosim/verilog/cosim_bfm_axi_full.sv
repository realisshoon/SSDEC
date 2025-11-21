//------------------------------------------------------------------------------
// Copyright (c) 2025 by Ando Ki.
// All rights reserved by Ando Ki.
//------------------------------------------------------------------------------
// cosim_bfm_axi_full.sv - AXI4-Full BFM 래퍼
//------------------------------------------------------------------------------
// SPI AXI Controller를 BFM을 통해 테스트하기 위한 래퍼 모듈
//------------------------------------------------------------------------------

`define AMBA_AXI4
`define AMBA_AXI_CACHE
`define AMBA_AXI_PROT

module cosim_bfm_axi_full
     #(parameter integer AXI_WIDTH_ID  = 4   // ID width in bits
      ,parameter integer AXI_WIDTH_ADDR=32   // address width
      ,parameter integer AXI_WIDTH_DATA=32   // data width
      ,parameter integer COSIM_CHAN_ID = 0
      ,parameter integer COSIM_VERBOSE = 0)
(
      input  wire                      aresetn
    , input  wire                      aclk

    // AXI4-Full Master Interface
    , output wire [AXI_WIDTH_ID-1:0]   m_axi_awid
    , output wire [AXI_WIDTH_ADDR-1:0] m_axi_awaddr
    , output wire [ 7:0]               m_axi_awlen
    , output wire                      m_axi_awlock
    , output wire [ 2:0]               m_axi_awsize
    , output wire [ 1:0]               m_axi_awburst
    , output wire [ 3:0]               m_axi_awcache
    , output wire [ 2:0]               m_axi_awprot
    , output wire                      m_axi_awvalid
    , input  wire                      m_axi_awready

    , output wire [AXI_WIDTH_DATA-1:0] m_axi_wdata
    , output wire [(AXI_WIDTH_DATA/8)-1:0] m_axi_wstrb
    , output wire                      m_axi_wlast
    , output wire                      m_axi_wvalid
    , input  wire                      m_axi_wready

    , input  wire [AXI_WIDTH_ID-1:0]   m_axi_bid
    , input  wire [ 1:0]               m_axi_bresp
    , input  wire                      m_axi_bvalid
    , output wire                      m_axi_bready

    , output wire [AXI_WIDTH_ID-1:0]   m_axi_arid
    , output wire [AXI_WIDTH_ADDR-1:0] m_axi_araddr
    , output wire [ 7:0]               m_axi_arlen
    , output wire                      m_axi_arlock
    , output wire [ 2:0]               m_axi_arsize
    , output wire [ 1:0]               m_axi_arburst
    , output wire [ 3:0]               m_axi_arcache
    , output wire [ 2:0]               m_axi_arprot
    , output wire                      m_axi_arvalid
    , input  wire                      m_axi_arready

    , input  wire [AXI_WIDTH_ID-1:0]   m_axi_rid
    , input  wire [AXI_WIDTH_DATA-1:0] m_axi_rdata
    , input  wire [ 1:0]               m_axi_rresp
    , input  wire                      m_axi_rlast
    , input  wire                      m_axi_rvalid
    , output wire                      m_axi_rready

    // General Purpose I/O (for BFM)
    , output wire [31:0]               gpout
    , input  wire [31:0]               gpin
    , input  wire                      irq
);
    //--------------------------------------------------------------------------
    // BFM Core Instance
    //--------------------------------------------------------------------------
    cosim_bfm_axi #(.AXI_WIDTH_ID (AXI_WIDTH_ID  )
                   ,.AXI_WIDTH_AD (AXI_WIDTH_ADDR)
                   ,.AXI_WIDTH_DA (AXI_WIDTH_DATA)
                   ,.COSIM_CHAN_ID(COSIM_CHAN_ID )
                   ,.COSIM_VERBOSE(COSIM_VERBOSE ))
    u_bfm_axi(
          .ARESETn   ( aresetn          )
        , .ACLK      ( aclk             )
        , .M_AWID    ( m_axi_awid       )
        , .M_AWADDR  ( m_axi_awaddr     )
        , .M_AWLEN   ( m_axi_awlen      )
        , .M_AWLOCK  ( m_axi_awlock     )
        , .M_AWSIZE  ( m_axi_awsize     )
        , .M_AWBURST ( m_axi_awburst    )
        , .M_AWCACHE ( m_axi_awcache    )
        , .M_AWPROT  ( m_axi_awprot     )
        , .M_AWVALID ( m_axi_awvalid    )
        , .M_AWREADY ( m_axi_awready    )
        , .M_WDATA   ( m_axi_wdata      )
        , .M_WSTRB   ( m_axi_wstrb      )
        , .M_WLAST   ( m_axi_wlast      )
        , .M_WVALID  ( m_axi_wvalid     )
        , .M_WREADY  ( m_axi_wready     )
        , .M_BID     ( m_axi_bid        )
        , .M_BRESP   ( m_axi_bresp      )
        , .M_BVALID  ( m_axi_bvalid     )
        , .M_BREADY  ( m_axi_bready     )
        , .M_ARID    ( m_axi_arid       )
        , .M_ARADDR  ( m_axi_araddr     )
        , .M_ARLEN   ( m_axi_arlen      )
        , .M_ARLOCK  ( m_axi_arlock     )
        , .M_ARSIZE  ( m_axi_arsize     )
        , .M_ARBURST ( m_axi_arburst    )
        , .M_ARCACHE ( m_axi_arcache    )
        , .M_ARPROT  ( m_axi_arprot     )
        , .M_ARVALID ( m_axi_arvalid    )
        , .M_ARREADY ( m_axi_arready    )
        , .M_RID     ( m_axi_rid        )
        , .M_RDATA   ( m_axi_rdata      )
        , .M_RRESP   ( m_axi_rresp      )
        , .M_RLAST   ( m_axi_rlast      )
        , .M_RVALID  ( m_axi_rvalid     )
        , .M_RREADY  ( m_axi_rready     )
        , .IRQ       ( irq              )
        , .GPIN      ( gpin             )
        , .GPOUT     ( gpout            )
    );
endmodule

//------------------------------------------------------------------------------
// Note: cosim_bfm_axi_core.v는 이미 xsim.prj에서 포함됨
// DPI/VPI 버전은 cosim_bfm_library/lib_bfm/verilog에 있음:
// - cosim_bfm_axi_dpi.sv (DPI for Xilinx xsim)
// - cosim_bfm_axi_vpi.v (VPI for Icarus Verilog)
//------------------------------------------------------------------------------

