############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_unroll "MatrixMultiply/MatrixMultiply_label0"
set_directive_array_partition -type complete -dim 1 "MatrixMultiply" AA
set_directive_array_partition -type complete -dim 1 "MatrixMultiply" bb
set_directive_array_partition -type complete -dim 1 "MatrixMultiply" cc
