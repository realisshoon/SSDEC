# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "ACLK_FREQ" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ADDR_GPIO" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ADDR_PERIPHERAL" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ADDR_PIC" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ADDR_TIMER" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ADDR_UART" -parent ${Page_0}
  ipgui::add_param $IPINST -name "AXI_WIDTH_ADDR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "AXI_WIDTH_CID" -parent ${Page_0}
  ipgui::add_param $IPINST -name "AXI_WIDTH_DATA" -parent ${Page_0}
  ipgui::add_param $IPINST -name "AXI_WIDTH_ID" -parent ${Page_0}
  ipgui::add_param $IPINST -name "AXI_WIDTH_SID" -parent ${Page_0}
  ipgui::add_param $IPINST -name "AXI_WIDTH_STRB" -parent ${Page_0}
  ipgui::add_param $IPINST -name "BAUD_RATE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "BOOT_VECTOR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "CORE_ID" -parent ${Page_0}
  ipgui::add_param $IPINST -name "EXTRA_DECODE_STAGE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "IRQ_GPIO" -parent ${Page_0}
  ipgui::add_param $IPINST -name "IRQ_TIMER" -parent ${Page_0}
  ipgui::add_param $IPINST -name "IRQ_UART" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MEM_CACHE_ADDR_MAX" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MEM_CACHE_ADDR_MIN" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MEM_OFFCHIP_ADDR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MEM_OFFCHIP_SIZE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MEM_ONCHIP_ADDR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MEM_ONCHIP_SIZE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "NUM_IRQ" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SIZE_GPIO" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SIZE_PERIPHERAL" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SIZE_PIC" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SIZE_TIMER" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SIZE_UART" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SUPPORT_LOAD_BYPASS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SUPPORT_MMU" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SUPPORT_MULDIV" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SUPPORT_MUL_BYPASS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SUPPORT_REGFILE_XILINX" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SUPPORT_SUPER" -parent ${Page_0}


}

proc update_PARAM_VALUE.ACLK_FREQ { PARAM_VALUE.ACLK_FREQ } {
	# Procedure called to update ACLK_FREQ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ACLK_FREQ { PARAM_VALUE.ACLK_FREQ } {
	# Procedure called to validate ACLK_FREQ
	return true
}

proc update_PARAM_VALUE.ADDR_GPIO { PARAM_VALUE.ADDR_GPIO } {
	# Procedure called to update ADDR_GPIO when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ADDR_GPIO { PARAM_VALUE.ADDR_GPIO } {
	# Procedure called to validate ADDR_GPIO
	return true
}

proc update_PARAM_VALUE.ADDR_PERIPHERAL { PARAM_VALUE.ADDR_PERIPHERAL } {
	# Procedure called to update ADDR_PERIPHERAL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ADDR_PERIPHERAL { PARAM_VALUE.ADDR_PERIPHERAL } {
	# Procedure called to validate ADDR_PERIPHERAL
	return true
}

proc update_PARAM_VALUE.ADDR_PIC { PARAM_VALUE.ADDR_PIC } {
	# Procedure called to update ADDR_PIC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ADDR_PIC { PARAM_VALUE.ADDR_PIC } {
	# Procedure called to validate ADDR_PIC
	return true
}

proc update_PARAM_VALUE.ADDR_TIMER { PARAM_VALUE.ADDR_TIMER } {
	# Procedure called to update ADDR_TIMER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ADDR_TIMER { PARAM_VALUE.ADDR_TIMER } {
	# Procedure called to validate ADDR_TIMER
	return true
}

proc update_PARAM_VALUE.ADDR_UART { PARAM_VALUE.ADDR_UART } {
	# Procedure called to update ADDR_UART when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ADDR_UART { PARAM_VALUE.ADDR_UART } {
	# Procedure called to validate ADDR_UART
	return true
}

proc update_PARAM_VALUE.AXI_WIDTH_ADDR { PARAM_VALUE.AXI_WIDTH_ADDR } {
	# Procedure called to update AXI_WIDTH_ADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_WIDTH_ADDR { PARAM_VALUE.AXI_WIDTH_ADDR } {
	# Procedure called to validate AXI_WIDTH_ADDR
	return true
}

proc update_PARAM_VALUE.AXI_WIDTH_CID { PARAM_VALUE.AXI_WIDTH_CID } {
	# Procedure called to update AXI_WIDTH_CID when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_WIDTH_CID { PARAM_VALUE.AXI_WIDTH_CID } {
	# Procedure called to validate AXI_WIDTH_CID
	return true
}

proc update_PARAM_VALUE.AXI_WIDTH_DATA { PARAM_VALUE.AXI_WIDTH_DATA } {
	# Procedure called to update AXI_WIDTH_DATA when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_WIDTH_DATA { PARAM_VALUE.AXI_WIDTH_DATA } {
	# Procedure called to validate AXI_WIDTH_DATA
	return true
}

proc update_PARAM_VALUE.AXI_WIDTH_ID { PARAM_VALUE.AXI_WIDTH_ID } {
	# Procedure called to update AXI_WIDTH_ID when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_WIDTH_ID { PARAM_VALUE.AXI_WIDTH_ID } {
	# Procedure called to validate AXI_WIDTH_ID
	return true
}

proc update_PARAM_VALUE.AXI_WIDTH_SID { PARAM_VALUE.AXI_WIDTH_SID } {
	# Procedure called to update AXI_WIDTH_SID when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_WIDTH_SID { PARAM_VALUE.AXI_WIDTH_SID } {
	# Procedure called to validate AXI_WIDTH_SID
	return true
}

proc update_PARAM_VALUE.AXI_WIDTH_STRB { PARAM_VALUE.AXI_WIDTH_STRB } {
	# Procedure called to update AXI_WIDTH_STRB when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_WIDTH_STRB { PARAM_VALUE.AXI_WIDTH_STRB } {
	# Procedure called to validate AXI_WIDTH_STRB
	return true
}

proc update_PARAM_VALUE.BAUD_RATE { PARAM_VALUE.BAUD_RATE } {
	# Procedure called to update BAUD_RATE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BAUD_RATE { PARAM_VALUE.BAUD_RATE } {
	# Procedure called to validate BAUD_RATE
	return true
}

proc update_PARAM_VALUE.BOOT_VECTOR { PARAM_VALUE.BOOT_VECTOR } {
	# Procedure called to update BOOT_VECTOR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BOOT_VECTOR { PARAM_VALUE.BOOT_VECTOR } {
	# Procedure called to validate BOOT_VECTOR
	return true
}

proc update_PARAM_VALUE.CORE_ID { PARAM_VALUE.CORE_ID } {
	# Procedure called to update CORE_ID when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CORE_ID { PARAM_VALUE.CORE_ID } {
	# Procedure called to validate CORE_ID
	return true
}

proc update_PARAM_VALUE.EXTRA_DECODE_STAGE { PARAM_VALUE.EXTRA_DECODE_STAGE } {
	# Procedure called to update EXTRA_DECODE_STAGE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.EXTRA_DECODE_STAGE { PARAM_VALUE.EXTRA_DECODE_STAGE } {
	# Procedure called to validate EXTRA_DECODE_STAGE
	return true
}

proc update_PARAM_VALUE.IRQ_GPIO { PARAM_VALUE.IRQ_GPIO } {
	# Procedure called to update IRQ_GPIO when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IRQ_GPIO { PARAM_VALUE.IRQ_GPIO } {
	# Procedure called to validate IRQ_GPIO
	return true
}

proc update_PARAM_VALUE.IRQ_TIMER { PARAM_VALUE.IRQ_TIMER } {
	# Procedure called to update IRQ_TIMER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IRQ_TIMER { PARAM_VALUE.IRQ_TIMER } {
	# Procedure called to validate IRQ_TIMER
	return true
}

proc update_PARAM_VALUE.IRQ_UART { PARAM_VALUE.IRQ_UART } {
	# Procedure called to update IRQ_UART when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IRQ_UART { PARAM_VALUE.IRQ_UART } {
	# Procedure called to validate IRQ_UART
	return true
}

proc update_PARAM_VALUE.MEM_CACHE_ADDR_MAX { PARAM_VALUE.MEM_CACHE_ADDR_MAX } {
	# Procedure called to update MEM_CACHE_ADDR_MAX when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MEM_CACHE_ADDR_MAX { PARAM_VALUE.MEM_CACHE_ADDR_MAX } {
	# Procedure called to validate MEM_CACHE_ADDR_MAX
	return true
}

proc update_PARAM_VALUE.MEM_CACHE_ADDR_MIN { PARAM_VALUE.MEM_CACHE_ADDR_MIN } {
	# Procedure called to update MEM_CACHE_ADDR_MIN when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MEM_CACHE_ADDR_MIN { PARAM_VALUE.MEM_CACHE_ADDR_MIN } {
	# Procedure called to validate MEM_CACHE_ADDR_MIN
	return true
}

proc update_PARAM_VALUE.MEM_OFFCHIP_ADDR { PARAM_VALUE.MEM_OFFCHIP_ADDR } {
	# Procedure called to update MEM_OFFCHIP_ADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MEM_OFFCHIP_ADDR { PARAM_VALUE.MEM_OFFCHIP_ADDR } {
	# Procedure called to validate MEM_OFFCHIP_ADDR
	return true
}

proc update_PARAM_VALUE.MEM_OFFCHIP_SIZE { PARAM_VALUE.MEM_OFFCHIP_SIZE } {
	# Procedure called to update MEM_OFFCHIP_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MEM_OFFCHIP_SIZE { PARAM_VALUE.MEM_OFFCHIP_SIZE } {
	# Procedure called to validate MEM_OFFCHIP_SIZE
	return true
}

proc update_PARAM_VALUE.MEM_ONCHIP_ADDR { PARAM_VALUE.MEM_ONCHIP_ADDR } {
	# Procedure called to update MEM_ONCHIP_ADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MEM_ONCHIP_ADDR { PARAM_VALUE.MEM_ONCHIP_ADDR } {
	# Procedure called to validate MEM_ONCHIP_ADDR
	return true
}

proc update_PARAM_VALUE.MEM_ONCHIP_SIZE { PARAM_VALUE.MEM_ONCHIP_SIZE } {
	# Procedure called to update MEM_ONCHIP_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MEM_ONCHIP_SIZE { PARAM_VALUE.MEM_ONCHIP_SIZE } {
	# Procedure called to validate MEM_ONCHIP_SIZE
	return true
}

proc update_PARAM_VALUE.NUM_IRQ { PARAM_VALUE.NUM_IRQ } {
	# Procedure called to update NUM_IRQ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_IRQ { PARAM_VALUE.NUM_IRQ } {
	# Procedure called to validate NUM_IRQ
	return true
}

proc update_PARAM_VALUE.SIZE_GPIO { PARAM_VALUE.SIZE_GPIO } {
	# Procedure called to update SIZE_GPIO when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SIZE_GPIO { PARAM_VALUE.SIZE_GPIO } {
	# Procedure called to validate SIZE_GPIO
	return true
}

proc update_PARAM_VALUE.SIZE_PERIPHERAL { PARAM_VALUE.SIZE_PERIPHERAL } {
	# Procedure called to update SIZE_PERIPHERAL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SIZE_PERIPHERAL { PARAM_VALUE.SIZE_PERIPHERAL } {
	# Procedure called to validate SIZE_PERIPHERAL
	return true
}

proc update_PARAM_VALUE.SIZE_PIC { PARAM_VALUE.SIZE_PIC } {
	# Procedure called to update SIZE_PIC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SIZE_PIC { PARAM_VALUE.SIZE_PIC } {
	# Procedure called to validate SIZE_PIC
	return true
}

proc update_PARAM_VALUE.SIZE_TIMER { PARAM_VALUE.SIZE_TIMER } {
	# Procedure called to update SIZE_TIMER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SIZE_TIMER { PARAM_VALUE.SIZE_TIMER } {
	# Procedure called to validate SIZE_TIMER
	return true
}

proc update_PARAM_VALUE.SIZE_UART { PARAM_VALUE.SIZE_UART } {
	# Procedure called to update SIZE_UART when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SIZE_UART { PARAM_VALUE.SIZE_UART } {
	# Procedure called to validate SIZE_UART
	return true
}

proc update_PARAM_VALUE.SUPPORT_LOAD_BYPASS { PARAM_VALUE.SUPPORT_LOAD_BYPASS } {
	# Procedure called to update SUPPORT_LOAD_BYPASS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SUPPORT_LOAD_BYPASS { PARAM_VALUE.SUPPORT_LOAD_BYPASS } {
	# Procedure called to validate SUPPORT_LOAD_BYPASS
	return true
}

proc update_PARAM_VALUE.SUPPORT_MMU { PARAM_VALUE.SUPPORT_MMU } {
	# Procedure called to update SUPPORT_MMU when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SUPPORT_MMU { PARAM_VALUE.SUPPORT_MMU } {
	# Procedure called to validate SUPPORT_MMU
	return true
}

proc update_PARAM_VALUE.SUPPORT_MULDIV { PARAM_VALUE.SUPPORT_MULDIV } {
	# Procedure called to update SUPPORT_MULDIV when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SUPPORT_MULDIV { PARAM_VALUE.SUPPORT_MULDIV } {
	# Procedure called to validate SUPPORT_MULDIV
	return true
}

proc update_PARAM_VALUE.SUPPORT_MUL_BYPASS { PARAM_VALUE.SUPPORT_MUL_BYPASS } {
	# Procedure called to update SUPPORT_MUL_BYPASS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SUPPORT_MUL_BYPASS { PARAM_VALUE.SUPPORT_MUL_BYPASS } {
	# Procedure called to validate SUPPORT_MUL_BYPASS
	return true
}

proc update_PARAM_VALUE.SUPPORT_REGFILE_XILINX { PARAM_VALUE.SUPPORT_REGFILE_XILINX } {
	# Procedure called to update SUPPORT_REGFILE_XILINX when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SUPPORT_REGFILE_XILINX { PARAM_VALUE.SUPPORT_REGFILE_XILINX } {
	# Procedure called to validate SUPPORT_REGFILE_XILINX
	return true
}

proc update_PARAM_VALUE.SUPPORT_SUPER { PARAM_VALUE.SUPPORT_SUPER } {
	# Procedure called to update SUPPORT_SUPER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SUPPORT_SUPER { PARAM_VALUE.SUPPORT_SUPER } {
	# Procedure called to validate SUPPORT_SUPER
	return true
}


proc update_MODELPARAM_VALUE.BOOT_VECTOR { MODELPARAM_VALUE.BOOT_VECTOR PARAM_VALUE.BOOT_VECTOR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BOOT_VECTOR}] ${MODELPARAM_VALUE.BOOT_VECTOR}
}

proc update_MODELPARAM_VALUE.CORE_ID { MODELPARAM_VALUE.CORE_ID PARAM_VALUE.CORE_ID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CORE_ID}] ${MODELPARAM_VALUE.CORE_ID}
}

proc update_MODELPARAM_VALUE.SUPPORT_SUPER { MODELPARAM_VALUE.SUPPORT_SUPER PARAM_VALUE.SUPPORT_SUPER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SUPPORT_SUPER}] ${MODELPARAM_VALUE.SUPPORT_SUPER}
}

proc update_MODELPARAM_VALUE.SUPPORT_MMU { MODELPARAM_VALUE.SUPPORT_MMU PARAM_VALUE.SUPPORT_MMU } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SUPPORT_MMU}] ${MODELPARAM_VALUE.SUPPORT_MMU}
}

proc update_MODELPARAM_VALUE.SUPPORT_MULDIV { MODELPARAM_VALUE.SUPPORT_MULDIV PARAM_VALUE.SUPPORT_MULDIV } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SUPPORT_MULDIV}] ${MODELPARAM_VALUE.SUPPORT_MULDIV}
}

proc update_MODELPARAM_VALUE.SUPPORT_LOAD_BYPASS { MODELPARAM_VALUE.SUPPORT_LOAD_BYPASS PARAM_VALUE.SUPPORT_LOAD_BYPASS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SUPPORT_LOAD_BYPASS}] ${MODELPARAM_VALUE.SUPPORT_LOAD_BYPASS}
}

proc update_MODELPARAM_VALUE.SUPPORT_MUL_BYPASS { MODELPARAM_VALUE.SUPPORT_MUL_BYPASS PARAM_VALUE.SUPPORT_MUL_BYPASS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SUPPORT_MUL_BYPASS}] ${MODELPARAM_VALUE.SUPPORT_MUL_BYPASS}
}

proc update_MODELPARAM_VALUE.SUPPORT_REGFILE_XILINX { MODELPARAM_VALUE.SUPPORT_REGFILE_XILINX PARAM_VALUE.SUPPORT_REGFILE_XILINX } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SUPPORT_REGFILE_XILINX}] ${MODELPARAM_VALUE.SUPPORT_REGFILE_XILINX}
}

proc update_MODELPARAM_VALUE.EXTRA_DECODE_STAGE { MODELPARAM_VALUE.EXTRA_DECODE_STAGE PARAM_VALUE.EXTRA_DECODE_STAGE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.EXTRA_DECODE_STAGE}] ${MODELPARAM_VALUE.EXTRA_DECODE_STAGE}
}

proc update_MODELPARAM_VALUE.MEM_CACHE_ADDR_MIN { MODELPARAM_VALUE.MEM_CACHE_ADDR_MIN PARAM_VALUE.MEM_CACHE_ADDR_MIN } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MEM_CACHE_ADDR_MIN}] ${MODELPARAM_VALUE.MEM_CACHE_ADDR_MIN}
}

proc update_MODELPARAM_VALUE.MEM_CACHE_ADDR_MAX { MODELPARAM_VALUE.MEM_CACHE_ADDR_MAX PARAM_VALUE.MEM_CACHE_ADDR_MAX } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MEM_CACHE_ADDR_MAX}] ${MODELPARAM_VALUE.MEM_CACHE_ADDR_MAX}
}

proc update_MODELPARAM_VALUE.MEM_ONCHIP_ADDR { MODELPARAM_VALUE.MEM_ONCHIP_ADDR PARAM_VALUE.MEM_ONCHIP_ADDR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MEM_ONCHIP_ADDR}] ${MODELPARAM_VALUE.MEM_ONCHIP_ADDR}
}

proc update_MODELPARAM_VALUE.MEM_ONCHIP_SIZE { MODELPARAM_VALUE.MEM_ONCHIP_SIZE PARAM_VALUE.MEM_ONCHIP_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MEM_ONCHIP_SIZE}] ${MODELPARAM_VALUE.MEM_ONCHIP_SIZE}
}

proc update_MODELPARAM_VALUE.MEM_OFFCHIP_ADDR { MODELPARAM_VALUE.MEM_OFFCHIP_ADDR PARAM_VALUE.MEM_OFFCHIP_ADDR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MEM_OFFCHIP_ADDR}] ${MODELPARAM_VALUE.MEM_OFFCHIP_ADDR}
}

proc update_MODELPARAM_VALUE.MEM_OFFCHIP_SIZE { MODELPARAM_VALUE.MEM_OFFCHIP_SIZE PARAM_VALUE.MEM_OFFCHIP_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MEM_OFFCHIP_SIZE}] ${MODELPARAM_VALUE.MEM_OFFCHIP_SIZE}
}

proc update_MODELPARAM_VALUE.ADDR_PERIPHERAL { MODELPARAM_VALUE.ADDR_PERIPHERAL PARAM_VALUE.ADDR_PERIPHERAL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ADDR_PERIPHERAL}] ${MODELPARAM_VALUE.ADDR_PERIPHERAL}
}

proc update_MODELPARAM_VALUE.SIZE_PERIPHERAL { MODELPARAM_VALUE.SIZE_PERIPHERAL PARAM_VALUE.SIZE_PERIPHERAL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SIZE_PERIPHERAL}] ${MODELPARAM_VALUE.SIZE_PERIPHERAL}
}

proc update_MODELPARAM_VALUE.BAUD_RATE { MODELPARAM_VALUE.BAUD_RATE PARAM_VALUE.BAUD_RATE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BAUD_RATE}] ${MODELPARAM_VALUE.BAUD_RATE}
}

proc update_MODELPARAM_VALUE.ACLK_FREQ { MODELPARAM_VALUE.ACLK_FREQ PARAM_VALUE.ACLK_FREQ } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ACLK_FREQ}] ${MODELPARAM_VALUE.ACLK_FREQ}
}

proc update_MODELPARAM_VALUE.ADDR_PIC { MODELPARAM_VALUE.ADDR_PIC PARAM_VALUE.ADDR_PIC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ADDR_PIC}] ${MODELPARAM_VALUE.ADDR_PIC}
}

proc update_MODELPARAM_VALUE.ADDR_TIMER { MODELPARAM_VALUE.ADDR_TIMER PARAM_VALUE.ADDR_TIMER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ADDR_TIMER}] ${MODELPARAM_VALUE.ADDR_TIMER}
}

proc update_MODELPARAM_VALUE.ADDR_UART { MODELPARAM_VALUE.ADDR_UART PARAM_VALUE.ADDR_UART } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ADDR_UART}] ${MODELPARAM_VALUE.ADDR_UART}
}

proc update_MODELPARAM_VALUE.ADDR_GPIO { MODELPARAM_VALUE.ADDR_GPIO PARAM_VALUE.ADDR_GPIO } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ADDR_GPIO}] ${MODELPARAM_VALUE.ADDR_GPIO}
}

proc update_MODELPARAM_VALUE.SIZE_PIC { MODELPARAM_VALUE.SIZE_PIC PARAM_VALUE.SIZE_PIC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SIZE_PIC}] ${MODELPARAM_VALUE.SIZE_PIC}
}

proc update_MODELPARAM_VALUE.SIZE_TIMER { MODELPARAM_VALUE.SIZE_TIMER PARAM_VALUE.SIZE_TIMER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SIZE_TIMER}] ${MODELPARAM_VALUE.SIZE_TIMER}
}

proc update_MODELPARAM_VALUE.SIZE_UART { MODELPARAM_VALUE.SIZE_UART PARAM_VALUE.SIZE_UART } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SIZE_UART}] ${MODELPARAM_VALUE.SIZE_UART}
}

proc update_MODELPARAM_VALUE.SIZE_GPIO { MODELPARAM_VALUE.SIZE_GPIO PARAM_VALUE.SIZE_GPIO } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SIZE_GPIO}] ${MODELPARAM_VALUE.SIZE_GPIO}
}

proc update_MODELPARAM_VALUE.NUM_IRQ { MODELPARAM_VALUE.NUM_IRQ PARAM_VALUE.NUM_IRQ } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_IRQ}] ${MODELPARAM_VALUE.NUM_IRQ}
}

proc update_MODELPARAM_VALUE.IRQ_TIMER { MODELPARAM_VALUE.IRQ_TIMER PARAM_VALUE.IRQ_TIMER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IRQ_TIMER}] ${MODELPARAM_VALUE.IRQ_TIMER}
}

proc update_MODELPARAM_VALUE.IRQ_UART { MODELPARAM_VALUE.IRQ_UART PARAM_VALUE.IRQ_UART } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IRQ_UART}] ${MODELPARAM_VALUE.IRQ_UART}
}

proc update_MODELPARAM_VALUE.IRQ_GPIO { MODELPARAM_VALUE.IRQ_GPIO PARAM_VALUE.IRQ_GPIO } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IRQ_GPIO}] ${MODELPARAM_VALUE.IRQ_GPIO}
}

proc update_MODELPARAM_VALUE.AXI_WIDTH_CID { MODELPARAM_VALUE.AXI_WIDTH_CID PARAM_VALUE.AXI_WIDTH_CID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_WIDTH_CID}] ${MODELPARAM_VALUE.AXI_WIDTH_CID}
}

proc update_MODELPARAM_VALUE.AXI_WIDTH_ID { MODELPARAM_VALUE.AXI_WIDTH_ID PARAM_VALUE.AXI_WIDTH_ID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_WIDTH_ID}] ${MODELPARAM_VALUE.AXI_WIDTH_ID}
}

proc update_MODELPARAM_VALUE.AXI_WIDTH_SID { MODELPARAM_VALUE.AXI_WIDTH_SID PARAM_VALUE.AXI_WIDTH_SID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_WIDTH_SID}] ${MODELPARAM_VALUE.AXI_WIDTH_SID}
}

proc update_MODELPARAM_VALUE.AXI_WIDTH_ADDR { MODELPARAM_VALUE.AXI_WIDTH_ADDR PARAM_VALUE.AXI_WIDTH_ADDR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_WIDTH_ADDR}] ${MODELPARAM_VALUE.AXI_WIDTH_ADDR}
}

proc update_MODELPARAM_VALUE.AXI_WIDTH_DATA { MODELPARAM_VALUE.AXI_WIDTH_DATA PARAM_VALUE.AXI_WIDTH_DATA } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_WIDTH_DATA}] ${MODELPARAM_VALUE.AXI_WIDTH_DATA}
}

proc update_MODELPARAM_VALUE.AXI_WIDTH_STRB { MODELPARAM_VALUE.AXI_WIDTH_STRB PARAM_VALUE.AXI_WIDTH_STRB } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_WIDTH_STRB}] ${MODELPARAM_VALUE.AXI_WIDTH_STRB}
}

