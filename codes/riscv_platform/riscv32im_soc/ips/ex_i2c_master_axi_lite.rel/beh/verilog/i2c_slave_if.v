//------------------------------------------------------------------------------
// Copyright (c) 2018-2019 Future Design Systems.
//------------------------------------------------------------------------------
// FILE: i2c_slave_if.v
//------------------------------------------------------------------------------
// DESCRIPTION: I2C Slave
//------------------------------------------------------------------------------
// VERSION: 2019.01.02.
//------------------------------------------------------------------------------
// Note
//------------------------------------------------------------------------------
`timescale 1ns/1ns

module i2c_slave_if
     #(parameter P_I2C_DEV_ADDR_LEN=7 // can be 7, 10
               , P_I2C_DEV_ADDR    =7'h33
               , P_I2C_REG_ADDR_LEN=8 // can be 8, 16
               , P_I2C_PAGE_SIZE   =8 // 8 bytes for AT24C02C
               )
(

       input   wire        rst_n
     , input   wire        scl_i
     , input   wire        sda_i
     , output  reg         sda_o
     , output  reg         sda_t // active-low
     , input   wire        wp
     , output  reg  [P_I2C_REG_ADDR_LEN-1:0] addr
     , output  reg  [ 7:0] wdata
     , input   wire [ 7:0] rdata
     , output  wire        wr
     , output  wire        en
     , input   wire        ack
     , output  wire        i2c_reset
);
   //---------------------------------------------------------------------------
   assign i2c_reset=1'b0;
   //---------------------------------------------------------------------------
   // internal
   wire       scl=scl_i;
   wire       sda=(sda_t==1'b0) ? sda_o : sda_i;
   //---------------------------------------------------------------------------
   reg  [7:0] reg_byte_get=8'h0;
   reg  [7:0] reg_byte_put=8'h0;
   //---------------------------------------------------------------------------
 //reg  [P_I2C_REG_ADDR_LEN-1:0] taddr='h0;
   reg  [15:0] taddr='h0;
   //---------------------------------------------------------------------------
   reg  [P_I2C_DEV_ADDR_LEN-1:0] dev_addr='h0;
   //---------------------------------------------------------------------------
   wire I2C_SEL = (P_I2C_DEV_ADDR_LEN==7)
                ? ((dev_addr[6:0]==P_I2C_DEV_ADDR[6:0]) ? 1'b1 : 1'b0)
                : ((dev_addr[9:0]==P_I2C_DEV_ADDR[9:0]) ? 1'b1 : 1'b0);
   //---------------------------------------------------------------------------
   reg    TStart  =1'b0; // toggle signals
   reg    TStop   =1'b0; // toggle signals
   reg    TRestart=1'b0; // toggle signals
   wire   I2C_S; // start
   wire   I2C_R; // re-start
   wire   I2C_P; // stop
   reg    I2C_DRV=1'b0; // next byte should be driven by this module
   reg    I2C_RCV=1'b0; // next byte should be received by this module
   wire   I2C_busy = TStart^TStop; // between S to P
   //---------------------------------------------
   // S condition
   reg [4:0] sdelay=5'h0;
   assign I2C_S = TStart^sdelay[4];
   always @ (negedge sda_i or negedge rst_n ) begin
      if (rst_n ==1'b0) begin
          TStart  <= 1'b0;
      end else if (scl==1'b1) begin
          if (~I2C_busy) TStart <= ~TStart;
      end
   end
   always @ (posedge scl or negedge rst_n ) begin
      if (rst_n ==1'b0) begin
         sdelay <= 5'h0;
      end else begin
         sdelay    <= {sdelay,TStart};
      end
   end
   //---------------------------------------------
   // P condition
   assign I2C_P = TStart~^TStop;
   always @ (posedge sda_i or negedge rst_n ) begin
      if (rst_n ==1'b0) begin
          TStop  <= 1'b0;
      end else if (scl==1'b1) begin
          if (I2C_busy) TStop <= ~TStop;
      end
   end
   //---------------------------------------------
   // R (Sr) condition
   reg [4:0] rdelay;
   assign I2C_R = TRestart^rdelay[4];
   always @ (negedge sda_i or negedge rst_n ) begin
      if (rst_n ==1'b0) begin
          TRestart  <= 1'b0;
      end else if (scl==1'b1) begin
          if (I2C_busy) TRestart <= ~TRestart;
      end
   end
   always @ (posedge scl or negedge rst_n ) begin
      if (rst_n ==1'b0) begin
         rdelay <= 5'h0;
      end else begin
         rdelay    <= {rdelay,TRestart};
      end
   end
   //---------------------------------------------
   reg [3:0] cnt=4'h0;
   //---------------------------------------------
   localparam ST_IDLE             ='h0
            , ST_GET_DEV          ='h1 // receive device addr
            , ST_GET_DEV_ACK      ='h2
            , ST_GET_DEV10        ='h3
            , ST_GET_DEV_ACK10    ='h4
            , ST_GET_REG_ADR      ='h5
            , ST_GET_REG_ADR_ACK  ='h6
            , ST_GET_REG_ADR16    ='h7
            , ST_GET_REG_ADR_ACK16='h8
            , ST_GET_REG_DAT      ='h9
            , ST_GET_REG_DAT_ACK  ='hA
            , ST_PUT_REG_DAT      ='hB
            , ST_PUT_REG_DAT_ACK  ='hC;
   reg [3:0] state=ST_IDLE;
   //---------------------------------------------
    reg  [8*20-1:0] state_ascii="IDLE";
    always @ (state) begin
    case (state)
        ST_IDLE             : state_ascii="IDLE             ";
        ST_GET_DEV          : state_ascii="GET_DEV          ";
        ST_GET_DEV_ACK      : state_ascii="GET_DEV_ACK      ";
        ST_GET_DEV10        : state_ascii="GET_DEV10        ";
        ST_GET_DEV_ACK10    : state_ascii="GET_DEV_ACK10    ";
        ST_GET_REG_ADR      : state_ascii="GET_REG_ADR      ";
        ST_GET_REG_ADR_ACK  : state_ascii="GET_REG_ADR_ACK  ";
        ST_GET_REG_ADR16    : state_ascii="GET_REG_ADR16    ";
        ST_GET_REG_ADR_ACK16: state_ascii="GET_REG_ADR_ACK16";
        ST_GET_REG_DAT      : state_ascii="GET_REG_DAT      ";
        ST_GET_REG_DAT_ACK  : state_ascii="GET_REG_DAT_ACK  ";
        ST_PUT_REG_DAT      : state_ascii="PUT_REG_DAT      ";
        ST_PUT_REG_DAT_ACK  : state_ascii="PUT_REG_DAT_ACK  ";
        default             : state_ascii="UNKNOWN          ";
    endcase
    end // always
   //---------------------------------------------
   always @ (negedge scl or posedge I2C_P or negedge rst_n ) begin
       if (rst_n ==1'b0) begin
           sda_o       <= 1'b1;
           sda_t       <= 1'b1;
           I2C_DRV     <= 1'b0; // next byte should be driven by this module
           I2C_RCV     <= 1'b0;
           taddr       <=  'h0;
           wdata       <= 8'h0;
           dev_addr    <=  'h0;
           reg_byte_put<= 8'h0;
           reg_byte_get<= 8'h0;
           cnt         <= 4'h0;
           state       <= ST_IDLE;
       end else if (I2C_P==1'b1) begin
           sda_o       <= 1'b1;
           sda_t       <= 1'b1;
           I2C_DRV     <= 1'b0;// next byte should be driven by this module
           I2C_RCV     <= 1'b0;
           wdata       <= 8'h0;
           dev_addr    <=  'h0;
           reg_byte_put<= 8'h0;
           reg_byte_get<= 8'h0;
           cnt         <= 4'h0;
           state       <= ST_IDLE;
       end else begin
           case (state)
           ST_IDLE: begin
               if (I2C_S) begin
                  I2C_DRV <= 1'b0;// next byte should be driven by this module
                  I2C_RCV <= 1'b0;
                  cnt     <= 4'h0;
                  state   <= ST_GET_DEV;
               end
               end // ST_IDLE
           ST_GET_DEV: begin
              cnt          <= cnt + 1;
              reg_byte_get <= {reg_byte_get[6:0],sda_i};
              if (cnt==4'h7) begin
                  dev_addr <= reg_byte_get[6:0];
                  I2C_DRV  <= sda_i;
                  I2C_RCV  <=~sda_i;
                  sda_o    <= 1'b0;
                  sda_t    <= 1'b0;
                  state    <= ST_GET_DEV_ACK;
              end
              end // ST_GET_DEV
           ST_GET_DEV_ACK: begin
              sda_o    <= 1'b1;
              sda_t    <= 1'b1;
              if (P_I2C_DEV_ADDR_LEN==10) begin
                  if (dev_addr[7:3]!=7'b11110) $display("%d %m 10-bit addres error", $time);
                  cnt   <= 4'h0;
                  state <= ST_GET_DEV10;
              end else if (I2C_SEL==1'b1) begin
                  if (I2C_RCV) begin
                      cnt    <= 4'h0;
                      state  <= ST_GET_REG_ADR;
                  end else begin
                      reg_byte_put<={rdata[6:0],1'b0};
                      taddr       <= taddr+1;
                      sda_o       <= rdata[7];
                      sda_t       <= 1'b0;
                      cnt         <= 4'h0;
                      state       <= ST_PUT_REG_DAT;
                  end
              end else begin
                  state <= ST_IDLE;
              end
              end // ST_GET_DEV_ACK
           ST_GET_DEV10: begin
              cnt          <= cnt + 1;
              reg_byte_get <= {reg_byte_get[6:0],sda_i};
              if (cnt==4'h7) begin
                  dev_addr <= {dev_addr[2:1],reg_byte_get[6:0],sda_i};
                  sda_o    <= 1'b1;
                  sda_t    <= 1'b1;
                  state    <= ST_GET_DEV_ACK10;
              end
              end // ST_GET_DEV10
           ST_GET_DEV_ACK10: begin
              sda_o    <= 1'b1;
              sda_t    <= 1'b1;
              if (I2C_SEL==1'b1) begin
                  if (I2C_RCV) begin
                      cnt   <= 4'h0;
                      state <= ST_GET_REG_ADR;
                  end else begin
                      reg_byte_put<={rdata[6:0],1'b0};
                      taddr       <= taddr+1;
                      sda_o       <= rdata[7];
                      sda_t       <= 1'b0;
                      state       <= ST_PUT_REG_DAT;
                  end
              end else begin
                  state <= ST_IDLE;
              end
              end // ST_GET_DEV_ACK10
           ST_GET_REG_ADR     : begin
              cnt          <= cnt + 1;
              reg_byte_get <= {reg_byte_get[6:0],sda_i};
              if (cnt==4'h7) begin
                  taddr[7:0]  <= {reg_byte_get[6:0],sda_i};
                  sda_o       <= 1'b0;
                  sda_t       <= 1'b0;
                  state       <= ST_GET_REG_ADR_ACK;
              end
              end // ST_GET_REG_ADR
           ST_GET_REG_ADR_ACK : begin
              sda_o <= 1'b1;
              sda_t <= 1'b1;
              if (P_I2C_REG_ADDR_LEN==8) begin
                  cnt    <= 4'h0;
                  state  <= ST_GET_REG_DAT;
              end else if (P_I2C_REG_ADDR_LEN==16) begin
                  cnt   <= 4'b0;
                  state <= ST_GET_REG_ADR16;
              end else begin
                  $display("%d %m ERROR unknown I2C_REG_ADDR_LEN %d", $time, P_I2C_REG_ADDR_LEN);
              end
              end // ST_GET_REG_ADR_ACK
           ST_GET_REG_ADR16   : begin
              cnt          <= cnt + 1;
              reg_byte_get <= {reg_byte_get[6:0],sda_i};
              if (cnt==4'h7) begin
                  taddr[15:0] <= {taddr[7:0],reg_byte_get[6:0],sda_i};
                  sda_o       <= 1'b0;
                  sda_t       <= 1'b0;
                  state       <= ST_GET_REG_ADR_ACK16;
              end
              end // ST_GET_REG_ADR
           ST_GET_REG_ADR_ACK16 : begin
              sda_o  <= 1'b1;
              sda_t  <= 1'b1;
              cnt    <= 4'h0;
              state  <= ST_GET_REG_DAT;
              end // ST_GET_REG_ADR_ACK
           ST_GET_REG_DAT: begin
              cnt          <= cnt + 1;
              reg_byte_get <= {reg_byte_get[6:0],sda_i};
               if (I2C_R) begin
                   I2C_DRV <= 1'b0;
                   I2C_RCV <= 1'b0;
                   cnt     <= 4'h0;
                   state   <= ST_GET_DEV;
               end else begin
                   if (cnt==4'h7) begin
                       wdata <= {reg_byte_get[6:0],sda_i};
                       sda_o <= 1'b0;
                       sda_t <= 1'b0;
                       state <= ST_GET_REG_DAT_ACK;
                   end
               end
           end
            ST_GET_REG_DAT_ACK : begin
                sda_o <= 1'b1;
                sda_t <= 1'b1;
                // Page Write Wrapping: Generic logic for power-of-2 page sizes
                if (P_I2C_PAGE_SIZE > 0) begin
                     taddr <= (taddr & ~ (P_I2C_PAGE_SIZE-1)) | ((taddr + 1) & (P_I2C_PAGE_SIZE-1));
                end else begin
                    taddr <= taddr+1;
                end
                cnt   <= 4'h0;
                state <= ST_GET_REG_DAT;
            end
           ST_PUT_REG_DAT     : begin
               if (I2C_R) begin
                   I2C_DRV      <= 1'b0;
                   I2C_RCV      <= 1'b0;
                   cnt          <= 4'h0;
                   state       <= ST_GET_DEV;
               end else begin
                   reg_byte_put <= {reg_byte_put[6:0],1'b0};
                   sda_o        <= reg_byte_put[7];
                   sda_t        <= 1'b0;
                   cnt          <= cnt + 1;
                   if (cnt==4'h7) begin
                       sda_o  <= 1'b1;
                       sda_t  <= 1'b1;
                       state  <= ST_PUT_REG_DAT_ACK;
                   end
               end
           end
           ST_PUT_REG_DAT_ACK : begin
             if (sda_i) begin
                 // It indicates the end of sequencial read, when NACK received.
                 sda_o <= 1'b1;
                 sda_t <= 1'b1;
                 state <= ST_IDLE;
             end else begin
                   taddr        <= taddr+1;
                   reg_byte_put <={rdata[6:0],1'b0};
                   sda_o        <= rdata[7];
                   sda_t        <= 1'b0;
                   cnt          <= 4'h0;
                   state        <= ST_PUT_REG_DAT;
             end
           end
           endcase
       end
   end
   //---------------------------------------------
   always @ (negedge sda_i) begin
      if ((rst_n==1'b1)&&(state!=ST_IDLE)&&(I2C_busy==1'b0)&&(scl==1'b1)) begin
           $display("%d %m ERROR sda changed while scl is 1", $time);
      end
   end
   always @ (posedge sda_i) begin
      if ((rst_n==1'b1)&&(state!=ST_IDLE)&&(I2C_busy==1'b0)&&(scl==1'b1)) begin
           $display("%d %m ERROR sda changed while scl is 1", $time);
      end
   end
   //---------------------------------------------
   assign wr = I2C_RCV;
   assign en = scl & (
           ((state==ST_GET_DEV_ACK)&I2C_SEL&I2C_DRV)
          |((state==ST_GET_REG_DAT_ACK)&~wp)
          |((state==ST_PUT_REG_DAT_ACK)&~sda_i));
          // If NACK, do not read before-hand
   always @ (posedge scl or negedge rst_n ) begin
          if (rst_n ==1'b0) addr <= {P_I2C_REG_ADDR_LEN{1'b0}};
          else              addr <= taddr[P_I2C_REG_ADDR_LEN-1:0];
   end
endmodule
//------------------------------------------------------------------------------
