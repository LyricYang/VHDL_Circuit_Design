@echo off
set xv_path=D:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xsim Test4Rx_behav -key {Behavioral:DATA_INTF_RX:Functional:Test4Rx} -tclbatch Test4Rx.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
