@echo off
set xv_path=D:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto 8cfd04959db3464c83b0b99fb3e5308e -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot Test4In_behav xil_defaultlib.Test4In xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
