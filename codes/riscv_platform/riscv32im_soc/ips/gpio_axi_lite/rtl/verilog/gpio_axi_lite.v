//------------------------------------------------------------------------------
// Copyright (c) 2025 by Ando Ki
//------------------------------------------------------------------------------
// gpio_axi_lite.v
//------------------------------------------------------------------------------
// [REGISTERS]
// 0x10: Line Control Register
//       '0' = input mode (default)
//       '1' = output mode
// 0x14: Line Register for input
//       Current GPIO pin level
// 0x18: Line Register for output
//       Current GPIO pin level
// 0x1C: Interrupt Mask Register
//       '0' = enabled
//       '1' = masked (disabled) (default)
// 0x20: Interrupt Flag
// 0x24: Interrupt Edge/Level Sensitivity Mode Register
//       '0' = Level sensitivity mode (default)
//       '1' = Edge sensitivity mode
// 0x28: Interrupt Pol Sensitivity Mode Register
//       '0' = active-low for level mode, falling for edge mode (default)
//       '1' = active-high for level mode, rising for edge mode
//
// [HOWTO]
// * Use a pin as an input:
//   Program the corresponding bit in the Control Register
//   to 'input mode' ('0').
//   Then, the pin's state (input level) can be checked
//   by reading the Line Register.
//   Note that writing to the GPIO pin's Line Register bit
//   while in input mode has no effect.
//
// * Use a pin as an output:
//   Program the corresponding bit in the Control Register
//   to 'output mode' ('1').
//   Then, program the GPIO pin's output level by writing
//   to the corresponding bit in the Line Register.
//   Note reading the GPIO pin's Line Register bit while
//   in output mode returns the current input pin level
//   so that it may not reflect the value written.
//
// * Use a pin as an interrupt source:
//   Program the corresponding bit in the Edge Register
//   to the desired sensitivity mode (level or edge).
//   Program the corresponding bit in the Pol Register
//   to the desired sensitivity mode (low/falling or high/rising).
//   Program the corresponding bit in the Mask Register
//   to 'un-masked mode' ('0').
//------------------------------------------------------------------------------
`include "gpio_axi_lite_if.v"

module gpio_axi_lite
     #(parameter P_WIDTH=32) // bit-width for gpio
(
    (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST"           *) input  wire        aresetn,
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF s_axi_lite"                  *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK"              *) input  wire        aclk,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite AWADDR"  *) input  wire [31:0] s_axi_lite_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite AWVALID" *) input  wire        s_axi_lite_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite AWREADY" *) output wire        s_axi_lite_awready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite WDATA"   *) input  wire [31:0] s_axi_lite_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite WVALID"  *) input  wire        s_axi_lite_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite WREADY"  *) output wire        s_axi_lite_wready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite BRESP"   *) output wire [ 1:0] s_axi_lite_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite BVALID"  *) output wire        s_axi_lite_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite BREADY"  *) input  wire        s_axi_lite_bready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite ARADDR"  *) input  wire [31:0] s_axi_lite_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite ARVALID" *) input  wire        s_axi_lite_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite ARREADY" *) output wire        s_axi_lite_arready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite RDATA"   *) output wire [31:0] s_axi_lite_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite RRESP"   *) output wire [ 1:0] s_axi_lite_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite RVALID"  *) output wire        s_axi_lite_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite RREADY"  *) input  wire        s_axi_lite_rready

    , input  wire [P_WIDTH-1:0] gpio_in
    , output wire [P_WIDTH-1:0] gpio_out
    , output wire [P_WIDTH-1:0] gpio_dir // 0 for output, 1 for input
    , output wire               interrupt
);
    //--------------------------------------------------------------------------
    wire   [31:0]  bram_addr;
    wire   [31:0]  bram_wr_data;
    wire   [31:0]  bram_rd_data;
    wire           bram_en;
    wire           bram_we;
    wire           bram_re;
    //--------------------------------------------------------------------------
    gpio_axi_lite_if
    u_axi_lite_if (
          .s_axi_aresetn ( aresetn            )
        , .s_axi_aclk    ( aclk               )
        , .s_axi_awaddr  ( s_axi_lite_awaddr  )
        , .s_axi_awvalid ( s_axi_lite_awvalid )
        , .s_axi_awready ( s_axi_lite_awready )
        , .s_axi_wdata   ( s_axi_lite_wdata   )
        , .s_axi_wvalid  ( s_axi_lite_wvalid  )
        , .s_axi_wready  ( s_axi_lite_wready  )
        , .s_axi_bresp   ( s_axi_lite_bresp   )
        , .s_axi_bvalid  ( s_axi_lite_bvalid  )
        , .s_axi_bready  ( s_axi_lite_bready  )
        , .s_axi_araddr  ( s_axi_lite_araddr  )
        , .s_axi_arvalid ( s_axi_lite_arvalid )
        , .s_axi_arready ( s_axi_lite_arready )
        , .s_axi_rdata   ( s_axi_lite_rdata   )
        , .s_axi_rresp   ( s_axi_lite_rresp   )
        , .s_axi_rvalid  ( s_axi_lite_rvalid  )
        , .s_axi_rready  ( s_axi_lite_rready  )
        , .bram_addr     ( bram_addr    )
        , .bram_wr_data  ( bram_wr_data )
        , .bram_rd_data  ( bram_rd_data )
        , .bram_en       ( bram_en      )
        , .bram_we       ( bram_we      )
        , .bram_re       ( bram_re      )
    );
    //--------------------------------------------------------------------------
    wire [31:0]  raddr=bram_addr;
    wire [31:0]  rdata;
    wire         ren  =bram_en & bram_re;
    wire [31:0]  waddr=bram_addr;
    wire [31:0]  wdata=bram_wr_data;
    wire         wen  =bram_en & bram_we;
    wire         slverr;
    //--------------------------------------------------------------------------
    assign bram_rd_data=rdata;
    //--------------------------------------------------------------------------
    gpio_csr #(.P_WIDTH(P_WIDTH))
    u_csr (
          .resetn    ( aresetn )
        , .clk       ( aclk    )
        , .waddr     ( waddr )
        , .wdata     ( wdata )
        , .wen       ( wen   )
        , .raddr     ( raddr )
        , .rdata     ( rdata )
        , .ren       ( ren   )
        , .slverr    ( slverr    )
        , .gpio_in   ( gpio_in   )
        , .gpio_out  ( gpio_out  )
        , .gpio_dir  ( gpio_dir  )
        , .interrupt ( interrupt )
    );
endmodule

//------------------------------------------------------------------------------
// CSR access timing (i.e., bram-style)
//             __    __    __    __    __    _
// clk      __|  |__|  |__|  |__|  |__|  |__|
//             _____             _____
// addr     XXX_____XXXXXXXXXXXXX_____XXX
//             _____
// rden     __|     |____________________
//                   _____
// rdata    XXXXXXXXX_____XXXXXXXXXXXXXXX
//                               _____
// wren     ____________________|     |__
//                               _____
// wdata    XXXXXXXXXXXXXXXXXXXXX_____XXXX
//------------------------------------------------------------------------------
// DIR    : driving mode of each bit (note that it is inversion of actual signal)
//          - 0 for input, 1 for output
//          - default: 0x00000000
// INPUT  : current value of the gpio_in
// OUTPUT : current value of the gpio_out (drive)
// MASK   : interrupt mask
//          - 0 for enable, 1 for disable
//          - default: 0xFFFFFFFF
// IRQ    : interrupt status
//          - 1 for interrupt, 0 for normal
//          - default: 0x00000000
// EDGE   : edge/level sensitivity mode
//          - 0 for level, 1 for edge
//          - default: 0x00000000
// POL    : rising/falling/high/low mode
//          - 0 for active-low for level, falling-edge for edge
//          - 1 for active-high for level, rising-edge for edge
//          - default: 0xFFFFFFFF
//------------------------------------------------------------------------------
module gpio_csr
     #(parameter P_WIDTH=32 // bit-width for gpio
               , P_VERSION=32'h20250415
               , P_NAME="GPIO")
(
      input  wire             resetn
    , input  wire             clk
    , input  wire [31:0]      waddr
    , input  wire [31:0]      wdata
    , input  wire             wen
    , input  wire [31:0]      raddr
    , output reg  [31:0]      rdata
    , input  wire             ren
    , output wire             slverr
    , input  wire [P_WIDTH-1:0] gpio_in
    , output reg  [P_WIDTH-1:0] gpio_out
    , output wire [P_WIDTH-1:0] gpio_dir // 0 for output, 1 for input
    , output wire               interrupt
);
    //--------------------------------------------------------------------------
    reg slverr_rd=1'b0;
    reg slverr_wr=1'b0;
    assign slverr=slverr_rd|slverr_wr;
    //--------------------------------------------------------------------------
    reg [P_WIDTH-1:0] csr_dir ={P_WIDTH{1'b0}}; // 0 for input, 1 for output
    reg [P_WIDTH-1:0] csr_mask={P_WIDTH{1'b1}}; // bit-wise; 0=enabled, 1=masked
    reg [P_WIDTH-1:0] csr_irq ='h0; // bit-wise; 0=no_interrupt, 1=interrupt
    reg [P_WIDTH-1:0] csr_edge='h0; // level-trigged when 0, edge-trigged when 1
    reg [P_WIDTH-1:0] csr_pol ={P_WIDTH{1'b1}}; // 1: active-high or rising-edge
    //--------------------------------------------------------------------------
    assign gpio_dir=~csr_dir; // note inversion
    //--------------------------------------------------------------------------
    localparam CSRA_VERSION =8'h00
             , CSRA_NAME    =8'h04
             , CSRA_DIR     =8'h10
             , CSRA_INPUT   =8'h14
             , CSRA_OUTPUT  =8'h18
             , CSRA_MASK    =8'h1C
             , CSRA_IRQ     =8'h20
             , CSRA_EDGE    =8'h24
             , CSRA_POL     =8'h28
             ;
    //--------------------------------------------------------------------------
    // CSR read
    always @ (posedge clk or negedge resetn) begin
    if (resetn==1'b0) begin
        rdata     <= 'h0;
        slverr_rd <= 1'b0;
    end else begin
        rdata     <= 'h0;
        slverr_rd <= 1'b0;
        if (ren==1'b1) begin
           case (raddr[7:0])
               CSRA_VERSION: rdata <= P_VERSION;
               CSRA_NAME   : rdata <= P_NAME;
               CSRA_DIR    : rdata <= csr_dir;
               CSRA_INPUT  : rdata <= gpio_in;
               CSRA_OUTPUT : rdata <= gpio_out;
               CSRA_MASK   : rdata <= csr_mask;
               CSRA_IRQ    : rdata <= csr_irq;
               CSRA_EDGE   : rdata <= csr_edge;
               CSRA_POL    : rdata <= csr_pol;
               default     : begin
                             rdata <= 'h0;
                             slverr_rd <= 1'b1;
                             end
           endcase
        end else begin
           rdata <= 'h0;
        end
    end // if
    end // always
    //--------------------------------------------------------------------------
    // CSR write
    always @ (posedge clk or negedge resetn) begin
      if (resetn==1'b0) begin
          slverr_wr <= 1'b0;
          csr_dir   <= {P_WIDTH{1'b0}}; // all input
          gpio_out  <= {P_WIDTH{1'b0}}; // all input
          csr_mask  <= {P_WIDTH{1'b1}}; // all masked (i.e., no interrupt)
          csr_edge  <= {P_WIDTH{1'b0}}; // all level
          csr_pol   <= {P_WIDTH{1'b1}}; // all active-high
      end else begin
         slverr_wr <= 1'b0;
         if (wen) begin
             case (waddr[7:0])
             CSRA_DIR    : csr_dir  <= wdata[P_WIDTH-1:0];
             CSRA_OUTPUT : gpio_out <= wdata[P_WIDTH-1:0];
             CSRA_MASK   : csr_mask <= wdata[P_WIDTH-1:0];
             CSRA_EDGE   : csr_edge <= wdata[P_WIDTH-1:0];
             CSRA_POL    : csr_pol  <= wdata[P_WIDTH-1:0];
             default     : begin
                           slverr_wr <= 1'b1;
                           end
             endcase
          end
      end
    end
    //--------------------------------------------------------------------------
    assign interrupt=|(~csr_mask&csr_irq);
    //--------------------------------------------------------------------------
endmodule
//------------------------------------------------------------------------------
// Revision History
//
// 2025.09.10: Started by Ando Ki (andoki@gmail.com)
//------------------------------------------------------------------------------
