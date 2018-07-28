# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xczu9eg-ffvb1156-2-i-es2

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /scratch/xbrbbot/yocto/2018.1/bsps/xilinx-zcu102-zu9-es2-rev1.0-2018.1/hw_proj/xilinx-zcu102-zu9-es2-rev1.0-2018.1/xilinx-zcu102-zu9-es2-rev1.0-2018.1.cache/wt [current_project]
set_property parent.project_path /scratch/xbrbbot/yocto/2018.1/bsps/xilinx-zcu102-zu9-es2-rev1.0-2018.1/hw_proj/xilinx-zcu102-zu9-es2-rev1.0-2018.1/xilinx-zcu102-zu9-es2-rev1.0-2018.1.xpr [current_project]
set_property XPM_LIBRARIES {XPM_FIFO XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part xilinx.com:zcu102_es2:part0:2.4 [current_project]
set_property ip_output_repo /scratch/xbrbbot/yocto/2018.1/bsps/xilinx-zcu102-zu9-es2-rev1.0-2018.1/hw_proj/xilinx-zcu102-zu9-es2-rev1.0-2018.1/xilinx-zcu102-zu9-es2-rev1.0-2018.1.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib /scratch/xbrbbot/yocto/2018.1/bsps/xilinx-zcu102-zu9-es2-rev1.0-2018.1/hw_proj/xilinx-zcu102-zu9-es2-rev1.0-2018.1/xilinx-zcu102-zu9-es2-rev1.0-2018.1.srcs/sources_1/imports/hdl/zcu102_es2_wrapper.v
add_files /scratch/xbrbbot/yocto/2018.1/bsps/xilinx-zcu102-zu9-es2-rev1.0-2018.1/hw_proj/xilinx-zcu102-zu9-es2-rev1.0-2018.1/xilinx-zcu102-zu9-es2-rev1.0-2018.1.srcs/sources_1/bd/zcu102_es2/zcu102_es2.bd
set_property used_in_implementation false [get_files -all /scratch/xbrbbot/yocto/2018.1/bsps/xilinx-zcu102-zu9-es2-rev1.0-2018.1/hw_proj/xilinx-zcu102-zu9-es2-rev1.0-2018.1/xilinx-zcu102-zu9-es2-rev1.0-2018.1.srcs/sources_1/bd/zcu102_es2/ip/zcu102_es2_zynq_ultra_ps_e_1_0/zcu102_es2_zynq_ultra_ps_e_1_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /scratch/xbrbbot/yocto/2018.1/bsps/xilinx-zcu102-zu9-es2-rev1.0-2018.1/hw_proj/xilinx-zcu102-zu9-es2-rev1.0-2018.1/xilinx-zcu102-zu9-es2-rev1.0-2018.1.srcs/sources_1/bd/zcu102_es2/ip/zcu102_es2_zynq_ultra_ps_e_1_0/zcu102_es2_zynq_ultra_ps_e_1_0.xdc]
set_property used_in_implementation false [get_files -all /scratch/xbrbbot/yocto/2018.1/bsps/xilinx-zcu102-zu9-es2-rev1.0-2018.1/hw_proj/xilinx-zcu102-zu9-es2-rev1.0-2018.1/xilinx-zcu102-zu9-es2-rev1.0-2018.1.srcs/sources_1/bd/zcu102_es2/zcu102_es2_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc /scratch/xbrbbot/yocto/2018.1/bsps/xilinx-zcu102-zu9-es2-rev1.0-2018.1/hw_proj/xilinx-zcu102-zu9-es2-rev1.0-2018.1/xilinx-zcu102-zu9-es2-rev1.0-2018.1.srcs/constrs_1/new/xilinx-zcu102-zu9-es2-rev1.0-2018.1.xdc
set_property used_in_implementation false [get_files /scratch/xbrbbot/yocto/2018.1/bsps/xilinx-zcu102-zu9-es2-rev1.0-2018.1/hw_proj/xilinx-zcu102-zu9-es2-rev1.0-2018.1/xilinx-zcu102-zu9-es2-rev1.0-2018.1.srcs/constrs_1/new/xilinx-zcu102-zu9-es2-rev1.0-2018.1.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top zcu102_es2_wrapper -part xczu9eg-ffvb1156-2-i-es2


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef zcu102_es2_wrapper.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file zcu102_es2_wrapper_utilization_synth.rpt -pb zcu102_es2_wrapper_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
