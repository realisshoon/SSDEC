//------------------------------------------------------------------------------
// Copyright (c) 2025 by Ando Ki.
// All right reserved.
//------------------------------------------------------------------------------
// i2c_master_core.v
//------------------------------------------------------------------------------
// I2C interface
//------------------------------------------------------------------------------
//               __    __    __    __    __    __    __    __    __    __    __    __    __    __    __
// hidden SCL __|  |__|  |__|  |__|  |__|  ...|  |__|  |__|  |__|  |__|  |...  |__|  |__|  |__|  |__|
//            _____|_____    __    __    __    __    __          __    __    __    __       ____________
// SCL             |     \__| 1|__| 2|__|  ...| 8|__|A |________| 1|__| 2|...  |__|A |_____/
//            _____|      _____ _____ _____ ...__             _____ _____ _____            |      _____
// SDA             \_____X_____X_____X_____X...__X_____X_____X_____X_____X_____X_____X_____|_____/
//                 |PRE  |                              |MID |                             |POST |GAP
//------------------------------------------------------------------------------
`include "i2c_master_define.v"
`include "i2c_master_byte.v"

module i2c_master_core
(
       input   wire         RESET_N
     , input   wire         CLK
     //-------------------------------------------------------------------------
     // I2C_CLKDIV should not be chaned during I2C_EN is high.
     , input   wire  [31:0] I2C_CLKDIV   // clock divide
     , input   wire         I2C_EN       // start to gen internal SCLK
     //-------------------------------------------------------------------------
     , input   wire         I2C_GO
     , output  reg          I2C_DONE
     , input   wire  [ 7:0] I2C_RUN_NUM // num of entries in the snd fifo
     , output  wire         I2C_BUSY
     //-------------------------------------------------------------------------
     , output  reg          fifo_snd_rdy
     , input   wire         fifo_snd_vld
     , input   wire  [ 7:0] fifo_snd_dat
     , input   wire  [ 4:0] fifo_snd_ctl //0=start,1=drv,2=rcv,3=stop,4=repeat
     , input   wire  [ 7:0] fifo_snd_items
     //-------------------------------------------------------------------------
     , input   wire         fifo_rcv_rdy
     , output  reg          fifo_rcv_vld
     , output  reg   [ 7:0] fifo_rcv_dat
     , output  reg          fifo_rcv_ack // 1=OK
     , input   wire  [ 7:0] fifo_rcv_rooms
     //-------------------------------------------------------------------------
     , input   wire         SCL_I
     , output  wire         SCL_O
     , output  wire         SCL_T
     , input   wire         SDA_I
     , output  wire         SDA_O
     , output  wire         SDA_T
     //-------------------------------------------------------------------------
     , input   wire  [ 3:0] NUM_CLK_PRE
     , input   wire  [ 3:0] NUM_CLK_MID
     , input   wire  [ 3:0] NUM_CLK_POST
     , input   wire  [ 3:0] NUM_CLK_GAP
     //-------------------------------------------------------------------------
     `ifdef DEBUG
     // synthesis attribute keep of debug_sda is "true";
     // synthesis attribute keep of debug_scl is "true";
     , output  wire         debug_sda
     , output  wire         debug_scl
     `endif
);
    //--------------------------------------------------------------------------
    assign SCL_T=SCL_O;
    //--------------------------------------------------------------------------
    //             __    __    __    __    __    __    __    __
    // CLK      __|  |__|  |__|  |__|  |__|  |__|  |__|  |__|
    //             _____                               _____            
    // SCL_pos  __|     |_____________________________|     |______________
    //                               _____                            _____   
    // SCL_neg  ____________________|     |__________________________|     |__
    //                                           _____
    // SCL_drv  ________________________________|     |__________________________|
    //                   _________________             ____________________
    // SCL      ________|                 |___________|                    |__
    //--------------------------------------------------------------------------
    reg         SCL_pos=1'b0;
    reg         SCL_neg=1'b0;
    reg         SCL_drv=1'b0;
    reg  [30:0] clkCnt=31'h0; //half clock div
    wire [30:0] clkCntOne =(I2C_CLKDIV<4) ? 30'h4 : I2C_CLKDIV[30:1];
    wire [30:0] clkCntZero=(I2C_CLKDIV[0]==1'b1) ? clkCntOne+1 : clkCntOne;
    wire [30:0] clkCntDrv ={1'b0,clkCntZero[30:2]};
    //--------------------------------------------------------------------------
    localparam STK_POS=2'h0
             , STK_DRV=2'h1
             , STK_NEG=2'h2;
    (* mark_debug="true" *)reg [1:0] state_clk=STK_POS; // synthesis attribute keep of state is "true";
    //--------------------------------------------------------------------------
    always @ (posedge CLK or negedge RESET_N) begin
    if (RESET_N==1'b0) begin
        SCL_pos    <=  1'b0;
        SCL_neg    <=  1'b0;
        SCL_drv    <=  1'b0;
        clkCnt     <= 31'h1;
        state_clk  <= STK_POS;
    end else begin
        if (I2C_EN==1'b1) begin
           SCL_pos <= 1'b0;
           SCL_neg <= 1'b0;
           SCL_drv <= 1'b0;
           clkCnt  <= clkCnt+31'h1;
           case (state_clk)
           STK_POS: begin
               if (clkCnt>=clkCntOne) begin
                   SCL_neg   <= 1'b1;
                   clkCnt    <= 31'h1;
                   state_clk <= STK_DRV;
               end
               end // STK_POS
           STK_DRV: begin
               if (clkCnt>=clkCntDrv) begin
                   SCL_drv   <= 1'b1;
                   state_clk <= STK_NEG;
               end
               end // STK_DRV
           STK_NEG: begin
               if (clkCnt>=clkCntZero) begin
                   SCL_pos   <= 1'b1;
                   clkCnt    <= 31'h1;
                   state_clk <= STK_POS;
               end
               end // STK_NEG
           default: begin
                    SCL_pos   <=  1'b0;
                    SCL_neg   <=  1'b0;
                    clkCnt    <= 31'h1;
                    state_clk <= STK_POS;
                    end
           endcase
        end else begin
            SCL_pos    <=  1'b0;
            SCL_neg    <=  1'b0;
            clkCnt    <= 31'h1;
            state_clk <= STK_POS;
        end
    end // if
    end // always
    //--------------------------------------------------------------------------
    reg  [ 7:0] reg_I2C_NUM=8'h0;
    //--------------------------------------------------------------------------
    reg         reg_I2C_GO=1'b0;
    wire        reg_I2C_DONE;
    wire        reg_I2C_ACK; // 1=OK
    //--------------------------------------------------------------------------
    reg         reg_start=1'b0;   // use NUM_CLK_PRE
    reg         reg_drive=1'b0;   // use NUM_CLK_MID
    reg         reg_receive=1'b0; // use NUM_CLK_MID
    reg         reg_stop=1'b0;    // use NUM_CLK_POST and NUM_CLK_GAP
    reg         reg_repeat=1'b0;  // use NUM_CLK_GAP
    reg  [ 7:0] reg_tx_data=8'h0;
    wire [ 7:0] reg_rx_data;
    //--------------------------------------------------------------------------
    reg  [ 3:0] reg_NUM_CLK_PRE=4'h0;
    reg  [ 3:0] reg_NUM_CLK_MID=4'h0;
    reg  [ 3:0] reg_NUM_CLK_POST=4'h0;
    reg  [ 3:0] reg_NUM_CLK_GAP=4'h0;
    //--------------------------------------------------------------------------
    localparam ST_READY ='h0
             , ST_GO    ='h1
             , ST_CONT  ='h2
             , ST_DONE  ='h3;
    (* mark_debug="true" *)reg [1:0] state=ST_READY; // synthesis attribute keep of state is "true";
    //--------------------------------------------------------------------------
    // synthesis translate_off
    reg  [8*10-1:0] state_ascii="READY";
    always @ (state) begin
    case (state)
        ST_READY  : state_ascii="READY  ";
        ST_GO     : state_ascii="GO     ";
        ST_CONT   : state_ascii="CONT   ";
        ST_DONE   : state_ascii="DONE   ";
        default   : state_ascii="UNKNOWN";
    endcase
    end
    // synthesis translate_on
    //--------------------------------------------------------------------------
    reg [ 7:0] cnt        = 8'h0;
    //--------------------------------------------------------------------------
    always @ (posedge CLK or negedge RESET_N) begin
    if (RESET_N==1'b0) begin
        reg_I2C_NUM  <=8'h0;
        I2C_DONE     <=1'b0;
        fifo_snd_rdy <=1'b0;
        fifo_rcv_vld <=1'b0;
        fifo_rcv_dat <=8'b0;
        fifo_rcv_ack <=1'b0;
        reg_I2C_GO   <=1'b0;
        reg_start    <=1'b0;
        reg_drive    <=1'b0;
        reg_receive  <=1'b0;
        reg_stop     <=1'b0;
        reg_repeat   <=1'b0;
        reg_tx_data  <=8'h0;
        reg_NUM_CLK_PRE  <=4'h0;
        reg_NUM_CLK_MID  <=4'h0;
        reg_NUM_CLK_POST <=4'h0;
        reg_NUM_CLK_GAP  <=4'h0;
        cnt          <=8'h0;
        state        <=ST_READY;
    end else if (I2C_EN==1'b0) begin
        reg_I2C_NUM  <=8'h0;
        I2C_DONE     <=1'b0;
        fifo_snd_rdy <=1'b0;
        fifo_rcv_vld <=1'b0;
        fifo_rcv_dat <=8'b0;
        fifo_rcv_ack <=1'b0;
        reg_I2C_GO   <=1'b0;
        reg_start    <=1'b0;
        reg_drive    <=1'b0;
        reg_receive  <=1'b0;
        reg_stop     <=1'b0;
        reg_repeat   <=1'b0;
        reg_tx_data  <=8'h0;
        reg_NUM_CLK_PRE  <=NUM_CLK_PRE ;
        reg_NUM_CLK_MID  <=NUM_CLK_MID ;
        reg_NUM_CLK_POST <=NUM_CLK_POST;
        reg_NUM_CLK_GAP  <=NUM_CLK_GAP ;
        cnt          <=8'h0;
        state        <=ST_READY;
    end else begin
    case (state)
    ST_READY: begin
       if ((I2C_GO==1'b1)&&(fifo_snd_vld==1'b1)) begin
           reg_I2C_NUM  <= I2C_RUN_NUM;
           fifo_snd_rdy <= 1'b1;
           reg_I2C_GO   <= 1'b1;
           reg_start    <= fifo_snd_ctl[0];
           reg_drive    <= fifo_snd_ctl[1];
           reg_receive  <= fifo_snd_ctl[2];
           reg_stop     <= fifo_snd_ctl[3];
           reg_repeat   <= fifo_snd_ctl[4];
           reg_tx_data  <= fifo_snd_dat;
           cnt          <= 8'h1;
           state        <= ST_GO;
       end
       end // ST_READY
    ST_GO: begin
       fifo_snd_rdy <= 1'b0;
       fifo_rcv_vld <= 1'b0;
       if (reg_I2C_DONE==1'b1) begin
           cnt          <= cnt + 8'h1;
           reg_I2C_GO   <= 1'b0;
           fifo_rcv_ack <= reg_I2C_ACK;
           fifo_rcv_dat <= reg_rx_data;
           fifo_rcv_vld <= 1'b1;
           if (cnt>=reg_I2C_NUM) begin
               I2C_DONE <= 1'b1;
               state    <= ST_DONE;
           end else begin
               state    <= ST_CONT;
           end
       end
       end // ST_GO
    ST_CONT: begin
       fifo_rcv_vld <= 1'b0;
       if ((I2C_GO==1'b1)&&(fifo_snd_vld==1'b1)&&(reg_I2C_DONE==1'b0)) begin
           reg_I2C_NUM  <= I2C_RUN_NUM;
           fifo_snd_rdy <= 1'b1;
           reg_I2C_GO   <= 1'b1;
           reg_start    <= fifo_snd_ctl[0];
           reg_drive    <= fifo_snd_ctl[1];
           reg_receive  <= fifo_snd_ctl[2];
           reg_stop     <= fifo_snd_ctl[3];
           reg_repeat   <= fifo_snd_ctl[4];
           reg_tx_data  <= fifo_snd_dat;
           state        <= ST_GO;
       end
       end // ST_CONT
    ST_DONE: begin
       fifo_rcv_vld <= 1'b0;
       if (I2C_GO==1'b0) begin
           I2C_DONE <= 1'b0;
           state    <= ST_READY;
       end
       end // ST_DONE
    default: begin
             I2C_DONE     <=1'b0;
             fifo_snd_rdy <=1'b0;
             fifo_rcv_vld <=1'b0;
             fifo_rcv_dat <=8'b0;
             fifo_rcv_ack <=1'b0;
             reg_I2C_GO   <=1'b0;
             reg_start    <=1'b0;
             reg_drive    <=1'b0;
             reg_receive  <=1'b0;
             reg_stop     <=1'b0;
             reg_repeat   <=1'b0;
             reg_tx_data  <=8'h0;
             reg_NUM_CLK_PRE  <=NUM_CLK_PRE ;
             reg_NUM_CLK_MID  <=NUM_CLK_MID ;
             reg_NUM_CLK_POST <=NUM_CLK_POST;
             reg_NUM_CLK_GAP  <=NUM_CLK_GAP ;
             cnt          <=8'h0;
             state        <=ST_READY;
             end
    endcase
    end // if
    end // always
    //--------------------------------------------------------------------------
    i2c_master_byte
    u_byte (
          .RESET_N      ( RESET_N          )
        , .CLK          ( CLK              )
        , .SCL_pos      ( SCL_pos          )
        , .SCL_neg      ( SCL_neg          )
        , .SCL_drv      ( SCL_drv          )
        , .I2C_GO       ( reg_I2C_GO       )
        , .I2C_DONE     ( reg_I2C_DONE     )
        , .I2C_ACK      ( reg_I2C_ACK      )
        , .I2C_BUSY     ( I2C_BUSY         )
        , .start        ( reg_start        )
        , .drive        ( reg_drive        )
        , .receive      ( reg_receive      )
        , .stop         ( reg_stop         )
        , .startR       ( reg_repeat       )
        , .tx_data      ( reg_tx_data      )
        , .rx_data      ( reg_rx_data      )
        , .NUM_CLK_PRE  ( reg_NUM_CLK_PRE  )
        , .NUM_CLK_MID  ( reg_NUM_CLK_MID  )
        , .NUM_CLK_POST ( reg_NUM_CLK_POST )
        , .NUM_CLK_GAP  ( reg_NUM_CLK_GAP  )
        , .SCL_O        ( SCL_O            )
        , .SDA_I        ( SDA_I            )
        , .SDA_O        ( SDA_O            )
        , .SDA_T        ( SDA_T            )
        `ifdef DEBUG
        , .debug_sda ( debug_sda )
        , .debug_scl ( debug_scl )
        `endif
    );
    //--------------------------------------------------------------------------
endmodule
//------------------------------------------------------------------------------
// Revision history:
//
// 2025.09.10: Ando Ki
//------------------------------------------------------------------------------
