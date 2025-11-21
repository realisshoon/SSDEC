`timescale 1ns/1ps

//------------------------------------------------------------------------------
// MFRC522 SPI Slave Model
//------------------------------------------------------------------------------
// MFRC522의 SPI 인터페이스를 모델링한 테스트 벤치용 모델
//------------------------------------------------------------------------------
module mfrc522_model (
    input  wire        clk,
    input  wire        rst,
    
    // SPI Interface
    input  wire        cs_n,      // Chip Select (Active Low)
    input  wire        sck,       // Serial Clock
    input  wire        mosi,      // Master Out Slave In
    output wire        miso,      // Master In Slave Out
    
    // Debug signals
    output reg  [7:0]  last_addr, // Last accessed register address
    output reg  [7:0]  last_data, // Last read/written data
    output reg         last_rw    // Last operation (0=Write, 1=Read)
);

    //--------------------------------------------------------------------------
    // MISO Tri-state Control
    //--------------------------------------------------------------------------
    reg miso_out;
    reg miso_oe;
    
    assign miso = (miso_oe && !cs_n) ? miso_out : 1'bz;

    //--------------------------------------------------------------------------
    // MFRC522 내부 레지스터 모델
    //--------------------------------------------------------------------------
    reg [7:0] registers [0:127];  // 128 registers (0x00~0x7F)
    
    // Version register (0x37) - MFRC522 v2.0 = 0x91, v1.0 = 0x92
    initial begin
        registers[7'h37] = 8'h91;  // Version 2.0
        registers[7'h01] = 8'h00;  // Command register
        registers[7'h07] = 8'h00;  // Status register
        registers[7'h0C] = 8'h00;  // Control register
        registers[7'h09] = 8'h00;  // FIFO Data register
        registers[7'h0A] = 8'h00;  // FIFO Level register
    end
    
    //--------------------------------------------------------------------------
    // SPI 수신 상태 머신
    //--------------------------------------------------------------------------
    localparam IDLE     = 2'b00;
    localparam RX_ADDR  = 2'b01;
    localparam RX_DATA  = 2'b10;
    localparam TX_DATA  = 2'b11;
    
    reg [1:0] state;
    reg [1:0] state_prev;  // Previous state for edge detection
    reg [2:0] bit_count;
    reg [7:0] addr_byte;
    reg [7:0] data_byte;
    reg       rw_bit;
    
    // SCK 엣지 감지
    reg sck_prev;
    wire sck_rising  = sck && !sck_prev;
    wire sck_falling = !sck && sck_prev;
    
    // State entry detection
    wire state_tx_data_entry = (state == TX_DATA) && (state_prev != TX_DATA);
    
    always @(posedge clk) begin
        if (rst) begin
            sck_prev <= 1'b0;
            state_prev <= IDLE;
        end else begin
            sck_prev <= sck;
            state_prev <= state;
        end
    end
    
    //--------------------------------------------------------------------------
    // 상태 머신
    //--------------------------------------------------------------------------
    always @(posedge clk) begin
        if (rst) begin
            state <= IDLE;
            bit_count <= 3'b0;
            addr_byte <= 8'h0;
            data_byte <= 8'h0;
            rw_bit <= 1'b0;
            miso_oe <= 1'b0;
            miso_out <= 1'b0;
            last_addr <= 8'h0;
            last_data <= 8'h0;
            last_rw <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    if (!cs_n) begin
                        state <= RX_ADDR;
                        bit_count <= 3'b0;
                        addr_byte <= 8'h0;
                        miso_oe <= 1'b0;
                    end
                end
                
                RX_ADDR: begin
                    if (sck_rising) begin
                        // SPI Mode 0: 데이터는 rising edge에서 샘플링
                        // 8비트 주소 바이트 수신: MSB는 R/W 비트, 하위 7비트는 주소
                        addr_byte <= {addr_byte[6:0], mosi};
                        bit_count <= bit_count + 1;
                        
                        if (bit_count == 7) begin
                            // 8비트 모두 수신 완료 (bit_count 0~7 = 8비트)
                            rw_bit <= addr_byte[7];  // MSB is R/W bit
                            bit_count <= 3'b0;
                            if (addr_byte[7]) begin  // Read operation (R/W bit = 1)
                                // 읽기 데이터 준비 (하위 7비트가 주소)
                                data_byte <= registers[addr_byte[6:0]];
                                // 첫 번째 비트(MSB) 즉시 출력 및 MISO drive 활성화
                                // 다음 SCK rising edge 전에 MISO가 drive 상태여야 함
                                miso_out <= registers[addr_byte[6:0]][7];
                                miso_oe <= 1'b1;  // MISO tri-state → drive 전환 (즉시)
                                state <= TX_DATA;
                            end else begin  // Write operation (R/W bit = 0)
                                state <= RX_DATA;
                            end
                        end
                    end
                end
                
                RX_DATA: begin
                    if (sck_rising) begin
                        // SPI Mode 0: 데이터는 rising edge에서 샘플링
                        data_byte <= {data_byte[6:0], mosi};
                        bit_count <= bit_count + 1;
                        
                        if (bit_count == 7) begin
                            // 8비트 모두 수신 완료 (bit_count 0~7 = 8비트)
                            data_byte[7:0] <= {data_byte[6:0], mosi};
                            // 레지스터에 쓰기
                            registers[addr_byte[6:0]] <= {data_byte[6:0], mosi};
                            last_addr <= addr_byte[6:0];
                            last_data <= {data_byte[6:0], mosi};
                            last_rw <= 1'b0;
                            state <= IDLE;
                        end
                    end
                end
                
                TX_DATA: begin
                    // TX_DATA 상태 진입 시 첫 번째 비트(MSB) 즉시 출력
                    if (state_tx_data_entry) begin
                        miso_out <= data_byte[7];  // 첫 번째 비트(MSB) 즉시 출력
                    end else if (sck_rising) begin
                        // SPI Mode 0: rising edge에서 마스터가 샘플링
                        // bit_count는 rising edge에서 증가
                        bit_count <= bit_count + 1;
                        
                        if (bit_count == 7) begin
                            // 마지막 비트 전송 후 완료 처리
                            last_addr <= addr_byte[6:0];
                            last_data <= data_byte;
                            last_rw <= 1'b1;
                        end
                    end else if (sck_falling) begin
                        // SPI Mode 0: 데이터는 falling edge에서 변경
                        // MISO는 다음 rising edge에서 마스터가 샘플링할 수 있도록 falling edge에서 변경
                        // bit_count > 0일 때만 shift (첫 번째 비트는 이미 출력됨)
                        if (bit_count > 0 && bit_count < 7) begin
                            // 다음 비트로 shift 후 출력
                            data_byte <= {data_byte[6:0], 1'b0};  // shift
                            miso_out <= data_byte[6];  // shift 후 MSB 출력
                        end else if (bit_count == 7) begin
                            // 마지막 비트 후 MISO 비활성화
                            miso_oe <= 1'b0;
                        end
                    end
                end
                
                default: state <= IDLE;
            endcase
            
            // CS가 HIGH가 되면 IDLE로 복귀
            if (cs_n) begin
                state <= IDLE;
                bit_count <= 3'b0;
                miso_oe <= 1'b0;
            end
        end
    end
    
    //--------------------------------------------------------------------------
    // 레지스터 읽기 인터페이스 (디버깅용)
    //--------------------------------------------------------------------------
    function [7:0] read_register;
        input [6:0] addr;
    begin
        read_register = registers[addr];
    end
    endfunction
    
    //--------------------------------------------------------------------------
    // 레지스터 쓰기 인터페이스 (디버깅용)
    //--------------------------------------------------------------------------
    task write_register;
        input [6:0] addr;
        input [7:0] data;
    begin
        registers[addr] <= data;
    end
    endtask

endmodule

