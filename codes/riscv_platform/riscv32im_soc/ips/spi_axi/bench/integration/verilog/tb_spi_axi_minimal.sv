`timescale 1ns/1ps

module tb_spi_axi_minimal;

    //--------------------------------------------------------------------------
    // 1. Clock & Reset Generation
    //--------------------------------------------------------------------------
    reg axi_aclk = 0;
    reg axi_aresetn = 0;
    
    always #5 axi_aclk = ~axi_aclk; // 100MHz

    initial begin
        #100 axi_aresetn = 1;
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
    // 6. Include BFM Tasks
    //--------------------------------------------------------------------------
    `include "tasks_axi_full.sv"
    `include "tasks_spi_axi.sv"

    //--------------------------------------------------------------------------
    // 7. Test Sequence
    //--------------------------------------------------------------------------
    reg [7:0] read_val;

    initial begin
        // Initialize AXI signals
        m_axi_awid = 0; m_axi_awaddr = 0; m_axi_awlen = 0; m_axi_awsize = 0; m_axi_awburst = 0;
        m_axi_awvalid = 0; m_axi_wdata = 0; m_axi_wstrb = 0; m_axi_wlast = 0; m_axi_wvalid = 0;
        m_axi_bready = 0; m_axi_arid = 0; m_axi_araddr = 0; m_axi_arlen = 0; m_axi_arsize = 0;
        m_axi_arburst = 0; m_axi_arvalid = 0; m_axi_rready = 0;
        
        // Wait for Reset
        wait(axi_aresetn);
        #200;

        $display("=== [TB] Starting MFRC522 SPI Test ===");

        // 1. Initialize MFRC522 (Soft Reset)
        $display("=== [TB] 1. MFRC522 Soft Reset ===");
        mfrc522_init(); 

        // 2. Check Version (Read 0x37)
        $display("=== [TB] 2. Check Version ===");
        mfrc522_check_version();

        // 3. Write to FIFO (Reg 0x09)
        $display("=== [TB] 3. Write FIFO (0x09) <= 0xAB ===");
        mfrc522_write(MFRC522_REG_FIFO_DATA, 8'hAB);

        // 4. Read back from FIFO (Reg 0x09)
        $display("=== [TB] 4. Read FIFO (0x09) ===");
        mfrc522_read(MFRC522_REG_FIFO_DATA, read_val);
        $display("=== [TB] Read Result: 0x%02X ===", read_val);

        if (read_val == 8'hAB) $display("=== [TB] SUCCESS: Data Match ===");
        else                   $display("=== [TB] FAIL: Data Mismatch ===");

        #1000;
        $finish;
    end

endmodule
