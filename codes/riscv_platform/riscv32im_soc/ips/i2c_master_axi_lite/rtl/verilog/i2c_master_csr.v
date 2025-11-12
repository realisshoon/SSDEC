//------------------------------------------------------------------------------
// Copyright (c) 2025 by Ando Ki
// All right reserved.
//------------------------------------------------------------------------------
// i2c_master_csr.v
//------------------------------------------------------------------------------
// NOTE:
//
// CSR access signals
//             __    __    __    __    __    _
// CLK      __|  |__|  |__|  |__|  |__|  |__|
//             _____             _____
// T_ADDR   XXX_____XXXXXXXXXXXXX_____XXX
//             _____
// T_RDEN   __|     |____________________
//                   _____
// T_RDATA  XXXXXXXXX_____XXXXXXXXXXXXXXX
//                               _____
// T_WREN   ____________________|     |__
//                               _____
// T_WDATA  XXXXXXXXXXXXXXXXXXXXX_____XXXX
//------------------------------------------------------------------------------
// NOTE:
//------------------------------------------------------------------------------
`include "i2c_master_define.v"

module i2c_master_csr
     #(parameter T_ADDR_WID     =8
               , P_CLK_FREQ     =100_000_000 // CLK frequency
               , P_I2C_SPEED    =400_000 // I2C SCL frequency
               , P_I2C_NUM      =3
               , P_RX_DEPTH     =8
               , P_TX_DEPTH     =8
               )
(
       input   wire                   RESET_N
     , input   wire                   CLK
     , input   wire [T_ADDR_WID-1:0]  T_ADDR
     , input   wire                   T_WREN
     , input   wire                   T_RDEN
     , input   wire [31:0]            T_WDATA
     , output  reg  [31:0]            T_RDATA
     , output  wire                   IRQ
     //-------------------------------------------------------------------------
     , output  wire [31:0]            I2C_CLKDIV
     , output  wire                   I2C_RST
     , output  wire                   I2C_EN
     , output  wire                   I2C_GO
     , input   wire                   I2C_DONE
     , input   wire                   I2C_BUSY
     , output  wire [ 7:0]            I2C_RUN_NUM
     //-------------------------------------------------------------------------
     , output  wire [ 3:0]            I2C_SEL
     //-------------------------------------------------------------------------
     , input   wire                   fifo_snd_rdy
     , output  reg                    fifo_snd_vld
     , output  reg  [ 7:0]            fifo_snd_dat
     , output  reg  [ 4:0]            fifo_snd_ctl//0=start,1=drv,2=rcv,3=stop,4=repeat
     , input   wire [ 7:0]            fifo_snd_rooms
     //-------------------------------------------------------------------------
     , output  reg                    fifo_rcv_rdy
     , input   wire                   fifo_rcv_vld
     , input   wire [ 7:0]            fifo_rcv_dat
     , input   wire                   fifo_rcv_ack
     , input   wire [ 7:0]            fifo_rcv_items
     //-------------------------------------------------------------------------
     , output  wire [ 3:0]            NUM_CLK_PRE
     , output  wire [ 3:0]            NUM_CLK_MID
     , output  wire [ 3:0]            NUM_CLK_POST
     , output  wire [ 3:0]            NUM_CLK_GAP
     //-------------------------------------------------------------------------
);
   //---------------------------------------------------------------------------
   // note that it round-up xx.5
   localparam real     P_CLK_DIV_F  =(P_CLK_FREQ/P_I2C_SPEED   );
   localparam integer  P_CLK_DIV    = P_CLK_DIV_F;
   //---------------------------------------------------------------------------
   // CSR address
   //--------------------------------------------------------------------------
   localparam CSRA_VERSION   = 8'h00
            , CSRA_CONTROL   = 8'h04 // enable, interrupt, reset
            , CSRA_STATUS    = 8'h08
            , CSRA_CONFIG    = 8'h0C
            , CSRA_SEL       = 8'h10

            , CSRA_CLK_FREQ  = 8'h20 // read only (CLK freq)
            , CSRA_I2C_SPEED = 8'h24 // for reference
            , CSRA_CLKDIV    = 8'h28 // 
            , CSRA_RUN       = 8'h30 // single/conti, go
            , CSRA_TX_DATA   = 8'h40
            , CSRA_RX_DATA   = 8'h50
            , CSRA_DEBUG     = 8'h50
            ;
   //--------------------------------------------------------------------------
   // CSR
   //--------------------------------------------------------------------------
   wire [31:0] csr_version = `I2C_MASTER_VERSION;
   //--------------------------------------------------------------------------
   reg         csr_ctl_en     =1'b0;
   reg         csr_ctl_ie     =1'b0;
   reg         csr_ctl_rst    =1'b0;
   reg         csr_sts_ip     =1'b0;
   reg  [ 3:0] csr_conf_pre   =4'h1;
   reg  [ 3:0] csr_conf_mid   =4'h1;
   reg  [ 3:0] csr_conf_post  =4'h1;
   reg  [ 3:0] csr_conf_gap   =4'h1;
   reg  [ 3:0] csr_conf_sel   =4'h0;
   reg         csr_run_go     =1'b0;
   reg  [ 7:0] csr_run_num    =8'h0;
   reg  [31:0] csr_i2c_speed  =P_I2C_SPEED;
   reg  [31:0] csr_clk_div    =P_CLK_DIV;
   //---------------------------------------------------------------------------
   assign I2C_CLKDIV =csr_clk_div ;
   assign I2C_RST    =csr_ctl_rst |~RESET_N;
   assign I2C_EN     =csr_ctl_en&~I2C_RST;
   assign I2C_GO     =csr_run_go&I2C_EN;
   assign I2C_RUN_NUM=csr_run_num;
   //---------------------------------------------------------------------------
   assign NUM_CLK_PRE =csr_conf_pre ;
   assign NUM_CLK_MID =csr_conf_mid ;
   assign NUM_CLK_POST=csr_conf_post;
   assign NUM_CLK_GAP =csr_conf_gap ;
   assign I2C_SEL     =csr_conf_sel ;
   //---------------------------------------------------------------------------
   // CSR read
   always @ (posedge CLK or negedge RESET_N) begin
   if (RESET_N==1'b0) begin
       T_RDATA      <= 32'h0;
       fifo_rcv_rdy <= 1'b1;
   end else begin
      fifo_rcv_rdy <= 1'b0;
      if (T_RDEN) begin
         casex (T_ADDR) // synthesis full_case parallel_case
           CSRA_VERSION  : T_RDATA <= csr_version;
           CSRA_CONTROL  : T_RDATA <={csr_ctl_rst //31
                                     ,29'h0       //30-2
                                     ,csr_ctl_ie  //1
                                     ,csr_ctl_en  //0
                                     };
           CSRA_STATUS   : T_RDATA <={I2C_RST    //31
                                     ,I2C_BUSY   //30
                                     ,2'h0       //29-28
                                     ,4'h0       //27-24
                                     ,P_RX_DEPTH[7:0] //23-16
                                     ,P_TX_DEPTH[7:0] //15-8
                                     ,6'h0      //7-2
                                     ,csr_sts_ip //1
                                     ,csr_ctl_en //0
                                     };
           CSRA_CONFIG   : T_RDATA <= {P_I2C_NUM[3:0]     // 31-28
                                      ,12'h0              // 27-16
                                      ,csr_conf_gap [3:0] // 15-12
                                      ,csr_conf_post[3:0] // 11-8
                                      ,csr_conf_mid [3:0] // 7-4
                                      ,csr_conf_pre [3:0] // 3-0
                                      };
           CSRA_SEL      : T_RDATA <= {28'h0
                                      ,csr_conf_sel // 3-0
                                      };
           CSRA_CLK_FREQ : T_RDATA <= P_CLK_FREQ;
           CSRA_I2C_SPEED: T_RDATA <= csr_i2c_speed;
           CSRA_CLKDIV   : T_RDATA <= csr_clk_div;
           CSRA_RUN      : T_RDATA <={csr_run_num // 31-24
                                     ,fifo_rcv_items //23-16
                                     ,fifo_snd_rooms //15-8
                                     ,6'h0      //7-2
                                     ,I2C_DONE  //1
                                     ,csr_run_go//0
                                     };
           CSRA_RX_DATA  : begin
                           T_RDATA <= (fifo_rcv_vld==1'b1) ? {23'h0 //31-9
                                                             ,fifo_rcv_ack  //8
                                                             ,fifo_rcv_dat}
                                                           : 32'h0;
                           fifo_rcv_rdy <= 1'b1;
                           end
           default       : T_RDATA <=32'h0;
         endcase
      end else T_RDATA <= 32'h0;
   end // if
   end // always
   //---------------------------------------------------------------------------
   always @ (posedge CLK or negedge RESET_N) begin
   if (RESET_N==1'b0) begin
       csr_ctl_en     <= 1'b0;
       csr_ctl_ie     <= 1'b0;
       csr_ctl_rst    <= 1'b0;
       csr_i2c_speed  <= P_I2C_SPEED;
       csr_clk_div    <= P_CLK_DIV;
       csr_conf_pre   <= 4'h1;
       csr_conf_mid   <= 4'h1;
       csr_conf_post  <= 4'h1;
       csr_conf_gap   <= 4'h1;
       csr_conf_sel   <= 4'h0;
       fifo_snd_vld   <= 1'b0;
       fifo_snd_dat   <= 8'b0;
       fifo_snd_ctl   <= 5'b0;
   end else begin
      fifo_snd_vld <= 1'b0;
      if (T_WREN) begin
         case (T_ADDR) // synthesis full_case parallel_case
           CSRA_CONTROL  :{csr_ctl_rst//31
                          ,csr_ctl_ie //1
                          ,csr_ctl_en //0
                          } <= {T_WDATA[31]
                               ,T_WDATA[ 1]
                               ,T_WDATA[ 0]&~T_WDATA[31]};
           CSRA_I2C_SPEED: csr_i2c_speed<= T_WDATA;
           CSRA_CLKDIV   : csr_clk_div  <= T_WDATA;
           CSRA_CONFIG   : begin
                           csr_conf_gap [3:0] <= (T_WDATA[15:12]==4'b0) ? 4'h1 : T_WDATA[15:12];
                           csr_conf_post[3:0] <= (T_WDATA[11: 8]==4'b0) ? 4'h1 : T_WDATA[11: 8];
                           csr_conf_mid [3:0] <= (T_WDATA[ 7: 4]==4'b0) ? 4'h1 : T_WDATA[ 7: 4];
                           csr_conf_pre [3:0] <= (T_WDATA[ 3: 0]==4'b0) ? 4'h1 : T_WDATA[ 3: 0];
                           end
           CSRA_SEL      : csr_conf_sel <= T_WDATA[3:0];
           CSRA_TX_DATA  : begin
                           fifo_snd_vld <= 1'b1;
                           fifo_snd_dat <= T_WDATA[7:0];
                           fifo_snd_ctl <= T_WDATA[12:8];
                                         // 12: repeat
                                         // 11: stop
                                         // 10: receive
                                         //  9: drive
                                         //  8: start
                           end
         endcase
      end
   end // if
   end // always
   //---------------------------------------------------------------------------
   always @ (posedge CLK or negedge RESET_N) begin
   if (RESET_N==1'b0) begin
       csr_sts_ip  <= 1'b0;
       csr_run_go  <= 1'b0;
       csr_run_num <= 8'h0;
   end else begin
      if ((T_WREN==1'b1)&&(T_ADDR==CSRA_RUN)) begin
           csr_run_go  <= T_WDATA[0];
           csr_run_num <= T_WDATA[31:24];
      end else begin
           if ((I2C_DONE==1'b1)||(csr_ctl_rst==1'b1)||(csr_ctl_en==1'b0)) begin
               csr_run_go <= 1'b0;
           end
      end
      if ((T_WREN==1'b1)&&(T_ADDR==CSRA_STATUS)) begin
           csr_sts_ip <= (T_WDATA[1]==1'b1) ? 1'b0 : csr_sts_ip;
      end else begin
           if ((I2C_GO==1'b1)&&(I2C_DONE==1'b1)) begin
               csr_sts_ip <= csr_ctl_ie|csr_sts_ip;
           end else begin
               csr_sts_ip <= ((csr_ctl_rst==1'b1)||(csr_ctl_en==1'b0))
                           ? 1'b0 : csr_sts_ip;
           end
      end
   end // if
   end // always
   assign IRQ = csr_sts_ip;
   //---------------------------------------------------------------------------
endmodule
//------------------------------------------------------------------------------
// Revision History
//
// 2025.09.10: Ando Ki
//------------------------------------------------------------------------------
