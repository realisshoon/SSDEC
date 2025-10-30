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
    `define FILE_BIN   "i2c_test.bin"
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
    localparam ADDR_GPIO  = 32'h9003_0000;// starting address of GPIO
    localparam ADDR_I2C   = 32'h9004_0000;// starting address of I2C
    localparam SIZE_PIC   = 32'h0000_1000;
    localparam SIZE_TIMER = 32'h0000_1000;
    localparam SIZE_UART  = 32'h0000_1000;
    localparam SIZE_GPIO  = 32'h0000_1000;
    localparam SIZE_I2C   = 32'h0000_1000;
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
    wire  [7:0] gpio_in;
    wire  [7:0] gpio_out;
    wire  [3:0] keypad_col;
    wire  [3:0] keypad_row;
    wire        i2c_sda;
    wire        i2c_scl;

    // 가상 키패드 시뮬레이션을 위한 reg 신호
    reg [7:0] gpio_in_reg;
    reg [3:0] keypad_row_reg;
    assign gpio_in = gpio_in_reg;
    assign keypad_row = keypad_row_reg;
    
    // 입력 신호 초기화 및 테스트 패턴 생성
    initial begin
        // 초기값 설정 (xx 방지)
        gpio_in_reg = 8'h00;
        keypad_row_reg = 4'h0;
        
        // 시뮬레이션 중간에 값 변경 예시
        #1000000; // 1ms 후
        gpio_in_reg = 8'hAA;
        keypad_row_reg = 4'hF;
        
        #2000000; // 추가 2ms 후
        gpio_in_reg = 8'h55;
        keypad_row_reg = 4'h3;
        
        #2000000; // 추가 2ms 후
        gpio_in_reg = 8'hFF;
        keypad_row_reg = 4'hC;
    end

    //--------------------------------------------------------------------------
    pullup u_pu(uart_rxd); // make default high, since 0 means start.
    
    // I2C pullup resistors (simulate 4.7k pullup)
    pullup u_pu_sda(i2c_sda);
    pullup u_pu_scl(i2c_scl);
    
    // Note: EEPROM 모델 없이도 I2C 마스터가 SDA/SCL 신호를 출력하는 것은 확인 가능
    //       ACK를 못 받아서 timeout이 발생하지만, 파형에서 I2C 프로토콜은 관찰됨
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
                     ,.ADDR_I2C              (ADDR_I2C              )
                     ,.SIZE_PIC              (SIZE_PIC              )
                     ,.SIZE_TIMER            (SIZE_TIMER            )
                     ,.SIZE_UART             (SIZE_UART             )
                     ,.SIZE_GPIO             (SIZE_GPIO             )
                     ,.SIZE_I2C              (SIZE_I2C              )
                     ,.NUM_IRQ               (NUM_IRQ               )
                     ,.IRQ_TIMER             (IRQ_TIMER             )
                     ,.IRQ_UART              (IRQ_UART              )
                     ,.IRQ_GPIO              (IRQ_GPIO               ))
    u_risc_cache_soc (
         .cpu_resetn  ( cpu_resetn  )
        ,.axi_aresetn ( axi_aresetn )
        ,.axi_aclk    ( axi_aclk    )
        ,.uart_txd    ( uart_txd    )
        ,.uart_rxd   ( uart_rxd   )
        ,.uart_cts_n  ( uart_cts_n  )
        ,.uart_rts_n  ( uart_rts_n  )
        ,.gpio_in     ( gpio_in     )
        ,.gpio_out    ( gpio_out    )
        ,.keypad_col  ( keypad_col  )
        ,.keypad_row  ( keypad_row  )
        ,.i2c_sda     ( i2c_sda     )
        ,.i2c_scl     ( i2c_scl     )
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
