@ECHO OFF

DEL /Q  vivado.jou
DEL /Q  vivado.log
DEL /Q  vivado_*.backup.jou
DEL /Q  vivado_*.backup.log
DEL /Q  hs_err_*.log
DEL /Q  vivado_pid*.str
DEL /Q  vivado_pid*.zip
RMDIR /Q/S .Xil
RMDIR /Q/S hd_visual

DEL /Q  design_axi_ddr_wrapper.v
REM DEL /Q  design_axi_ddr_wrapper.bit
REM DEL /Q  design_axi_ddr_wrapper.ltx
DEL /Q  design_axi_ddr.pdf
DEL /Q  AddressMap.cvs AddressMapGui.csv
DEL /Q/S project_design_axi_ddr
