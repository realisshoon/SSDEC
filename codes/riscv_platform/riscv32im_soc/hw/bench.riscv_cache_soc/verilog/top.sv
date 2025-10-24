//------------------------------------------------------------------------------
// Copyright (c) 2025 by Ando Ki.
// All right reserved.
//------------------------------------------------------------------------------
// +---------+       +---------+       +---------+
// |         |------>|         |<=====>|         |
// | tester  |       | riscv   |       | tty     |
// |         |       | cache   |       |         |
// |         |       | soc     |       +---------+
// |         |       |         |
// |         |       |+-------+|
// |         |       || mem   ||
// |         |       ||       ||
// |         |       |+-------+|
// +---------+       +---------+
// tester loads image to 'mem'.
//------------------------------------------------------------------------------
`timescale 1ns/1ps

`ifndef ADDR_ENTRY
    `define ADDR_ENTRY 32'h0
`endif
`ifndef FILE_BIN
    `define FILE_BIN   "gpio_test.bin"
`endif
`ifndef BAUD_RATE
    `define BAUD_RATE   115200
`endif

module top ;
    //--------------------------------------------------------------------------
    localparam int  ACLK_FREQ_MHZ=100;
    localparam int  ACLK_FREQ=ACLK_FREQ_MHZ*1_000_000;
    localparam real ACLK_HALF=(1_000_000_000.0/ACLK_FREQ/2.0);
    reg  axi_aresetn=1'b0; initial begin #124; axi_aresetn=1'b1; end
    reg  axi_aclk=1'b0; always #ACLK_HALF axi_aclk <= ~axi_aclk;
    //--------------------------------------------------------------------------
    localparam BOOT_VECTOR            = 32'h0000_0000;
    localparam CORE_ID                = 0;
    localparam SUPPORT_SUPER          = 0;//Enable supervisor / user privilege levels.
    localparam SUPPORT_MMU            = 0;//Enable basic memory management unit.
    localparam SUPPORT_MULDIV         = 1;//Enable HW multiply / divide (RV-M).
    localparam SUPPORT_LOAD_BYPASS    = 1;//Support load result bypass paths.
    localparam SUPPORT_MUL_BYPASS     = 1;//Support multiply result bypass paths.
    localparam SUPPORT_REGFILE_XILINX = 0;//Support Xilinx optimised register file.
    localparam EXTRA_DECODE_STAGE     = 0;//Extra decode pipe stage for improved timing.
    localparam MEM_CACHE_ADDR_MIN     = 32'h0000_0000;//Lowest cacheable memory address.
    localparam MEM_CACHE_ADDR_MAX     = 32'h0FFF_FFFF;//Highest cacheable memory address.
    localparam MEM_ONCHIP_ADDR        = 32'h0000_0000;//Lowest on-chip memory address.
    localparam MEM_ONCHIP_SIZE        = 128*1024 ;//size of memory from MEM_CACHE_ADDR_MIN
    localparam ADDR_PERIPHERAL = 32'h9000_0000;// starting address of peripherals
    localparam SIZE_PERIPHERAL = 32'h1000_0000;// size of address of peripherals
    localparam BAUD_RATE       = `BAUD_RATE;// uart board rate
    localparam ADDR_PIC   = 32'h9000_0000;// starting address of PIC
    localparam ADDR_TIMER = 32'h9001_0000;// starting address of TIMER
    localparam ADDR_UART  = 32'h9002_0000;// starting address of UART
    localparam ADDR_GPIO  = 32'h9003_0000;
    localparam SIZE_PIC   = 32'h0000_1000;
    localparam SIZE_TIMER = 32'h0000_1000;
    localparam SIZE_UART  = 32'h0000_1000;
    localparam SIZE_GPIO  = 32'h0000_1000;
    localparam NUM_IRQ    = 3; // timer(0), uart(1), gpio(2)
    localparam IRQ_TIMER  = 0; // timer(0)
    localparam IRQ_UART   = 1; // uart(1)
    localparam IRQ_GPIO   = 2; // gpio(2)
    //--------------------------------------------------------------------------
    wire  cpu_resetn;
    wire  uart_txd;
    wire  uart_rxdd;
    wire  uart_rts_n;
    wire  uart_cts_n=uart_rts_n;
    wire  [7:0] gpio_in;
    wire  [7:0] gpio_out;
    wire  [3:0] keypad_col;
    wire  [3:0] keypad_row;

    // 가상 키패드 시뮬레이션을 위한 reg 신호
    reg [7:0] gpio_in_reg;
    reg [3:0] keypad_row_reg;
    assign gpio_in = gpio_in_reg;
    assign keypad_row = keypad_row_reg;
    
    // 초기값 설정
    initial begin
        gpio_in_reg = 8'h0;  // 모든 핀 해제
        // keypad_row_reg는 always @(*) 블록에서 조합논리로 설정됨
    end
    
    // PmodKYPD 시뮬레이션: Column을 스캔하면서 Row 응답
    // Keypad 매트릭스: COL[3:0] = {COL4, COL3, COL2, COL1}
    //                  ROW[3:0] = {ROW4, ROW3, ROW2, ROW1}
    //      COL0 COL1 COL2 COL3
    // ROW0  1    2    3    A
    // ROW1  4    5    6    B
    // ROW2  7    8    9    C
    // ROW3  *    0    #    D
    
    // 키패드 동작: COL이 LOW일 때, 해당 버튼이 눌리면 ROW가 LOW
    always @(*) begin
        keypad_row_reg = 4'hF;  // 기본값: 모든 ROW HIGH
        
        // COL0이 LOW일 때
        if (keypad_col[0] == 1'b0) begin
            if (gpio_in_reg[0]) keypad_row_reg[0] = 1'b0;  // '1' 버튼
            if (gpio_in_reg[1]) keypad_row_reg[1] = 1'b0;  // '4' 버튼
            if (gpio_in_reg[2]) keypad_row_reg[2] = 1'b0;  // '7' 버튼
            if (gpio_in_reg[3]) keypad_row_reg[3] = 1'b0;  // '*' 버튼
        end
        
        // COL1이 LOW일 때
        if (keypad_col[1] == 1'b0) begin
            if (gpio_in_reg[0]) keypad_row_reg[0] = 1'b0;  // '2' 버튼
            if (gpio_in_reg[1]) keypad_row_reg[1] = 1'b0;  // '5' 버튼
            if (gpio_in_reg[2]) keypad_row_reg[2] = 1'b0;  // '8' 버튼
            if (gpio_in_reg[3]) keypad_row_reg[3] = 1'b0;  // '0' 버튼
        end
        
        // COL2가 LOW일 때
        if (keypad_col[2] == 1'b0) begin
            if (gpio_in_reg[0]) keypad_row_reg[0] = 1'b0;  // '3' 버튼
            if (gpio_in_reg[1]) keypad_row_reg[1] = 1'b0;  // '6' 버튼
            if (gpio_in_reg[2]) keypad_row_reg[2] = 1'b0;  // '9' 버튼
            if (gpio_in_reg[3]) keypad_row_reg[3] = 1'b0;  // '#' 버튼
        end
        
        // COL3이 LOW일 때
        if (keypad_col[3] == 1'b0) begin
            if (gpio_in_reg[0]) keypad_row_reg[0] = 1'b0;  // 'A' 버튼
            if (gpio_in_reg[1]) keypad_row_reg[1] = 1'b0;  // 'B' 버튼
            if (gpio_in_reg[2]) keypad_row_reg[2] = 1'b0;  // 'C' 버튼
            if (gpio_in_reg[3]) keypad_row_reg[3] = 1'b0;  // 'D' 버튼
        end
    end
    
    // 체계적인 GPIO 입력 시뮬레이션 (파형 분석용)
    initial begin
        $display("=== 4x4 Matrix Keypad 테스트 시작 ===");
        $display("PmodKYPD 시뮬레이션");
        
        // 시스템 초기화 및 CPU 시작 대기
        wait (cpu_resetn==1'b1);
        
        // CPU가 초기화될 시간을 충분히 대기
        #1000000;  // 1ms 대기
        
        $display("키패드 시뮬레이션 시작...");
        
        // 시퀀스 1: '1' 버튼 입력 (ROW0, COL0)
        $display("=== 시퀀스 1: '1' 버튼 입력 ===");
        gpio_in_reg[0] = 1'b1;
        #2000000;  // 2ms 유지 (파형 관찰용)
        gpio_in_reg[0] = 1'b0;
        #1000000;  // 1ms 대기
        
        // 시퀀스 2: 키 1 입력 (GPIO[1] = 1)
        $display("=== 시퀀스 2: 키 1 입력 ===");
        gpio_in_reg[1] = 1'b1;
        #2000000;  // 2ms 유지
        gpio_in_reg[1] = 1'b0;
        #1000000;  // 1ms 대기
        
        // 시퀀스 3: 키 2 입력 (GPIO[2] = 1)
        $display("=== 시퀀스 3: 키 2 입력 ===");
        gpio_in_reg[2] = 1'b1;
        #2000000;  // 2ms 유지
        gpio_in_reg[2] = 1'b0;
        #1000000;  // 1ms 대기
        
        // 시퀀스 4: 키 3 입력 (GPIO[3] = 1)
        $display("=== 시퀀스 4: 키 3 입력 ===");
        gpio_in_reg[3] = 1'b1;
        #200000;  // 2ms 유지
        gpio_in_reg[3] = 1'b0;
        #100000;  // 1ms 대기
        
        // 시퀀스 5: 다중 키 입력 (GPIO[0,1] = 1)
        $display("=== 시퀀스 5: 다중 키 입력 (0,1) ===");
        gpio_in_reg[0] = 1'b1;
        gpio_in_reg[1] = 1'b1;
        #2000000;  // 2ms 유지
        gpio_in_reg[0] = 1'b0;
        gpio_in_reg[1] = 1'b0;
        #100000;  // 1ms 대기
        
        // 시퀀스 6: 모든 키 입력 (GPIO[0,1,2,3] = 1)
        $display("=== 시퀀스 6: 모든 키 입력 (0,1,2,3) ===");
        gpio_in_reg[3:0] = 4'b1111;
        #200000;  // 2ms 유지
        gpio_in_reg[3:0] = 4'b0000;
        #100000;  // 1ms 대기
        
        $display("=== 키패드 시뮬레이션 완료 ===");
        $display("6개의 시퀀스가 완료되었습니다.");
        
        // 시뮬레이션 종료
        #500000;  // 5ms 추가 대기 후 종료
        $display("=== 시뮬레이션 완료 ===");
        $finish;
    end

    //--------------------------------------------------------------------------
    pullup u_pu(uart_rxd); // make default high, since 0 means start.
    //--------------------------------------------------------------------------
    riscv_cache_soc #(.BOOT_VECTOR           (BOOT_VECTOR           )
                     ,.CORE_ID               (CORE_ID               )
                     ,.SUPPORT_SUPER         (SUPPORT_SUPER         )
                     ,.SUPPORT_MMU           (SUPPORT_MMU           )
                     ,.SUPPORT_MULDIV        (SUPPORT_MULDIV        )
                     ,.SUPPORT_LOAD_BYPASS   (SUPPORT_LOAD_BYPASS   )
                     ,.SUPPORT_MUL_BYPASS    (SUPPORT_MUL_BYPASS    )
                     ,.SUPPORT_REGFILE_XILINX(SUPPORT_REGFILE_XILINX)
                     ,.EXTRA_DECODE_STAGE    (EXTRA_DECODE_STAGE    )
                     ,.MEM_CACHE_ADDR_MIN    (MEM_CACHE_ADDR_MIN    )
                     ,.MEM_CACHE_ADDR_MAX    (MEM_CACHE_ADDR_MAX    )
                     ,.MEM_ONCHIP_ADDR       (MEM_ONCHIP_ADDR       )
                     ,.MEM_ONCHIP_SIZE       (MEM_ONCHIP_SIZE       )
                     ,.ADDR_PERIPHERAL       (ADDR_PERIPHERAL       )
                     ,.SIZE_PERIPHERAL       (SIZE_PERIPHERAL       )
                     ,.BAUD_RATE             (BAUD_RATE             )
                     ,.ACLK_FREQ             (ACLK_FREQ             )
                     ,.ADDR_PIC              (ADDR_PIC              )
                     ,.ADDR_TIMER            (ADDR_TIMER            )
                     ,.ADDR_UART             (ADDR_UART             )
                     ,.ADDR_GPIO             (ADDR_GPIO             )
                     ,.SIZE_PIC              (SIZE_PIC              )
                     ,.SIZE_TIMER            (SIZE_TIMER            )
                     ,.SIZE_UART             (SIZE_UART             )
                     ,.SIZE_GPIO             (SIZE_GPIO             )
                     ,.NUM_IRQ               (NUM_IRQ               )
                     ,.IRQ_TIMER             (IRQ_TIMER             )
                     ,.IRQ_UART              (IRQ_UART              )
                     ,.IRQ_GPIO              (IRQ_GPIO               ))
    u_risc_cache_soc (
         .cpu_resetn  ( cpu_resetn  )
        ,.axi_aresetn ( axi_aresetn )
        ,.axi_aclk    ( axi_aclk    )
        ,.uart_txd    ( uart_txd    )
        ,.uart_rxdd   ( uart_rxdd   )
        ,.uart_cts_n  ( uart_cts_n  )
        ,.uart_rts_n  ( uart_rts_n  )
        ,.gpio_in     ( gpio_in     )
        ,.gpio_out    ( gpio_out    )
        ,.keypad_col  ( keypad_col  )
        ,.keypad_row  ( keypad_row  )
    );
    //--------------------------------------------------------------------------
    // load program and release reset
    tester #(.P_ADDR_ENTRY (`ADDR_ENTRY)
            ,.P_FILE_BIN   (`FILE_BIN  )
            ,.P_BOOT_VECTOR(BOOT_VECTOR))
    u_tester (
          .aclk       ( axi_aclk    )
        , .aresetn    ( axi_aresetn )
        , .cpu_resetn ( cpu_resetn  )
    );
    //--------------------------------------------------------------------------
    tty #(.BAUD  (BAUD_RATE)
         ,.PARITY(0)   // 0:none, 1:odd, 2:even
         ,.STOP  (1)   // 0:no, 1:1-bit, 2:2-bit
         ,.WIDTH (8))  // 8-bit data width
    u_tty (
       .uart_rx(uart_txd)
      ,.uart_tx(uart_rxdd)
    );
    //--------------------------------------------------------------------------
    integer code;
    string  str_val;
    initial begin
        if ($test$plusargs("VCD")) begin
            code = $value$plusargs("VCD=%s", str_val);
            if (code==0) begin
                $display("%m ERROR cannot get vcd.");
                $finish(2);
            end
            if (str_val.atoi()!=0) begin
                $dumpfile("wave.vcd"); //$dumplimit(1000000);
                $dumpvars(0);
            end
        end
    end
endmodule
