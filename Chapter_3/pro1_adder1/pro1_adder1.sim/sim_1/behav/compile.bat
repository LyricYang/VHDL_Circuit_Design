@echo off
rem  Vivado(TM)
rem  compile.bat: a Vivado-generated XSim simulation Script
rem  Copyright 1986-1999, 2001-2013 Xilinx, Inc. All Rights Reserved.

set PATH=%XILINX%\lib\%PLATFORM%;%XILINX%\bin\%PLATFORM%;D:/vivado/SDK/2013.3/bin/nt;D:/vivado/Vivado/2013.3/ids_lite/EDK/bin/nt;D:/vivado/Vivado/2013.3/ids_lite/EDK/lib/nt;D:/vivado/Vivado/2013.3/ids_lite/ISE/bin/nt;D:/vivado/Vivado/2013.3/ids_lite/ISE/lib/nt;D:/vivado/Vivado/2013.3/bin;%PATH%
set XILINX_PLANAHEAD=D:/vivado/Vivado/2013.3

xelab -m32 --debug typical --relax -L work -L secureip --snapshot adder2_simulation_behav --prj C:/Users/Administrator/Desktop/VHDL_Circuit_Design-master/Chapter_3/pro1_adder1/pro1_adder1.sim/sim_1/behav/adder2_simulation.prj   work.adder2_simulation
if errorlevel 1 (
   cmd /c exit /b %errorlevel%
)
