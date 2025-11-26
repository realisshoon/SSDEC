//------------------------------------------------------------------------------
// mfrc522_dummy.sv (Fixed Version)
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
    output       spi_miso, // Slave Output (tri-state)
    output reg   card_present // Card present flag
);

    // 테스트 응답 데이터 정의
    localparam [7:0] VERSION_REG_DATA = 8'h92;  // Version register (0x37)
    localparam [7:0] TEST_DATA_AA = 8'hAA;
    localparam [7:0] TEST_DATA_55 = 8'h55;
    
    // SPI 상태 정의
    localparam S_IDLE       = 3'b000;
    localparam S_GET_ADDR   = 3'b001;
    localparam S_DUMMY_BYTE = 3'b010;
    localparam S_DATA_RX    = 3'b011;
    localparam S_DATA_TX    = 3'b100;
    
    reg [2:0]   state;
    reg [7:0]   shift_reg_rx;
    reg [7:0]   shift_reg_tx;
    reg [3:0]   bit_cnt;
    reg         is_read_op;
    reg [6:0]   reg_addr;
    reg         miso_enable;  // MISO 출력 활성화
    reg [31:0]  uid_reg;      // 4‑byte UID (LSB first)
    
    //--------------------------------------------------------------------------
    // Register Storage (simplified)
    //--------------------------------------------------------------------------
    reg [7:0] registers [0:127];
    
    integer i;
    initial begin
        for (i = 0; i < 128; i = i + 1) begin
            registers[i] = 8'h00;
        end
        // Initialize test registers
        registers[7'h37] = VERSION_REG_DATA;  // Version register
        // Fixed UID (example: 0x93 0x20 0x55 0xAA)
        uid_reg = 32'hAA552093; // LSB first: 0x93,0x20,0x55,0xAA
        registers[7'h00] = uid_reg[7:0];   // UID byte 0
        registers[7'h01] = uid_reg[15:8];  // UID byte 1
        registers[7'h02] = uid_reg[23:16]; // UID byte 2
        registers[7'h03] = uid_reg[31:24]; // UID byte 3
        // Card present flag always asserted for simulation
        card_present = 1'b1;
        
        $display("[MFRC522_DUMMY] Initialized. Version reg (0x37) = 0x%h", registers[7'h37]);
    end
    
    //--------------------------------------------------------------------------
    // State Machine and MOSI Sampling (posedge spi_sck)
    //--------------------------------------------------------------------------
    always @(posedge spi_sck or negedge axi_aresetn or posedge spi_cs_n) begin
        if (!axi_aresetn || spi_cs_n) begin
            state        <= S_IDLE;
            bit_cnt      <= 4'd0;
            is_read_op   <= 1'b0;
            reg_addr     <= 7'h00;
            shift_reg_rx <= 8'h00;
            card_present <= 1'b0; // de‑assert when reset or CS high
        end else begin
            // Sample MOSI (MSB First)
            shift_reg_rx <= {shift_reg_rx[6:0], spi_mosi};
            
            case (state)
                S_IDLE: begin
                    state <= S_GET_ADDR;
                    bit_cnt <= 4'd1;
                    $display("[%0t] [MFRC522_DUMMY] Transaction started", $time);
                end
                
                S_GET_ADDR: begin
                    if (bit_cnt == 4'd7) begin
                        // Address byte complete: {shift_reg_rx[6:0], spi_mosi}
                        // Format: 0bXAAAAAAR (X=0, A=addr[6:0], R=read/write)
                        is_read_op <= spi_mosi;  // LSB = R/W bit
                        reg_addr <= shift_reg_rx[6:0];  // Upper 7 bits = address
                        
                        $display("[%0t] [MFRC522_DUMMY] Address byte: addr=0x%h, rw=%b (%s)", 
                                 $time, shift_reg_rx[6:0], spi_mosi, 
                                 spi_mosi ? "READ" : "WRITE");
                        
                        if (spi_mosi) begin  // Read operation
                            state <= S_DUMMY_BYTE;
                        end else begin  // Write operation
                            state <= S_DATA_RX;
                        end
                        bit_cnt <= 4'd0;
                    end else begin
                        bit_cnt <= bit_cnt + 1;
                    end
                end
                
                S_DUMMY_BYTE: begin
                    if (bit_cnt == 4'd7) begin
                        $display("[%0t] [MFRC522_DUMMY] Dummy byte complete, preparing data from addr 0x%h: 0x%h", 
                                 $time, reg_addr, registers[reg_addr]);
                        state <= S_DATA_TX;
                        bit_cnt <= 4'd0;
                    end else begin
                        bit_cnt <= bit_cnt + 1;
                    end
                end
                
                S_DATA_RX: begin
                    if (bit_cnt == 4'd7) begin
                        // Write data complete
                        registers[reg_addr] <= {shift_reg_rx[6:0], spi_mosi};
                        $display("[%0t] [MFRC522_DUMMY] Write complete: addr=0x%h, data=0x%h", 
                                 $time, reg_addr, {shift_reg_rx[6:0], spi_mosi});
                        state <= S_IDLE;
                        bit_cnt <= 4'd0;
                    end else begin
                        bit_cnt <= bit_cnt + 1;
                    end
                end
                
                S_DATA_TX: begin
                    if (bit_cnt == 4'd7) begin
                        $display("[%0t] [MFRC522_DUMMY] Read complete: addr=0x%h, data=0x%h", 
                                 $time, reg_addr, shift_reg_tx);
                        state <= S_IDLE;
                        bit_cnt <= 4'd0;
                    end else begin
                        bit_cnt <= bit_cnt + 1;
                    end
                end
                
                default: state <= S_IDLE;
            endcase
        end
    end
    
    //--------------------------------------------------------------------------
    // MISO Shift Register Load and Shift (negedge spi_sck)
    //--------------------------------------------------------------------------
    // Use synchronized state and bit_cnt to avoid metastability
    reg [2:0]   state_sync;
    reg [3:0]   bit_cnt_sync;
    
    // Synchronize state and bit_cnt to negedge domain
    always @(negedge spi_sck or negedge axi_aresetn or posedge spi_cs_n) begin
        if (!axi_aresetn || spi_cs_n) begin
            state_sync <= S_IDLE;
            bit_cnt_sync <= 4'd0;
            shift_reg_tx <= 8'h00;
            miso_enable <= 1'b0;
        end else begin
            // Synchronize from posedge domain (with one cycle delay)
            state_sync <= state;
            bit_cnt_sync <= bit_cnt;
            
            if (state_sync == S_DATA_TX) begin
                if (bit_cnt_sync == 4'd0) begin
                    // Load data at the start of S_DATA_TX
                    shift_reg_tx <= registers[reg_addr];
                    miso_enable <= 1'b1;
                    $display("[%0t] [MFRC522_DUMMY] Loading tx data: 0x%h", $time, registers[reg_addr]);
                end else begin
                    // Shift out MSB and shift left
                    shift_reg_tx <= {shift_reg_tx[6:0], 1'b0};
                end
            end else begin
                miso_enable <= 1'b0;
            end
        end
    end
    
    //--------------------------------------------------------------------------
    // MISO Output (MSB First)
    //--------------------------------------------------------------------------
    // Output MSB on falling edge, stable for master to sample on next rising edge
    assign spi_miso = (!axi_aresetn || spi_cs_n || !miso_enable) ? 1'bz : shift_reg_tx[7];
    
    //--------------------------------------------------------------------------
    // Debug monitoring
    //--------------------------------------------------------------------------
    always @(posedge spi_sck) begin
        if (!spi_cs_n && state == S_DATA_TX) begin
            $display("[%0t] [MFRC522_DUMMY] TX bit %0d: miso=%b, shift_reg=0x%h", 
                     $time, bit_cnt, shift_reg_tx[7], shift_reg_tx);
        end
    end
    
endmodule