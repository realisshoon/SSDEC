`ifndef TASKS_SPI_AXI_SV 
`define TASKS_SPI_AXI_SV 
//------------------------------------------------------------------------------
//  Copyright (c) 2024 by Ando Ki.
//  All right reserved.
//------------------------------------------------------------------------------
// tasks_spi_axi.sv
//------------------------------------------------------------------------------
// SPI AXI 컨트롤러 레지스터 정의 및 테스트 태스크
//------------------------------------------------------------------------------

localparam SPI_BASE      = 32'h0200_0000;  // MEM_OFFCHIP_ADDR
localparam SPI_CTRL      = SPI_BASE + 8'h00;
localparam SPI_ADDR      = SPI_BASE + 8'h04;
localparam SPI_DATA_IN   = SPI_BASE + 8'h08;
localparam SPI_DATA_OUT  = SPI_BASE + 8'h0C;
localparam SPI_STATUS    = SPI_BASE + 8'h10;

//------------------------------------------------------------------------------
// MFRC522 레지스터 주소 정의
//------------------------------------------------------------------------------
localparam MFRC522_REG_VERSION    = 7'h37;
localparam MFRC522_REG_COMMAND    = 7'h01;
localparam MFRC522_REG_FIFO_DATA   = 7'h09;
localparam MFRC522_REG_FIFO_LEVEL = 7'h0A;
localparam MFRC522_REG_CONTROL    = 7'h0C;
localparam MFRC522_REG_STATUS    = 7'h07;

//------------------------------------------------------------------------------
// SPI 컨트롤러 레지스터 읽기/쓰기 태스크
//------------------------------------------------------------------------------
task spi_write_reg;
    input integer addr;
    input integer data;
    integer resp;
begin
    $display("[%0t] spi_write_reg: addr=0x%08X, data=0x%08X", $time, addr, data);
    axi_full_write(addr, data, 0, 2, 0, 1);  // id=0, size=4bytes, len=0, burst=INCR
    $display("[%0t] spi_write_reg: completed", $time);
end
endtask

task spi_read_reg;
    input  integer addr;
    output integer data;
    integer resp;
begin
    axi_full_read(addr, data, 0, 2, 0, 1);  // id=0, size=4bytes, len=0, burst=INCR
end
endtask

//------------------------------------------------------------------------------
// SPI 트랜잭션 시작 (enable 비트 설정)
//------------------------------------------------------------------------------
task spi_start_transaction;
    input integer rw;        // 0=Write, 1=Read
    input integer num_bytes; // 1-64
begin
    // Control register: [0]=enable, [1]=rw, [15:8]=num_bytes
    spi_write_reg(SPI_CTRL, (num_bytes << 8) | (rw << 1) | 1);
end
endtask

//------------------------------------------------------------------------------
// SPI 트랜잭션 완료 대기
//------------------------------------------------------------------------------
task spi_wait_done;
    integer status;
    integer timeout;
begin
    timeout = 10000;  // 최대 대기 시간
    while (timeout > 0) begin
        spi_read_reg(SPI_STATUS, status);
        if (!(status & 32'h1)) begin  // busy가 0이면 완료
            if (status & 32'h2) begin  // done 체크
                if (status & 32'h4) begin
                    $display("%m ERROR: SPI transaction error");
                end
                break;
            end
        end
        timeout = timeout - 1;
        #(100);  // 100ns delay (10 cycles at 100MHz)
    end
    if (timeout == 0) begin
        $display("%m ERROR: SPI transaction timeout");
    end
    // Enable 비트 해제
    spi_write_reg(SPI_CTRL, 0);
end
endtask

//------------------------------------------------------------------------------
// MFRC522 레지스터 쓰기
//------------------------------------------------------------------------------
task mfrc522_write;
    input [6:0] reg_addr;
    input [7:0] data;
    integer ctrl_data;
begin
    // 주소 설정
    spi_write_reg(SPI_ADDR, reg_addr);
    
    // 데이터 설정
    spi_write_reg(SPI_DATA_IN, data);
    
    // 트랜잭션 시작 (Write, 1 byte)
    spi_start_transaction(0, 1);
    
    // 완료 대기
    spi_wait_done();
end
endtask

//------------------------------------------------------------------------------
// MFRC522 레지스터 읽기
//------------------------------------------------------------------------------
task mfrc522_read;
    input  [6:0] reg_addr;
    output [7:0] data;
    integer read_data;
begin
    // 주소 설정
    spi_write_reg(SPI_ADDR, reg_addr);
    
    // 트랜잭션 시작 (Read, 1 byte)
    spi_start_transaction(1, 1);
    
    // 완료 대기
    spi_wait_done();
    
    // 읽기 데이터 읽기
    spi_read_reg(SPI_DATA_OUT, read_data);
    data = read_data[7:0];
end
endtask

//------------------------------------------------------------------------------
// MFRC522 버전 확인
//------------------------------------------------------------------------------
task mfrc522_check_version;
    reg [7:0] version;
begin
    $display("%m Checking MFRC522 version...");
    mfrc522_read(MFRC522_REG_VERSION, version);
    $display("%m MFRC522 Version: 0x%02X (expected: 0x91 or 0x92)", version);
    if (version != 8'h91 && version != 8'h92) begin
        $display("%m ERROR: Invalid version!");
    end
end
endtask

//------------------------------------------------------------------------------
// MFRC522 초기화
//------------------------------------------------------------------------------
task mfrc522_init;
begin
    $display("%m Initializing MFRC522...");
    
    // Soft Reset
    mfrc522_write(MFRC522_REG_COMMAND, 8'h0F);
    #(10000);  // 10us delay
    
    // 버전 확인
    mfrc522_check_version();
    
    $display("%m MFRC522 initialization complete");
end
endtask

//------------------------------------------------------------------------------
// SPI 트랜잭션 분석 (디버깅용)
//------------------------------------------------------------------------------
task spi_analyze_transaction;
    input integer rw;
    input integer addr;
    input integer data;
    integer status;
    integer read_data;
begin
    $display("%m ========================================");
    $display("%m SPI Transaction Analysis");
    $display("%m ========================================");
    $display("%m Direction: %s", (rw) ? "READ" : "WRITE");
    $display("%m MFRC522 Address: 0x%02X", addr);
    if (!rw) begin
        $display("%m Write Data: 0x%02X", data);
    end
    
    // 트랜잭션 전 상태
    spi_read_reg(SPI_STATUS, status);
    $display("%m Status before: busy=%0d, done=%0d, error=%0d", 
             status&1, (status>>1)&1, (status>>2)&1);
    
    // 트랜잭션 실행
    if (rw) begin
        mfrc522_read(addr[6:0], read_data[7:0]);
        $display("%m Read Data: 0x%02X", read_data);
    end else begin
        mfrc522_write(addr[6:0], data[7:0]);
    end
    
    // 트랜잭션 후 상태
    spi_read_reg(SPI_STATUS, status);
    $display("%m Status after: busy=%0d, done=%0d, error=%0d", 
             status&1, (status>>1)&1, (status>>2)&1);
    $display("%m ========================================");
end
endtask

//------------------------------------------------------------------------------
`endif // TASKS_SPI_AXI_SV

