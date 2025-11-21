`timescale 1ns/1ps
//-----------------------------------------------------------------------------
// Copyright (c) 2024 by Ando Ki.
// All right reserved.
//------------------------------------------------------------------------------
// VERSION: 2024.07.01.
//------------------------------------------------------------------------------
module i2c_axi_lite_if
     #(parameter ADD_WIDTH=8)
(
      input  wire        aresetn
    , input  wire        aclk
    , input  wire [31:0] s_axi_awaddr
    , input  wire        s_axi_awvalid
    , output reg         s_axi_awready
    , input  wire [31:0] s_axi_wdata
    , input  wire        s_axi_wvalid
    , output reg         s_axi_wready
    , output reg  [ 1:0] s_axi_bresp
    , output reg         s_axi_bvalid
    , input  wire        s_axi_bready
    , input  wire [31:0] s_axi_araddr
    , input  wire        s_axi_arvalid
    , output reg         s_axi_arready
    , output reg  [31:0] s_axi_rdata
    , output reg  [ 1:0] s_axi_rresp
    , output reg         s_axi_rvalid
    , input  wire        s_axi_rready
    , output wire   [ADD_WIDTH-1:0]  bram_addr
    , output wire                    bram_wr
    , output wire   [31:0]           bram_wr_data
    , output wire                    bram_rd
    , input  wire   [31:0]           bram_rd_data
);
    //--------------------------------------------------------------------------
    reg                    arb_wr=1'b0;
    reg                    arb_rd=1'b0;
    reg                    trans_wr=1'b0;
    reg                    trans_rd=1'b0;
    reg  [31:0]            Traddr='h0;
    reg  [31:0]            Twaddr='h0;
    wire [31:0]            Taddr = (trans_wr==1'b1) ? Twaddr : Traddr;
    reg  [31:0]            Twdata='h0;
    reg                    Twen=1'b0;
    wire [31:0]            Trdata;
    reg                    Tren=1'b0;
    //-------------------------------------------------------------------------
    assign bram_addr    = Taddr[ADD_WIDTH-1:0];
    assign bram_wr_data = Twdata;
    assign Trdata       = bram_rd_data;
    assign bram_rd      = Tren;
    assign bram_wr      = Twen;
    //-------------------------------------------------------------------------
    localparam STW_READY  = 'h0,
               STW_ARB    = 'h1,
               STW_WRITE  = 'h2,
               STW_RSP    = 'h3;
    reg [1:0] stateW=STW_READY;
    always @ (posedge aclk or negedge aresetn) begin
    if (aresetn==1'b0) begin
        
        s_axi_wready  <= 1'b0;
        s_axi_bresp   <= 2'b10;
        s_axi_bvalid  <= 1'b0;
        Twaddr        <=  'h0;
        Twdata        <=  'h0;
        Twen          <= 1'b0;
        trans_wr      <= 1'b0;
        arb_wr        <= 1'b0;
        stateW        <= STW_READY;
    end else begin
        case (stateW)
        STW_READY: begin
            trans_wr <= 1'b0;
            if ((s_axi_awvalid==1'b1)&&(s_axi_awready==1'b1)) begin
                 s_axi_awready <= 1'b0;
                 s_axi_bresp   <= 2'b00;
                 Twaddr        <= s_axi_awaddr;
                 if ((trans_rd==1'b1)||(arb_rd==1'b1)) begin
                     arb_wr   <= 1'b1;
                     stateW   <= STW_ARB;
                 end else begin
                     trans_wr     <= 1'b1;
                     s_axi_wready <= 1'b1;
                     stateW       <= STW_WRITE;
                 end
            end else begin
                 s_axi_awready <= 1'b1;
            end
            end
        STW_ARB: begin
            if (trans_rd==1'b0) begin
                trans_wr     <= 1'b1;
                arb_wr       <= 1'b0;
                s_axi_wready <= 1'b1;
                stateW       <= STW_WRITE;
            end
            end
        STW_WRITE: begin
            if (s_axi_wvalid==1'b1) begin
                s_axi_wready <= 1'b0;
                Twdata <= s_axi_wdata;
                Twen   <= 1'b1;
                s_axi_bresp  <= 2'b00;
                s_axi_bvalid <= 1'b1;
                stateW       <= STW_RSP;
            end
            end
        STW_RSP: begin
            Twen     <= 1'b0;
            trans_wr <= 1'b0;
            if (s_axi_bready==1'b1) begin
                s_axi_bvalid  <= 1'b0;
                s_axi_bresp   <= 2'b10;
                s_axi_awready <= 1'b1;
                stateW        <= STW_READY;
            end
            end
        default: begin
            s_axi_awready     <= 1'b0;
            s_axi_wready      <= 1'b0;
            s_axi_bresp       <= 2'b10;
            s_axi_bvalid      <= 1'b0;
            Twaddr      <=  'h0;
            Twdata      <=  'h0;
            Twen        <= 1'b0;
            trans_wr    <= 1'b0;
            stateW      <= STW_READY;
            end
        endcase
    end
    end
    //-------------------------------------------------------------------------
    localparam STR_READY= 'h0
             , STR_ARB  = 'h1
             , STR_READ0= 'h2
             , STR_READ1= 'h3
             , STR_END  = 'h4;
    reg [2:0] stateR=STR_READY;
    
    always @ (posedge aclk or negedge aresetn) begin
    if (aresetn==1'b0) begin
        s_axi_arready     <= 1'b1;
        s_axi_rresp       <= 2'b10;
        s_axi_rdata       <=  'h0;
        s_axi_rvalid      <= 1'b0;
        Traddr      <=  'h0;
        Tren        <= 1'b0;
        trans_rd    <= 1'b0;
        arb_rd      <= 1'b0;
        stateR      <= STR_READY;
    end else begin
        case (stateR)
        STR_READY: begin
            trans_rd <= 1'b0;
            if ((s_axi_arvalid==1'b1)&&(s_axi_arready==1'b1)) begin
                 // ARREADY를 계속 1로 유지하여 상위 스위치가 다음 단계로 진행 가능
                 s_axi_arready  <= 1'b1;
                 Traddr         <= s_axi_araddr;
                 Tren           <= 1'b1;
                 // 읽기를 우선 진행: 중재 대기 없이 즉시 READ로 진입
                 arb_rd         <= 1'b0;
                 trans_rd       <= 1'b1;
                 stateR         <= STR_READ0;
            end else begin
                s_axi_arready <= 1'b1;
            end
            end
        STR_ARB: begin
            if (trans_wr==1'b0) begin
                trans_rd <= 1'b1;
                arb_rd   <= 1'b0;
                stateR   <= STR_READ0;
            end
            end
        STR_READ0: begin
            Tren   <= 1'b0;
            stateR <= STR_READ1;
            end
        STR_READ1: begin
            s_axi_rdata  <= Trdata;
            s_axi_rresp  <= 2'b00;
            s_axi_rvalid <= 1'b1;
            stateR <= STR_END;
            end
        STR_END: begin
            Tren <= 1'b0;
            if (s_axi_rready==1'b1) begin
                s_axi_rdata    <=  'h0;
                s_axi_rresp    <= 2'b10;
                s_axi_rvalid   <= 1'b0;
                s_axi_arready  <= 1'b1;
                trans_rd <= 1'b0;
                stateR   <= STR_READY;
            end
            end
        default: begin
            s_axi_arready     <= 1'b0;
            s_axi_rresp       <= 2'b10;
            s_axi_rdata       <=  'h0;
            s_axi_rvalid      <= 1'b0;
            Traddr      <=  'h0;
            Tren        <= 1'b0;
            trans_rd    <= 1'b0;
            stateR      <= STR_READY;
            end
        endcase
    end
    end
    //-------------------------------------------------------------------------
endmodule
//------------------------------------------------------------------------------
