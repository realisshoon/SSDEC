// local delay
//`define LD #0
`define LD  #(0.1)

`define CSR_READ  axi_lite_read
`define CSR_WRITE axi_lite_write

task axi_lite_read;
     input  [31:0] addr;
     output [31:0] data;
begin
    @ (posedge axil_aclk);
     fork axi_lite_read_ar( addr );
          axi_lite_read_r ( data );
     join
end
endtask

task axi_lite_read_ar;
     input [31:0] addr ;
begin
    m_axi_lite_araddr   <= `LD addr;
    m_axi_lite_arvalid  <= `LD 1'b1;
    @ (posedge axil_aclk);
    while (m_axi_lite_arready==1'b0) @ (posedge axil_aclk);
    m_axi_lite_arvalid  <= `LD 1'b0;
end
endtask

task axi_lite_read_r;
     output [31:0] data;
begin
    m_axi_lite_rready   <= `LD 1'b1; 
    @ (posedge axil_aclk);
    while (m_axi_lite_rvalid==1'b0) @ (posedge axil_aclk);
    data = m_axi_lite_rdata; // it simply store the read-data; should be blocking
    m_axi_lite_rready   <= `LD 1'b0; 
    if (m_axi_lite_rresp!=2'b00) begin
             $display($time,,"%m ERROR RD RRESP no-ok 0x%02x", m_axi_lite_rresp);
    end
end
endtask

task axi_lite_write;
     input [31:0] addr;
     input [31:0] data;
begin
    @ (posedge axil_aclk);
     fork axi_lite_write_aw( addr );
          axi_lite_write_w ( data );
          axi_lite_write_b (      );
     join
end
endtask

task axi_lite_write_aw;
     input [31:0] addr ;
begin
    m_axi_lite_awaddr   <= `LD addr;
    m_axi_lite_awvalid  <= `LD 1'b1;
    @ (posedge axil_aclk);
    while (m_axi_lite_awready==1'b0) @ (posedge axil_aclk);
    m_axi_lite_awvalid  <= `LD 1'b0;
end
endtask

task axi_lite_write_w;
     input [31:0] data;
begin
     m_axi_lite_wdata    <= `LD data;
     m_axi_lite_wvalid   <= `LD 1'b1;
     @ (posedge axil_aclk);
     while (m_axi_lite_wready==1'b0) @ (posedge axil_aclk);
     m_axi_lite_wdata    <= `LD ~0;
     m_axi_lite_wvalid   <= `LD 1'b0;
end
endtask

task axi_lite_write_b;
begin
    m_axi_lite_bready   <= `LD 1'b1;
    @ (posedge axil_aclk);
    while (m_axi_lite_bvalid==1'b0) @ (posedge axil_aclk);
    m_axi_lite_bready   <= `LD 0;
    if (m_axi_lite_bresp!=2'b00) begin
        $display($time,,"%m ERROR WR BRESP no-ok 0x%02x", m_axi_lite_bresp);
    end
end
endtask
