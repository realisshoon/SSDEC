//------------------------------------------------------------------------------
// [riscv_cache_core]                       (on-chip mem)
// +-----------+           +----------+     +------------+ MEM_CACHE_ADDR_MIN
// |           | axi_inst_ |        s0|<===>|mem_axi     |
// |           |<=========>|m0        |     +------------+ (MEM_ONCHIP_SIZE)
// |riscv_cache| axi_data_ |axi_switch|
// |           |<=========>|m1        |     +------------+ ADDR_PERIPHERAL
// |           |           |        s1|<===>|axi4_to_lite|     
// +-----------+           |          |     +------------+     
// +-----------+           |          |           ^                        
// | BFM       | axi_confmc|          |           |                        
// |(outside of|<=========>|m2        |           v                        
// | this SoC) |           |          |     +------------+      +---------+
// +-----------+           |          |     |          m0|<====>|pic      |
// +-----------+           |          |     |axi_lite_bus|      +---------+
// | MEM       | axi_mem   |          |     |            |      +---------+
// |(outside of|<=========>|s2        |     |          m1|<====>|timer    |
// | this SoC) |           |          |     |            |      +---------+
// +-----------+           +----------+     |            |      +---------+
//                                          |          m2|<====>|uart     |==
//                                          +------------+      +---------+
//------------------------------------------------------------------------------
//               +-----------+
//               |           |
//               |           |
// 32'h9002_0000 | UART      |
//               +-----------+ ADDR_UART
//               |           |
// 32'h9001_0000 | TIMER     |
//               +-----------+ ADDR_TIMER
//               |           |
// 32'h9000_0000 | PIC       |
//               +-----------+ ADDR_PERIPHERAL, ADDR_PIC
//               |           |
//               |           |    - ------------------ (MEM_CACHE_ADDR_MAX)
//               |           |
//               +-----------+    -
//               |           |    | MEM_OFFCHIP_SIZE
//               |           |    |
//               +-----------+ MEM_OFFCHIP_ADDR
//               |           |
//               +-----------+    -
//               |           |    | MEM_ONCHIP_SIZE
//               |           |    |
// 32'h0000_0000 +-----------+ MEM_ONCHIP_ADDR (MEM_CACHE_ADDR_MIN)
//------------------------------------------------------------------------------
module riscv_cache_soc
     #(parameter BOOT_VECTOR            = 32'h0000_0000
      ,parameter CORE_ID                = 0
      ,parameter SUPPORT_SUPER          = 0 //1/0     Enable supervisor / user privilege levels.
      ,parameter SUPPORT_MMU            = 0 //Enable basic memory management unit.
      ,parameter SUPPORT_MULDIV         = 1 //1/0     Enable HW multiply / divide (RV-M).
      ,parameter SUPPORT_LOAD_BYPASS    = 1 //1/0     Support load result bypass paths.
      ,parameter SUPPORT_MUL_BYPASS     = 1 //1/0     Support multiply result bypass paths.
      ,parameter SUPPORT_REGFILE_XILINX = 0 //1/0     Support Xilinx optimised register file.
      ,parameter EXTRA_DECODE_STAGE     = 0 //1/0     Extra decode pipe stage for improved timing.
      ,parameter MEM_CACHE_ADDR_MIN     = 32'h0000_0000 //Lowest cacheable memory address.
      ,parameter MEM_CACHE_ADDR_MAX     = 32'h0FFF_FFFF //Highest cacheable memory address.
      ,parameter MEM_ONCHIP_ADDR        = 32'h0000_0000 //Lowest on-chip memory address.
      ,parameter MEM_ONCHIP_SIZE        = 128*1024  //size of on-chip memory
      `ifdef MEMORY_EXTERNAL
      ,parameter MEM_OFFCHIP_ADDR       = 32'h0200_0000 //Lowest off-chip memory address.
      ,parameter MEM_OFFCHIP_SIZE       = 128*1024  //size of off-chip memory
      `endif
      ,parameter ADDR_PERIPHERAL = 32'h9000_0000 // starting address of peripherals
      ,parameter SIZE_PERIPHERAL = 32'h1000_0000 // size of address of peripherals
      ,parameter BAUD_RATE       = 115200      // uart board rate
      ,parameter ACLK_FREQ       = 100_000_000 // clock frequency
      ,parameter ADDR_PIC   = 32'h9000_0000 // starting address of PIC
      ,parameter ADDR_TIMER = 32'h9001_0000 // starting address of TIMER
      ,parameter ADDR_UART  = 32'h9002_0000 // starting address of UART
      ,parameter ADDR_GPIO  = 32'h9003_0000 // starting address of GPIO
      ,parameter SIZE_PIC   = 32'h0000_1000
      ,parameter SIZE_TIMER = 32'h0000_1000
      ,parameter SIZE_UART  = 32'h0000_1000
      ,parameter SIZE_GPIO  = 32'h0000_1000
      ,parameter NUM_IRQ    = 3  // timer(0), uart(1), gpio(2)
      ,parameter IRQ_TIMER  = 0  // timer(0)
      ,parameter IRQ_UART   = 1 // uart(1)
      ,parameter IRQ_GPIO   = 2 // gpio(2)
      ,parameter AXI_WIDTH_CID  = 2 // since three master ports of axi_switch
      ,parameter AXI_WIDTH_ID   = 4 // do not change if not sure
      ,parameter AXI_WIDTH_SID  = AXI_WIDTH_CID+AXI_WIDTH_ID // do not change if not sure
      ,parameter AXI_WIDTH_ADDR =32 // do not change if not sure
      ,parameter AXI_WIDTH_DATA =32 // do not change if not sure
      ,parameter AXI_WIDTH_STRB =(AXI_WIDTH_DATA/8))
(
     (* mark_debug="true" *) output wire  uart_txd,
     (* mark_debug="true" *) input  wire  uart_rxdd,
     (* mark_debug="true" *) output wire  uart_rts_n,
     (* mark_debug="true" *) input  wire  uart_cts_n,
     (* mark_debug="true" *) input  wire [7:0] gpio_in,   // 8 user switches on ZedBoard
     (* mark_debug="true" *) output wire [7:0] gpio_out,  // 8 user LEDs on ZedBoard  
     (* mark_debug="true" *) output wire [3:0] keypad_col, // 4x4 Matrix Keypad Column output
     (* mark_debug="true" *) input  wire [3:0] keypad_row, // 4x4 Matrix Keypad Row input
     (* mark_debug="true" *) input  wire  cpu_resetn, // must go to 1 after axi_aresetn de-asserted
     (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
     (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 axi_aresetn RST"*) (* mark_debug="true" *) input  wire  axi_aresetn,
     (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF s_axi_confmc:m_axi_mem" *)
     (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 axi_aclk CLK"   *) input  wire  axi_aclk
    `ifdef CON_FMC
     ,
`ifndef __ICARUS__
     (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF s_axi_confmc,ASSOCIATED_RESET axi_aresetn\
                                ,RUSER_WIDTH 0,WUSER_WIDTH 0,ARUSER_WIDTH 0\
                                ,AWUSER_WIDTH 0,PROTOCOL AXI4\
                                ,HAS_BURST 1,HAS_CACHE 0,HAS_LOCK 0,HAS_PROT 0\
                                ,HAS_QOS 0,HAS_REGION 0,HAS_wstrb 1,HAS_bresp 1,HAS_rresp 1" *)
`endif
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc awid"    *) input  wire [AXI_WIDTH_ID-1:0]   s_axi_confmc_awid,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc awaddr"  *) input  wire [AXI_WIDTH_ADDR-1:0] s_axi_confmc_awaddr,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc awlen"   *) input  wire [ 7:0]               s_axi_confmc_awlen,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc awsize"  *) input  wire [ 2:0]               s_axi_confmc_awsize,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc awburst" *) input  wire [ 1:0]               s_axi_confmc_awburst,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc awvalid" *) input  wire                      s_axi_confmc_awvalid,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc awready" *) output wire                      s_axi_confmc_awready,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc wdata"   *) input  wire [AXI_WIDTH_DATA-1:0] s_axi_confmc_wdata,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc wstrb"   *) input  wire [AXI_WIDTH_STRB-1:0] s_axi_confmc_wstrb,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc wlast"   *) input  wire                      s_axi_confmc_wlast,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc wvalid"  *) input  wire                      s_axi_confmc_wvalid,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc wready"  *) output wire                      s_axi_confmc_wready,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc bid"     *) output wire [AXI_WIDTH_ID-1:0]   s_axi_confmc_bid,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc bresp"   *) output wire [ 1:0]               s_axi_confmc_bresp,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc bvalid"  *) output wire                      s_axi_confmc_bvalid,
     (* X_INTERFACE_INFO = "xilpgainx.com:interface:aximm:1.0 s_axi_confmc bready"  *) input  wire                      s_axi_confmc_bready,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc arid"    *) input  wire [AXI_WIDTH_ID-1:0]   s_axi_confmc_arid,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc araddr"  *) input  wire [AXI_WIDTH_ADDR-1:0] s_axi_confmc_araddr,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc arlen"   *) input  wire [ 7:0]               s_axi_confmc_arlen,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc arsize"  *) input  wire [ 2:0]               s_axi_confmc_arsize,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc arburst" *) input  wire [ 1:0]               s_axi_confmc_arburst,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc arvalid" *) input  wire                      s_axi_confmc_arvalid,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc arready" *) output wire                      s_axi_confmc_arready,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc rid"     *) output wire [AXI_WIDTH_ID-1:0]   s_axi_confmc_rid,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc rdata"   *) output wire [AXI_WIDTH_DATA-1:0] s_axi_confmc_rdata,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc rresp"   *) output wire [ 1:0]               s_axi_confmc_rresp,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc rlast"   *) output wire                      s_axi_confmc_rlast,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc rvalid"  *) output wire                      s_axi_confmc_rvalid,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_confmc rready"  *) input  wire                      s_axi_confmc_rready
    `endif // ifdef CON_FMC
    `ifdef MEMORY_EXTERNAL
     ,
`ifndef __ICARUS__
     (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF m_axi_mem,ASSOCIATED_RESET axi_aresetn\
                                ,RUSER_WIDTH 0,WUSER_WIDTH 0,ARUSER_WIDTH 0\
                                ,AWUSER_WIDTH 0,PROTOCOL AXI4\
                                ,HAS_BURST 1,HAS_CACHE 0,HAS_LOCK 0,HAS_PROT 0\
                                ,HAS_QOS 0,HAS_REGION 0,HAS_wstrb 1,HAS_bresp 1,HAS_rresp 1" *)
`endif
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem awid"    *) output wire [AXI_WIDTH_SID-1:0]  m_axi_mem_awid,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem awaddr"  *) output wire [AXI_WIDTH_ADDR-1:0] m_axi_mem_awaddr,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem awlen"   *) output wire [ 7:0]               m_axi_mem_awlen,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem awsize"  *) output wire [ 2:0]               m_axi_mem_awsize,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem awburst" *) output wire [ 1:0]               m_axi_mem_awburst,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem awvalid" *) output wire                      m_axi_mem_awvalid,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem awready" *) input  wire                      m_axi_mem_awready,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem wdata"   *) output wire [AXI_WIDTH_DATA-1:0] m_axi_mem_wdata,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem wstrb"   *) output wire [AXI_WIDTH_STRB-1:0] m_axi_mem_wstrb,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem wlast"   *) output wire                      m_axi_mem_wlast,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem wvalid"  *) output wire                      m_axi_mem_wvalid,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem wready"  *) input  wire                      m_axi_mem_wready,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem bid"     *) input  wire [AXI_WIDTH_SID-1:0]  m_axi_mem_bid,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem bresp"   *) input  wire [ 1:0]               m_axi_mem_bresp,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem bvalid"  *) input  wire                      m_axi_mem_bvalid,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem bready"  *) output wire                      m_axi_mem_bready,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem arid"    *) output wire [AXI_WIDTH_SID-1:0]  m_axi_mem_arid,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem araddr"  *) output wire [AXI_WIDTH_ADDR-1:0] m_axi_mem_araddr,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem arlen"   *) output wire [ 7:0]               m_axi_mem_arlen,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem arsize"  *) output wire [ 2:0]               m_axi_mem_arsize,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem arburst" *) output wire [ 1:0]               m_axi_mem_arburst,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem arvalid" *) output wire                      m_axi_mem_arvalid,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem arready" *) input  wire                      m_axi_mem_arready,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem rid"     *) input  wire [AXI_WIDTH_SID-1:0]  m_axi_mem_rid,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem rdata"   *) input  wire [AXI_WIDTH_DATA-1:0] m_axi_mem_rdata,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem rresp"   *) input  wire [ 1:0]               m_axi_mem_rresp,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem rlast"   *) input  wire                      m_axi_mem_rlast,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem rvalid"  *) input  wire                      m_axi_mem_rvalid,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mem rready"  *) output wire                      m_axi_mem_rready
    `endif // ifdef MEMORY_EXTERNAL
);
    //--------------------------------------------------------------------------
    `ifndef MEMORY_EXTERNAL
     localparam MEM_OFFCHIP_ADDR = MEM_ONCHIP_ADDR+MEM_ONCHIP_SIZE;
     localparam MEM_OFFCHIP_SIZE = 32*1024;
    `endif // ifdef MEMORY_EXTERNAL
    //--------------------------------------------------------------------------
    // synthesis translate_off
    localparam MEM_ONCHIP_ADDR_END =(MEM_ONCHIP_ADDR+MEM_ONCHIP_SIZE); // exclusive
    initial begin
        if ((ADDR_PIC  <ADDR_PERIPHERAL)||((ADDR_PIC  +SIZE_PIC  )>(ADDR_PERIPHERAL+SIZE_PERIPHERAL))) begin
            $display("%m ERROR PIC address.");
        end
        if ((ADDR_TIMER<ADDR_PERIPHERAL)||((ADDR_TIMER+SIZE_TIMER)>(ADDR_PERIPHERAL+SIZE_PERIPHERAL))) begin
            $display("%m ERROR TIMER address.");
        end
        if ((ADDR_UART <ADDR_PERIPHERAL)||((ADDR_UART +SIZE_UART )>(ADDR_PERIPHERAL+SIZE_PERIPHERAL))) begin
            $display("%m ERROR UART address.");
        end
        if (!((MEM_ONCHIP_ADDR>=MEM_CACHE_ADDR_MIN)&&(MEM_ONCHIP_ADDR<MEM_CACHE_ADDR_MAX)&&
              (MEM_ONCHIP_ADDR_END>MEM_CACHE_ADDR_MIN)&&(MEM_ONCHIP_ADDR_END<=MEM_CACHE_ADDR_MAX))) begin
            $display("%m ERROR MEM_ONCHIP_ADDR and SIZE.");
        end
    end
    localparam MEM_OFFCHIP_ADDR_END=(MEM_OFFCHIP_ADDR+MEM_OFFCHIP_SIZE); // exclusive
    initial begin
       if (!((MEM_OFFCHIP_ADDR>=MEM_CACHE_ADDR_MIN)&&(MEM_OFFCHIP_ADDR<MEM_CACHE_ADDR_MAX)&&
             (MEM_OFFCHIP_ADDR_END>MEM_CACHE_ADDR_MIN)&&(MEM_OFFCHIP_ADDR_END<=MEM_CACHE_ADDR_MAX))) begin
           $display("%m ERROR MEM_OFFCHIP_ADDR and SIZE.");
       end
    end
    // synthesis translate_on
    //--------------------------------------------------------------------------
    wire         interrupt_core;
    wire  [31:0] reset_vector=BOOT_VECTOR;
    //--------------------------------------------------------------------------
    // GPIO internal signals
    (* mark_debug="true" *) wire [7:0] gpio_dir;  // GPIO direction (internal only)
    //--------------------------------------------------------------------------
   (* mark_debug="true" *)wire [AXI_WIDTH_ID-1:0]   axi_inst_awid   , axi_data_awid   ;
   (* mark_debug="true" *)wire [AXI_WIDTH_ADDR-1:0] axi_inst_awaddr , axi_data_awaddr ;
   (* mark_debug="true" *)wire [ 7:0]               axi_inst_awlen  , axi_data_awlen  ;
   (* mark_debug="true" *)wire [ 2:0]               axi_inst_awsize , axi_data_awsize ;
   (* mark_debug="true" *)wire [ 1:0]               axi_inst_awburst, axi_data_awburst;
   (* mark_debug="true" *)wire                      axi_inst_awvalid, axi_data_awvalid;
   (* mark_debug="true" *)wire                      axi_inst_awready, axi_data_awready;
   (* mark_debug="true" *)wire [AXI_WIDTH_DATA-1:0] axi_inst_wdata  , axi_data_wdata  ;
   (* mark_debug="true" *)wire [AXI_WIDTH_STRB-1:0] axi_inst_wstrb  , axi_data_wstrb  ;
   (* mark_debug="true" *)wire                      axi_inst_wlast  , axi_data_wlast  ;
   (* mark_debug="true" *)wire                      axi_inst_wvalid , axi_data_wvalid ;
   (* mark_debug="true" *)wire                      axi_inst_wready , axi_data_wready ;
   (* mark_debug="true" *)wire [AXI_WIDTH_ID-1:0]   axi_inst_bid    , axi_data_bid    ;
   (* mark_debug="true" *)wire [ 1:0]               axi_inst_bresp  , axi_data_bresp  ;
   (* mark_debug="true" *)wire                      axi_inst_bvalid , axi_data_bvalid ;
   (* mark_debug="true" *)wire                      axi_inst_bready , axi_data_bready ;
   (* mark_debug="true" *)wire [AXI_WIDTH_ID-1:0]   axi_inst_arid   , axi_data_arid   ;
   (* mark_debug="true" *)wire [AXI_WIDTH_ADDR-1:0] axi_inst_araddr , axi_data_araddr ;
   (* mark_debug="true" *)wire [ 7:0]               axi_inst_arlen  , axi_data_arlen  ;
   (* mark_debug="true" *)wire [ 2:0]               axi_inst_arsize , axi_data_arsize ;
   (* mark_debug="true" *)wire [ 1:0]               axi_inst_arburst, axi_data_arburst;
   (* mark_debug="true" *)wire                      axi_inst_arvalid, axi_data_arvalid;
   (* mark_debug="true" *)wire                      axi_inst_arready, axi_data_arready;
   (* mark_debug="true" *)wire [AXI_WIDTH_ID-1:0]   axi_inst_rid    , axi_data_rid    ;
   (* mark_debug="true" *)wire [AXI_WIDTH_DATA-1:0] axi_inst_rdata  , axi_data_rdata  ;
   (* mark_debug="true" *)wire [ 1:0]               axi_inst_rresp  , axi_data_rresp  ;
   (* mark_debug="true" *)wire                      axi_inst_rlast  , axi_data_rlast  ;
   (* mark_debug="true" *)wire                      axi_inst_rvalid , axi_data_rvalid ;
   (* mark_debug="true" *)wire                      axi_inst_rready , axi_data_rready ;
    //--------------------------------------------------------------------------
    `ifndef CON_FMC
    wire [AXI_WIDTH_ID-1:0]   s_axi_confmc_awid   ={AXI_WIDTH_ID{1'b0}};
    wire [AXI_WIDTH_ADDR-1:0] s_axi_confmc_awaddr ={AXI_WIDTH_ADDR{1'b0}};
    wire [ 7:0]               s_axi_confmc_awlen  =8'h0;
    wire [ 2:0]               s_axi_confmc_awsize =3'h0;
    wire [ 1:0]               s_axi_confmc_awburst=2'b0;
    wire                      s_axi_confmc_awvalid=1'b0;
    wire                      s_axi_confmc_awready;
    wire [AXI_WIDTH_DATA-1:0] s_axi_confmc_wdata  ={AXI_WIDTH_DATA{1'b0}};
    wire [AXI_WIDTH_STRB-1:0] s_axi_confmc_wstrb  ={AXI_WIDTH_STRB{1'b0}};
    wire                      s_axi_confmc_wlast  =1'b0;
    wire                      s_axi_confmc_wvalid =1'b0;
    wire                      s_axi_confmc_wready ;
    wire [AXI_WIDTH_ID-1:0]   s_axi_confmc_bid    ;
    wire [ 1:0]               s_axi_confmc_bresp  ;
    wire                      s_axi_confmc_bvalid ;
    wire                      s_axi_confmc_bready =1'b0;
    wire [AXI_WIDTH_ID-1:0]   s_axi_confmc_arid   ={AXI_WIDTH_ID{1'b0}};
    wire [AXI_WIDTH_ADDR-1:0] s_axi_confmc_araddr ={AXI_WIDTH_ADDR{1'b0}};
    wire [ 7:0]               s_axi_confmc_arlen  =8'h0;
    wire [ 2:0]               s_axi_confmc_arsize =3'h0;
    wire [ 1:0]               s_axi_confmc_arburst=2'h0;
    wire                      s_axi_confmc_arvalid=1'b0;
    wire                      s_axi_confmc_arready;
    wire [AXI_WIDTH_ID-1:0]   s_axi_confmc_rid    ;
    wire [AXI_WIDTH_DATA-1:0] s_axi_confmc_rdata  ;
    wire [ 1:0]               s_axi_confmc_rresp  ;
    wire                      s_axi_confmc_rlast  ;
    wire                      s_axi_confmc_rvalid ;
    wire                      s_axi_confmc_rready =1'b0;
    `endif // ifndef CON_FMC
    `ifndef MEMORY_EXTERNAL
    wire [AXI_WIDTH_SID-1:0]  m_axi_mem_awid   ;
    wire [AXI_WIDTH_ADDR-1:0] m_axi_mem_awaddr ;
    wire [ 7:0]               m_axi_mem_awlen  ;
    wire [ 2:0]               m_axi_mem_awsize ;
    wire [ 1:0]               m_axi_mem_awburst;
    wire                      m_axi_mem_awvalid;
    wire                      m_axi_mem_awready=1'b0;
    wire [AXI_WIDTH_DATA-1:0] m_axi_mem_wdata  ;
    wire [AXI_WIDTH_STRB-1:0] m_axi_mem_wstrb  ;
    wire                      m_axi_mem_wlast  ;
    wire                      m_axi_mem_wvalid ;
    wire                      m_axi_mem_wready =1'b0;
    wire [AXI_WIDTH_SID-1:0]  m_axi_mem_bid    ={AXI_WIDTH_SID{1'b0}};
    wire [ 1:0]               m_axi_mem_bresp  =2'b00;
    wire                      m_axi_mem_bvalid =1'b0;
    wire                      m_axi_mem_bready ;
    wire [AXI_WIDTH_SID-1:0]  m_axi_mem_arid   ;
    wire [AXI_WIDTH_ADDR-1:0] m_axi_mem_araddr ;
    wire [ 7:0]               m_axi_mem_arlen  ;
    wire [ 2:0]               m_axi_mem_arsize ;
    wire [ 1:0]               m_axi_mem_arburst;
    wire                      m_axi_mem_arvalid;
    wire                      m_axi_mem_arready=1'b0;
    wire [AXI_WIDTH_SID-1:0]  m_axi_mem_rid    ={AXI_WIDTH_SID{1'b0}};
    wire [AXI_WIDTH_DATA-1:0] m_axi_mem_rdata  ={AXI_WIDTH_DATA{1'b0}};
    wire [ 1:0]               m_axi_mem_rresp  =2'b0;
    wire                      m_axi_mem_rlast  =1'b0;
    wire                      m_axi_mem_rvalid =1'b0;
    wire                      m_axi_mem_rready ;
    `endif // ifndef MEMORY_EXTERNAL
    //--------------------------------------------------------------------------
    riscv_cache_core #(.CORE_ID               ( CORE_ID                )
                      ,.SUPPORT_MULDIV        ( SUPPORT_MULDIV         )
                      ,.SUPPORT_SUPER         ( SUPPORT_SUPER          )
                      ,.SUPPORT_MMU           ( SUPPORT_MMU            )
                      ,.SUPPORT_LOAD_BYPASS   ( SUPPORT_LOAD_BYPASS    )
                      ,.SUPPORT_MUL_BYPASS    ( SUPPORT_MUL_BYPASS     )
                      ,.SUPPORT_REGFILE_XILINX( SUPPORT_REGFILE_XILINX )
                      ,.EXTRA_DECODE_STAGE    ( EXTRA_DECODE_STAGE     )
                      ,.MEM_CACHE_ADDR_MIN    ( MEM_CACHE_ADDR_MIN     )
                      ,.MEM_CACHE_ADDR_MAX    ( MEM_CACHE_ADDR_MAX     )
                      ,.AXI_WIDTH_ID  ( AXI_WIDTH_ID   )
                      ,.AXI_WIDTH_ADDR( AXI_WIDTH_ADDR )
                      ,.AXI_WIDTH_DATA( AXI_WIDTH_DATA )
                      ,.AXI_WIDTH_STRB( AXI_WIDTH_STRB ))
    u_riscv_cache_core (
         .cpu_resetn         ( cpu_resetn       )
        ,.axi_aresetn        ( axi_aresetn      )
        ,.axi_aclk           ( axi_aclk         )
        ,.m_axi_inst_awid    ( axi_inst_awid    )
        ,.m_axi_inst_awaddr  ( axi_inst_awaddr  )
        ,.m_axi_inst_awlen   ( axi_inst_awlen    )
        ,.m_axi_inst_awready ( axi_inst_awready )
        ,.m_axi_inst_wdata   ( axi_inst_wdata   )
        ,.m_axi_inst_wstrb   ( axi_inst_wstrb   )
        ,.m_axi_inst_wlast   ( axi_inst_wlast   )
        ,.m_axi_inst_wvalid  ( axi_inst_wvalid  )
        ,.m_axi_inst_wready  ( axi_inst_wready  )
        ,.m_axi_inst_bid     ( axi_inst_bid     )
        ,.m_axi_inst_bresp   ( axi_inst_bresp   )
        ,.m_axi_inst_bvalid  ( axi_inst_bvalid  )
        ,.m_axi_inst_bready  ( axi_inst_bready  )
        ,.m_axi_inst_arid    ( axi_inst_arid    )
        ,.m_axi_inst_araddr  ( axi_inst_araddr  )
        ,.m_axi_inst_arlen   ( axi_inst_arlen   )
        ,.m_axi_inst_arsize  ( axi_inst_arsize  )
        ,.m_axi_inst_arburst ( axi_inst_arburst )
        ,.m_axi_inst_arvalid ( axi_inst_arvalid )
        ,.m_axi_inst_arready ( axi_inst_arready )
        ,.m_axi_inst_rid     ( axi_inst_rid     )
        ,.m_axi_inst_rdata   ( axi_inst_rdata   )
        ,.m_axi_inst_rresp   ( axi_inst_rresp   )
        ,.m_axi_inst_rlast   ( axi_inst_rlast   )
        ,.m_axi_inst_rvalid  ( axi_inst_rvalid  )
        ,.m_axi_inst_rready  ( axi_inst_rready  )
        ,.m_axi_data_awid    ( axi_data_awid    )
        ,.m_axi_data_awaddr  ( axi_data_awaddr  )
        ,.m_axi_data_awlen   ( axi_data_awlen   )
        ,.m_axi_data_awsize  ( axi_data_awsize  )
        ,.m_axi_data_awburst ( axi_data_awburst )
        ,.m_axi_data_awvalid ( axi_data_awvalid )
        ,.m_axi_data_awready ( axi_data_awready )
        ,.m_axi_data_wdata   ( axi_data_wdata   )
        ,.m_axi_data_wstrb   ( axi_data_wstrb   )
        ,.m_axi_data_wlast   ( axi_data_wlast   )
        ,.m_axi_data_wvalid  ( axi_data_wvalid  )
        ,.m_axi_data_wready  ( axi_data_wready  )
        ,.m_axi_data_bid     ( axi_data_bid     )
        ,.m_axi_data_bresp   ( axi_data_bresp   )
        ,.m_axi_data_bvalid  ( axi_data_bvalid  )
        ,.m_axi_data_bready  ( axi_data_bready  )
        ,.m_axi_data_arid    ( axi_data_arid    )
        ,.m_axi_data_araddr  ( axi_data_araddr  )
        ,.m_axi_data_arlen   ( axi_data_arlen   )
        ,.m_axi_data_arsize  ( axi_data_arsize  )
        ,.m_axi_data_arburst ( axi_data_arburst )
        ,.m_axi_data_arvalid ( axi_data_arvalid )
        ,.m_axi_data_arready ( axi_data_arready )
        ,.m_axi_data_rid     ( axi_data_rid     )
        ,.m_axi_data_rdata   ( axi_data_rdata   )
        ,.m_axi_data_rresp   ( axi_data_rresp   )
        ,.m_axi_data_rlast   ( axi_data_rlast   )
        ,.m_axi_data_rvalid  ( axi_data_rvalid  )
        ,.m_axi_data_rready  ( axi_data_rready  )

        ,.intr               ( interrupt_core   )
        ,.reset_vector       ( reset_vector     )
    );
    //--------------------------------------------------------------------------
    wire [AXI_WIDTH_ID-1:0]   axi_inst_wid=axi_inst_awid;
    wire [AXI_WIDTH_ID-1:0]   axi_data_wid=axi_data_awid;
    //--------------------------------------------------------------------------
    // 0: on-chip memory
    // 1: axi4-lite
    wire [AXI_WIDTH_SID-1:0]  axi_bus_awid   [0:1];
    wire [AXI_WIDTH_ADDR-1:0] axi_bus_awaddr [0:1];
    wire [ 7:0]               axi_bus_awlen  [0:1];
    wire [ 2:0]               axi_bus_awsize [0:1];
    wire [ 1:0]               axi_bus_awburst[0:1];
    wire [ 1:0]               axi_bus_awvalid     ;
    wire [ 1:0]               axi_bus_awready     ;
  //wire [AXI_WIDTH_SID-1:0]  axi_bus_wid    [0:1];
    wire [AXI_WIDTH_DATA-1:0] axi_bus_wdata  [0:1];
    wire [AXI_WIDTH_STRB-1:0] axi_bus_wstrb  [0:1];
    wire [ 1:0]               axi_bus_wlast       ;
    wire [ 1:0]               axi_bus_wvalid      ;
    wire [ 1:0]               axi_bus_wready      ;
    wire [AXI_WIDTH_SID-1:0]  axi_bus_bid    [0:1];
    wire [ 1:0]               axi_bus_bresp  [0:1];
    wire [ 1:0]               axi_bus_bvalid      ;
    wire [ 1:0]               axi_bus_bready      ;
    wire [AXI_WIDTH_SID-1:0]  axi_bus_arid   [0:1];
    wire [AXI_WIDTH_ADDR-1:0] axi_bus_araddr [0:1];
    wire [ 7:0]               axi_bus_arlen  [0:1];
    wire [ 2:0]               axi_bus_arsize [0:1];
    wire [ 1:0]               axi_bus_arburst[0:1];
    wire [ 1:0]               axi_bus_arvalid     ;
    wire [ 1:0]               axi_bus_arready     ;
    wire [AXI_WIDTH_SID-1:0]  axi_bus_rid    [0:1];
    wire [AXI_WIDTH_DATA-1:0] axi_bus_rdata  [0:1];
    wire [ 1:0]               axi_bus_rresp  [0:1];
    wire [ 1:0]               axi_bus_rlast       ;
    wire [ 1:0]               axi_bus_rvalid      ;
    wire [ 1:0]               axi_bus_rready      ;
    //--------------------------------------------------------------------------
    axi_switch_m3s3 #(.WIDTH_CID   (AXI_WIDTH_CID )
                     ,.WIDTH_ID    (AXI_WIDTH_ID  )
                     ,.WIDTH_AD    (AXI_WIDTH_ADDR)
                     ,.WIDTH_DA    (AXI_WIDTH_DATA)
                     ,.WIDTH_DS    (AXI_WIDTH_STRB)
                     ,.WIDTH_SID   (AXI_WIDTH_SID )
                     ,.ADDR_BASE0  (MEM_ONCHIP_ADDR)
                     ,.ADDR_LENGTH0($clog2(MEM_ONCHIP_SIZE))
                     ,.ADDR_BASE1  (ADDR_PERIPHERAL)
                     ,.ADDR_LENGTH1($clog2(SIZE_PERIPHERAL))
                     ,.ADDR_BASE2  (MEM_OFFCHIP_ADDR)
                     ,.ADDR_LENGTH2($clog2(MEM_OFFCHIP_SIZE)))
    u_axi_switch_m3s3 (
           .ARESETn              (axi_aresetn     )
         , .ACLK                 (axi_aclk        )
         , .M0_AWID              (axi_inst_awid   )
         , .M0_AWADDR            (axi_inst_awaddr )
         , .M0_AWLEN             (axi_inst_awlen  )
         , .M0_AWLOCK            (1'b0            )
         , .M0_AWSIZE            (axi_inst_awsize )
         , .M0_AWBURST           (axi_inst_awburst)
         , .M0_AWVALID           (axi_inst_awvalid)
         , .M0_AWREADY           (axi_inst_awready)
         , .M0_WDATA             (axi_inst_wdata  )
         , .M0_WSTRB             (axi_inst_wstrb  )
         , .M0_WLAST             (axi_inst_wlast  )
         , .M0_WVALID            (axi_inst_wvalid )
         , .M0_WREADY            (axi_inst_wready )
         , .M0_BID               (axi_inst_bid    )
         , .M0_BRESP             (axi_inst_bresp  )
         , .M0_BVALID            (axi_inst_bvalid )
         , .M0_BREADY            (axi_inst_bready )
         , .M0_ARID              (axi_inst_arid   )
         , .M0_ARADDR            (axi_inst_araddr )
         , .M0_ARLEN             (axi_inst_arlen  )
         , .M0_ARLOCK            (1'b0            )
         , .M0_ARSIZE            (axi_inst_arsize )
         , .M0_ARBURST           (axi_inst_arburst)
         , .M0_ARVALID           (axi_inst_arvalid)
         , .M0_ARREADY           (axi_inst_arready)
         , .M0_RID               (axi_inst_rid    )
         , .M0_RDATA             (axi_inst_rdata  )
         , .M0_RRESP             (axi_inst_rresp  )
         , .M0_RLAST             (axi_inst_rlast  )
         , .M0_RVALID            (axi_inst_rvalid )
         , .M0_RREADY            (axi_inst_rready )
         , .M1_AWID              (axi_data_awid   )
         , .M1_AWADDR            (axi_data_awaddr )
         , .M1_AWLEN             (axi_data_awlen  )
         , .M1_AWLOCK            (1'b0            )
         , .M1_AWSIZE            (axi_data_awsize )
         , .M1_AWBURST           (axi_data_awburst)
         , .M1_AWVALID           (axi_data_awvalid)
         , .M1_AWREADY           (axi_data_awready)
         , .M1_WDATA             (axi_data_wdata  )
         , .M1_WSTRB             (axi_data_wstrb  )
         , .M1_WLAST             (axi_data_wlast  )
         , .M1_WVALID            (axi_data_wvalid )
         , .M1_WREADY            (axi_data_wready )
         , .M1_BID               (axi_data_bid    )
         , .M1_BRESP             (axi_data_bresp  )
         , .M1_BVALID            (axi_data_bvalid )
         , .M1_BREADY            (axi_data_bready )
         , .M1_ARID              (axi_data_arid   )
         , .M1_ARADDR            (axi_data_araddr )
         , .M1_ARLEN             (axi_data_arlen  )
         , .M1_ARLOCK            (1'b0            )
         , .M1_ARSIZE            (axi_data_arsize )
         , .M1_ARBURST           (axi_data_arburst)
         , .M1_ARVALID           (axi_data_arvalid)
         , .M1_ARREADY           (axi_data_arready)
         , .M1_RID               (axi_data_rid    )
         , .M1_RDATA             (axi_data_rdata  )
         , .M1_RRESP             (axi_data_rresp  )
         , .M1_RLAST             (axi_data_rlast  )
         , .M1_RVALID            (axi_data_rvalid )
         , .M1_RREADY            (axi_data_rready )
         , .M2_AWID              (s_axi_confmc_awid   )
         , .M2_AWADDR            (s_axi_confmc_awaddr )
         , .M2_AWLEN             (s_axi_confmc_awlen  )
         , .M2_AWLOCK            (1'b0              )
         , .M2_AWSIZE            (s_axi_confmc_awsize )
         , .M2_AWBURST           (s_axi_confmc_awburst)
         , .M2_AWVALID           (s_axi_confmc_awvalid)
         , .M2_AWREADY           (s_axi_confmc_awready)
         , .M2_WDATA             (s_axi_confmc_wdata  )
         , .M2_WSTRB             (s_axi_confmc_wstrb  )
         , .M2_WLAST             (s_axi_confmc_wlast  )
         , .M2_WVALID            (s_axi_confmc_wvalid )
         , .M2_WREADY            (s_axi_confmc_wready )
         , .M2_BID               (s_axi_confmc_bid    )
         , .M2_BRESP             (s_axi_confmc_bresp  )
         , .M2_BVALID            (s_axi_confmc_bvalid )
         , .M2_BREADY            (s_axi_confmc_bready )
         , .M2_ARID              (s_axi_confmc_arid   )
         , .M2_ARADDR            (s_axi_confmc_araddr )
         , .M2_ARLEN             (s_axi_confmc_arlen  )
         , .M2_ARLOCK            (1'b0              )
         , .M2_ARSIZE            (s_axi_confmc_arsize )
         , .M2_ARBURST           (s_axi_confmc_arburst)
         , .M2_ARVALID           (s_axi_confmc_arvalid)
         , .M2_ARREADY           (s_axi_confmc_arready)
         , .M2_RID               (s_axi_confmc_rid    )
         , .M2_RDATA             (s_axi_confmc_rdata  )
         , .M2_RRESP             (s_axi_confmc_rresp  )
         , .M2_RLAST             (s_axi_confmc_rlast  )
         , .M2_RVALID            (s_axi_confmc_rvalid )
         , .M2_RREADY            (s_axi_confmc_rready )
         , .S0_AWID              (axi_bus_awid    [0])
         , .S0_AWADDR            (axi_bus_awaddr  [0])
         , .S0_AWLEN             (axi_bus_awlen   [0])
         , .S0_AWLOCK            (                   )
         , .S0_AWSIZE            (axi_bus_awsize  [0])
         , .S0_AWBURST           (axi_bus_awburst [0])
         , .S0_AWVALID           (axi_bus_awvalid [0])
         , .S0_AWREADY           (axi_bus_awready [0])
         , .S0_WDATA             (axi_bus_wdata   [0])
         , .S0_WSTRB             (axi_bus_wstrb   [0])
         , .S0_WLAST             (axi_bus_wlast   [0])
         , .S0_WVALID            (axi_bus_wvalid  [0])
         , .S0_WREADY            (axi_bus_wready  [0])
         , .S0_BID               (axi_bus_bid     [0])
         , .S0_BRESP             (axi_bus_bresp   [0])
         , .S0_BVALID            (axi_bus_bvalid  [0])
         , .S0_BREADY            (axi_bus_bready  [0])
         , .S0_ARID              (axi_bus_arid    [0])
         , .S0_ARADDR            (axi_bus_araddr  [0])
         , .S0_ARLEN             (axi_bus_arlen   [0])
         , .S0_ARLOCK            (                   )
         , .S0_ARSIZE            (axi_bus_arsize  [0])
         , .S0_ARBURST           (axi_bus_arburst [0])
         , .S0_ARVALID           (axi_bus_arvalid [0])
         , .S0_ARREADY           (axi_bus_arready [0])
         , .S0_RID               (axi_bus_rid     [0])
         , .S0_RDATA             (axi_bus_rdata   [0])
         , .S0_RRESP             (axi_bus_rresp   [0])
         , .S0_RLAST             (axi_bus_rlast   [0])
         , .S0_RVALID            (axi_bus_rvalid  [0])
         , .S0_RREADY            (axi_bus_rready  [0])
         , .S1_AWID              (axi_bus_awid    [1])
         , .S1_AWADDR            (axi_bus_awaddr  [1])
         , .S1_AWLEN             (axi_bus_awlen   [1])
         , .S1_AWLOCK            (                   )
         , .S1_AWSIZE            (axi_bus_awsize  [1])
         , .S1_AWBURST           (axi_bus_awburst [1])
         , .S1_AWVALID           (axi_bus_awvalid [1])
         , .S1_AWREADY           (axi_bus_awready [1])
         , .S1_WDATA             (axi_bus_wdata   [1])
         , .S1_WSTRB             (axi_bus_wstrb   [1])
         , .S1_WLAST             (axi_bus_wlast   [1])
         , .S1_WVALID            (axi_bus_wvalid  [1])
         , .S1_WREADY            (axi_bus_wready  [1])
         , .S1_BID               (axi_bus_bid     [1])
         , .S1_BRESP             (axi_bus_bresp   [1])
         , .S1_BVALID            (axi_bus_bvalid  [1])
         , .S1_BREADY            (axi_bus_bready  [1])
         , .S1_ARID              (axi_bus_arid    [1])
         , .S1_ARADDR            (axi_bus_araddr  [1])
         , .S1_ARLEN             (axi_bus_arlen   [1])
         , .S1_ARLOCK            (                   )
         , .S1_ARSIZE            (axi_bus_arsize  [1])
         , .S1_ARBURST           (axi_bus_arburst [1])
         , .S1_ARVALID           (axi_bus_arvalid [1])
         , .S1_ARREADY           (axi_bus_arready [1])
         , .S1_RID               (axi_bus_rid     [1])
         , .S1_RDATA             (axi_bus_rdata   [1])
         , .S1_RRESP             (axi_bus_rresp   [1])
         , .S1_RLAST             (axi_bus_rlast   [1])
         , .S1_RVALID            (axi_bus_rvalid  [1])
         , .S1_RREADY            (axi_bus_rready  [1])
         , .S2_AWID              (m_axi_mem_awid   )
         , .S2_AWADDR            (m_axi_mem_awaddr )
         , .S2_AWLEN             (m_axi_mem_awlen  )
         , .S2_AWLOCK            (                 )
         , .S2_AWSIZE            (m_axi_mem_awsize )
         , .S2_AWBURST           (m_axi_mem_awburst)
         , .S2_AWVALID           (m_axi_mem_awvalid)
         , .S2_AWREADY           (m_axi_mem_awready)
         , .S2_WDATA             (m_axi_mem_wdata  )
         , .S2_WSTRB             (m_axi_mem_wstrb  )
         , .S2_WLAST             (m_axi_mem_wlast  )
         , .S2_WVALID            (m_axi_mem_wvalid )
         , .S2_WREADY            (m_axi_mem_wready )
         , .S2_BID               (m_axi_mem_bid    )
         , .S2_BRESP             (m_axi_mem_bresp  )
         , .S2_BVALID            (m_axi_mem_bvalid )
         , .S2_BREADY            (m_axi_mem_bready )
         , .S2_ARID              (m_axi_mem_arid   )
         , .S2_ARADDR            (m_axi_mem_araddr )
         , .S2_ARLEN             (m_axi_mem_arlen  )
         , .S2_ARLOCK            (                 )
         , .S2_ARSIZE            (m_axi_mem_arsize )
         , .S2_ARBURST           (m_axi_mem_arburst)
         , .S2_ARVALID           (m_axi_mem_arvalid)
         , .S2_ARREADY           (m_axi_mem_arready)
         , .S2_RID               (m_axi_mem_rid    )
         , .S2_RDATA             (m_axi_mem_rdata  )
         , .S2_RRESP             (m_axi_mem_rresp  )
         , .S2_RLAST             (m_axi_mem_rlast  )
         , .S2_RVALID            (m_axi_mem_rvalid )
         , .S2_RREADY            (m_axi_mem_rready )
    );
    //--------------------------------------------------------------------------
    // on-chip memory
    mem_axi #(.AXI_WIDTH_ID   (AXI_WIDTH_SID  )
             ,.AXI_WIDTH_ADDR (AXI_WIDTH_ADDR )
             ,.AXI_WIDTH_DATA (AXI_WIDTH_DATA )
             ,.AXI_WIDTH_STRB (AXI_WIDTH_STRB )
             ,.P_SIZE_IN_BYTES(MEM_ONCHIP_SIZE))
    u_mem_axi (
          .axi_aresetn   ( axi_aresetn        )
        , .axi_aclk      ( axi_aclk           )
        , .s_axi_awid    ( axi_bus_awid    [0])
        , .s_axi_awaddr  ( axi_bus_awaddr  [0])
        , .s_axi_awlen   ( axi_bus_awlen   [0])
        , .s_axi_awsize  ( axi_bus_awsize  [0])
        , .s_axi_awburst ( axi_bus_awburst [0])
        , .s_axi_awvalid ( axi_bus_awvalid [0])
        , .s_axi_awready ( axi_bus_awready [0])
      //, .s_axi_wid     ( axi_bus_wid     [0])
        , .s_axi_wdata   ( axi_bus_wdata   [0])
        , .s_axi_wstrb   ( axi_bus_wstrb   [0])
        , .s_axi_wlast   ( axi_bus_wlast   [0])
        , .s_axi_wvalid  ( axi_bus_wvalid  [0])
        , .s_axi_wready  ( axi_bus_wready  [0])
        , .s_axi_bid     ( axi_bus_bid     [0])
        , .s_axi_bresp   ( axi_bus_bresp   [0])
        , .s_axi_bvalid  ( axi_bus_bvalid  [0])
        , .s_axi_bready  ( axi_bus_bready  [0])
        , .s_axi_arid    ( axi_bus_arid    [0])
        , .s_axi_araddr  ( axi_bus_araddr  [0])
        , .s_axi_arlen   ( axi_bus_arlen   [0])
        , .s_axi_arsize  ( axi_bus_arsize  [0])
        , .s_axi_arburst ( axi_bus_arburst [0])
        , .s_axi_arvalid ( axi_bus_arvalid [0])
        , .s_axi_arready ( axi_bus_arready [0])
        , .s_axi_rid     ( axi_bus_rid     [0])
        , .s_axi_rdata   ( axi_bus_rdata   [0])
        , .s_axi_rresp   ( axi_bus_rresp   [0])
        , .s_axi_rlast   ( axi_bus_rlast   [0])
        , .s_axi_rvalid  ( axi_bus_rvalid  [0])
        , .s_axi_rready  ( axi_bus_rready  [0])
    );
  //reg [AXI_WIDTH_SID-1:0]  reg_wid0='h0;
  //always @ ( posedge axi_aclk ) begin
  //    if (axi_bus_awvalid[0]&axi_bus_awready[0]) reg_wid0 <= axi_bus_awid[0];
  //end
  //assign axi_bus_wid[0]=(axi_bus_awvalid[0]) ? axi_bus_awid[0] : reg_wid0;
    //--------------------------------------------------------------------------
    wire [31:0] axi_lite_awaddr [0:4];
    wire        axi_lite_awvalid[0:4];
    wire        axi_lite_awready[0:4];
    wire [31:0] axi_lite_wdata  [0:4];
    wire        axi_lite_wvalid [0:4];
    wire        axi_lite_wready [0:4];
    wire [ 1:0] axi_lite_bresp  [0:4];
    wire        axi_lite_bvalid [0:4];
    wire        axi_lite_bready [0:4];
    wire [31:0] axi_lite_araddr [0:4];
    wire        axi_lite_arvalid[0:4];
    wire        axi_lite_arready[0:4];
    wire [31:0] axi_lite_rdata  [0:4];
    wire [ 1:0] axi_lite_rresp  [0:4];
    wire        axi_lite_rvalid [0:4];
    wire        axi_lite_rready [0:4];
    //--------------------------------------------------------------------------
    axi4_to_lite #(.AXI_WIDTH_ID  (AXI_WIDTH_SID )
                  ,.AXI_WIDTH_ADDR(AXI_WIDTH_ADDR)
                  ,.AXI_WIDTH_DATA(AXI_WIDTH_DATA))
    u_axi4_to_lite (
          .axi_aresetn     ( axi_aresetn        )
        , .axi_aclk        ( axi_aclk           )
        , .s_axi_awid      ( axi_bus_awid    [1])
        , .s_axi_awaddr    ( axi_bus_awaddr  [1])
        , .s_axi_awlen     ( axi_bus_awlen   [1])
        , .s_axi_awsize    ( axi_bus_awsize  [1])
        , .s_axi_awburst   ( axi_bus_awburst [1])
        , .s_axi_awvalid   ( axi_bus_awvalid [1])
        , .s_axi_awready   ( axi_bus_awready [1])
      //, .s_axi_wid       ( axi_bus_wid     [1])
        , .s_axi_wdata     ( axi_bus_wdata   [1])
        , .s_axi_wstrb     ( axi_bus_wstrb   [1])
        , .s_axi_wlast     ( axi_bus_wlast   [1])
        , .s_axi_wvalid    ( axi_bus_wvalid  [1])
        , .s_axi_wready    ( axi_bus_wready  [1])
        , .s_axi_bid       ( axi_bus_bid     [1])
        , .s_axi_bresp     ( axi_bus_bresp   [1])
        , .s_axi_bvalid    ( axi_bus_bvalid  [1])
        , .s_axi_bready    ( axi_bus_bready  [1])
        , .s_axi_arid      ( axi_bus_arid    [1])
        , .s_axi_araddr    ( axi_bus_araddr  [1])
        , .s_axi_arlen     ( axi_bus_arlen   [1])
        , .s_axi_arsize    ( axi_bus_arsize  [1])
        , .s_axi_arburst   ( axi_bus_arburst [1])
        , .s_axi_arvalid   ( axi_bus_arvalid [1])
        , .s_axi_arready   ( axi_bus_arready [1])
        , .s_axi_rid       ( axi_bus_rid     [1])
        , .s_axi_rdata     ( axi_bus_rdata   [1])
        , .s_axi_rresp     ( axi_bus_rresp   [1])
        , .s_axi_rlast     ( axi_bus_rlast   [1])
        , .s_axi_rvalid    ( axi_bus_rvalid  [1])
        , .s_axi_rready    ( axi_bus_rready  [1])
        , .m_axil_awaddr   ( axi_lite_awaddr [0])
        , .m_axil_awvalid  ( axi_lite_awvalid[0])
        , .m_axil_awready  ( axi_lite_awready[0])
        , .m_axil_wdata    ( axi_lite_wdata  [0])
        , .m_axil_wvalid   ( axi_lite_wvalid [0])
        , .m_axil_wready   ( axi_lite_wready [0])
        , .m_axil_bresp    ( axi_lite_bresp  [0])
        , .m_axil_bvalid   ( axi_lite_bvalid [0])
        , .m_axil_bready   ( axi_lite_bready [0])
        , .m_axil_araddr   ( axi_lite_araddr [0])
        , .m_axil_arvalid  ( axi_lite_arvalid[0])
        , .m_axil_arready  ( axi_lite_arready[0])
        , .m_axil_rdata    ( axi_lite_rdata  [0])
        , .m_axil_rresp    ( axi_lite_rresp  [0])
        , .m_axil_rvalid   ( axi_lite_rvalid [0])
        , .m_axil_rready   ( axi_lite_rready [0])
    );
  //reg [AXI_WIDTH_SID-1:0]  reg_wid1='h0;
  //always @ ( posedge axi_aclk ) begin
  //    if (axi_bus_awvalid[1]&axi_bus_awready[1]) reg_wid1 <= axi_bus_awid[1];
  //end
  //assign axi_bus_wid[1]=(axi_bus_awvalid[1]) ? axi_bus_awid[1] : reg_wid1;
    //--------------------------------------------------------------------------
    amba_axi_lite_m4 #(.P0_ADDR_START(ADDR_PIC  )
                      ,.P1_ADDR_START(ADDR_TIMER)
                      ,.P2_ADDR_START(ADDR_UART )
                      ,.P3_ADDR_START(ADDR_GPIO )
                      ,.P0_SIZE      (SIZE_PIC  )
                      ,.P1_SIZE      (SIZE_TIMER)
                      ,.P2_SIZE      (SIZE_UART )
                      ,.P3_SIZE      (SIZE_GPIO ))
    u_axi_lite_bus (
          .axi_lite_aresetn    ( axi_aresetn )
        , .axi_lite_aclk       ( axi_aclk    )
        , .s_axi_lite_awaddr   ( axi_lite_awaddr [0])
        , .s_axi_lite_awvalid  ( axi_lite_awvalid[0])
        , .s_axi_lite_awready  ( axi_lite_awready[0])
        , .s_axi_lite_wdata    ( axi_lite_wdata  [0])
        , .s_axi_lite_wvalid   ( axi_lite_wvalid [0])
        , .s_axi_lite_wready   ( axi_lite_wready [0])
        , .s_axi_lite_bresp    ( axi_lite_bresp  [0])
        , .s_axi_lite_bvalid   ( axi_lite_bvalid [0])
        , .s_axi_lite_bready   ( axi_lite_bready [0])
        , .s_axi_lite_araddr   ( axi_lite_araddr [0])
        , .s_axi_lite_arvalid  ( axi_lite_arvalid[0])
        , .s_axi_lite_arready  ( axi_lite_arready[0])
        , .s_axi_lite_rdata    ( axi_lite_rdata  [0])
        , .s_axi_lite_rresp    ( axi_lite_rresp  [0])
        , .s_axi_lite_rvalid   ( axi_lite_rvalid [0])
        , .s_axi_lite_rready   ( axi_lite_rready [0])
        , .m0_axi_lite_awaddr  ( axi_lite_awaddr [1])
        , .m0_axi_lite_awvalid ( axi_lite_awvalid[1])
        , .m0_axi_lite_awready ( axi_lite_awready[1])
        , .m0_axi_lite_wdata   ( axi_lite_wdata  [1])
        , .m0_axi_lite_wvalid  ( axi_lite_wvalid [1])
        , .m0_axi_lite_wready  ( axi_lite_wready [1])
        , .m0_axi_lite_bresp   ( axi_lite_bresp  [1])
        , .m0_axi_lite_bvalid  ( axi_lite_bvalid [1])
        , .m0_axi_lite_bready  ( axi_lite_bready [1])
        , .m0_axi_lite_araddr  ( axi_lite_araddr [1])
        , .m0_axi_lite_arvalid ( axi_lite_arvalid[1])
        , .m0_axi_lite_arready ( axi_lite_arready[1])
        , .m0_axi_lite_rdata   ( axi_lite_rdata  [1])
        , .m0_axi_lite_rresp   ( axi_lite_rresp  [1])
        , .m0_axi_lite_rvalid  ( axi_lite_rvalid [1])
        , .m0_axi_lite_rready  ( axi_lite_rready [1])
        , .m1_axi_lite_awaddr  ( axi_lite_awaddr [2])
        , .m1_axi_lite_awvalid ( axi_lite_awvalid[2])
        , .m1_axi_lite_awready ( axi_lite_awready[2])
        , .m1_axi_lite_wdata   ( axi_lite_wdata  [2])
        , .m1_axi_lite_wvalid  ( axi_lite_wvalid [2])
        , .m1_axi_lite_wready  ( axi_lite_wready [2])
        , .m1_axi_lite_bresp   ( axi_lite_bresp  [2])
        , .m1_axi_lite_bvalid  ( axi_lite_bvalid [2])
        , .m1_axi_lite_bready  ( axi_lite_bready [2])
        , .m1_axi_lite_araddr  ( axi_lite_araddr [2])
        , .m1_axi_lite_arvalid ( axi_lite_arvalid[2])
        , .m1_axi_lite_arready ( axi_lite_arready[2])
        , .m1_axi_lite_rdata   ( axi_lite_rdata  [2])
        , .m1_axi_lite_rresp   ( axi_lite_rresp  [2])
        , .m1_axi_lite_rvalid  ( axi_lite_rvalid [2])
        , .m1_axi_lite_rready  ( axi_lite_rready [2])
        , .m2_axi_lite_awaddr  ( axi_lite_awaddr [3])
        , .m2_axi_lite_awvalid ( axi_lite_awvalid[3])
        , .m2_axi_lite_awready ( axi_lite_awready[3])
        , .m2_axi_lite_wdata   ( axi_lite_wdata  [3])
        , .m2_axi_lite_wvalid  ( axi_lite_wvalid [3])
        , .m2_axi_lite_wready  ( axi_lite_wready [3])
        , .m2_axi_lite_bresp   ( axi_lite_bresp  [3])
        , .m2_axi_lite_bvalid  ( axi_lite_bvalid [3])
        , .m2_axi_lite_bready  ( axi_lite_bready [3])
        , .m2_axi_lite_araddr  ( axi_lite_araddr [3])
        , .m2_axi_lite_arvalid ( axi_lite_arvalid[3])
        , .m2_axi_lite_arready ( axi_lite_arready[3])
        , .m2_axi_lite_rdata   ( axi_lite_rdata  [3])
        , .m2_axi_lite_rresp   ( axi_lite_rresp  [3])
        , .m2_axi_lite_rvalid  ( axi_lite_rvalid [3])
        , .m2_axi_lite_rready  ( axi_lite_rready [3])
        , .m3_axi_lite_awaddr  ( axi_lite_awaddr [4])
        , .m3_axi_lite_awvalid ( axi_lite_awvalid[4])
        , .m3_axi_lite_awready ( axi_lite_awready[4])
        , .m3_axi_lite_wdata   ( axi_lite_wdata  [4])
        , .m3_axi_lite_wvalid  ( axi_lite_wvalid [4])
        , .m3_axi_lite_wready  ( axi_lite_wready [4])
        , .m3_axi_lite_bresp   ( axi_lite_bresp  [4])
        , .m3_axi_lite_bvalid  ( axi_lite_bvalid [4])
        , .m3_axi_lite_bready  ( axi_lite_bready [4])
        , .m3_axi_lite_araddr  ( axi_lite_araddr [4])
        , .m3_axi_lite_arvalid ( axi_lite_arvalid[4])
        , .m3_axi_lite_arready ( axi_lite_arready[4])
        , .m3_axi_lite_rdata   ( axi_lite_rdata  [4])
        , .m3_axi_lite_rresp   ( axi_lite_rresp  [4])
        , .m3_axi_lite_rvalid  ( axi_lite_rvalid [4])
        , .m3_axi_lite_rready  ( axi_lite_rready [4])
    );
    //--------------------------------------------------------------------------
    wire [NUM_IRQ-1:0] irq;
    //--------------------------------------------------------------------------
    pic_axi_lite #(.NUM_IRQ(NUM_IRQ))
    u_pic (
          .aresetn       ( axi_aresetn        )
        , .aclk          ( axi_aclk           )
        , .s_axi_awaddr  ( axi_lite_awaddr [1])
        , .s_axi_awvalid ( axi_lite_awvalid[1])
        , .s_axi_awready ( axi_lite_awready[1])
        , .s_axi_wdata   ( axi_lite_wdata  [1])
        , .s_axi_wvalid  ( axi_lite_wvalid [1])
        , .s_axi_wready  ( axi_lite_wready [1])
        , .s_axi_bresp   ( axi_lite_bresp  [1])
        , .s_axi_bvalid  ( axi_lite_bvalid [1])
        , .s_axi_bready  ( axi_lite_bready [1])
        , .s_axi_araddr  ( axi_lite_araddr [1])
        , .s_axi_arvalid ( axi_lite_arvalid[1])
        , .s_axi_arready ( axi_lite_arready[1])
        , .s_axi_rdata   ( axi_lite_rdata  [1])
        , .s_axi_rresp   ( axi_lite_rresp  [1])
        , .s_axi_rvalid  ( axi_lite_rvalid [1])
        , .s_axi_rready  ( axi_lite_rready [1])
        , .irq_in        ( irq            )
        , .interrupt     ( interrupt_core )
    );
    //--------------------------------------------------------------------------
    timer_axi_lite #(.CLK_FREQ(ACLK_FREQ))
    u_timer (
          .aresetn       ( axi_aresetn        )
        , .aclk          ( axi_aclk           )
        , .s_axi_awaddr  ( axi_lite_awaddr [2])
        , .s_axi_awvalid ( axi_lite_awvalid[2])
        , .s_axi_awready ( axi_lite_awready[2])
        , .s_axi_wdata   ( axi_lite_wdata  [2])
        , .s_axi_wvalid  ( axi_lite_wvalid [2])
        , .s_axi_wready  ( axi_lite_wready [2])
        , .s_axi_bresp   ( axi_lite_bresp  [2])
        , .s_axi_bvalid  ( axi_lite_bvalid [2])
        , .s_axi_bready  ( axi_lite_bready [2])
        , .s_axi_araddr  ( axi_lite_araddr [2])
        , .s_axi_arvalid ( axi_lite_arvalid[2])
        , .s_axi_arready ( axi_lite_arready[2])
        , .s_axi_rdata   ( axi_lite_rdata  [2])
        , .s_axi_rresp   ( axi_lite_rresp  [2])
        , .s_axi_rvalid  ( axi_lite_rvalid [2])
        , .s_axi_rready  ( axi_lite_rready [2])
        , .interrupt     ( irq[IRQ_TIMER])
    );
    //--------------------------------------------------------------------------
    uart_axi_lite #(.BAUD_RATE(BAUD_RATE),.CLK_FREQ(ACLK_FREQ))
    u_uart (
          .aresetn       ( axi_aresetn        )
        , .aclk          ( axi_aclk           )
        , .s_axi_awaddr  ( axi_lite_awaddr [3])
        , .s_axi_awvalid ( axi_lite_awvalid[3])
        , .s_axi_awready ( axi_lite_awready[3])
        , .s_axi_wdata   ( axi_lite_wdata  [3])
        , .s_axi_wvalid  ( axi_lite_wvalid [3])
        , .s_axi_wready  ( axi_lite_wready [3])
        , .s_axi_bresp   ( axi_lite_bresp  [3])
        , .s_axi_bvalid  ( axi_lite_bvalid [3])
        , .s_axi_bready  ( axi_lite_bready [3])
        , .s_axi_araddr  ( axi_lite_araddr [3])
        , .s_axi_arvalid ( axi_lite_arvalid[3])
        , .s_axi_arready ( axi_lite_arready[3])
        , .s_axi_rdata   ( axi_lite_rdata  [3])
        , .s_axi_rresp   ( axi_lite_rresp  [3])
        , .s_axi_rvalid  ( axi_lite_rvalid [3])
        , .s_axi_rready  ( axi_lite_rready [3])
        , .uart_tx       ( uart_txd       )
        , .uart_rx       ( uart_rxdd      )
        , .uart_rts_n    ( uart_rts_n     )
        , .uart_cts_n    ( uart_cts_n     )
        , .interrupt     ( irq[IRQ_UART])
    );
    //--------------------------------------------------------------------------
    gpio_axi_lite #(.P_WIDTH(8))
    u_gpio (
          .aresetn       ( axi_aresetn        )
        , .aclk          ( axi_aclk           )
        , .s_axi_lite_awaddr  ( axi_lite_awaddr [4])
        , .s_axi_lite_awvalid ( axi_lite_awvalid[4])
        , .s_axi_lite_awready ( axi_lite_awready[4])
        , .s_axi_lite_wdata   ( axi_lite_wdata  [4])
        , .s_axi_lite_wvalid  ( axi_lite_wvalid [4])
        , .s_axi_lite_wready  ( axi_lite_wready [4])
        , .s_axi_lite_bresp   ( axi_lite_bresp  [4])
        , .s_axi_lite_bvalid  ( axi_lite_bvalid [4])
        , .s_axi_lite_bready  ( axi_lite_bready [4])
        , .s_axi_lite_araddr  ( axi_lite_araddr [4])
        , .s_axi_lite_arvalid ( axi_lite_arvalid[4])
        , .s_axi_lite_arready ( axi_lite_arready[4])
        , .s_axi_lite_rdata   ( axi_lite_rdata  [4])
        , .s_axi_lite_rresp   ( axi_lite_rresp  [4])
        , .s_axi_lite_rvalid  ( axi_lite_rvalid [4])
        , .s_axi_lite_rready  ( axi_lite_rready [4])
        , .gpio_in       ( gpio_in           )  // GPIO input
        , .gpio_out      ( gpio_out          )  // GPIO output
        , .gpio_dir      ( gpio_dir          )  // GPIO direction
        , .interrupt     ( irq[IRQ_GPIO]     )
    );
    //--------------------------------------------------------------------------
    // Keypad Column/Row assignment (connected to GPIO for software control)
    // Software can control keypad through GPIO registers
    // Alternatively, connect directly for dedicated keypad interface
    assign keypad_col = gpio_out[3:0];  // Lower 4 bits of GPIO output -> Keypad columns
    // Note: Software should read keypad_row separately if needed
    // For now, keypad_row is independent input (not connected to GPIO)
    //--------------------------------------------------------------------------
endmodule
