@echo off
set xv_path=E:\\ProgramFiles\\Vivado\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 9ea9e80469144877bddc56cd821a5811 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot Correlator_64_test_behav xil_defaultlib.Correlator_64_test -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
