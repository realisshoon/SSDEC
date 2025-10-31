//------------------------------------------------------------------------------
// axi_aclk:    clock input
// axi_aresetn: async reset, active-low, reset memory and AXI interface
// intr:        active-high interrupts
// m_axi_inst:  AXI4 master interface for instruction
// m_axi_data:  AXI4 master interface for data
//------------------------------------------------------------------------------
// SUPPORT_SUPER	1/0	Enable supervisor / user privilege levels.
// SUPPORT_MMU	1/0	Enable basic memory management unit.
// SUPPORT_MULDIV	1/0	Enable HW multiply / divide (RV-M).
// SUPPORT_LOAD_BYPASS	1/0	Support load result bypass paths.
// SUPPORT_MUL_BYPASS	1/0	Support multiply result bypass paths.
// SUPPORT_REGFILE_XILINX	1/0	Support Xilinx optimised register file.
// EXTRA_DECODE_STAGE	1/0	Extra decode pipe stage for improved timing.
// MEM_CACHE_ADDR_MIN	32'h0 - 32'hffffffff	Lowest cacheable memory address.
// MEM_CACHE_ADDR_MAX	32'h0 - 32'hffffffff	Highest cacheable memory address.
//------------------------------------------------------------------------------
// https://github.com/ultraembedded/riscv
// riscv/top_cache_axi/src_v/riscv_top.v
//------------------------------------------------------------------------------
//     +-------+        +--------+
//     |       | icache | icache |
//     |       |<=======| mem    |<===> m_axi_inst
//     |       |        |        |
//     | riscv |        +--------+
//     | core  |
//     |       |        +--------+
//     |       | dcache | dcache |
//     |       |<======>| mux    |<===> m_axi_data
//     |       |        |        |
//     +-------+        +--------+
//        ^ ^
//        | |
//        | +---- reset_vector
//        +------ intr
//------------------------------------------------------------------------------
module riscv_cache_core
     #(parameter CORE_ID                = 0
      ,parameter SUPPORT_MULDIV         = 1
      ,parameter SUPPORT_SUPER          = 0
      ,parameter SUPPORT_MMU            = 0
      ,parameter SUPPORT_LOAD_BYPASS    = 1
      ,parameter SUPPORT_MUL_BYPASS     = 1
      ,parameter SUPPORT_REGFILE_XILINX = 0
      ,parameter EXTRA_DECODE_STAGE     = 0
      ,parameter MEM_CACHE_ADDR_MIN     = 0
      ,parameter MEM_CACHE_ADDR_MAX     = 32'hffffffff
      ,parameter AXI_WIDTH_ID   = 4 // do not change if not sure
      ,parameter AXI_WIDTH_ADDR =32 // do not change if not sure
      ,parameter AXI_WIDTH_DATA =32 // do not change if not sure
      ,parameter AXI_WIDTH_STRB =(AXI_WIDTH_DATA/8))
(
    (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 axi_aresetn RST"  *) input  wire                      cpu_resetn,
    (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 axi_aresetn RST"  *) input  wire                      axi_aresetn,
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF m_axi_inst:m_axi_data, ASSOCIATED_RESET axi_aresetn" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 axi_aclk CLK"     *) input  wire                      axi_aclk,
`ifndef __ICARUS__
    (* X_INTERFACE_PARAMETER = "CLK_DOMAIN axi_aclk,RUSER_WIDTH 0,WUSER_WIDTH 0,ARUSER_WIDTH 0,AWUSER_WIDTH 0,\
                                HAS_CACHE 0,HAS_LOCK 0,HAS_PROT 0,HAS_QOS 0,HAS_REGION 0" *)
`endif
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_inst AWID"    *) output wire [AXI_WIDTH_ID-1:0]   m_axi_inst_awid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_inst AWADDR"  *) output wire [AXI_WIDTH_ADDR-1:0] m_axi_inst_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_inst AWLEN"   *) output wire [ 7:0]               m_axi_inst_awlen,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_inst AWSIZE"  *) output wire [ 2:0]               m_axi_inst_awsize,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_inst AWBURST" *) output wire [ 1:0]               m_axi_inst_awburst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_inst AWVALID" *) output wire                      m_axi_inst_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_inst AWREADY" *) input  wire                      m_axi_inst_awready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_inst WDATA"   *) output wire [AXI_WIDTH_DATA-1:0] m_axi_inst_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_inst WSTRB"   *) output wire [AXI_WIDTH_STRB-1:0] m_axi_inst_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_inst WLAST"   *) output wire                      m_axi_inst_wlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_inst WVALID"  *) output wire                      m_axi_inst_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_inst WREADY"  *) input  wire                      m_axi_inst_wready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_inst BID"     *) input  wire [AXI_WIDTH_ID-1:0]   m_axi_inst_bid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_inst BRESP"   *) input  wire [ 1:0]               m_axi_inst_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_inst BVALID"  *) input  wire                      m_axi_inst_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_inst BREADY"  *) output wire                      m_axi_inst_bready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_inst ARID"    *) output wire [AXI_WIDTH_ID-1:0]   m_axi_inst_arid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_inst ARADDR"  *) output wire [AXI_WIDTH_ADDR-1:0] m_axi_inst_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_inst ARLEN"   *) output wire [ 7:0]               m_axi_inst_arlen,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_inst ARSIZE"  *) output wire [ 2:0]               m_axi_inst_arsize,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_inst ARBURST" *) output wire [ 1:0]               m_axi_inst_arburst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_inst ARVALID" *) output wire                      m_axi_inst_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_inst ARREADY" *) input  wire                      m_axi_inst_arready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_inst RID"     *) input  wire [AXI_WIDTH_ID-1:0]   m_axi_inst_rid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_inst RDATA"   *) input  wire [AXI_WIDTH_DATA-1:0] m_axi_inst_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_inst RRESP"   *) input  wire [ 1:0]               m_axi_inst_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_inst RLAST"   *) input  wire                      m_axi_inst_rlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_inst RVALID"  *) input  wire                      m_axi_inst_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_inst RREADY"  *) output wire                      m_axi_inst_rready,
`ifndef __ICARUS__
    (* X_INTERFACE_PARAMETER = "CLK_DOMAIN axi_aclk,RUSER_WIDTH 0,WUSER_WIDTH 0,ARUSER_WIDTH 0,AWUSER_WIDTH 0,\
                                HAS_CACHE 0,HAS_LOCK 0,HAS_PROT 0,HAS_QOS 0,HAS_REGION 0" *)
`endif
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_data AWID"    *) output wire [AXI_WIDTH_ID-1:0]   m_axi_data_awid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_data AWADDR"  *) output wire [AXI_WIDTH_ADDR-1:0] m_axi_data_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_data AWLEN"   *) output wire [ 7:0]               m_axi_data_awlen,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_data AWSIZE"  *) output wire [ 2:0]               m_axi_data_awsize,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_data AWBURST" *) output wire [ 1:0]               m_axi_data_awburst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_data AWVALID" *) output wire                      m_axi_data_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_data AWREADY" *) input  wire                      m_axi_data_awready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_data WDATA"   *) output wire [AXI_WIDTH_DATA-1:0] m_axi_data_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_data WSTRB"   *) output wire [AXI_WIDTH_STRB-1:0] m_axi_data_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_data WLAST"   *) output wire                      m_axi_data_wlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_data WVALID"  *) output wire                      m_axi_data_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_data WREADY"  *) input  wire                      m_axi_data_wready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_data BID"     *) input  wire [AXI_WIDTH_ID-1:0]   m_axi_data_bid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_data BRESP"   *) input  wire [ 1:0]               m_axi_data_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_data BVALID"  *) input  wire                      m_axi_data_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_data BREADY"  *) output wire                      m_axi_data_bready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_data ARID"    *) output wire [AXI_WIDTH_ID-1:0]   m_axi_data_arid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_data ARADDR"  *) output wire [AXI_WIDTH_ADDR-1:0] m_axi_data_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_data ARLEN"   *) output wire [ 7:0]               m_axi_data_arlen,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_data ARSIZE"  *) output wire [ 2:0]               m_axi_data_arsize,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_data ARBURST" *) output wire [ 1:0]               m_axi_data_arburst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_data ARVALID" *) output wire                      m_axi_data_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_data ARREADY" *) input  wire                      m_axi_data_arready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_data RID"     *) input  wire [AXI_WIDTH_ID-1:0]   m_axi_data_rid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_data RDATA"   *) input  wire [AXI_WIDTH_DATA-1:0] m_axi_data_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_data RRESP"   *) input  wire [ 1:0]               m_axi_data_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_data RLAST"   *) input  wire                      m_axi_data_rlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_data RVALID"  *) input  wire                      m_axi_data_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_data RREADY"  *) output wire                      m_axi_data_rready,

    input wire         intr,
    input wire  [31:0] reset_vector
);
    //--------------------------------------------------------------------------
    assign m_axi_inst_arsize=3'h2;
    assign m_axi_inst_awsize=3'h2;
    assign m_axi_data_arsize=3'h2;
    assign m_axi_data_awsize=3'h2;
    //--------------------------------------------------------------------------
    wire  [31:0]  cpu_id_w=CORE_ID;
    wire  [31:0]  icache_pc_w        ;
    wire          icache_rd_w        ;
    wire          icache_accept_w    ;
    wire          icache_error_w     ;
    wire          icache_flush_w     ;
    wire          icache_invalidate_w;
    wire          icache_valid_w     ;
    wire  [31:0]  icache_inst_w      ;

    wire          dcache_cacheable_w ;
    wire  [10:0]  dcache_resp_tag_w  ;
    wire  [31:0]  dcache_data_rd_w   ;
    wire          dcache_ack_w       ;
    wire  [31:0]  dcache_data_wr_w   ;
    wire          dcache_invalidate_w;
    wire          dcache_writeback_w ;
    wire          dcache_rd_w        ;
    wire  [31:0]  dcache_addr_w      ;
    wire          dcache_error_w     ;
    wire  [ 3:0]  dcache_wr_w        ;
    wire  [10:0]  dcache_req_tag_w   ;
    wire          dcache_accept_w    ;
    wire          dcache_flush_w     ;
    //--------------------------------------------------------------------------
    riscv_core #(.SUPPORT_MULDIV        (SUPPORT_MULDIV        )
                ,.SUPPORT_SUPER         (SUPPORT_SUPER         )
                ,.SUPPORT_MMU           (SUPPORT_MMU           )
                ,.SUPPORT_LOAD_BYPASS   (SUPPORT_LOAD_BYPASS   )
                ,.SUPPORT_MUL_BYPASS    (SUPPORT_MUL_BYPASS    )
                ,.SUPPORT_REGFILE_XILINX(SUPPORT_REGFILE_XILINX)
                ,.EXTRA_DECODE_STAGE    (EXTRA_DECODE_STAGE    )
                ,.MEM_CACHE_ADDR_MIN    (MEM_CACHE_ADDR_MIN    )
                ,.MEM_CACHE_ADDR_MAX    (MEM_CACHE_ADDR_MAX    ))
    u_core (
         .clk_i              ( axi_aclk            )
        ,.rst_i              (~cpu_resetn          )

        ,.mem_i_rd_o         ( icache_rd_w         )
        ,.mem_i_pc_o         ( icache_pc_w         )
        ,.mem_i_accept_i     ( icache_accept_w     )

        ,.mem_i_valid_i      ( icache_valid_w      )
        ,.mem_i_inst_i       ( icache_inst_w       )
        ,.mem_i_error_i      ( icache_error_w      )

        ,.mem_i_invalidate_o ( icache_invalidate_w )
        ,.mem_i_flush_o      ( icache_flush_w      )

        ,.mem_d_rd_o         ( dcache_rd_w         )
        ,.mem_d_wr_o         ( dcache_wr_w         )
        ,.mem_d_addr_o       ( dcache_addr_w       )
        ,.mem_d_data_wr_o    ( dcache_data_wr_w    )
        ,.mem_d_req_tag_o    ( dcache_req_tag_w    )
        ,.mem_d_accept_i     ( dcache_accept_w     )

        ,.mem_d_ack_i        ( dcache_ack_w        )
        ,.mem_d_data_rd_i    ( dcache_data_rd_w    )
        ,.mem_d_resp_tag_i   ( dcache_resp_tag_w   )
        ,.mem_d_error_i      ( dcache_error_w      )

        ,.mem_d_cacheable_o  ( dcache_cacheable_w  )
        ,.mem_d_invalidate_o ( dcache_invalidate_w )
        ,.mem_d_writeback_o  ( dcache_writeback_w  )
        ,.mem_d_flush_o      ( dcache_flush_w      )

        ,.intr_i             ( intr                )
        ,.reset_vector_i     ( reset_vector        )
        ,.cpu_id_i           ( cpu_id_w            )
    );
    //--------------------------------------------------------------------------
    icache
    u_icache (
         .clk_i            ( axi_aclk             )
        ,.rst_i            (~axi_aresetn          )
        ,.req_rd_i         ( icache_rd_w          )
        ,.req_pc_i         ( icache_pc_w          )
        ,.req_accept_o     ( icache_accept_w      )
        ,.req_valid_o      ( icache_valid_w       )
        ,.req_inst_o       ( icache_inst_w        )
        ,.req_error_o      ( icache_error_w       )
        ,.req_invalidate_i ( icache_invalidate_w  )
        ,.req_flush_i      ( icache_flush_w       )
        ,.axi_arid_o       ( m_axi_inst_arid      )
        ,.axi_araddr_o     ( m_axi_inst_araddr    )
        ,.axi_arlen_o      ( m_axi_inst_arlen     )
        ,.axi_arburst_o    ( m_axi_inst_arburst   )
        ,.axi_arready_i    ( m_axi_inst_arready   )
        ,.axi_arvalid_o    ( m_axi_inst_arvalid   )
        ,.axi_rid_i        ( m_axi_inst_rid       )
        ,.axi_rdata_i      ( m_axi_inst_rdata     )
        ,.axi_rresp_i      ( m_axi_inst_rresp     )
        ,.axi_rlast_i      ( m_axi_inst_rlast     )
        ,.axi_rvalid_i     ( m_axi_inst_rvalid    )
        ,.axi_rready_o     ( m_axi_inst_rready    )
        ,.axi_awid_o       ( m_axi_inst_awid      )
        ,.axi_awaddr_o     ( m_axi_inst_awaddr    )
        ,.axi_awlen_o      ( m_axi_inst_awlen     )
        ,.axi_awburst_o    ( m_axi_inst_awburst   )
        ,.axi_awvalid_o    ( m_axi_inst_awvalid   )
        ,.axi_awready_i    ( m_axi_inst_awready   )
        ,.axi_wdata_o      ( m_axi_inst_wdata     )
        ,.axi_wstrb_o      ( m_axi_inst_wstrb     )
        ,.axi_wlast_o      ( m_axi_inst_wlast     )
        ,.axi_wready_i     ( m_axi_inst_wready    )
        ,.axi_wvalid_o     ( m_axi_inst_wvalid    )
        ,.axi_bid_i        ( m_axi_inst_bid       )
        ,.axi_bresp_i      ( m_axi_inst_bresp     )
        ,.axi_bvalid_i     ( m_axi_inst_bvalid    )
        ,.axi_bready_o     ( m_axi_inst_bready    )
    );
    //--------------------------------------------------------------------------
    dcache
    u_dcache (
         .clk_i            ( axi_aclk             )
        ,.rst_i            (~axi_aresetn          )
        ,.mem_rd_i         ( dcache_rd_w          )
        ,.mem_wr_i         ( dcache_wr_w          )
        ,.mem_addr_i       ( dcache_addr_w        )
        ,.mem_data_wr_i    ( dcache_data_wr_w     )
        ,.mem_req_tag_i    ( dcache_req_tag_w     )
        ,.mem_accept_o     ( dcache_accept_w      )
        ,.mem_ack_o        ( dcache_ack_w         )
        ,.mem_data_rd_o    ( dcache_data_rd_w     )
        ,.mem_resp_tag_o   ( dcache_resp_tag_w    )
        ,.mem_error_o      ( dcache_error_w       )
        ,.mem_cacheable_i  ( dcache_cacheable_w   )
        ,.mem_invalidate_i ( dcache_invalidate_w  )
        ,.mem_writeback_i  ( dcache_writeback_w   )
        ,.mem_flush_i      ( dcache_flush_w       )
        ,.axi_arid_o       ( m_axi_data_arid      )
        ,.axi_araddr_o     ( m_axi_data_araddr    )
        ,.axi_arlen_o      ( m_axi_data_arlen     )
        ,.axi_arburst_o    ( m_axi_data_arburst   )
        ,.axi_arvalid_o    ( m_axi_data_arvalid   )
        ,.axi_arready_i    ( m_axi_data_arready   )
        ,.axi_rid_i        ( m_axi_data_rid       )
        ,.axi_rdata_i      ( m_axi_data_rdata     )
        ,.axi_rresp_i      ( m_axi_data_rresp     )
        ,.axi_rlast_i      ( m_axi_data_rlast     )
        ,.axi_rvalid_i     ( m_axi_data_rvalid    )
        ,.axi_rready_o     ( m_axi_data_rready    )
        ,.axi_awid_o       ( m_axi_data_awid      )
        ,.axi_awaddr_o     ( m_axi_data_awaddr    )
        ,.axi_awlen_o      ( m_axi_data_awlen     )
        ,.axi_awburst_o    ( m_axi_data_awburst   )
        ,.axi_awvalid_o    ( m_axi_data_awvalid   )
        ,.axi_awready_i    ( m_axi_data_awready   )
        ,.axi_wdata_o      ( m_axi_data_wdata     )
        ,.axi_wstrb_o      ( m_axi_data_wstrb     )
        ,.axi_wlast_o      ( m_axi_data_wlast     )
        ,.axi_wvalid_o     ( m_axi_data_wvalid    )
        ,.axi_wready_i     ( m_axi_data_wready    )
        ,.axi_bid_i        ( m_axi_data_bid       )
        ,.axi_bresp_i      ( m_axi_data_bresp     )
        ,.axi_bready_o     ( m_axi_data_bready    )
        ,.axi_bvalid_i     ( m_axi_data_bvalid    )
    );
    //--------------------------------------------------------------------------
endmodule
