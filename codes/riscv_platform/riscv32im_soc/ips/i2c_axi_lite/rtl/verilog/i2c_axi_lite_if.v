//------------------------------------------------------------------------------
//  I2C AXI4-Lite Interface Module
//  AT24C02 EEPROM 통신을 위한 AXI4-Lite 슬레이브 인터페이스
//------------------------------------------------------------------------------
// VERSION: 2025.10.29
//------------------------------------------------------------------------------
// 레지스터 맵:
//   0x00: CONTROL_REG   - [0]: START, [1]: R/W (0=Write, 1=Read), [7:4]: STATUS
//   0x04: DEV_ADDR_REG  - [7:0]: Device Address (AT24C02 = 0x50)
//   0x08: MEM_ADDR_REG  - [7:0]: Memory Address (0x00-0xFF)
//   0x0C: WR_DATA_REG   - [7:0]: Write Data
//   0x10: RD_DATA_REG   - [7:0]: Read Data (읽기 전용)
//   0x14: STATUS_REG    - [0]: BUSY, [1]: ERROR
//------------------------------------------------------------------------------

module i2c_axi_lite_if
(
    // AXI4-Lite 인터페이스
    input  wire        s_axi_aresetn,
    input  wire        s_axi_aclk,
    
    input  wire [31:0] s_axi_awaddr,
    input  wire        s_axi_awvalid,
    output reg         s_axi_awready,
    
    input  wire [31:0] s_axi_wdata,
    input  wire        s_axi_wvalid,
    output reg         s_axi_wready,
    
    output reg  [ 1:0] s_axi_bresp,
    output reg         s_axi_bvalid,
    input  wire        s_axi_bready,
    
    input  wire [31:0] s_axi_araddr,
    input  wire        s_axi_arvalid,
    output reg         s_axi_arready,
    
    output reg  [31:0] s_axi_rdata,
    output reg  [ 1:0] s_axi_rresp,
    output reg         s_axi_rvalid,
    input  wire        s_axi_rready,
    
        // I2C 마스터 인터페이스 (i2c_master.v 변경사항 반영)
        output wire [31:0] i2c_ctrl,       // Control/Address data (변경: i2c_data0 -> i2c_ctrl)
        output wire [31:0] wdata,          // Write data (변경: i2c_data1 -> wdata)
        input  wire [31:0] rdata,          // Read data (변경: i2c_data2 -> rdata, output으로 변경됨)
        output reg         i2c_start,      // START 펄스 (사용 안함, 레벨 신호로 대체)
        input  wire        i2c_busy,       // BUSY 신호 (I2C 트랜잭션 진행 중)
        input  wire        i2c_master_idle // I2C Master가 idle 상태인지 (트랜잭션 완료 감지용)
    );
    
    //--------------------------------------------------------------------------
    // 레지스터 정의
    //--------------------------------------------------------------------------
    localparam ADDR_CONTROL  = 5'h00;
    localparam ADDR_DEV_ADDR = 5'h04;
    localparam ADDR_MEM_ADDR = 5'h08;
    localparam ADDR_WR_DATA  = 5'h0C;
    localparam ADDR_RD_DATA  = 5'h10;
    localparam ADDR_STATUS   = 5'h14;
    
    reg [31:0] control_reg;    // [0]: start, [1]: r/w, [2]: random_read
    reg [31:0] dev_addr_reg;   // Device address
    reg [31:0] mem_addr_reg;   // Memory address
    reg [31:0] wr_data_reg;    // Write data
    reg [31:0] rd_data_reg;    // Read data
    
    // I2C Master가 트랜잭션을 완료하면 control_reg[0]을 자동으로 클리어
    reg i2c_master_idle_prev;
    reg control_reg_0_set;
    wire control_reg_0_clear;
    
    always @(posedge s_axi_aclk or negedge s_axi_aresetn) begin
        if (!s_axi_aresetn) begin
            i2c_master_idle_prev <= 1'b1;  // 초기값: idle 상태
            control_reg_0_set <= 1'b0;
        end
        else begin
            i2c_master_idle_prev <= i2c_master_idle;
            
            // control_reg[0]이 설정되었는지 추적
            if (control_reg[0] && !control_reg_0_set) begin
                control_reg_0_set <= 1'b1;
            end
        end
    end
    
    // control_reg[0]이 설정된 후, I2C Master가 idle 상태로 돌아오면 클리어
    // i2c_master_idle이 0에서 1로 rising edge가 발생하고, control_reg[0]이 설정되어 있으면 클리어
    assign control_reg_0_clear = control_reg_0_set && i2c_master_idle && !i2c_master_idle_prev;
    
    //--------------------------------------------------------------------------
    // AXI4-Lite Write State Machine
    //--------------------------------------------------------------------------
    localparam STW_IDLE   = 2'h0,
               STW_WRITE  = 2'h1,
               STW_RESP   = 2'h2;
    
    reg [1:0] write_state;
    reg [31:0] write_addr;
    
    always @(posedge s_axi_aclk or negedge s_axi_aresetn) begin
        if (!s_axi_aresetn) begin
            s_axi_awready <= 1'b0;
            s_axi_wready  <= 1'b0;
            s_axi_bresp   <= 2'b00;
            s_axi_bvalid  <= 1'b0;
            write_addr    <= 32'h0;
            write_state   <= STW_IDLE;
            
            control_reg   <= 32'h0;
            dev_addr_reg  <= 32'h50;  // AT24C02 기본 주소
            mem_addr_reg  <= 32'h0;
            wr_data_reg   <= 32'h0;
            i2c_start     <= 1'b0;
        end
        else begin
            // control_reg[0] 자동 클리어 (I2C Master가 트랜잭션을 완료하면)
            // control_reg[2] (Random Read)는 유지해야 함
            if (control_reg_0_clear) begin
                control_reg[0] <= 1'b0;  // START 비트만 클리어 (다른 비트는 유지)
                control_reg_0_set <= 1'b0;  // 플래그 클리어
            end
            
            case (write_state)
                STW_IDLE: begin
                    s_axi_awready <= 1'b1;
                    s_axi_wready  <= 1'b0;
                    s_axi_bvalid  <= 1'b0;
                    i2c_start     <= 1'b0;
                    
                    if (s_axi_awvalid && s_axi_awready) begin
                        write_addr    <= s_axi_awaddr;
                        s_axi_awready <= 1'b0;
                        s_axi_wready  <= 1'b1;
                        write_state   <= STW_WRITE;
                    end
                end
                
                STW_WRITE: begin
                    if (s_axi_wvalid && s_axi_wready) begin
                        s_axi_wready <= 1'b0;
                        s_axi_bresp  <= 2'b00; // OKAY
                        
                        // 레지스터 쓰기
                        case (write_addr[6:2])
                            5'h00: begin  // ADDR_CONTROL
                                control_reg <= s_axi_wdata;
                                if (s_axi_wdata[0]) begin // START 비트
                                    i2c_start <= 1'b1;
                                    control_reg_0_set <= 1'b1;  // control_reg[0]이 설정되었음을 표시
                                end
                            end
                            5'h01: dev_addr_reg <= s_axi_wdata;  // ADDR_DEV_ADDR
                            5'h02: mem_addr_reg <= s_axi_wdata;  // ADDR_MEM_ADDR
                            5'h03: wr_data_reg  <= s_axi_wdata;  // ADDR_WR_DATA
                            default: s_axi_bresp <= 2'b10; // SLVERR
                        endcase
                        
                        s_axi_bvalid <= 1'b1;
                        write_state  <= STW_RESP;
                    end
                end
                
                STW_RESP: begin
                    i2c_start <= 1'b0;
                    if (s_axi_bready && s_axi_bvalid) begin
                        s_axi_bvalid <= 1'b0;
                        write_state  <= STW_IDLE;
                    end
                end
                
                default: write_state <= STW_IDLE;
            endcase
        end
    end
    
    //--------------------------------------------------------------------------
    // AXI4-Lite Read State Machine
    //--------------------------------------------------------------------------
    localparam STR_IDLE  = 2'h0,
               STR_READ  = 2'h1,
               STR_RESP  = 2'h2;
    
    reg [1:0] read_state;
    reg [31:0] read_addr;
    
    always @(posedge s_axi_aclk or negedge s_axi_aresetn) begin
        if (!s_axi_aresetn) begin
            s_axi_arready <= 1'b0;
            s_axi_rdata   <= 32'h0;
            s_axi_rresp   <= 2'b00;
            s_axi_rvalid  <= 1'b0;
            read_addr     <= 32'h0;
            read_state    <= STR_IDLE;
            rd_data_reg   <= 32'h0;
        end
        else begin
            case (read_state)
                STR_IDLE: begin
                    s_axi_arready <= 1'b1;
                    s_axi_rvalid  <= 1'b0;
                    
                    if (s_axi_arvalid && s_axi_arready) begin
                        read_addr     <= s_axi_araddr;
                        s_axi_arready <= 1'b0;
                        read_state    <= STR_READ;
                    end
                end
                
                STR_READ: begin
                    s_axi_rresp <= 2'b00; // OKAY
                    
                    // I2C에서 읽은 데이터 업데이트 (변경: i2c_data2 -> rdata)
                    rd_data_reg <= rdata;
                    
                    // 레지스터 읽기
                    case (read_addr[6:2])
                        5'h00: s_axi_rdata <= control_reg;    // ADDR_CONTROL
                        5'h01: s_axi_rdata <= dev_addr_reg;   // ADDR_DEV_ADDR
                        5'h02: s_axi_rdata <= mem_addr_reg;   // ADDR_MEM_ADDR
                        5'h03: s_axi_rdata <= wr_data_reg;    // ADDR_WR_DATA
                        5'h04: s_axi_rdata <= rd_data_reg;    // ADDR_RD_DATA
                        5'h05: s_axi_rdata <= {30'h0, 1'b0, i2c_busy}; // ADDR_STATUS
                        default: begin
                            s_axi_rdata <= 32'h0;
                            s_axi_rresp <= 2'b10; // SLVERR
                        end
                    endcase
                    
                    s_axi_rvalid <= 1'b1;
                    read_state   <= STR_RESP;
                end
                
                STR_RESP: begin
                    if (s_axi_rready && s_axi_rvalid) begin
                        s_axi_rvalid <= 1'b0;
                        read_state   <= STR_IDLE;
                    end
                end
                
                default: read_state <= STR_IDLE;
            endcase
        end
    end
    
    //--------------------------------------------------------------------------
    // I2C 마스터 데이터 인터페이스
    //--------------------------------------------------------------------------
    // i2c_ctrl 포맷 (i2c_master.v 변경사항 반영):
    // [31]    - START trigger (외부에서 START 제어, 변경됨)
    // [17]    - Page Mode (1=Page, 0=Byte)
    // [16]    - Random Read (1=Random, 0=Current)
    // [15:8]  - Memory Address
    // [7:0]   - Device Address with R/W bit
    
    wire [7:0] i2c_dev_addr;
    // Random Read 모드(control_reg[2]=1)일 때는 첫 번째 트랜잭션이 Write 모드(R/W=0)여야 함
    // 따라서 Random Read일 때는 R/W 비트를 0 (Write)으로 강제
    // 두 번째 트랜잭션(Repeated START 후)에서는 Read 모드(R/W=1)로 변경됨
    assign i2c_dev_addr = (control_reg[2] == 1'b1) ? 
                          {dev_addr_reg[7:1], 1'b0} :  // Random Read: 첫 번째 트랜잭션은 Write (R/W=0)
                          (control_reg[1] ? 
                           {dev_addr_reg[7:1], 1'b1} :  // Read
                           {dev_addr_reg[7:1], 1'b0});  // Write
    
    // i2c_ctrl 포맷 (i2c_master_ver2.v에 맞춤):
    // [31]    - START trigger (레벨 신호: 1이면 START 조건 시작)
    // [30:18] - Reserved
    // [17]    - Page mode (현재 0으로 고정, byte mode)
    // [16]    - Random read (1=Random Read, 0=Sequential Read)
    // [15:8]  - Memory address (mem_addr_reg[7:0])
    // [7:0]   - Device address with R/W bit (i2c_dev_addr)
    assign i2c_ctrl = {control_reg[0],      // [31] START trigger (레벨 신호)
                       13'h0,                // [30:18] Reserved
                       1'b0,                 // [17] Page mode (byte mode)
                       control_reg[2],       // [16] Random read (1=Random, 0=Sequential)
                       mem_addr_reg[7:0],    // [15:8] Memory address
                       i2c_dev_addr};        // [7:0] Device address with R/W
    
    assign wdata = {24'h0, wr_data_reg[7:0]};

endmodule

