//----------------------------------------------------------------------------
// I2C Dummy Slave Model for Co-simulation
//   - 간단한 I2C 슬레이브 모델로 ACK 응답 및 데이터 읽기/쓰기 지원
//   - 주소 매칭 후 ACK를 제공하여 마스터 트랜잭션 완료 가능
//----------------------------------------------------------------------------
`timescale 1ns/1ps

module i2c_dummy_slave
    #(parameter DEV_ADDR = 7'h50,  // I2C 디바이스 주소 (7-bit)
               MEM_SIZE  = 256)    // 내부 메모리 크기
(
    input  wire scl,  // I2C 클럭
    inout  wire sda   // I2C 데이터 (open-drain)
);

    //--------------------------------------------------------------------------
    // 내부 상태 정의
    //--------------------------------------------------------------------------
    localparam IDLE      = 3'b000;
    localparam ADDR      = 3'b001;
    localparam WORD_ADDR = 3'b010;
    localparam WRITE     = 3'b011;
    localparam READ      = 3'b100;
    localparam READ_ACK  = 3'b101;

    reg [2:0] state = IDLE;
    reg [2:0] next_state;

    //--------------------------------------------------------------------------
    // 데이터 저장용 메모리
    //--------------------------------------------------------------------------
    reg [7:0] mem [0:MEM_SIZE-1];
    reg [7:0] word_addr = 8'h00;  // 현재 워드 주소
    reg [7:0] read_data = 8'h00;   // 읽기 데이터

    //--------------------------------------------------------------------------
    // 시프트 레지스터 및 비트 카운터
    //--------------------------------------------------------------------------
    reg [7:0] shift_reg = 8'h00;
    reg [2:0] bit_cnt = 3'd7;
    reg [7:0] addr_byte = 8'h00;  // 주소 바이트 임시 저장

    //--------------------------------------------------------------------------
    // ACK 제어
    //--------------------------------------------------------------------------
    reg ack_pending = 1'b0;
    reg ack_value = 1'b0;
    reg ack_active = 1'b0;

    //--------------------------------------------------------------------------
    // SDA 제어 (open-drain)
    //--------------------------------------------------------------------------
    reg sda_drive = 1'b0;  // 1이면 SDA를 LOW로 구동, 0이면 해제
    assign sda = sda_drive ? 1'b0 : 1'bz;

    //--------------------------------------------------------------------------
    // START/STOP 조건 검출
    //--------------------------------------------------------------------------
    reg sda_dly = 1'b1;
    reg scl_dly = 1'b1;
    wire start_condition = (scl_dly == 1'b1) && (scl == 1'b1) && 
                           (sda_dly == 1'b1) && (sda == 1'b0);
    wire stop_condition  = (scl_dly == 1'b1) && (scl == 1'b1) && 
                           (sda_dly == 1'b0) && (sda == 1'b1);

    always @(posedge scl or negedge scl) begin
        sda_dly <= sda;
        scl_dly <= scl;
    end

    //--------------------------------------------------------------------------
    // 상태 머신: SCL posedge에서 데이터 샘플링
    //--------------------------------------------------------------------------
    always @(posedge scl) begin
        case (state)
            IDLE: begin
                if (start_condition) begin
                    state <= ADDR;
                    bit_cnt <= 3'd7;
                    shift_reg <= 8'h00;
                end
            end

            ADDR: begin
                // 주소 비트 수신 (7-bit 주소 + R/W 비트)
                shift_reg <= {shift_reg[6:0], sda};
                if (bit_cnt == 3'd0) begin
                    // 주소 매칭 확인 (shift_reg에 마지막 비트 포함)
                    addr_byte <= {shift_reg[6:0], sda};
                    bit_cnt <= 3'd7;
                end else begin
                    bit_cnt <= bit_cnt - 1;
                end
            end

            WORD_ADDR: begin
                // 워드 주소 수신
                shift_reg <= {shift_reg[6:0], sda};
                if (bit_cnt == 3'd0) begin
                    // shift_reg에 마지막 비트 포함된 전체 바이트 저장
                    word_addr <= {shift_reg[6:0], sda};
                    ack_pending <= 1'b1;
                    ack_value <= 1'b0;  // ACK
                    next_state <= WRITE;
                    bit_cnt <= 3'd7;
                end else begin
                    bit_cnt <= bit_cnt - 1;
                end
            end

            WRITE: begin
                // 쓰기 데이터 수신
                shift_reg <= {shift_reg[6:0], sda};
                if (bit_cnt == 3'd0) begin
                    // shift_reg에 마지막 비트 포함된 전체 바이트 저장
                    mem[word_addr] <= {shift_reg[6:0], sda};
                    word_addr <= word_addr + 1;  // 주소 증가
                    ack_pending <= 1'b1;
                    ack_value <= 1'b0;  // ACK
                    next_state <= WRITE;  // 계속 쓰기
                    bit_cnt <= 3'd7;
                end else begin
                    bit_cnt <= bit_cnt - 1;
                end
            end

            READ: begin
                // 읽기 모드: 8비트 데이터 전송 중
                if (bit_cnt == 3'd0) begin
                    // 8번째 비트 전송 완료, 다음 클럭에서 마스터 ACK 확인
                    next_state <= READ_ACK;
                    bit_cnt <= 3'd7;
                end else begin
                    bit_cnt <= bit_cnt - 1;
                end
            end

            READ_ACK: begin
                // 마스터 ACK 비트 확인 (9번째 클럭)
                if (sda == 1'b0) begin
                    // ACK: 다음 데이터 전송
                    read_data <= mem[word_addr];
                    word_addr <= word_addr + 1;
                    next_state <= READ;
                end else begin
                    // NACK: 읽기 종료
                    next_state <= IDLE;
                end
                bit_cnt <= 3'd7;
            end

            default: begin
                state <= IDLE;
            end
        endcase
    end

    //--------------------------------------------------------------------------
    // 주소 매칭 및 상태 전이 처리 (addr_byte 업데이트 후, 별도 always 블록)
    //--------------------------------------------------------------------------
    always @(posedge scl) begin
        if (state == ADDR && bit_cnt == 3'd7) begin
            // 주소 바이트가 업데이트된 후 매칭 확인
            if (addr_byte[7:1] == DEV_ADDR) begin
                ack_pending <= 1'b1;
                ack_value <= 1'b0;  // ACK (LOW)
                if (addr_byte[0] == 1'b0) begin
                    // Write 모드
                    next_state <= WORD_ADDR;
                end else begin
                    // Read 모드
                    next_state <= READ;
                    read_data <= mem[word_addr];  // 현재 주소의 데이터 읽기
                end
            end else begin
                // 주소 불일치: NACK
                ack_pending <= 1'b1;
                ack_value <= 1'b1;  // NACK (HIGH)
                next_state <= IDLE;
            end
        end
    end

    //--------------------------------------------------------------------------
    // SCL negedge에서 ACK 및 데이터 출력
    //--------------------------------------------------------------------------
    always @(negedge scl) begin
        if (ack_pending) begin
            sda_drive <= ack_value;  // ACK/NACK 출력
            ack_active <= 1'b1;
            ack_pending <= 1'b0;
        end else if (ack_active) begin
            // ACK 비트 완료 후 해제
            sda_drive <= 1'b0;
            ack_active <= 1'b0;
            state <= next_state;
        end else if (state == READ) begin
            // 읽기 모드: 데이터 비트 출력 (MSB first)
            sda_drive <= (read_data[bit_cnt] == 1'b0);
        end else if (state == READ_ACK) begin
            // ACK 비트 수신 중: SDA 해제 (마스터가 제어)
            sda_drive <= 1'b0;
        end else begin
            sda_drive <= 1'b0;
        end
    end

    //--------------------------------------------------------------------------
    // STOP 조건 처리
    //--------------------------------------------------------------------------
    always @(posedge scl) begin
        if (stop_condition) begin
            state <= IDLE;
            ack_pending <= 1'b0;
            ack_active <= 1'b0;
            sda_drive <= 1'b0;
        end
    end

    //--------------------------------------------------------------------------
    // 초기화
    //--------------------------------------------------------------------------
    initial begin
        integer i;
        for (i = 0; i < MEM_SIZE; i = i + 1) begin
            mem[i] = 8'h00;
        end
        // 테스트용 초기 데이터 (선택사항)
        mem[0] = 8'hAA;
        mem[1] = 8'hBB;
        mem[2] = 8'hCC;
        mem[3] = 8'hDD;
    end

endmodule

//----------------------------------------------------------------------------
// Revision history
// 2025.11.17: Created for I2C co-simulation ACK support
//----------------------------------------------------------------------------

