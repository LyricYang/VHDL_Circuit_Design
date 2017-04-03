
[
 Attempting to get a license: %s
78*common2"
Implementation2default:defaultZ17-78
Q
Feature available: %s
81*common2"
Implementation2default:defaultZ17-81
É
+Loading parts and site information from %s
36*device2?
+D:/vivado/Vivado/2013.3/data/parts/arch.xml2default:defaultZ21-36
ê
!Parsing RTL primitives file [%s]
14*netlist2U
AD:/vivado/Vivado/2013.3/data/parts/xilinx/rtl/prims/rtl_prims.xml2default:defaultZ29-14
ô
*Finished parsing RTL primitives file [%s]
11*netlist2U
AD:/vivado/Vivado/2013.3/data/parts/xilinx/rtl/prims/rtl_prims.xml2default:defaultZ29-11
j
Command: %s
53*	vivadotcl2B
.synth_design -top ram -part xc7vx690tffg1157-32default:defaultZ4-113
/

Starting synthesis...

3*	vivadotclZ4-3
ó
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
	xc7vx690t2default:defaultZ17-347
á
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
	xc7vx690t2default:defaultZ17-349
ñ
%s*synth2Ü
rStarting Synthesize : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 328.117 ; gain = 74.992
2default:default
Û
synthesizing module '%s'638*oasys2
ram2default:default2ä
tC:/Users/Administrator/Desktop/VHDL_Circuit_Design-master/Chapter_6/pro6_5_ram/pro6_5_ram.srcs/sources_1/new/ram.vhd2default:default2
442default:default8@Z8-638
P
%s*synth2A
-	Parameter bits bound to: 8 - type: integer 
2default:default
R
%s*synth2C
/	Parameter words bound to: 16 - type: integer 
2default:default
Æ
%done synthesizing module '%s' (%s#%s)256*oasys2
ram2default:default2
12default:default2
12default:default2ä
tC:/Users/Administrator/Desktop/VHDL_Circuit_Design-master/Chapter_6/pro6_5_ram/pro6_5_ram.srcs/sources_1/new/ram.vhd2default:default2
442default:default8@Z8-256
ñ
%s*synth2Ü
rFinished Synthesize : Time (s): cpu = 00:00:05 ; elapsed = 00:00:05 . Memory (MB): peak = 351.145 ; gain = 98.020
2default:default
ô
%s*synth2â
uStart RTL Optimization : Time (s): cpu = 00:00:05 ; elapsed = 00:00:05 . Memory (MB): peak = 351.145 ; gain = 98.020
2default:default
ú
%s*synth2å
xFinished RTL Optimization : Time (s): cpu = 00:00:05 ; elapsed = 00:00:05 . Memory (MB): peak = 351.145 ; gain = 98.020
2default:default
<
%s*synth2-

Report RTL Partitions: 
2default:default
N
%s*synth2?
++-+--------------+------------+----------+
2default:default
N
%s*synth2?
+| |RTL Partition |Replication |Instances |
2default:default
N
%s*synth2?
++-+--------------+------------+----------+
2default:default
N
%s*synth2?
++-+--------------+------------+----------+
2default:default
û
Loading clock regions from %s
13*device2g
SD:/vivado/Vivado/2013.3/data\parts/xilinx/virtex7/virtex7/xc7vx690t/ClockRegion.xml2default:defaultZ21-13
ü
Loading clock buffers from %s
11*device2h
TD:/vivado/Vivado/2013.3/data\parts/xilinx/virtex7/virtex7/xc7vx690t/ClockBuffers.xml2default:defaultZ21-11
ö
&Loading clock placement rules from %s
318*place2Z
FD:/vivado/Vivado/2013.3/data/parts/xilinx/virtex7/ClockPlacerRules.xml2default:defaultZ30-318
ò
)Loading package pin functions from %s...
17*device2V
BD:/vivado/Vivado/2013.3/data\parts/xilinx/virtex7/PinFunctions.xml2default:defaultZ21-17
ú
Loading package from %s
16*device2k
WD:/vivado/Vivado/2013.3/data\parts/xilinx/virtex7/virtex7/xc7vx690t/ffg1157/Package.xml2default:defaultZ21-16
ç
Loading io standards from %s
15*device2W
CD:/vivado/Vivado/2013.3/data\./parts/xilinx/virtex7/IOStandards.xml2default:defaultZ21-15
ô
+Loading device configuration modes from %s
14*device2U
AD:/vivado/Vivado/2013.3/data\parts/xilinx/virtex7/ConfigModes.xml2default:defaultZ21-14
ë
%s*synth2Å
mPart Resources:
DSPs: 3600 (col length:200)
BRAMs: 2940 (col length: RAMB8 0 RAMB16 0 RAMB18 200 RAMB36 100)
2default:default
±
%s*synth2°
åFinished Loading Part and Timing Information : Time (s): cpu = 00:00:34 ; elapsed = 00:00:34 . Memory (MB): peak = 620.480 ; gain = 367.355
2default:default
B
%s*synth23
Detailed RTL Component Info : 
2default:default
F
%s*synth27
#Hierarchical RTL Component report 
2default:default
/
%s*synth2 
Module ram 
2default:default
B
%s*synth23
Detailed RTL Component Info : 
2default:default
©
%s*synth2ô
ÑFinished Cross Boundary Optimization : Time (s): cpu = 00:00:34 ; elapsed = 00:00:34 . Memory (MB): peak = 620.480 ; gain = 367.355
2default:default
¢
%s*synth2í
~---------------------------------------------------------------------------------
Start RAM, DSP and Shift Register Reporting
2default:default
u
%s*synth2f
R---------------------------------------------------------------------------------
2default:default
6
%s*synth2'

Distributed RAM: 
2default:default
ë
%s*synth2Å
m+------------+------------+--------------------+----------------------+----------------+-------------------+
2default:default
í
%s*synth2Ç
n|Module Name | RTL Object | Inference Criteria | Size (depth X width) | Primitives     | Hierarchical Name | 
2default:default
ë
%s*synth2Å
m+------------+------------+--------------------+----------------------+----------------+-------------------+
2default:default
í
%s*synth2Ç
n|ram         | memory_reg | Implied            | 16 X 8               | RAM16X1S x 8   | ram/ram__4        | 
2default:default
í
%s*synth2Ç
n+------------+------------+--------------------+----------------------+----------------+-------------------+

2default:default
∆
%s*synth2∂
°Note: Mutiple instantiated RAMs are reported only once. "Hierarchical Name" reflects the hierarchical modules names of the RAM and only part of it is displayed.
2default:default
¶
%s*synth2ñ
Å---------------------------------------------------------------------------------
Finished RAM, DSP and Shift Register Reporting
2default:default
u
%s*synth2f
R---------------------------------------------------------------------------------
2default:default
û
%s*synth2é
zFinished Area Optimization : Time (s): cpu = 00:00:34 ; elapsed = 00:00:34 . Memory (MB): peak = 632.992 ; gain = 379.867
2default:default
†
%s*synth2ê
|Finished Timing Optimization : Time (s): cpu = 00:00:34 ; elapsed = 00:00:34 . Memory (MB): peak = 632.992 ; gain = 379.867
2default:default
ü
%s*synth2è
{Finished Technology Mapping : Time (s): cpu = 00:00:34 ; elapsed = 00:00:35 . Memory (MB): peak = 633.000 ; gain = 379.875
2default:default
ô
%s*synth2â
uFinished IO Insertion : Time (s): cpu = 00:00:34 ; elapsed = 00:00:35 . Memory (MB): peak = 633.000 ; gain = 379.875
2default:default
;
%s*synth2,

Report Check Netlist: 
2default:default
l
%s*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:default
l
%s*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:default
l
%s*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:default
l
%s*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:default
l
%s*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:default
™
%s*synth2ö
ÖFinished Renaming Generated Instances : Time (s): cpu = 00:00:34 ; elapsed = 00:00:35 . Memory (MB): peak = 633.000 ; gain = 379.875
2default:default
ß
%s*synth2ó
ÇFinished Rebuilding User Hierarchy : Time (s): cpu = 00:00:34 ; elapsed = 00:00:35 . Memory (MB): peak = 633.000 ; gain = 379.875
2default:default
¢
%s*synth2í
~---------------------------------------------------------------------------------
Start RAM, DSP and Shift Register Reporting
2default:default
u
%s*synth2f
R---------------------------------------------------------------------------------
2default:default
¶
%s*synth2ñ
Å---------------------------------------------------------------------------------
Finished RAM, DSP and Shift Register Reporting
2default:default
u
%s*synth2f
R---------------------------------------------------------------------------------
2default:default
8
%s*synth2)

Report BlackBoxes: 
2default:default
A
%s*synth22
+-+--------------+----------+
2default:default
A
%s*synth22
| |BlackBox name |Instances |
2default:default
A
%s*synth22
+-+--------------+----------+
2default:default
A
%s*synth22
+-+--------------+----------+
2default:default
8
%s*synth2)

Report Cell Usage: 
2default:default
=
%s*synth2.
+------+---------+------+
2default:default
=
%s*synth2.
|      |Cell     |Count |
2default:default
=
%s*synth2.
+------+---------+------+
2default:default
=
%s*synth2.
|1     |BUFG     |     1|
2default:default
=
%s*synth2.
|2     |RAM16X1S |     8|
2default:default
=
%s*synth2.
|3     |IBUF     |    14|
2default:default
=
%s*synth2.
|4     |OBUF     |     8|
2default:default
=
%s*synth2.
+------+---------+------+
2default:default
<
%s*synth2-

Report Instance Areas: 
2default:default
E
%s*synth26
"+------+---------+-------+------+
2default:default
E
%s*synth26
"|      |Instance |Module |Cells |
2default:default
E
%s*synth26
"+------+---------+-------+------+
2default:default
E
%s*synth26
"|1     |top      |       |    31|
2default:default
E
%s*synth26
"+------+---------+-------+------+
2default:default
¶
%s*synth2ñ
ÅFinished Writing Synthesis Report : Time (s): cpu = 00:00:34 ; elapsed = 00:00:35 . Memory (MB): peak = 633.000 ; gain = 379.875
2default:default
i
%s*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 0 warnings.
2default:default
£
%s*synth2ì
Synthesis Optimization Complete : Time (s): cpu = 00:00:34 ; elapsed = 00:00:35 . Memory (MB): peak = 633.000 ; gain = 379.875
2default:default
]
-Analyzing %s Unisim elements for replacement
17*netlist2
222default:defaultZ29-17
a
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28
^
1Inserted %s IBUFs to IO ports without IO buffers.100*opt2
02default:defaultZ31-140
^
1Inserted %s OBUFs to IO ports without IO buffers.101*opt2
02default:defaultZ31-141
C
Pushed %s inverter(s).
98*opt2
02default:defaultZ31-138
_
 Attempting to get a license: %s
78*common2&
Internal_bitstream2default:defaultZ17-78
]
Failed to get a license: %s
295*common2&
Internal_bitstream2default:defaultZ17-301
|
MSuccessfully populated the BRAM INIT strings from the following elf files: %s96*memdata2
 2default:defaultZ28-143
≠
!Unisim Transformation Summary:
%s111*project2q
]  A total of 8 instances were transformed.
  RAM16X1S => RAM16X1S (RAMS32, GND): 8 instances
2default:defaultZ1-111
L
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83
Ω
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
132default:default2
12default:default2
02default:default2
02default:defaultZ4-41
U
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42
¸
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:542default:default2
00:00:562default:default2
958.5042default:default2
661.6092default:defaultZ17-268
<
%Done setting XDC timing constraints.
35*timingZ38-35

sreport_utilization: Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.148 . Memory (MB): peak = 959.508 ; gain = 0.000
*common
w
Exiting %s at %s...
206*common2
Vivado2default:default2,
Mon Apr 03 21:49:35 20172default:defaultZ17-206