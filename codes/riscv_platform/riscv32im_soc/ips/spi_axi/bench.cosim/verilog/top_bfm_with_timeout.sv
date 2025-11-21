//------------------------------------------------------------------------------
// top_bfm_with_timeout.sv
//------------------------------------------------------------------------------
// Timeout-safe SPI 테스트를 위한 testbench
// - minimal_bfm_tasks.sv와 spi_timeout_wait_tasks.sv를 사용
// - 자동으로 트랜잭션 완료를 기다리고 정상 종료
//------------------------------------------------------------------------------
`timescale 1ns/1ps

module top_bfm_with_timeout;
    //--------------------------------------------------------------------------
    localparam int  ACLK_FREQ_MHZ=100;
    localparam int  ACLK_FREQ=ACLK_FREQ_MHZ*1_000_000;
    localparam real ACLK_HALF=(1_000_000_000.0/ACLK_FREQ/2.0);
    
    // AXI 파라미터
    localparam int WIDTH_ID  = 4;
    localparam int WIDTH_AD  = 32;
    localparam int WIDTH_DA  = 32;
    localparam int WIDTH_DS  = 4;
    localparam int WIDTH_SID = 6;
    
    // Clock and Reset
    reg  axi_aresetn=1'b0; initial begin #124; axi_aresetn=1'b1; end
    reg  axi_aclk=1'b0; always #ACLK_HALF axi_aclk <= ~axi_aclk;
    
    //--------------------------------------------------------------------------
    // AXI Master 신호 (BFM 대신 직접 제어)
    //--------------------------------------------------------------------------
    reg  [WIDTH_ID-1:0]      axi_awid;
    reg  [WIDTH_AD-1:0]      axi_awaddr;
    reg  [ 7:0]              axi_awlen;
    reg  [ 2:0]              axi_awsize;
    reg  [ 1:0]              axi_awburst;
    reg  [ 3:0]              axi_awcache;
    reg  [ 2:0]              axi_awprot;
    reg                      axi_awlock;
    reg                      axi_awvalid;
    wire                     axi_awready;
    reg  [WIDTH_DA-1:0]      axi_wdata;
    reg  [WIDTH_DS-1:0]      axi_wstrb;
    reg                      axi_wlast;
    reg                      axi_wvalid;
    wire                     axi_wready;
    wire [WIDTH_ID-1:0]      axi_bid;
    wire [ 1:0]              axi_bresp;
    wire                     axi_bvalid;
    reg                      axi_bready;
    reg  [WIDTH_ID-1:0]      axi_arid;
    reg  [WIDTH_AD-1:0]      axi_araddr;
    reg  [ 7:0]              axi_arlen;
    reg  [ 2:0]              axi_arsize;
    reg  [ 1:0]              axi_arburst;
    reg  [ 3:0]              axi_arcache;
    reg  [ 2:0]              axi_arprot;
    reg                      axi_arlock;
    reg                      axi_arvalid;
    wire                     axi_arready;
    wire [WIDTH_ID-1:0]      axi_rid;
    wire [WIDTH_DA-1:0]      axi_rdata;
    wire [ 1:0]              axi_rresp;
    wire                     axi_rlast;
    wire                     axi_rvalid;
    reg                      axi_rready;
    
    // 초기값 설정
    initial begin
        axi_awid     = 0;
        axi_awaddr   = 0;
        axi_awlen    = 0;
        axi_awsize   = 0;
        axi_awburst  = 0;
        axi_awcache  = 0;
        axi_awprot   = 0;
        axi_awlock   = 0;
        axi_awvalid  = 0;
        axi_wdata    = 0;
        axi_wstrb    = 0;
        axi_wlast    = 0;
        axi_wvalid   = 0;
        axi_bready   = 0;
        axi_arid     = 0;
        axi_araddr   = 0;
        axi_arlen    = 0;
        axi_arsize   = 0;
        axi_arburst  = 0;
        axi_arcache  = 0;
        axi_arprot   = 0;
        axi_arlock   = 0;
        axi_arvalid  = 0;
        axi_rready   = 0;
    end

    //--------------------------------------------------------------------------
    // SPI Interface
    //--------------------------------------------------------------------------
    wire                     spi_cs_n;
    wire                     spi_sck;
    wire                     spi_mosi;
    wire                     spi_miso;
    wire [2:0]               spi_state_out; 
    
    //--------------------------------------------------------------------------
    // SPI AXI Controller Instance
    //--------------------------------------------------------------------------
    spi_axi_controller #(
        .AXI_WIDTH_ID   (WIDTH_ID   ),
        .AXI_WIDTH_ADDR (WIDTH_AD   ),
        .AXI_WIDTH_DATA (WIDTH_DA   ),
        .AXI_WIDTH_STRB (WIDTH_DS   ),
        .P_SIZE_IN_BYTES(4096       ))
    u_spi_axi (
          .axi_aresetn   ( axi_aresetn      )
        , .axi_aclk      ( axi_aclk         )
        , .s_axi_awid    ( axi_awid         )
        , .s_axi_awaddr  ( axi_awaddr       )
        , .s_axi_awlen   ( axi_awlen        )
        , .s_axi_awsize  ( axi_awsize       )
        , .s_axi_awburst ( axi_awburst      )
        , .s_axi_awvalid ( axi_awvalid      )
        , .s_axi_awready ( axi_awready      )
        , .s_axi_wdata   ( axi_wdata        )
        , .s_axi_wstrb   ( axi_wstrb        )
        , .s_axi_wlast   ( axi_wlast        )
        , .s_axi_wvalid  ( axi_wvalid       )
        , .s_axi_wready  ( axi_wready       )
        , .s_axi_bid     ( axi_bid          )
        , .s_axi_bresp   ( axi_bresp        )
        , .s_axi_bvalid  ( axi_bvalid       )
        , .s_axi_bready  ( axi_bready       )
        , .s_axi_arid    ( axi_arid         )
        , .s_axi_araddr  ( axi_araddr       )
        , .s_axi_arlen   ( axi_arlen        )
        , .s_axi_arsize  ( axi_arsize       )
        , .s_axi_arburst ( axi_arburst      )
        , .s_axi_arvalid ( axi_arvalid      )
        , .s_axi_arready ( axi_arready      )
        , .s_axi_rid     ( axi_rid          )
        , .s_axi_rdata   ( axi_rdata        )
        , .s_axi_rresp   ( axi_rresp        )
        , .s_axi_rlast   ( axi_rlast        )
        , .s_axi_rvalid  ( axi_rvalid       )
        , .s_axi_rready  ( axi_rready       )
        , .spi_cs_n      ( spi_cs_n         )
        , .spi_sck       ( spi_sck          )
        , .spi_mosi      ( spi_mosi         )
        , .spi_miso      ( spi_miso         )
        , .spi_state_out ( spi_state_out    )
    );
    
    //--------------------------------------------------------------------------
    // MFRC522 Dummy Model Instance
    //--------------------------------------------------------------------------
    mfrc522_dummy u_mfrc522 (
          .rst_n         ( axi_aresetn      )
        , .cs_n          ( spi_cs_n         )
        , .sck           ( spi_sck          )
        , .mosi          ( spi_mosi         )
        , .miso          ( spi_miso         )
    );
    
    //--------------------------------------------------------------------------
    // BFM Tasks Include
    //--------------------------------------------------------------------------
    // 순서 중요: minimal_bfm_tasks.sv를 먼저 include해야 함
    `include "minimal_bfm_tasks.sv"
    `include "spi_timeout_wait_tasks.sv"
    
    //--------------------------------------------------------------------------
    // Waveform dump
    //--------------------------------------------------------------------------
    initial begin
       $dumpfile("wave_bfm_timeout.vcd");
       $dumpvars(0, top_bfm_with_timeout);
    end
    
    //--------------------------------------------------------------------------
    // 테스트 시나리오 실행
    //--------------------------------------------------------------------------
    initial begin
        $display("[%0t] ========================================", $time);
        $display("[%0t] SPI Timeout-Safe Test Start", $time);
        $display("[%0t] ========================================", $time);
        
        // Complete test 실행 (자동으로 모든 트랜잭션 완료 대기 및 정상 종료)
        spi_complete_test();
    end
    
    //--------------------------------------------------------------------------
    // Absolute timeout (안전장치)
    //--------------------------------------------------------------------------
    initial begin
        #100000000;  // 100ms absolute timeout
        $display("[%0t] WARNING: Absolute timeout reached. Forcing finish.", $time);
        $finish(1);
    end

endmodule


