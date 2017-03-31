#!/bin/sh
# Vivado(TM)
# compile.sh: Vivado-generated Script for launching XSim application
# Copyright 1986-1999, 2001-2013 Xilinx, Inc. All Rights Reserved.
# 
if [ -z "$PATH" ]; then
  PATH=%XILINX%\lib\%PLATFORM%;%XILINX%\bin\%PLATFORM%:D:/vivado/SDK/2013.3/bin/nt;D:/vivado/Vivado/2013.3/ids_lite/EDK/bin/nt;D:/vivado/Vivado/2013.3/ids_lite/EDK/lib/nt;D:/vivado/Vivado/2013.3/ids_lite/ISE/bin/nt;D:/vivado/Vivado/2013.3/ids_lite/ISE/lib/nt
else
  PATH=%XILINX%\lib\%PLATFORM%;%XILINX%\bin\%PLATFORM%:D:/vivado/SDK/2013.3/bin/nt;D:/vivado/Vivado/2013.3/ids_lite/EDK/bin/nt;D:/vivado/Vivado/2013.3/ids_lite/EDK/lib/nt;D:/vivado/Vivado/2013.3/ids_lite/ISE/bin/nt;D:/vivado/Vivado/2013.3/ids_lite/ISE/lib/nt:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=:
else
  LD_LIBRARY_PATH=::$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

#
# Setup env for Xilinx simulation libraries
#
XILINX_PLANAHEAD=D:/vivado/Vivado/2013.3
export XILINX_PLANAHEAD
ExecStep()
{
   "$@"
   RETVAL=$?
   if [ $RETVAL -ne 0 ]
   then
       exit $RETVAL
   fi
}

ExecStep xelab -m32 --debug typical --relax -L work -L secureip --snapshot dff_nand_simulation_behav --prj C:/Users/Administrator/Desktop/VHDL_Circuit_Design/Chapter_2/pro2_2_dff_nand/pro2_2_dff_nand.sim/sim_1/behav/dff_nand_simulation.prj   work.dff_nand_simulation
