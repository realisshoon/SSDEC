//------------------------------------------------------------------------------
// Copyright (c) 2025 by Ando Ki
// All right reserved.
//------------------------------------------------------------------------------
// i2c_master_byte.v
//------------------------------------------------------------------------------
// I2C interface
//------------------------------------------------------------------------------
`include "i2c_master_define.v"

module i2c_master_byte
(
       input   wire         RESET_N
     , input   wire         CLK
     //-------------------------------------------------------------------------
     , input   wire         SCL_pos // a pulse indicating SCL posedge
     , input   wire         SCL_neg // a pulse indicating SCL negedge
     , input   wire         SCL_drv // a pulse indicating the point to drive signal
     //-------------------------------------------------------------------------
     , input   wire         I2C_GO
     , output  reg          I2C_DONE // one byte ack pulse
     , output  reg          I2C_ACK // 0=ACK_ERROR, 1=ACK_OK
     , output  wire         I2C_BUSY // in order to indicates a completion of I2C
     //-------------------------------------------------------------------------
     , input   wire         start   // use NUM_CLK_PRE
     , input   wire         drive   // use NUM_CLK_MID
     , input   wire         receive // use NUM_CLK_MID
     , input   wire         stop    // use NUM_CLK_POST and NUM_CLK_GAP
     , input   wire         startR  // use NUM_CLK_GAP
     , input   wire  [ 7:0] tx_data
     , output  reg   [ 7:0] rx_data
     //-------------------------------------------------------------------------
     , input   wire  [ 3:0] NUM_CLK_PRE
     , input   wire  [ 3:0] NUM_CLK_MID
     , input   wire  [ 3:0] NUM_CLK_POST
     , input   wire  [ 3:0] NUM_CLK_GAP
     //-------------------------------------------------------------------------
     , output  reg          SCL_O //==SCL_T
     , input   wire         SDA_I
     , output  reg          SDA_O
     , output  wire         SDA_T
     //-------------------------------------------------------------------------
     `ifdef DEBUG
     , output  reg          debug_sda
     , output  reg          debug_scl
     `endif
);
    //--------------------------------------------------------------------------
    `ifdef DEBUG
    // synthesis attribute keep of debug_sda is "true";
    // synthesis attribute keep of debug_scl is "true";
    always @ (posedge CLK) begin
            debug_sda <= SDA_I;
            debug_scl <= SCL_O;
    end
    `endif
    //--------------------------------------------------------------------------
    assign SDA_T = SDA_O;
    //--------------------------------------------------------------------------
    //             __0   __1   __2   __3   __4   __1   __2   __3   __4   __   
    // CLK      __|  |__|  |__|  |__|  |__|  |__|  |__|  |__|  |__|  |__|  |__
    //             _____                   _____                   _____
    // SCL_pos  __|     |_________________|     |_________________|     |_____
    //                         _____                   _____   
    // SCL_neg  ______________|     |_________________|     |_______________
    //                               _____                   _____
    // SCL_drv  ____________________|     |_________________|     |_________
    //                   ___________             ___________
    // SCL      ________|           |___________|           |____________
    //--------------------------------------------------------------------------
    localparam ST_READY    ='h0
             , ST_START    ='h1
             , ST_DRIVE    ='h2
             , ST_ACK_RCV  ='h3
             , ST_RECEIVE  ='h4
             , ST_ACK_SND  ='h5
             , ST_MID      ='h6
             , ST_CONT     ='h7
             , ST_POST     ='h8
             , ST_REPEAT   ='h9
             , ST_GAP      ='hA
             , ST_DROP     ='hB
             , ST_DROP_DONE='hC;
    (* mark_debug="true" *) reg [3:0] state=ST_READY; // synthesis attribute keep of state is "true";
    //--------------------------------------------------------------------------
    // synthesis translate_off
    reg  [8*10-1:0] state_ascii="IDLE";
    always @ (state) begin
    case (state)
        ST_READY    : state_ascii="READY    ";
        ST_START    : state_ascii="START    ";
        ST_DRIVE    : state_ascii="DRIVE    ";
        ST_ACK_RCV  : state_ascii="ACK_RCV  ";
        ST_RECEIVE  : state_ascii="RECEIVE  ";
        ST_ACK_SND  : state_ascii="ACK_SND  ";
        ST_MID      : state_ascii="MID      ";
        ST_CONT     : state_ascii="CONT     ";
        ST_POST     : state_ascii="POST     ";
        ST_REPEAT   : state_ascii="REPEAT   ";
        ST_GAP      : state_ascii="GAP      ";
        ST_DROP     : state_ascii="DROP     ";
        ST_DROP_DONE: state_ascii="DROP_DONE";
        default     : state_ascii="UNKNOWN  ";
    endcase
    end // always
    // synthesis translate_on
    //--------------------------------------------------------------------------
    assign I2C_BUSY=(state!=ST_READY); // in order to indicates a completion of I2C
    //--------------------------------------------------------------------------
    reg  [ 7:0] reg_tx_data=8'h0;
    reg  [ 3:0] cnt        =4'h0;
    //--------------------------------------------------------------------------
    always @ (posedge CLK or negedge RESET_N) begin
    if (RESET_N==1'b0) begin
        SCL_O       <= 1'b1;
        SDA_O       <= 1'b1;
        I2C_DONE    <= 1'b0;
        I2C_ACK     <= 1'b0;
        reg_tx_data <= 8'h0;
        rx_data     <= 8'h0;
        cnt         <= 4'h0;
        state       <= ST_READY;
    end else begin
    case (state)
    ST_READY: begin
       SDA_O <= 1'b1;
       if ((I2C_GO==1'b1)&&(SCL_pos==1'b1)) begin
            reg_tx_data  <= tx_data;
            rx_data      <= 8'h0;
            cnt          <= 4'h0;
            state        <= (start  ) ? ST_START // start always comes with drive
                          : (drive  ) ? ST_DRIVE
                          : (receive) ? ST_RECEIVE
                          : (stop   ) ? ST_POST
                          : (startR ) ? ST_REPEAT
                          : ST_DROP;
       end
       end // ST_READY
    ST_START: begin
       //           ______       _____ _____
       //    SDA          \_____X_____X_____
       //           ______|_____|   __    __
       //    SCL          |     \__|  |__|  
       //               __|   __|   __    __
       //    hidden_SCL   |__|  |__|  |__|
       //                 |     |
       //                 |     |
       //                 |<PRE>|
       if (SCL_drv==1'b1) begin
           SDA_O <= 1'b0;
       end
       if ((SCL_neg==1'b1)&&(SDA_O==1'b0)) begin
           SCL_O <= 1'b1;
           if (cnt==NUM_CLK_PRE) begin
               SCL_O <= 1'b0;
               cnt   <= 4'h0;
               state <= ST_DRIVE;
           end else begin
               cnt  <= cnt + 4'h1;
           end
           // synthesis translate_off
           if (drive==1'b0) $display("%d %m drive is expected", $time);
           if (receive==1'b1) $display("%d %m receive is not expected", $time);
           if (stop==1'b1) $display("%d %m stop is not expected", $time);
           // synthesis translate_on
       end
       end // ST_START
    ST_DRIVE: begin
       //            _____ _____ ____    _____ _____
       //    SDA    X_____X_____X____   X_____X_____X
       //               __    __    _  _    __    __
       //    SCL    ___| 1|__| 2|__|    |__|  |__| 8|__
       //                                     
            if (SCL_pos==1'b1) SCL_O <= 1'b1;
       else if (SCL_neg==1'b1) SCL_O <= 1'b0;
       if (SCL_drv==1'b1) begin
           cnt  <= cnt + 1;
           if (cnt==8) begin
               SDA_O <= 1'b1; // in order to get ack from slave
               state <= ST_ACK_RCV;
           end else begin
               SDA_O <= reg_tx_data[7]; reg_tx_data <= {reg_tx_data[6:0],1'b0};
           end
       end
       end // ST_DRIVE
    ST_ACK_RCV: begin
       //            ________
       //    SDA    X________XXXXXXXXXXXXXXXXXXXXXX
       //           |   __  
       //    SCL    |__|  |__________________________
       //           |                               
       //           |         __    __    __    __    __
       //    hidden_SCL    __| 1|__| 2|__|  |__|  |__|  |__
       //
       if (SCL_pos==1'b1) begin
           SCL_O <= 1'b1;
       end else if (SCL_neg==1'b1) begin
           SCL_O    <= 1'b0;
           I2C_ACK  <=~SDA_I;
           I2C_DONE <= 1'b1;
           cnt      <= 4'h1;
           state    <= (stop  ) ? ST_POST
                     : (startR) ? ST_REPEAT
                     : ST_MID;
       end
       // synthesis translate_off
       if (SDA_T==1'b0) $display("%d %m ERROR SDA_T should be 1", $time);
       // synthesis translate_on
       end // ST_ACK_RCV
    ST_RECEIVE: begin
       //            _____ _____ ____    _____ _____
       //    SDA    X_____X_____X____   X_____X_____X
       //               __    __    _  _    __    __
       //    SCL    ___| 1|__| 2|__|    |__|  |__| 8|__
       //                                     
            if (SCL_pos==1'b1) SCL_O <= 1'b1;
       else if (SCL_neg==1'b1) SCL_O <= 1'b0;
       if (SCL_neg==1'b1) begin
           cnt       <= cnt + 1;
           rx_data   <= {rx_data[6:0],SDA_I};
           if (cnt==7) begin // be careful (cnt increses when SCL_neg not SCL_drv)
               state <= ST_ACK_SND;
           end
       end
       end // ST_RECEIVE
    ST_ACK_SND: begin
       //            ________
       //    SDA    X________XXXXXXXXXXXXXXXXXXXXXX
       //           |   __  
       //    SCL    |__|  |__________________________
       //           |                               
       //           |         __    __    __    __    __
       //    hidden_SCL    __| 1|__| 2|__|  |__|  |__|  |__
       //
       if (SCL_drv==1'b1) begin
           SDA_O <= (stop  ) ? 1'b1 // drive NACK to indicates the end of accesses
                  : (startR) ? 1'b1
                  : 1'b0;
       end
       if (SCL_pos==1'b1) begin
           SCL_O <= 1'b1;
       end else if (SCL_neg==1'b1) begin
           SCL_O     <= 1'b0;
           I2C_ACK   <= (stop) ? 1'b0  // NAC indicates the end of accesses
                               : 1'b1;
           I2C_DONE  <= 1'b1;
           cnt       <= 4'h1;
           state     <= (stop  ) ? ST_POST
                      : (startR) ? ST_REPEAT
                      : ST_MID;
       end
       end // ST_ACK_RCV
    ST_MID: begin
       //            ________
       //    SDA    X________XXXXXXXXXXXXXXXXXXXXXX
       //           |   __  
       //    SCL    |__|  |__________________________
       //           |     |                         
       //           |     |   __    __    __    __    __
       //    hidden_SCL   |__| 1|__| 2|__|  |__|  |__|  |__
       //                 |<------------------>
       if (SCL_drv==1'b1) begin
           SDA_O <= 1'b1;
       end
       if (I2C_GO==1'b0) I2C_DONE <= 1'b0;
       if (SCL_neg==1'b1) begin
           if (cnt>=NUM_CLK_MID) begin
                if (I2C_DONE==1'b0) state <= ST_CONT;
           end else begin
               cnt <= cnt + 1;
           end
       end
       end // ST_MID
    ST_CONT: begin
       if (I2C_GO==1'b1) begin
            reg_tx_data  <= tx_data;
            rx_data      <= 8'h0;
            cnt          <= 4'h0;
            state        <= (start  ) ? ST_DROP // it cannot be here
                          : (drive  ) ? ST_DRIVE
                          : (receive) ? ST_RECEIVE
                          : (stop   ) ? ST_POST
                          : (startR ) ? ST_REPEAT
                          : ST_DROP;
       end
       end // ST_CONT
    ST_POST: begin
       //            _____ _____      
       //    SDA     _____X_____X_____X_____
       //               __    __|   ________
       //    SCL     __|  |__|  |__|  
       //               __    __|   __    __
       //    hidden_SCL   |__|  |__|  |__|
       //                       |
       //                       |
       //                       |<---- POST
       if (SCL_drv==1'b1) SDA_O <= 1'b0;
       if (I2C_GO==1'b0) I2C_DONE <= 1'b0;
       if (SCL_pos==1'b1) begin
           SCL_O <= 1'b1;
       end else if (SCL_neg==1'b1) begin
           if (cnt>=NUM_CLK_POST) begin
                cnt   <= 4'h1;
                state <= ST_GAP;
           end else begin
               cnt <= cnt + 1;
           end
       end
       end // ST_POST
    ST_REPEAT: begin
       //            _____ _____ ____________
       //    SDA     _____X_____X            
       //               __    __|   ________
       //    SCL     __|  |__|  |__|  
       //               __    __|   __    __
       //    hidden_SCL   |__|  |__|  |__|
       //                       |
       //                       |
       //                       |<---- REPEAT
       SDA_O <= 1'b1;
       if (I2C_GO==1'b0) I2C_DONE <= 1'b0;
       if (SCL_pos==1'b1) begin
           SCL_O <= 1'b1;
       end else if (SCL_neg==1'b1) begin
           if (cnt>=NUM_CLK_GAP) begin
               if (I2C_DONE==1'b0) state <= ST_READY;
           end else begin
               cnt <= cnt + 1;
           end
       end
       end // ST_POST
    ST_GAP: begin
       if (SCL_drv==1'b1) SDA_O <= 1'b1;
       if (SCL_neg==1'b1) begin
           if (cnt>=NUM_CLK_GAP) begin
               if (I2C_DONE==1'b0) state <= ST_READY;
           end else begin
               cnt <= cnt + 1;
           end
       end
       end // ST_GAP
    ST_DROP: begin
       I2C_DONE <= 1'b1;
       I2C_ACK  <= 1'b0;
       state    <= ST_DROP_DONE;
       end // ST_DROP
    ST_DROP_DONE: begin
       if (I2C_GO==1'b0) begin
           I2C_DONE <= 1'b0;
           state    <= ST_READY;
       end
       end // ST_DROP_DONE
    default: begin
             cnt   <= 8'h0;
             state <= ST_READY;
             end
    endcase
    end // if
    end // always
    //--------------------------------------------------------------------------
endmodule
//------------------------------------------------------------------------------
// Revision history:
//
// 2025.09.10: Ando Ki.
//------------------------------------------------------------------------------
