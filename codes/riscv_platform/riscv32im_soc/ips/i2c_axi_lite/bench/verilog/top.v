`timescale 1ns/1ps
`default_nettype none

module top;
    //-------------------------------------------------------------------------
    // Clock & Reset
    //-------------------------------------------------------------------------
    reg aclk;
    reg aresetn;

    initial begin
        aclk = 0;
        forever #5 aclk = ~aclk; // 100 MHz
    end

    initial begin
        aresetn = 0;
        repeat (10) @(posedge aclk);
        aresetn = 1;
    end

    //-------------------------------------------------------------------------
    // AXI-Lite Master Signals (Write + Read)
    //-------------------------------------------------------------------------
    reg  [31:0] s_axi_awaddr  = 0;
    reg         s_axi_awvalid = 0;
    wire        s_axi_awready;

    reg  [31:0] s_axi_wdata   = 0;
    reg  [3:0]  s_axi_wstrb   = 4'hF;
    reg         s_axi_wvalid  = 0;
    wire        s_axi_wready;

    wire [1:0]  s_axi_bresp;
    wire        s_axi_bvalid;
    reg         s_axi_bready  = 0;

    reg  [31:0] s_axi_araddr  = 0;
    reg         s_axi_arvalid = 0;
    wire        s_axi_arready;

    wire [31:0] s_axi_rdata;
    wire [1:0]  s_axi_rresp;
    wire        s_axi_rvalid;
    reg         s_axi_rready  = 0;

    //-------------------------------------------------------------------------
    // I2C wires (open-drain)
    //-------------------------------------------------------------------------
    tri1 sda_line;
    wire scl;
    pullup (sda_line);

    wire dut_sda_o;
    wire dut_sda_t;

    //-------------------------------------------------------------------------
    // DUT: AXI-Lite + I2C Master
    //-------------------------------------------------------------------------
    i2c_axi_lite #(
        .Hz_counter(120)
    ) dut (
        .aresetn        (aresetn),
        .aclk           (aclk),

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

        .i2c_sda_i      (sda_line),
        .i2c_sda_o      (dut_sda_o),
        .i2c_sda_t      (dut_sda_t),
        .i2c_scl        (scl)
    );

    // IOBUF 에뮬레이션: dut_sda_t==1이면 High-Z, 아니면 dut_sda_o를 구동(오픈드레인)
    assign sda_line = dut_sda_t ? 1'bz : dut_sda_o;

    //-------------------------------------------------------------------------
    // I2C EEPROM 모델 (tester.v)
    //-------------------------------------------------------------------------
    i2c_eeprom_model #(
        .I2C_ADDR(7'h50),
        .MEM_DEPTH(256)
    ) eeprom (
        .scl (scl),
        .sda (sda_line)
    );

    //-------------------------------------------------------------------------
    // Parameters and Constants
    //-------------------------------------------------------------------------
    // 레지스터 맵:
    //   0x00: CONTROL_REG   - [0]: START, [1]: R/W (0=Write, 1=Read)
    //   0x04: DEV_ADDR_REG  - [7:0]: Device Address (AT24C02 = 0x50)
    //   0x08: MEM_ADDR_REG  - [7:0]: Memory Address (0x00-0xFF)
    //   0x0C: WR_DATA_REG   - [7:0]: Write Data
    //   0x10: RD_DATA_REG   - [7:0]: Read Data (읽기 전용)
    //   0x14: STATUS_REG    - [0]: BUSY, [1]: ERROR
    //-------------------------------------------------------------------------
    // 비밀번호 저장 영역:
    //   0x00-0x0F: 비밀번호 저장 영역 (최대 16바이트)
    //   0x10: 비밀번호 길이 저장 (1바이트)
    //-------------------------------------------------------------------------
    localparam [7:0] EEPROM_ADDR = 8'h50;  // AT24C02 I2C 주소
    localparam [7:0] MEM_ADDR    = 8'h00;  // EEPROM 메모리 주소
    localparam [7:0] WRITE_DATA  = 8'hAB;  // 쓸 데이터
    localparam [7:0] PASSWORD_START_ADDR = 8'h00;  // 비밀번호 시작 주소
    localparam [7:0] PASSWORD_LEN_ADDR   = 8'h10;  // 비밀번호 길이 저장 주소
    localparam [7:0] MAX_PASSWORD_LEN    = 8'h10;  // 최대 비밀번호 길이 (16바이트)

    //-------------------------------------------------------------------------
    // AXI Lite Write Task
    //-------------------------------------------------------------------------
    task automatic axi_write(input [31:0] addr, input [31:0] data);
        begin
            // 초기화
            s_axi_awaddr  <= 32'h0;
            s_axi_awvalid <= 1'b0;
            s_axi_wdata   <= 32'h0;
            s_axi_wvalid  <= 1'b0;
            s_axi_bready  <= 1'b0;
            
            // Address, Data, Response 채널을 동시에 처리 (fork-join)
            fork
                // Address 채널
                begin
                    @(posedge aclk);
                    s_axi_awaddr  <= #1 addr;
                    s_axi_awvalid <= #1 1'b1;
                    @(posedge aclk);
                    while (s_axi_awready == 1'b0) @(posedge aclk);
                    s_axi_awvalid <= #1 1'b0;
                end
                // Write Data 채널
                begin
                    @(posedge aclk);
                    s_axi_wdata   <= #1 data;
                    s_axi_wvalid  <= #1 1'b1;
                    @(posedge aclk);
                    while (s_axi_wready == 1'b0) @(posedge aclk);
                    s_axi_wvalid  <= #1 1'b0;
                end
                // Response 채널
                begin
                    @(posedge aclk);
                    s_axi_bready  <= #1 1'b1;
                    @(posedge aclk);
                    while (s_axi_bvalid == 1'b0) @(posedge aclk);
                    s_axi_bready  <= #1 1'b0;
                    if (s_axi_bresp != 2'b00) begin
                        $display("[%0t] ERROR: AXI Write Response Error: 0x%02x", $time, s_axi_bresp);
                    end
                end
            join
            
            // 한 사이클 대기
            @(posedge aclk);
        end
    endtask

    //-------------------------------------------------------------------------
    // AXI Lite Read Task
    //-------------------------------------------------------------------------
    task automatic axi_read(input [31:0] addr, output [31:0] data);
        begin
            // Address 채널
            @(posedge aclk);
            s_axi_araddr  <= #1 addr;
            s_axi_arvalid <= #1 1'b1;
            s_axi_rready  <= #1 1'b0;

            // Address ready 대기
            @(posedge aclk);
            while (s_axi_arready == 1'b0) @(posedge aclk);
            s_axi_arvalid <= #1 1'b0;
            
            // Read 데이터 대기
            @(posedge aclk);
            s_axi_rready  <= #1 1'b1;
            @(posedge aclk);
            while (s_axi_rvalid == 1'b0) @(posedge aclk);
            data = s_axi_rdata;
            s_axi_rready <= #1 1'b0;
            
            if (s_axi_rresp != 2'b00) begin
                $display("[%0t] ERROR: AXI Read Response Error: 0x%02x", $time, s_axi_rresp);
            end
            
            // 한 사이클 대기
            @(posedge aclk);
        end
    endtask

    //-------------------------------------------------------------------------
    // I2C Write Byte Task (비밀번호 저장용)
    //-------------------------------------------------------------------------
    task automatic i2c_write_byte(input [7:0] mem_addr, input [7:0] data);
        begin
            reg [31:0] status_reg;
            integer timeout;
            
            // Device Address 설정
            axi_write(32'h0000_0004, {24'h0, EEPROM_ADDR});
            repeat (10) @(posedge aclk);
            
            // Memory Address 설정
            axi_write(32'h0000_0008, {24'h0, mem_addr});
            repeat (10) @(posedge aclk);
            
            // Write Data 설정
            axi_write(32'h0000_000C, {24'h0, data});
            repeat (10) @(posedge aclk);
            
            // Control 레지스터 설정: START=1, R/W=0 (Write)
            axi_write(32'h0000_0000, 32'h0000_0001);
            repeat (10) @(posedge aclk);
            
            // BUSY 해제 대기
            timeout = 0;
            while (timeout < 50000) begin
                axi_read(32'h0000_0014, status_reg);
                if (status_reg[0] == 1'b0) begin
                    break;
                end
                repeat (10) @(posedge aclk);
                timeout = timeout + 10;
            end
            
            // EEPROM 쓰기 사이클 대기 (약 5ms 시뮬레이션)
            repeat (500) @(posedge aclk);
        end
    endtask

    //-------------------------------------------------------------------------
    // I2C Read Byte Task (비밀번호 읽기용) - Random Read 방식
    //-------------------------------------------------------------------------
    // I2C Master의 Random Read 방식:
    //   1. Device Address + R/W=0 (Write) + Memory Address 전송
    //   2. Repeated START
    //   3. Device Address + R/W=1 (Read) + 데이터 읽기
    //   Control 레지스터:
    //     [0]: START
    //     [1]: R/W (1=Read, 0=Write)
    //     [2]: Random Read (1=Random Read, 0=Sequential Read)
    //-------------------------------------------------------------------------
    task automatic i2c_read_byte(input [7:0] mem_addr, output [7:0] data);
        begin
            reg [31:0] status_reg;
            reg [31:0] read_data;
            integer timeout;
            
            // Device Address 설정 (7-bit address)
            axi_write(32'h0000_0004, {24'h0, EEPROM_ADDR});
            repeat (10) @(posedge aclk);
            
            // Memory Address 설정
            axi_write(32'h0000_0008, {24'h0, mem_addr});
            repeat (10) @(posedge aclk);
            
            // I2C Master가 idle 상태인지 확인 (BUSY가 0이어야 함)
            timeout = 0;
            while (timeout < 1000) begin
                axi_read(32'h0000_0014, status_reg);
                if (status_reg[0] == 1'b0) begin
                    break;  // I2C Master가 idle 상태
                end
                repeat (10) @(posedge aclk);
                timeout = timeout + 10;
            end
            
            if (timeout >= 1000) begin
                $display("[%0t] WARNING: I2C Master가 BUSY 상태입니다. 대기 중...", $time);
            end
            
            // Control 레지스터 설정: START=1, R/W=1 (Read), Random Read=1
            // [0]: START = 1
            // [1]: R/W = 1 (Read)
            // [2]: Random Read = 1
            // 0x00000007 = 0b00000000000000000000000000000111
            $display("[%0t] DEBUG: Control 레지스터 설정 - mem_addr=0x%02x, dev_addr=0x%02x", 
                     $time, mem_addr, EEPROM_ADDR);
            axi_write(32'h0000_0000, 32'h0000_0007);  // START=1, R/W=1, Random Read=1
            repeat (20) @(posedge aclk);  // I2C Master가 mem[0]에 로드할 시간 제공
            
            // Control 레지스터 읽어서 확인
            axi_read(32'h0000_0000, read_data);
            $display("[%0t] DEBUG: Control 레지스터 = 0x%08x (START=%b, R/W=%b, Random=%b)", 
                     $time, read_data, read_data[0], read_data[1], read_data[2]);
            
            // BUSY 해제 대기
            timeout = 0;
            while (timeout < 50000) begin
                axi_read(32'h0000_0014, status_reg);
                if (status_reg[0] == 1'b0) begin
                    $display("[%0t] DEBUG: I2C 트랜잭션 완료 (timeout=%0d)", $time, timeout);
                    break;
                end
                repeat (10) @(posedge aclk);
                timeout = timeout + 10;
            end
            
            if (timeout >= 50000) begin
                $display("[%0t] ERROR: I2C Read 타임아웃!", $time);
                data = 8'h00;
                return;
            end
            
            // Read Data 레지스터 읽기
            axi_read(32'h0000_0010, read_data);
            data = read_data[7:0];
        end
    endtask

    //-------------------------------------------------------------------------
    // 비밀번호 저장 Task
    //-------------------------------------------------------------------------
    task automatic password_write(input [7:0] len, input [127:0] password_data);
        begin
            integer i;
            reg [7:0] byte_data;
            
            $display("[%0t] === 비밀번호 저장 시작 (길이: %0d) ===", $time, len);
            
            // 비밀번호 데이터 저장
            for (i = 0; i < len && i < MAX_PASSWORD_LEN; i = i + 1) begin
                byte_data = password_data[i*8 +: 8];
                $display("[%0t] 비밀번호[%0d] = 0x%02x ('%c')", $time, i, byte_data, byte_data);
                i2c_write_byte(PASSWORD_START_ADDR + i, byte_data);
            end
            
            // 비밀번호 길이 저장
            $display("[%0t] 비밀번호 길이 저장: %0d", $time, len);
            i2c_write_byte(PASSWORD_LEN_ADDR, len);
            
            $display("[%0t] === 비밀번호 저장 완료 ===", $time);
        end
    endtask

    //-------------------------------------------------------------------------
    // 비밀번호 읽기 Task
    //-------------------------------------------------------------------------
    task automatic password_read(output [7:0] len, output [127:0] password_data);
        begin
            integer i;
            reg [7:0] byte_data;
            
            $display("[%0t] === 비밀번호 읽기 시작 ===", $time);
            
            // 비밀번호 길이 읽기
            i2c_read_byte(PASSWORD_LEN_ADDR, len);
            $display("[%0t] 비밀번호 길이: %0d", $time, len);
            
            // 비밀번호 데이터 읽기
            password_data = 128'h0;
            for (i = 0; i < len && i < MAX_PASSWORD_LEN; i = i + 1) begin
                i2c_read_byte(PASSWORD_START_ADDR + i, byte_data);
                password_data[i*8 +: 8] = byte_data;
                $display("[%0t] 비밀번호[%0d] = 0x%02x ('%c')", $time, i, byte_data, byte_data);
            end
            
            $display("[%0t] === 비밀번호 읽기 완료 ===", $time);
        end
    endtask

    //-------------------------------------------------------------------------
    // 비밀번호 검증 Task
    //-------------------------------------------------------------------------
    task automatic password_verify(input [7:0] len, input [127:0] password_data, output reg verified);
        begin
            reg [7:0] stored_len;
            reg [127:0] stored_password;
            integer i;
            reg match;
            
            $display("[%0t] === 비밀번호 검증 시작 ===", $time);
            
            // 저장된 비밀번호 읽기
            password_read(stored_len, stored_password);
            
            // 길이 확인
            if (stored_len != len) begin
                $display("[%0t] ✗ 비밀번호 검증 실패: 길이 불일치 (저장: %0d, 입력: %0d)", 
                         $time, stored_len, len);
                verified = 1'b0;
                return;
            end
            
            // 데이터 비교
            match = 1'b1;
            for (i = 0; i < len && i < MAX_PASSWORD_LEN; i = i + 1) begin
                if (stored_password[i*8 +: 8] != password_data[i*8 +: 8]) begin
                    $display("[%0t] ✗ 비밀번호 검증 실패: [%0d] 위치 불일치 (저장: 0x%02x, 입력: 0x%02x)", 
                             $time, i, stored_password[i*8 +: 8], password_data[i*8 +: 8]);
                    match = 1'b0;
                end
            end
            
            if (match) begin
                $display("[%0t] ✓ 비밀번호 검증 성공!", $time);
                verified = 1'b1;
            end else begin
                $display("[%0t] ✗ 비밀번호 검증 실패!", $time);
                verified = 1'b0;
            end
        end
    endtask

    //-------------------------------------------------------------------------
    // Test Variables
    //-------------------------------------------------------------------------
    reg [31:0] read_back;
    reg [31:0] status_reg;
    
    // 비밀번호 테스트용 변수
    reg [7:0] password_len;
    reg [127:0] password_data;
    reg [127:0] read_password;
    reg [7:0] read_len;
    reg verified;
    reg [127:0] wrong_password;

    initial begin
        $display("=== I2C AXI-Lite Testbench 시작 (비밀번호 저장/읽기 테스트) ===");
        
        // Reset 해제 대기
        @(posedge aresetn);
        repeat (10) @(posedge aclk);
        $display("[%0t] Reset 해제됨", $time);

        //-------------------------------------------------------------------------
        // 비밀번호 테스트 시나리오
        //-------------------------------------------------------------------------
        // 비밀번호 설정: "MyPassword123"
        password_len = 12;
        password_data = 128'h00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00;
        password_data[0*8 +: 8] = "M";
        password_data[1*8 +: 8] = "y";
        password_data[2*8 +: 8] = "P";
        password_data[3*8 +: 8] = "a";
        password_data[4*8 +: 8] = "s";
        password_data[5*8 +: 8] = "s";
        password_data[6*8 +: 8] = "w";
        password_data[7*8 +: 8] = "o";
        password_data[8*8 +: 8] = "r";
        password_data[9*8 +: 8] = "d";
        password_data[10*8 +: 8] = "1";
        password_data[11*8 +: 8] = "2";
        password_data[12*8 +: 8] = "3";
        
        repeat (100) @(posedge aclk);

        //-------------------------------------------------------------------------
        // 1) 비밀번호 저장
        //-------------------------------------------------------------------------
        $display("\n=== 1. 비밀번호 저장 테스트 ===");
        password_write(password_len, password_data);
        repeat (1000) @(posedge aclk);

        //-------------------------------------------------------------------------
        // 2) 비밀번호 읽기
        //-------------------------------------------------------------------------
        $display("\n=== 2. 비밀번호 읽기 테스트 ===");
        password_read(read_len, read_password);
        repeat (1000) @(posedge aclk);

        //-------------------------------------------------------------------------
        // 3) 비밀번호 검증 (올바른 비밀번호)
        //-------------------------------------------------------------------------
        $display("\n=== 3. 비밀번호 검증 테스트 (올바른 비밀번호) ===");
        password_verify(password_len, password_data, verified);
        if (verified) begin
            $display("[%0t] ✓ 비밀번호 검증 테스트 성공!", $time);
        end else begin
            $display("[%0t] ✗ 비밀번호 검증 테스트 실패!", $time);
        end
        repeat (1000) @(posedge aclk);

        //-------------------------------------------------------------------------
        // 4) 비밀번호 검증 (잘못된 비밀번호)
        //-------------------------------------------------------------------------
        $display("\n=== 4. 비밀번호 검증 테스트 (잘못된 비밀번호) ===");
        wrong_password = password_data;
        wrong_password[0*8 +: 8] = "X";  // 첫 번째 문자 변경
        password_verify(password_len, wrong_password, verified);
        if (!verified) begin
            $display("[%0t] ✓ 잘못된 비밀번호 거부 테스트 성공!", $time);
        end else begin
            $display("[%0t] ✗ 잘못된 비밀번호 거부 테스트 실패!", $time);
        end
        repeat (1000) @(posedge aclk);

        //-------------------------------------------------------------------------
        // 5) 비밀번호 변경 테스트
        //-------------------------------------------------------------------------
        $display("\n=== 5. 비밀번호 변경 테스트 ===");
        // 새 비밀번호: "NewPass456"
        password_len = 10;
        password_data = 128'h00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00;
        password_data[0*8 +: 8] = "N";
        password_data[1*8 +: 8] = "e";
        password_data[2*8 +: 8] = "w";
        password_data[3*8 +: 8] = "P";
        password_data[4*8 +: 8] = "a";
        password_data[5*8 +: 8] = "s";
        password_data[6*8 +: 8] = "s";
        password_data[7*8 +: 8] = "4";
        password_data[8*8 +: 8] = "5";
        password_data[9*8 +: 8] = "6";
        
        password_write(password_len, password_data);
        repeat (1000) @(posedge aclk);
        
        // 새 비밀번호로 검증
        password_verify(password_len, password_data, verified);
        if (verified) begin
            $display("[%0t] ✓ 비밀번호 변경 및 검증 테스트 성공!", $time);
        end else begin
            $display("[%0t] ✗ 비밀번호 변경 및 검증 테스트 실패!", $time);
        end
        repeat (1000) @(posedge aclk);
        
        $display("\n=== I2C AXI-Lite Testbench 완료 ===");
        $finish;
    end

    initial begin
        $dumpfile("i2c_axi_lite.vcd");         // VCD 파일 이름
        $dumpvars(0, top);                     // top 모듈 이하 모든 신호 저장
    end

endmodule
`default_nettype wire