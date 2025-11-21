`timescale 1ns/1ps

module iic_controller_tb;
    //-------------------------------------------------------------------------
    // DUT interface signals
    //-------------------------------------------------------------------------
    reg         clk;
    reg         n_rst;
    reg  [31:0] data0;
    reg  [31:0] data1;
    wire [31:0] data2;
    wire        scl;
    tri1        sda;           // add implicit pull-up

    //-------------------------------------------------------------------------
    // Simple open-drain slave model control
    //-------------------------------------------------------------------------
    reg         ack_drive_low; // pulls SDA low during ACK cycles
    reg         data_drive_low;// pulls SDA low when supplying read data bits
    assign sda = (ack_drive_low | data_drive_low) ? 1'b0 : 1'bz;
    pullup(sda);

    //-------------------------------------------------------------------------
    // Instantiate DUT
    //-------------------------------------------------------------------------
    I2C UI2C_0 (
        .clk   (clk),
        .n_rst (n_rst),
        .data0 (data0),
        .data1 (data1),
        .data2 (data2),
        .sda   (sda),
        .scl   (scl)
    );

    //-------------------------------------------------------------------------
    // Clock generation
    //-------------------------------------------------------------------------
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk; // 5ns마다 토글
    end

    //-------------------------------------------------------------------------
    // Slave READ payload (four bytes max for page mode)
    //-------------------------------------------------------------------------
    localparam int NUM_READ_BYTES = 4;
    reg [7:0] read_payload [0:NUM_READ_BYTES-1];
    integer   read_idx;

    initial begin
        read_payload[0] = 8'hA5;
        read_payload[1] = 8'h5A;
        read_payload[2] = 8'hC3;
        read_payload[3] = 8'h3C;
    end
 // read_payload는 master에게 보낼 데이터를 저장한 배열 (읽을 배열)
    //-------------------------------------------------------------------------
    // Helper task: drive ACK on SDA for one bit time
    //-------------------------------------------------------------------------
    task automatic slave_ack_cycle;
    begin
        @(negedge scl);
        ack_drive_low <= 1'b1;
        @(posedge scl);
        ack_drive_low <= 1'b0;
    end
    endtask

    // Track state transitions to trigger ACK responses
    reg [4:0] state_q;
    always @(posedge clk or negedge n_rst) begin
        if (!n_rst) begin
            state_q <= UI2C_0.idle; // reset 들어왔다면
        end else begin
            state_q <= UI2C_0.state; // 현재 상태 저장
        end
    end

    always @(posedge clk) begin
        if (n_rst && (state_q != UI2C_0.state)) begin // 리셋이 아니고 상태가 변경되었다면
            case (UI2C_0.state)
                UI2C_0.w_d_addr_a,
                UI2C_0.w_w_addr_a,
                UI2C_0.w_data_a,
                UI2C_0.rr_w_d_addr_a,
                UI2C_0.rr_w_w_addr_a,
                UI2C_0.r_d_addr_a,
                UI2C_0.rr_r_d_addr_a: begin
                    fork slave_ack_cycle(); join_none
                end
            endcase
        end
    end

    //-------------------------------------------------------------------------
    // Drive read data bits (slave transmitting to master)
    //-------------------------------------------------------------------------
    reg [1:0] tb_byte_counter;  // 테스트벤치 자체 바이트 카운터
    reg [4:0] prev_r_state_clk;
    
    // clk 기준으로 바이트 카운터 관리
    always @(posedge clk or negedge n_rst) begin
        if (!n_rst) begin
            tb_byte_counter <= 0;
            prev_r_state_clk <= 0;
        end else begin
            prev_r_state_clk <= UI2C_0.state;
            
            // READ 트랜잭션 시작 시에만 리셋 (state 진입 edge 검출)
            if ((UI2C_0.state == UI2C_0.r_d_addr && prev_r_state_clk != UI2C_0.r_d_addr) ||
                (UI2C_0.state == UI2C_0.rr_w_d_addr && prev_r_state_clk != UI2C_0.rr_w_d_addr)) begin
                tb_byte_counter <= 0;
                $display("[%0t] TB: byte_counter reset to 0 (state=%0d->%0d)", $time, prev_r_state_clk, UI2C_0.state);
            end
            // r_data/rr_r_data → r_data_a/rr_r_data_a 전환 시 다음 바이트 준비 (바이트 완료)
            else if ((UI2C_0.state == UI2C_0.r_data_a && prev_r_state_clk == UI2C_0.r_data) ||
                     (UI2C_0.state == UI2C_0.rr_r_data_a && prev_r_state_clk == UI2C_0.rr_r_data)) begin
                $display("[%0t] TB: Byte %0d (0x%02x) completed, DUT received: 0x%02x", 
                         $time, tb_byte_counter, read_payload[tb_byte_counter], 
                         UI2C_0.mem[2][(tb_byte_counter*8) +: 8]);
                if (tb_byte_counter < NUM_READ_BYTES - 1) begin
                    tb_byte_counter <= tb_byte_counter + 1;
                    $display("[%0t] TB: byte_counter %0d -> %0d (next byte: 0x%02x)", 
                             $time, tb_byte_counter, tb_byte_counter + 1, read_payload[tb_byte_counter + 1]);
                end
            end
        end
    end
    
    // SCL 기준으로 데이터 출력
    reg first_bit_sent;
    always @(negedge scl or negedge n_rst) begin
        if (!n_rst) begin
            data_drive_low <= 1'b0;
            read_idx       <= 0;
            first_bit_sent <= 0;
        end else begin
            if (UI2C_0.state == UI2C_0.r_data   ||
                UI2C_0.state == UI2C_0.rr_r_data) begin
                int byte_idx = tb_byte_counter;
                int bit_pos = UI2C_0.counter_data; // 7 down to 0
                data_drive_low <= (read_payload[byte_idx][bit_pos] == 1'b0);
                if (!first_bit_sent && bit_pos == 7) begin
                    $display("[%0t] TB: Sending byte %0d = 0x%02x, bit[%0d]=%b (state=%0d)", 
                             $time, byte_idx, read_payload[byte_idx], bit_pos, 
                             read_payload[byte_idx][bit_pos], UI2C_0.state);
                    first_bit_sent <= 1;
                end
            end else if (UI2C_0.state == UI2C_0.r_data_a ||
                         UI2C_0.state == UI2C_0.rr_r_data_a) begin
                data_drive_low <= 1'b0; // release so master can ACK
                first_bit_sent <= 0;
            end else if (!ack_drive_low) begin
                data_drive_low <= 1'b0;
            end
        end
    end

    //-------------------------------------------------------------------------
    // Stimulus
    //-------------------------------------------------------------------------
    initial begin
        ack_drive_low = 1'b0;
        data_drive_low = 1'b0;
        data0 = 32'h0;
        data1 = 32'h0;
        read_idx = 0;

        n_rst = 1'b0;
        repeat (8) @(posedge clk);
        n_rst = 1'b1;

        //--------------------------------------------------------------------------
        // Issue a write command (device addr 0x39 write, word addr 0x72, no page)
        //--------------------------------------------------------------------------
        data1 <= 32'h1234_5678;
        data0 <= 32'h80_00_72_AE; // start=1, dev=0x39, write, random=0, page=0, 짝수는 write

        // Wait for stop
        wait (UI2C_0.state == UI2C_0.stop);
        repeat (10) @(posedge clk);
        data0 <= 32'h0000_0000; // clear start

        //--------------------------------------------------------------------------
        // Issue a read command to fetch slave supplied bytes
        //--------------------------------------------------------------------------
        read_idx <= 0;
        repeat (20) @(posedge clk);
        data0 <= 32'h80_00_72_AF; // start=1, dev=0x39, read, random=0, page=0, 홀수는 read

        wait (UI2C_0.state == UI2C_0.stop);
        repeat (10) @(posedge clk);
        data0 <= 32'h0000_0000;

        //--------------------------------------------------------------------------
        // Check results
        //--------------------------------------------------------------------------
        $display("[%0t] READ data = 0x%08x", $time, data2);
        if (data2[7:0] !== read_payload[0]) begin
            $error("I2C read mismatch: expected 0x%02x got 0x%02x",
                   read_payload[0], data2[7:0]);
        end else begin
            $display("I2C READ PASS (0x%02x)", data2[7:0]);
        end

        //--------------------------------------------------------------------------
        // Issue a random read (set random bit)
        //--------------------------------------------------------------------------
        read_idx <= 0;
        repeat (20) @(posedge clk);
        data0 <= 32'h80_01_72_AF; // start=1, dev=0x39, read, random=1, page=0

        wait (UI2C_0.state == UI2C_0.stop);
        repeat (10) @(posedge clk);
        data0 <= 32'h0000_0000;

        $display("[%0t] RANDOM READ data = 0x%08x", $time, data2);
        if (data2[7:0] !== read_payload[0]) begin
            $error("I2C random read mismatch: expected 0x%02x got 0x%02x",
                   read_payload[0], data2[7:0]);
        end else begin
            $display("I2C RANDOM READ PASS (0x%02x)", data2[7:0]);
        end

        //--------------------------------------------------------------------------
        // Issue a PAGE WRITE (4 bytes)
        //--------------------------------------------------------------------------
        repeat (20) @(posedge clk);
        data1 <= 32'hDEADBEEF; // 4 bytes to write: 0xEF, 0xBE, 0xAD, 0xDE
        data0 <= 32'h80_02_55_AE; // start=1, dev=0x39, write, random=0, page=1 (bit[17]=1)

        wait (UI2C_0.state == UI2C_0.stop);
        repeat (10) @(posedge clk);
        data0 <= 32'h0000_0000;

        //--------------------------------------------------------------------------
        // Issue a PAGE READ (4 bytes)
        //--------------------------------------------------------------------------
        read_idx <= 0;
        repeat (20) @(posedge clk);
        data0 <= 32'h80_02_55_AF; // start=1, dev=0x39, read, random=0, page=1 (bit[17]=1)

        wait (UI2C_0.state == UI2C_0.stop);
        repeat (10) @(posedge clk);
        data0 <= 32'h0000_0000;

        //--------------------------------------------------------------------------
        // Check PAGE READ results (all 4 bytes)
        //--------------------------------------------------------------------------
        $display("[%0t] PAGE READ data = 0x%08x", $time, data2);
        if (data2[7:0]   !== read_payload[0] ||
            data2[15:8]  !== read_payload[1] ||
            data2[23:16] !== read_payload[2] ||
            data2[31:24] !== read_payload[3]) begin
            $error("I2C page read mismatch: expected 0x%02x%02x%02x%02x got 0x%08x",
                   read_payload[3], read_payload[2], read_payload[1], read_payload[0], data2);
        end else begin
            $display("I2C PAGE READ PASS (0x%08x)", data2);
        end

        //--------------------------------------------------------------------------
        // Issue a RANDOM PAGE READ (random=1, page=1)
        //--------------------------------------------------------------------------
        read_idx <= 0;
        repeat (20) @(posedge clk);
        data0 <= 32'h80_03_55_AF; // start=1, dev=0x39, read, random=1, page=1

        wait (UI2C_0.state == UI2C_0.stop);
        repeat (10) @(posedge clk);
        data0 <= 32'h0000_0000;

        $display("[%0t] RANDOM PAGE READ data = 0x%08x", $time, data2);
        if (data2[7:0]   !== read_payload[0] ||
            data2[15:8]  !== read_payload[1] ||
            data2[23:16] !== read_payload[2] ||
            data2[31:24] !== read_payload[3]) begin
            $error("I2C random page read mismatch: expected 0x%02x%02x%02x%02x got 0x%08x",
                   read_payload[3], read_payload[2], read_payload[1], read_payload[0], data2);
        end else begin
            $display("I2C RANDOM PAGE READ PASS (0x%08x)", data2);
        end

        repeat (200) @(posedge clk);
        $finish;
    end
endmodule