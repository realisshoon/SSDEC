//------------------------------------------------------------------------------
//  Copyright (c) 2024 by Ando Ki.
//  All right reserved.
//
// This program is distributed in the hope that it
// will be useful to understand Ando Ki's work,
// BUT WITHOUT ANY WARRANTY.
//------------------------------------------------------------------------------
// i2c_axi_lite.v - I2C AXI-Lite Master Controller
//------------------------------------------------------------------------------
// VERSION = 2024.10.03.
//------------------------------------------------------------------------------
// I2C AXI-Lite Master Controller for RISC-V SoC
// Features:
// - AXI4-Lite slave interface
// - I2C Master mode operation
// - 7-bit addressing
// - Configurable clock frequency
// - Interrupt support
// - Register-based control
//------------------------------------------------------------------------------
`include "i2c_axi_lite_if.v"
`include "i2c_csr.v"
`include "i2c_core.v"

module i2c_axi_lite
     #(parameter CLK_FREQ=100_000_000) // Clock frequency in Hz
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

    , output wire        i2c_scl
    , output wire        i2c_sda
    , input  wire        i2c_sda_in
    , output wire        interrupt
);
    //--------------------------------------------------------------------------
    localparam ADD_WIDTH=8;
    wire   [ADD_WIDTH-1:0]  bram_addr;
    wire   [31:0]           bram_wr_data;
    wire   [31:0]           bram_rd_data;
    wire                    bram_rd;
    wire                    bram_wr;
    
    // I2C core signals
    wire        i2c_busy;
    wire        i2c_error;
    wire [7:0]  i2c_rx_data;
    wire        i2c_rx_valid;
    wire [7:0]  i2c_tx_data;
    wire        i2c_tx_start;
    wire        i2c_tx_stop;
    wire        i2c_tx_write;
    wire        i2c_tx_read;
    wire [6:0]  i2c_slave_addr;
    wire [7:0]  i2c_clk_div;
    wire        core_i2c_scl;
    wire        core_i2c_sda;
    
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
    // I2C Control and Status Registers
    //--------------------------------------------------------------------------
    i2c_csr #(.ADD_WIDTH(ADD_WIDTH))
    u_i2c_csr (
          .aresetn       ( aresetn       )
        , .aclk          ( aclk          )
        , .addr          ( bram_addr      )
        , .wdata         ( bram_wr_data   )
        , .rdata         ( bram_rd_data   )
        , .rden          ( bram_rd        )
        , .wren          ( bram_wr        )
        , .i2c_scl       ( i2c_scl        )
        , .i2c_sda       ( i2c_sda        )
        , .i2c_sda_in    ( i2c_sda_in     )
        , .core_i2c_scl  ( core_i2c_scl   )
        , .core_i2c_sda  ( core_i2c_sda   )
        , .interrupt     ( interrupt      )
        , .i2c_busy      ( i2c_busy       )
        , .i2c_error     ( i2c_error      )
        , .i2c_rx_data   ( i2c_rx_data    )
        , .i2c_rx_valid  ( i2c_rx_valid   )
        , .i2c_tx_data   ( i2c_tx_data    )
        , .i2c_tx_start  ( i2c_tx_start   )
        , .i2c_tx_stop   ( i2c_tx_stop    )
        , .i2c_tx_write  ( i2c_tx_write   )
        , .i2c_tx_read   ( i2c_tx_read    )
        , .i2c_slave_addr( i2c_slave_addr )
        , .i2c_clk_div   ( i2c_clk_div    )
    );
    
    //--------------------------------------------------------------------------
    // I2C Core Logic
    //--------------------------------------------------------------------------
    i2c_core #(.CLK_FREQ(CLK_FREQ))
    u_i2c_core (
          .aresetn       ( aresetn        )
        , .aclk          ( aclk           )
        , .addr          ( bram_addr       )
        , .wdata         ( bram_wr_data    )
        , .rdata         (                 ) // Not used in core
        , .rden          ( bram_rd         )
        , .wren          ( bram_wr         )
        , .i2c_scl       ( core_i2c_scl    )
        , .i2c_sda       ( core_i2c_sda    )
        , .i2c_sda_in    ( i2c_sda_in      )
        , .i2c_busy      ( i2c_busy        )
        , .i2c_error     ( i2c_error       )
        , .i2c_rx_data   ( i2c_rx_data     )
        , .i2c_rx_valid  ( i2c_rx_valid    )
        , .i2c_tx_data   ( i2c_tx_data     )
        , .i2c_tx_start  ( i2c_tx_start    )
        , .i2c_tx_stop   ( i2c_tx_stop     )
        , .i2c_tx_write  ( i2c_tx_write    )
        , .i2c_tx_read   ( i2c_tx_read     )
        , .i2c_slave_addr( i2c_slave_addr  )
        , .i2c_clk_div   ( i2c_clk_div     )
    );

endmodule
//------------------------------------------------------------------------------
// Revision history
//
// 2024.10.03: Started by Ando Ki (andoki@gmail.com)
//------------------------------------------------------------------------------
