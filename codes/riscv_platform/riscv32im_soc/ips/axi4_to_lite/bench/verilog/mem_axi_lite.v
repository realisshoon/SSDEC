//-----------------------------------------------------------------------------
// Copyright (c) 2022-2024 by Future Design Systems.
// All right reserved.
//------------------------------------------------------------------------------
// VERSION: 2024.06.14.
//------------------------------------------------------------------------------
module mem_axi_lite
     #(parameter MEM_SIZE_IN_BYTES=1024)
(
     (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
     (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST"  *) input  wire        aresetn,
     (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF s_axi,\
                                 ASSOCIATED_RESET aresetn" *)
     (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK"     *) input  wire        aclk,
     (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF s_axi,\
                                 ASSOCIATED_RESET aresetn,\
                                 CLK_DOMAIN axi_lite_aclk,\
                                 ADDR_WIDTH 32,DATA_WIDTH 32,PROTOCOL AXI4LITE" *)
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWADDR"  *) input  wire [31:0] s_axi_awaddr,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWVALID" *) input  wire        s_axi_awvalid,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWREADY" *) output reg         s_axi_awready,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WDATA"   *) input  wire [31:0] s_axi_wdata,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WVALID"  *) input  wire        s_axi_wvalid,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WREADY"  *) output reg         s_axi_wready,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BRESP"   *) output reg  [ 1:0] s_axi_bresp,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BVALID"  *) output reg         s_axi_bvalid,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BREADY"  *) input  wire        s_axi_bready,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARADDR"  *) input  wire [31:0] s_axi_araddr,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARVALID" *) input  wire        s_axi_arvalid,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARREADY" *) output reg         s_axi_arready,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RDATA"   *) output reg  [31:0] s_axi_rdata,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RRESP"   *) output reg  [ 1:0] s_axi_rresp,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RVALID"  *) output reg         s_axi_rvalid,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RREADY"  *) input  wire        s_axi_rready
);
    //--------------------------------------------------------------------------
    localparam MEM_ADDR_WIDTH=$clog2(MEM_SIZE_IN_BYTES);
    wire   [MEM_ADDR_WIDTH-1:0]  bram_addr;
    wire   [MEM_ADDR_WIDTH-3:0]  bram_addr_word=bram_addr[MEM_ADDR_WIDTH-1:2];
    wire   [31:0]                bram_wr_data;
    reg    [31:0]                bram_rd_data='h0;
    wire                         bram_en     ;
    wire                         bram_we     ;
    //-------------------------------------------------------------------------
    (* ram_style = "block" , ramstyle="no_rw_check" *) reg [31:0] Mem [0:1<<(MEM_ADDR_WIDTH-2)];
    //(* ram_style = "mixed" *) reg [FDW-1:0] Mem [0:FDT-1];
    //(* ramstyle = "no_rw_check" *) reg [FDW-1:0] Mem [0:FDT-1];
    always @ (posedge aclk ) begin
      if (bram_en & bram_we) begin
          Mem[bram_addr_word] <= bram_wr_data;
      end
      bram_rd_data <= Mem[bram_addr_word];
    end // always
    //--------------------------------------------------------------------------
    reg                    trans_wr=1'b0;
    reg                    trans_rd=1'b0;
    reg  [31:0]            Traddr='h0;
    reg  [31:0]            Twaddr='h0;
    wire [31:0]            Taddr = (trans_wr==1'b1) ? Twaddr : Traddr;
    reg  [31:0]            Twdata='h0;
    reg                    Twen=1'b0;
    wire [31:0]            Trdata;
    reg                    Tren=1'b0;// driven by stateR
    //-------------------------------------------------------------------------
    assign bram_addr    = Taddr[MEM_ADDR_WIDTH-1:0];
    assign bram_wr_data = Twdata;
    assign Trdata       = bram_rd_data;
    assign bram_en      = Tren|Twen;
    assign bram_we      = Twen;
    //-------------------------------------------------------------------------
    // synthesis translate_off
    always @ (posedge aclk) if (trans_wr&trans_rd) $display("%t %m ERROR", $time);
    // synthesis translate_on
    //-------------------------------------------------------------------------
    // write case
    //-------------------------------------------------------------------------
    localparam STW_READY  = 'h0,
               STW_ARB    = 'h1,
               STW_WRITE  = 'h2,
               STW_RSP    = 'h3;
    reg [1:0] stateW=STW_READY; // synthesis attribute keep of stateW is "true";
    always @ (posedge aclk or negedge aresetn) begin
    if (aresetn==1'b0) begin
        s_axi_awready <= 1'b0;
        s_axi_wready  <= 1'b0;
        s_axi_bresp   <= 2'b10; // SLAVE ERROR
        s_axi_bvalid  <= 1'b0;
        Twaddr        <=  'h0;
        Twdata        <=  'h0;
        Twen          <= 1'b0;
        trans_wr      <= 1'b0;
        stateW        <= STW_READY;
    end else begin
        case (stateW)
        STW_READY: begin
            trans_wr <= 1'b0;
            if ((s_axi_awvalid==1'b1)&&(s_axi_awready==1'b1)) begin
                 s_axi_awready <= 1'b0;
                 s_axi_bresp   <= 2'b00; // OKAY
                 Twaddr        <= s_axi_awaddr;
                 if (trans_rd==1'b1) begin // write has higher priority
                     stateW   <= STW_ARB;
                 end else begin
                     trans_wr     <= 1'b1;
                     s_axi_wready <= 1'b1;
                     stateW       <= STW_WRITE;
                 end
            end else begin
                 s_axi_awready <= 1'b1;
            end
            end // STW_READY
        STW_ARB: begin
            if (trans_rd==1'b0) begin
                trans_wr     <= 1'b1;
                s_axi_wready <= 1'b1;
                stateW       <= STW_WRITE;
            end
            end // STW_ARB
        STW_WRITE: begin
            if (s_axi_wvalid==1'b1) begin
                s_axi_wready <= 1'b0;
                Twdata <= s_axi_wdata;
                Twen   <= 1'b1;
                s_axi_bresp  <= 2'b00;
                s_axi_bvalid <= 1'b1;
                stateW       <= STW_RSP;
            end
            end // STW_WRITE
        STW_RSP: begin
            Twen     <= 1'b0;
            trans_wr <= 1'b0;
            if (s_axi_bready==1'b1) begin
                s_axi_bvalid  <= 1'b0;
                s_axi_bresp   <= 2'b10; // SLAVE ERROR
                s_axi_awready <= 1'b1;
                stateW        <= STW_READY;
            end
            end // STW_RSP
        default: begin
            s_axi_awready     <= 1'b0;
            s_axi_wready      <= 1'b0;
            s_axi_bresp       <= 2'b10; // SLAVE ERROR
            s_axi_bvalid      <= 1'b0;
            Twaddr      <=  'h0;
            Twdata      <=  'h0;
            Twen        <= 1'b0;
            trans_wr    <= 1'b0;
            stateW      <= STW_READY;
            end
        endcase
    end // if
    end // always
    //-------------------------------------------------------------------------
    // synthesis translate_off
    reg  [8*10-1:0] stateW_ascii = "READY";
    always @ (stateW) begin
    case (stateW)
        STW_READY : stateW_ascii="READY ";
        STW_ARB   : stateW_ascii="ARB   ";
        STW_WRITE : stateW_ascii="WRITE ";
        STW_RSP   : stateW_ascii="RSP   ";
        default   : stateW_ascii="ERROR ";
    endcase
    end
    // synthesis translate_on
    //-------------------------------------------------------------------------
    // read case
    //-------------------------------------------------------------------------
    localparam STR_READY= 'h0
             , STR_ARB  = 'h1
             , STR_READ0= 'h2
             , STR_READ1= 'h3
             , STR_END  = 'h4;
    reg [2:0] stateR=STR_READY; // synthesis attribute keep of stateR is "true";
    always @ (posedge aclk or negedge aresetn) begin
    if (aresetn==1'b0) begin
        s_axi_arready     <= 1'b0;
        s_axi_rresp       <= 2'b10; // SLAERROR
        s_axi_rdata       <=  'h0;
        s_axi_rvalid      <= 1'b0;
        Traddr      <=  'h0;
        Tren        <= 1'b0;
        trans_rd    <= 1'b0;
        stateR      <= STR_READY;
    end else begin
        case (stateR)
        STR_READY: begin
            trans_rd <= 1'b0;
            if ((s_axi_arvalid==1'b1)&&(s_axi_arready==1'b1)) begin
                 s_axi_arready     <= 1'b0;
                 Traddr      <= s_axi_araddr;
                 Tren        <= 1'b1;
                 if (((s_axi_awvalid==1'b1)&&(s_axi_awready==1'b1))||(trans_wr==1'b1)) begin
                     // write has higher priority
                     stateR      <= STR_ARB;
                 end else begin
                     trans_rd <= 1'b1;
                     stateR   <= STR_READ0;
                 end
            end else begin
                s_axi_arready <= 1'b1;
            end
            end // STR_READY
        STR_ARB: begin
            if (trans_wr==1'b0) begin
                trans_rd <= 1'b1;
                stateR   <= STR_READ0;
            end
            end // STR_ARB
        STR_READ0: begin // address only
            Tren   <= 1'b0;
            stateR <= STR_READ1;
            end // STR_READ0
        STR_READ1: begin // data only
            s_axi_rdata  <= Trdata;
            s_axi_rresp  <= 2'b00;
            s_axi_rvalid <= 1'b1;
            stateR <= STR_END;
            end // STR_READ1
        STR_END: begin // data only
            Tren <= 1'b0;
            if (s_axi_rready==1'b1) begin
                s_axi_rdata    <=  'h0;
                s_axi_rresp    <= 2'b10; // SLVERR
                s_axi_rvalid   <= 1'b0;
                s_axi_arready  <= 1'b1;
                trans_rd <= 1'b0;
                stateR   <= STR_READY;
            end
            end // STR_END
        default: begin
            s_axi_arready     <= 1'b0;
            s_axi_rresp       <= 2'b10; // SLAERROR
            s_axi_rdata       <=  'h0;
            s_axi_rvalid      <= 1'b0;
            Traddr      <=  'h0;
            Tren        <= 1'b0;
            trans_rd    <= 1'b0;
            stateR      <= STR_READY;
            end
        endcase
    end // if
    end // always
    //-------------------------------------------------------------------------
    // synthesis translate_off
    reg  [8*10-1:0] stateR_ascii = "READY";
    always @ (stateR) begin
    case (stateR)
        STR_READY : stateR_ascii="READY";
        STR_ARB   : stateR_ascii="ARB  ";
        STR_READ0 : stateR_ascii="READ0";
        STR_READ1 : stateR_ascii="READ1";
        STR_END   : stateR_ascii="END  ";
        default   : stateW_ascii="ERROR";
    endcase
    end
    // synthesis translate_on
    //-------------------------------------------------------------------------
endmodule
//------------------------------------------------------------------------------
// Revision history
//
// 2024.06.14: Rewritten by Ando Ki.
// 2022.10.04: Started by Ando Ki.
//------------------------------------------------------------------------------
