`timescale 1ns/1ps

//------------------------------------------------------------------------------
// SPI Protocol Checker
//------------------------------------------------------------------------------
// SPI Mode 0 프로토콜을 검증하는 체크러 모듈
//------------------------------------------------------------------------------
module spi_checker (
    input wire        clk,
    input wire        rst,
    
    // SPI Interface
    input wire        cs_n,
    input wire        sck,
    input wire        mosi,
    input wire        miso,
    
    // Control
    input wire        enable_check
);

    //--------------------------------------------------------------------------
    // SPI Mode 0 프로토콜 체크
    //--------------------------------------------------------------------------
    
    // CS_N과 SCK 동기화 체크
    always @(posedge sck) begin
        if (enable_check && cs_n) begin
            $error("[%0t] SPI_CHECKER ERROR: SCK toggled while CS_N is HIGH", $time);
        end
    end
    
    // SCK Idle 상태 체크 (LOW여야 함)
    reg sck_prev;
    always @(posedge clk) begin
        if (rst) begin
            sck_prev <= 1'b0;
        end else begin
            sck_prev <= sck;
        end
    end
    
    always @(posedge clk) begin
        if (enable_check && cs_n && sck) begin
            $error("[%0t] SPI_CHECKER ERROR: SCK should be LOW when CS_N is HIGH (SPI Mode 0)", $time);
        end
    end
    
    //--------------------------------------------------------------------------
    // 트랜잭션 모니터링
    //--------------------------------------------------------------------------
    reg [7:0] addr_byte;
    reg [7:0] data_byte;
    reg [3:0] bit_count;
    reg       is_read;
    reg       in_transaction;
    
    always @(posedge sck) begin
        if (enable_check && !cs_n) begin
            if (!in_transaction) begin
                in_transaction <= 1'b1;
                bit_count <= 0;
                addr_byte <= 0;
                data_byte <= 0;
                $display("[%0t] SPI_CHECKER: Transaction START", $time);
            end
            
            if (bit_count < 8) begin
                // 주소 바이트 수신
                addr_byte <= {addr_byte[6:0], mosi};
                if (bit_count == 0) begin
                    is_read <= mosi;  // MSB is R/W bit
                end
            end else begin
                // 데이터 바이트 수신
                if (is_read) begin
                    data_byte <= {data_byte[6:0], miso};
                end else begin
                    data_byte <= {data_byte[6:0], mosi};
                end
            end
            
            bit_count <= bit_count + 1;
            
            // 주소 바이트 완료 체크
            if (bit_count == 7) begin
                $display("[%0t] SPI_CHECKER: Address byte = 0x%02X (R/W=%0d, Addr=0x%02X)", 
                         $time, {is_read, addr_byte[6:0]}, is_read, addr_byte[6:0]);
                if (addr_byte[6:0] > 7'h7F) begin
                    $error("[%0t] SPI_CHECKER ERROR: Invalid address 0x%02X (max 0x7F)", 
                           $time, addr_byte[6:0]);
                end
            end
            
            // 데이터 바이트 완료 체크
            if (bit_count == 15) begin
                $display("[%0t] SPI_CHECKER: Data byte = 0x%02X", $time, data_byte);
            end
        end
    end
    
    always @(posedge cs_n) begin
        if (enable_check && in_transaction) begin
            in_transaction <= 1'b0;
            if (bit_count >= 8) begin
                $display("[%0t] SPI_CHECKER: Transaction END - %0d bits transferred", 
                         $time, bit_count);
                if (bit_count != 8 && bit_count != 16) begin
                    $warning("[%0t] SPI_CHECKER WARNING: Unexpected bit count %0d", 
                             $time, bit_count);
                end
            end
        end
    end
    
    //--------------------------------------------------------------------------
    // 타이밍 체크
    //--------------------------------------------------------------------------
    time transaction_start;
    time transaction_end;
    time duration;
    
    always @(negedge cs_n) begin
        if (enable_check) begin
            transaction_start = $time;
        end
    end
    
    always @(posedge cs_n) begin
        if (enable_check && transaction_start > 0) begin
            transaction_end = $time;
            duration = transaction_end - transaction_start;
            $display("[%0t] SPI_CHECKER: Transaction duration = %0d ns", $time, duration);
            
            // 단일 바이트 트랜잭션은 약 1-2us 정도 소요 예상
            if (duration > 10000) begin
                $warning("[%0t] SPI_CHECKER WARNING: Transaction took %0d ns (may be too long)", 
                         $time, duration);
            end
        end
    end

endmodule

