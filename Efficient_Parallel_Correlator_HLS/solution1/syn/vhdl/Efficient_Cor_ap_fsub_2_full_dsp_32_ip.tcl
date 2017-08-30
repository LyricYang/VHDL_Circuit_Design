Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-------------------------------------------------------------------------------------------------------------
| Tool Version : Vivado v.2015.2.1 (win64) Build 1302555 Wed Aug  5 13:06:02 MDT 2015
| Date         : Thu Sep 08 10:59:47 2016
| Host         : user-PC running 64-bit Service Pack 1  (build 7601)
| Command      : report_utilization -file INTF_FIFO_utilization_synth.rpt -pb INTF_FIFO_utilization_synth.pb
| Design       : INTF_FIFO
| Device       : xc7a200t
| Design State : Synthesized
-------------------------------------------------------------------------------------------------------------

Utilization Design Information

Table of Contents
-----------------
1. Slice Logic
1.1 Summary of Registers by Type
2. Memory
3. DSP
4. IO and GT Specific
5. Clocking
6. Specific Feature
7. Primitives
8. Black Boxes
9. Instantiated Netlists

1. Slice Logic
--------------

+-------------------------+------+-------+-----------+-------+
|        Site Type        | Used | Fixed | Available | Util% |
+-------------------------+------+-------+-----------+-------+
| Slice LUTs*             |   32 |     0 |    134600 |  0.02 |
|   LUT as Logic          |   32 |     0 |    134600 |  0.02 |
|   LUT as Memory         |    0 |     0 |     46200 |  0.00 |
| Slice Registers         |   75 |     0 |    269200 |  0.03 |
|   Register as Flip Flop |   75 |     0 |    269200 |  0.03 |
|   Register as Latch     |    0 |     0 |    269200 |  0.00 |
| F7 Muxes                |    0 |     0 |     67300 |  0.00 |
| F8 Muxes                |    0 |     0 |     33650 |  0.00 |
+-------------------------+------+-------+-----------+-------+
* Warning! The Final LUT count, after physical optimizations and full implementation, is typically lower. Run opt_design after synthesis, if not already completed, for a more realistic count.


1.1 Summary of Registers by Type
--------------------------------

+-------+--------------+-------------+--------------+
| Total | Clock Enable | Synchronous | Asynchronous |
+-------+--------------+-------------+--------------+
| 0     |            _ |           - |            - |
| 0     |            _ |           - |          Set |
| 0     |            _ |           - |        Reset |
| 0     |            _ |         Set |            - |
| 0     |            _ |       Reset |            - |
| 0     |          Yes |           - |            - |
| 21    |          Yes |           - |          Set |
| 50    |   