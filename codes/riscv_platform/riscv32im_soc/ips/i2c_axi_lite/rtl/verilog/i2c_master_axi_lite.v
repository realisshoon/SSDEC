//------------------------------------------------------------------------------
// Copyright (c) 2025 by Ando Ki.
// All right reserved.
//------------------------------------------------------------------------------
// i2c_master_axi_lite.v
//------------------------------------------------------------------------------
`include "i2c_master_define.v"
`include "i2c_axi_lite.v"
`include "i2c_master_csr.v"
`include "i2c_master_core.v"
`include "i2c_fifo_sync_small.v"

module i2c_master_axi_lite
     #(parameter integer P_CLK_FREQ =100_000_000 // CLK frequency
      ,parameter integer P_I2C_SPEED=400_000   // default I2C SCL frequency
      ,parameter integer P_RX_DEPTH =8
      ,parameter integer P_TX_DEPTH =8)
(
    (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST"           *) input  wire        aresetn,
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF s_axi_lite"                  *) 
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK"              *) input  wire        aclk,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite AWADDR"  *) input  wire [31:0] s_axi_lite_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite AWVALID" *) input  wire        s_axi_lite_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite AWREADY" *) output wire        s_axi_lite_awready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite WDATA"   *) input  wire [31:0] s_axi_lite_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite WVALID"  *) input  wire        s_axi_lite_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite WREADY"  *) output wire        s_axi_lite_wready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite BRESP"   *) output wire [ 1:0] s_axi_lite_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite BVALID"  *) output wire        s_axi_lite_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite BREADY"  *) input  wire        s_axi_lite_bready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite ARADDR"  *) input  wire [31:0] s_axi_lite_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite ARVALID" *) input  wire        s_axi_lite_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite ARREADY" *) output wire        s_axi_lite_arready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite RDATA"   *) output wire [31:0] s_axi_lite_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite RRESP"   *) output wire [ 1:0] s_axi_lite_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite RVALID"  *) output wire        s_axi_lite_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite RREADY"  *) input  wire        s_axi_lite_rready
     //-------------------------------------------------------------------------
     , output  wire         IRQ
     //-------------------------------------------------------------------------
     , input   wire   SCL_I
     , output  wire   SCL_O
     , output  wire   SCL_T // 0: drive
     , input   wire   SDA_I
     , output  wire   SDA_O
     , output  wire   SDA_T // 0: drive
);
   //---------------------------------------------------------------------------
   // CSR access signals
   localparam T_ADDR_WID = 8;
   wire [31:0] T_ADDR;
   wire        T_WREN;
   wire        T_RDEN;
   wire [31:0] T_WDATA; // should be valid during T_WREN
   wire [31:0] T_RDATA; // should be valid after one cycle from T_RDEN
   //---------------------------------------------------------------------------
   i2c_axi_lite_if
   u_axi_lite_if (
         .s_axi_aresetn ( aresetn            )
       , .s_axi_aclk    ( aclk               )
       , .s_axi_awaddr  ( s_axi_lite_awaddr  )
       , .s_axi_awvalid ( s_axi_lite_awvalid )
       , .s_axi_awready ( s_axi_lite_awready )
       , .s_axi_wdata   ( s_axi_lite_wdata   )
       , .s_axi_wvalid  ( s_axi_lite_wvalid  )
       , .s_axi_wready  ( s_axi_lite_wready  )
       , .s_axi_bresp   ( s_axi_lite_bresp   )
       , .s_axi_bvalid  ( s_axi_lite_bvalid  )
       , .s_axi_bready  ( s_axi_lite_bready  )
       , .s_axi_araddr  ( s_axi_lite_araddr  )
       , .s_axi_arvalid ( s_axi_lite_arvalid )
       , .s_axi_arready ( s_axi_lite_arready )
       , .s_axi_rdata   ( s_axi_lite_rdata   )
       , .s_axi_rresp   ( s_axi_lite_rresp   )
       , .s_axi_rvalid  ( s_axi_lite_rvalid  )
       , .s_axi_rready  ( s_axi_lite_rready  )
       , .bram_addr     ( T_ADDR  )
       , .bram_wr_data  ( T_WDATA )
       , .bram_rd_data  ( T_RDATA )
       , .bram_en       (         )
       , .bram_we       ( T_WREN  )
       , .bram_re       ( T_RDEN  )
   );
   //---------------------------------------------------------------------------
   wire [31:0]  I2C_CLKDIV ;
   wire         I2C_RST    ;
   wire         I2C_EN     ;
   wire         I2C_GO     ;
   wire         I2C_DONE   ;
   wire         I2C_BUSY   ; // not I2C STOP yet
   wire [ 7:0]  I2C_RUN_NUM;
   //---------------------------------------------------------------------------
   wire       fifo_snd_wr_rdy  , fifo_snd_rd_rdy  ;
   wire       fifo_snd_wr_vld  , fifo_snd_rd_vld  ;
   wire [7:0] fifo_snd_wr_dat  , fifo_snd_rd_dat  ;
   wire [4:0] fifo_snd_wr_ctl  , fifo_snd_rd_ctl  ;
   wire [7:0] fifo_snd_rooms   , fifo_snd_items   ;
   wire       fifo_rcv_rd_rdy  , fifo_rcv_wr_rdy  ;
   wire       fifo_rcv_rd_vld  , fifo_rcv_wr_vld  ;
   wire [7:0] fifo_rcv_rd_dat  , fifo_rcv_wr_dat  ;
   wire       fifo_rcv_rd_ack  , fifo_rcv_wr_ack  ;
   wire [7:0] fifo_rcv_items   , fifo_rcv_rooms   ;
   //---------------------------------------------------------------------------
   `ifdef DEBUG
   // synthesis attribute keep of debug_scl is "true";
   // synthesis attribute keep of debug_sda is "true";
   (* mark_debug="true" *)wire debug_scl;
   (* mark_debug="true" *)wire debug_sda;
   `endif
   //---------------------------------------------------------------------------
   wire [ 3:0] NUM_CLK_PRE ;
   wire [ 3:0] NUM_CLK_MID ;
   wire [ 3:0] NUM_CLK_POST;
   wire [ 3:0] NUM_CLK_GAP ;
   //---------------------------------------------------------------------------
   i2c_master_csr #(.T_ADDR_WID     (T_ADDR_WID )
                   ,.P_CLK_FREQ     (P_CLK_FREQ )
                   ,.P_I2C_SPEED    (P_I2C_SPEED)
                   ,.P_I2C_NUM      (1          )
                   ,.P_RX_DEPTH     (P_RX_DEPTH )
                   ,.P_TX_DEPTH     (P_RX_DEPTH )
                   )
   u_csr (
          .RESET_N      ( aresetn      )
        , .CLK          ( aclk         )
        , .T_ADDR       ( T_ADDR[T_ADDR_WID-1:0])
        , .T_WREN       ( T_WREN       )
        , .T_RDEN       ( T_RDEN       )
        , .T_WDATA      ( T_WDATA      )
        , .T_RDATA      ( T_RDATA      )
        , .IRQ          ( IRQ          )
        , .I2C_CLKDIV   ( I2C_CLKDIV   )
        , .I2C_RST      ( I2C_RST      )
        , .I2C_EN       ( I2C_EN       )
        , .I2C_GO       ( I2C_GO       )
        , .I2C_DONE     ( I2C_DONE     )
        , .I2C_BUSY     ( I2C_BUSY     )
        , .I2C_RUN_NUM  ( I2C_RUN_NUM  )
        , .I2C_SEL      (              )
        , .fifo_snd_rdy   ( fifo_snd_wr_rdy )
        , .fifo_snd_vld   ( fifo_snd_wr_vld )
        , .fifo_snd_dat   ( fifo_snd_wr_dat )
        , .fifo_snd_ctl   ( fifo_snd_wr_ctl )
        , .fifo_snd_rooms ( fifo_snd_rooms  )
        , .fifo_rcv_rdy   ( fifo_rcv_rd_rdy )
        , .fifo_rcv_vld   ( fifo_rcv_rd_vld )
        , .fifo_rcv_dat   ( fifo_rcv_rd_dat )
        , .fifo_rcv_ack   ( fifo_rcv_rd_ack )
        , .fifo_rcv_items ( fifo_rcv_items  )
        , .NUM_CLK_PRE  ( NUM_CLK_PRE  )
        , .NUM_CLK_MID  ( NUM_CLK_MID  )
        , .NUM_CLK_POST ( NUM_CLK_POST )
        , .NUM_CLK_GAP  ( NUM_CLK_GAP  )
        `ifdef DEBUG
        , .debug        ({debug_sda,debug_scl})
        `endif
   );
   //---------------------------------------------------------------------------
   // synthesis attribute keep of SDA_I is "true";
   i2c_master_core
   u_core (
          .RESET_N      (~I2C_RST      )
        , .CLK          ( aclk         )
        , .I2C_CLKDIV   ( I2C_CLKDIV   )
        , .I2C_EN       ( I2C_EN       )
        , .I2C_GO       ( I2C_GO       )
        , .I2C_DONE     ( I2C_DONE     )
        , .I2C_BUSY     ( I2C_BUSY     )
        , .I2C_RUN_NUM  ( I2C_RUN_NUM  )
        , .fifo_snd_rdy   ( fifo_snd_rd_rdy )
        , .fifo_snd_vld   ( fifo_snd_rd_vld )
        , .fifo_snd_dat   ( fifo_snd_rd_dat )
        , .fifo_snd_ctl   ( fifo_snd_rd_ctl )
        , .fifo_snd_items ( fifo_snd_items  )
        , .fifo_rcv_rdy   ( fifo_rcv_wr_rdy )
        , .fifo_rcv_vld   ( fifo_rcv_wr_vld )
        , .fifo_rcv_dat   ( fifo_rcv_wr_dat )
        , .fifo_rcv_ack   ( fifo_rcv_wr_ack )
        , .fifo_rcv_rooms ( fifo_rcv_rooms  )
        , .SCL_I          ( SCL_I           )
        , .SCL_O          ( SCL_O           )
        , .SCL_T          ( SCL_T           )
        , .SDA_I          ( SDA_I           )
        , .SDA_O          ( SDA_O           )
        , .SDA_T          ( SDA_T           )
        , .NUM_CLK_PRE  ( NUM_CLK_PRE  )
        , .NUM_CLK_MID  ( NUM_CLK_MID  )
        , .NUM_CLK_POST ( NUM_CLK_POST )
        , .NUM_CLK_GAP  ( NUM_CLK_GAP  )
        `ifdef DEBUG
        , .debug_sda    ( debug_sda )
        , .debug_scl    ( debug_scl )
        `endif
   );
   //---------------------------------------------------------------------------
   localparam SND_FAW=clogb2(P_TX_DEPTH);
   i2c_fifo_sync_small
     #(.FDW(5+8)
      ,.FAW(SND_FAW)) // num of entries in 2 to the power FAW
   u_fifo_snd (
       .rstn     (~I2C_RST )
     , .clr      ( 1'b0    )
     , .clk      ( aclk    )
     , .wr_rdy   ( fifo_snd_wr_rdy )
     , .wr_vld   ( fifo_snd_wr_vld )
     , .wr_din   ({fifo_snd_wr_ctl,fifo_snd_wr_dat})
     , .rd_rdy   ( fifo_snd_rd_rdy )
     , .rd_vld   ( fifo_snd_rd_vld )
     , .rd_dout  ({fifo_snd_rd_ctl,fifo_snd_rd_dat})
     , .full     (  )
     , .empty    (  )
     , .items    ( fifo_snd_items[SND_FAW:0] )
     , .rooms    ( fifo_snd_rooms[SND_FAW:0] )
   );
   assign fifo_snd_items[7:SND_FAW+1]='h0;
   assign fifo_snd_rooms[7:SND_FAW+1]='h0;
   //---------------------------------------------------------------------------
   localparam RCV_FAW=clogb2(P_RX_DEPTH);
   i2c_fifo_sync_small
     #(.FDW(1+8)
      ,.FAW(RCV_FAW)) // num of entries in 2 to the power FAW
   u_fifo_rcv (
       .rstn     (~I2C_RST )
     , .clr      ( 1'b0    )
     , .clk      ( aclk    )
     , .wr_rdy   ( fifo_rcv_wr_rdy )
     , .wr_vld   ( fifo_rcv_wr_vld )
     , .wr_din   ({fifo_rcv_wr_ack,fifo_rcv_wr_dat})
     , .rd_rdy   ( fifo_rcv_rd_rdy )
     , .rd_vld   ( fifo_rcv_rd_vld )
     , .rd_dout  ({fifo_rcv_rd_ack,fifo_rcv_rd_dat})
     , .full     (  )
     , .empty    (  )
     , .items    ( fifo_rcv_items[RCV_FAW:0])
     , .rooms    ( fifo_rcv_rooms[RCV_FAW:0])
   );
   assign fifo_rcv_items[7:RCV_FAW+1]='h0;
   assign fifo_rcv_rooms[7:RCV_FAW+1]='h0;
   //---------------------------------------------------------------------------
   // synthesis translate_off
   real stamp_x, stamp_y;
   reg  [31:0] csr_clk_div_save=0;
   always @ ( * ) begin
       if (csr_clk_div_save!==u_csr.csr_clk_div) begin
           @ (negedge SCL_I);
           @ (posedge SCL_I); stamp_x = $realtime;
           @ (posedge SCL_I); stamp_y = $realtime;
           $display("%m SCL %.2f-nsec %.2f-MHz", stamp_y - stamp_x, 1000.0/(stamp_y-stamp_x));
           csr_clk_div_save = u_csr.csr_clk_div;
       end
   end
   // synthesis translate_on
   //---------------------------------------------------------------------------
   function integer clogb2;
   input [31:0] value;
   reg   [31:0] tmp;
   begin
      tmp = value - 1;
      for (clogb2 = 0; tmp > 0; clogb2 = clogb2 + 1) tmp = tmp >> 1;
   end
   endfunction
   //---------------------------------------------------------------------------
endmodule
//------------------------------------------------------------------------------
// Revision history:
//
// 2025.09.10: Started by Ando Ki. (andoki@gmail.com)
//------------------------------------------------------------------------------
