`ifndef TASKS_AXI_FULL_SV 
`define TASKS_AXI_FULL_SV 
//------------------------------------------------------------------------------
//  Copyright (c) 2024 by Ando Ki.
//  All right reserved.
//------------------------------------------------------------------------------
// tasks_axi_full.sv
//------------------------------------------------------------------------------
// AXI4-Full 인터페이스를 위한 테스트 태스크
//------------------------------------------------------------------------------
`define DL #(0.01)

//------------------------------------------------------------------------------
// AXI4-Full Write Transaction
//------------------------------------------------------------------------------
task axi_full_write;
    input integer addr;
    input integer data;
    input integer id;
    input integer size;  // 0=1byte, 1=2bytes, 2=4bytes
    input integer len;   // burst length (0=single, 1-255=burst)
    input integer burst; // 0=FIXED, 1=INCR, 2=WRAP
begin
    $display("[%0t] axi_full_write: START addr=0x%08X, data=0x%08X", $time, addr, data);
    fork
        // Write Address Channel
        begin
            m_axi_awid    <= `DL id;
            m_axi_awaddr  <= `DL addr;
            m_axi_awlen   <= `DL len;
            m_axi_awsize  <= `DL size;
            m_axi_awburst <= `DL burst;
            m_axi_awvalid <= `DL 1'b1;
            @ (posedge aclk);
            while (m_axi_awready==1'b0) @ (posedge aclk);
            m_axi_awvalid <= `DL 1'b0;
        end
        // Write Data Channel
        begin
            for (int i=0; i<=len; i=i+1) begin
                m_axi_wdata  <= `DL data + i;
                m_axi_wstrb  <= `DL 4'hF;  // All bytes valid
                m_axi_wlast  <= `DL (i==len);
                m_axi_wvalid <= `DL 1'b1;
                @ (posedge aclk);
                while (m_axi_wready==1'b0) @ (posedge aclk);
            end
            m_axi_wvalid <= `DL 1'b0;
        end
        // Write Response Channel
        begin
            // BREADY를 먼저 HIGH로 설정 (AXI 프로토콜 허용)
            // Write Address와 동시에 시작하여 응답을 미리 준비
            m_axi_bready <= 1'b1;
            // BVALID가 HIGH가 될 때까지 대기
            // BVALID가 이미 HIGH일 수도 있으므로, 먼저 확인
            if (m_axi_bvalid==1'b0) begin
                while (m_axi_bvalid==1'b0) @ (posedge aclk);
            end
            // Handshake 완료: BVALID && BREADY가 동시에 HIGH인 클럭
            // 이 클럭에서 handshake가 완료되므로, 다음 클럭에서 BREADY를 LOW로
            @ (posedge aclk);
            m_axi_bready <= 1'b0;
            if (m_axi_bresp!=2'b00) 
                $display("%m ERROR BRESP 0x%0X at addr=0x%08X", m_axi_bresp, addr);
        end
    join
    $display("[%0t] axi_full_write: END addr=0x%08X", $time, addr);
end
endtask

//------------------------------------------------------------------------------
// AXI4-Full Read Transaction
//------------------------------------------------------------------------------
task axi_full_read;
    input  integer addr;
    output integer data;
    input  integer id;
    input  integer size;  // 0=1byte, 1=2bytes, 2=4bytes
    input  integer len;   // burst length (0=single, 1-255=burst)
    input  integer burst; // 0=FIXED, 1=INCR, 2=WRAP
    integer timeout;
begin
    fork
        // Read Address Channel
        begin
            m_axi_arid    <= `DL id;
            m_axi_araddr  <= `DL addr;
            m_axi_arlen   <= `DL len;
            m_axi_arsize  <= `DL size;
            m_axi_arburst <= `DL burst;
            m_axi_arvalid <= `DL 1'b1;
            $display("[%0t] M0 Read Address: ARADDR=0x%08X, ARID=%0d, ARVALID=1", $time, addr, id);
            @ (posedge aclk);
            timeout = 1000;
            while (m_axi_arready==1'b0 && timeout > 0) begin
                @ (posedge aclk);
                timeout = timeout - 1;
            end
            if (timeout == 0) begin
                $display("%m ERROR: ARREADY timeout at addr=0x%08X", addr);
            end else begin
                $display("[%0t] M0 Read Address Accepted: ARREADY=1", $time);
            end
            m_axi_arvalid <= `DL 1'b0;
        end
        // Read Data Channel
        begin
            m_axi_rready <= `DL 1'b1;
            @ (posedge aclk);
            timeout = 1000;
            while (m_axi_rvalid==1'b0 && timeout > 0) begin
                @ (posedge aclk);
                timeout = timeout - 1;
            end
            if (timeout == 0) begin
                $display("%m ERROR: RVALID timeout at addr=0x%08X", addr);
                data = 32'hXXXXXXXX;
            end else begin
                data = m_axi_rdata;
                $display("[%0t] M0 Read Data: RDATA=0x%08X, RID=%0d, RVALID=1, RREADY=1", $time, data, m_axi_rid);
                if (m_axi_rresp!=2'b00) 
                    $display("%m ERROR RRESP 0x%0X at addr=0x%08X", m_axi_rresp, addr);
            end
            m_axi_rready <= `DL 1'b0;
        end
    join
end
endtask

//------------------------------------------------------------------------------
`endif // TASKS_AXI_FULL_SV

