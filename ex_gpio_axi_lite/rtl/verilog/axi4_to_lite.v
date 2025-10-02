//------------------------------------------------------------------------------
//  Copyright (c) 2024-2025 by Future Design Systems.
//  http://www.future-ds.com
//------------------------------------------------------------------------------
// axi4_to_lite.v
//------------------------------------------------------------------------------
// VERSION: 2025.03.01.
//------------------------------------------------------------------------------
// Limitation:
//   AXI-Lite address and data width must be 32-bit.
//   AXI4 must uses 4-byte incremental single-burst, AXI4 responds DECERR if not.
//------------------------------------------------------------------------------
// PARAMETERS:
//   AXI_WIDTH_ID  : ID width
//   AXI_WIDTH_ADDR: Address width
//   AXI_WIDTH_DATA: Data width
//   AXI_WIDTH_STRB: Strobe width
//------------------------------------------------------------------------------
`ifndef AXI_WIDTH_DATA
`define AXI_WIDTH_DATA   32
`endif

module axi4_to_lite
     #(parameter integer AXI_WIDTH_ID  =4
      ,parameter integer AXI_WIDTH_ADDR=32
      ,parameter integer AXI_WIDTH_DATA=`AXI_WIDTH_DATA
      ,parameter integer AXI_WIDTH_STRB=(AXI_WIDTH_DATA/8))
(
    (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 axi_aresetn RST"  *) input  wire                      axi_aresetn,
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF s_axi, ASSOCIATED_RESET axi_aresetn" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 axi_aclk CLK"     *) input  wire                      axi_aclk,
`ifndef __ICARUS__
    (* X_INTERFACE_PARAMETER = "CLK_DOMAIN axi_aclk,\
                                RUSER_WIDTH 0,WUSER_WIDTH 0,ARUSER_WIDTH 0,AWUSER_WIDTH 0,\
                                HAS_CACHE 0,HAS_LOCK 0,HAS_PROT 0,HAS_QOS 0,HAS_REGION 0" *)
`endif
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWID"    *) input  wire [AXI_WIDTH_ID-1:0]   s_axi_awid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWADDR"  *) input  wire [AXI_WIDTH_ADDR-1:0] s_axi_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWLEN"   *) input  wire [ 7:0]               s_axi_awlen,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWSIZE"  *) input  wire [ 2:0]               s_axi_awsize,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWBURST" *) input  wire [ 1:0]               s_axi_awburst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWVALID" *) input  wire                      s_axi_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWREADY" *) output wire                      s_axi_awready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WDATA"   *) input  wire [AXI_WIDTH_DATA-1:0] s_axi_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WSTRB"   *) input  wire [AXI_WIDTH_STRB-1:0] s_axi_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WLAST"   *) input  wire                      s_axi_wlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WVALID"  *) input  wire                      s_axi_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WREADY"  *) output wire                      s_axi_wready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BID"     *) output wire [AXI_WIDTH_ID-1:0]   s_axi_bid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BRESP"   *) output wire [ 1:0]               s_axi_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BVALID"  *) output wire                      s_axi_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BREADY"  *) input  wire                      s_axi_bready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARID"    *) input  wire [AXI_WIDTH_ID-1:0]   s_axi_arid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARADDR"  *) input  wire [AXI_WIDTH_ADDR-1:0] s_axi_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARLEN"   *) input  wire [ 7:0]               s_axi_arlen,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARSIZE"  *) input  wire [ 2:0]               s_axi_arsize,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARBURST" *) input  wire [ 1:0]               s_axi_arburst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARVALID" *) input  wire                      s_axi_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARREADY" *) output wire                      s_axi_arready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RID"     *) output wire [AXI_WIDTH_ID-1:0]   s_axi_rid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RDATA"   *) output wire [AXI_WIDTH_DATA-1:0] s_axi_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RRESP"   *) output wire [ 1:0]               s_axi_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RLAST"   *) output wire                      s_axi_rlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RVALID"  *) output wire                      s_axi_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RREADY"  *) input  wire                      s_axi_rready,
    
    (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 axil_aresetn RST"  *) input  wire        axil_aresetn,
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF m_axil, ASSOCIATED_RESET axil_aresetn" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 axil_aclk CLK"     *) input  wire        axil_aclk,
`ifndef __ICARUS__
    (* X_INTERFACE_PARAMETER = "CLK_DOMAIN axil_aclk,\
                                RUSER_WIDTH 0,WUSER_WIDTH 0,ARUSER_WIDTH 0,AWUSER_WIDTH 0,\
                                ADDR_WIDTH 32,ID_WIDTH 0,DATA_WIDTH 32,HAS_BURST 0,HAS_CACHE 0,HAS_LOCK 0,\
                                HAS_PROT 0,HAS_QOS 0,HAS_REGION 0,HAS_WSTRB 0,HAS_BRESP 1,HAS_RRESP 1" *)
`endif
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axil AWADDR"  *) output wire [31:0] m_axil_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axil AWVALID" *) output wire        m_axil_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axil AWREADY" *) input  wire        m_axil_awready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axil WDATA"   *) output wire [31:0] m_axil_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axil WVALID"  *) output wire        m_axil_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axil WREADY"  *) input  wire        m_axil_wready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axil BRESP"   *) input  wire [ 1:0] m_axil_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axil BVALID"  *) input  wire        m_axil_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axil BREADY"  *) output wire        m_axil_bready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axil ARADDR"  *) output wire [31:0] m_axil_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axil ARVALID" *) output wire        m_axil_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axil ARREADY" *) input  wire        m_axil_arready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axil RDATA"   *) input  wire [31:0] m_axil_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axil RRESP"   *) input  wire [ 1:0] m_axil_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axil RVALID"  *) input  wire        m_axil_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axil RREADY"  *) output wire        m_axil_rready
);
    //--------------------------------------------------------------------------
    axi4_to_lite_write #(.AXI_WIDTH_ID  (AXI_WIDTH_ID  )
                        ,.AXI_WIDTH_ADDR(AXI_WIDTH_ADDR)
                        ,.AXI_WIDTH_DATA(AXI_WIDTH_DATA))
    u_write (
          .axi_aresetn    ( axi_aresetn    )
        , .axi_aclk       ( axi_aclk       )
        , .s_axi_awid     ( s_axi_awid     )
        , .s_axi_awaddr   ( s_axi_awaddr   )
        , .s_axi_awlen    ( s_axi_awlen    )
        , .s_axi_awsize   ( s_axi_awsize   )
        , .s_axi_awburst  ( s_axi_awburst  )
        , .s_axi_awvalid  ( s_axi_awvalid  )
        , .s_axi_awready  ( s_axi_awready  )
        , .s_axi_wdata    ( s_axi_wdata    )
        , .s_axi_wstrb    ( s_axi_wstrb    )
        , .s_axi_wlast    ( s_axi_wlast    )
        , .s_axi_wvalid   ( s_axi_wvalid   )
        , .s_axi_wready   ( s_axi_wready   )
        , .s_axi_bid      ( s_axi_bid      )
        , .s_axi_bresp    ( s_axi_bresp    )
        , .s_axi_bvalid   ( s_axi_bvalid   )
        , .s_axi_bready   ( s_axi_bready   )
        , .axil_aresetn   ( axil_aresetn   )
        , .axil_aclk      ( axil_aclk      )
        , .m_axil_awaddr  ( m_axil_awaddr  )
        , .m_axil_awvalid ( m_axil_awvalid )
        , .m_axil_awready ( m_axil_awready )
        , .m_axil_wdata   ( m_axil_wdata   )
        , .m_axil_wvalid  ( m_axil_wvalid  )
        , .m_axil_wready  ( m_axil_wready  )
        , .m_axil_bresp   ( m_axil_bresp   )
        , .m_axil_bvalid  ( m_axil_bvalid  )
        , .m_axil_bready  ( m_axil_bready  )
    );
    //--------------------------------------------------------------------------
    axi4_to_lite_read #(.AXI_WIDTH_ID  (AXI_WIDTH_ID  )
                       ,.AXI_WIDTH_ADDR(AXI_WIDTH_ADDR)
                       ,.AXI_WIDTH_DATA(AXI_WIDTH_DATA))
    u_read (
          .axi_aresetn    ( axi_aresetn    )
        , .axi_aclk       ( axi_aclk       )
        , .s_axi_arid     ( s_axi_arid     )
        , .s_axi_araddr   ( s_axi_araddr   )
        , .s_axi_arlen    ( s_axi_arlen    )
        , .s_axi_arsize   ( s_axi_arsize   )
        , .s_axi_arburst  ( s_axi_arburst  )
        , .s_axi_arvalid  ( s_axi_arvalid  )
        , .s_axi_arready  ( s_axi_arready  )
        , .s_axi_rid      ( s_axi_rid      )
        , .s_axi_rdata    ( s_axi_rdata    )
        , .s_axi_rresp    ( s_axi_rresp    )
        , .s_axi_rlast    ( s_axi_rlast    )
        , .s_axi_rvalid   ( s_axi_rvalid   )
        , .s_axi_rready   ( s_axi_rready   )
        , .axil_aresetn   ( axil_aresetn   )
        , .axil_aclk      ( axil_aclk      )
        , .m_axil_araddr  ( m_axil_araddr  )
        , .m_axil_arvalid ( m_axil_arvalid )
        , .m_axil_arready ( m_axil_arready )
        , .m_axil_rdata   ( m_axil_rdata   )
        , .m_axil_rresp   ( m_axil_rresp   )
        , .m_axil_rvalid  ( m_axil_rvalid  )
        , .m_axil_rready  ( m_axil_rready  )
    );
    //--------------------------------------------------------------------------
endmodule

//------------------------------------------------------------------------------
//                +----+     +----+
//                |    |     |    |
//                |    |     |    |
// AXI4 write ===>|    |====>|    |<==> AXI-Lite write
//                |    |     |    |
//                |    |     |    |
//                +----+     +----+
module axi4_to_lite_write
     #(parameter integer AXI_WIDTH_ID  =2
      ,parameter integer AXI_WIDTH_ADDR=32
      ,parameter integer AXI_WIDTH_DATA=32
      ,parameter integer AXI_WIDTH_STRB=(AXI_WIDTH_DATA/8)
      ,parameter integer AXI_WIDTH_DSB =$clog2(AXI_WIDTH_STRB))
(
      input  wire                      axi_aresetn
    , input  wire                      axi_aclk
    , input  wire [AXI_WIDTH_ID-1:0]   s_axi_awid
    , input  wire [AXI_WIDTH_ADDR-1:0] s_axi_awaddr
    , input  wire [ 7:0]               s_axi_awlen
    , input  wire [ 2:0]               s_axi_awsize
    , input  wire [ 1:0]               s_axi_awburst
    , input  wire                      s_axi_awvalid
    , output reg                       s_axi_awready
    , input  wire [AXI_WIDTH_DATA-1:0] s_axi_wdata
    , input  wire [AXI_WIDTH_STRB-1:0] s_axi_wstrb
    , input  wire                      s_axi_wlast
    , input  wire                      s_axi_wvalid
    , output reg                       s_axi_wready
    , output reg  [AXI_WIDTH_ID-1:0]   s_axi_bid
    , output reg  [ 1:0]               s_axi_bresp
    , output reg                       s_axi_bvalid
    , input  wire                      s_axi_bready
    
    , input  wire        axil_aresetn
    , input  wire        axil_aclk
    , output reg  [31:0] m_axil_awaddr
    , output reg         m_axil_awvalid
    , input  wire        m_axil_awready
    , output reg  [31:0] m_axil_wdata
    , output reg         m_axil_wvalid
    , input  wire        m_axil_wready
    , input  wire [ 1:0] m_axil_bresp
    , input  wire        m_axil_bvalid
    , output reg         m_axil_bready
);
    //--------------------------------------------------------------------------
    reg [AXI_WIDTH_ADDR-1:0] regAwaddr={AXI_WIDTH_ADDR{1'b0}};
    reg [ 7:0]               regAwlen=8'h0;
    reg [AXI_WIDTH_DATA-1:0] regWdata={AXI_WIDTH_DATA{1'b0}};
    //--------------------------------------------------------------------------
    reg [ 8:0]               cntWlen=9'h0;
    reg                      regGo=1'b0;
    reg                      regDone=1'b0;
    //--------------------------------------------------------------------------
    localparam NUM_DLY=3;
    reg [NUM_DLY-1:0] regGoDly={NUM_DLY{1'b0}};
    reg [NUM_DLY-1:0] regDoneDly={NUM_DLY{1'b0}};
    wire      syncRegGo=regGoDly[NUM_DLY-1];
    wire      syncRegDone=regDoneDly[NUM_DLY-1];
    integer idx, idy;
    always @ (posedge axil_aclk) begin
       regGoDly[0] <= regGo;
       for (idy=0; idy<NUM_DLY-1; idy=idy+1) begin
           regGoDly[idy+1] <= regGoDly[idy];
       end
    end
    always @ (posedge axi_aclk) begin
       regDoneDly[0] <= regDone;
       for (idx=0; idx<NUM_DLY-1; idx=idx+1) begin
           regDoneDly[idx+1] <= regDoneDly[idx];
       end
    end
    //--------------------------------------------------------------------------
    // This FSM pushes data into the FIFO.
    localparam ST_READY    ='h0
             , ST_DATA     ='h1
             , ST_WAIT     ='h2
             , ST_SKIP     ='h3
             , ST_RESP     ='h4;
    reg [2:0] state=ST_READY;
    //--------------------------------------------------------------------------
    // synthesis translate_off
    reg  [8*32-1:0] state_ascii = "ST_READY";
    always @ (state) begin
    case (state)
        ST_READY: state_ascii="ST_READY";
        ST_DATA : state_ascii="ST_DATA ";
        ST_WAIT : state_ascii="ST_WAIT ";
        ST_SKIP : state_ascii="ST_SKIP ";
        ST_RESP : state_ascii="ST_RESP ";
        default : state_ascii="ST_UNKNOWN";
    endcase
    end
    // synthesis translate_on
    //--------------------------------------------------------------------------
    always @ ( posedge axi_aclk or negedge axi_aresetn ) begin
    if (axi_aresetn==1'b0) begin
        s_axi_awready <= 1'b0;
        s_axi_wready  <= 1'b0;
        s_axi_bid     <= {AXI_WIDTH_ID{1'b0}};
        s_axi_bresp   <= 2'b00;
        s_axi_bvalid  <= 1'b0;
        regAwaddr     <= {AXI_WIDTH_ADDR{1'b0}};
        regAwlen      <= 8'h0;
        regWdata      <={AXI_WIDTH_DATA{1'b0}};
        cntWlen       <= 9'h0;
        regGo         <= 1'b0;
        state         <= ST_READY;
    end else begin
        case (state)
        ST_READY: begin
           s_axi_awready <= ~syncRegDone;
           if (s_axi_awvalid&s_axi_awready) begin
               s_axi_awready <= 1'b0;
               regAwaddr     <= s_axi_awaddr ;
               regAwlen      <= s_axi_awlen  ;
               cntWlen       <= 9'h0;
               s_axi_bid     <= s_axi_awid;
               if ((s_axi_awaddr[1:0]==2'b0)&&(s_axi_awlen==8'b000)&&
                   (s_axi_awsize==3'b010)&&(s_axi_awburst==2'b01)) begin
                   s_axi_bresp  <= 2'b00; // OKAY
                   s_axi_wready <= 1'b1;
                   state        <= ST_DATA;
               end else begin
                   s_axi_bresp  <= 2'b10; // SLVERR
                   s_axi_wready <= 1'b1;
                   state        <= ST_SKIP;
               end
               // synthesis translate_off
               if (s_axi_awaddr[1:0]!=2'b0) $display("%m ERROR not word-aligned write.");
               if (s_axi_awlen  !=8'b000) $display("%m ERROR not single data write.");
               if (s_axi_awsize !=3'b010) $display("%m ERROR not 32-bit data write.");
               if (s_axi_awburst!=2'b01 ) $display("%m ERROR not incremental write.");
               // synthesis translate_on
           end
           end // ST_READY
        ST_DATA: begin
           // only handle length 1
           if (s_axi_wvalid) begin
               s_axi_wready <= 1'b0;
               regWdata     <= s_axi_wdata;
               regGo        <= 1'b1;
               state        <= ST_WAIT;
               // synthesis translate_off
               if (s_axi_wlast==1'b0) $display("%m ERROR wlast expected.");
               if (AXI_WIDTH_DATA==32) begin
                   if (!(&s_axi_wstrb)) $display("%m ERROR wstrb");
               end else begin
                   if (!(&s_axi_wstrb[regAwaddr[AXI_WIDTH_DSB-1:2]*4+:4])) $display("%m ERROR wstrb");
               end
               // synthesis translate_on
           end
           end // ST_DATA
        ST_WAIT: begin
           if (syncRegDone==1'b1) begin
               regGo        <= 1'b0;
               s_axi_bvalid <= 1'b1;
               state        <= ST_RESP;
           end
           end // ST_WAIT
        ST_SKIP: begin
           if (s_axi_wvalid & s_axi_wready) begin
               cntWlen <= cntWlen + 1;
               if (regAwlen==cntWlen) begin
                   s_axi_wready <= 1'b0;
                   s_axi_bvalid <= 1'b1;
                   state        <= ST_RESP;
                   // synthesis translate_off
                   if (s_axi_wlast==1'b0) $display("%m ERROR WLAST expected.");
                   // synthesis translate_on
               end
               // synthesis translate_off
               else begin
                   if (s_axi_wlast==1'b1) $display("%m ERROR WLAST not expected.");
                end
               // synthesis translate_on
               // synthesis translate_off
               if (s_axi_wstrb!={AXI_WIDTH_STRB{1'b1}}) $display("%m ERROR partial write not supported.");
               // synthesis translate_on
           end
           end // ST_SKIP
        ST_RESP: begin
           if (s_axi_bready) begin
               s_axi_bvalid <= 1'b0;
               state        <= ST_READY;
           end
           end // ST_RESP
        default: begin
                 end
        endcase
    end // if
    end // always
    //--------------------------------------------------------------------------
    localparam STL_READY    ='h0
             , STL_ADDR     ='h1
             , STL_DATA     ='h2
             , STL_RESP     ='h3
             , STL_WAIT     ='h4;
    reg [2:0] state_lite=STL_READY;
    //--------------------------------------------------------------------------
    // synthesis translate_off
    reg  [8*32-1:0] stateL_ascii = "STL_READY";
    always @ (state_lite) begin
    case (state_lite)
        STL_READY: stateL_ascii="STL_READY";
        STL_ADDR : stateL_ascii="STL_ADDR ";
        STL_DATA : stateL_ascii="STL_DATA ";
        STL_RESP : stateL_ascii="STL_RESP ";
        STL_WAIT : stateL_ascii="STL_WAIT ";
        default  : stateL_ascii="STL_UNKNOWN";
    endcase
    end
    // synthesis translate_on
    //--------------------------------------------------------------------------
    always @ ( posedge axil_aclk or negedge axil_aresetn ) begin
    if (axil_aresetn==1'b0) begin
        m_axil_awaddr  <= 32'h0;
        m_axil_awvalid <= 1'b0;
        m_axil_wdata   <= 32'b0;
        m_axil_wvalid  <= 1'b0;
        m_axil_bready  <= 1'b0;
        regDone        <= 1'b0;
        state_lite     <= STL_READY;
    end else begin
        case (state_lite)
        STL_READY: begin
            if (syncRegGo==1'b1) begin
               m_axil_awaddr  <= regAwaddr[31:0];
               m_axil_awvalid <= 1'b1;
               state_lite     <= STL_ADDR;
            end
            end // STL_READY
        STL_ADDR: begin
            if (m_axil_awready) begin
                m_axil_awvalid <= 1'b0;
                if (AXI_WIDTH_DATA==32) begin
                    m_axil_wdata   <= regWdata;
                end else if (AXI_WIDTH_DATA==64) begin
                    m_axil_wdata   <= regWdata[regAwaddr[2]*32+:32];
                end else begin
                    m_axil_wdata   <= regWdata[regAwaddr[AXI_WIDTH_DSB-1:2]*32+:32];
                end
                m_axil_wvalid  <= 1'b1;
                state_lite     <= STL_DATA;
            end
            end // STL_ADDR
        STL_DATA: begin
            if (m_axil_wready) begin
                m_axil_wvalid <= 1'b0;
                m_axil_bready <= 1'b1;
                state_lite    <= STL_RESP;
            end
            end // STL_DATA
        STL_RESP: begin
            if (m_axil_bvalid) begin
                m_axil_bready <= 1'b0;
                regDone       <= 1'b1;
                state_lite <= STL_WAIT;
                // synthesis translate_off
                if (m_axil_bresp!=2'b00) $display("%m ERROR BRESP not-OK.");
                // synthesis translate_on
            end // STL_WAIT
            end
        STL_WAIT: begin
            if (syncRegGo==1'b0) begin
               regDone    <= 1'b0;
               state_lite <= STL_READY;
            end
            end // STL_WAIT
        default: begin
                 end
        endcase
    end // if
    end // always
    //--------------------------------------------------------------------------
endmodule
//------------------------------------------------------------------------------
//                +----+     +----+
//                |    |     |    |
//                |    |     |    |
// AXI4 read <===>|    |<===>|    |<==> AXI-Lite read
//                |    |     |    |
//                |    |     |    |
//                +----+     +----+
module axi4_to_lite_read
     #(parameter integer AXI_WIDTH_ID  =2
      ,parameter integer AXI_WIDTH_ADDR=32
      ,parameter integer AXI_WIDTH_DATA=32
      ,parameter integer AXI_WIDTH_STRB=(AXI_WIDTH_DATA/8)
      ,parameter integer AXI_WIDTH_DSB =$clog2(AXI_WIDTH_STRB))
(
      input  wire                      axi_aresetn
    , input  wire                      axi_aclk
    , input  wire [AXI_WIDTH_ID-1:0]   s_axi_arid
    , input  wire [AXI_WIDTH_ADDR-1:0] s_axi_araddr
    , input  wire [ 7:0]               s_axi_arlen
    , input  wire [ 2:0]               s_axi_arsize
    , input  wire [ 1:0]               s_axi_arburst
    , input  wire                      s_axi_arvalid
    , output reg                       s_axi_arready
    , output reg  [AXI_WIDTH_ID-1:0]   s_axi_rid
    , output reg  [AXI_WIDTH_DATA-1:0] s_axi_rdata
    , output reg  [ 1:0]               s_axi_rresp
    , output reg                       s_axi_rlast
    , output reg                       s_axi_rvalid
    , input  wire                      s_axi_rready
    
    , input  wire        axil_aresetn
    , input  wire        axil_aclk
    , output reg  [31:0] m_axil_araddr
    , output reg         m_axil_arvalid
    , input  wire        m_axil_arready
    , input  wire [31:0] m_axil_rdata
    , input  wire [ 1:0] m_axil_rresp
    , input  wire        m_axil_rvalid
    , output reg         m_axil_rready
);
    //--------------------------------------------------------------------------
    reg [AXI_WIDTH_ADDR-1:0] regAraddr={AXI_WIDTH_ADDR{1'b0}};
    reg [ 7:0]               regArlen=8'h0;
    reg [AXI_WIDTH_DATA-1:0] regRdata={AXI_WIDTH_DATA{1'b0}};
    //--------------------------------------------------------------------------
    reg [ 8:0]               cntRlen=9'h0;
    reg                      regGo=1'b0;
    reg                      regDone=1'b0;
    //--------------------------------------------------------------------------
    localparam NUM_DLY=3;
    reg [NUM_DLY-1:0] regGoDly={NUM_DLY{1'b0}};
    reg [NUM_DLY-1:0] regDoneDly={NUM_DLY{1'b0}};
    wire      syncRegGo=regGoDly[NUM_DLY-1];
    wire      syncRegDone=regDoneDly[NUM_DLY-1];
    integer idx, idy;
    always @ (posedge axi_aclk) begin
       regDoneDly[0] <= regDone;
       for (idx=0; idx<NUM_DLY-1; idx=idx+1) begin
           regDoneDly[idx+1] <= regDoneDly[idx];
       end
    end
    always @ (posedge axil_aclk) begin
       regGoDly[0] <= regGo;
       for (idy=0; idy<NUM_DLY-1; idy=idy+1) begin
           regGoDly[idy+1] <= regGoDly[idy];
       end
    end
    //--------------------------------------------------------------------------
    // This FSM pops data from the FIFO.
    localparam ST_READY    ='h0
             , ST_WAIT     ='h1
             , ST_DATA     ='h2
             , ST_SKIP     ='h3;
    reg [1:0] state=ST_READY;
    //--------------------------------------------------------------------------
    // synthesis translate_off
    reg  [8*32-1:0] state_ascii = "ST_READY";
    always @ (state) begin
    case (state)
        ST_READY: state_ascii="ST_READY";
        ST_WAIT : state_ascii="ST_WAIT ";
        ST_DATA : state_ascii="ST_DATA ";
        ST_SKIP : state_ascii="ST_SKIP ";
        default : state_ascii="ST_UNKNOWN";
    endcase
    end
    // synthesis translate_on
    //--------------------------------------------------------------------------
    always @ ( posedge axi_aclk or negedge axi_aresetn ) begin
    if (axi_aresetn==1'b0) begin
        s_axi_arready <= 1'b1;
        s_axi_rid     <= {AXI_WIDTH_ID{1'b0}};
        s_axi_rresp   <= 2'b00        ;
        s_axi_rdata   <= {AXI_WIDTH_DATA{1'b0}};
        s_axi_rlast   <= 1'b0;
        s_axi_rvalid  <= 1'b0;
        regAraddr     <=  'h0;
        regArlen      <=  'h0;
        cntRlen       <= 9'h0;
        regGo         <= 1'b0;
        state         <= ST_READY;
    end else begin
        case (state)
        ST_READY: begin
           s_axi_arready <= ~syncRegDone;
           if (s_axi_arvalid&s_axi_arready) begin
               s_axi_arready <= 1'b0;
               s_axi_rid     <= s_axi_arid   ;
               regAraddr     <= s_axi_araddr ;
               regArlen      <= s_axi_arlen  ;
               cntRlen       <= 9'h0;
               if ((s_axi_araddr[1:0]==2'b0)&&(s_axi_arlen==8'b000)&&
                   (s_axi_arsize==3'b010)&&(s_axi_arburst==2'b01)) begin
                   s_axi_rresp  <= 2'b00; // OKAY
                   regGo        <= 1'b1;
                   state        <= ST_WAIT;
               end else begin
                   s_axi_rdata  <= {AXI_WIDTH_DATA{1'b0}};
                   s_axi_rresp  <= 2'b10; // SLVERR
                   s_axi_rvalid <= 1'b1;
                   s_axi_rlast  <= (s_axi_arlen==8'h0);
                   state        <= ST_SKIP;
               end
               // synthesis translate_off
               if (s_axi_araddr[1:0]!=2'b0) $display("%m ERROR not word-aligned read.");
               if (s_axi_arlen  !=8'b000) $display("%m ERROR not single data read.");
               if (s_axi_arsize !=3'b010) $display("%m ERROR not 32-bit data read.");
               if (s_axi_arburst!=2'b01 ) $display("%m ERROR not incremental read.");
               // synthesis translate_on
           end
           end // ST_READY
        ST_WAIT: begin
           if (syncRegDone==1'b1) begin
               s_axi_rvalid <= 1'b1;
               s_axi_rlast  <= 1'b1;
               s_axi_rdata  <= regRdata;
               regGo        <= 1'b0;
               state        <= ST_DATA;
           end
           end // ST_WAIT
        ST_DATA: begin
           if (s_axi_rready) begin
               s_axi_rvalid <= 1'b0;
               s_axi_rlast  <= 1'b0;
               state        <= ST_READY;
           end
           end // ST_DATA
        ST_SKIP: begin
           if (s_axi_rready) begin
               cntRlen <= cntRlen + 1;
               if (regArlen==(cntRlen+1)) s_axi_rlast <= 1'b1;
               if (regArlen==cntRlen) begin
                   s_axi_rvalid <= 1'b0;
                   s_axi_rlast  <= 1'b0;
                   state        <= ST_READY;
                   // synthesis translate_off
                   if (s_axi_rlast==1'b0) $display("%m ERROR RLAST expected.");
                   // synthesis translate_on
               end
               // synthesis translate_off
               else begin
                   if (s_axi_rlast==1'b1) $display("%m ERROR RLAST not expected.");
                end
               // synthesis translate_on
           end
           end // ST_SKIP
        default: begin
                 end
        endcase
    end // if
    end // always
    //--------------------------------------------------------------------------
    localparam STL_READY    ='h0
             , STL_ADDR     ='h1
             , STL_DATA     ='h2
             , STL_WAIT     ='h3;
    reg [1:0] state_lite=STL_READY;
    //--------------------------------------------------------------------------
    // synthesis translate_off
    reg  [8*32-1:0] stateL_ascii = "STL_READY";
    always @ (state_lite) begin
    case (state_lite)
        STL_READY: stateL_ascii="STL_READY";
        STL_ADDR : stateL_ascii="STL_ADDR ";
        STL_DATA : stateL_ascii="STL_DATA ";
        STL_WAIT : stateL_ascii="STL_WAIT ";
        default  : stateL_ascii="STL_UNKNOWN";
    endcase
    end
    // synthesis translate_on
    //--------------------------------------------------------------------------
    always @ ( posedge axil_aclk or negedge axil_aresetn ) begin
    if (axil_aresetn==1'b0) begin
        m_axil_araddr  <= 32'h0;
        m_axil_arvalid <= 1'b0;
        m_axil_rready  <= 1'b0;
        regRdata       <={AXI_WIDTH_DATA{1'b0}};
        regDone        <= 1'b0;
        state_lite     <= STL_READY;
    end else begin
        case (state_lite)
        STL_READY: begin
            if (syncRegGo==1'b1) begin
               m_axil_araddr  <= regAraddr[31:0];
               m_axil_arvalid <= 1'b1;
               state_lite     <= STL_ADDR;
            end
            end // STL_READY
        STL_ADDR: begin
            if (m_axil_arready ) begin
                m_axil_arvalid <= 1'b0;
                m_axil_rready  <= 1'b1;
                state_lite     <= STL_DATA;
            end
            end // STL_ADDR
        STL_DATA: begin
            if (m_axil_rvalid) begin
                m_axil_rready  <= 1'b1;
                if (AXI_WIDTH_DATA==32) begin
                    regRdata <= m_axil_rdata;
                end else if (AXI_WIDTH_DATA==32) begin
                    regRdata <= {AXI_WIDTH_DATA{1'b0}};
                    regRdata[regAraddr[2]*32+:32] <= m_axil_rdata;
                end else begin
                    regRdata <= {AXI_WIDTH_DATA{1'b0}};
                    regRdata[regAraddr[AXI_WIDTH_DSB-1:2]*32+:32] <= m_axil_rdata;
                end
                regDone        <= 1'b1;
                state_lite     <= STL_WAIT;
                // synthesis translate_off
                if (m_axil_rresp!=2'b00) $display("%m ERROR RRESP not-OK.");
                // synthesis translate_on
            end
            end // STL_DATA
        STL_WAIT: begin
            if (syncRegGo==1'b0) begin
               regDone    <= 1'b0;
               state_lite <= STL_READY;
            end
            end // STL_WAIT
        default: begin
                 end
        endcase
    end // if
    end // always
    //--------------------------------------------------------------------------
endmodule
//------------------------------------------------------------------------------
// Revision History
//
// 2025.03.01: wide AIX4 supported.
// 2024.06.16: Started by Ando Ki (adki@future-ds.com)
//------------------------------------------------------------------------------
