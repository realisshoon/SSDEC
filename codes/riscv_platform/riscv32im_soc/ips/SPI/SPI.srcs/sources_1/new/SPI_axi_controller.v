`timescale 1ns/1ps

//------------------------------------------------------------------------------
// mem_axi.v를 기반으로 수정된 AXI4-Full SPI 컨트롤러 래퍼
// - AXI FSM은 mem_axi.v 의 구조를 따름
// - 레지스터 맵은 SPI.v 의 로직을 따름
// - SPI_master.v  코어를 내부에 인스턴스화 함
//------------------------------------------------------------------------------
module spi_axi_controller
     #(parameter AXI_WIDTH_ID = 4 // ID width in bits
               , AXI_WIDTH_ADDR =32 // address width
               , AXI_WIDTH_DATA =32 // data width
               , AXI_WIDTH_STRB =(AXI_WIDTH_DATA/8)  // data strobe width
               , P_SIZE_IN_BYTES=4096) // SPI 레지스터 공간 크기 (예: 4KB)
(
    (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 axi_aresetn RST"  *) input  wire                      axi_aresetn,
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF s_axi, ASSOCIATED_RESET axi_aresetn" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 axi_aclk CLK"     *) input  wire                      axi_aclk,

    // AXI4-Full Slave 포트 [cite: 242-261]
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWID"    *) input  wire [AXI_WIDTH_ID-1:0]   s_axi_awid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWADDR"  *) input  wire [AXI_WIDTH_ADDR-1:0] s_axi_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWLEN"   *) input  wire [ 7:0]               s_axi_awlen,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWSIZE"  *) input  wire [ 2:0]               s_axi_awsize,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWBURST" *) input  wire [ 1:0]               s_axi_awburst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWVALID" *) input  wire                      s_axi_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWREADY" *) output reg                       s_axi_awready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WDATA"   *) input  wire [AXI_WIDTH_DATA-1:0] s_axi_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WSTRB"   *) input  wire [AXI_WIDTH_STRB-1:0] s_axi_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WLAST"   *) input  wire                      s_axi_wlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WVALID"  *) input  wire                      s_axi_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WREADY"  *) output reg                       s_axi_wready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BID"     *) output reg  [AXI_WIDTH_ID-1:0]   s_axi_bid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BRESP"   *) output reg  [ 1:0]               s_axi_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BVALID"  *) output reg                       s_axi_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BREADY"  *) input  wire                      s_axi_bready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARID"    *) input  wire [AXI_WIDTH_ID-1:0]   s_axi_arid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARADDR"  *) input  wire [AXI_WIDTH_ADDR-1:0] s_axi_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARLEN"   *) input  wire [ 7:0]               s_axi_arlen,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARSIZE"  *) input  wire [ 2:0]               s_axi_arsize,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARBURST" *) input  wire [ 1:0]               s_axi_arburst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARVALID" *) input  wire                      s_axi_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARREADY" *) output reg                       s_axi_arready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RID"     *) output reg  [AXI_WIDTH_ID-1:0]   s_axi_rid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RDATA"   *) output reg  [AXI_WIDTH_DATA-1:0] s_axi_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RRESP"   *) output reg  [ 1:0]               s_axi_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RLAST"   *) output reg                       s_axi_rlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RVALID"  *) output reg                       s_axi_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RREADY"  *) input  wire                      s_axi_rready,

    // SPI 핀 (riscv_cache_soc.v의 포트와 연결)
    output wire        spi_cs_n,
    output wire        spi_sck,
    output wire        spi_mosi,
    input  wire        spi_miso
);
//-------------------------------------------------------------------------
     localparam AXI_WIDTH_DSB=$clog2(AXI_WIDTH_STRB);
     localparam ADDR_LENGTH=$clog2(P_SIZE_IN_BYTES);
//-------------------------------------------------------------------------
     // SPI.v [cite: 4043-4045]의 레지스터 맵 정의
     localparam SPI_ENABLE   = 3'b000; // 0x00
     localparam SPI_COMMAND  = 3'b001; // 0x04
     localparam SPI_ADDRESS  = 3'b010; // 0x08
     localparam SPI_DATA_IN  = 3'b011; // 0x0C
     localparam SPI_DATA_OUT = 3'b100; // 0x10
    
     // SPI_master.v [cite: 340-345] 제어용 레지스터 선언
     reg         spi_en;
     reg [7:0]   spi_command;
     reg [23:0]  spi_address;
     reg [31:0]  spi_data_in;
     wire [31:0] spi_data_out;

     // SPI_master.v 인스턴스화 [cite: 4056-4058, 3397-3428]
     SPI_master u_spi_master (
         .clk            (axi_aclk),
         .rst            (~axi_aresetn), // Active Low Reset
         .en             (spi_en),
         .cs             (spi_cs_n),
         .sck            (spi_sck),
         .ext_command_in (spi_command),
         .ext_address_in (spi_address),
         .ext_data_in    (spi_data_in),
         .mosi           (spi_mosi),
         .miso           (spi_miso),
         .ext_data_out   (spi_data_out)
     );

//-------------------------------------------------------------------------
// AXI Write FSM (mem_axi.v 기반) 
//-------------------------------------------------------------------------
     reg  [AXI_WIDTH_ID-1:0]  AWID_reg   ;
     reg  [AXI_WIDTH_ADDR-1:0]  AWADDR_reg ;
     reg  [ 7:0]              AWLEN_reg  ;
     reg  [ 2:0]              AWSIZE_reg ;
     reg  [ 1:0]              AWBURST_reg;
     
     reg  [AXI_WIDTH_ADDR-1:0] addrW; // 버스트 동안 증가하는 주소
     reg  [ 7:0]            beatW;

     localparam STW_IDLE   = 'h0,
                STW_WRITE  = 'h2,
                STW_RSP    = 'h3;
     reg [1:0] stateW=STW_IDLE;

     always @ (posedge axi_aclk or negedge axi_aresetn) begin
     if (axi_aresetn==1'b0) begin
         AWID_reg    <= 'h0;
         AWADDR_reg  <= 'h0;
         AWLEN_reg   <= 'h0;
         AWSIZE_reg  <= 'b0;
         AWBURST_reg <= 'b0;
         s_axi_awready     <= 1'b0;
         s_axi_wready      <= 1'b0;
         s_axi_bid         <=  'h0;
         s_axi_bresp       <= 2'b10; // SLAVE ERROR
         s_axi_bvalid      <= 1'b0;
         addrW       <=  'h0;
         beatW       <=  'h0;
         stateW      <= STW_IDLE;
         
         // SPI 레지스터 리셋
         spi_en      <= 0;
         spi_command <= 0;
         spi_address <= 0;
         spi_data_in <= 0;
         
     end else begin
         case (stateW)
         STW_IDLE: begin
             if ((s_axi_awvalid==1'b1)&&(s_axi_awready==1'b1)) begin
                  AWID_reg    <= s_axi_awid   ;
                  AWADDR_reg  <= s_axi_awaddr ;
                  AWLEN_reg   <= s_axi_awlen  ;
                  AWSIZE_reg  <= s_axi_awsize ;
                  AWBURST_reg <= s_axi_awburst;
                  s_axi_awready     <= 1'b0;
                  s_axi_wready      <= 1'b1;
                  s_axi_bresp       <= 2'b00; // OKAY (기본 응답)
                  addrW       <= s_axi_awaddr; // 버스트 시작 주소 저장
                  beatW       <=  'h0;
                  stateW      <= STW_WRITE;
             end else begin
                  s_axi_awready <= 1'b1;
             end
             end // STW_IDLE

         STW_WRITE: begin
             if (s_axi_wvalid==1'b1) begin
                 // AXI 주소(addrW)의 하위 5비트로 레지스터 구분
                 // (addrW[4:2]는 4바이트(32비트) 단위 주소)
                 case (addrW[4:2]) 
                     SPI_ENABLE: begin
                         // WSTRB를 확인하여 바이트 단위 쓰기 지원
                         if (s_axi_wstrb[0]) spi_en <= s_axi_wdata[0];
                     end
                     SPI_COMMAND: begin
                         if (s_axi_wstrb[0]) spi_command <= s_axi_wdata[7:0];
                     end
                     SPI_ADDRESS: begin
                         // 24비트(3바이트) 쓰기
                         if (s_axi_wstrb[0]) spi_address[ 7: 0] <= s_axi_wdata[ 7: 0];
                         if (s_axi_wstrb[1]) spi_address[15: 8] <= s_axi_wdata[15: 8];
                         if (s_axi_wstrb[2]) spi_address[23:16] <= s_axi_wdata[23:16];
                     end
                     SPI_DATA_IN: begin
                         // 32비트(4바이트) 쓰기
                         if (s_axi_wstrb[0]) spi_data_in[ 7: 0] <= s_axi_wdata[ 7: 0];
                         if (s_axi_wstrb[1]) spi_data_in[15: 8] <= s_axi_wdata[15: 8];
                         if (s_axi_wstrb[2]) spi_data_in[23:16] <= s_axi_wdata[23:16];
                         if (s_axi_wstrb[3]) spi_data_in[31:24] <= s_axi_wdata[31:24];
                     end
                     default: begin
                         s_axi_bresp <= 2'b10; // SLVERR (잘못된 주소)
                     end
                 endcase

                 beatW  <= beatW + 1;
                 addrW  <= get_next_addr_wr(addrW,AWSIZE_reg,AWBURST_reg,AWLEN_reg);
                 
                 if (beatW>=AWLEN_reg) begin // 버스트의 마지막 쓰기
                     s_axi_wready <= 1'b0;
                     s_axi_bvalid <= 1'b1;
                     s_axi_bid    <= AWID_reg;
                     if (s_axi_wlast==1'b0) s_axi_bresp <= 2'b10; // SLVERR - WLAST 없음
                     stateW <= STW_RSP;
                 end
             end
             end // STW_WRITE

         STW_RSP: begin
             if (s_axi_bready==1'b1) begin
                 s_axi_bvalid  <= 1'b0;
                 s_axi_awready <= 1'b1;
                 stateW  <= STW_IDLE;
             end
             end // STW_RSP
         endcase
     end
     end

//-------------------------------------------------------------------------
// AXI Read FSM (mem_axi.v 기반) 
//-------------------------------------------------------------------------
     reg  [AXI_WIDTH_ADDR-1:0]  ARADDR_reg ;
     reg  [ 7:0]              ARLEN_reg  ;
     reg  [ 2:0]              ARSIZE_reg ;
     reg  [ 1:0]              ARBURST_reg;
     
     reg  [AXI_WIDTH_DATA-1:0] dataR;       // RREADY가 0일 때 데이터 임시 저장용
     reg  [AXI_WIDTH_ADDR-1:0] addrR;       // 버스트 동안 증가하는 주소
     reg  [ 7:0]             beatR;
     
     // 조합 논리로 AXI 읽기 주소에 따라 출력 데이터 선택
     reg [AXI_WIDTH_DATA-1:0] rdata_internal; 
     always @(*) begin
         case (addrR[4:2]) // 쓰기 FSM과 동일한 주소 맵
             SPI_ENABLE:   rdata_internal = {31'h0, spi_en};
             SPI_COMMAND:  rdata_internal = {24'h0, spi_command};
             SPI_ADDRESS:  rdata_internal = { 8'h0, spi_address};
             SPI_DATA_IN:  rdata_internal = spi_data_in;    // 쓰기 레지스터도 읽을 수 있게 함
             SPI_DATA_OUT: rdata_internal = spi_data_out;   // SPI_master의 출력 
             default:       rdata_internal = 32'hDEADBEEF; // 잘못된 주소 읽기
         endcase
     end

     localparam STR_IDLE   = 'h0,
                STR_READ0  = 'h1,
                STR_READ1  = 'h2,
                STR_READ2  = 'h3,
                STR_READ21 = 'h4,
                STR_READ22 = 'h5,
                STR_READ3  = 'h6,
                STR_READ31 = 'h7,
                STR_READ32 = 'h8,
                STR_READ33 = 'h9,
                STR_READ34 = 'hA,
                STR_END    = 'hB;
     reg [3:0] stateR=STR_IDLE;

     always @ (posedge axi_aclk or negedge axi_aresetn) begin
     if (axi_aresetn==1'b0) begin
         ARADDR_reg  <= 'h0;
         ARLEN_reg   <= 'h0;
         ARSIZE_reg  <= 'b0;
         ARBURST_reg <= 'b0;
         s_axi_arready     <= 1'b0;
         s_axi_rid         <=  'h0;
         s_axi_rlast       <= 1'b0;
         s_axi_rresp       <= 2'b10; // SLAERROR
         s_axi_rdata       <=  'h0;
         s_axi_rvalid      <= 1'b0;
         dataR       <=  'h0;
         addrR       <=  'h0;
         beatR       <=  'h0;
         stateR      <= STR_IDLE;
     end else begin
         case (stateR)
         STR_IDLE: begin
             if ((s_axi_arvalid==1'b1)&&(s_axi_arready==1'b1)) begin
                  ARADDR_reg  <= s_axi_araddr ;
                  ARLEN_reg   <= s_axi_arlen  ;
                  ARSIZE_reg  <= s_axi_arsize ;
                  ARBURST_reg <= s_axi_arburst;
                  s_axi_arready     <= 1'b0;
                  s_axi_rid         <= s_axi_arid;
                  addrR       <= s_axi_araddr; // 첫번째 읽기 주소
                  beatR       <=  'h0;
                  stateR      <= STR_READ0;
             end else begin
                 s_axi_arready <= 1'b1;
             end
             end // STR_IDLE
             
         // (FSM 흐름은 mem_axi.v와 동일하게 유지하여 AXI Read Latency 보장)
         STR_READ0: begin 
             addrR  <= get_next_addr_rd(addrR,ARSIZE_reg
                                       ,ARBURST_reg,ARLEN_reg);
             if (ARLEN_reg=='h0) begin // single beat burst
                 stateR <= STR_READ1;
             end else if (ARLEN_reg=='h1) begin // two-beat burst
                 stateR <= STR_READ2;
             end else begin // three or more beat burst
                 beatR  <= 1;
                 stateR <= STR_READ3;
             end
             end // STR_READ0
             
         STR_READ1: begin // 1-beat (last)
             s_axi_rlast  <= 1'b1;
             s_axi_rdata  <= rdata_internal; // SPI 데이터 출력
             s_axi_rresp  <= 2'b00;
             s_axi_rvalid <= 1'b1;
             stateR <= STR_END;
             end // STR_READ1
             
         STR_READ2: begin // 2-beat (1st)
             s_axi_rlast  <= 1'b0;
             s_axi_rdata  <= rdata_internal; // SPI 데이터 출력
             s_axi_rresp  <= 2'b00;
             s_axi_rvalid <= 1'b1;
             stateR <= STR_READ21;
             end // STR_READ2;
             
         STR_READ21: begin // 2-beat (2nd/last)
             if (s_axi_rready==1'b1) begin
                 addrR <= get_next_addr_rd(addrR,ARSIZE_reg,ARBURST_reg,ARLEN_reg); // 주소 업데이트
                 s_axi_rlast  <= 1'b1;
                 s_axi_rdata  <= rdata_internal; // SPI 데이터 출력
                 s_axi_rresp  <= 2'b00;
                 s_axi_rvalid <= 1'b1;
                 stateR <= STR_END;
             end else begin
                 dataR   <= rdata_internal; // RREADY가 0이면 데이터 임시 저장
                 stateR  <= STR_READ22;
             end
             end // STR_READ21
             
         STR_READ22: begin // 2-beat (RREADY=0 대기)
             if (s_axi_rready==1'b1) begin
                 s_axi_rlast  <= 1'b1;
                 s_axi_rdata  <= dataR ; // 임시 저장된 데이터 출력
                 s_axi_rresp  <= 2'b00;
                 s_axi_rvalid <= 1'b1;
                 stateR <= STR_END;
             end
             end // STR_READ22
             
         STR_READ3: begin // n-beat (1st)
             s_axi_rlast  <= 1'b0;
             s_axi_rdata  <= rdata_internal; // SPI 데이터 출력
             s_axi_rresp  <= 2'b00;
             s_axi_rvalid <= 1'b1;
             addrR  <= get_next_addr_rd(addrR,ARSIZE_reg
                                       ,ARBURST_reg,ARLEN_reg);
             beatR  <= beatR + 1;
             stateR <= STR_READ31;
             end // STR_READ3;
             
         STR_READ31: begin // n-beat (middle)
             if (s_axi_rready==1'b1) begin
                 s_axi_rlast  <= 1'b0;
                 s_axi_rdata  <= rdata_internal; // SPI 데이터 출력
                 s_axi_rresp  <= 2'b00;
                 s_axi_rvalid <= 1'b1;
                 if (beatR>=ARLEN_reg) begin
                    stateR <= STR_READ33; // 마지막 비트로 이동
                 end else begin
                    addrR  <= get_next_addr_rd(addrR,ARSIZE_reg
                                              ,ARBURST_reg,ARLEN_reg);
                 end
                 beatR  <= beatR + 1;
             end else begin
                 dataR  <= rdata_internal; // RREADY=0 대기
                 stateR <= STR_READ32;
             end
             end // STR_READ31
             
         STR_READ32: begin // n-beat (RREADY=0 대기)
             if (s_axi_rready==1'b1) begin
                 s_axi_rlast  <= 1'b0;
                 s_axi_rdata  <= dataR; // 임시 저장 데이터 출력
                 s_axi_rresp  <= 2'b00;
                 s_axi_rvalid <= 1'b1;
                 dataR  <= rdata_internal;
                 if (beatR>=ARLEN_reg) begin
                    stateR <= STR_READ33; // 마지막 비트로 이동
                 end else begin
                    addrR  <= get_next_addr_rd(addrR,ARSIZE_reg
                                              ,ARBURST_reg,ARLEN_reg);
                    stateR <= STR_READ31;
                 end
                 beatR  <= beatR + 1;
             end
             end // STR_READ32
             
         STR_READ33: begin // n-beat (last)
             if (s_axi_rready==1'b1) begin
                 s_axi_rlast  <= 1'b1;
                 s_axi_rdata  <= rdata_internal; // SPI 데이터 출력
                 s_axi_rresp  <= 2'b00;
                 s_axi_rvalid <= 1'b1;
                 stateR <= STR_END;
             end else begin
                 dataR  <= rdata_internal; // RREADY=0 대기
                 stateR <= STR_READ34;
             end
             end // STR_READ33
             
         STR_READ34: begin // n-beat (last, RREADY=0 대기)
             if (s_axi_rready==1'b1) begin
                 s_axi_rlast  <= 1'b1;
                 s_axi_rdata  <= dataR; // 임시 저장 데이터 출력
                 s_axi_rresp  <= 2'b00;
                 s_axi_rvalid <= 1'b1;
                 stateR <= STR_END;
             end
             end // STR_READ34
             
         STR_END: begin 
             if (s_axi_rready==1'b1) begin
                 s_axi_rdata   <=  'h0;
                 s_axi_rresp   <= 2'b10;
                 s_axi_rlast   <= 1'b0;
                 s_axi_rvalid  <= 1'b0;
                 s_axi_arready <= 1'b1;
                 stateR  <= STR_IDLE;
             end
             end // STR_END
         endcase
     end 
     end 
     
     //-------------------------------------------------------------------------
     // mem_axi.v [cite: 275-299]의 Function들 (버스트 주소 계산용)
     // (WRAP 미지원으로 단순화)
     //-------------------------------------------------------------------------
     function [AXI_WIDTH_ADDR-1:0] get_next_addr_wr;
     input [AXI_WIDTH_ADDR-1:0] addr ;
     input [ 2:0]            size ;
     input [ 1:0]            burst;
     input [ 7:0]            len  ;
     reg   [AXI_WIDTH_ADDR-AXI_WIDTH_DSB-1:0] naddr;
     reg   [AXI_WIDTH_ADDR-1:0] mask ;
     begin
          case (burst)
          2'b00: get_next_addr_wr = addr; // FIXED
          2'b01: begin // INCR
                 if ((1<<size)<AXI_WIDTH_STRB) begin
                    get_next_addr_wr = addr + (1<<size);
                 end else begin
                     naddr = addr[AXI_WIDTH_ADDR-1:AXI_WIDTH_DSB];
                     naddr = naddr + 1;
                     get_next_addr_wr = {naddr,{AXI_WIDTH_DSB{1'b0}}};
                 end
                 end
          2'b10: get_next_addr_wr = addr; // WRAP (지원 안함, FIXED로 동작)
          2'b11: get_next_addr_wr = addr; // Reserved
          endcase
     end
     endfunction
     
     function [AXI_WIDTH_ADDR-1:0] get_next_addr_rd;
     input [AXI_WIDTH_ADDR-1:0] addr ;
     input [ 2:0]            size ;
     input [ 1:0]            burst;
     input [ 7:0]            len  ;
     reg   [AXI_WIDTH_ADDR-AXI_WIDTH_DSB-1:0] naddr;
     reg   [AXI_WIDTH_ADDR-1:0] mask ;
     begin
          case (burst)
          2'b00: get_next_addr_rd = addr; // FIXED
          2'b01: begin // INCR
                 if ((1<<size)<AXI_WIDTH_STRB) begin
                    get_next_addr_rd = addr + (1<<size);
                 end else begin
                     naddr = addr[AXI_WIDTH_ADDR-1:AXI_WIDTH_DSB];
                     naddr = naddr + 1;
                     get_next_addr_rd = {naddr,{AXI_WIDTH_DSB{1'b0}}};
                 end
                 end
          2'b10: get_next_addr_rd = addr; // WRAP (지원 안함, FIXED로 동작)
          2'b11: get_next_addr_rd = addr; // Reserved
          endcase
     end
     endfunction
     
     function integer clogb2;
     input [31:0] value;
     reg   [31:0] tmp;
     begin
        tmp = value - 1;
        for (clogb2 = 0; tmp > 0; clogb2 = clogb2 + 1) tmp = tmp >> 1;
     end
     endfunction
     
endmodule
