`ifndef SYN_DEFINE_V
`define SYN_DEFNE_V
//-----------------------------------------------------------------------
`undef  SIM
`define SYN
`undef  VCD
`undef  DEBUG
`define RIGOR
//-----------------------------------------------------------------------
`define XILINX
`define CON_FMC    // Keep defined for Block Design compatibility, but FMC XDC is disabled
`define MEMORY_EXTERNAL  // Enable AXI memory interface (connects to internal BRAM in Block Design)
//-----------------------------------------------------------------------
// define board type: ML605, ZC706, SP605, VCU108
`undef  BOARD_SP605
`undef  BOARD_ML605
`undef  BOARD_VCU108
`undef  BOARD_ZC706
`undef  BOARD_ZED
`undef  BOARD_ZCU111
`define BOARD_ZRF8
`undef  BOARD_ULTRAZED

`ifdef  BOARD_ML605
`define FPGA_FAMILY     "VIRTEX6"
`define FPGA_TYPE       v6
`define ISE
`elsif  BOARD_SP605
`define FPGA_FAMILY     "SPARTAN6"
`define FPGA_TYPE       s6
`define ISE
`elsif  BOARD_VCU108
`define FPGA_FAMILY     "VirtexUS"
`define FPGA_TYPE       vus
`define VIVADO
`elsif  BOARD_ZC702
`define FPGA_FAMILY     "ZYNQ7000"
`define FPGA_TYPE       z7
`elsif  BOARD_ZC706
`define FPGA_FAMILY     "ZYNQ7000"
`define FPGA_TYPE       z7
`define VIVADO
`elsif  BOARD_ZED
`define FPGA_FAMILY     "ZYNQ7000"
`define FPGA_TYPE       z7
`define VIVADO
`elsif  BOARD_ZCU111
`define FPGA_FAMILY     "ZynqUSP"
`define FPGA_TYPE       zusp
`define BOARD           zcu111
`define VIVADO
`elsif  BOARD_ZRF8
`define FPGA_FAMILY     "ZynqUSP"
`define FPGA_TYPE       zusp
`define BOARD           zrf8
`define VIVADO
`else
`error BOARD_??? not defined.
`endif
`endif
