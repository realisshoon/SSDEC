//------------------------------------------------------------------------------
// Copyright (c) 2024 by Ando Ki.
//------------------------------------------------------------------------------
// tester.sv - SPI AXI 테스트 벤치
//------------------------------------------------------------------------------
`timescale 1ns/1ps

module tester
     #(parameter ACLK_FREQ=100_000_000)
(
      input  wire                      aresetn
    , input  wire                      aclk
    
    // AXI4-Full Master Interface
    , output reg  [ 3:0]               m_axi_awid
    , output reg  [31:0]               m_axi_awaddr
    , output reg  [ 7:0]               m_axi_awlen
    , output reg  [ 2:0]               m_axi_awsize
    , output reg  [ 1:0]               m_axi_awburst
    , output reg                       m_axi_awvalid
    , input  wire                      m_axi_awready
    , output reg  [ 3:0]               m_axi_awcache
    , output reg  [ 2:0]               m_axi_awprot
    
    , output reg  [31:0]               m_axi_wdata
    , output reg  [ 3:0]               m_axi_wstrb
    , output reg                       m_axi_wlast
    , output reg                       m_axi_wvalid
    , input  wire                      m_axi_wready
    
    , input  wire [ 3:0]                m_axi_bid
    , input  wire [ 1:0]               m_axi_bresp
    , input  wire                      m_axi_bvalid
    , output reg                       m_axi_bready
    
    , output reg  [ 3:0]               m_axi_arid
    , output reg  [31:0]               m_axi_araddr
    , output reg  [ 7:0]               m_axi_arlen
    , output reg  [ 2:0]               m_axi_arsize
    , output reg  [ 1:0]               m_axi_arburst
    , output reg                       m_axi_arvalid
    , input  wire                      m_axi_arready
    , output reg  [ 3:0]               m_axi_arcache
    , output reg  [ 2:0]               m_axi_arprot
    
    , input  wire [ 3:0]               m_axi_rid
    , input  wire [31:0]               m_axi_rdata
    , input  wire [ 1:0]               m_axi_rresp
    , input  wire                      m_axi_rlast
    , input  wire                      m_axi_rvalid
    , output reg                       m_axi_rready
    
    // SPI Interface (for monitoring)
    , input  wire                      spi_cs_n
    , input  wire                      spi_sck
    , input  wire                      spi_mosi
    , input  wire                      spi_miso
);

    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    always @(m_axi_bready) $display("[%0t] m_axi_bready changed to %b", $time, m_axi_bready);
    always @(m_axi_bvalid) $display("[%0t] m_axi_bvalid changed to %b", $time, m_axi_bvalid);
    
    `include "tasks_axi_full.sv"
    `include "tasks_spi_axi.sv"
    //--------------------------------------------------------------------------
    
    initial begin
        m_axi_awid     <=  'h0;
        m_axi_awaddr   <=  'h0;
        m_axi_awlen    <=  'h0;
        m_axi_awsize   <= 3'b0;
        m_axi_awburst  <= 2'b0;
        m_axi_awvalid  <= 1'b0;
        m_axi_wdata    <=  'h0;
        m_axi_wstrb    <= 4'h0;
        m_axi_wlast    <= 1'b0;
        m_axi_wvalid   <= 1'b0;
        m_axi_bready   <= 1'b0;
        m_axi_arid     <=  'h0;
        m_axi_araddr   <=  'h0;
        m_axi_arlen    <=  'h0;
        m_axi_arsize   <= 3'b0;
        m_axi_arburst  <= 2'b0;
        m_axi_arvalid  <= 1'b0;
        m_axi_rready   <= 1'b0;
        m_axi_awcache  <= 4'b0;
        m_axi_awprot   <= 3'b0;
        m_axi_arcache  <= 4'b0;
        m_axi_arprot   <= 3'b0;
        
        wait (aresetn==1'b0);
        wait (aresetn==1'b1);
        repeat (100) @ (posedge aclk);
        
        $display("========================================");
        $display("SPI AXI Controller Test");
        $display("========================================");
        
        // 테스트 0: SPI_CTRL 직접 쓰기 테스트 (디버깅용)
        $display("\n[Test 0] Direct SPI_CTRL Write Test");
        $display("----------------------------");
        // 주소 설정 (MFRC522 레지스터 주소)
        $display("Writing SPI_ADDR: 0x%02X", MFRC522_REG_CONTROL);
        spi_write_reg(SPI_ADDR, MFRC522_REG_CONTROL);
        repeat(10) @(posedge aclk);
        // 데이터 설정
        $display("Writing SPI_DATA_IN: 0x%02X", 8'h10);
        spi_write_reg(SPI_DATA_IN, 8'h10);
        repeat(10) @(posedge aclk);
        // 트랜잭션 시작
        $display("Writing SPI_CTRL with enable=1...");
        spi_write_reg(SPI_CTRL, 32'h0000_0101);  // enable=1, rw=0, num_bytes=1
        repeat(100) @(posedge aclk);
        $display("[Test 0] Completed\n");
        
        // 테스트 1: 레지스터 읽기/쓰기 테스트
        test_register_access();
        
        // 테스트 2: MFRC522 초기화 및 버전 확인
        test_mfrc522_init();
        
        // 테스트 3: SPI 트랜잭션 분석
        test_transaction_analysis();
        
        // 테스트 4: 다중 바이트 읽기/쓰기
        test_multi_byte();
        
        repeat (100) @ (posedge aclk);
        $display("========================================");
        $display("All tests completed");
        $display("========================================");
        $finish(2);
    end
    
    //--------------------------------------------------------------------------
    // 테스트 1: 레지스터 접근 테스트
    //--------------------------------------------------------------------------
    task test_register_access;
        integer data;
    begin
        $display("\n[Test 1] Register Access Test");
        $display("----------------------------");
        
        // Address register 쓰기 (enable=0 상태에서 먼저 설정)
        $display("Writing ADDR register: 0x%08X", 32'h0000_0037);
        spi_write_reg(SPI_ADDR, 32'h0000_0037);
        repeat(10) @(posedge aclk);
        
        // Address register 읽기
        spi_read_reg(SPI_ADDR, data);
        $display("Reading ADDR register: 0x%08X", data);
        
        // Data input register 쓰기
        $display("Writing DATA_IN register: 0x%08X", 32'h0000_00AA);
        spi_write_reg(SPI_DATA_IN, 32'h0000_00AA);
        repeat(10) @(posedge aclk);
        
        // Data input register 읽기
        spi_read_reg(SPI_DATA_IN, data);
        $display("Reading DATA_IN register: 0x%08X", data);
        
        // Control register 쓰기 (enable=0, 단순 레지스터 테스트)
        $display("Writing CTRL register: 0x%08X (enable=0)", 32'h0000_0100);
        spi_write_reg(SPI_CTRL, 32'h0000_0100);
        repeat(10) @(posedge aclk);
        
        // Control register 읽기
        spi_read_reg(SPI_CTRL, data);
        $display("Reading CTRL register: 0x%08X", data);
        
        $display("[Test 1] PASSED\n");
    end
    endtask
    
    //--------------------------------------------------------------------------
    // 테스트 2: MFRC522 초기화
    //--------------------------------------------------------------------------
    task test_mfrc522_init;
    begin
        $display("\n[Test 2] MFRC522 Initialization Test");
        $display("----------------------------");
        mfrc522_init();
        $display("[Test 2] PASSED\n");
    end
    endtask
    
    //--------------------------------------------------------------------------
    // 테스트 3: 트랜잭션 분석
    //--------------------------------------------------------------------------
    task test_transaction_analysis;
        reg [7:0] read_data;
    begin
        $display("\n[Test 3] Transaction Analysis Test");
        $display("----------------------------");
        
        // Write 트랜잭션 분석
        spi_analyze_transaction(0, MFRC522_REG_CONTROL, 8'h10);
        repeat(100) @(posedge aclk);
        
        // Read 트랜잭션 분석
        spi_analyze_transaction(1, MFRC522_REG_VERSION, 0);
        repeat(100) @(posedge aclk);
        
        $display("[Test 3] PASSED\n");
    end
    endtask
    
    //--------------------------------------------------------------------------
    // 테스트 4: 다중 바이트 테스트
    //--------------------------------------------------------------------------
    task test_multi_byte;
        integer status;
    begin
        $display("\n[Test 4] Multi-byte Test");
        $display("----------------------------");
        
        // 주소 설정
        spi_write_reg(SPI_ADDR, MFRC522_REG_FIFO_DATA);
        
        // 데이터 설정
        spi_write_reg(SPI_DATA_IN, 8'hAA);
        
        // 4바이트 쓰기 트랜잭션
        $display("Starting 4-byte write transaction...");
        spi_start_transaction(0, 4);
        spi_wait_done();
        
        // 상태 확인
        spi_read_reg(SPI_STATUS, status);
        $display("Status after multi-byte write: 0x%08X", status);
        
        $display("[Test 4] PASSED\n");
    end
    endtask

endmodule

//------------------------------------------------------------------------------
// Revision History
//
// 2024.12.XX: Started by Ando Ki (andoki@gmail.com)
//------------------------------------------------------------------------------

