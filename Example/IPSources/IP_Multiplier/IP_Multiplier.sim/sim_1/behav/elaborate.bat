@echo off
set xv_path=E:\\ProgramFiles\\Vivado\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 31a3e2e94d8242d8bcfd34901c183754 -m64 --debug typical --relax --mt 2 -L xbip_utils_v3_0_7 -L xbip_pipe_v3_0_3 -L xbip_bram18k_v3_0_3 -L mult_gen_v12_0_12 -L xil_defaultlib -L secureip -L xpm --snapshot mutiplier_simulation_behav xil_defaultlib.mutiplier_simulation -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
