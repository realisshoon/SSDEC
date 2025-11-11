`timescale 1ns/1ps
`default_nettype none

module i2c_eeprom_model #(
    parameter I2C_ADDR  = 7'h50,
    parameter MEM_DEPTH = 256
)(
    input  wire scl,
    inout  wire sda
);
    reg [7:0] storage [0:MEM_DEPTH-1];
    reg [7:0] pointer;

    reg sda_drive;
    wire sda_in = sda;
    assign sda = sda_drive ? 1'b0 : 1'bz;

    typedef enum logic [3:0] {
        ST_IDLE,
        ST_ADDR,
        ST_ADDR_ACK,
        ST_WORD,
        ST_WORD_ACK,
        ST_WRITE,
        ST_WRITE_ACK,
        ST_READ,
        ST_READ_ACK
    } state_t;

    state_t state = ST_IDLE;
    reg [7:0] shift_reg;
    reg [2:0] bit_cnt;
    reg       rw_bit;
    reg [6:0] dev_addr;
    reg       addr_match;

    // ============================================================
    // I2C START/STOP 조건 감지 로직
    // ============================================================
    // 실제 하드웨어 I2C Slave의 START/STOP 감지 방법:
    //
    // 1. START 조건: SCL High 상태에서 SDA가 High->Low
    //    - SDA falling edge를 감지
    //    - Edge 발생 시점에 SCL이 High인지 확인
    //    - 두 조건이 모두 만족되면 START
    //
    // 2. STOP 조건: SCL High 상태에서 SDA가 Low->High
    //    - SDA rising edge를 감지
    //    - Edge 발생 시점에 SCL이 High인지 확인
    //    - 두 조건이 모두 만족되면 STOP
    //
    // Verilog 구현:
    // - always @(negedge sda_in) 또는 always @(posedge sda_in) 사용
    // - Edge 발생 시점에 scl == 1'b1인지 확인
    // - 조건 만족 시 상태 전이
    
    // START 조건 감지: SDA falling edge에서 SCL High 확인
    always @(negedge sda_in) begin
        // START 조건: SCL High이고 IDLE 상태일 때
        if (scl == 1'b1 && state == ST_IDLE) begin
            state <= ST_ADDR;
            bit_cnt <= 3'd7;
            addr_match <= 1'b0;
            shift_reg <= 8'h0;
            $display("[%0t] EEPROM: START detected", $time);
        end
    end
    
    // STOP 조건 감지: SDA rising edge에서 SCL High 확인
    always @(posedge sda_in) begin
        // STOP 조건: SCL High이고 IDLE이 아닐 때
        if (scl == 1'b1 && state != ST_IDLE) begin
            state <= ST_IDLE;
            bit_cnt <= 3'd7;
            addr_match <= 1'b0;
            sda_drive <= 1'b0;
            $display("[%0t] EEPROM: STOP detected (scl=%b, sda rising)", $time, scl);
        end
    end

    // ============================================================
    // 데이터 샘플링 (SCL posedge에서)
    // ============================================================
    // I2C 프로토콜: 데이터는 SCL High일 때 샘플링
    // Master가 데이터를 보낼 때: SCL Low에서 SDA 변경, SCL High에서 샘플링
    // Slave가 데이터를 보낼 때: SCL Low에서 SDA 변경, SCL High에서 Master가 샘플링
    always @(posedge scl) begin
        if (state != ST_IDLE) begin
            case (state)
                ST_ADDR: begin
                    // Device address + R/W bit 수신 (MSB first)
                    // bit_cnt가 7->6->...->0 순서로 감소
                    shift_reg[bit_cnt] <= sda_in;
                    if (bit_cnt == 3'd0) begin
                        // 8비트 모두 수신 완료
                        dev_addr <= shift_reg[7:1];  // 7-bit device address
                        rw_bit   <= sda_in;          // R/W bit (LSB)
                        addr_match <= (shift_reg[7:1] == I2C_ADDR);
                        $display("[%0t] EEPROM: Address byte received: 0x%02x (dev=0x%02x, rw=%b, match=%b)", 
                                 $time, {shift_reg[7:1], sda_in}, shift_reg[7:1], sda_in, (shift_reg[7:1] == I2C_ADDR));
                        if (shift_reg[7:1] == I2C_ADDR) begin
                            state <= ST_ADDR_ACK;
                            bit_cnt <= 3'd7;
                        end else begin
                            state <= ST_IDLE;
                            $display("[%0t] EEPROM: Address mismatch, going to IDLE", $time);
                        end
                    end else begin
                        bit_cnt <= bit_cnt - 1'b1;
                    end
                end
                
                ST_ADDR_ACK: begin
                    // ACK는 negedge에서 출력, 여기서는 다음 상태로 전이
                    if (rw_bit == 1'b0) begin
                        // Write operation
                        state <= ST_WORD;
                        bit_cnt <= 3'd7;
                        $display("[%0t] EEPROM: Write operation started", $time);
                    end else begin
                        // Read operation (Current Address Read)
                        state <= ST_READ;
                        bit_cnt <= 3'd7;
                        $display("[%0t] EEPROM: Read operation started from addr=0x%02x, data=0x%02x", 
                                 $time, pointer, storage[pointer]);
                    end
                end
                
                ST_WORD: begin
                    // Word address 수신 (EEPROM 내부 주소)
                    shift_reg[bit_cnt] <= sda_in;
                    if (bit_cnt == 3'd0) begin
                        pointer <= {shift_reg[7:1], sda_in};
                        state <= ST_WORD_ACK;
                        bit_cnt <= 3'd7;
                        $display("[%0t] EEPROM: Word address received: 0x%02x", $time, {shift_reg[7:1], sda_in});
                    end else begin
                        bit_cnt <= bit_cnt - 1'b1;
                    end
                end
                
                ST_WORD_ACK: begin
                    // ACK 전송 후 Write 상태로
                    state <= ST_WRITE;
                    bit_cnt <= 3'd7;
                end
                
                ST_WRITE: begin
                    // Write data 수신
                    shift_reg[bit_cnt] <= sda_in;
                    if (bit_cnt == 3'd0) begin
                        storage[pointer] <= {shift_reg[7:1], sda_in};
                        $display("[%0t] EEPROM Write: addr=0x%02x, data=0x%02x", 
                                 $time, pointer, {shift_reg[7:1], sda_in});
                        pointer <= pointer + 1'b1;
                        state <= ST_WRITE_ACK;
                        bit_cnt <= 3'd7;
                    end else begin
                        bit_cnt <= bit_cnt - 1'b1;
                    end
                end
                
                ST_WRITE_ACK: begin
                    // ACK 전송 후 다음 Write 대기
                    state <= ST_WRITE;
                    bit_cnt <= 3'd7;
                end
                
                ST_READ: begin
                    // Slave가 데이터를 출력하는 상태
                    // bit_cnt만 관리 (데이터는 negedge에서 출력)
                    if (bit_cnt == 3'd0) begin
                        state <= ST_READ_ACK;
                        bit_cnt <= 3'd7;
                    end else begin
                        bit_cnt <= bit_cnt - 1'b1;
                    end
                end
                
                ST_READ_ACK: begin
                    // Master의 ACK/NACK 확인
                    if (sda_in == 1'b1) begin
                        // NACK received, stop reading
                        state <= ST_IDLE;
                        $display("[%0t] EEPROM: NACK received, read finished", $time);
                    end else begin
                        // ACK received, continue reading
                        pointer <= pointer + 1'b1;
                        state <= ST_READ;
                        bit_cnt <= 3'd7;
                        $display("[%0t] EEPROM: ACK received, continue reading from addr=0x%02x, data=0x%02x", 
                                 $time, pointer, storage[pointer]);
                    end
                end
            endcase
        end
    end

    // ============================================================
    // SDA 데이터 출력 (SCL negedge에서)
    // ============================================================
    // I2C 프로토콜: 데이터는 SCL Low일 때 변경, SCL High일 때 안정화
    // 오픈 드레인: sda_drive=1이면 Low 출력, sda_drive=0이면 High-Z (풀업으로 High)
    //
    // 동작:
    // - ACK: sda_drive = 1 (Low 출력)
    // - NACK: sda_drive = 0 (High-Z, 풀업으로 High)
    // - 데이터 출력: storage[pointer][bit_cnt]가 0이면 Low, 1이면 High-Z
    always @(negedge scl) begin
        case (state)
            ST_IDLE: begin
                sda_drive <= 1'b0;  // Release SDA (High-Z)
            end
            
            ST_ADDR: begin
                sda_drive <= 1'b0;  // Master drives, slave releases
            end
            
            ST_ADDR_ACK: begin
                // ACK: Address가 일치하면 Low 출력, 아니면 High-Z
                if (addr_match) begin
                    sda_drive <= 1'b1;  // Drive SDA low (ACK)
                end else begin
                    sda_drive <= 1'b0;  // Release SDA (NACK, High-Z)
                end
            end
            
            ST_WORD: begin
                sda_drive <= 1'b0;  // Master drives, slave releases
            end
            
            ST_WORD_ACK: begin
                sda_drive <= 1'b1;  // ACK (drive low)
            end
            
            ST_WRITE: begin
                sda_drive <= 1'b0;  // Master drives, slave releases
            end
            
            ST_WRITE_ACK: begin
                sda_drive <= 1'b1;  // ACK (drive low)
            end
            
            ST_READ: begin
                // Slave drives data bit (MSB first)
                // storage[pointer][bit_cnt]가 1이면 High-Z, 0이면 Low
                // 오픈 드레인이므로: 1 -> High-Z (풀업으로 High), 0 -> Low
                sda_drive <= ~storage[pointer][bit_cnt];
            end
            
            ST_READ_ACK: begin
                sda_drive <= 1'b0;  // Release SDA for master's ACK/NACK
            end
            
            default: begin
                sda_drive <= 1'b0;
            end
        endcase
    end

endmodule

`default_nettype wire
