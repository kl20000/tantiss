#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/proj/xbuilds/2018.1_0405_1/installs/lin64/SDK/2018.1/bin:/proj/xbuilds/2018.1_0405_1/installs/lin64/Vivado/2018.1/ids_lite/ISE/bin/lin64:/proj/xbuilds/2018.1_0405_1/installs/lin64/Vivado/2018.1/bin
else
  PATH=/proj/xbuilds/2018.1_0405_1/installs/lin64/SDK/2018.1/bin:/proj/xbuilds/2018.1_0405_1/installs/lin64/Vivado/2018.1/ids_lite/ISE/bin/lin64:/proj/xbuilds/2018.1_0405_1/installs/lin64/Vivado/2018.1/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=/proj/xbuilds/2018.1_0405_1/installs/lin64/Vivado/2018.1/ids_lite/ISE/lib/lin64
else
  LD_LIBRARY_PATH=/proj/xbuilds/2018.1_0405_1/installs/lin64/Vivado/2018.1/ids_lite/ISE/lib/lin64:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/scratch/xbrbbot/yocto/2018.1/bsps/xilinx-zcu102-zu9-es2-rev1.0-2018.1/hw_proj/xilinx-zcu102-zu9-es2-rev1.0-2018.1/xilinx-zcu102-zu9-es2-rev1.0-2018.1.runs/synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log zcu102_es2_wrapper.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source zcu102_es2_wrapper.tcl
