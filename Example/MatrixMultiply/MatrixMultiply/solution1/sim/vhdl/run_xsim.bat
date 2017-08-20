
call C:/Xilinx/Vivado/2017.1/bin/xelab xil_defaultlib.apatb_MatrixMultiply_top -prj MatrixMultiply.prj -L axi_protocol_checker_v1_1_12 -L axi_protocol_checker_v1_1_13 -L axis_protocol_checker_v1_1_11 -L axis_protocol_checker_v1_1_12 --initfile "C:/Xilinx/Vivado/2017.1/data/xsim/ip/xsim_ip.ini" --lib "ieee_proposed=./ieee_proposed" -s MatrixMultiply -debug wave
call C:/Xilinx/Vivado/2017.1/bin/xsim --noieeewarnings MatrixMultiply -tclbatch MatrixMultiply.tcl

