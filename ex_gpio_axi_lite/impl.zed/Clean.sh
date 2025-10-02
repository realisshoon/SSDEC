#!/bin/bash

/bin/rm   -f  vivado.jou
/bin/rm   -f  vivado.log
/bin/rm   -f  vivado_*.backup.jou
/bin/rm   -f  vivado_*.backup.log
/bin/rm   -f  hs_err_*.log
/bin/rm   -f  vivado_pid*.str
/bin/rm   -f  vivado_pid*.zip
/bin/rm   -fr .Xil
/bin/rm   -fr hd_visual

/bin/rm -f  design_axi_ddr_wrapper.v

#/bin/rm -f  design_axi_ddr_wrapper.bit
#/bin/rm -f  design_axi_ddr_wrapper.ltx
/bin/rm -f  design_axi_ddr.pdf
/bin/rm -f  AddressMap.cvs AddressMapGui.csv
/bin/rm -fr project_design_axi_ddr
