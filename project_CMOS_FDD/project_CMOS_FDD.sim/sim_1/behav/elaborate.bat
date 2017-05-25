@echo off
set xv_path=E:\\ProgramFiles\\Vivado\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 8cfd04959db3464c83b0b99fb3e5308e -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot Teset4Vadj_behav xil_defaultlib.Teset4Vadj xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
