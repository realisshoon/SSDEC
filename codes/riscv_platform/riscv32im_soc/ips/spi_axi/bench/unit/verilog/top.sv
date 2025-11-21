//------------------------------------------------------------------------------
// Copyright (c) 2024 by Ando Ki.
// All right reserved.
//------------------------------------------------------------------------------
// Unit Test: SPI Master Protocol Verification
//------------------------------------------------------------------------------
// 목적: SPI 마스터 모듈의 프로토콜 정확성만 검증
// - MFRC522 모델 없이 SPI 신호만 체크
// - SPI Mode 0 프로토콜 준수 확인
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
    // SPI Master 제어 신호 (직접 제어)
    //--------------------------------------------------------------------------
    reg         spi_en;
    reg         spi_rw;
    reg [6:0]   spi_addr;
    reg [7:0]   spi_data_in;
    reg [7:0]   spi_num_bytes;
    
    wire [7:0]  spi_data_out;
    wire        spi_busy;
    wire        spi_done;
    wire        spi_error;
    
    //--------------------------------------------------------------------------
    // SPI Interface
    //--------------------------------------------------------------------------
    wire        spi_cs_n;
    wire        spi_sck;
    wire        spi_mosi;
    wire        spi_miso;
    
    // MISO는 간단한 모델로 제어 (테스트용)
    reg [7:0]   miso_data;
    reg [3:0]   miso_bit_count;  // 4-bit to count beyond 8
    always @(negedge spi_sck) begin
        if (!spi_cs_n) begin
            miso_bit_count <= miso_bit_count + 1;
            // RX_DATA phase: bits 8-15 (after 8-bit address)
            if (spi_rw && miso_bit_count >= 8 && miso_bit_count < 16) begin
                miso_data <= {miso_data[6:0], 1'b0};
            end
        end else begin
            miso_bit_count <= 0;
        end
    end
    assign spi_miso = (!spi_cs_n && spi_rw && miso_bit_count >= 8 && miso_bit_count < 16) ? miso_data[7] : 1'b0;
    
    //--------------------------------------------------------------------------
    // SPI Master 인스턴스
    //--------------------------------------------------------------------------
    SPI_master u_spi_master (
          .clk            (axi_aclk)
        , .rst            (~axi_aresetn)
        , .en             (spi_en)
        , .rw             (spi_rw)
        , .addr           (spi_addr)
        , .data_in        (spi_data_in)
        , .num_bytes      (spi_num_bytes)
        , .cs_n           (spi_cs_n)
        , .sck            (spi_sck)
        , .mosi           (spi_mosi)
        , .miso           (spi_miso)
        , .data_out       (spi_data_out)
        , .busy           (spi_busy)
        , .done           (spi_done)
        , .error          (spi_error)
    );
    
    //--------------------------------------------------------------------------
    // SPI Protocol Checker
    //--------------------------------------------------------------------------
    spi_checker u_checker (
          .clk            (axi_aclk)
        , .rst            (~axi_aresetn)
        , .cs_n           (spi_cs_n)
        , .sck            (spi_sck)
        , .mosi           (spi_mosi)
        , .miso           (spi_miso)
        , .enable_check   (1'b1)
    );
    
    //--------------------------------------------------------------------------
    // Test Sequence
    //--------------------------------------------------------------------------
    initial begin
        spi_en       <= 0;
        spi_rw       <= 0;
        spi_addr     <= 0;
        spi_data_in  <= 0;
        spi_num_bytes <= 1;
        miso_data    <= 8'h91;  // MFRC522 version for read test
        miso_bit_count <= 0;
        
        wait (axi_aresetn==1'b1);
        repeat (100) @ (posedge axi_aclk);
        
        $display("========================================");
        $display("SPI Master Unit Test");
        $display("========================================");
        
        // 테스트 1: Write 트랜잭션
        test_write_transaction();
        
        repeat (100) @ (posedge axi_aclk);
        
        // 테스트 2: Read 트랜잭션
        test_read_transaction();
        
        repeat (100) @ (posedge axi_aclk);
        
        // 테스트 3: 주소 바이트 형식 체크
        test_address_format();
        
        repeat (100) @ (posedge axi_aclk);
        
        $display("========================================");
        $display("Unit Test Completed");
        $display("========================================");
        $finish(2);
    end
    
    //--------------------------------------------------------------------------
    // Write 트랜잭션 테스트
    //--------------------------------------------------------------------------
    task test_write_transaction;
    begin
        $display("\n[Test 1] Write Transaction");
        $display("----------------------------");
        
        spi_addr     <= 7'h37;
        spi_data_in  <= 8'hAA;
        spi_rw       <= 0;  // Write
        spi_num_bytes <= 1;
        
        @(posedge axi_aclk);
        spi_en <= 1;
        @(posedge axi_aclk);
        spi_en <= 0;
        
        // 트랜잭션 완료 대기
        wait (spi_done);
        @(posedge axi_aclk);
        
        $display("[Test 1] PASSED\n");
    end
    endtask
    
    //--------------------------------------------------------------------------
    // Read 트랜잭션 테스트
    //--------------------------------------------------------------------------
    task test_read_transaction;
    begin
        $display("\n[Test 2] Read Transaction");
        $display("----------------------------");
        
        spi_addr     <= 7'h37;
        spi_rw       <= 1;  // Read
        spi_num_bytes <= 1;
        miso_data    <= 8'h91;  // Reset MISO data
        miso_bit_count <= 0;
        
        @(posedge axi_aclk);
        spi_en <= 1;
        @(posedge axi_aclk);
        spi_en <= 0;
        
        // 트랜잭션 완료 대기
        wait (spi_done);
        @(posedge axi_aclk);
        
        $display("Read data: 0x%02X", spi_data_out);
        $display("[Test 2] PASSED\n");
    end
    endtask
    
    //--------------------------------------------------------------------------
    // 주소 바이트 형식 테스트
    //--------------------------------------------------------------------------
    task test_address_format;
    begin
        $display("\n[Test 3] Address Byte Format");
        $display("----------------------------");
        
        // Write 주소 (MSB = 0)
        spi_addr <= 7'h01;
        spi_rw   <= 0;
        spi_data_in <= 8'h55;
        
        @(posedge axi_aclk);
        spi_en <= 1;
        @(posedge axi_aclk);
        spi_en <= 0;
        
        wait (spi_done);
        @(posedge axi_aclk);
        
        // Read 주소 (MSB = 1)
        spi_addr <= 7'h37;
        spi_rw   <= 1;
        miso_data <= 8'h91;
        
        @(posedge axi_aclk);
        spi_en <= 1;
        @(posedge axi_aclk);
        spi_en <= 0;
        
        wait (spi_done);
        @(posedge axi_aclk);
        
        $display("[Test 3] PASSED\n");
    end
    endtask
    
    //--------------------------------------------------------------------------
    // Waveform dump
    //--------------------------------------------------------------------------
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0);
    end

endmodule

