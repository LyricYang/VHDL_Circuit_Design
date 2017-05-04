@echo off
rem  Vivado(TM)
rem  compile.bat: a Vivado-generated XSim simulation Script
rem  Copyright 1986-1999, 2001-2013 Xilinx, Inc. All Rights Reserved.

set PATH=%XILINX%\lib\%PLATFORM%;%XILINX%\bin\%PLATFORM%;D:/vivado/SDK/2013.3/bin/nt;D:/vivado/Vivado/2013.3/ids_lite/EDK/bin/nt;D:/vivado/Vivado/2013.3/ids_lite/EDK/lib/nt;D:/vivado/Vivado/2013.3/ids_lite/ISE/bin/nt;D:/vivado/Vivado/2013.3/ids_lite/ISE/lib/nt;D:/vivado/Vivado/2013.3/bin;%PATH%
set XILINX_PLANAHEAD=D:/vivado/Vivado/2013.3

xelab -m32 --debug typical --relax -L work -L secureip --snapshot Correlator_64_test_behav --prj D:/vivado_project/Correlator/Correlator.sim/sim_1/behav/Correlator_64_test.prj   work.Correlator_64_test
if errorlevel 1 (
   cmd /c exit /b %errorlevel%
)
