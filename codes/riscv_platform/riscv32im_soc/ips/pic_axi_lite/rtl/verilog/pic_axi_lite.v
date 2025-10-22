//------------------------------------------------------------------------------
//  Copyright (c) 2024 by Ando Ki.
//  All right reserved.
//
// This program is distributed in the hope that it
// will be useful to understand Ando Ki's work,
// BUT WITHOUT ANY WARRANTY.
//------------------------------------------------------------------------------
// pic_axi_lite.v
//------------------------------------------------------------------------------
// VERSION = 2024.08.10.
//------------------------------------------------------------------------------
`include "pic_axi_lite_if.v"
`include "pic_core.v"

module pic_axi_lite
     #(parameter NUM_IRQ=32)
(
     (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
     (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST"*) input  wire          aresetn,
     (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF s_axi_lite" *)
     (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK"   *) input  wire          aclk,

     (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF s_axi_lite,ASSOCIATED_RESET aresetn,CLK_DOMAIN aclk" *)
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite AWADDR"  *) input  wire [31:0] s_axi_awaddr,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite AWVALID" *) input  wire        s_axi_awvalid,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite AWREADY" *) output wire        s_axi_awready,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite WDATA"   *) input  wire [31:0] s_axi_wdata,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite WVALID"  *) input  wire        s_axi_wvalid,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite WREADY"  *) output wire        s_axi_wready,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite BRESP"   *) output wire [ 1:0] s_axi_bresp,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite BVALID"  *) output wire        s_axi_bvalid,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite BREADY"  *) input  wire        s_axi_bready,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite ARADDR"  *) input  wire [31:0] s_axi_araddr,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite ARVALID" *) input  wire        s_axi_arvalid,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite ARREADY" *) output wire        s_axi_arready,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite RDATA"   *) output wire [31:0] s_axi_rdata,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite RRESP"   *) output wire [ 1:0] s_axi_rresp,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite RVALID"  *) output wire        s_axi_rvalid,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite RREADY"  *) input  wire        s_axi_rready

    , input  wire  [NUM_IRQ-1:0] irq_in
    , output wire                interrupt
);
    //--------------------------------------------------------------------------
    localparam ADD_WIDTH=8;
    wire   [ADD_WIDTH-1:0]  bram_addr;
    wire   [31:0]           bram_wr_data;
    wire   [31:0]           bram_rd_data;
    wire                    bram_rd;
    wire                    bram_wr;
    //--------------------------------------------------------------------------
    // CSR access timing (i.e., bram-style)
    //             __    __    __    __    __
    // clk      __|  |__|  |__|  |__|  |__|  |
    //             _____             _____
    // addr     XXX_____XXXXXXXXXXXXX_____XXX
    //             _____
    // rd       __|     |____________________
    //                   _____
    // rdata    XXXXXXXXX_____XXXXXXXXXXXXXXX
    //                               _____
    // wr       ____________________|     |__
    //                               _____
    // wdata    XXXXXXXXXXXXXXXXXXXXX_____XXXX
    //--------------------------------------------------------------------------
    pic_axi_lite_if #(.ADD_WIDTH(ADD_WIDTH))
    u_pic_lite_if (
          .aresetn       ( aresetn       )
        , .aclk          ( aclk          )
        , .s_axi_awaddr  ( s_axi_awaddr  )
        , .s_axi_awvalid ( s_axi_awvalid )
        , .s_axi_awready ( s_axi_awready )
        , .s_axi_wdata   ( s_axi_wdata   )
        , .s_axi_wvalid  ( s_axi_wvalid  )
        , .s_axi_wready  ( s_axi_wready  )
        , .s_axi_bresp   ( s_axi_bresp   )
        , .s_axi_bvalid  ( s_axi_bvalid  )
        , .s_axi_bready  ( s_axi_bready  )
        , .s_axi_araddr  ( s_axi_araddr  )
        , .s_axi_arvalid ( s_axi_arvalid )
        , .s_axi_arready ( s_axi_arready )
        , .s_axi_rdata   ( s_axi_rdata   )
        , .s_axi_rresp   ( s_axi_rresp   )
        , .s_axi_rvalid  ( s_axi_rvalid  )
        , .s_axi_rready  ( s_axi_rready  )
        , .bram_addr     ( bram_addr     )
        , .bram_wr       ( bram_wr       )
        , .bram_wr_data  ( bram_wr_data  )
        , .bram_rd       ( bram_rd       )
        , .bram_rd_data  ( bram_rd_data  )
    );
    //--------------------------------------------------------------------------
    pic_core #(.NUM_IRQ(NUM_IRQ))
    u_pic_core (
          .reset_n ( aresetn      )
        , .clk     ( aclk         )
        , .addr    ( bram_addr    )
        , .wdata   ( bram_wr_data )
        , .rdata   ( bram_rd_data )
        , .rden    ( bram_rd      )
        , .wren    ( bram_wr      )
        , .irq_in  ( irq_in       )
        , .irq_out ( interrupt    )
    );
endmodule
//------------------------------------------------------------------------------
// Revision history
//
// 2024.08.10: Started by Ando Ki (andoki@gmail.com)
//------------------------------------------------------------------------------
