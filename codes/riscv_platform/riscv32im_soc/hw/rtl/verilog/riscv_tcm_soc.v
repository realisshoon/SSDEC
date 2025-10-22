//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// https://github.com/ultraembedded/riscv
// riscv/top_tcm_wrapper/top_tcm_wrapper.v
//------------------------------------------------------------------------------
// axi_aclk:    clock input
// axi_aresetn: async reset, active-low, reset memory and AXI interface
// cpu_resetn:  async_reset, active-low, reset memory, AXI, and CPU core
//------------------------------------------------------------------------------
module riscv_tcm_soc
     #(parameter BOOT_VECTOR = 0
      ,parameter CORE_ID     = 0
      ,parameter TCM_MEM_BASE= 0
      ,parameter MEM_CACHE_ADDR_MIN= 0
      ,parameter MEM_CACHE_ADDR_MAX= 32'hffffffff)
(
      input  wire                      cpu_resetn
    , input  wire                      axi_aresetn
    , input  wire                      axi_aclk
);
    //--------------------------------------------------------------------------
    wire intrrupt;
    //--------------------------------------------------------------------------
    localparam AXI_WIDTH_ID   = 4 // do not change if not sure
             , AXI_WIDTH_ADDR =32 // do not change if not sure
             , AXI_WIDTH_DATA =32 // do not change if not sure
             , AXI_WIDTH_STRB =(AXI_WIDTH_DATA/8);
    //--------------------------------------------------------------------------
    wire [AXI_WIDTH_ID-1:0]   axi_bus_awid   ;
    wire [AXI_WIDTH_ADDR-1:0] axi_bus_awaddr ;
    wire [ 7:0]               axi_bus_awlen  ;
    wire [ 2:0]               axi_bus_awsize ;
    wire [ 1:0]               axi_bus_awburst;
    wire                      axi_bus_awvalid;
    wire                      axi_bus_awready;
    wire [AXI_WIDTH_DATA-1:0] axi_bus_wdata  ;
    wire [AXI_WIDTH_STRB-1:0] axi_bus_wstrb  ;
    wire                      axi_bus_wlast  ;
    wire                      axi_bus_wvalid ;
    wire                      axi_bus_wready ;
    wire [AXI_WIDTH_ID-1:0]   axi_bus_bid    ;
    wire [ 1:0]               axi_bus_bresp  ;
    wire                      axi_bus_bvalid ;
    wire                      axi_bus_bready ;
    wire [AXI_WIDTH_ID-1:0]   axi_bus_arid   ;
    wire [AXI_WIDTH_ADDR-1:0] axi_bus_araddr ;
    wire [ 7:0]               axi_bus_arlen  ;
    wire [ 2:0]               axi_bus_arsize ;
    wire [ 1:0]               axi_bus_arburst;
    wire                      axi_bus_arvalid;
    wire                      axi_bus_arready;
    wire [AXI_WIDTH_ID-1:0]   axi_bus_rid    ;
    wire [AXI_WIDTH_DATA-1:0] axi_bus_rdata  ;
    wire [ 1:0]               axi_bus_rresp  ;
    wire                      axi_bus_rlast  ;
    wire                      axi_bus_rvalid ;
    wire                      axi_bus_rready ;
    //--------------------------------------------------------------------------
    wire [AXI_WIDTH_ID-1:0]   axi_tcm_awid   ;
    wire [AXI_WIDTH_ADDR-1:0] axi_tcm_awaddr ;
    wire [ 7:0]               axi_tcm_awlen  ;
    wire [ 2:0]               axi_tcm_awsize ;
    wire [ 1:0]               axi_tcm_awburst;
    wire                      axi_tcm_awvalid;
    wire                      axi_tcm_awready;
    wire [AXI_WIDTH_DATA-1:0] axi_tcm_wdata  ;
    wire [AXI_WIDTH_STRB-1:0] axi_tcm_wstrb  ;
    wire                      axi_tcm_wlast  ;
    wire                      axi_tcm_wvalid ;
    wire                      axi_tcm_wready ;
    wire [AXI_WIDTH_ID-1:0]   axi_tcm_bid    ;
    wire [ 1:0]               axi_tcm_bresp  ;
    wire                      axi_tcm_bvalid ;
    wire                      axi_tcm_bready ;
    wire [AXI_WIDTH_ID-1:0]   axi_tcm_arid   ;
    wire [AXI_WIDTH_ADDR-1:0] axi_tcm_araddr ;
    wire [ 7:0]               axi_tcm_arlen  ;
    wire [ 2:0]               axi_tcm_arsize ;
    wire [ 1:0]               axi_tcm_arburst;
    wire                      axi_tcm_arvalid;
    wire                      axi_tcm_arready;
    wire [AXI_WIDTH_ID-1:0]   axi_tcm_rid    ;
    wire [AXI_WIDTH_DATA-1:0] axi_tcm_rdata  ;
    wire [ 1:0]               axi_tcm_rresp  ;
    wire                      axi_tcm_rlast  ;
    wire                      axi_tcm_rvalid ;
    wire                      axi_tcm_rready ;
    //--------------------------------------------------------------------------
    // intr:        active-high interrupts
    // m_axi_tcm:   AXI4 slave interface for access to 64KB TCM
    // m_axi_bus:   AXI4 master interface for CPU access to peripherals
    //--------------------------------------------------------------------------
    riscv_tcm #(.BOOT_VECTOR       ( BOOT_VECTOR        )
               ,.CORE_ID           ( CORE_ID            )
               ,.TCM_MEM_BASE      ( TCM_MEM_BASE       )
               ,.MEM_CACHE_ADDR_MIN( MEM_CACHE_ADDR_MIN )
               ,.MEM_CACHE_ADDR_MAX( MEM_CACHE_ADDR_MAX )
               ,.AXI_WIDTH_ID      ( AXI_WIDTH_ID       )
               ,.AXI_WIDTH_ADDR    ( AXI_WIDTH_ADDR     )
               ,.AXI_WIDTH_DATA    ( AXI_WIDTH_DATA     )
               ,.AXI_WIDTH_STRB    ( AXI_WIDTH_STRB     ))
    u_riscv_tcm (
         .cpu_resetn        ( cpu_resetn      )
        ,.axi_aresetn       ( axi_aresetn     )
        ,.axi_aclk          ( axi_aclk        )
        ,.m_axi_bus_awid    ( axi_bus_awid    )
        ,.m_axi_bus_awaddr  ( axi_bus_awaddr  )
        ,.m_axi_bus_awlen   ( axi_bus_awlen   )
        ,.m_axi_bus_awsize  ( axi_bus_awsize  )
        ,.m_axi_bus_awburst ( axi_bus_awburst )
        ,.m_axi_bus_awvalid ( axi_bus_awvalid )
        ,.m_axi_bus_awready ( axi_bus_awready )
        ,.m_axi_bus_wdata   ( axi_bus_wdata   )
        ,.m_axi_bus_wstrb   ( axi_bus_wstrb   )
        ,.m_axi_bus_wlast   ( axi_bus_wlast   )
        ,.m_axi_bus_wvalid  ( axi_bus_wvalid  )
        ,.m_axi_bus_wready  ( axi_bus_wready  )
        ,.m_axi_bus_bid     ( axi_bus_bid     )
        ,.m_axi_bus_bresp   ( axi_bus_bresp   )
        ,.m_axi_bus_bvalid  ( axi_bus_bvalid  )
        ,.m_axi_bus_bready  ( axi_bus_bready  )
        ,.m_axi_bus_arid    ( axi_bus_arid    )
        ,.m_axi_bus_araddr  ( axi_bus_araddr  )
        ,.m_axi_bus_arlen   ( axi_bus_arlen   )
        ,.m_axi_bus_arsize  ( axi_bus_arsize  )
        ,.m_axi_bus_arburst ( axi_bus_arburst )
        ,.m_axi_bus_arvalid ( axi_bus_arvalid )
        ,.m_axi_bus_arready ( axi_bus_arready )
        ,.m_axi_bus_rid     ( axi_bus_rid     )
        ,.m_axi_bus_rdata   ( axi_bus_rdata   )
        ,.m_axi_bus_rresp   ( axi_bus_rresp   )
        ,.m_axi_bus_rlast   ( axi_bus_rlast   )
        ,.m_axi_bus_rvalid  ( axi_bus_rvalid  )
        ,.m_axi_bus_rready  ( axi_bus_rready  )
        ,.s_axi_tcm_awid    ( axi_tcm_awid    )
        ,.s_axi_tcm_awaddr  ( axi_tcm_awaddr  )
        ,.s_axi_tcm_awlen   ( axi_tcm_awlen   )
        ,.s_axi_tcm_awsize  ( axi_tcm_awsize  )
        ,.s_axi_tcm_awburst ( axi_tcm_awburst )
        ,.s_axi_tcm_awvalid ( axi_tcm_awvalid )
        ,.s_axi_tcm_awready ( axi_tcm_awready )
        ,.s_axi_tcm_wdata   ( axi_tcm_wdata   )
        ,.s_axi_tcm_wstrb   ( axi_tcm_wstrb   )
        ,.s_axi_tcm_wlast   ( axi_tcm_wlast   )
        ,.s_axi_tcm_wvalid  ( axi_tcm_wvalid  )
        ,.s_axi_tcm_wready  ( axi_tcm_wready  )
        ,.s_axi_tcm_bid     ( axi_tcm_bid     )
        ,.s_axi_tcm_bresp   ( axi_tcm_bresp   )
        ,.s_axi_tcm_bvalid  ( axi_tcm_bvalid  )
        ,.s_axi_tcm_bready  ( axi_tcm_bready  )
        ,.s_axi_tcm_arid    ( axi_tcm_arid    )
        ,.s_axi_tcm_araddr  ( axi_tcm_araddr  )
        ,.s_axi_tcm_arlen   ( axi_tcm_arlen   )
        ,.s_axi_tcm_arsize  ( axi_tcm_arsize  )
        ,.s_axi_tcm_arburst ( axi_tcm_arburst )
        ,.s_axi_tcm_arvalid ( axi_tcm_arvalid )
        ,.s_axi_tcm_arready ( axi_tcm_arready )
        ,.s_axi_tcm_rid     ( axi_tcm_rid     )
        ,.s_axi_tcm_rdata   ( axi_tcm_rdata   )
        ,.s_axi_tcm_rresp   ( axi_tcm_rresp   )
        ,.s_axi_tcm_rlast   ( axi_tcm_rlast   )
        ,.s_axi_tcm_rvalid  ( axi_tcm_rvalid  )
        ,.s_axi_tcm_rready  ( axi_tcm_rready  )

        ,.intr              ( interrupt       )
    );
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
endmodule
