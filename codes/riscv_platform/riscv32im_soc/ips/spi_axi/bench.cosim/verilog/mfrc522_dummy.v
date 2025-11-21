//------------------------------------------------------------------------------
// mfrc522_dummy.sv
// MFRC522를 모방한 단순 SPI 슬레이브 모델 (Mode 0: CPOL=0, CPHA=0)
//------------------------------------------------------------------------------
`timescale 1ns/1ps

module mfrc522_dummy (
    // Clock and Reset
    input        axi_aclk,
    input        axi_aresetn,
    
    // SPI Interface
    input        spi_cs_n,
    input        spi_sck,
    input        spi_mosi,
    output       spi_miso // Slave Output (tri-state)
);

    // 테스트 응답 데이터 정의 (예: MFRC522의 Dummy Read Value)
    localparam [7:0] DUMMY_READ_DATA = 8'hAA; 
    
    // SPI 상태 정의
    localparam S_IDLE      = 2'b00;
    localparam S_GET_ADDR  = 2'b01;
    localparam S_DATA_RX   = 2'b10;
    localparam S_DATA_TX   = 2'b11;
    
    reg [1:0]   state;
    reg [7:0]   shift_reg_rx;     // MOSI 수신 시프트 레지스터
    reg [7:0]   shift_reg_tx;     // MISO 송신 시프트 레지스터
    reg [3:0]   bit_cnt;          // 비트 카운터 (0~7)
    reg         is_read_op;       // Read/Write 플래그 (1: Read, 0: Write)
    
    // Internal MISO signal for tri-state control
    wire        miso_out;         // MISO output value
    
    //--------------------------------------------------------------------------
    // State Logic and MOSI Sampling (SCK Rising Edge)
    //--------------------------------------------------------------------------
    always @(posedge spi_sck or negedge axi_aresetn or posedge spi_cs_n) begin
        if (!axi_aresetn || spi_cs_n) begin
            state        <= S_IDLE;
            bit_cnt      <= 4'd0;
            is_read_op   <= 1'b0;
            shift_reg_rx <= 8'h00;
            shift_reg_tx <= 8'h00;
        end else begin
            
            // 데이터 수신 (MSB First)
            shift_reg_rx <= {shift_reg_rx[6:0], spi_mosi};
            
            case (state)
                S_IDLE: begin
                    state <= S_GET_ADDR;
                    bit_cnt <= 4'd1;
                end
                
                S_GET_ADDR: begin
                    if (bit_cnt == 4'd7) begin
                        // 주소 바이트 수신 완료
                        is_read_op <= shift_reg_rx[7]; // MSB = 1: Read
                        
                        if (shift_reg_rx[7]) begin // Read Operation
                            state <= S_DATA_TX;
                            shift_reg_tx <= DUMMY_READ_DATA; // 송신할 데이터 준비
                        end else begin // Write Operation
                            state <= S_DATA_RX;
                        end
                        bit_cnt <= 4'd0;
                    end else begin
                        bit_cnt <= bit_cnt + 1;
                    end
                end
                
                S_DATA_RX: begin
                    if (bit_cnt == 4'd7) begin
                        state <= S_IDLE; // 데이터 바이트 수신 완료 후 다시 IDLE
                        bit_cnt <= 4'd0;
                    end else begin
                        bit_cnt <= bit_cnt + 1;
                    end
                end
                
                S_DATA_TX: begin
                    if (bit_cnt == 4'd7) begin
                        state <= S_IDLE; // 데이터 바이트 송신 완료 후 IDLE
                        bit_cnt <= 4'd0;
                    end else begin
                        bit_cnt <= bit_cnt + 1;
                    end
                end
            endcase
        end
    end
    
    //--------------------------------------------------------------------------
    // Shift Register Update (Clock Synchronized)
    //--------------------------------------------------------------------------
    // SPI Mode 0: Shift register updates on falling edge of SCK
    // bit_cnt는 posedge 블록에서 관리되므로 여기서는 shift만 수행
    always @(negedge spi_sck or negedge axi_aresetn) begin
        if (!axi_aresetn) begin
            shift_reg_tx <= 8'h00;
        end else begin
            if (!spi_cs_n && state == S_DATA_TX) begin
                // Shift register for next bit (MSB First)
                // 현재 출력된 비트는 shift_reg_tx[7], 다음엔 shift
                shift_reg_tx <= {shift_reg_tx[6:0], 1'b0};
            end
        end
    end
    
    //--------------------------------------------------------------------------
    // MISO Tri-State Control (Continuous Assign)
    //--------------------------------------------------------------------------
    // SPI Mode 0: MISO changes on falling edge, sampled by master on rising edge
    // CS inactive 시 High-Z로 설정하여 tri-state 모델링
    assign miso_out = (state == S_DATA_TX) ? shift_reg_tx[7] : 1'bz;
    assign spi_miso = (!axi_aresetn || spi_cs_n) ? 1'bz : miso_out;
    
endmodule