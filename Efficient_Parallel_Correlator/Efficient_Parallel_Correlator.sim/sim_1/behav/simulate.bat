@echo off
set xv_path=E:\\ProgramFiles\\Vivado\\Vivado\\2016.4\\bin
call %xv_path%/xsim Golay_128_sim_behav -key {Behavioral:sim_1:Functional:Golay_128_sim} -tclbatch Golay_128_sim.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
