`timescale 1ns/1ps

//------------------------------------------------------------------------------
// MFRC522 SPI Master Controller
// - SPI Mode 0 (CPOL=0, CPHA=0): SCK idle low, data sampled on rising edge
// - Address byte format: MSB is R/W bit (0=Write, 1=Read), lower 7 bits are address
// - Supports single and multi-byte read/write operations
//------------------------------------------------------------------------------
module SPI_master (
    input wire clk,
    input wire rst,
    
    // Control signals
    input wire en,                    // Enable SPI transaction
    input wire rw,                    // 0=Write, 1=Read
    input wire [6:0] addr,            // 7-bit MFRC522 register address (0x00~0x7F)
    input wire [7:0] data_in,         // Data to write (single byte)
    input wire [7:0] num_bytes,      // Number of bytes to transfer (1-64)
    
    // SPI interface
    output reg cs_n,                  // Chip Select (Active Low)
    output reg sck,                   // Serial Clock
    output reg mosi,                  // Master Out Slave In
    input wire miso,                  // Master In Slave Out
    
    // Status and data output
    output reg [7:0] data_out,        // Data read from MFRC522
    output reg busy,                  // Transaction in progress
    output reg done,                  // Transaction completed
    output reg error,                 // Transaction error
    
    // Debug signals (for testbench)
    output reg [2:0] state_out        // Current state for debugging
);

    // SPI Mode 0: CPOL=0, CPHA=0
    // - SCK idle at LOW
    // - Data sampled on rising edge of SCK
    // - Data changed on falling edge of SCK
    
    // State machine
    localparam IDLE      = 3'b000;
    localparam CS_ASSERT = 3'b001;
    localparam TX_ADDR   = 3'b010;
    localparam TX_DATA   = 3'b011;
    localparam RX_DATA   = 3'b100;
    localparam CS_DEASSERT = 3'b101;
    
    reg [2:0] state, next_state;
    
    // Bit counter for address and data
    reg [5:0] bit_count;
    reg [7:0] byte_count;
    reg [7:0] tx_shift_reg;           // Transmit shift register
    reg [7:0] rx_shift_reg;           // Receive shift register
    reg [7:0] num_bytes_reg;           // Number of bytes to transfer
    reg tx_data_first_sck;            // Flag to prevent premature shift in TX_DATA
    reg [7:0] tx_data_original;       // Store original data for last bit (LSB)
    reg [7:0] tx_addr_original;       // Store original address for last bit (LSB)
    
    // SCK generation (divide by 4 for 25MHz SPI from 100MHz system clock)
    reg [1:0] sck_div;
    reg [1:0] cs_setup_counter;  // CS setup time counter
    reg [1:0] cs_hold_counter;   // CS hold time counter
    wire sck_enable;
    reg sck_prev;  // Previous SCK value for rising edge detection
    wire sck_rising;   // SCK rising edge (for sampling MISO and bit counting)

    // en 신호 동기화 및 엣지 감지 (펄스 신호를 안정적으로 캡처)
    reg en_sync1, en_sync2, en_sync3;
    always @(posedge clk) begin
        if (rst) begin
            en_sync1 <= 1'b0;
            en_sync2 <= 1'b0;
            en_sync3 <= 1'b0;
        end else begin
            en_sync1 <= en;
            en_sync2 <= en_sync1;
            en_sync3 <= en_sync2;
        end
    end
    
    // 엣지 감지: en_sync2가 rising edge일 때 플래그 설정
    wire en_rising_edge = en_sync2 && !en_sync3;
    
    // 펄스 플래그: 엣지가 감지되면 무조건 설정되고, 트랜잭션이 완료되면 클리어
    // busy 상태와 무관하게 엣지를 캡처하여 놓치지 않도록 함
    reg en_pulse_flag;
    always @(posedge clk) begin
        if (rst) begin
            en_pulse_flag <= 1'b0;
        end else if (en_rising_edge) begin
            // 엣지가 감지되면 무조건 플래그 설정 (busy와 무관하게)
            en_pulse_flag <= 1'b1;
        end else if (state == IDLE && !busy) begin
            // 트랜잭션이 완료되어 IDLE 상태로 돌아오고 busy가 LOW이면 플래그 클리어
            // 이렇게 하면 다음 트랜잭션을 위해 플래그가 준비됨
            en_pulse_flag <= 1'b0;
        end
    end
    
    // FSM에서 사용할 en 신호: 동기화된 레벨 또는 펄스 플래그
    // 펄스 플래그는 엣지가 감지되었음을 나타내므로, 레벨 신호와 OR하여 사용
    wire en_internal = en_sync2 || en_pulse_flag;


    always @(posedge clk) begin
        if (rst) begin
            sck_div <= 2'b00;
            cs_setup_counter <= 2'b00;
            cs_hold_counter <= 2'b00;
        end else begin
            case (state)
                IDLE: begin
                    sck_div <= 2'b00;
                    cs_setup_counter <= 2'b00;
                    cs_hold_counter <= 2'b00;
                end
                CS_ASSERT: begin
                    // Count setup time: 0 → 1 → 2 (2 cycles wait after entry)
                    // After entering CS_ASSERT, counter is 0
                    // First cycle: counter = 1
                    // Second cycle: counter = 2, then transition to TX_ADDR
                    if (cs_setup_counter < 2'b11) begin  // Limit to 3 max
                        cs_setup_counter <= cs_setup_counter + 1;
            end
                    sck_div <= 2'b00;
                end
                CS_DEASSERT: begin
                    // Count hold time: 0 → 1 → 2 (2 cycles wait after entry)
                    if (cs_hold_counter < 2'b11) begin  // Limit to 3 max
                        cs_hold_counter <= cs_hold_counter + 1;
                    end
                    sck_div <= 2'b00;
            end
                default: begin
                    // In TX_ADDR, TX_DATA, RX_DATA states, generate SCK
                    sck_div <= sck_div + 1;
                end
            endcase
        end
    end

    assign sck_enable = (sck_div == 2'b11);
    
    // SCK edge detection (for SPI Mode 0 timing)
    // Only need sck_prev for rising edge detection (MISO sampling, bit counting)
    // For falling edge (MOSI data change), we use sck_enable && sck == 1'b1 directly
    always @(posedge clk) begin
        if (rst) begin
            sck_prev <= 1'b0;
        end else begin
            sck_prev <= sck;
        end
    end
    // Rising edge: current is HIGH and previous was LOW
    // Used for: MISO sampling, bit_count increment, state transitions
    assign sck_rising = (sck == 1'b1) && (sck_prev == 1'b0);
    
    // State machine
    always @(posedge clk) begin
        if (rst) begin
            state <= IDLE;
            state_out <= IDLE;
        end else begin
            // Debug output disabled for clean waveform
            // if (state != next_state) begin
            //     $display("[%0t] SPI_master: state transition %0d -> %0d", $time, state, next_state);
            // end
            state <= next_state;
            state_out <= next_state;  // Output state for testbench monitoring
        end
    end
    
    // Previous state for edge detection
    reg [2:0] state_prev;
    always @(posedge clk) begin
        if (rst) begin
            state_prev <= IDLE;
        end else begin
            state_prev <= state;
        end
    end
    wire state_tx_addr_entry = (state == TX_ADDR) && (state_prev != TX_ADDR);
    wire state_tx_data_entry = (state == TX_DATA) && (state_prev != TX_DATA);
    wire state_rx_data_entry = (state == RX_DATA) && (state_prev != RX_DATA);
    
    // Next state logic
    always @(*) begin
        next_state = state;
        case (state)
            IDLE: begin
                if (en_internal && !busy) begin
                    next_state = CS_ASSERT;
                    // Debug output disabled
                end
            end
            CS_ASSERT: begin
                // Wait 2 cycles for CS setup time
                // Counter sequence: 0 (entry) → 1 (1st cycle) → 2 (2nd cycle, then exit)
                if (cs_setup_counter >= 2'b10) begin
                    next_state = TX_ADDR;
                    // Debug output disabled
                end
            end
            TX_ADDR: begin
                // Transition after 8 bits (bit_count == 7) on rising edge
                if (bit_count == 7 && sck_rising) begin
                    if (rw) begin
                        next_state = RX_DATA;  // Read operation
                    end else begin
                        next_state = TX_DATA;  // Write operation
                    end
                end
            end
            TX_DATA: begin
                // Transition after 8 bits (bit_count == 7) on rising edge
                if (bit_count == 7 && sck_rising && byte_count == (num_bytes_reg - 1)) begin
                    next_state = CS_DEASSERT;
                end else if (bit_count == 7 && sck_rising) begin
                    next_state = TX_DATA;  // Continue with next byte
                end
            end
            RX_DATA: begin
                // Transition after 8 bits (bit_count == 7) on rising edge
                if (bit_count == 7 && sck_rising && byte_count == (num_bytes_reg - 1)) begin
                    next_state = CS_DEASSERT;
                end else if (bit_count == 7 && sck_rising) begin
                    next_state = RX_DATA;  // Continue with next byte
                end
            end
            CS_DEASSERT: begin
                // Wait 2 cycles for CS hold time
                // Counter sequence: 0 (entry) → 1 (1st cycle) → 2 (2nd cycle, then exit)
                if (cs_hold_counter >= 2'b10) begin
                    next_state = IDLE;
                end
            end
            default: next_state = IDLE;
        endcase
    end
    

    // Bit counter
    // SPI Mode 0: Count on rising edge (when data is sampled)
    always @(posedge clk) begin
        if (rst) begin
            bit_count <= 6'b0;
        end else if (state == TX_ADDR || state == TX_DATA || state == RX_DATA) begin
            // Reset bit_count when entering new state
            if (state_tx_addr_entry || state_tx_data_entry || state_rx_data_entry) begin
                bit_count <= 6'b0;
                // Debug output disabled
            end else if (sck_rising) begin
                // Increment on rising edge (after data is sampled)
                if (bit_count == 7) begin
                    bit_count <= 6'b0;
                end else begin
                    bit_count <= bit_count + 1;
                end
                if (bit_count == 0 || bit_count == 6) begin
                    // Debug output disabled
                end
            end
        end else begin
            bit_count <= 6'b0;
        end
    end
    
    // Byte counter
    always @(posedge clk) begin
        if (rst) begin
            byte_count <= 8'b0;
            num_bytes_reg <= 8'b1;
        end else if (state == IDLE && en_internal) begin
            byte_count <= 8'b0;
            num_bytes_reg <= (num_bytes == 0) ? 8'b1 : num_bytes;  // Minimum 1 byte
        end else if ((state == TX_DATA || state == RX_DATA) && bit_count == 7 && sck_rising) begin
            if (byte_count < (num_bytes_reg - 1)) begin
                byte_count <= byte_count + 1;
                    end
                end
    end
    
    // TX_DATA first SCK flag management
    always @(posedge clk) begin
        if (rst) begin
            tx_data_first_sck <= 1'b0;
        end else if (state_tx_data_entry) begin
            // Set flag when entering TX_DATA
            tx_data_first_sck <= 1'b1;
        end else if (state == TX_DATA && sck_enable && sck == 1'b1) begin
            // Clear flag after first SCK falling edge in TX_DATA
            tx_data_first_sck <= 1'b0;
        end else if (state != TX_DATA) begin
            // Clear flag when leaving TX_DATA
            tx_data_first_sck <= 1'b0;
        end
    end

    // Transmit shift register
    // SPI Mode 0: Data changes on falling edge of SCK
    // MOSI is sampled by slave on rising edge, so it must change on falling edge
    always @(posedge clk) begin
        if (rst) begin
            tx_shift_reg <= 8'h00;
        end else if (state == IDLE && en_internal) begin
            // Pre-load address byte in IDLE state to avoid timing issues
            // Debug output disabled
            tx_shift_reg <= {rw, addr[6:0]};
            tx_addr_original <= {rw, addr[6:0]};  // Store original address for last bit
        end else if (state == CS_ASSERT) begin
            // Keep tx_shift_reg value during CS assertion (don't clear!)
            tx_shift_reg <= tx_shift_reg;
        end else if (state == TX_ADDR) begin
            // Shift address byte  
            // Note: Need 7 shifts for 8 bits (bit 0-6 shift, bit 7 samples last position)
            if (sck_enable && sck == 1'b1 && bit_count > 0) begin
                // Shift when SCK is HIGH and about to go LOW (falling edge)
                // This ensures MOSI changes on falling edge, ready for next rising edge sampling
                // Shift after bit 0 is sampled (bit_count > 0) through bit 6 (bit_count <= 6)
                if (bit_count <= 6) begin
                    tx_shift_reg <= {tx_shift_reg[6:0], 1'b0};
                end
            end
        end else if (state == TX_DATA) begin
            // Load data byte when entering TX_DATA state (before first SCK)
            if (state_tx_data_entry) begin
                // State transition: TX_ADDR -> TX_DATA
                // Load data immediately when entering TX_DATA to ensure MOSI is ready
                tx_shift_reg <= data_in;
                tx_data_original <= data_in;  // Store original data for last bit
                // Debug output disabled
            end else if (sck_enable && sck == 1'b1 && !tx_data_first_sck) begin
                // Shift when SCK is HIGH and about to go LOW (falling edge)
                // This ensures MOSI changes on falling edge, ready for next rising edge sampling
                // Don't shift until after first SCK cycle (tx_data_first_sck prevents premature shift)
                // Shift for bit_count 0-6 (7 shifts total for 8 bits)
                if (bit_count <= 6) begin
                    tx_shift_reg <= {tx_shift_reg[6:0], 1'b0};
                    // Debug output disabled
                end
            end
        end else if (state == CS_DEASSERT) begin
            // Keep tx_shift_reg during CS deassertion
            tx_shift_reg <= tx_shift_reg;
        end else begin
            // Clear in IDLE state
            tx_shift_reg <= 8'h00;
        end
    end

    // Receive shift register
    // SPI Mode 0: Sample MISO on rising edge of SCK
    // Note: MISO is only sampled during RX_DATA phase (not during TX_ADDR)
    // MFRC522 and most SPI devices don't send data during address transmission
    always @(posedge clk) begin
        if (rst) begin
            rx_shift_reg <= 8'h00;
            data_out <= 8'h00;
        end else if (state == RX_DATA) begin
            // Initialize rx_shift_reg when entering RX_DATA state
            if (state_rx_data_entry) begin
                rx_shift_reg <= 8'h00;
            end else if (sck_rising) begin
                // Sample MISO on rising edge of SCK (SPI Mode 0)
                rx_shift_reg <= {rx_shift_reg[6:0], miso};
                // Complete byte received, store to data_out
                if (bit_count == 7) begin
                    data_out <= {rx_shift_reg[6:0], miso};
                end
            end
        end else begin
            // Clear when not in RX_DATA state
            rx_shift_reg <= 8'h00;
        end
    end
    
    // SCK generation (SPI Mode 0: idle LOW)
    always @(posedge clk) begin
        if (rst) begin
            sck <= 1'b0;
        end else if (state == TX_ADDR || state == TX_DATA || state == RX_DATA) begin
            // Toggle SCK on sck_enable
            if (sck_enable) begin
                sck <= ~sck;
        end
        end else begin
            sck <= 1'b0;  // Idle LOW
        end
    end
    
    // MOSI output
    // SPI Mode 0: Data changes on falling edge, stable on rising edge
    // MOSI must be ready before first SCK rising edge
    always @(posedge clk) begin
        if (rst) begin
            mosi <= 1'b0;
        end else if (state == TX_ADDR || state == TX_DATA) begin
            // Output MSB of shift register for bits 0-6
            // For bit 7 (last bit), output LSB of original data
            if (state == TX_DATA && bit_count == 7) begin
                // Last bit of TX_DATA: output LSB (bit 0) of original data
                mosi <= tx_data_original[0];
            end else if (state == TX_ADDR && bit_count == 7) begin
                // Last bit of TX_ADDR: output LSB (bit 0) of original address
                mosi <= tx_addr_original[0];
            end else begin
                // Bits 0-6: output MSB (bit 7) of shift register
                // Ensure MOSI is updated immediately when tx_shift_reg changes
                mosi <= tx_shift_reg[7];
            end
            // Debug output disabled
        end else if (state == CS_ASSERT) begin
            // CS_ASSERT 상태에서도 MOSI를 준비 (첫 번째 비트를 미리 출력)
            // TX_ADDR 상태로 진입하기 전에 MOSI가 준비되어야 함
            mosi <= tx_shift_reg[7];
        end else begin
            mosi <= 1'b0;
        end
    end

    // CS_N generation (Active Low)
    always @(posedge clk) begin
        if (rst) begin
            cs_n <= 1'b1;  // Inactive (HIGH)
        end else if (state == CS_ASSERT || state == TX_ADDR || 
                     state == TX_DATA || state == RX_DATA) begin
            cs_n <= 1'b0;  // Active (LOW)
            // Debug output disabled
        end else begin
            cs_n <= 1'b1;  // Inactive (HIGH)
            // $display("[%0t] SPI_master: cs_n <= 1 (state=%0d)", $time, state);  // Disabled for clean waveform
        end
    end
    
    // Status signals
    always @(posedge clk) begin
        if (rst) begin
            busy <= 1'b0;
            done <= 1'b0;
            error <= 1'b0;
        end else begin
            if (state == IDLE) begin
                busy <= 1'b0;
                done <= 1'b0;
                error <= 1'b0;
            end else if (state == CS_ASSERT) begin
                busy <= 1'b1;
                done <= 1'b0;
            end else if (state == CS_DEASSERT) begin
                // When hold time is complete, transaction is done
                if (cs_hold_counter >= 2'b10) begin
                    busy <= 1'b0;
                    done <= 1'b1;
                end else begin
                    busy <= 1'b1;
                    done <= 1'b0;
                end
            end else begin
                // During TX_ADDR, TX_DATA, RX_DATA states
                busy <= 1'b1;
                done <= 1'b0;
            end
        end
    end
// RX 과정 모니터링
always @(posedge clk) begin
    if (state == RX_DATA && sck_rising) begin
        $display("[%0t] RX: bit_count=%0d, miso=%b, rx_shift=%h", 
                 $time, bit_count, miso, rx_shift_reg);
        
        if (bit_count == 7) begin
            $display("[%0t] *** RX Complete! data_out = %h ***", 
                     $time, {rx_shift_reg[6:0], miso});
        end
    end
end

// 상태 전환 모니터링
always @(state) begin
    case (state)
        // 상태 정의에 따라 수정
        3'b000: $display("[%0t] State: IDLE", $time);
        3'b001: $display("[%0t] State: START", $time);
        3'b010: $display("[%0t] State: TX_DATA", $time);
        3'b011: $display("[%0t] State: RX_DATA", $time);  // ← 이게 나오는지 확인!
        3'b100: $display("[%0t] State: STOP", $time);
    endcase
end

// data_out 변화 감지
always @(data_out) begin
    if (data_out != 8'h00) begin
        $display("[%0t] *** data_out changed to: 0x%h ***", $time, data_out);
    end
end
endmodule
