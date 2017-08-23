////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.64
//  \   \         Application: netgen
//  /   /         Filename: Accumulator.v
// /___/   /\     Timestamp: Wed Apr 10 15:35:12 2013
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog /home/joshg/Labs/IP/2013_1/my_lab/tmp/_cg/Accumulator.ngc /home/joshg/Labs/IP/2013_1/my_lab/tmp/_cg/Accumulator.v 
// Device	: 7k70tfbg484-3
// Input file	: /home/joshg/Labs/IP/2013_1/my_lab/tmp/_cg/Accumulator.ngc
// Output file	: /home/joshg/Labs/IP/2013_1/my_lab/tmp/_cg/Accumulator.v
// # of Modules	: 1
// Design Name	: Accumulator
// Xilinx        : /build/xfndry/P.64/rtf/
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module Accumulator (
  clk, ce, sclr, b, q
)/* synthesis syn_black_box syn_noprune=1 */;
  input clk;
  input ce;
  input sclr;
  input [15 : 0] b;
  output [31 : 0] q;
  
  // synthesis translate_off
  
  wire \blk00000001/sig000000d2 ;
  wire \blk00000001/sig000000d1 ;
  wire \blk00000001/sig000000d0 ;
  wire \blk00000001/sig000000cf ;
  wire \blk00000001/sig000000ce ;
  wire \blk00000001/sig000000cd ;
  wire \blk00000001/sig000000cc ;
  wire \blk00000001/sig000000cb ;
  wire \blk00000001/sig000000ca ;
  wire \blk00000001/sig000000c9 ;
  wire \blk00000001/sig000000c8 ;
  wire \blk00000001/sig000000c7 ;
  wire \blk00000001/sig000000c6 ;
  wire \blk00000001/sig000000c5 ;
  wire \blk00000001/sig000000c4 ;
  wire \blk00000001/sig000000c3 ;
  wire \blk00000001/sig000000c2 ;
  wire \blk00000001/sig000000c1 ;
  wire \blk00000001/sig000000c0 ;
  wire \blk00000001/sig000000bf ;
  wire \blk00000001/sig000000be ;
  wire \blk00000001/sig000000bd ;
  wire \blk00000001/sig000000bc ;
  wire \blk00000001/sig000000bb ;
  wire \blk00000001/sig000000ba ;
  wire \blk00000001/sig000000b9 ;
  wire \blk00000001/sig000000b8 ;
  wire \blk00000001/sig000000b7 ;
  wire \blk00000001/sig000000b6 ;
  wire \blk00000001/sig000000b5 ;
  wire \blk00000001/sig000000b4 ;
  wire \blk00000001/sig000000b3 ;
  wire \blk00000001/sig000000b2 ;
  wire \blk00000001/sig000000b1 ;
  wire \blk00000001/sig000000b0 ;
  wire \blk00000001/sig000000af ;
  wire \blk00000001/sig000000ae ;
  wire \blk00000001/sig000000ad ;
  wire \blk00000001/sig000000ac ;
  wire \blk00000001/sig000000ab ;
  wire \blk00000001/sig000000aa ;
  wire \blk00000001/sig000000a9 ;
  wire \blk00000001/sig000000a8 ;
  wire \blk00000001/sig000000a7 ;
  wire \blk00000001/sig000000a6 ;
  wire \blk00000001/sig000000a5 ;
  wire \blk00000001/sig000000a4 ;
  wire \blk00000001/sig000000a3 ;
  wire \blk00000001/sig000000a2 ;
  wire \blk00000001/sig000000a1 ;
  wire \blk00000001/sig000000a0 ;
  wire \blk00000001/sig0000009f ;
  wire \blk00000001/sig0000009e ;
  wire \blk00000001/sig0000009d ;
  wire \blk00000001/sig0000009c ;
  wire \blk00000001/sig0000009b ;
  wire \blk00000001/sig0000009a ;
  wire \blk00000001/sig00000099 ;
  wire \blk00000001/sig00000098 ;
  wire \blk00000001/sig00000097 ;
  wire \blk00000001/sig00000096 ;
  wire \blk00000001/sig00000095 ;
  wire \blk00000001/sig00000094 ;
  wire \blk00000001/sig00000093 ;
  wire \blk00000001/sig00000092 ;
  wire \blk00000001/sig00000091 ;
  wire \blk00000001/sig00000090 ;
  wire \blk00000001/sig0000008f ;
  wire \blk00000001/sig0000008e ;
  wire \blk00000001/sig0000008d ;
  wire \blk00000001/sig0000008c ;
  wire \blk00000001/sig0000008b ;
  wire \blk00000001/sig0000008a ;
  wire \blk00000001/sig00000089 ;
  wire \blk00000001/sig00000088 ;
  wire \blk00000001/sig00000087 ;
  wire \blk00000001/sig00000086 ;
  wire \blk00000001/sig00000085 ;
  wire \blk00000001/sig00000084 ;
  wire \blk00000001/sig00000083 ;
  wire \blk00000001/sig00000082 ;
  wire \blk00000001/sig00000081 ;
  wire \blk00000001/sig00000080 ;
  wire \blk00000001/sig0000007f ;
  wire \blk00000001/sig0000007e ;
  wire \blk00000001/sig0000007d ;
  wire \blk00000001/sig0000007c ;
  wire \blk00000001/sig0000007b ;
  wire \blk00000001/sig0000007a ;
  wire \blk00000001/sig00000079 ;
  wire \blk00000001/sig00000078 ;
  wire \blk00000001/sig00000077 ;
  wire \blk00000001/sig00000076 ;
  wire \blk00000001/sig00000075 ;
  wire \blk00000001/sig00000074 ;
  wire \blk00000001/sig00000073 ;
  wire \blk00000001/sig00000072 ;
  wire \blk00000001/sig00000071 ;
  wire \blk00000001/sig00000070 ;
  wire \blk00000001/sig0000006f ;
  wire \blk00000001/sig0000006e ;
  wire \blk00000001/sig0000006d ;
  wire \blk00000001/sig0000006c ;
  wire \blk00000001/sig0000006b ;
  wire \blk00000001/sig0000006a ;
  wire \blk00000001/sig00000069 ;
  wire \blk00000001/sig00000068 ;
  wire \blk00000001/sig00000067 ;
  wire \blk00000001/sig00000066 ;
  wire \blk00000001/sig00000065 ;
  wire \blk00000001/sig00000064 ;
  wire \blk00000001/sig00000063 ;
  wire \blk00000001/sig00000062 ;
  wire \blk00000001/sig00000061 ;
  wire \blk00000001/sig00000060 ;
  wire \blk00000001/sig0000005f ;
  wire \blk00000001/sig0000005e ;
  wire \blk00000001/sig0000005d ;
  wire \blk00000001/sig0000005c ;
  wire \blk00000001/sig0000005b ;
  wire \blk00000001/sig0000005a ;
  wire \blk00000001/sig00000059 ;
  wire \blk00000001/sig00000058 ;
  wire \blk00000001/sig00000057 ;
  wire \blk00000001/sig00000056 ;
  wire \blk00000001/sig00000055 ;
  wire \blk00000001/sig00000054 ;
  wire \blk00000001/sig00000053 ;
  wire \blk00000001/sig00000052 ;
  wire \blk00000001/sig00000051 ;
  wire \blk00000001/sig00000050 ;
  wire \blk00000001/sig0000004f ;
  wire \blk00000001/sig0000004e ;
  wire \blk00000001/sig0000004d ;
  wire \blk00000001/sig0000004c ;
  wire \blk00000001/sig0000004b ;
  wire \blk00000001/sig0000004a ;
  wire \blk00000001/sig00000049 ;
  wire \blk00000001/sig00000048 ;
  wire \blk00000001/sig00000047 ;
  wire \blk00000001/sig00000046 ;
  wire \blk00000001/sig00000045 ;
  wire \blk00000001/sig00000044 ;
  wire \blk00000001/sig00000043 ;
  wire \blk00000001/sig00000042 ;
  wire \blk00000001/sig00000041 ;
  wire \blk00000001/sig00000040 ;
  wire \blk00000001/sig0000003f ;
  wire \blk00000001/sig0000003e ;
  wire \blk00000001/sig0000003d ;
  wire \blk00000001/sig0000003c ;
  wire \blk00000001/sig0000003b ;
  wire \blk00000001/sig0000003a ;
  wire \blk00000001/sig00000039 ;
  wire \blk00000001/sig00000038 ;
  wire \blk00000001/sig00000037 ;
  wire \blk00000001/sig00000036 ;
  wire \blk00000001/sig00000035 ;
  wire \blk00000001/sig00000034 ;
  wire [31 : 22] NlwRenamedSig_OI_q;
  assign
    q[31] = NlwRenamedSig_OI_q[31],
    q[30] = NlwRenamedSig_OI_q[30],
    q[29] = NlwRenamedSig_OI_q[29],
    q[28] = NlwRenamedSig_OI_q[28],
    q[27] = NlwRenamedSig_OI_q[27],
    q[26] = NlwRenamedSig_OI_q[26],
    q[25] = NlwRenamedSig_OI_q[25],
    q[24] = NlwRenamedSig_OI_q[24],
    q[23] = NlwRenamedSig_OI_q[23],
    q[22] = NlwRenamedSig_OI_q[22];
  INV   \blk00000001/blk000000c0  (
    .I(\blk00000001/sig000000c7 ),
    .O(\blk00000001/sig00000065 )
  );
  INV   \blk00000001/blk000000bf  (
    .I(\blk00000001/sig000000b5 ),
    .O(\blk00000001/sig0000004d )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000be  (
    .C(clk),
    .CE(ce),
    .D(b[11]),
    .R(sclr),
    .Q(\blk00000001/sig000000b6 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000bd  (
    .C(clk),
    .CE(ce),
    .D(b[12]),
    .R(sclr),
    .Q(\blk00000001/sig000000b7 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000bc  (
    .C(clk),
    .CE(ce),
    .D(b[13]),
    .R(sclr),
    .Q(\blk00000001/sig000000b8 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000bb  (
    .C(clk),
    .CE(ce),
    .D(b[14]),
    .R(sclr),
    .Q(\blk00000001/sig000000b9 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000ba  (
    .C(clk),
    .CE(ce),
    .D(b[15]),
    .R(sclr),
    .Q(\blk00000001/sig000000ba )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000b9  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000aa ),
    .R(sclr),
    .Q(q[11])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000b8  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000ab ),
    .R(sclr),
    .Q(q[12])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000b7  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000ac ),
    .R(sclr),
    .Q(q[13])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000b6  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000ad ),
    .R(sclr),
    .Q(q[14])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000b5  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000ae ),
    .R(sclr),
    .Q(q[15])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000b4  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000af ),
    .R(sclr),
    .Q(q[16])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000b3  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000b0 ),
    .R(sclr),
    .Q(q[17])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000b2  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000b1 ),
    .R(sclr),
    .Q(q[18])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000b1  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000b2 ),
    .R(sclr),
    .Q(q[19])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000b0  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000b3 ),
    .R(sclr),
    .Q(q[20])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000af  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000b4 ),
    .R(sclr),
    .Q(q[21])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000ae  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000bc ),
    .R(sclr),
    .Q(\blk00000001/sig000000c8 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000ad  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000bd ),
    .R(sclr),
    .Q(\blk00000001/sig000000c9 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000ac  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000be ),
    .R(sclr),
    .Q(\blk00000001/sig000000ca )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000ab  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000bf ),
    .R(sclr),
    .Q(\blk00000001/sig000000cb )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000aa  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000c0 ),
    .R(sclr),
    .Q(\blk00000001/sig000000cc )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000a9  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000c1 ),
    .R(sclr),
    .Q(\blk00000001/sig000000cd )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000a8  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000c2 ),
    .R(sclr),
    .Q(\blk00000001/sig000000ce )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000a7  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000c3 ),
    .R(sclr),
    .Q(\blk00000001/sig000000cf )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000a6  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000c4 ),
    .R(sclr),
    .Q(\blk00000001/sig000000d0 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000a5  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000c5 ),
    .R(sclr),
    .Q(\blk00000001/sig000000d1 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000a4  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000c6 ),
    .R(sclr),
    .Q(\blk00000001/sig000000d2 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000a3  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000c8 ),
    .R(sclr),
    .Q(q[0])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000a2  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000c9 ),
    .R(sclr),
    .Q(q[1])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000a1  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000ca ),
    .R(sclr),
    .Q(q[2])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000a0  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000cb ),
    .R(sclr),
    .Q(q[3])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000009f  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000cc ),
    .R(sclr),
    .Q(q[4])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000009e  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000cd ),
    .R(sclr),
    .Q(q[5])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000009d  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000ce ),
    .R(sclr),
    .Q(q[6])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000009c  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000cf ),
    .R(sclr),
    .Q(q[7])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000009b  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000d0 ),
    .R(sclr),
    .Q(q[8])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000009a  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000d1 ),
    .R(sclr),
    .Q(q[9])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000099  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000d2 ),
    .R(sclr),
    .Q(q[10])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000098  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000035 ),
    .R(sclr),
    .Q(\blk00000001/sig000000bb )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000097  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000bb ),
    .R(sclr),
    .Q(\blk00000001/sig0000009f )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000096  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000bb ),
    .R(sclr),
    .Q(\blk00000001/sig000000a0 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000095  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000bb ),
    .R(sclr),
    .Q(\blk00000001/sig000000a1 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000094  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000bb ),
    .R(sclr),
    .Q(\blk00000001/sig000000a2 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000093  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000bb ),
    .R(sclr),
    .Q(\blk00000001/sig000000a3 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000092  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000bb ),
    .R(sclr),
    .Q(\blk00000001/sig000000a4 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000091  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000bb ),
    .R(sclr),
    .Q(\blk00000001/sig000000a5 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000090  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000bb ),
    .R(sclr),
    .Q(\blk00000001/sig000000a6 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000008f  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000bb ),
    .R(sclr),
    .Q(\blk00000001/sig000000a7 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000008e  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000bb ),
    .R(sclr),
    .Q(\blk00000001/sig000000a8 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000008d  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000bb ),
    .R(sclr),
    .Q(\blk00000001/sig000000a9 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000008c  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000092 ),
    .R(sclr),
    .Q(\blk00000001/sig000000bc )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000008b  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000093 ),
    .R(sclr),
    .Q(\blk00000001/sig000000bd )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000008a  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000094 ),
    .R(sclr),
    .Q(\blk00000001/sig000000be )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000089  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000095 ),
    .R(sclr),
    .Q(\blk00000001/sig000000bf )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000088  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000096 ),
    .R(sclr),
    .Q(\blk00000001/sig000000c0 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000087  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000097 ),
    .R(sclr),
    .Q(\blk00000001/sig000000c1 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000086  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000098 ),
    .R(sclr),
    .Q(\blk00000001/sig000000c2 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000085  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000099 ),
    .R(sclr),
    .Q(\blk00000001/sig000000c3 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000084  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000009a ),
    .R(sclr),
    .Q(\blk00000001/sig000000c4 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000083  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000009b ),
    .R(sclr),
    .Q(\blk00000001/sig000000c5 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000082  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000009c ),
    .R(sclr),
    .Q(\blk00000001/sig000000c6 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000081  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000066 ),
    .R(sclr),
    .Q(\blk00000001/sig000000c7 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000080  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000087 ),
    .R(sclr),
    .Q(\blk00000001/sig000000aa )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000007f  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000088 ),
    .R(sclr),
    .Q(\blk00000001/sig000000ab )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000007e  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000089 ),
    .R(sclr),
    .Q(\blk00000001/sig000000ac )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000007d  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000008a ),
    .R(sclr),
    .Q(\blk00000001/sig000000ad )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000007c  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000008b ),
    .R(sclr),
    .Q(\blk00000001/sig000000ae )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000007b  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000008c ),
    .R(sclr),
    .Q(\blk00000001/sig000000af )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000007a  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000008d ),
    .R(sclr),
    .Q(\blk00000001/sig000000b0 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000079  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000008e ),
    .R(sclr),
    .Q(\blk00000001/sig000000b1 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000078  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000008f ),
    .R(sclr),
    .Q(\blk00000001/sig000000b2 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000077  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000090 ),
    .R(sclr),
    .Q(\blk00000001/sig000000b3 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000076  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000091 ),
    .R(sclr),
    .Q(\blk00000001/sig000000b4 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000075  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000004e ),
    .R(sclr),
    .Q(\blk00000001/sig000000b5 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000074  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000007c ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[22])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000073  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000007d ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[23])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000072  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000007e ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[24])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000071  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000007f ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[25])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000070  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000080 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[26])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000006f  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000081 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[27])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000006e  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000082 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[28])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000006d  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000083 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[29])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000006c  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000084 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[30])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000006b  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000085 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[31])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000006a  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000086 ),
    .R(sclr),
    .Q(\blk00000001/sig0000009d )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000069  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000036 ),
    .R(sclr),
    .Q(\blk00000001/sig0000009e )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000068  (
    .I0(b[0]),
    .I1(\blk00000001/sig000000bc ),
    .O(\blk00000001/sig0000007b )
  );
  MUXCY   \blk00000001/blk00000067  (
    .CI(\blk00000001/sig00000035 ),
    .DI(\blk00000001/sig000000bc ),
    .S(\blk00000001/sig0000007b ),
    .O(\blk00000001/sig0000007a )
  );
  XORCY   \blk00000001/blk00000066  (
    .CI(\blk00000001/sig00000035 ),
    .LI(\blk00000001/sig0000007b ),
    .O(\blk00000001/sig00000092 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000065  (
    .I0(b[1]),
    .I1(\blk00000001/sig000000bd ),
    .O(\blk00000001/sig00000079 )
  );
  MUXCY   \blk00000001/blk00000064  (
    .CI(\blk00000001/sig0000007a ),
    .DI(\blk00000001/sig000000bd ),
    .S(\blk00000001/sig00000079 ),
    .O(\blk00000001/sig00000078 )
  );
  XORCY   \blk00000001/blk00000063  (
    .CI(\blk00000001/sig0000007a ),
    .LI(\blk00000001/sig00000079 ),
    .O(\blk00000001/sig00000093 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000062  (
    .I0(b[2]),
    .I1(\blk00000001/sig000000be ),
    .O(\blk00000001/sig00000077 )
  );
  MUXCY   \blk00000001/blk00000061  (
    .CI(\blk00000001/sig00000078 ),
    .DI(\blk00000001/sig000000be ),
    .S(\blk00000001/sig00000077 ),
    .O(\blk00000001/sig00000076 )
  );
  XORCY   \blk00000001/blk00000060  (
    .CI(\blk00000001/sig00000078 ),
    .LI(\blk00000001/sig00000077 ),
    .O(\blk00000001/sig00000094 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000005f  (
    .I0(b[3]),
    .I1(\blk00000001/sig000000bf ),
    .O(\blk00000001/sig00000075 )
  );
  MUXCY   \blk00000001/blk0000005e  (
    .CI(\blk00000001/sig00000076 ),
    .DI(\blk00000001/sig000000bf ),
    .S(\blk00000001/sig00000075 ),
    .O(\blk00000001/sig00000074 )
  );
  XORCY   \blk00000001/blk0000005d  (
    .CI(\blk00000001/sig00000076 ),
    .LI(\blk00000001/sig00000075 ),
    .O(\blk00000001/sig00000095 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000005c  (
    .I0(b[4]),
    .I1(\blk00000001/sig000000c0 ),
    .O(\blk00000001/sig00000073 )
  );
  MUXCY   \blk00000001/blk0000005b  (
    .CI(\blk00000001/sig00000074 ),
    .DI(\blk00000001/sig000000c0 ),
    .S(\blk00000001/sig00000073 ),
    .O(\blk00000001/sig00000072 )
  );
  XORCY   \blk00000001/blk0000005a  (
    .CI(\blk00000001/sig00000074 ),
    .LI(\blk00000001/sig00000073 ),
    .O(\blk00000001/sig00000096 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000059  (
    .I0(b[5]),
    .I1(\blk00000001/sig000000c1 ),
    .O(\blk00000001/sig00000071 )
  );
  MUXCY   \blk00000001/blk00000058  (
    .CI(\blk00000001/sig00000072 ),
    .DI(\blk00000001/sig000000c1 ),
    .S(\blk00000001/sig00000071 ),
    .O(\blk00000001/sig00000070 )
  );
  XORCY   \blk00000001/blk00000057  (
    .CI(\blk00000001/sig00000072 ),
    .LI(\blk00000001/sig00000071 ),
    .O(\blk00000001/sig00000097 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000056  (
    .I0(b[6]),
    .I1(\blk00000001/sig000000c2 ),
    .O(\blk00000001/sig0000006f )
  );
  MUXCY   \blk00000001/blk00000055  (
    .CI(\blk00000001/sig00000070 ),
    .DI(\blk00000001/sig000000c2 ),
    .S(\blk00000001/sig0000006f ),
    .O(\blk00000001/sig0000006e )
  );
  XORCY   \blk00000001/blk00000054  (
    .CI(\blk00000001/sig00000070 ),
    .LI(\blk00000001/sig0000006f ),
    .O(\blk00000001/sig00000098 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000053  (
    .I0(b[7]),
    .I1(\blk00000001/sig000000c3 ),
    .O(\blk00000001/sig0000006d )
  );
  MUXCY   \blk00000001/blk00000052  (
    .CI(\blk00000001/sig0000006e ),
    .DI(\blk00000001/sig000000c3 ),
    .S(\blk00000001/sig0000006d ),
    .O(\blk00000001/sig0000006c )
  );
  XORCY   \blk00000001/blk00000051  (
    .CI(\blk00000001/sig0000006e ),
    .LI(\blk00000001/sig0000006d ),
    .O(\blk00000001/sig00000099 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000050  (
    .I0(b[8]),
    .I1(\blk00000001/sig000000c4 ),
    .O(\blk00000001/sig0000006b )
  );
  MUXCY   \blk00000001/blk0000004f  (
    .CI(\blk00000001/sig0000006c ),
    .DI(\blk00000001/sig000000c4 ),
    .S(\blk00000001/sig0000006b ),
    .O(\blk00000001/sig0000006a )
  );
  XORCY   \blk00000001/blk0000004e  (
    .CI(\blk00000001/sig0000006c ),
    .LI(\blk00000001/sig0000006b ),
    .O(\blk00000001/sig0000009a )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000004d  (
    .I0(b[9]),
    .I1(\blk00000001/sig000000c5 ),
    .O(\blk00000001/sig00000069 )
  );
  MUXCY   \blk00000001/blk0000004c  (
    .CI(\blk00000001/sig0000006a ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig00000069 ),
    .O(\blk00000001/sig00000068 )
  );
  XORCY   \blk00000001/blk0000004b  (
    .CI(\blk00000001/sig0000006a ),
    .LI(\blk00000001/sig00000069 ),
    .O(\blk00000001/sig0000009b )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000004a  (
    .I0(b[10]),
    .I1(\blk00000001/sig000000c6 ),
    .O(\blk00000001/sig00000067 )
  );
  MUXCY   \blk00000001/blk00000049  (
    .CI(\blk00000001/sig00000068 ),
    .DI(\blk00000001/sig000000c6 ),
    .S(\blk00000001/sig00000067 ),
    .O(\blk00000001/sig00000066 )
  );
  XORCY   \blk00000001/blk00000048  (
    .CI(\blk00000001/sig00000068 ),
    .LI(\blk00000001/sig00000067 ),
    .O(\blk00000001/sig0000009c )
  );
  MUXCY   \blk00000001/blk00000047  (
    .CI(\blk00000001/sig00000035 ),
    .DI(\blk00000001/sig00000034 ),
    .S(\blk00000001/sig00000065 ),
    .O(\blk00000001/sig00000064 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000046  (
    .I0(\blk00000001/sig000000aa ),
    .I1(\blk00000001/sig000000b6 ),
    .O(\blk00000001/sig00000063 )
  );
  MUXCY   \blk00000001/blk00000045  (
    .CI(\blk00000001/sig00000064 ),
    .DI(\blk00000001/sig000000aa ),
    .S(\blk00000001/sig00000063 ),
    .O(\blk00000001/sig00000062 )
  );
  XORCY   \blk00000001/blk00000044  (
    .CI(\blk00000001/sig00000064 ),
    .LI(\blk00000001/sig00000063 ),
    .O(\blk00000001/sig00000087 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000043  (
    .I0(\blk00000001/sig000000ab ),
    .I1(\blk00000001/sig000000b7 ),
    .O(\blk00000001/sig00000061 )
  );
  MUXCY   \blk00000001/blk00000042  (
    .CI(\blk00000001/sig00000062 ),
    .DI(\blk00000001/sig000000ab ),
    .S(\blk00000001/sig00000061 ),
    .O(\blk00000001/sig00000060 )
  );
  XORCY   \blk00000001/blk00000041  (
    .CI(\blk00000001/sig00000062 ),
    .LI(\blk00000001/sig00000061 ),
    .O(\blk00000001/sig00000088 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000040  (
    .I0(\blk00000001/sig000000ac ),
    .I1(\blk00000001/sig000000b8 ),
    .O(\blk00000001/sig0000005f )
  );
  MUXCY   \blk00000001/blk0000003f  (
    .CI(\blk00000001/sig00000060 ),
    .DI(\blk00000001/sig000000ac ),
    .S(\blk00000001/sig0000005f ),
    .O(\blk00000001/sig0000005e )
  );
  XORCY   \blk00000001/blk0000003e  (
    .CI(\blk00000001/sig00000060 ),
    .LI(\blk00000001/sig0000005f ),
    .O(\blk00000001/sig00000089 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000003d  (
    .I0(\blk00000001/sig000000ad ),
    .I1(\blk00000001/sig000000b9 ),
    .O(\blk00000001/sig0000005d )
  );
  MUXCY   \blk00000001/blk0000003c  (
    .CI(\blk00000001/sig0000005e ),
    .DI(\blk00000001/sig000000ad ),
    .S(\blk00000001/sig0000005d ),
    .O(\blk00000001/sig0000005c )
  );
  XORCY   \blk00000001/blk0000003b  (
    .CI(\blk00000001/sig0000005e ),
    .LI(\blk00000001/sig0000005d ),
    .O(\blk00000001/sig0000008a )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000003a  (
    .I0(\blk00000001/sig000000ae ),
    .I1(\blk00000001/sig000000ba ),
    .O(\blk00000001/sig0000005b )
  );
  MUXCY   \blk00000001/blk00000039  (
    .CI(\blk00000001/sig0000005c ),
    .DI(\blk00000001/sig000000ae ),
    .S(\blk00000001/sig0000005b ),
    .O(\blk00000001/sig0000005a )
  );
  XORCY   \blk00000001/blk00000038  (
    .CI(\blk00000001/sig0000005c ),
    .LI(\blk00000001/sig0000005b ),
    .O(\blk00000001/sig0000008b )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000037  (
    .I0(\blk00000001/sig000000af ),
    .I1(\blk00000001/sig000000bb ),
    .O(\blk00000001/sig00000059 )
  );
  MUXCY   \blk00000001/blk00000036  (
    .CI(\blk00000001/sig0000005a ),
    .DI(\blk00000001/sig000000af ),
    .S(\blk00000001/sig00000059 ),
    .O(\blk00000001/sig00000058 )
  );
  XORCY   \blk00000001/blk00000035  (
    .CI(\blk00000001/sig0000005a ),
    .LI(\blk00000001/sig00000059 ),
    .O(\blk00000001/sig0000008c )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000034  (
    .I0(\blk00000001/sig000000b0 ),
    .I1(\blk00000001/sig000000bb ),
    .O(\blk00000001/sig00000057 )
  );
  MUXCY   \blk00000001/blk00000033  (
    .CI(\blk00000001/sig00000058 ),
    .DI(\blk00000001/sig000000b0 ),
    .S(\blk00000001/sig00000057 ),
    .O(\blk00000001/sig00000056 )
  );
  XORCY   \blk00000001/blk00000032  (
    .CI(\blk00000001/sig00000058 ),
    .LI(\blk00000001/sig00000057 ),
    .O(\blk00000001/sig0000008d )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000031  (
    .I0(\blk00000001/sig000000b1 ),
    .I1(\blk00000001/sig000000bb ),
    .O(\blk00000001/sig00000055 )
  );
  MUXCY   \blk00000001/blk00000030  (
    .CI(\blk00000001/sig00000056 ),
    .DI(\blk00000001/sig000000b1 ),
    .S(\blk00000001/sig00000055 ),
    .O(\blk00000001/sig00000054 )
  );
  XORCY   \blk00000001/blk0000002f  (
    .CI(\blk00000001/sig00000056 ),
    .LI(\blk00000001/sig00000055 ),
    .O(\blk00000001/sig0000008e )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000002e  (
    .I0(\blk00000001/sig000000b2 ),
    .I1(\blk00000001/sig000000bb ),
    .O(\blk00000001/sig00000053 )
  );
  MUXCY   \blk00000001/blk0000002d  (
    .CI(\blk00000001/sig00000054 ),
    .DI(\blk00000001/sig000000b2 ),
    .S(\blk00000001/sig00000053 ),
    .O(\blk00000001/sig00000052 )
  );
  XORCY   \blk00000001/blk0000002c  (
    .CI(\blk00000001/sig00000054 ),
    .LI(\blk00000001/sig00000053 ),
    .O(\blk00000001/sig0000008f )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000002b  (
    .I0(\blk00000001/sig000000b3 ),
    .I1(\blk00000001/sig000000bb ),
    .O(\blk00000001/sig00000051 )
  );
  MUXCY   \blk00000001/blk0000002a  (
    .CI(\blk00000001/sig00000052 ),
    .DI(\blk00000001/sig000000b3 ),
    .S(\blk00000001/sig00000051 ),
    .O(\blk00000001/sig00000050 )
  );
  XORCY   \blk00000001/blk00000029  (
    .CI(\blk00000001/sig00000052 ),
    .LI(\blk00000001/sig00000051 ),
    .O(\blk00000001/sig00000090 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000028  (
    .I0(\blk00000001/sig000000b4 ),
    .I1(\blk00000001/sig000000bb ),
    .O(\blk00000001/sig0000004f )
  );
  MUXCY   \blk00000001/blk00000027  (
    .CI(\blk00000001/sig00000050 ),
    .DI(\blk00000001/sig000000b4 ),
    .S(\blk00000001/sig0000004f ),
    .O(\blk00000001/sig0000004e )
  );
  XORCY   \blk00000001/blk00000026  (
    .CI(\blk00000001/sig00000050 ),
    .LI(\blk00000001/sig0000004f ),
    .O(\blk00000001/sig00000091 )
  );
  MUXCY   \blk00000001/blk00000025  (
    .CI(\blk00000001/sig00000035 ),
    .DI(\blk00000001/sig00000034 ),
    .S(\blk00000001/sig0000004d ),
    .O(\blk00000001/sig0000004c )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000024  (
    .I0(NlwRenamedSig_OI_q[22]),
    .I1(\blk00000001/sig0000009f ),
    .O(\blk00000001/sig0000004b )
  );
  MUXCY   \blk00000001/blk00000023  (
    .CI(\blk00000001/sig0000004c ),
    .DI(NlwRenamedSig_OI_q[22]),
    .S(\blk00000001/sig0000004b ),
    .O(\blk00000001/sig0000004a )
  );
  XORCY   \blk00000001/blk00000022  (
    .CI(\blk00000001/sig0000004c ),
    .LI(\blk00000001/sig0000004b ),
    .O(\blk00000001/sig0000007c )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000021  (
    .I0(NlwRenamedSig_OI_q[23]),
    .I1(\blk00000001/sig000000a0 ),
    .O(\blk00000001/sig00000049 )
  );
  MUXCY   \blk00000001/blk00000020  (
    .CI(\blk00000001/sig0000004a ),
    .DI(NlwRenamedSig_OI_q[23]),
    .S(\blk00000001/sig00000049 ),
    .O(\blk00000001/sig00000048 )
  );
  XORCY   \blk00000001/blk0000001f  (
    .CI(\blk00000001/sig0000004a ),
    .LI(\blk00000001/sig00000049 ),
    .O(\blk00000001/sig0000007d )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000001e  (
    .I0(NlwRenamedSig_OI_q[24]),
    .I1(\blk00000001/sig000000a1 ),
    .O(\blk00000001/sig00000047 )
  );
  MUXCY   \blk00000001/blk0000001d  (
    .CI(\blk00000001/sig00000048 ),
    .DI(NlwRenamedSig_OI_q[24]),
    .S(\blk00000001/sig00000047 ),
    .O(\blk00000001/sig00000046 )
  );
  XORCY   \blk00000001/blk0000001c  (
    .CI(\blk00000001/sig00000048 ),
    .LI(\blk00000001/sig00000047 ),
    .O(\blk00000001/sig0000007e )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000001b  (
    .I0(NlwRenamedSig_OI_q[25]),
    .I1(\blk00000001/sig000000a2 ),
    .O(\blk00000001/sig00000045 )
  );
  MUXCY   \blk00000001/blk0000001a  (
    .CI(\blk00000001/sig00000046 ),
    .DI(NlwRenamedSig_OI_q[25]),
    .S(\blk00000001/sig00000045 ),
    .O(\blk00000001/sig00000044 )
  );
  XORCY   \blk00000001/blk00000019  (
    .CI(\blk00000001/sig00000046 ),
    .LI(\blk00000001/sig00000045 ),
    .O(\blk00000001/sig0000007f )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000018  (
    .I0(NlwRenamedSig_OI_q[26]),
    .I1(\blk00000001/sig000000a3 ),
    .O(\blk00000001/sig00000043 )
  );
  MUXCY   \blk00000001/blk00000017  (
    .CI(\blk00000001/sig00000044 ),
    .DI(NlwRenamedSig_OI_q[26]),
    .S(\blk00000001/sig00000043 ),
    .O(\blk00000001/sig00000042 )
  );
  XORCY   \blk00000001/blk00000016  (
    .CI(\blk00000001/sig00000044 ),
    .LI(\blk00000001/sig00000043 ),
    .O(\blk00000001/sig00000080 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000015  (
    .I0(NlwRenamedSig_OI_q[27]),
    .I1(\blk00000001/sig000000a4 ),
    .O(\blk00000001/sig00000041 )
  );
  MUXCY   \blk00000001/blk00000014  (
    .CI(\blk00000001/sig00000042 ),
    .DI(NlwRenamedSig_OI_q[27]),
    .S(\blk00000001/sig00000041 ),
    .O(\blk00000001/sig00000040 )
  );
  XORCY   \blk00000001/blk00000013  (
    .CI(\blk00000001/sig00000042 ),
    .LI(\blk00000001/sig00000041 ),
    .O(\blk00000001/sig00000081 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000012  (
    .I0(NlwRenamedSig_OI_q[28]),
    .I1(\blk00000001/sig000000a5 ),
    .O(\blk00000001/sig0000003f )
  );
  MUXCY   \blk00000001/blk00000011  (
    .CI(\blk00000001/sig00000040 ),
    .DI(NlwRenamedSig_OI_q[28]),
    .S(\blk00000001/sig0000003f ),
    .O(\blk00000001/sig0000003e )
  );
  XORCY   \blk00000001/blk00000010  (
    .CI(\blk00000001/sig00000040 ),
    .LI(\blk00000001/sig0000003f ),
    .O(\blk00000001/sig00000082 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000000f  (
    .I0(NlwRenamedSig_OI_q[29]),
    .I1(\blk00000001/sig000000a6 ),
    .O(\blk00000001/sig0000003d )
  );
  MUXCY   \blk00000001/blk0000000e  (
    .CI(\blk00000001/sig0000003e ),
    .DI(NlwRenamedSig_OI_q[29]),
    .S(\blk00000001/sig0000003d ),
    .O(\blk00000001/sig0000003c )
  );
  XORCY   \blk00000001/blk0000000d  (
    .CI(\blk00000001/sig0000003e ),
    .LI(\blk00000001/sig0000003d ),
    .O(\blk00000001/sig00000083 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000000c  (
    .I0(NlwRenamedSig_OI_q[30]),
    .I1(\blk00000001/sig000000a7 ),
    .O(\blk00000001/sig0000003b )
  );
  MUXCY   \blk00000001/blk0000000b  (
    .CI(\blk00000001/sig0000003c ),
    .DI(NlwRenamedSig_OI_q[30]),
    .S(\blk00000001/sig0000003b ),
    .O(\blk00000001/sig0000003a )
  );
  XORCY   \blk00000001/blk0000000a  (
    .CI(\blk00000001/sig0000003c ),
    .LI(\blk00000001/sig0000003b ),
    .O(\blk00000001/sig00000084 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000009  (
    .I0(NlwRenamedSig_OI_q[31]),
    .I1(\blk00000001/sig000000a8 ),
    .O(\blk00000001/sig00000039 )
  );
  MUXCY   \blk00000001/blk00000008  (
    .CI(\blk00000001/sig0000003a ),
    .DI(NlwRenamedSig_OI_q[31]),
    .S(\blk00000001/sig00000039 ),
    .O(\blk00000001/sig00000038 )
  );
  XORCY   \blk00000001/blk00000007  (
    .CI(\blk00000001/sig0000003a ),
    .LI(\blk00000001/sig00000039 ),
    .O(\blk00000001/sig00000085 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000006  (
    .I0(\blk00000001/sig0000009d ),
    .I1(\blk00000001/sig000000a9 ),
    .O(\blk00000001/sig00000037 )
  );
  MUXCY   \blk00000001/blk00000005  (
    .CI(\blk00000001/sig00000038 ),
    .DI(\blk00000001/sig0000009d ),
    .S(\blk00000001/sig00000037 ),
    .O(\blk00000001/sig00000036 )
  );
  XORCY   \blk00000001/blk00000004  (
    .CI(\blk00000001/sig00000038 ),
    .LI(\blk00000001/sig00000037 ),
    .O(\blk00000001/sig00000086 )
  );
  GND   \blk00000001/blk00000003  (
    .G(\blk00000001/sig00000035 )
  );
  VCC   \blk00000001/blk00000002  (
    .P(\blk00000001/sig00000034 )
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
