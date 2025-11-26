//------------------------------------------------------------------------------
// top_bfm.sv - SPI AXI Controller Cosimulation Testbench (정리된 버전)
//------------------------------------------------------------------------------
// C 코드와 통신하기 위한 BFM을 사용하는 버전
// - cosim_bfm_axi_full 모듈을 통해 C 코드의 bfm_write/bfm_read와 통신
// - mfrc522_dummy.v 모듈을 사용하여 MFRC522 SPI 프로토콜 구현
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
    // SPI AXI Controller Instance
    //--------------------------------------------------------------------------
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
    
    //--------------------------------------------------------------------------
    // MFRC522 Dummy Model 인스턴스 (MFRC522 SPI 프로토콜 구현)
    //--------------------------------------------------------------------------
    mfrc522_dummy u_mfrc522_dummy (
          .axi_aclk    ( axi_aclk     )
        , .axi_aresetn ( axi_aresetn  )
        , .spi_cs_n    ( spi_cs_n     )
        , .spi_sck     ( spi_sck      )
        , .spi_mosi    ( spi_mosi     )
        , .spi_miso    ( spi_miso     )
    );

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
    // SPI Transaction Monitoring
    //--------------------------------------------------------------------------
    reg [31:0] transaction_count;
    reg spi_cs_n_prev;
    
    // CS_N edge detection for transaction counting
    always @(posedge axi_aclk) begin
        if (~axi_aresetn) begin
            spi_cs_n_prev <= 1'b1;
            transaction_count <= 32'b0;
        end else begin
            spi_cs_n_prev <= spi_cs_n;
            
            // CS_N rising edge: transaction 완료
            if (spi_cs_n_prev == 1'b0 && spi_cs_n == 1'b1) begin
                transaction_count <= transaction_count + 1;
            end
        end
    end
    
    //--------------------------------------------------------------------------
    // C 코드에서 테스트 실행을 대기
    //--------------------------------------------------------------------------
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
    
    // Absolute timeout (안전장치)
    initial begin
        #100000000;  // 100ms absolute timeout
        $display("[%0t] WARNING: Absolute timeout reached. Forcing finish.", $time);
        $display("[%0t] Transaction count: %0d", $time, transaction_count);
        $finish(1);
    end

endmodule

