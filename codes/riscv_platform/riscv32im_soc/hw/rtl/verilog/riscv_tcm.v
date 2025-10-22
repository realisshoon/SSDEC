//------------------------------------------------------------------------------
// axi_aclk:    clock input
// axi_aresetn: async reset, active-low, reset memory and AXI interface
// cpu_resetn:  async_reset, active-low, reset memory, AXI, and CPU core
// intr:        active-high interrupts
// m_axi_tcm:   AXI4 slave interface for access to 64KB TCM
// m_axi_bus:   AXI4 master interface for CPU access to peripherals
//------------------------------------------------------------------------------
// https://github.com/ultraembedded/riscv
// riscv/top_tcm_wrapper/top_tcm_wrapper.v
//------------------------------------------------------------------------------
//     +------+        +------+
//     |      | ifetch | tcm  |
//     |      |<=======| mem  |<===> s_axi_tcm
//     |      |        |      |
//     |      |        +------+
//     | riscv|           ^
//     | core |           | dport_tcm
//     |      |           V 
//     |      |        +------+            +------+
//     |      | dport  | dport| dport_axi  | dport|
//     |      |<======>| mux  |<==========>| axi  |<===> m_axi_bus 
//     |      |        |      |            |      |
//     +------+        +------+            +------+
//        |
//        +------ intr
//------------------------------------------------------------------------------
module riscv_tcm
     #(parameter BOOT_VECTOR      = 0
      ,parameter CORE_ID          = 0
      ,parameter TCM_MEM_BASE     = 0
      ,parameter MEM_CACHE_ADDR_MIN = 0
      ,parameter MEM_CACHE_ADDR_MAX = 32'hffffffff
      ,parameter AXI_WIDTH_ID   = 4 // do not change if not sure
      ,parameter AXI_WIDTH_ADDR =32 // do not change if not sure
      ,parameter AXI_WIDTH_DATA =32 // do not change if not sure
      ,parameter AXI_WIDTH_STRB =(AXI_WIDTH_DATA/8))
(
    (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 cpu_resetn  RST"  *) input  wire                      cpu_resetn,
    (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 axi_aresetn RST"  *) input  wire                      axi_aresetn,
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF m_axi_bus:m_axi_tcm, ASSOCIATED_RESET axi_aresetn" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 axi_aclk CLK"     *) input  wire                      axi_aclk,
`ifndef __ICARUS__
    (* X_INTERFACE_PARAMETER = "CLK_DOMAIN axi_aclk,RUSER_WIDTH 0,WUSER_WIDTH 0,ARUSER_WIDTH 0,AWUSER_WIDTH 0,\
                                HAS_CACHE 0,HAS_LOCK 0,HAS_PROT 0,HAS_QOS 0,HAS_REGION 0" *)
`endif
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_bus AWID"    *) output wire [AXI_WIDTH_ID-1:0]   m_axi_bus_awid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_bus AWADDR"  *) output wire [AXI_WIDTH_ADDR-1:0] m_axi_bus_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_bus AWLEN"   *) output wire [ 7:0]               m_axi_bus_awlen,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_bus AWSIZE"  *) output wire [ 2:0]               m_axi_bus_awsize,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_bus AWBURST" *) output wire [ 1:0]               m_axi_bus_awburst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_bus AWVALID" *) output wire                      m_axi_bus_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_bus AWREADY" *) input  wire                      m_axi_bus_awready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_bus WDATA"   *) output wire [AXI_WIDTH_DATA-1:0] m_axi_bus_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_bus WSTRB"   *) output wire [AXI_WIDTH_STRB-1:0] m_axi_bus_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_bus WLAST"   *) output wire                      m_axi_bus_wlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_bus WVALID"  *) output wire                      m_axi_bus_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_bus WREADY"  *) input  wire                      m_axi_bus_wready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_bus BID"     *) input  wire [AXI_WIDTH_ID-1:0]   m_axi_bus_bid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_bus BRESP"   *) input  wire [ 1:0]               m_axi_bus_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_bus BVALID"  *) input  wire                      m_axi_bus_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_bus BREADY"  *) output wire                      m_axi_bus_bready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_bus ARID"    *) output wire [AXI_WIDTH_ID-1:0]   m_axi_bus_arid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_bus ARADDR"  *) output wire [AXI_WIDTH_ADDR-1:0] m_axi_bus_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_bus ARLEN"   *) output wire [ 7:0]               m_axi_bus_arlen,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_bus ARSIZE"  *) output wire [ 2:0]               m_axi_bus_arsize,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_bus ARBURST" *) output wire [ 1:0]               m_axi_bus_arburst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_bus ARVALID" *) output wire                      m_axi_bus_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_bus ARREADY" *) input  wire                      m_axi_bus_arready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_bus RID"     *) input  wire [AXI_WIDTH_ID-1:0]   m_axi_bus_rid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_bus RDATA"   *) input  wire [AXI_WIDTH_DATA-1:0] m_axi_bus_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_bus RRESP"   *) input  wire [ 1:0]               m_axi_bus_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_bus RLAST"   *) input  wire                      m_axi_bus_rlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_bus RVALID"  *) input  wire                      m_axi_bus_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_bus RREADY"  *) output wire                      m_axi_bus_rready,
`ifndef __ICARUS__
    (* X_INTERFACE_PARAMETER = "CLK_DOMAIN axi_aclk,RUSER_WIDTH 0,WUSER_WIDTH 0,ARUSER_WIDTH 0,AWUSER_WIDTH 0,\
                                HAS_CACHE 0,HAS_LOCK 0,HAS_PROT 0,HAS_QOS 0,HAS_REGION 0" *)
`endif
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_tcm AWID"    *) input  wire [AXI_WIDTH_ID-1:0]   s_axi_tcm_awid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_tcm AWADDR"  *) input  wire [AXI_WIDTH_ADDR-1:0] s_axi_tcm_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_tcm AWLEN"   *) input  wire [ 7:0]               s_axi_tcm_awlen,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_tcm AWSIZE"  *) input  wire [ 2:0]               s_axi_tcm_awsize,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_tcm AWBURST" *) input  wire [ 1:0]               s_axi_tcm_awburst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_tcm AWVALID" *) input  wire                      s_axi_tcm_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_tcm AWREADY" *) output wire                      s_axi_tcm_awready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_tcm WDATA"   *) input  wire [AXI_WIDTH_DATA-1:0] s_axi_tcm_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_tcm WSTRB"   *) input  wire [AXI_WIDTH_STRB-1:0] s_axi_tcm_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_tcm WLAST"   *) input  wire                      s_axi_tcm_wlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_tcm WVALID"  *) input  wire                      s_axi_tcm_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_tcm WREADY"  *) output wire                      s_axi_tcm_wready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_tcm BID"     *) output wire [AXI_WIDTH_ID-1:0]   s_axi_tcm_bid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_tcm BRESP"   *) output wire [ 1:0]               s_axi_tcm_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_tcm BVALID"  *) output wire                      s_axi_tcm_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_tcm BREADY"  *) input  wire                      s_axi_tcm_bready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_tcm ARID"    *) input  wire [AXI_WIDTH_ID-1:0]   s_axi_tcm_arid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_tcm ARADDR"  *) input  wire [AXI_WIDTH_ADDR-1:0] s_axi_tcm_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_tcm ARLEN"   *) input  wire [ 7:0]               s_axi_tcm_arlen,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_tcm ARSIZE"  *) input  wire [ 2:0]               s_axi_tcm_arsize,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_tcm ARBURST" *) input  wire [ 1:0]               s_axi_tcm_arburst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_tcm ARVALID" *) input  wire                      s_axi_tcm_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_tcm ARREADY" *) output wire                      s_axi_tcm_arready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_tcm RID"     *) output wire [AXI_WIDTH_ID-1:0]   s_axi_tcm_rid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_tcm RDATA"   *) output wire [AXI_WIDTH_DATA-1:0] s_axi_tcm_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_tcm RRESP"   *) output wire [ 1:0]               s_axi_tcm_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_tcm RLAST"   *) output wire                      s_axi_tcm_rlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_tcm RVALID"  *) output wire                      s_axi_tcm_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_tcm RREADY"  *) input  wire                      s_axi_tcm_rready,

    input wire  intr
);
    //--------------------------------------------------------------------------
    wire  [31:0]  cpu_id_w     =CORE_ID;
    wire  [31:0]  boot_vector_w=BOOT_VECTOR;
    //--------------------------------------------------------------------------
    wire  [31:0]  ifetch_pc_w;
    wire          ifetch_rd_w;
    wire          ifetch_accept_w;
    wire          ifetch_error_w;
    wire          ifetch_flush_w;
    wire          ifetch_invalidate_w;
    wire          ifetch_valid_w;
    wire  [31:0]  ifetch_inst_w;

    wire          dport_cacheable_w;
    wire  [10:0]  dport_resp_tag_w;
    wire  [31:0]  dport_data_rd_w;
    wire          dport_ack_w;
    wire  [31:0]  dport_data_wr_w;
    wire          dport_invalidate_w;
    wire          dport_writeback_w;
    wire          dport_rd_w;
    wire  [31:0]  dport_addr_w;
    wire          dport_error_w;
    wire  [ 3:0]  dport_wr_w;
    wire  [10:0]  dport_req_tag_w;
    wire  [ 3:0]  dport_axi_wr_w;
    wire          dport_accept_w;
    wire          dport_flush_w;

    wire  [31:0]  dport_tcm_data_rd_w;
    wire          dport_tcm_cacheable_w;
    wire  [ 3:0]  dport_tcm_wr_w;
    wire          dport_tcm_flush_w;
    wire          dport_tcm_invalidate_w;
    wire  [10:0]  dport_tcm_req_tag_w;
    wire  [31:0]  dport_tcm_addr_w;
    wire          dport_tcm_ack_w;
    wire          dport_tcm_rd_w;
    wire  [10:0]  dport_tcm_resp_tag_w;
    wire  [31:0]  dport_tcm_data_wr_w;
    wire          dport_tcm_writeback_w;
    wire          dport_tcm_error_w;

    wire  [31:0]  dport_axi_addr_w;
    wire          dport_tcm_accept_w;
    wire          dport_axi_accept_w;
    wire  [10:0]  dport_axi_resp_tag_w;
    wire  [10:0]  dport_axi_req_tag_w;
    wire          dport_axi_error_w;
    wire          dport_axi_ack_w;
    wire          dport_axi_rd_w;
    wire  [31:0]  dport_axi_data_rd_w;
    wire          dport_axi_invalidate_w;
    wire          dport_axi_writeback_w;
    wire  [31:0]  dport_axi_data_wr_w;
    wire          dport_axi_cacheable_w;
    wire          dport_axi_flush_w;
    //--------------------------------------------------------------------------
    riscv_core #(.MEM_CACHE_ADDR_MIN(MEM_CACHE_ADDR_MIN)
                ,.MEM_CACHE_ADDR_MAX(MEM_CACHE_ADDR_MAX))
    u_core (
         .clk_i              ( axi_aclk            )
        ,.rst_i              (~cpu_resetn          )

        ,.mem_i_rd_o         ( ifetch_rd_w         )
        ,.mem_i_pc_o         ( ifetch_pc_w         )
        ,.mem_i_accept_i     ( ifetch_accept_w     )

        ,.mem_i_valid_i      ( ifetch_valid_w      )
        ,.mem_i_inst_i       ( ifetch_inst_w       )
        ,.mem_i_error_i      ( ifetch_error_w      )

        ,.mem_i_invalidate_o ( ifetch_invalidate_w )
        ,.mem_i_flush_o      ( ifetch_flush_w      )

        ,.mem_d_rd_o         ( dport_rd_w          )
        ,.mem_d_wr_o         ( dport_wr_w          )
        ,.mem_d_addr_o       ( dport_addr_w        )
        ,.mem_d_data_wr_o    ( dport_data_wr_w     )
        ,.mem_d_req_tag_o    ( dport_req_tag_w     )
        ,.mem_d_accept_i     ( dport_accept_w      )

        ,.mem_d_ack_i        ( dport_ack_w         )
        ,.mem_d_data_rd_i    ( dport_data_rd_w     )
        ,.mem_d_resp_tag_i   ( dport_resp_tag_w    )
        ,.mem_d_error_i      ( dport_error_w       )

        ,.mem_d_cacheable_o  ( dport_cacheable_w   )
        ,.mem_d_invalidate_o ( dport_invalidate_w  )
        ,.mem_d_writeback_o  ( dport_writeback_w   )
        ,.mem_d_flush_o      ( dport_flush_w       )

        ,.intr_i             ( intr                )
        ,.reset_vector_i     ( boot_vector_w       )
        ,.cpu_id_i           ( cpu_id_w            )
    );
    //--------------------------------------------------------------------------
    tcm_mem
    u_tcm (
         .clk_i              ( axi_aclk               ) 
        ,.rst_i              (~axi_aresetn            )

        ,.mem_i_rd_i         ( ifetch_rd_w            ) // risc_core
        ,.mem_i_pc_i         ( ifetch_pc_w            )
        ,.mem_i_accept_o     ( ifetch_accept_w        )

        ,.mem_i_valid_o      ( ifetch_valid_w         )
        ,.mem_i_inst_o       ( ifetch_inst_w          )
        ,.mem_i_error_o      ( ifetch_error_w         )

        ,.mem_i_invalidate_i ( ifetch_invalidate_w    )
        ,.mem_i_flush_i      ( ifetch_flush_w         )

        ,.mem_d_rd_i         ( dport_tcm_rd_w         ) // dport_mux
        ,.mem_d_wr_i         ( dport_tcm_wr_w         )
        ,.mem_d_addr_i       ( dport_tcm_addr_w       )
        ,.mem_d_data_wr_i    ( dport_tcm_data_wr_w    )
        ,.mem_d_req_tag_i    ( dport_tcm_req_tag_w    )
        ,.mem_d_accept_o     ( dport_tcm_accept_w     )

        ,.mem_d_ack_o        ( dport_tcm_ack_w        )
        ,.mem_d_data_rd_o    ( dport_tcm_data_rd_w    )
        ,.mem_d_resp_tag_o   ( dport_tcm_resp_tag_w   )
        ,.mem_d_error_o      ( dport_tcm_error_w      )

        ,.mem_d_cacheable_i  ( dport_tcm_cacheable_w  )
        ,.mem_d_invalidate_i ( dport_tcm_invalidate_w )
        ,.mem_d_writeback_i  ( dport_tcm_writeback_w  )
        ,.mem_d_flush_i      ( dport_tcm_flush_w      )

        ,.axi_awid_i         ( s_axi_tcm_awid    ) // bus
        ,.axi_awaddr_i       ( s_axi_tcm_awaddr  )
        ,.axi_awlen_i        ( s_axi_tcm_awlen   )
        ,.axi_awburst_i      ( s_axi_tcm_awburst )
        ,.axi_awvalid_i      ( s_axi_tcm_awvalid )
        ,.axi_awready_o      ( s_axi_tcm_awready )
        ,.axi_wdata_i        ( s_axi_tcm_wdata   )
        ,.axi_wstrb_i        ( s_axi_tcm_wstrb   )
        ,.axi_wlast_i        ( s_axi_tcm_wlast   )
        ,.axi_wvalid_i       ( s_axi_tcm_wvalid  )
        ,.axi_wready_o       ( s_axi_tcm_wready  )
        ,.axi_bid_o          ( s_axi_tcm_bid     )
        ,.axi_bresp_o        ( s_axi_tcm_bresp   )
        ,.axi_bvalid_o       ( s_axi_tcm_bvalid  )
        ,.axi_bready_i       ( s_axi_tcm_bready  )
        ,.axi_arid_i         ( s_axi_tcm_arid    )
        ,.axi_araddr_i       ( s_axi_tcm_araddr  )
        ,.axi_arlen_i        ( s_axi_tcm_arlen   )
        ,.axi_arburst_i      ( s_axi_tcm_arburst )
        ,.axi_arvalid_i      ( s_axi_tcm_arvalid )
        ,.axi_arready_o      ( s_axi_tcm_arready )
        ,.axi_rid_o          ( s_axi_tcm_rid     )
        ,.axi_rdata_o        ( s_axi_tcm_rdata   )
        ,.axi_rresp_o        ( s_axi_tcm_rresp   )
        ,.axi_rlast_o        ( s_axi_tcm_rlast   )
        ,.axi_rvalid_o       ( s_axi_tcm_rvalid  )
        ,.axi_rready_i       ( s_axi_tcm_rready  )
    );
    //--------------------------------------------------------------------------
    dport_mux #(.TCM_MEM_BASE(TCM_MEM_BASE))
    u_dmux (
         .clk_i                ( axi_aclk               )
        ,.rst_i                (~axi_aresentn           )

        ,.mem_addr_i           ( dport_addr_w           ) // dport_axi
        ,.mem_data_wr_i        ( dport_data_wr_w        )
        ,.mem_rd_i             ( dport_rd_w             )
        ,.mem_wr_i             ( dport_wr_w             )
        ,.mem_cacheable_i      ( dport_cacheable_w      )
        ,.mem_req_tag_i        ( dport_req_tag_w        )
        ,.mem_invalidate_i     ( dport_invalidate_w     )
        ,.mem_writeback_i      ( dport_writeback_w      )
        ,.mem_flush_i          ( dport_flush_w          )
        ,.mem_data_rd_o        ( dport_data_rd_w        )
        ,.mem_accept_o         ( dport_accept_w         )
        ,.mem_ack_o            ( dport_ack_w            )
        ,.mem_error_o          ( dport_error_w          )
        ,.mem_resp_tag_o       ( dport_resp_tag_w       )

        ,.mem_tcm_rd_o         ( dport_tcm_rd_w         ) // tcm_mem
        ,.mem_tcm_wr_o         ( dport_tcm_wr_w         )
        ,.mem_tcm_addr_o       ( dport_tcm_addr_w       )
        ,.mem_tcm_data_wr_o    ( dport_tcm_data_wr_w    )
        ,.mem_tcm_req_tag_o    ( dport_tcm_req_tag_w    )
        ,.mem_tcm_accept_i     ( dport_tcm_accept_w     )

        ,.mem_tcm_ack_i        ( dport_tcm_ack_w        )
        ,.mem_tcm_data_rd_i    ( dport_tcm_data_rd_w    )
        ,.mem_tcm_resp_tag_i   ( dport_tcm_resp_tag_w   )
        ,.mem_tcm_error_i      ( dport_tcm_error_w      )

        ,.mem_tcm_cacheable_o  ( dport_tcm_cacheable_w  )
        ,.mem_tcm_invalidate_o ( dport_tcm_invalidate_w )
        ,.mem_tcm_writeback_o  ( dport_tcm_writeback_w  )
        ,.mem_tcm_flush_o      ( dport_tcm_flush_w      )

        ,.mem_ext_rd_o         ( dport_axi_rd_w         ) // dport_axi
        ,.mem_ext_wr_o         ( dport_axi_wr_w         )
        ,.mem_ext_addr_o       ( dport_axi_addr_w       )
        ,.mem_ext_data_wr_o    ( dport_axi_data_wr_w    )
        ,.mem_ext_req_tag_o    ( dport_axi_req_tag_w    )
        ,.mem_ext_accept_i     ( dport_axi_accept_w     )

        ,.mem_ext_ack_i        ( dport_axi_ack_w        )
        ,.mem_ext_data_rd_i    ( dport_axi_data_rd_w    )
        ,.mem_ext_resp_tag_i   ( dport_axi_resp_tag_w   )
        ,.mem_ext_error_i      ( dport_axi_error_w      )

        ,.mem_ext_cacheable_o  ( dport_axi_cacheable_w  )
        ,.mem_ext_invalidate_o ( dport_axi_invalidate_w )
        ,.mem_ext_writeback_o  ( dport_axi_writeback_w  )
        ,.mem_ext_flush_o      ( dport_axi_flush_w      )
    );
    //--------------------------------------------------------------------------
    dport_axi
    u_axi (
         .clk_i            ( axi_aclk               )
        ,.rst_i            (~axi_aresetn            )

        ,.mem_rd_i         ( dport_axi_rd_w         ) // dport_mux
        ,.mem_wr_i         ( dport_axi_wr_w         )
        ,.mem_addr_i       ( dport_axi_addr_w       )
        ,.mem_data_wr_i    ( dport_axi_data_wr_w    )
        ,.mem_req_tag_i    ( dport_axi_req_tag_w    )
        ,.mem_accept_o     ( dport_axi_accept_w     )

        ,.mem_ack_o        ( dport_axi_ack_w        )
        ,.mem_data_rd_o    ( dport_axi_data_rd_w    )
        ,.mem_resp_tag_o   ( dport_axi_resp_tag_w   )
        ,.mem_error_o      ( dport_axi_error_w      )

        ,.mem_cacheable_i  ( dport_axi_cacheable_w  )
        ,.mem_invalidate_i ( dport_axi_invalidate_w )
        ,.mem_writeback_i  ( dport_axi_writeback_w  )
        ,.mem_flush_i      ( dport_axi_flush_w      )

        ,.axi_awid_o       ( m_aix_bus_awid    ) // bus
        ,.axi_awaddr_o     ( m_aix_bus_awaddr  )
        ,.axi_awlen_o      ( m_aix_bus_awlen   )
        ,.axi_awburst_o    ( m_aix_bus_awburst )
        ,.axi_awvalid_o    ( m_aix_bus_awvalid )
        ,.axi_awready_i    ( m_aix_bus_awready )
        ,.axi_wdata_o      ( m_aix_bus_wdata   )
        ,.axi_wstrb_o      ( m_aix_bus_wstrb   )
        ,.axi_wlast_o      ( m_aix_bus_wlast   )
        ,.axi_wvalid_o     ( m_aix_bus_wvalid  )
        ,.axi_wready_i     ( m_aix_bus_wready  )
        ,.axi_bid_i        ( m_aix_bus_bid     )
        ,.axi_bresp_i      ( m_aix_bus_bresp   )
        ,.axi_bready_o     ( m_aix_bus_bready  )
        ,.axi_bvalid_i     ( m_aix_bus_bvalid  )
        ,.axi_arid_o       ( m_aix_bus_arid    )
        ,.axi_araddr_o     ( m_aix_bus_araddr  )
        ,.axi_arlen_o      ( m_aix_bus_arlen   )
        ,.axi_arburst_o    ( m_aix_bus_arburst )
        ,.axi_arvalid_o    ( m_aix_bus_arvalid )
        ,.axi_arready_i    ( m_aix_bus_arready )
        ,.axi_rid_i        ( m_aix_bus_rid     )
        ,.axi_rdata_i      ( m_aix_bus_rdata   )
        ,.axi_rresp_i      ( m_aix_bus_rresp   )
        ,.axi_rlast_i      ( m_aix_bus_rlast   )
        ,.axi_rvalid_i     ( m_aix_bus_rvalid  )
        ,.axi_rready_o     ( m_aix_bus_rready  )
    );
    //--------------------------------------------------------------------------
endmodule
