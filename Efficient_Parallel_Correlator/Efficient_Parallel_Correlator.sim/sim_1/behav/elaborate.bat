@echo off
set xv_path=E:\\ProgramFiles\\Vivado\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto c550850a50b541588c470d1d6a374ccd -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot Golay_128_sim_behav xil_defaultlib.Golay_128_sim -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
