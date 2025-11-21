//------------------------------------------------------------------------------
// Copyright (c) 2024 by Ando Ki.
// All right reserved.
//------------------------------------------------------------------------------
// SPI를 axi_switch_m3s3의 S2 슬레이브 포트에 연결하는 통합 테스트벤치
//------------------------------------------------------------------------------
`timescale 1ns/1ps

module top_axi_switch;
    //--------------------------------------------------------------------------
    localparam int  ACLK_FREQ_MHZ=100;
    localparam int  ACLK_FREQ=ACLK_FREQ_MHZ*1_000_000;
    localparam real ACLK_HALF=(1_000_000_000.0/ACLK_FREQ/2.0);
    
    // AXI 파라미터
    localparam int WIDTH_CID = 2;  // $clog2(3) = 2
    localparam int WIDTH_ID  = 4;
    localparam int WIDTH_AD  = 32;
    localparam int WIDTH_DA  = 32;
    localparam int WIDTH_DS  = 4;  // WIDTH_DA/8
    localparam int WIDTH_SID = WIDTH_CID + WIDTH_ID;  // 6
    
    // 주소 매핑 (axi_switch_m3s3 기본값)
    // tasks_spi_axi.sv에서 SPI_BASE = 0x0200_0000을 사용하므로 이를 맞춤
    localparam [WIDTH_AD-1:0] ADDR_BASE0 = 32'h0000_0000;  // S0
    localparam [WIDTH_AD-1:0] ADDR_BASE1 = 32'h0000_2000;  // S1
    localparam [WIDTH_AD-1:0] ADDR_BASE2 = 32'h0200_0000;  // S2 (SPI) - tasks_spi_axi.sv와 일치
    localparam int ADDR_LENGTH0 = 12;
    localparam int ADDR_LENGTH1 = 12;
    localparam int ADDR_LENGTH2 = 12;
    
    reg  axi_aresetn=1'b0; initial begin #124; axi_aresetn=1'b1; end
    reg  axi_aclk=1'b0; always #ACLK_HALF axi_aclk <= ~axi_aclk;
    
    //--------------------------------------------------------------------------
    // AXI Switch Master 0 포트 (Tester에서 사용)
    //--------------------------------------------------------------------------
    wire [WIDTH_ID-1:0]      M0_AWID;
    wire [WIDTH_AD-1:0]      M0_AWADDR;
    wire [ 7:0]              M0_AWLEN;
    wire                     M0_AWLOCK;
    wire [ 2:0]              M0_AWSIZE;
    wire [ 1:0]              M0_AWBURST;
    wire                     M0_AWVALID;
    wire                     M0_AWREADY;
    wire [ 3:0]              M0_AWCACHE;
    wire [ 2:0]              M0_AWPROT;
    
    wire [WIDTH_DA-1:0]      M0_WDATA;
    wire [WIDTH_DS-1:0]      M0_WSTRB;
    wire                     M0_WLAST;
    wire                     M0_WVALID;
    wire                     M0_WREADY;
    
    wire [WIDTH_ID-1:0]      M0_BID;
    wire [ 1:0]              M0_BRESP;
    wire                     M0_BVALID;
    wire                     M0_BREADY;
    
    wire [WIDTH_ID-1:0]      M0_ARID;
    wire [WIDTH_AD-1:0]      M0_ARADDR;
    wire [ 7:0]              M0_ARLEN;
    wire                     M0_ARLOCK;
    wire [ 2:0]              M0_ARSIZE;
    wire [ 1:0]              M0_ARBURST;
    wire                     M0_ARVALID;
    wire                     M0_ARREADY;
    wire [ 3:0]              M0_ARCACHE;
    wire [ 2:0]              M0_ARPROT;
    
    wire [WIDTH_ID-1:0]      M0_RID;
    wire [WIDTH_DA-1:0]      M0_RDATA;
    wire [ 1:0]              M0_RRESP;
    wire                     M0_RLAST;
    wire                     M0_RVALID;
    wire                     M0_RREADY;
    
    //--------------------------------------------------------------------------
    // AXI Switch Master 1, 2 포트 (사용하지 않음 - 0으로 연결)
    //--------------------------------------------------------------------------
    wire [WIDTH_ID-1:0]      M1_AWID = 0;
    wire [WIDTH_AD-1:0]      M1_AWADDR = 0;
    wire [ 7:0]              M1_AWLEN = 0;
    wire                     M1_AWLOCK = 0;
    wire [ 2:0]              M1_AWSIZE = 0;
    wire [ 1:0]              M1_AWBURST = 0;
    wire                     M1_AWVALID = 0;
    wire                     M1_AWREADY;
    
    wire [WIDTH_DA-1:0]      M1_WDATA = 0;
    wire [WIDTH_DS-1:0]      M1_WSTRB = 0;
    wire                     M1_WLAST = 0;
    wire                     M1_WVALID = 0;
    wire                     M1_WREADY;
    
    wire [WIDTH_ID-1:0]      M1_BID;
    wire [ 1:0]              M1_BRESP;
    wire                     M1_BVALID;
    wire                     M1_BREADY = 0;
    
    wire [WIDTH_ID-1:0]      M1_ARID = 0;
    wire [WIDTH_AD-1:0]      M1_ARADDR = 0;
    wire [ 7:0]              M1_ARLEN = 0;
    wire                     M1_ARLOCK = 0;
    wire [ 2:0]              M1_ARSIZE = 0;
    wire [ 1:0]              M1_ARBURST = 0;
    wire                     M1_ARVALID = 0;
    wire                     M1_ARREADY;
    
    wire [WIDTH_ID-1:0]      M1_RID;
    wire [WIDTH_DA-1:0]      M1_RDATA;
    wire [ 1:0]              M1_RRESP;
    wire                     M1_RLAST;
    wire                     M1_RVALID;
    wire                     M1_RREADY = 0;
    
    wire [WIDTH_ID-1:0]      M2_AWID = 0;
    wire [WIDTH_AD-1:0]      M2_AWADDR = 0;
    wire [ 7:0]              M2_AWLEN = 0;
    wire                     M2_AWLOCK = 0;
    wire [ 2:0]              M2_AWSIZE = 0;
    wire [ 1:0]              M2_AWBURST = 0;
    wire                     M2_AWVALID = 0;
    wire                     M2_AWREADY;
    
    wire [WIDTH_DA-1:0]      M2_WDATA = 0;
    wire [WIDTH_DS-1:0]      M2_WSTRB = 0;
    wire                     M2_WLAST = 0;
    wire                     M2_WVALID = 0;
    wire                     M2_WREADY;
    
    wire [WIDTH_ID-1:0]      M2_BID;
    wire [ 1:0]              M2_BRESP;
    wire                     M2_BVALID;
    wire                     M2_BREADY = 0;
    
    wire [WIDTH_ID-1:0]      M2_ARID = 0;
    wire [WIDTH_AD-1:0]      M2_ARADDR = 0;
    wire [ 7:0]              M2_ARLEN = 0;
    wire                     M2_ARLOCK = 0;
    wire [ 2:0]              M2_ARSIZE = 0;
    wire [ 1:0]              M2_ARBURST = 0;
    wire                     M2_ARVALID = 0;
    wire                     M2_ARREADY;
    
    wire [WIDTH_ID-1:0]      M2_RID;
    wire [WIDTH_DA-1:0]      M2_RDATA;
    wire [ 1:0]              M2_RRESP;
    wire                     M2_RLAST;
    wire                     M2_RVALID;
    wire                     M2_RREADY = 0;
    
    //--------------------------------------------------------------------------
    // AXI Switch Slave 0, 1 포트 (사용하지 않음 - 기본 슬레이브로 연결)
    //--------------------------------------------------------------------------
    wire [WIDTH_SID-1:0]     S0_AWID;
    wire [WIDTH_AD-1:0]      S0_AWADDR;
    wire [ 7:0]              S0_AWLEN;
    wire                     S0_AWLOCK;
    wire [ 2:0]              S0_AWSIZE;
    wire [ 1:0]              S0_AWBURST;
    wire                     S0_AWVALID;
    wire                     S0_AWREADY = 0;  // 연결 안됨
    
    wire [WIDTH_DA-1:0]      S0_WDATA;
    wire [WIDTH_DS-1:0]      S0_WSTRB;
    wire                     S0_WLAST;
    wire                     S0_WVALID;
    wire                     S0_WREADY = 0;
    
    wire [WIDTH_SID-1:0]    S0_BID;
    wire [ 1:0]              S0_BRESP;
    wire                     S0_BVALID;
    wire                     S0_BREADY = 0;
    
    wire [WIDTH_SID-1:0]    S0_ARID;
    wire [WIDTH_AD-1:0]      S0_ARADDR;
    wire [ 7:0]              S0_ARLEN;
    wire                     S0_ARLOCK;
    wire [ 2:0]              S0_ARSIZE;
    wire [ 1:0]              S0_ARBURST;
    wire                     S0_ARVALID;
    wire                     S0_ARREADY = 0;
    
    // S0_RID 초기화: 상위 비트를 3(11)로 설정하여 어떤 마스터 ID와도 일치하지 않도록 함
    // M0=0, M1=1, M2=2이므로 3은 사용되지 않는 값
    wire [WIDTH_SID-1:0]    S0_RID = {2'b11, {WIDTH_ID{1'b0}}};  // 상위 2비트를 3으로 설정
    wire [WIDTH_DA-1:0]     S0_RDATA;
    wire [ 1:0]              S0_RRESP;
    wire                     S0_RLAST;
    wire                     S0_RVALID;
    wire                     S0_RREADY = 0;
    
    wire [WIDTH_SID-1:0]     S1_AWID;
    wire [WIDTH_AD-1:0]      S1_AWADDR;
    wire [ 7:0]              S1_AWLEN;
    wire                     S1_AWLOCK;
    wire [ 2:0]              S1_AWSIZE;
    wire [ 1:0]              S1_AWBURST;
    wire                     S1_AWVALID;
    wire                     S1_AWREADY = 0;
    
    wire [WIDTH_DA-1:0]      S1_WDATA;
    wire [WIDTH_DS-1:0]      S1_WSTRB;
    wire                     S1_WLAST;
    wire                     S1_WVALID;
    wire                     S1_WREADY = 0;
    
    wire [WIDTH_SID-1:0]    S1_BID;
    wire [ 1:0]              S1_BRESP;
    wire                     S1_BVALID;
    wire                     S1_BREADY = 0;
    
    wire [WIDTH_SID-1:0]    S1_ARID;
    wire [WIDTH_AD-1:0]      S1_ARADDR;
    wire [ 7:0]              S1_ARLEN;
    wire                     S1_ARLOCK;
    wire [ 2:0]              S1_ARSIZE;
    wire [ 1:0]              S1_ARBURST;
    wire                     S1_ARVALID;
    wire                     S1_ARREADY = 0;
    
    // S1_RID 초기화: 상위 비트를 3(11)로 설정하여 어떤 마스터 ID와도 일치하지 않도록 함
    wire [WIDTH_SID-1:0]    S1_RID = {2'b11, {WIDTH_ID{1'b0}}};  // 상위 2비트를 3으로 설정
    wire [WIDTH_DA-1:0]     S1_RDATA;
    wire [ 1:0]              S1_RRESP;
    wire                     S1_RLAST;
    wire                     S1_RVALID;
    wire                     S1_RREADY = 0;
    
    //--------------------------------------------------------------------------
    // AXI Switch Slave 2 포트 (SPI에 연결)
    //--------------------------------------------------------------------------
    wire [WIDTH_SID-1:0]     S2_AWID;
    wire [WIDTH_AD-1:0]      S2_AWADDR;
    wire [ 7:0]              S2_AWLEN;
    wire                     S2_AWLOCK;
    wire [ 2:0]              S2_AWSIZE;
    wire [ 1:0]              S2_AWBURST;
    wire                     S2_AWVALID;
    wire                     S2_AWREADY;
    
    wire [WIDTH_DA-1:0]      S2_WDATA;
    wire [WIDTH_DS-1:0]      S2_WSTRB;
    wire                     S2_WLAST;
    wire                     S2_WVALID;
    wire                     S2_WREADY;
    
    wire [WIDTH_SID-1:0]    S2_BID;
    wire [ 1:0]              S2_BRESP;
    wire                     S2_BVALID;
    wire                     S2_BREADY;
    
    wire [WIDTH_SID-1:0]    S2_ARID;
    wire [WIDTH_AD-1:0]      S2_ARADDR;
    wire [ 7:0]              S2_ARLEN;
    wire                     S2_ARLOCK;
    wire [ 2:0]              S2_ARSIZE;
    wire [ 1:0]              S2_ARBURST;
    wire                     S2_ARVALID;
    wire                     S2_ARREADY;
    
    wire [WIDTH_SID-1:0]    S2_RID;
    wire [WIDTH_DA-1:0]     S2_RDATA;
    wire [ 1:0]              S2_RRESP;
    wire                     S2_RLAST;
    wire                     S2_RVALID;
    wire                     S2_RREADY;
    
    //--------------------------------------------------------------------------
    // SPI Interface
    //--------------------------------------------------------------------------
    wire        spi_cs_n;
    wire        spi_sck;
    wire        spi_mosi;
    wire        spi_miso;
    
    //--------------------------------------------------------------------------
    // MFRC522 모델 디버그 신호
    //--------------------------------------------------------------------------
    wire [7:0]  mfrc522_last_addr;
    wire [7:0]  mfrc522_last_data;
    wire        mfrc522_last_rw;
    
    //--------------------------------------------------------------------------
    // AXI Switch 인스턴스
    //--------------------------------------------------------------------------
    axi_switch_m3s3 #(
        .NUM_MASTER  (3),
        .NUM_SLAVE   (3),
        .WIDTH_CID   (WIDTH_CID),
        .WIDTH_ID    (WIDTH_ID),
        .WIDTH_AD    (WIDTH_AD),
        .WIDTH_DA    (WIDTH_DA),
        .WIDTH_DS    (WIDTH_DS),
        .WIDTH_SID   (WIDTH_SID),
        .SLAVE_EN0   (1),
        .SLAVE_EN1   (1),
        .SLAVE_EN2   (1),
        .ADDR_BASE0  (ADDR_BASE0),
        .ADDR_BASE1  (ADDR_BASE1),
        .ADDR_BASE2  (ADDR_BASE2),
        .ADDR_LENGTH0(ADDR_LENGTH0),
        .ADDR_LENGTH1(ADDR_LENGTH1),
        .ADDR_LENGTH2(ADDR_LENGTH2)
    ) u_axi_switch (
          .ARESETn              (axi_aresetn)
        , .ACLK                 (axi_aclk)
        // Master 0
        , .M0_AWID              (M0_AWID)
        , .M0_AWADDR             (M0_AWADDR)
        , .M0_AWLEN              (M0_AWLEN)
        , .M0_AWLOCK             (M0_AWLOCK)
        , .M0_AWSIZE             (M0_AWSIZE)
        , .M0_AWBURST            (M0_AWBURST)
        , .M0_AWCACHE            (M0_AWCACHE)
        , .M0_AWPROT             (M0_AWPROT)
        , .M0_AWVALID            (M0_AWVALID)
        , .M0_AWREADY            (M0_AWREADY)
        , .M0_WDATA              (M0_WDATA)
        , .M0_WSTRB              (M0_WSTRB)
        , .M0_WLAST              (M0_WLAST)
        , .M0_WVALID             (M0_WVALID)
        , .M0_WREADY             (M0_WREADY)
        , .M0_BID                (M0_BID)
        , .M0_BRESP              (M0_BRESP)
        , .M0_BVALID             (M0_BVALID)
        , .M0_BREADY             (M0_BREADY)
        , .M0_ARID               (M0_ARID)
        , .M0_ARADDR             (M0_ARADDR)
        , .M0_ARLEN              (M0_ARLEN)
        , .M0_ARLOCK             (M0_ARLOCK)
        , .M0_ARSIZE             (M0_ARSIZE)
        , .M0_ARBURST            (M0_ARBURST)
        , .M0_ARCACHE            (M0_ARCACHE)
        , .M0_ARPROT             (M0_ARPROT)
        , .M0_ARVALID            (M0_ARVALID)
        , .M0_ARREADY            (M0_ARREADY)
        , .M0_RID                (M0_RID)
        , .M0_RDATA              (M0_RDATA)
        , .M0_RRESP              (M0_RRESP)
        , .M0_RLAST              (M0_RLAST)
        , .M0_RVALID             (M0_RVALID)
        , .M0_RREADY             (M0_RREADY)
        // Master 1 (unused)
        , .M1_AWID               (M1_AWID)
        , .M1_AWADDR             (M1_AWADDR)
        , .M1_AWLEN              (M1_AWLEN)
        , .M1_AWLOCK             (M1_AWLOCK)
        , .M1_AWSIZE             (M1_AWSIZE)
        , .M1_AWBURST            (M1_AWBURST)
        , .M1_AWVALID            (M1_AWVALID)
        , .M1_AWREADY            (M1_AWREADY)
        , .M1_WDATA              (M1_WDATA)
        , .M1_WSTRB              (M1_WSTRB)
        , .M1_WLAST              (M1_WLAST)
        , .M1_WVALID             (M1_WVALID)
        , .M1_WREADY             (M1_WREADY)
        , .M1_BID                (M1_BID)
        , .M1_BRESP              (M1_BRESP)
        , .M1_BVALID             (M1_BVALID)
        , .M1_BREADY             (M1_BREADY)
        , .M1_ARID               (M1_ARID)
        , .M1_ARADDR             (M1_ARADDR)
        , .M1_ARLEN              (M1_ARLEN)
        , .M1_ARLOCK             (M1_ARLOCK)
        , .M1_ARSIZE             (M1_ARSIZE)
        , .M1_ARBURST            (M1_ARBURST)
        , .M1_ARVALID            (M1_ARVALID)
        , .M1_ARREADY            (M1_ARREADY)
        , .M1_RID                (M1_RID)
        , .M1_RDATA              (M1_RDATA)
        , .M1_RRESP              (M1_RRESP)
        , .M1_RLAST              (M1_RLAST)
        , .M1_RVALID             (M1_RVALID)
        , .M1_RREADY             (M1_RREADY)
        // Master 2 (unused)
        , .M2_AWID               (M2_AWID)
        , .M2_AWADDR             (M2_AWADDR)
        , .M2_AWLEN              (M2_AWLEN)
        , .M2_AWLOCK             (M2_AWLOCK)
        , .M2_AWSIZE             (M2_AWSIZE)
        , .M2_AWBURST            (M2_AWBURST)
        , .M2_AWVALID            (M2_AWVALID)
        , .M2_AWREADY            (M2_AWREADY)
        , .M2_WDATA              (M2_WDATA)
        , .M2_WSTRB              (M2_WSTRB)
        , .M2_WLAST              (M2_WLAST)
        , .M2_WVALID             (M2_WVALID)
        , .M2_WREADY             (M2_WREADY)
        , .M2_BID                (M2_BID)
        , .M2_BRESP              (M2_BRESP)
        , .M2_BVALID             (M2_BVALID)
        , .M2_BREADY              (M2_BREADY)
        , .M2_ARID               (M2_ARID)
        , .M2_ARADDR             (M2_ARADDR)
        , .M2_ARLEN              (M2_ARLEN)
        , .M2_ARLOCK             (M2_ARLOCK)
        , .M2_ARSIZE             (M2_ARSIZE)
        , .M2_ARBURST            (M2_ARBURST)
        , .M2_ARVALID            (M2_ARVALID)
        , .M2_ARREADY            (M2_ARREADY)
        , .M2_RID                (M2_RID)
        , .M2_RDATA              (M2_RDATA)
        , .M2_RRESP              (M2_RRESP)
        , .M2_RLAST              (M2_RLAST)
        , .M2_RVALID             (M2_RVALID)
        , .M2_RREADY             (M2_RREADY)
        // Slave 0 (unused)
        , .S0_AWID               (S0_AWID)
        , .S0_AWADDR             (S0_AWADDR)
        , .S0_AWLEN              (S0_AWLEN)
        , .S0_AWLOCK             (S0_AWLOCK)
        , .S0_AWSIZE             (S0_AWSIZE)
        , .S0_AWBURST            (S0_AWBURST)
        , .S0_AWVALID            (S0_AWVALID)
        , .S0_AWREADY             (S0_AWREADY)
        , .S0_WDATA               (S0_WDATA)
        , .S0_WSTRB               (S0_WSTRB)
        , .S0_WLAST               (S0_WLAST)
        , .S0_WVALID              (S0_WVALID)
        , .S0_WREADY              (S0_WREADY)
        , .S0_BID                 (S0_BID)
        , .S0_BRESP               (S0_BRESP)
        , .S0_BVALID              (S0_BVALID)
        , .S0_BREADY               (S0_BREADY)
        , .S0_ARID                (S0_ARID)
        , .S0_ARADDR              (S0_ARADDR)
        , .S0_ARLEN               (S0_ARLEN)
        , .S0_ARLOCK              (S0_ARLOCK)
        , .S0_ARSIZE              (S0_ARSIZE)
        , .S0_ARBURST             (S0_ARBURST)
        , .S0_ARVALID             (S0_ARVALID)
        , .S0_ARREADY             (S0_ARREADY)
        , .S0_RID                 (S0_RID)
        , .S0_RDATA               (S0_RDATA)
        , .S0_RRESP               (S0_RRESP)
        , .S0_RLAST               (S0_RLAST)
        , .S0_RVALID              (S0_RVALID)
        , .S0_RREADY               (S0_RREADY)
        // Slave 1 (unused)
        , .S1_AWID                (S1_AWID)
        , .S1_AWADDR               (S1_AWADDR)
        , .S1_AWLEN                (S1_AWLEN)
        , .S1_AWLOCK               (S1_AWLOCK)
        , .S1_AWSIZE               (S1_AWSIZE)
        , .S1_AWBURST              (S1_AWBURST)
        , .S1_AWVALID              (S1_AWVALID)
        , .S1_AWREADY              (S1_AWREADY)
        , .S1_WDATA                (S1_WDATA)
        , .S1_WSTRB                (S1_WSTRB)
        , .S1_WLAST                (S1_WLAST)
        , .S1_WVALID               (S1_WVALID)
        , .S1_WREADY               (S1_WREADY)
        , .S1_BID                  (S1_BID)
        , .S1_BRESP                (S1_BRESP)
        , .S1_BVALID               (S1_BVALID)
        , .S1_BREADY                (S1_BREADY)
        , .S1_ARID                 (S1_ARID)
        , .S1_ARADDR               (S1_ARADDR)
        , .S1_ARLEN                (S1_ARLEN)
        , .S1_ARLOCK               (S1_ARLOCK)
        , .S1_ARSIZE               (S1_ARSIZE)
        , .S1_ARBURST              (S1_ARBURST)
        , .S1_ARVALID              (S1_ARVALID)
        , .S1_ARREADY              (S1_ARREADY)
        , .S1_RID                  (S1_RID)
        , .S1_RDATA                (S1_RDATA)
        , .S1_RRESP                (S1_RRESP)
        , .S1_RLAST                (S1_RLAST)
        , .S1_RVALID               (S1_RVALID)
        , .S1_RREADY                (S1_RREADY)
        // Slave 2 (SPI 연결)
        , .S2_AWID                 (S2_AWID)
        , .S2_AWADDR               (S2_AWADDR)
        , .S2_AWLEN                (S2_AWLEN)
        , .S2_AWLOCK               (S2_AWLOCK)
        , .S2_AWSIZE               (S2_AWSIZE)
        , .S2_AWBURST              (S2_AWBURST)
        , .S2_AWVALID              (S2_AWVALID)
        , .S2_AWREADY              (S2_AWREADY)
        , .S2_WDATA                (S2_WDATA)
        , .S2_WSTRB                (S2_WSTRB)
        , .S2_WLAST                (S2_WLAST)
        , .S2_WVALID               (S2_WVALID)
        , .S2_WREADY                (S2_WREADY)
        , .S2_BID                  (S2_BID)
        , .S2_BRESP                (S2_BRESP)
        , .S2_BVALID               (S2_BVALID)
        , .S2_BREADY                (S2_BREADY)
        , .S2_ARID                 (S2_ARID)
        , .S2_ARADDR               (S2_ARADDR)
        , .S2_ARLEN                (S2_ARLEN)
        , .S2_ARLOCK               (S2_ARLOCK)
        , .S2_ARSIZE               (S2_ARSIZE)
        , .S2_ARBURST              (S2_ARBURST)
        , .S2_ARVALID              (S2_ARVALID)
        , .S2_ARREADY              (S2_ARREADY)
        , .S2_RID                  (S2_RID)
        , .S2_RDATA                (S2_RDATA)
        , .S2_RRESP                (S2_RRESP)
        , .S2_RLAST                (S2_RLAST)
        , .S2_RVALID               (S2_RVALID)
        , .S2_RREADY                (S2_RREADY)
    );
    
    //--------------------------------------------------------------------------
    // SPI AXI Controller 인스턴스 (S2에 연결)
    //--------------------------------------------------------------------------
    // axi4_to_lite와 동일하게 전체 SID를 사용 (하위 WIDTH_ID 비트만 사용하지만
    // 내부적으로는 전체 ID를 처리할 수 있도록 수정 필요)
    // 중간 wire를 사용하여 ID 신호 처리
    wire [WIDTH_SID-1:0]   spi_bid_full;
    wire [WIDTH_SID-1:0]   spi_rid_full;
    
    spi_axi_controller #(
        .AXI_WIDTH_ID   (WIDTH_SID),  // 전체 SID 사용 (axi4_to_lite와 동일)
        .AXI_WIDTH_ADDR (WIDTH_AD),
        .AXI_WIDTH_DATA (WIDTH_DA),
        .AXI_WIDTH_STRB (WIDTH_DS),
        .P_SIZE_IN_BYTES(4096)
    ) u_spi_axi (
          .axi_aresetn   (axi_aresetn)
        , .axi_aclk      (axi_aclk)
        , .s_axi_awid    (S2_AWID)                    // 전체 SID 사용
        , .s_axi_awaddr  (S2_AWADDR)
        , .s_axi_awlen   (S2_AWLEN)
        , .s_axi_awsize  (S2_AWSIZE)
        , .s_axi_awburst (S2_AWBURST)
        , .s_axi_awvalid (S2_AWVALID)
        , .s_axi_awready (S2_AWREADY)
        , .s_axi_wdata   (S2_WDATA)
        , .s_axi_wstrb   (S2_WSTRB)
        , .s_axi_wlast   (S2_WLAST)
        , .s_axi_wvalid  (S2_WVALID)
        , .s_axi_wready  (S2_WREADY)
        , .s_axi_bid     (spi_bid_full)               // 전체 SID 출력
        , .s_axi_bresp   (S2_BRESP)
        , .s_axi_bvalid  (S2_BVALID)
        , .s_axi_bready  (S2_BREADY)
        , .s_axi_arid    (S2_ARID)                    // 전체 SID 사용
        , .s_axi_araddr  (S2_ARADDR)
        , .s_axi_arlen   (S2_ARLEN)
        , .s_axi_arsize  (S2_ARSIZE)
        , .s_axi_arburst (S2_ARBURST)
        , .s_axi_arvalid (S2_ARVALID)
        , .s_axi_arready (S2_ARREADY)
        , .s_axi_rid     (spi_rid_full)               // 전체 SID 출력
        , .s_axi_rdata   (S2_RDATA)
        , .s_axi_rresp   (S2_RRESP)
        , .s_axi_rlast   (S2_RLAST)
        , .s_axi_rvalid  (S2_RVALID)
        , .s_axi_rready  (S2_RREADY)
        , .spi_cs_n      (spi_cs_n)
        , .spi_sck       (spi_sck)
        , .spi_mosi      (spi_mosi)
        , .spi_miso      (spi_miso)
    );
    
    // S2_BID, S2_RID는 spi_axi_controller에서 직접 출력
    // 단, 읽기 요청 시점에 S2_RID를 미리 설정하여 axi_switch의 RSELECT가 올바르게 동작하도록 함
    assign S2_BID = spi_bid_full;
    // 읽기 요청 시점(S2_ARVALID=1)에는 S2_ARID를 사용하여 RSELECT가 올바르게 설정되도록 함
    // 읽기 응답 시점(S2_RVALID=1)에는 spi_rid_full 사용
    // 그 외의 경우(초기 상태)에는 기본값 0을 사용하여 'X' 상태 방지
    assign S2_RID = (S2_RVALID) ? spi_rid_full : ((S2_ARVALID) ? S2_ARID : {WIDTH_SID{1'b0}});
    
    //--------------------------------------------------------------------------
    // MFRC522 모델 인스턴스
    //--------------------------------------------------------------------------
    mfrc522_model u_mfrc522 (
          .clk           (axi_aclk)
        , .rst           (~axi_aresetn)
        , .cs_n          (spi_cs_n)
        , .sck           (spi_sck)
        , .mosi          (spi_mosi)
        , .miso          (spi_miso)
        , .last_addr     (mfrc522_last_addr)
        , .last_data     (mfrc522_last_data)
        , .last_rw       (mfrc522_last_rw)
    );
    
    //--------------------------------------------------------------------------
    // Tester 인스턴스 (Master 0으로 SPI에 접근)
    //--------------------------------------------------------------------------
    tester #(.ACLK_FREQ(ACLK_FREQ))
    u_tester (
          .aresetn        (axi_aresetn)
        , .aclk           (axi_aclk)
        , .m_axi_awid     (M0_AWID)
        , .m_axi_awaddr   (M0_AWADDR)
        , .m_axi_awlen    (M0_AWLEN)
        , .m_axi_awsize   (M0_AWSIZE)
        , .m_axi_awburst  (M0_AWBURST)
        , .m_axi_awvalid  (M0_AWVALID)
        , .m_axi_awready  (M0_AWREADY)
        , .m_axi_awcache  (M0_AWCACHE)
        , .m_axi_awprot   (M0_AWPROT)
        , .m_axi_wdata    (M0_WDATA)
        , .m_axi_wstrb    (M0_WSTRB)
        , .m_axi_wlast    (M0_WLAST)
        , .m_axi_wvalid   (M0_WVALID)
        , .m_axi_wready   (M0_WREADY)
        , .m_axi_bid      (M0_BID)
        , .m_axi_bresp    (M0_BRESP)
        , .m_axi_bvalid   (M0_BVALID)
        , .m_axi_bready   (M0_BREADY)
        , .m_axi_arid     (M0_ARID)
        , .m_axi_araddr   (M0_ARADDR)
        , .m_axi_arlen    (M0_ARLEN)
        , .m_axi_arsize   (M0_ARSIZE)
        , .m_axi_arburst  (M0_ARBURST)
        , .m_axi_arvalid  (M0_ARVALID)
        , .m_axi_arready  (M0_ARREADY)
        , .m_axi_arcache  (M0_ARCACHE)
        , .m_axi_arprot   (M0_ARPROT)
        , .m_axi_rid      (M0_RID)
        , .m_axi_rdata    (M0_RDATA)
        , .m_axi_rresp    (M0_RRESP)
        , .m_axi_rlast    (M0_RLAST)
        , .m_axi_rvalid   (M0_RVALID)
        , .m_axi_rready   (M0_RREADY)
        , .spi_cs_n       (spi_cs_n)
        , .spi_sck        (spi_sck)
        , .spi_mosi       (spi_mosi)
        , .spi_miso       (spi_miso)
    );
    
    //--------------------------------------------------------------------------
    // Waveform dump
    //--------------------------------------------------------------------------
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0);
    end
    
    //--------------------------------------------------------------------------
    // AXI Write Address Channel 모니터링 (M0 -> S2)
    //--------------------------------------------------------------------------
    always @(posedge axi_aclk) begin
        if (M0_AWVALID && M0_AWREADY) begin
            $display("[%0t] M0 Write Address: AWADDR=0x%08X, AWID=%0d, AWVALID=%0d, AWREADY=%0d", 
                     $time, M0_AWADDR, M0_AWID, M0_AWVALID, M0_AWREADY);
        end
        if (S2_AWVALID && S2_AWREADY) begin
            $display("[%0t] S2 Write Address: AWADDR=0x%08X, AWID=%0d, AWVALID=%0d, AWREADY=%0d", 
                     $time, S2_AWADDR, S2_AWID, S2_AWVALID, S2_AWREADY);
        end
    end
    
    //--------------------------------------------------------------------------
    // AXI Write Data Channel 모니터링 (M0 -> S2)
    //--------------------------------------------------------------------------
    always @(posedge axi_aclk) begin
        if (M0_WVALID && M0_WREADY) begin
            $display("[%0t] M0 Write Data: WDATA=0x%08X, WSTRB=0x%X, WLAST=%0d, WVALID=%0d, WREADY=%0d", 
                     $time, M0_WDATA, M0_WSTRB, M0_WLAST, M0_WVALID, M0_WREADY);
        end
        if (S2_WVALID && S2_WREADY) begin
            $display("[%0t] S2 Write Data: WDATA=0x%08X, WSTRB=0x%X, WLAST=%0d, WVALID=%0d, WREADY=%0d", 
                     $time, S2_WDATA, S2_WSTRB, S2_WLAST, S2_WVALID, S2_WREADY);
        end
    end
    
    always @(S2_BVALID) $display("[%0t] S2_BVALID changed to %b", $time, S2_BVALID);
    always @(M0_BVALID) $display("[%0t] M0_BVALID changed to %b", $time, M0_BVALID);
    
    //--------------------------------------------------------------------------
    // AXI Write Response Channel 모니터링 (S2 -> M0)
    //--------------------------------------------------------------------------
    always @(posedge axi_aclk) begin
        if (S2_BVALID && S2_BREADY) begin
            $display("[%0t] S2 Write Response: BID=%0d, BRESP=%0b, BVALID=%0d, BREADY=%0d", 
                     $time, S2_BID, S2_BRESP, S2_BVALID, S2_BREADY);
        end
        if (M0_BVALID && M0_BREADY) begin
            $display("[%0t] M0 Write Response: BID=%0d, BRESP=%0b, BVALID=%0d, BREADY=%0d", 
                     $time, M0_BID, M0_BRESP, M0_BVALID, M0_BREADY);
        end
    end
    
    //--------------------------------------------------------------------------
    // SPI 트랜잭션 모니터링
    //--------------------------------------------------------------------------
    always @(negedge spi_cs_n) begin
        $display("[%0t] ========================================", $time);
        $display("[%0t] SPI Transaction START (via AXI Switch S2)", $time);
        $display("[%0t] ========================================", $time);
    end
    
    always @(posedge spi_cs_n) begin
        $display("[%0t] SPI Transaction END", $time);
        $display("[%0t]   MFRC522 Model - Addr:0x%02X, Data:0x%02X, R/W=%0d", 
                 $time, mfrc522_last_addr, mfrc522_last_data, mfrc522_last_rw);
        $display("[%0t] ========================================", $time);
    end

endmodule

