//------------------------------------------------------------------------------
//  Copyright (c) 2024 by Ando Ki.
//  All right reserved.
//------------------------------------------------------------------------------
// i2c_axi_lite.v
//------------------------------------------------------------------------------
`include "i2c_axi_lite_if.v"
`include "i2c_core.v"
`include "i2c_csr.v"

module i2c_axi_lite
     #(parameter CLK_FREQ=100_000_000
               // 시뮬레이션에서 충분한 I2C 토글을 보기 위해 기본값을 빠르게 설정
               , I2C_CLK_FREQ=5_000_000) // I2C clock frequency (for cosim, effectively ~5MHz)
(
     (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
     (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST"*) input  wire          aresetn,
     (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF s_axi_" *)
     (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK"   *) input  wire          aclk,

     (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF s_axi_,ASSOCIATED_RESET aresetn,CLK_DOMAIN aclk" *)
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ AWADDR"  *) input  wire [31:0] s_axi_awaddr,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ AWVALID" *) input  wire        s_axi_awvalid,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ AWREADY" *) output wire        s_axi_awready,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ WDATA"   *) input  wire [31:0] s_axi_wdata,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ WVALID"  *) input  wire        s_axi_wvalid,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ WREADY"  *) output wire        s_axi_wready,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ BRESP"   *) output wire [ 1:0] s_axi_bresp,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ BVALID"  *) output wire        s_axi_bvalid,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ BREADY"  *) input  wire        s_axi_bready,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ ARADDR"  *) input  wire [31:0] s_axi_araddr,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ ARVALID" *) input  wire        s_axi_arvalid,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ ARREADY" *) output wire        s_axi_arready,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ RDATA"   *) output wire [31:0] s_axi_rdata,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ RRESP"   *) output wire [ 1:0] s_axi_rresp,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ RVALID"  *) output wire        s_axi_rvalid,
     (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ RREADY"  *) input  wire        s_axi_rready

    , inout wire          sda
    , output wire         scl
);
    //--------------------------------------------------------------------------
    localparam ADD_WIDTH=8;
    wire   [ADD_WIDTH-1:0]  bram_addr;
    wire   [31:0]           bram_wr_data;
    wire   [31:0]           bram_rd_data;
    wire                    bram_rd;
    wire                    bram_wr;
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    i2c_axi_lite_if #(.ADD_WIDTH(ADD_WIDTH))
    u_axi_lite_if (
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
    wire [31:0] csr_data0;
    wire [31:0] csr_data1;
    wire [31:0] csr_data2;
    wire        status_busy;
    wire        status_ack_err;
    wire        status_done;
    wire        status_data_ready;
    i2c_csr #(.CLK_FREQ(CLK_FREQ))
    u_csr (
          .reset_n  ( aresetn      )
        , .clk      ( aclk         )
        , .addr     ( bram_addr    )  
        , .wren     ( bram_wr      )
        , .rden     ( bram_rd      )
        , .wdata    ( bram_wr_data )
        , .rdata    ( bram_rd_data )
        , .data0    ( csr_data0    )
        , .data1    ( csr_data1    )
        , .data2    ( csr_data2    )
        , .status_busy       ( status_busy       )
        , .status_ack_err    ( status_ack_err    )
        , .status_done       ( status_done       )
        , .status_data_ready ( status_data_ready )
    );
    //--------------------------------------------------------------------------
    // data2: read-only buffer exposed from I2C core (driven by I2C core)
    localparam Hz_counter = CLK_FREQ / (I2C_CLK_FREQ * 2);

    I2C #(.Hz_counter(Hz_counter))
    u_i2c (
          .clk     ( aclk      )
        , .n_rst   ( aresetn   )
        , .data0   ( csr_data0 )
        , .data1   ( csr_data1 )
        , .data2   ( csr_data2 )
        , .status_busy       ( status_busy       )
        , .status_ack_error  ( status_ack_err    )
        , .status_done       ( status_done       )
        , .status_data_ready ( status_data_ready )
        , .sda     ( sda       )
        , .scl     ( scl       )
    );
    //--------------------------------------------------------------------------
endmodule
//------------------------------------------------------------------------------
// Revision history
//
// 2024.08.10: Started by Ando Ki (andoki@gmail.com)
//------------------------------------------------------------------------------
