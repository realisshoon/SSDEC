//------------------------------------------------------------------------------
// minimal_bfm_tasks.sv
//------------------------------------------------------------------------------
// 최소한의 AXI 신호만 사용하여 SPI Write/Read 트랜잭션을 수행하는 BFM
// - AXI-switch를 거쳐 SPI Slave에 접근
// - Write: TXDATA 레지스터에 데이터 쓰기
// - Read: RXDATA 레지스터에서 데이터 읽기
//
// 사용법: top_bfm.sv 또는 다른 testbench에서 `include "minimal_bfm_tasks.sv"로 포함
//------------------------------------------------------------------------------
// `timescale은 상위 모듈에서 정의되어야 함

//------------------------------------------------------------------------------
// SPI 레지스터 주소 정의 (testbench 상수)
//------------------------------------------------------------------------------
// AXI switch Slave Port 2를 통해 접근하는 SPI AXI 컨트롤러의 주소
// 주소는 AXI switch의 ADDR_BASE2와 SPI 컨트롤러의 오프셋을 합친 값
// 주의: 이 파일을 include하기 전에 상위 모듈에서 이미 정의되어 있을 수 있음
`ifndef SPI_TXDATA_ADDR
`define SPI_TXDATA_ADDR   (32'h0200_0000 + 32'h08)  // DATA_IN 레지스터 (TXDATA)
`define SPI_RXDATA_ADDR   (32'h0200_0000 + 32'h0C)  // DATA_OUT 레지스터 (RXDATA)
`endif

//------------------------------------------------------------------------------
// 최소 AXI Write Task
//------------------------------------------------------------------------------
// 사용 신호: AWVALID, WVALID, BREADY만 사용
// 나머지 신호는 기본값(0)으로 고정
task minimal_axi_write;
    input  [31:0] addr;
    input  [31:0] data;
    output        success;
    integer       timeout;
begin
    success = 1'b0;
    timeout = 1000;
    
    $display("[%0t] ===== Minimal AXI Write Start =====", $time);
    $display("[%0t] Address: 0x%08X, Data: 0x%08X", $time, addr, data);
    
    //--------------------------------------------------------------------------
    // Write Address Channel: AWVALID만 사용
    //--------------------------------------------------------------------------
    @(posedge axi_aclk);
    axi_awid     <= #0.01 4'h0;      // 기본값
    axi_awaddr   <= #0.01 addr;
    axi_awlen    <= #0.01 8'h0;      // 기본값 (single beat)
    axi_awsize   <= #0.01 3'h2;      // 기본값 (4 bytes)
    axi_awburst  <= #0.01 2'h0;      // 기본값
    axi_awcache  <= #0.01 4'h0;      // 기본값
    axi_awprot   <= #0.01 3'h0;      // 기본값
    axi_awlock   <= #0.01 1'b0;      // 기본값
    axi_awvalid  <= #0.01 1'b1;     // 핵심 신호
    
    // AWREADY 대기
    @(posedge axi_aclk);
    while (axi_awready == 1'b0 && timeout > 0) begin
        @(posedge axi_aclk);
        timeout = timeout - 1;
    end
    
    if (timeout == 0) begin
        $display("[%0t] ERROR: AWREADY timeout", $time);
        axi_awvalid <= #0.01 1'b0;
        return;
    end
    
    axi_awvalid <= #0.01 1'b0;
    $display("[%0t] AWVALID handshake completed", $time);
    
    //--------------------------------------------------------------------------
    // Write Data Channel: WVALID만 사용
    //--------------------------------------------------------------------------
    timeout = 1000;
    @(posedge axi_aclk);
    axi_wdata  <= #0.01 data;
    axi_wstrb  <= #0.01 4'hF;        // 기본값 (4 bytes)
    axi_wlast  <= #0.01 1'b1;        // 기본값 (single beat)
    axi_wvalid <= #0.01 1'b1;        // 핵심 신호
    
    // WREADY 대기
    @(posedge axi_aclk);
    while (axi_wready == 1'b0 && timeout > 0) begin
        @(posedge axi_aclk);
        timeout = timeout - 1;
    end
    
    if (timeout == 0) begin
        $display("[%0t] ERROR: WREADY timeout", $time);
        axi_wvalid <= #0.01 1'b0;
        return;
    end
    
    axi_wvalid <= #0.01 1'b0;
    axi_wlast  <= #0.01 1'b0;
    $display("[%0t] WVALID handshake completed", $time);
    
    //--------------------------------------------------------------------------
    // Write Response Channel: BREADY만 사용
    //--------------------------------------------------------------------------
    timeout = 1000;
    axi_bready <= #0.01 1'b1;        // 핵심 신호
    
    // BVALID 대기
    @(posedge axi_aclk);
    while (axi_bvalid == 1'b0 && timeout > 0) begin
        @(posedge axi_aclk);
        timeout = timeout - 1;
    end
    
    if (timeout == 0) begin
        $display("[%0t] ERROR: BVALID timeout", $time);
        axi_bready <= #0.01 1'b0;
        return;
    end
    
    if (axi_bresp != 2'b00) begin
        $display("[%0t] ERROR: BRESP = 0x%0X (not OKAY)", $time, axi_bresp);
    end else begin
        $display("[%0t] BVALID handshake completed (OKAY)", $time);
        success = 1'b1;
    end
    
    @(posedge axi_aclk);
    axi_bready <= #0.01 1'b0;
    
    $display("[%0t] ===== Minimal AXI Write Complete =====", $time);
end
endtask

//------------------------------------------------------------------------------
// 최소 AXI Read Task
//------------------------------------------------------------------------------
// 사용 신호: ARVALID, RREADY만 사용
// 나머지 신호는 기본값(0)으로 고정
task minimal_axi_read;
    input  [31:0] addr;
    output [31:0] data;
    output        success;
    integer       timeout;
begin
    success = 1'b0;
    data = 32'hXXXXXXXX;
    timeout = 1000;
    
    $display("[%0t] ===== Minimal AXI Read Start =====", $time);
    $display("[%0t] Address: 0x%08X", $time, addr);
    
    //--------------------------------------------------------------------------
    // Read Address Channel: ARVALID만 사용
    //--------------------------------------------------------------------------
    @(posedge axi_aclk);
    axi_arid     <= #0.01 4'h0;      // 기본값
    axi_araddr   <= #0.01 addr;
    axi_arlen    <= #0.01 8'h0;      // 기본값 (single beat)
    axi_arsize   <= #0.01 3'h2;      // 기본값 (4 bytes)
    axi_arburst  <= #0.01 2'h0;      // 기본값
    axi_arcache  <= #0.01 4'h0;      // 기본값
    axi_arprot   <= #0.01 3'h0;      // 기본값
    axi_arlock   <= #0.01 1'b0;      // 기본값
    axi_arvalid  <= #0.01 1'b1;     // 핵심 신호
    
    // ARREADY 대기
    @(posedge axi_aclk);
    while (axi_arready == 1'b0 && timeout > 0) begin
        @(posedge axi_aclk);
        timeout = timeout - 1;
    end
    
    if (timeout == 0) begin
        $display("[%0t] ERROR: ARREADY timeout", $time);
        axi_arvalid <= #0.01 1'b0;
        return;
    end
    
    axi_arvalid <= #0.01 1'b0;
    $display("[%0t] ARVALID handshake completed", $time);
    
    //--------------------------------------------------------------------------
    // Read Data Channel: RREADY만 사용
    //--------------------------------------------------------------------------
    timeout = 1000;
    axi_rready <= #0.01 1'b1;        // 핵심 신호
    
    // RVALID 대기
    @(posedge axi_aclk);
    while (axi_rvalid == 1'b0 && timeout > 0) begin
        @(posedge axi_aclk);
        timeout = timeout - 1;
    end
    
    if (timeout == 0) begin
        $display("[%0t] ERROR: RVALID timeout", $time);
        axi_rready <= #0.01 1'b0;
        return;
    end
    
    data = axi_rdata;
    
    if (axi_rresp != 2'b00) begin
        $display("[%0t] ERROR: RRESP = 0x%0X (not OKAY)", $time, axi_rresp);
    end else begin
        $display("[%0t] RVALID handshake completed (OKAY)", $time);
        $display("[%0t] Read Data: 0x%08X", $time, data);
        success = 1'b1;
    end
    
    @(posedge axi_aclk);
    axi_rready <= #0.01 1'b0;
    
    $display("[%0t] ===== Minimal AXI Read Complete =====", $time);
end
endtask

//------------------------------------------------------------------------------
// SPI Write Transaction (TXDATA에 데이터 쓰기)
//------------------------------------------------------------------------------
task spi_write_txdata;
    input  [7:0] tx_data;
    output       success;
    reg [31:0]   write_data;
    reg          write_success;
begin
    $display("[%0t] ===== SPI Write TXDATA =====", $time);
    $display("[%0t] TX Data: 0x%02X", $time, tx_data);
    
    // TXDATA 레지스터에 데이터 쓰기
    write_data = {24'h0, tx_data};
    minimal_axi_write(`SPI_TXDATA_ADDR, write_data, write_success);
    
    success = write_success;
    
    if (success) begin
        $display("[%0t] SPI Write TXDATA: SUCCESS", $time);
    end else begin
        $display("[%0t] SPI Write TXDATA: FAILED", $time);
    end
    
    // SPI 신호 관찰을 위한 짧은 대기
    repeat(100) @(posedge axi_aclk);  // 100 clock cycles
end
endtask

//------------------------------------------------------------------------------
// SPI Read Transaction (RXDATA에서 데이터 읽기)
//------------------------------------------------------------------------------
task spi_read_rxdata;
    output [7:0] rx_data;
    output       success;
    reg [31:0]   read_data;
    reg          read_success;
begin
    $display("[%0t] ===== SPI Read RXDATA =====", $time);
    
    // RXDATA 레지스터에서 데이터 읽기
    minimal_axi_read(`SPI_RXDATA_ADDR, read_data, read_success);
    
    rx_data = read_data[7:0];
    success = read_success;
    
    if (success) begin
        $display("[%0t] SPI Read RXDATA: SUCCESS, Data: 0x%02X", $time, rx_data);
    end else begin
        $display("[%0t] SPI Read RXDATA: FAILED", $time);
    end
    
    // SPI 신호 관찰을 위한 짧은 대기
    // 주의: ACLK_HALF는 상위 모듈에서 정의되어야 함
    repeat(100) @(posedge axi_aclk);
end
endtask

//------------------------------------------------------------------------------
// 최소 SPI 테스트 시나리오
//------------------------------------------------------------------------------
// 1. Write 트랜잭션 1회 → MOSI 확인
// 2. Read 트랜잭션 1회 → MISO 확인
task minimal_spi_test;
    reg [7:0] write_data;
    reg [7:0] read_data;
    reg       write_success;
    reg       read_success;
begin
    $display("[%0t] ========================================", $time);
    $display("[%0t] Minimal SPI Test Start", $time);
    $display("[%0t] ========================================", $time);
    
    // Reset 해제 대기
    wait(axi_aresetn == 1'b1);
    repeat(100) @(posedge axi_aclk);  // 100 clock cycles
    
    //--------------------------------------------------------------------------
    // Test 1: SPI Write (TXDATA) → MOSI 확인
    //--------------------------------------------------------------------------
    $display("[%0t] --- Test 1: SPI Write TXDATA (MOSI check) ---", $time);
    write_data = 8'hA5;
    spi_write_txdata(write_data, write_success);
    
    if (!write_success) begin
        $display("[%0t] ERROR: SPI Write failed", $time);
        $finish(1);
    end
    
    // SPI 신호 관찰을 위한 추가 대기
    repeat(500) @(posedge axi_aclk);  // 500 clock cycles
    
    //--------------------------------------------------------------------------
    // Test 2: SPI Read (RXDATA) → MISO 확인
    //--------------------------------------------------------------------------
    $display("[%0t] --- Test 2: SPI Read RXDATA (MISO check) ---", $time);
    spi_read_rxdata(read_data, read_success);
    
    if (!read_success) begin
        $display("[%0t] ERROR: SPI Read failed", $time);
        $finish(1);
    end
    
    $display("[%0t] Read Data: 0x%02X", $time, read_data);
    
    // SPI 신호 관찰을 위한 추가 대기
    repeat(500) @(posedge axi_aclk);  // 500 clock cycles
    
    $display("[%0t] ========================================", $time);
    $display("[%0t] Minimal SPI Test Complete", $time);
    $display("[%0t] ========================================", $time);
    
    // 시뮬레이션 종료
    repeat(1000) @(posedge axi_aclk);  // 1000 clock cycles
    $finish(0);
end
endtask

