
################################################################
# This is a generated script based on design: design_gpio_axi_lite
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2021.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_gpio_axi_lite_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# axi4_to_lite, gpio_axi_lite

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project -force ${PROJECT_NAME} ${PROJECT_DIR} -part ${PART}
  #set_property BOARD_PART ${BOARD_PART} [current_project]
}

set_property  ip_repo_paths "../bfm_axi.z7" [current_project]
update_ip_catalog -rebuild

add_files -norecurse -scan_for_includes ../rtl/verilog/axi4_to_lite.v
add_files -norecurse -scan_for_includes ../rtl/verilog/gpio_axi_lite.v
update_compile_order -fileset sources_1

# CHANGE DESIGN NAME HERE
variable design_name
set design_name ${DESIGN_NAME}

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
future-ds.com:user:bfm_axi_if:1.1\
xilinx.com:ip:clk_wiz:6.0\
xilinx.com:ip:proc_sys_reset:5.0\
xilinx.com:ip:xlconcat:2.1\
xilinx.com:ip:xlslice:1.0\
"

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

##################################################################
# CHECK Modules
##################################################################
set bCheckModules 1
if { $bCheckModules == 1 } {
   set list_check_mods "\ 
axi4_to_lite\
gpio_axi_lite\
"

   set list_mods_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2020 -severity "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2021 -severity "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_gid_msg -ssname BD::TCL -id 2022 -severity "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

if { $bCheckIPsPassed != 1 } {
  common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set BOARD_CLK_IN [ create_bd_port -dir I -type clk -freq_hz 100000000 BOARD_CLK_IN ]
  set BOARD_RST_SW [ create_bd_port -dir I -type rst BOARD_RST_SW ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $BOARD_RST_SW
  set BTND [ create_bd_port -dir I BTND ]
  set BTNL [ create_bd_port -dir I BTNL ]
  set BTNR [ create_bd_port -dir I BTNR ]
  set BTNU [ create_bd_port -dir I BTNU ]
  set LED0 [ create_bd_port -dir O -from 0 -to 0 LED0 ]
  set LED1 [ create_bd_port -dir O -from 0 -to 0 LED1 ]
  set LED2 [ create_bd_port -dir O -from 0 -to 0 LED2 ]
  set LED3 [ create_bd_port -dir O -from 0 -to 0 LED3 ]
  set SL_AD [ create_bd_port -dir O -from 1 -to 0 SL_AD ]
  set SL_CS_N [ create_bd_port -dir O SL_CS_N ]
  set SL_DT [ create_bd_port -dir IO -from 31 -to 0 SL_DT ]
  set SL_FLAGA [ create_bd_port -dir I SL_FLAGA ]
  set SL_FLAGB [ create_bd_port -dir I SL_FLAGB ]
  set SL_FLAGC [ create_bd_port -dir I SL_FLAGC ]
  set SL_FLAGD [ create_bd_port -dir I SL_FLAGD ]
  set SL_MODE [ create_bd_port -dir I -from 1 -to 0 SL_MODE ]
  set SL_OE_N [ create_bd_port -dir O SL_OE_N ]
  set SL_PCLK [ create_bd_port -dir O SL_PCLK ]
  set SL_PKTEND_N [ create_bd_port -dir O SL_PKTEND_N ]
  set SL_RD_N [ create_bd_port -dir O SL_RD_N ]
  set SL_RST_N [ create_bd_port -dir I -type rst SL_RST_N ]
  set SL_WR_N [ create_bd_port -dir O SL_WR_N ]

  # Create instance: axi4_to_lite_0, and set properties
  set block_name axi4_to_lite
  set block_cell_name axi4_to_lite_0
  if { [catch {set axi4_to_lite_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $axi4_to_lite_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: bfm_axi_if_0, and set properties
  set bfm_axi_if_0 [ create_bd_cell -type ip -vlnv future-ds.com:user:bfm_axi_if:1.1 bfm_axi_if_0 ]

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_0 ]
  set_property -dict [ list \
   CONFIG.CLKOUT1_JITTER {137.143} \
   CONFIG.CLKOUT1_PHASE_ERROR {98.575} \
   CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {80} \
   CONFIG.CLKOUT2_JITTER {130.958} \
   CONFIG.CLKOUT2_PHASE_ERROR {98.575} \
   CONFIG.CLKOUT2_USED {true} \
   CONFIG.CLKOUT3_JITTER {127.220} \
   CONFIG.CLKOUT3_PHASE_ERROR {105.461} \
   CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {100.000} \
   CONFIG.CLKOUT3_USED {false} \
   CONFIG.MMCM_CLKFBOUT_MULT_F {10.000} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {12.500} \
   CONFIG.MMCM_CLKOUT1_DIVIDE {10} \
   CONFIG.MMCM_CLKOUT2_DIVIDE {1} \
   CONFIG.NUM_OUT_CLKS {2} \
   CONFIG.USE_RESET {false} \
 ] $clk_wiz_0

  # Create instance: gpio_axi_lite_0, and set properties
  set block_name gpio_axi_lite
  set block_cell_name gpio_axi_lite_0
  if { [catch {set gpio_axi_lite_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $gpio_axi_lite_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.P_WIDTH {4} \
 ] $gpio_axi_lite_0

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list \
   CONFIG.NUM_PORTS {4} \
 ] $xlconcat_0

  # Create instance: xlslice_0, and set properties
  set xlslice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0 ]
  set_property -dict [ list \
   CONFIG.DIN_WIDTH {4} \
 ] $xlslice_0

  # Create instance: xlslice_1, and set properties
  set xlslice_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_1 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {1} \
   CONFIG.DIN_TO {1} \
   CONFIG.DIN_WIDTH {4} \
   CONFIG.DOUT_WIDTH {1} \
 ] $xlslice_1

  # Create instance: xlslice_2, and set properties
  set xlslice_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_2 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {2} \
   CONFIG.DIN_TO {2} \
   CONFIG.DIN_WIDTH {4} \
   CONFIG.DOUT_WIDTH {1} \
 ] $xlslice_2

  # Create instance: xlslice_3, and set properties
  set xlslice_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_3 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {3} \
   CONFIG.DIN_TO {3} \
   CONFIG.DIN_WIDTH {4} \
   CONFIG.DOUT_WIDTH {1} \
 ] $xlslice_3

  # Create interface connections
  connect_bd_intf_net -intf_net axi4_to_lite_0_m_axil [get_bd_intf_pins axi4_to_lite_0/m_axil] [get_bd_intf_pins gpio_axi_lite_0/s_axi_lite]
  connect_bd_intf_net -intf_net bfm_axi_if_0_m_axi [get_bd_intf_pins axi4_to_lite_0/s_axi] [get_bd_intf_pins bfm_axi_if_0/m_axi]

  # Create port connections
  connect_bd_net -net BOARD_CLK_IN_1 [get_bd_ports BOARD_CLK_IN] [get_bd_pins clk_wiz_0/clk_in1]
  connect_bd_net -net BOARD_RST_SW_1 [get_bd_ports BOARD_RST_SW] [get_bd_pins proc_sys_reset_0/ext_reset_in]
  connect_bd_net -net BTND_1 [get_bd_ports BTND] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net BTNL_1 [get_bd_ports BTNL] [get_bd_pins xlconcat_0/In2]
  connect_bd_net -net BTNR_1 [get_bd_ports BTNR] [get_bd_pins xlconcat_0/In3]
  connect_bd_net -net BTNU_1 [get_bd_ports BTNU] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net Net [get_bd_ports SL_DT] [get_bd_pins bfm_axi_if_0/SL_DT]
  connect_bd_net -net SL_FLAGA_0_1 [get_bd_ports SL_FLAGA] [get_bd_pins bfm_axi_if_0/SL_FLAGA]
  connect_bd_net -net SL_FLAGB_0_1 [get_bd_ports SL_FLAGB] [get_bd_pins bfm_axi_if_0/SL_FLAGB]
  connect_bd_net -net SL_FLAGC_0_1 [get_bd_ports SL_FLAGC] [get_bd_pins bfm_axi_if_0/SL_FLAGC]
  connect_bd_net -net SL_FLAGD_0_1 [get_bd_ports SL_FLAGD] [get_bd_pins bfm_axi_if_0/SL_FLAGD]
  connect_bd_net -net SL_MODE_0_1 [get_bd_ports SL_MODE] [get_bd_pins bfm_axi_if_0/SL_MODE]
  connect_bd_net -net SL_RST_N_0_1 [get_bd_ports SL_RST_N] [get_bd_pins bfm_axi_if_0/SL_RST_N]
  connect_bd_net -net bfm_axi_if_0_GPOUT [get_bd_pins bfm_axi_if_0/GPIN] [get_bd_pins bfm_axi_if_0/GPOUT]
  connect_bd_net -net bfm_axi_if_0_SL_AD [get_bd_ports SL_AD] [get_bd_pins bfm_axi_if_0/SL_AD]
  connect_bd_net -net bfm_axi_if_0_SL_CS_N [get_bd_ports SL_CS_N] [get_bd_pins bfm_axi_if_0/SL_CS_N]
  connect_bd_net -net bfm_axi_if_0_SL_OE_N [get_bd_ports SL_OE_N] [get_bd_pins bfm_axi_if_0/SL_OE_N]
  connect_bd_net -net bfm_axi_if_0_SL_PCLK [get_bd_ports SL_PCLK] [get_bd_pins bfm_axi_if_0/SL_PCLK]
  connect_bd_net -net bfm_axi_if_0_SL_PKTEND_N [get_bd_ports SL_PKTEND_N] [get_bd_pins bfm_axi_if_0/SL_PKTEND_N]
  connect_bd_net -net bfm_axi_if_0_SL_RD_N [get_bd_ports SL_RD_N] [get_bd_pins bfm_axi_if_0/SL_RD_N]
  connect_bd_net -net bfm_axi_if_0_SL_WR_N [get_bd_ports SL_WR_N] [get_bd_pins bfm_axi_if_0/SL_WR_N]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins bfm_axi_if_0/SYS_CLK] [get_bd_pins clk_wiz_0/clk_out1]
  connect_bd_net -net clk_wiz_0_clk_out2 [get_bd_pins axi4_to_lite_0/axi_aclk] [get_bd_pins axi4_to_lite_0/axil_aclk] [get_bd_pins bfm_axi_if_0/m_axi_aclk] [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins gpio_axi_lite_0/aclk] [get_bd_pins proc_sys_reset_0/slowest_sync_clk]
  connect_bd_net -net clk_wiz_0_locked [get_bd_pins bfm_axi_if_0/SYS_CLK_STABLE] [get_bd_pins clk_wiz_0/locked] [get_bd_pins proc_sys_reset_0/dcm_locked]
  connect_bd_net -net gpio_axi_lite_0_gpio_out [get_bd_pins gpio_axi_lite_0/gpio_out] [get_bd_pins xlslice_0/Din] [get_bd_pins xlslice_1/Din] [get_bd_pins xlslice_2/Din] [get_bd_pins xlslice_3/Din]
  connect_bd_net -net proc_sys_reset_0_interconnect_aresetn [get_bd_pins axi4_to_lite_0/axi_aresetn] [get_bd_pins axi4_to_lite_0/axil_aresetn] [get_bd_pins proc_sys_reset_0/interconnect_aresetn]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins bfm_axi_if_0/m_axi_aresetn] [get_bd_pins gpio_axi_lite_0/aresetn] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins bfm_axi_if_0/SYS_RST_N] [get_bd_pins proc_sys_reset_0/aux_reset_in]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins gpio_axi_lite_0/gpio_in] [get_bd_pins xlconcat_0/dout]
  connect_bd_net -net xlslice_0_Dout [get_bd_ports LED0] [get_bd_pins xlslice_0/Dout]
  connect_bd_net -net xlslice_1_Dout [get_bd_ports LED1] [get_bd_pins xlslice_1/Dout]
  connect_bd_net -net xlslice_2_Dout [get_bd_ports LED2] [get_bd_pins xlslice_2/Dout]
  connect_bd_net -net xlslice_3_Dout [get_bd_ports LED3] [get_bd_pins xlslice_3/Dout]

  # Create address segments
  assign_bd_address -offset 0xC0050000 -range 0x00002000 -target_address_space [get_bd_addr_spaces axi4_to_lite_0/m_axil] [get_bd_addr_segs gpio_axi_lite_0/s_axi_lite/reg0] -force
  assign_bd_address -offset 0x00000000 -range 0x000100000000 -target_address_space [get_bd_addr_spaces bfm_axi_if_0/m_axi] [get_bd_addr_segs axi4_to_lite_0/s_axi/reg0] -force


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


common::send_gid_msg -ssname BD::TCL -id 2053 -severity "WARNING" "This Tcl script was generated from a block design that has not been validated. It is possible that design <$design_name> may result in errors during validation."

