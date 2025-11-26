//------------------------------------------------------------------------------
// top_bfm.sv - SPI AXI Controller Cosimulation Testbench
//------------------------------------------------------------------------------
// C 코드와 통신하기 위한 BFM을 사용하는 버전
// - cosim_bfm_axi_full 모듈을 통해 C 코드의 bfm_write/bfm_read와 통신
// - AXI Switch는 나중에 추가 예정, 현재는 직접 연결
//------------------------------------------------------------------------------
`timescale 1ns/1ps

module top_bfm;
    //--------------------------------------------------------------------------
    localparam int  ACLK_FREQ_MHZ=100;
    localparam int  ACLK_FREQ=ACLK_FREQ_MHZ*1_000_000;
    localparam real ACLK_HALF=(1_000_000_000.0/ACLK_FREQ/2.0);
    
    // AXI 파라미터
    localparam int WIDTH_ID  = 4;
    localparam int WIDTH_AD  = 32;
    localparam int WIDTH_DA  = 32;
    localparam int WIDTH_DS  = 4;
    localparam int WIDTH_SID = 6;
    
    // Clock and Reset
    reg  axi_aresetn=1'b0; initial begin #124; axi_aresetn=1'b1; end
    reg  axi_aclk=1'b0; always #ACLK_HALF axi_aclk <= ~axi_aclk;
    
    //--------------------------------------------------------------------------
    // AXI Master 신호 (BFM에서 출력)
    //--------------------------------------------------------------------------
    wire [WIDTH_ID-1:0]      axi_awid;
    wire [WIDTH_AD-1:0]      axi_awaddr;
    wire [ 7:0]              axi_awlen;
    wire [ 2:0]              axi_awsize;
    wire [ 1:0]              axi_awburst;
    wire [ 3:0]              axi_awcache;
    wire [ 2:0]              axi_awprot;
    wire                     axi_awlock;
    wire                     axi_awvalid;
    wire                     axi_awready;
    wire [WIDTH_DA-1:0]      axi_wdata;
    wire [WIDTH_DS-1:0]      axi_wstrb;
    wire                     axi_wlast;
    wire                     axi_wvalid;
    wire                     axi_wready;
    wire [WIDTH_ID-1:0]      axi_bid;
    wire [ 1:0]              axi_bresp;
    wire                     axi_bvalid;
    wire                     axi_bready;
    wire [WIDTH_ID-1:0]      axi_arid;
    wire [WIDTH_AD-1:0]      axi_araddr;
    wire [ 7:0]              axi_arlen;
    wire [ 2:0]              axi_arsize;
    wire [ 1:0]              axi_arburst;
    wire [ 3:0]              axi_arcache;
    wire [ 2:0]              axi_arprot;
    wire                     axi_arlock;
    wire                     axi_arvalid;
    wire                     axi_arready;
    wire [WIDTH_ID-1:0]      axi_rid;
    wire [WIDTH_DA-1:0]      axi_rdata;
    wire [ 1:0]              axi_rresp;
    wire                     axi_rlast;
    wire                     axi_rvalid;
    wire                     axi_rready;
    
    //--------------------------------------------------------------------------
    // BFM GPIO/IRQ 신호 (사용하지 않지만 포트 연결 필요)
    //--------------------------------------------------------------------------
    wire [31:0]              bfm_gpout;
    wire [31:0]              bfm_gpin = 32'h0;
    wire                     bfm_irq  = 1'b0;
    
    //--------------------------------------------------------------------------
    // Cosimulation BFM 인스턴스
    //--------------------------------------------------------------------------
    cosim_bfm_axi_full #(
        .AXI_WIDTH_ID   (WIDTH_ID   ),
        .AXI_WIDTH_ADDR (WIDTH_AD   ),
        .AXI_WIDTH_DATA (WIDTH_DA   ),
        .COSIM_CHAN_ID  (0          ),  // C 코드의 cid와 일치
        .COSIM_VERBOSE  (0          )
    ) u_bfm_axi_full (
          .aresetn      ( axi_aresetn   )
        , .aclk         ( axi_aclk      )
        // AXI Master Write Address
        , .m_axi_awid   ( axi_awid      )
        , .m_axi_awaddr ( axi_awaddr    )
        , .m_axi_awlen  ( axi_awlen     )
        , .m_axi_awsize ( axi_awsize    )
        , .m_axi_awburst( axi_awburst   )
        , .m_axi_awcache( axi_awcache   )
        , .m_axi_awprot ( axi_awprot    )
        , .m_axi_awlock ( axi_awlock    )
        , .m_axi_awvalid( axi_awvalid   )
        , .m_axi_awready( axi_awready   )
        // AXI Master Write Data
        , .m_axi_wdata  ( axi_wdata     )
        , .m_axi_wstrb  ( axi_wstrb     )
        , .m_axi_wlast  ( axi_wlast     )
        , .m_axi_wvalid ( axi_wvalid    )
        , .m_axi_wready ( axi_wready    )
        // AXI Master Write Response
        , .m_axi_bid    ( axi_bid       )
        , .m_axi_bresp  ( axi_bresp     )
        , .m_axi_bvalid ( axi_bvalid    )
        , .m_axi_bready ( axi_bready    )
        // AXI Master Read Address
        , .m_axi_arid   ( axi_arid      )
        , .m_axi_araddr ( axi_araddr    )
        , .m_axi_arlen  ( axi_arlen     )
        , .m_axi_arsize ( axi_arsize    )
        , .m_axi_arburst( axi_arburst   )
        , .m_axi_arcache( axi_arcache   )
        , .m_axi_arprot ( axi_arprot    )
        , .m_axi_arlock ( axi_arlock    )
        , .m_axi_arvalid( axi_arvalid   )
        , .m_axi_arready( axi_arready   )
        // AXI Master Read Data
        , .m_axi_rid    ( axi_rid       )
        , .m_axi_rdata  ( axi_rdata     )
        , .m_axi_rresp  ( axi_rresp     )
        , .m_axi_rlast  ( axi_rlast     )
        , .m_axi_rvalid ( axi_rvalid    )
        , .m_axi_rready ( axi_rready    )
        // GPIO/IRQ
        , .gpout        ( bfm_gpout     )
        , .gpin         ( bfm_gpin      )
        , .irq          ( bfm_irq       )
    );

    //--------------------------------------------------------------------------
    // SPI Interface
    //--------------------------------------------------------------------------
    wire                     spi_cs_n;
    wire                     spi_sck;
    wire                     spi_mosi;
    wire                     spi_miso; // MISO 신호 (mfrc522_dummy에서 출력)
    wire [2:0]               spi_state_out; 
    
    //--------------------------------------------------------------------------
    // SPI AXI Controller Instance (BFM의 AXI Master 포트에 연결)
    //--------------------------------------------------------------------------
    // TODO: 나중에 AXI Switch를 추가하면 BFM → AXI Switch → SPI로 연결
    spi_axi_controller #(
        .AXI_WIDTH_ID   (WIDTH_ID   ),
        .AXI_WIDTH_ADDR (WIDTH_AD   ),
        .AXI_WIDTH_DATA (WIDTH_DA   ),
        .AXI_WIDTH_STRB (WIDTH_DS   ),
        .P_SIZE_IN_BYTES(4096       ))
    u_spi_axi (
          .axi_aresetn   ( axi_aresetn      )
        , .axi_aclk      ( axi_aclk         )
        // AXI Slave Ports (BFM의 Master 포트에 연결)
        , .s_axi_awid    ( axi_awid         )
        , .s_axi_awaddr  ( axi_awaddr       )
        , .s_axi_awlen   ( axi_awlen        )
        , .s_axi_awsize  ( axi_awsize       )
        , .s_axi_awburst ( axi_awburst      )
        , .s_axi_awvalid ( axi_awvalid      )
        , .s_axi_awready ( axi_awready      )
        , .s_axi_wdata   ( axi_wdata        )
        , .s_axi_wstrb   ( axi_wstrb        )
        , .s_axi_wlast   ( axi_wlast        )
        , .s_axi_wvalid  ( axi_wvalid       )
        , .s_axi_wready  ( axi_wready       )
        , .s_axi_bid     ( axi_bid          )
        , .s_axi_bresp   ( axi_bresp        )
        , .s_axi_bvalid  ( axi_bvalid       )
        , .s_axi_bready  ( axi_bready       )
        , .s_axi_arid    ( axi_arid         )
        , .s_axi_araddr  ( axi_araddr       )
        , .s_axi_arlen   ( axi_arlen        )
        , .s_axi_arsize  ( axi_arsize       )
        , .s_axi_arburst ( axi_arburst      )
        , .s_axi_arvalid ( axi_arvalid      )
        , .s_axi_arready ( axi_arready      )
        , .s_axi_rid     ( axi_rid          )
        , .s_axi_rdata   ( axi_rdata        )
        , .s_axi_rresp   ( axi_rresp        )
        , .s_axi_rlast   ( axi_rlast        )
        , .s_axi_rvalid  ( axi_rvalid       )
        , .s_axi_rready  ( axi_rready       )
        // SPI Ports
        , .spi_cs_n      ( spi_cs_n         )
        , .spi_sck       ( spi_sck          )
        , .spi_mosi      ( spi_mosi         )
        , .spi_miso      ( spi_miso         )
        , .spi_state_out ( spi_state_out    )
    );
    


    // MISO 출력 로직: SPI Mode 0에서 MISO는 SCK falling edge에서 변경되어야 함
    // 마스터는 SCK rising edge에서 샘플링하므로, falling edge에서 변경하면 안정적
    always @(negedge spi_sck or negedge axi_aresetn or posedge spi_cs_n) begin
        if (!axi_aresetn || spi_cs_n) begin
            miso_driver <= 1'b0;
            tx_bit_cnt <= 4'd0;
        end else if (spi_slave_state == SPI_SLAVE_S_SEND_DATA) begin
            // Read 동작 시 데이터 송신 (MSB First)
            if (tx_bit_cnt < 4'd8) begin
                miso_driver <= spi_slave_shift_reg_tx[7];
                spi_slave_shift_reg_tx <= {spi_slave_shift_reg_tx[6:0], 1'b0};
                tx_bit_cnt <= tx_bit_cnt + 1;
            end else begin
                miso_driver <= 1'b0;
            end
        end else begin
            miso_driver <= 1'b0;
        end
    end
    
    // MISO 신호 직접 연결 (force 제거, 조합 논리로 연결)
    assign spi_miso = (!axi_aresetn || spi_cs_n) ? 1'b0 : miso_driver;

    
    //--------------------------------------------------------------------------
    // SPI Slave 로직: SCK Rising Edge에서 MOSI 샘플링 (주소 수신)
    //--------------------------------------------------------------------------
    always @(posedge spi_sck or negedge axi_aresetn or posedge spi_cs_n) begin
        if (!axi_aresetn || spi_cs_n) begin
            spi_slave_shift_reg_rx <= 8'h00;
            spi_slave_bit_cnt      <= 4'd0;
            spi_slave_state        <= SPI_SLAVE_S_IDLE;
            spi_slave_is_read_op   <= 1'b0;
        end else begin
            // 데이터 시프트 (MSB First)
            spi_slave_shift_reg_rx <= {spi_slave_shift_reg_rx[6:0], spi_mosi};
            
            if (spi_slave_state == SPI_SLAVE_S_IDLE) begin
                spi_slave_state <= SPI_SLAVE_S_GET_ADDR;
                spi_slave_bit_cnt <= 4'd1;
            end else begin
                // 8비트 단위 카운팅
                if (spi_slave_bit_cnt == 4'd7) begin
                    spi_slave_bit_cnt <= 4'd0;
                    // 첫 번째 바이트 수신 완료 (주소 + R/W 비트)
                    if (spi_slave_state == SPI_SLAVE_S_GET_ADDR) begin
                        // MFRC522 주소 바이트 형식: 0b0AAAAAAAR
                        // Bit 7: 0 (MSB, 항상 0)
                        // Bit 6-1: 레지스터 주소 (AAAAAA)
                        // Bit 0: R/W 플래그 (R, 0=Write, 1=Read)
                        if (spi_slave_shift_reg_rx[0]) begin  // LSB=1: Read operation
                            spi_slave_state <= SPI_SLAVE_S_SEND_DATA;
                            spi_slave_is_read_op <= 1'b1;
                            // Read일 때 테스트 데이터 준비 및 카운터 리셋
                            spi_slave_shift_reg_tx <= SPI_SLAVE_TEST_DATA;
                            // 다음 falling edge에서 바로 데이터를 출력하기 위해 카운터를 0으로 설정
                            // (negedge 블록에서 감지할 수 있도록)
                        end else begin  // LSB=0: Write operation
                            spi_slave_state <= SPI_SLAVE_S_IDLE;
                            spi_slave_is_read_op <= 1'b0;
                            spi_slave_shift_reg_tx <= 8'h00;
                        end
                    end
                end else begin
                    spi_slave_bit_cnt <= spi_slave_bit_cnt + 1;
                end
            end
        end
    end

    //--------------------------------------------------------------------------
    // SPI Slave 상태 관리: SCK Rising Edge에서 상태 전환
    //--------------------------------------------------------------------------
    always @(posedge spi_sck or negedge axi_aresetn or posedge spi_cs_n) begin
        if (!axi_aresetn || spi_cs_n) begin
            spi_slave_state <= SPI_SLAVE_S_IDLE;
            addr_bit_cnt <= 0;
            tx_bit_cnt <= 4'd0;
        end else begin
            case (spi_slave_state)
                SPI_SLAVE_S_IDLE: begin
                    spi_slave_state <= SPI_SLAVE_S_RECV_ADDR;
                    addr_bit_cnt <= 4'd1;
                end
                
                SPI_SLAVE_S_RECV_ADDR: begin
                    if (addr_bit_cnt < 4'd7) begin
                        addr_bit_cnt <= addr_bit_cnt + 1;
                    end else begin
                        // 8비트 수신 완료
                        addr_bit_cnt <= 4'd0;
                        if (spi_slave_is_read_op) begin
                            spi_slave_state <= SPI_SLAVE_S_SEND_DATA;  // Read: 데이터 송신 상태로
                            tx_bit_cnt <= 4'd0;  // 비트 카운터 리셋
                        end else begin
                            spi_slave_state <= SPI_SLAVE_S_RECV_DATA;  // Write: 데이터 수신 상태로
                        end
                    end
                end
                
                SPI_SLAVE_S_SEND_DATA: begin
                    // Read 동작: 데이터 송신 중 (MISO는 negedge에서 구동)
                    if (tx_bit_cnt >= 4'd7) begin
                        // 8비트 송신 완료
                        spi_slave_state <= SPI_SLAVE_S_IDLE;
                        tx_bit_cnt <= 4'd0;
                    end else begin
                        tx_bit_cnt <= tx_bit_cnt + 1;
                    end
                end
                
                SPI_SLAVE_S_RECV_DATA: begin
                    // Write 동작: 데이터 수신 중
                    // (추가 로직 필요 시 여기에 구현)
                    spi_slave_state <= SPI_SLAVE_S_IDLE;
                end
                
                default: begin
                    spi_slave_state <= SPI_SLAVE_S_IDLE;
                end
            endcase
        end
    end
    




    // RECV_ADDR 상태에서 데이터 준비 (Read 동작 시)
    always @(posedge spi_sck) begin
        if (spi_slave_state == SPI_SLAVE_S_RECV_ADDR && addr_bit_cnt == 7 && spi_slave_is_read_op) begin
            // 주소 수신 완료 직후 송신할 데이터 준비
            spi_slave_shift_reg_tx <= SPI_SLAVE_TEST_DATA;  // 0xA5
            tx_bit_cnt <= 4'd0;  // 비트 카운터 초기화
        end
    end


    //--------------------------------------------------------------------------
    // MISO 신호 변화 모니터링 (waveform 검증용)
    //--------------------------------------------------------------------------
    reg spi_miso_prev;
    reg [31:0] miso_transition_count;
    reg spi_sck_prev;
    
    // MISO 변화를 SCK와 함께 모니터링
    always @(posedge axi_aclk) begin
        if (~axi_aresetn) begin
            spi_miso_prev <= 1'b0;
            spi_sck_prev <= 1'b0;
            miso_transition_count <= 0;
        end else begin
            spi_sck_prev <= spi_sck;
            
            // MISO 변화 감지 (출력 제거 - 성능 향상)
            if (spi_miso != spi_miso_prev) begin
                miso_transition_count <= miso_transition_count + 1;
            end
            
            spi_miso_prev <= spi_miso;
        end
    end
    // MISO_DRIVER 모니터링 (디버그 출력 최소화)
    // always @(miso_driver) begin
    //     $display("[%0t] *** MISO_DRIVER Changed: %b ***", $time, miso_driver);
    // end
    //--------------------------------------------------------------------------
    // Waveform dump (SPI 내부 신호 포함)
    //--------------------------------------------------------------------------
    initial begin
       $dumpfile("wave_bfm_fixed.vcd");
       // 전체 모듈 dump (depth 0 = 모든 신호)
       $dumpvars(0, top_bfm);
       // SPI AXI Controller의 모든 하위 신호 dump (depth 1)
       $dumpvars(1, u_spi_axi);
       // SPI Master의 모든 하위 신호 dump (depth 2)
       $dumpvars(2, u_spi_axi.u_spi_master);
    end
    
    //--------------------------------------------------------------------------
    // SPI Transaction Monitoring (Auto-Finish 제거)
    //--------------------------------------------------------------------------
    // Auto-Finish 로직을 제거하고, initial 블록에서 모든 테스트 완료 후 종료
    reg [31:0] transaction_count;
    reg spi_cs_n_prev;
    
    // CS_N edge detection for transaction counting (모니터링만, 종료하지 않음)
    always @(posedge axi_aclk) begin
        if (~axi_aresetn) begin
            spi_cs_n_prev <= 1'b1;
            transaction_count <= 32'b0;
        end else begin
            spi_cs_n_prev <= spi_cs_n;
            
            // CS_N rising edge: transaction 완료 (출력 제거 - 성능 향상)
            if (spi_cs_n_prev == 1'b0 && spi_cs_n == 1'b1) begin
                transaction_count <= transaction_count + 1;
                // $display("[%0t] SPI Transaction completed. Count: %0d", $time, transaction_count);
            end
        end
    end
    
    //--------------------------------------------------------------------------
    // C 코드에서 테스트 실행을 대기
    //--------------------------------------------------------------------------
    // C 코드의 bfm_write/bfm_read가 BFM을 통해 AXI 트랜잭션을 수행합니다.
    // Verilog 쪽에서는 대기만 하면 됩니다.
    initial begin
        // Reset 해제 대기
        wait(axi_aresetn == 1'b1);
        #(100 * ACLK_HALF * 2);  // 100 clock cycles delay
        
        $display("[%0t] ========================================", $time);
        $display("[%0t] SPI AXI Cosimulation Testbench Ready", $time);
        $display("[%0t] Waiting for C code to execute tests...", $time);
        $display("[%0t] ========================================", $time);
        
        // C 코드가 완료될 때까지 대기 (절대 타임아웃)
        #100000000;  // 100ms timeout
        
        $display("[%0t] ========================================", $time);
        $display("[%0t] Total SPI transactions: %0d", $time, transaction_count);
        $display("[%0t] Simulation finished", $time);
        $display("[%0t] ========================================", $time);
    end
        // 상태 전환 모니터링 (디버그 출력 최소화)
    // always @(spi_slave_state) begin
    //     case (spi_slave_state)
    //         2'b00: $display("[%0t] *** State: IDLE ***", $time);
    //         2'b01: $display("[%0t] *** State: RECV_ADDR ***", $time);
    //         2'b10: $display("[%0t] *** State: SEND_DATA ***", $time);
    //         2'b11: $display("[%0t] *** State: RECV_DATA ***", $time);
    //     endcase
    // end

    // 주소 수신 완료 감지 (디버그 출력 최소화)
    // always @(addr_bit_cnt) begin
    //     if (addr_bit_cnt == 7) begin
    //         $display("[%0t] Address RX complete! is_read=%b", 
    //                 $time, spi_slave_is_read_op);
    //     end
    // end
    // Absolute timeout (안전장치)
    initial begin
        #100000000;  // 100ms absolute timeout
        $display("[%0t] WARNING: Absolute timeout reached. Forcing finish.", $time);
        $display("[%0t] Transaction count: %0d", $time, transaction_count);
        $finish(1);
    end

endmodule