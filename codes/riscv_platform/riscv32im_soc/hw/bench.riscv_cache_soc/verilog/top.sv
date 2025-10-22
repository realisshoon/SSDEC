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
    wire  uart_rxd;
    wire  uart_rts_n;
    wire  uart_cts_n=uart_rts_n;
    wire  [31:0] gpio_in;
    wire  [31:0] gpio_out;
    wire  [31:0] gpio_dir;

    // 가상 키패드 시뮬레이션을 위한 reg 신호
    reg [31:0] gpio_in_reg;
    assign gpio_in = gpio_in_reg;
    
    // 초기값 설정
    initial begin
        gpio_in_reg = 32'h0;  // 모든 핀 해제
    end
    
    // 간단한 키패드 시뮬레이션 (4개 키 입력)
    initial begin
        $display("=== GPIO 키패드 테스트 시작 ===");
        $display("4개의 키패드 입력을 시뮬레이션합니다.");
        
        // 시스템 초기화 및 CPU 시작 대기
        wait (cpu_resetn==1'b1);
        
        // CPU가 초기화될 시간을 충분히 대기
        #100000000;  // 100ms 대기
        
        $display("키패드 시뮬레이션 시작...");
        
        // 키 0 입력 시뮬레이션
        $display("키 0 입력 시뮬레이션");
        gpio_in_reg[0] = 1'b1;
        #100000000;  // 100ms 유지 (CPU가 감지할 수 있도록)
        gpio_in_reg[0] = 1'b0;
        #50000000;   // 50ms 대기
        
        // 키 1 입력 시뮬레이션
        $display("키 1 입력 시뮬레이션");
        gpio_in_reg[1] = 1'b1;
        #100000000;  // 100ms 유지
        gpio_in_reg[1] = 1'b0;
        #50000000;   // 50ms 대기
        
        // 키 2 입력 시뮬레이션
        $display("키 2 입력 시뮬레이션");
        gpio_in_reg[2] = 1'b1;
        #100000000;  // 100ms 유지
        gpio_in_reg[2] = 1'b0;
        #50000000;   // 50ms 대기
        
        // 키 3 입력 시뮬레이션
        $display("키 3 입력 시뮬레이션");
        gpio_in_reg[3] = 1'b1;
        #100000000;  // 100ms 유지
        gpio_in_reg[3] = 1'b0;
        #50000000;   // 50ms 대기
        
        $display("=== 키패드 시뮬레이션 완료 ===");
        $display("4개의 키가 입력되었습니다: 0, 1, 2, 3");
        
        // 무한 루프 (시뮬레이션 종료 방지)
        while(1) begin
            #100000000;  // 100ms 대기
        end
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
        ,.uart_rxd    ( uart_rxd    )
        ,.uart_cts_n  ( uart_cts_n  )
        ,.uart_rts_n  ( uart_rts_n  )
        ,.gpio_in     ( gpio_in     )
        ,.gpio_out    ( gpio_out    )
        ,.gpio_dir    ( gpio_dir    )
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
      ,.uart_tx(uart_rxd)
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
