@echo off
set xv_path=E:\\ProgramFiles\\Vivado\\Vivado\\2016.4\\bin
call %xv_path%/xsim Teset4Vadj_behav -key {Behavioral:sim_1:Functional:Teset4Vadj} -tclbatch Teset4Vadj.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
