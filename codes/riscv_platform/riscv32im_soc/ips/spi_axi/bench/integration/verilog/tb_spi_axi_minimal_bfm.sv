`timescale 1ns/1ps

//------------------------------------------------------------------------------
// 최소 동작 테스트 TB
// - clk/reset 생성
// - CS, SCLK, MOSI 시퀀스(MFRC522 read/write) 자동 생성
// - MISO 캡처
// - AXI-BFM read/write 함수 호출 포함
//------------------------------------------------------------------------------
module tb_spi_axi_minimal_bfm;

    //--------------------------------------------------------------------------
    // 1. Clock & Reset Generation
    //--------------------------------------------------------------------------
    reg axi_aclk = 0;
    reg axi_aresetn = 0;
    
    always #5 axi_aclk = ~axi_aclk; // 100MHz

    initial begin
        #100 axi_aresetn = 1;
        $display("[%0t] Reset released", $time);
    end

    //--------------------------------------------------------------------------
    // 2. AXI Interface Signals
    //--------------------------------------------------------------------------
    reg  [3:0]  m_axi_awid;
    reg  [31:0] m_axi_awaddr;
    reg  [7:0]  m_axi_awlen;
    reg  [2:0]  m_axi_awsize;
    reg  [1:0]  m_axi_awburst;
    reg         m_axi_awvalid;
    wire        m_axi_awready;
    
    reg  [31:0] m_axi_wdata;
    reg  [3:0]  m_axi_wstrb;
    reg         m_axi_wlast;
    reg         m_axi_wvalid;
    wire        m_axi_wready;
    
    wire [3:0]  m_axi_bid;
    wire [1:0]  m_axi_bresp;
    wire        m_axi_bvalid;
    reg         m_axi_bready;
    
    reg  [3:0]  m_axi_arid;
    reg  [31:0] m_axi_araddr;
    reg  [7:0]  m_axi_arlen;
    reg  [2:0]  m_axi_arsize;
    reg  [1:0]  m_axi_arburst;
    reg         m_axi_arvalid;
    wire        m_axi_arready;
    
    wire [3:0]  m_axi_rid;
    wire [31:0] m_axi_rdata;
    wire [1:0]  m_axi_rresp;
    wire        m_axi_rlast;
    wire        m_axi_rvalid;
    reg         m_axi_rready;

    //--------------------------------------------------------------------------
    // 3. SPI Interface Signals
    //--------------------------------------------------------------------------
    wire spi_cs_n;
    wire spi_sck;
    wire spi_mosi;
    wire spi_miso;

    //--------------------------------------------------------------------------
    // 4. Instantiate DUT (SPI AXI Controller)
    //--------------------------------------------------------------------------
    spi_axi_controller #(
        .AXI_WIDTH_ID(4), .AXI_WIDTH_ADDR(32), .AXI_WIDTH_DATA(32)
    ) u_dut (
        .axi_aresetn(axi_aresetn),
        .axi_aclk(axi_aclk),
        .s_axi_awid(m_axi_awid), .s_axi_awaddr(m_axi_awaddr),
        .s_axi_awlen(m_axi_awlen), .s_axi_awsize(m_axi_awsize),
        .s_axi_awburst(m_axi_awburst), .s_axi_awvalid(m_axi_awvalid),
        .s_axi_awready(m_axi_awready),
        .s_axi_wdata(m_axi_wdata), .s_axi_wstrb(m_axi_wstrb),
        .s_axi_wlast(m_axi_wlast), .s_axi_wvalid(m_axi_wvalid),
        .s_axi_wready(m_axi_wready),
        .s_axi_bid(m_axi_bid), .s_axi_bresp(m_axi_bresp),
        .s_axi_bvalid(m_axi_bvalid), .s_axi_bready(m_axi_bready),
        .s_axi_arid(m_axi_arid), .s_axi_araddr(m_axi_araddr),
        .s_axi_arlen(m_axi_arlen), .s_axi_arsize(m_axi_arsize),
        .s_axi_arburst(m_axi_arburst), .s_axi_arvalid(m_axi_arvalid),
        .s_axi_arready(m_axi_arready),
        .s_axi_rid(m_axi_rid), .s_axi_rdata(m_axi_rdata),
        .s_axi_rresp(m_axi_rresp), .s_axi_rlast(m_axi_rlast),
        .s_axi_rvalid(m_axi_rvalid), .s_axi_rready(m_axi_rready),
        .spi_cs_n(spi_cs_n), .spi_sck(spi_sck),
        .spi_mosi(spi_mosi), .spi_miso(spi_miso)
    );

    //--------------------------------------------------------------------------
    // 5. Instantiate SPI Slave (MFRC522 Model)
    //--------------------------------------------------------------------------
    mfrc522_model u_slave (
        .clk(axi_aclk), .rst(!axi_aresetn),
        .cs_n(spi_cs_n), .sck(spi_sck),
        .mosi(spi_mosi), .miso(spi_miso)
    );

    //--------------------------------------------------------------------------
    // 6. SPI Signal Monitoring
    //--------------------------------------------------------------------------
    reg [7:0] miso_capture;
    reg [2:0] miso_bit_count;
    reg miso_capturing;
    
    always @(posedge axi_aclk) begin
        if (!axi_aresetn) begin
            miso_capture <= 8'h0;
            miso_bit_count <= 3'b0;
            miso_capturing <= 1'b0;
        end else begin
            if (!spi_cs_n && spi_sck) begin
                // CS active and SCK high: capture MISO on rising edge
                if (!miso_capturing) begin
                    miso_capturing <= 1'b1;
                    miso_bit_count <= 3'b0;
                    miso_capture <= 8'h0;
                end
                if (miso_capturing && miso_bit_count < 8) begin
                    miso_capture <= {miso_capture[6:0], spi_miso};
                    miso_bit_count <= miso_bit_count + 1;
                end
            end else if (spi_cs_n) begin
                miso_capturing <= 1'b0;
                miso_bit_count <= 3'b0;
            end
        end
    end

    //--------------------------------------------------------------------------
    // 7. Include BFM Tasks
    //--------------------------------------------------------------------------
    wire aclk = axi_aclk;
    `include "tasks_axi_full.sv"
    `include "tasks_spi_axi.sv"

    //--------------------------------------------------------------------------
    // 8. Test Sequence
    //--------------------------------------------------------------------------
    reg [7:0] read_val;
    integer test_pass;
    integer test_fail;

    initial begin
        // Initialize AXI signals
        m_axi_awid = 0; m_axi_awaddr = 0; m_axi_awlen = 0; m_axi_awsize = 0; m_axi_awburst = 0;
        m_axi_awvalid = 0; m_axi_wdata = 0; m_axi_wstrb = 0; m_axi_wlast = 0; m_axi_wvalid = 0;
        m_axi_bready = 0; m_axi_arid = 0; m_axi_araddr = 0; m_axi_arlen = 0; m_axi_arsize = 0;
        m_axi_arburst = 0; m_axi_arvalid = 0; m_axi_rready = 0;
        
        test_pass = 0;
        test_fail = 0;
        
        // Wait for Reset
        wait(axi_aresetn);
        #200;

        $display("========================================");
        $display("=== [TB] Starting MFRC522 SPI Test ===");
        $display("========================================");

        // Test 1: Write to FIFO (Reg 0x09)
        $display("\n=== [TB] Test 1: Write FIFO (0x09) <= 0xAB ===");
        mfrc522_write(MFRC522_REG_FIFO_DATA, 8'hAB);
        #1000;
        if (miso_capturing == 0 && miso_bit_count == 0) begin
            $display("[TB] MISO capture: Not capturing (Write operation)");
        end

        // Test 2: Read back from FIFO (Reg 0x09)
        $display("\n=== [TB] Test 2: Read FIFO (0x09) ===");
        mfrc522_read(MFRC522_REG_FIFO_DATA, read_val);
        $display("=== [TB] Read Result: 0x%02X (Expected: 0xAB) ===", read_val);
        if (read_val == 8'hAB) begin
            $display("=== [TB] PASS: Data Match ===");
            test_pass = test_pass + 1;
        end else begin
            $display("=== [TB] FAIL: Data Mismatch ===");
            test_fail = test_fail + 1;
        end

        // Test 3: Read Version (Reg 0x37)
        $display("\n=== [TB] Test 3: Read Version (0x37) ===");
        mfrc522_read(MFRC522_REG_VERSION, read_val);
        $display("=== [TB] Version: 0x%02X (Expected: 0x91 or 0x92) ===", read_val);
        if (read_val == 8'h91 || read_val == 8'h92) begin
            $display("=== [TB] PASS: Version Match ===");
            test_pass = test_pass + 1;
        end else begin
            $display("=== [TB] FAIL: Invalid Version ===");
            test_fail = test_fail + 1;
        end

        // Test 4: Write Command (Reg 0x01)
        $display("\n=== [TB] Test 4: Write Command (0x01) <= 0x0F (Soft Reset) ===");
        mfrc522_write(MFRC522_REG_COMMAND, 8'h0F);
        #1000;

        // Test Summary
        $display("\n========================================");
        $display("=== [TB] Test Summary ===");
        $display("========================================");
        $display("PASS: %0d", test_pass);
        $display("FAIL: %0d", test_fail);
        $display("========================================");

        #1000;
        $finish;
    end

endmodule

