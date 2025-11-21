//------------------------------------------------------------------------------
// spi_timeout_wait_tasks.sv
//------------------------------------------------------------------------------
// Timeout 기반 SPI 상태 대기 함수들
// - wait_until_done(): SPI done 신호가 1이 될 때까지 대기 (timeout 포함)
// - wait_until_idle(): SPI busy 신호가 0이 될 때까지 대기 (timeout 포함)
// - timeout-safe SPI write/read 트랜잭션 함수들
//------------------------------------------------------------------------------
// 사용법: 
//   1. top_bfm.sv에서 먼저 minimal_bfm_tasks.sv를 include
//   2. 그 다음 이 파일을 include
//   예: `include "minimal_bfm_tasks.sv"
//       `include "spi_timeout_wait_tasks.sv"
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Timeout 파라미터 정의
//------------------------------------------------------------------------------
// 이 값들은 상위 모듈에서 재정의 가능
`ifndef SPI_TIMEOUT_DONE
`define SPI_TIMEOUT_DONE 20000  // done 신호 대기 timeout (clock cycles)
`endif

`ifndef SPI_TIMEOUT_IDLE
`define SPI_TIMEOUT_IDLE 20000  // idle 신호 대기 timeout (clock cycles)
`endif

//------------------------------------------------------------------------------
// SPI Status Register에서 busy/done 신호 추출
//------------------------------------------------------------------------------
// SPI AXI Controller의 STATUS 레지스터를 읽어서 busy/done 신호 확인
// STATUS 레지스터: [0]=busy, [1]=done, [2]=error
task spi_read_status;
    output reg        busy;
    output reg        done;
    output reg        error;
    reg [31:0]        status_reg;
    reg [31:0]        read_data;
    reg               read_success;
begin
    // STATUS 레지스터 주소 (SPI_BASE + 0x10)
    // 주의: 이 주소는 top_bfm.sv에서 정의된 SPI_STATUS와 일치해야 함
    minimal_axi_read(32'h0200_0010, read_data, read_success);
    
    if (!read_success) begin
        $display("[%0t] ERROR: Failed to read SPI STATUS register", $time);
        busy = 1'bX;
        done = 1'bX;
        error = 1'bX;
        return;
    end
    
    status_reg = read_data;
    busy = status_reg[0];  // bit 0: busy
    done = status_reg[1];  // bit 1: done
    error = status_reg[2]; // bit 2: error
    
    $display("[%0t] SPI Status: busy=%0d, done=%0d, error=%0d (0x%08X)", 
             $time, busy, done, error, status_reg);
end
endtask

//------------------------------------------------------------------------------
// wait_until_done(): SPI done 신호가 1이 될 때까지 대기 (timeout 포함)
//------------------------------------------------------------------------------
task wait_until_done;
    input integer timeout_limit;  // timeout 클럭 사이클 수
    reg           done;
    reg           busy;
    reg           error;
    integer       timeout;
begin
    timeout = 0;
    done = 1'b0;
    
    $display("[%0t] wait_until_done: Waiting for SPI done signal...", $time);
    
    while (done !== 1'b1) begin
        @(posedge axi_aclk);
        timeout = timeout + 1;
        
        // 주기적으로 STATUS 레지스터 읽기 (매 10 클럭마다)
        if (timeout % 10 == 0) begin
            spi_read_status(busy, done, error);
            
            if (error) begin
                $display("[%0t] ERROR: SPI transaction error detected!", $time);
                $finish(1);
            end
        end
        
        // Timeout 체크
        if (timeout > timeout_limit) begin
            $display("[%0t] ERROR: Timeout in wait_until_done() - done signal never asserted", $time);
            $display("[%0t]        Timeout limit: %0d clock cycles", $time, timeout_limit);
            $display("[%0t]        Current timeout: %0d clock cycles", $time, timeout);
            $finish(1);
        end
    end
    
    $display("[%0t] wait_until_done: Done signal asserted (timeout=%0d cycles)", $time, timeout);
end
endtask

//------------------------------------------------------------------------------
// wait_until_idle(): SPI busy 신호가 0이 될 때까지 대기 (timeout 포함)
//------------------------------------------------------------------------------
task wait_until_idle;
    input integer timeout_limit;  // timeout 클럭 사이클 수
    reg           busy;
    reg           done;
    reg           error;
    integer       timeout;
begin
    timeout = 0;
    busy = 1'b1;
    
    $display("[%0t] wait_until_idle: Waiting for SPI busy signal to go low...", $time);
    
    while (busy == 1'b1) begin
        @(posedge axi_aclk);
        timeout = timeout + 1;
        
        // 주기적으로 STATUS 레지스터 읽기 (매 10 클럭마다)
        if (timeout % 10 == 0) begin
            spi_read_status(busy, done, error);
            
            if (error) begin
                $display("[%0t] ERROR: SPI transaction error detected!", $time);
                $finish(1);
            end
        end
        
        // Timeout 체크
        if (timeout > timeout_limit) begin
            $display("[%0t] ERROR: Timeout in wait_until_idle() - SPI busy stuck at 1", $time);
            $display("[%0t]        Timeout limit: %0d clock cycles", $time, timeout_limit);
            $display("[%0t]        Current timeout: %0d clock cycles", $time, timeout);
            $finish(1);
        end
    end
    
    $display("[%0t] wait_until_idle: SPI is now idle (timeout=%0d cycles)", $time, timeout);
end
endtask

//------------------------------------------------------------------------------
// Timeout-safe SPI Write Transaction
//------------------------------------------------------------------------------
// Write 후 busy=1 → busy=0 될 때까지 wait_until_idle() 호출
task spi_write_safe;
    input  [7:0]  tx_data;
    output        success;
    reg [31:0]    write_data;
    reg           write_success;
    reg           busy;
    reg           done;
    reg           error;
begin
    $display("[%0t] ===== SPI Write Safe Start =====", $time);
    $display("[%0t] TX Data: 0x%02X", $time, tx_data);
    
    // TXDATA 레지스터에 데이터 쓰기
    write_data = {24'h0, tx_data};
    minimal_axi_write(32'h0200_0008, write_data, write_success);
    
    if (!write_success) begin
        $display("[%0t] ERROR: SPI Write failed", $time);
        success = 1'b0;
        return;
    end
    
    $display("[%0t] SPI Write: Data written to TXDATA register", $time);
    
    // Write 후 busy 상태 확인 및 대기
    // SPI 트랜잭션이 시작되면 busy가 1이 되고, 완료되면 0이 됨
    repeat(10) @(posedge axi_aclk);  // 짧은 대기 (SPI 컨트롤러가 busy 신호를 업데이트할 시간)
    
    spi_read_status(busy, done, error);
    
    if (busy) begin
        $display("[%0t] SPI Write: Busy signal is high, waiting for idle...", $time);
        wait_until_idle(`SPI_TIMEOUT_IDLE);
    end else begin
        $display("[%0t] SPI Write: Busy signal is already low", $time);
    end
    
    // 최종 상태 확인
    spi_read_status(busy, done, error);
    
    if (error) begin
        $display("[%0t] ERROR: SPI Write transaction error", $time);
        success = 1'b0;
    end else begin
        $display("[%0t] SPI Write Safe: SUCCESS", $time);
        success = 1'b1;
    end
    
    $display("[%0t] ===== SPI Write Safe Complete =====", $time);
end
endtask

//------------------------------------------------------------------------------
// Timeout-safe SPI Read Transaction
//------------------------------------------------------------------------------
// Read 요청 후 done=1 → done=0 돌아오는 것을 wait_until_done()으로 확인
task spi_read_safe;
    output [7:0]  rx_data;
    output        success;
    reg [31:0]    read_data;
    reg           read_success;
    reg           busy;
    reg           done;
    reg           error;
begin
    $display("[%0t] ===== SPI Read Safe Start =====", $time);
    
    // RXDATA 레지스터에서 데이터 읽기
    minimal_axi_read(32'h0200_000C, read_data, read_success);
    
    if (!read_success) begin
        $display("[%0t] ERROR: SPI Read failed", $time);
        rx_data = 8'hXX;
        success = 1'b0;
        return;
    end
    
    rx_data = read_data[7:0];
    $display("[%0t] SPI Read: Data read from RXDATA register: 0x%02X", $time, rx_data);
    
    // Read 후 done 신호 확인 및 대기
    repeat(10) @(posedge axi_aclk);  // 짧은 대기
    
    spi_read_status(busy, done, error);
    
    if (!done) begin
        $display("[%0t] SPI Read: Done signal is low, waiting for done...", $time);
        wait_until_done(`SPI_TIMEOUT_DONE);
    end else begin
        $display("[%0t] SPI Read: Done signal is already high", $time);
    end
    
    // 최종 상태 확인
    spi_read_status(busy, done, error);
    
    if (error) begin
        $display("[%0t] ERROR: SPI Read transaction error", $time);
        success = 1'b0;
    end else begin
        $display("[%0t] SPI Read Safe: SUCCESS, Data: 0x%02X", $time, rx_data);
        success = 1'b1;
    end
    
    $display("[%0t] ===== SPI Read Safe Complete =====", $time);
end
endtask

//------------------------------------------------------------------------------
// Timeout-safe SPI Test Sequence
//------------------------------------------------------------------------------
// Write 트랜잭션 → wait_until_done() → Read 트랜잭션 → wait_until_done() → 종료
task spi_test_safe_sequence;
    input  [7:0]  test_data;
    reg [7:0]     rx_data;
    reg           write_success;
    reg           read_success;
begin
    $display("[%0t] ========================================", $time);
    $display("[%0t] SPI Safe Test Sequence Start", $time);
    $display("[%0t] Test Data: 0x%02X", $time, test_data);
    $display("[%0t] ========================================", $time);
    
    //--------------------------------------------------------------------------
    // Step 1: Write 트랜잭션 발생
    //--------------------------------------------------------------------------
    $display("[%0t] --- Step 1: SPI Write Transaction ---", $time);
    spi_write_safe(test_data, write_success);
    
    if (!write_success) begin
        $display("[%0t] ERROR: SPI Write transaction failed", $time);
        $finish(1);
    end
    
    //--------------------------------------------------------------------------
    // Step 2: wait_until_done() 호출
    //--------------------------------------------------------------------------
    $display("[%0t] --- Step 2: Wait until done ---", $time);
    wait_until_done(`SPI_TIMEOUT_DONE);
    
    //--------------------------------------------------------------------------
    // Step 3: Read 트랜잭션 발생
    //--------------------------------------------------------------------------
    $display("[%0t] --- Step 3: SPI Read Transaction ---", $time);
    spi_read_safe(rx_data, read_success);
    
    if (!read_success) begin
        $display("[%0t] ERROR: SPI Read transaction failed", $time);
        $finish(1);
    end
    
    //--------------------------------------------------------------------------
    // Step 4: wait_until_done() 호출
    //--------------------------------------------------------------------------
    $display("[%0t] --- Step 4: Wait until done ---", $time);
    wait_until_done(`SPI_TIMEOUT_DONE);
    
    //--------------------------------------------------------------------------
    // Step 5: 결과 확인 및 정상 종료
    //--------------------------------------------------------------------------
    $display("[%0t] --- Step 5: Result Check ---", $time);
    $display("[%0t] Write Data: 0x%02X", $time, test_data);
    $display("[%0t] Read Data:  0x%02X", $time, rx_data);
    
    if (rx_data == test_data) begin
        $display("[%0t] SUCCESS: Write and Read data match!", $time);
    end else begin
        $display("[%0t] WARNING: Write and Read data mismatch", $time);
        $display("[%0t]          Expected: 0x%02X, Got: 0x%02X", $time, test_data, rx_data);
    end
    
    $display("[%0t] ========================================", $time);
    $display("[%0t] SPI Safe Test Sequence Complete", $time);
    $display("[%0t] ========================================", $time);
    
    // 추가 대기 (waveform 관찰용)
    repeat(100) @(posedge axi_aclk);
end
endtask

//------------------------------------------------------------------------------
// Complete Test with Automatic Finish
//------------------------------------------------------------------------------
// 전체 테스트를 실행하고 정상 종료
task spi_complete_test;
begin
    $display("[%0t] ========================================", $time);
    $display("[%0t] SPI Complete Test Start", $time);
    $display("[%0t] ========================================", $time);
    
    // Reset 해제 대기
    wait(axi_aresetn == 1'b1);
    repeat(100) @(posedge axi_aclk);  // 100 clock cycles delay
    
    // Test 1: 0xA5
    spi_test_safe_sequence(8'hA5);
    repeat(100) @(posedge axi_aclk);
    
    // Test 2: 0x5A
    spi_test_safe_sequence(8'h5A);
    repeat(100) @(posedge axi_aclk);
    
    $display("[%0t] ========================================", $time);
    $display("[%0t] All SPI tests completed successfully", $time);
    $display("[%0t] ========================================", $time);
    
    // 최종 대기 후 정상 종료
    repeat(1000) @(posedge axi_aclk);
    $display("[%0t] Simulation finished normally", $time);
    $finish(0);
end
endtask

