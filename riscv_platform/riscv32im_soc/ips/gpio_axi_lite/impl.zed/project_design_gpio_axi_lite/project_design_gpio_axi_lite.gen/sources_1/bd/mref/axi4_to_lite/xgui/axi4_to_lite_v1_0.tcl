# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "AXI_WIDTH_ADDR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "AXI_WIDTH_DATA" -parent ${Page_0}
  ipgui::add_param $IPINST -name "AXI_WIDTH_ID" -parent ${Page_0}
  ipgui::add_param $IPINST -name "AXI_WIDTH_STRB" -parent ${Page_0}


}

proc update_PARAM_VALUE.AXI_WIDTH_ADDR { PARAM_VALUE.AXI_WIDTH_ADDR } {
	# Procedure called to update AXI_WIDTH_ADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_WIDTH_ADDR { PARAM_VALUE.AXI_WIDTH_ADDR } {
	# Procedure called to validate AXI_WIDTH_ADDR
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

proc update_PARAM_VALUE.AXI_WIDTH_STRB { PARAM_VALUE.AXI_WIDTH_STRB } {
	# Procedure called to update AXI_WIDTH_STRB when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_WIDTH_STRB { PARAM_VALUE.AXI_WIDTH_STRB } {
	# Procedure called to validate AXI_WIDTH_STRB
	return true
}


proc update_MODELPARAM_VALUE.AXI_WIDTH_ID { MODELPARAM_VALUE.AXI_WIDTH_ID PARAM_VALUE.AXI_WIDTH_ID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_WIDTH_ID}] ${MODELPARAM_VALUE.AXI_WIDTH_ID}
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

