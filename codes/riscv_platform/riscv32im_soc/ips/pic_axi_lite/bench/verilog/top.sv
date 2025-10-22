//------------------------------------------------------------------------------
// Copyright (c) 2024 by Ando Ki.
// All right reserved.
//------------------------------------------------------------------------------
`timescale 1ns/1ps

module top ;
    //--------------------------------------------------------------------------
    localparam int  NUM_IRQ=16;
    localparam int  ACLK_FREQ_MHZ=100;
    localparam int  ACLK_FREQ=ACLK_FREQ_MHZ*1_000_000;
    localparam real ACLK_HALF=(1_000_000_000.0/ACLK_FREQ/2.0);
    reg  aresetn=1'b0; initial begin #124; aresetn=1'b1; end
    reg  aclk=1'b0; always #ACLK_HALF aclk <= ~aclk;
    //--------------------------------------------------------------------------
    wire [31:0]  axi_lite_awaddr ;
    wire         axi_lite_awvalid;
    wire         axi_lite_awready;
    wire [31:0]  axi_lite_wdata  ;
    wire         axi_lite_wvalid ;
    wire         axi_lite_wready ;
    wire [ 1:0]  axi_lite_bresp  ;
    wire         axi_lite_bvalid ;
    wire         axi_lite_bready ;
    wire [31:0]  axi_lite_araddr ;
    wire         axi_lite_arvalid;
    wire         axi_lite_arready;
    wire [31:0]  axi_lite_rdata  ;
    wire [ 1:0]  axi_lite_rresp  ;
    wire         axi_lite_rvalid ;
    wire         axi_lite_rready ;
    wire [NUM_IRQ-1:0] irq      ;
    wire               interrupt;
    //--------------------------------------------------------------------------
    pic_axi_lite #(.NUM_IRQ(NUM_IRQ))
    u_pic (
          .aresetn       ( aresetn          )
        , .aclk          ( aclk             )
        , .s_axi_awaddr  ( axi_lite_awaddr  )
        , .s_axi_awvalid ( axi_lite_awvalid )
        , .s_axi_awready ( axi_lite_awready )
        , .s_axi_wdata   ( axi_lite_wdata   )
        , .s_axi_wvalid  ( axi_lite_wvalid  )
        , .s_axi_wready  ( axi_lite_wready  )
        , .s_axi_bresp   ( axi_lite_bresp   )
        , .s_axi_bvalid  ( axi_lite_bvalid  )
        , .s_axi_bready  ( axi_lite_bready  )
        , .s_axi_araddr  ( axi_lite_araddr  )
        , .s_axi_arvalid ( axi_lite_arvalid )
        , .s_axi_arready ( axi_lite_arready )
        , .s_axi_rdata   ( axi_lite_rdata   )
        , .s_axi_rresp   ( axi_lite_rresp   )
        , .s_axi_rvalid  ( axi_lite_rvalid  )
        , .s_axi_rready  ( axi_lite_rready  )
        , .irq_in        ( irq       )
        , .interrupt     ( interrupt )
    );
    //--------------------------------------------------------------------------
    tester #(.NUM_IRQ(NUM_IRQ))
    u_tester (
          .aresetn            ( aresetn          )
        , .aclk               ( aclk             )
        , .m_axi_lite_awaddr  ( axi_lite_awaddr  )
        , .m_axi_lite_awvalid ( axi_lite_awvalid )
        , .m_axi_lite_awready ( axi_lite_awready )
        , .m_axi_lite_wdata   ( axi_lite_wdata   )
        , .m_axi_lite_wvalid  ( axi_lite_wvalid  )
        , .m_axi_lite_wready  ( axi_lite_wready  )
        , .m_axi_lite_bresp   ( axi_lite_bresp   )
        , .m_axi_lite_bvalid  ( axi_lite_bvalid  )
        , .m_axi_lite_bready  ( axi_lite_bready  )
        , .m_axi_lite_araddr  ( axi_lite_araddr  )
        , .m_axi_lite_arvalid ( axi_lite_arvalid )
        , .m_axi_lite_arready ( axi_lite_arready )
        , .m_axi_lite_rdata   ( axi_lite_rdata   )
        , .m_axi_lite_rresp   ( axi_lite_rresp   )
        , .m_axi_lite_rvalid  ( axi_lite_rvalid  )
        , .m_axi_lite_rready  ( axi_lite_rready  )
        , .irq                ( irq              )
        , .interrupt          ( interrupt        )
    );
    //--------------------------------------------------------------------------
    initial begin
        $dumpfile("wave.vcd"); //$dumplimit(1000000);
        $dumpvars(0);
    end
endmodule
