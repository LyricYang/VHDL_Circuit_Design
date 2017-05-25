@echo off
set xv_path=D:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xsim Test4Tx2Rx_behav -key {Behavioral:DATA_INTF_TX2RX:Functional:Test4Tx2Rx} -tclbatch Test4Tx2Rx.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
