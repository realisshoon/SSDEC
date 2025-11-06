//------------------------------------------------------------------------------
//  I2C AXI4-Lite Top Module
//  AT24C02 EEPROM 통신을 위한 완전한 I2C 마스터 + AXI4-Lite 인터페이스
//------------------------------------------------------------------------------
// VERSION: 2025.10.29
//------------------------------------------------------------------------------
`include "i2c_axi_lite_if.v"
`include "i2c_master.v"

module i2c_axi_lite
    #(parameter Hz_counter = 120)  // 400kHz I2C clock @ 100MHz system clock
(
    // Reset and Clock
    (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *)
    input  wire          aresetn,
    
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF s_axi_lite, ASSOCIATED_RESET aresetn" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *)
    input  wire          aclk,

    // AXI4-Lite Slave Interface
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite AWADDR" *)
    input  wire [31:0]   s_axi_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite AWVALID" *)
    input  wire          s_axi_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite AWREADY" *)
    output wire          s_axi_awready,
    
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite WDATA" *)
    input  wire [31:0]   s_axi_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite WVALID" *)
    input  wire          s_axi_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite WREADY" *)
    output wire          s_axi_wready,
    
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite BRESP" *)
    output wire [ 1:0]   s_axi_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite BVALID" *)
    output wire          s_axi_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite BREADY" *)
    input  wire          s_axi_bready,
    
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite ARADDR" *)
    input  wire [31:0]   s_axi_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite ARVALID" *)
    input  wire          s_axi_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite ARREADY" *)
    output wire          s_axi_arready,
    
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite RDATA" *)
    output wire [31:0]   s_axi_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite RRESP" *)
    output wire [ 1:0]   s_axi_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite RVALID" *)
    output wire          s_axi_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite RREADY" *)
    input  wire          s_axi_rready,
    
    // I2C Physical Interface
    // IP Packager가 자동으로 IOBUF를 생성하므로, inout 대신 분리된 포트 사용
    input  wire          i2c_sda_i,  // Input from pad (IOBUF의 O)
    output wire          i2c_sda_o,  // Output to pad (IOBUF의 I)
    output wire          i2c_sda_t,  // Tri-state enable (IOBUF의 T)
    output wire          i2c_scl
);

    //--------------------------------------------------------------------------
    // Internal Signals
    //--------------------------------------------------------------------------
    // [수정] i2c_master.v 인터페이스 변경에 따른 신호명 업데이트
    // data0 -> i2c_ctrl, data1 -> wdata, data2 -> rdata (output)
    wire [31:0] i2c_ctrl;     // i2c_master로 전달할 제어/주소 데이터
    wire [31:0] wdata;        // i2c_master로 전달할 쓰기 데이터
    wire [31:0] rdata;        // i2c_master에서 받는 읽기 데이터 (output)
    wire        i2c_start;
    wire        i2c_busy;
    
    // IOBUF signals are now external ports (IP Packager가 자동으로 IOBUF 생성)
    
    //--------------------------------------------------------------------------
    // AXI4-Lite Interface Module
    //--------------------------------------------------------------------------
    i2c_axi_lite_if u_i2c_axi_lite_if (
        // AXI4-Lite Interface
        .s_axi_aresetn  (aresetn),
        .s_axi_aclk     (aclk),
        .s_axi_awaddr   (s_axi_awaddr),
        .s_axi_awvalid  (s_axi_awvalid),
        .s_axi_awready  (s_axi_awready),
        .s_axi_wdata    (s_axi_wdata),
        .s_axi_wvalid   (s_axi_wvalid),
        .s_axi_wready   (s_axi_wready),
        .s_axi_bresp    (s_axi_bresp),
        .s_axi_bvalid   (s_axi_bvalid),
        .s_axi_bready   (s_axi_bready),
        .s_axi_araddr   (s_axi_araddr),
        .s_axi_arvalid  (s_axi_arvalid),
        .s_axi_arready  (s_axi_arready),
        .s_axi_rdata    (s_axi_rdata),
        .s_axi_rresp    (s_axi_rresp),
        .s_axi_rvalid   (s_axi_rvalid),
        .s_axi_rready   (s_axi_rready),
        
        // I2C Master Interface
        .i2c_ctrl       (i2c_ctrl),    // 변경: i2c_data0 -> i2c_ctrl
        .wdata          (wdata),        // 변경: i2c_data1 -> wdata
        .rdata          (rdata),        // 변경: i2c_data2 -> rdata (output)
        .i2c_start      (i2c_start),
        .i2c_busy       (i2c_busy)
    );
    
    //--------------------------------------------------------------------------
    // I2C Master Module
    //--------------------------------------------------------------------------
    // BUSY signal generation (간단한 구현)
    reg i2c_busy_reg;
    reg [7:0] busy_counter;
    
    always @(posedge aclk or negedge aresetn) begin
        if (!aresetn) begin
            i2c_busy_reg <= 1'b0;
            busy_counter <= 8'h0;
        end
        else begin
            if (i2c_start && !i2c_busy_reg) begin
                i2c_busy_reg <= 1'b1;
                busy_counter <= 8'd100; // 타이밍 조정 필요
            end
            else if (i2c_busy_reg) begin
                if (busy_counter > 0) begin
                    busy_counter <= busy_counter - 1;
                end
                else begin
                    i2c_busy_reg <= 1'b0;
                end
            end
        end
    end
    
    assign i2c_busy = i2c_busy_reg;
    
    //--------------------------------------------------------------------------
    // I2C Master Module
    // Note: IOBUF는 IP Packager가 자동으로 생성하므로, 내부 IOBUF는 제거
    //--------------------------------------------------------------------------
    I2C #(
        .Hz_counter(Hz_counter)
    ) u_i2c_master (
        .clk        (aclk),
        .n_rst      (aresetn),
        .i2c_ctrl   (i2c_ctrl),   // 변경: data0 -> i2c_ctrl
        .wdata      (wdata),      // 변경: data1 -> wdata
        .rdata      (rdata),      // 변경: data2 -> rdata (output)
        .sda_i      (i2c_sda_i),  // Input from pad
        .sda_o      (i2c_sda_o),  // Output to pad (always 0)
        .sda_t      (i2c_sda_t),  // Tri-state enable
        .scl        (i2c_scl)
    );

endmodule

