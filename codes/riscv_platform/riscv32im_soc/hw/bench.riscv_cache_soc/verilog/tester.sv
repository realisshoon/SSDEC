`timescale 1ns/1ps

module tester
     #(parameter P_ADDR_ENTRY=32'h0
      ,parameter P_FILE_BIN="test.bin"
      ,parameter P_BOOT_VECTOR=32'h0000_0000)
(
      input  wire          aclk
    , input  wire          aresetn
    , output reg           cpu_resetn
);
    string  str_addr, str_hex;
    string  file_bin;
    integer addr_entry;
    integer fd_bin;
    integer check_bin;
    integer code, size, mismatch, idx;
    reg [31:0] word;
    reg [31:0] addr;
    reg [31:0] dataA, dataB;
    initial begin
        cpu_resetn=1'b0;
        wait (aresetn==1'b0);
        wait (aresetn==1'b1);
        $display("=== RISC-V CPU 초기화 시작 ===");
        load_program;
        repeat (5) @(posedge aclk);
        cpu_resetn=1'b1;
        $display("=== RISC-V CPU 시작됨 ===");
        $display("GPIO 키패드 테스트 프로그램이 실행됩니다.");
    end
    //--------------------------------------------------------------------------
    task load_program;
        reg break_flag;
    begin
        //----------------------------------------------------------------------
        if (top.u_risc_cache_soc.u_mem_axi.AXI_WIDTH_DATA!=32) begin
            $display("%m ERROR data width is not 32-bit.");
            $finish(2);
        end
        //----------------------------------------------------------------------
        // get address of entry
        addr_entry = P_ADDR_ENTRY;
        if ($test$plusargs("ADDR_ENTRY")) begin
            code = $value$plusargs("ADDR_ENTRY=%s", str_addr);
            if (code==0) begin
                $display("%m ERROR cannot get entry addr");
                $finish(2);
            end
            if (str_addr.substr(0,1)=="0x") begin
                 str_hex = str_addr.substr(2,str_addr.len()-1);
                 addr_entry = str_hex.atohex();
            end else begin
                 addr_entry = str_addr.atoi();
            end
        end
        //----------------------------------------------------------------------
        // get binary file name and open it
        file_bin = P_FILE_BIN;
        if ($test$plusargs("FILE_BIN")) begin
            code = $value$plusargs("FILE_BIN=%s", file_bin);
            if (code==0) begin
                $display("%m ERROR cannot get file: %0d", code);
                $finish(2);
            end
        end
        fd_bin = $fopen(file_bin, "rb");
        if (fd_bin==0) begin
            $display("%m ERROR cannot open: %s", file_bin);
            $finish(2);
        end else begin
            $display("%m open: %s", file_bin);
        end
        //----------------------------------------------------------------------
        // get size of binary file
        code = $fseek(fd_bin, 0, 2);
        if (code!=0) begin
            $display("%m ERROR could not get to the end: %0d", code);
            $finish(2);
        end
        size = $ftell(fd_bin);
        if (code<0) begin
            $display("%m ERROR could not get to the position of end: %0d", code);
            $finish(2);
        end
$display("%m size=0x%0X (%0d)", size, size);
        //----------------------------------------------------------------------
        // rewind
        code = $fseek(fd_bin, 0, 0); // go to the start
        if (code!=0) begin
            $display("%m ERROR could not rewind: %1d", code);
            $finish(2);
        end
        //----------------------------------------------------------------------
        // fill memory
        break_flag = 1'b0;
        idx = 0;
        addr = addr_entry;
        while (!$feof(fd_bin) && !break_flag) begin
            code = $fread(word, fd_bin); //code = $fread(word, fd_bin, 0, 4);
            if (code==0) begin
                $display("%m WARNING could not read %0d-th word.", idx);
                break_flag=1'b1;
                //$finish(2);
            end else if (code!=4) begin
                $display("%m WARNING could not read %0d-th word. (0x%08X)", idx, code);
                addr = addr + code;
            end else begin
                top.u_risc_cache_soc.u_mem_axi.write(addr, swap_word(word), 4'hF);
                addr = addr + 4;
                idx = idx + 1;
            end
        end
        $display("%m INFO %0d-word (%0d-byte) written from 0x%08X to 0x%08X",
                     idx, idx*4, addr_entry, addr-4);
        if (addr!=size) begin
            $display("%m WARNING size mis-match: 0x%0X (%0d), but 0x%0X (%0d) expected.",
                       size, size, addr, addr);
        end
        //----------------------------------------------------------------------
        // check the contents
        check_bin = 0;
        if ($test$plusargs("CHECK_BIN")) begin
            code = $value$plusargs("CHECK_BIN=%s", check_bin);
            if (code==0) begin
                $display("%m ERROR cannot get check bin: %0d", code);
                $finish(2);
            end
        end
        if (check_bin!=0) begin
            code = $fseek(fd_bin, 0, 0); // go to the start
            if (code!=0) begin
                $display("%m ERROR could not rewind: %0d", code);
                $finish(2);
            end
            mismatch = 0;
            break_flag = 1'b0;
            idx = 0;
            addr = addr_entry;
            for (int idy=0; (idy<size && break_flag==1'b0); idy=idy+4) begin
                code = $fread(dataA, fd_bin);
                if (code==0) begin
                    $display("%m WARNING could not read %0d-th word.", idx);
                    break_flag = 1'b1;
                    //$finish(2);
                end else if (code!=4) begin
                    $display("%m WARNING could not read %0d-th word. (0x%08X)", idx, code);
                    addr = addr + code;
                    idx = idx+1;
                end else begin
                    top.u_risc_cache_soc.u_mem_axi.read(addr, dataB);
                    if (swap_word(dataA)!==dataB) begin
                        mismatch = mismatch + 1;
                    end
                    addr = addr + 4;
                    idx = idx+1;
                end
            end
            if (mismatch==0) $display("%m 0x%0X (%0d) bytes OK.", size, size);
            else             $display("%m %0d-byte mistmatch out of %0d.", mismatch, size);
        end
        //----------------------------------------------------------------------
        $fclose(fd_bin);
    end
    endtask
    //--------------------------------------------------------------------------
    function [31:0] swap_word;
        input [31:0] data;
    begin
        swap_word = {data[7:0],data[15:8],data[23:16],data[31:24]};
    end
    endfunction
endmodule
