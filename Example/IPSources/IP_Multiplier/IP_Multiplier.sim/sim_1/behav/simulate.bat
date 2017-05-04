@echo off
set xv_path=E:\\ProgramFiles\\Vivado\\Vivado\\2016.4\\bin
call %xv_path%/xsim mutiplier_simulation_behav -key {Behavioral:sim_1:Functional:mutiplier_simulation} -tclbatch mutiplier_simulation.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
