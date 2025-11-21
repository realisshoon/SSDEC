//------------------------------------------------------------------------------
// Copyright (c) 2024 by Ando Ki.
// All right reserved.
//------------------------------------------------------------------------------
`timescale 1ns/1ps

module top;
    //--------------------------------------------------------------------------
    localparam int  ACLK_FREQ_MHZ=100;
    localparam int  ACLK_FREQ=ACLK_FREQ_MHZ*1_000_000;
    localparam real ACLK_HALF=(1_000_000_000.0/ACLK_FREQ/2.0);
    
    reg  axi_aresetn=1'b0; initial begin #124; axi_aresetn=1'b1; end
    reg  axi_aclk=1'b0; always #ACLK_HALF axi_aclk <= ~axi_aclk;
    
    //--------------------------------------------------------------------------
    // AXI4-Full Interface
    //--------------------------------------------------------------------------
    wire [ 3:0]               m_axi_awid;
    wire [31:0]               m_axi_awaddr;
    wire [ 7:0]               m_axi_awlen;
    wire [ 2:0]               m_axi_awsize;
    wire [ 1:0]               m_axi_awburst;
    wire                      m_axi_awvalid;
    wire                      m_axi_awready;
    
    wire [31:0]               m_axi_wdata;
    wire [ 3:0]               m_axi_wstrb;
    wire                      m_axi_wlast;
    wire                      m_axi_wvalid;
    wire                      m_axi_wready;
    
    wire [ 3:0]               m_axi_bid;
    wire [ 1:0]               m_axi_bresp;
    wire                      m_axi_bvalid;
    wire                      m_axi_bready;
    
    wire [ 3:0]               m_axi_arid;
    wire [31:0]               m_axi_araddr;
    wire [ 7:0]               m_axi_arlen;
    wire [ 2:0]               m_axi_arsize;
    wire [ 1:0]               m_axi_arburst;
    wire                      m_axi_arvalid;
    wire                      m_axi_arready;
    
    wire [ 3:0]               m_axi_rid;
    wire [31:0]               m_axi_rdata;
    wire [ 1:0]               m_axi_rresp;
    wire                      m_axi_rlast;
    wire                      m_axi_rvalid;
    wire                      m_axi_rready;
    
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
    // SPI AXI Controller 인스턴스
    //--------------------------------------------------------------------------
    spi_axi_controller #(
        .AXI_WIDTH_ID   (4),
        .AXI_WIDTH_ADDR (32),
        .AXI_WIDTH_DATA (32),
        .AXI_WIDTH_STRB (4),
        .P_SIZE_IN_BYTES(4096)
    ) u_spi_axi (
          .axi_aresetn   (axi_aresetn)
        , .axi_aclk      (axi_aclk)
        , .s_axi_awid    (m_axi_awid)
        , .s_axi_awaddr  (m_axi_awaddr)
        , .s_axi_awlen   (m_axi_awlen)
        , .s_axi_awsize  (m_axi_awsize)
        , .s_axi_awburst (m_axi_awburst)
        , .s_axi_awvalid (m_axi_awvalid)
        , .s_axi_awready (m_axi_awready)
        , .s_axi_wdata   (m_axi_wdata)
        , .s_axi_wstrb   (m_axi_wstrb)
        , .s_axi_wlast   (m_axi_wlast)
        , .s_axi_wvalid  (m_axi_wvalid)
        , .s_axi_wready  (m_axi_wready)
        , .s_axi_bid     (m_axi_bid)
        , .s_axi_bresp   (m_axi_bresp)
        , .s_axi_bvalid  (m_axi_bvalid)
        , .s_axi_bready  (m_axi_bready)
        , .s_axi_arid    (m_axi_arid)
        , .s_axi_araddr  (m_axi_araddr)
        , .s_axi_arlen   (m_axi_arlen)
        , .s_axi_arsize  (m_axi_arsize)
        , .s_axi_arburst (m_axi_arburst)
        , .s_axi_arvalid (m_axi_arvalid)
        , .s_axi_arready (m_axi_arready)
        , .s_axi_rid     (m_axi_rid)
        , .s_axi_rdata   (m_axi_rdata)
        , .s_axi_rresp   (m_axi_rresp)
        , .s_axi_rlast   (m_axi_rlast)
        , .s_axi_rvalid  (m_axi_rvalid)
        , .s_axi_rready  (m_axi_rready)
        , .spi_cs_n      (spi_cs_n)
        , .spi_sck       (spi_sck)
        , .spi_mosi      (spi_mosi)
        , .spi_miso      (spi_miso)
    );
    
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
    // Tester 인스턴스
    //--------------------------------------------------------------------------
    tester #(.ACLK_FREQ(ACLK_FREQ))
    u_tester (
          .aresetn        (axi_aresetn)
        , .aclk           (axi_aclk)
        , .m_axi_awid     (m_axi_awid)
        , .m_axi_awaddr   (m_axi_awaddr)
        , .m_axi_awlen    (m_axi_awlen)
        , .m_axi_awsize   (m_axi_awsize)
        , .m_axi_awburst  (m_axi_awburst)
        , .m_axi_awvalid  (m_axi_awvalid)
        , .m_axi_awready  (m_axi_awready)
        , .m_axi_wdata    (m_axi_wdata)
        , .m_axi_wstrb    (m_axi_wstrb)
        , .m_axi_wlast    (m_axi_wlast)
        , .m_axi_wvalid   (m_axi_wvalid)
        , .m_axi_wready   (m_axi_wready)
        , .m_axi_bid      (m_axi_bid)
        , .m_axi_bresp    (m_axi_bresp)
        , .m_axi_bvalid   (m_axi_bvalid)
        , .m_axi_bready   (m_axi_bready)
        , .m_axi_arid     (m_axi_arid)
        , .m_axi_araddr   (m_axi_araddr)
        , .m_axi_arlen    (m_axi_arlen)
        , .m_axi_arsize   (m_axi_arsize)
        , .m_axi_arburst  (m_axi_arburst)
        , .m_axi_arvalid  (m_axi_arvalid)
        , .m_axi_arready  (m_axi_arready)
        , .m_axi_rid      (m_axi_rid)
        , .m_axi_rdata    (m_axi_rdata)
        , .m_axi_rresp    (m_axi_rresp)
        , .m_axi_rlast    (m_axi_rlast)
        , .m_axi_rvalid   (m_axi_rvalid)
        , .m_axi_rready   (m_axi_rready)
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
    // SPI 트랜잭션 모니터링 및 체크
    //--------------------------------------------------------------------------
    
    // CS_N과 SCK 동기화 체크
    always @(posedge spi_sck) begin
        if (spi_cs_n) begin
            $error("[%0t] ERROR: SCK toggled while CS_N is HIGH", $time);
        end
    end
    
    // SCK Rising Edge에서 MOSI/MISO 샘플링 (SPI Mode 0)
    reg [7:0] addr_byte_rx;
    reg [7:0] data_byte_rx;
    reg [2:0] bit_count_mon;
    reg       is_read_mon;
    
    always @(posedge spi_sck) begin
        if (!spi_cs_n) begin
            if (bit_count_mon < 8) begin
                // 주소 바이트 수신 중
                addr_byte_rx <= {addr_byte_rx[6:0], spi_mosi};
                is_read_mon <= spi_mosi;  // MSB is R/W bit
            end else begin
                // 데이터 바이트 수신 중
                if (!is_read_mon) begin
                    // Write: MOSI에서 데이터 읽기
                    data_byte_rx <= {data_byte_rx[6:0], spi_mosi};
                end else begin
                    // Read: MISO에서 데이터 읽기
                    data_byte_rx <= {data_byte_rx[6:0], spi_miso};
                end
            end
            bit_count_mon <= bit_count_mon + 1;
        end
    end
    
    always @(negedge spi_cs_n) begin
        bit_count_mon <= 0;
        addr_byte_rx <= 0;
        data_byte_rx <= 0;
        $display("[%0t] ========================================", $time);
        $display("[%0t] SPI Transaction START", $time);
        $display("[%0t] ========================================", $time);
    end
    
    always @(posedge spi_cs_n) begin
        if (bit_count_mon >= 8) begin
            $display("[%0t] SPI Transaction END", $time);
            $display("[%0t]   Address: 0x%02X (R/W=%0d)", 
                     $time, addr_byte_rx[6:0], is_read_mon);
            if (bit_count_mon >= 16) begin
                $display("[%0t]   Data: 0x%02X", $time, data_byte_rx);
            end
            $display("[%0t]   MFRC522 Model - Addr:0x%02X, Data:0x%02X, R/W=%0d", 
                     $time, mfrc522_last_addr, mfrc522_last_data, mfrc522_last_rw);
            $display("[%0t] ========================================", $time);
        end
        bit_count_mon <= 0;
    end
    
    // 주소 바이트 형식 체크 (모니터링된 주소 사용)
    always @(posedge spi_cs_n) begin
        if (addr_byte_rx[6:0] > 7'h7F) begin
            $error("[%0t] ERROR: Invalid address: 0x%02X (max 0x7F)", 
                   $time, addr_byte_rx[6:0]);
        end
    end
    
    // 트랜잭션 타이밍 체크
    time transaction_start_time;
    always @(negedge spi_cs_n) begin
        transaction_start_time = $time;
    end
    
    always @(posedge spi_cs_n) begin
        automatic time transaction_duration = $time - transaction_start_time;
        if (transaction_duration > 10000) begin  // 10us 이상이면 경고
            $warning("[%0t] WARNING: Transaction took %0d ns (may be too long)", 
                     $time, transaction_duration);
        end
    end

endmodule

