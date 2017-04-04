
[
 Attempting to get a license: %s
78*common2"
Implementation2default:defaultZ17-78
Q
Feature available: %s
81*common2"
Implementation2default:defaultZ17-81
ƒ
+Loading parts and site information from %s
36*device2?
+D:/vivado/Vivado/2013.3/data/parts/arch.xml2default:defaultZ21-36

!Parsing RTL primitives file [%s]
14*netlist2U
AD:/vivado/Vivado/2013.3/data/parts/xilinx/rtl/prims/rtl_prims.xml2default:defaultZ29-14
™
*Finished parsing RTL primitives file [%s]
11*netlist2U
AD:/vivado/Vivado/2013.3/data/parts/xilinx/rtl/prims/rtl_prims.xml2default:defaultZ29-11
n
Command: %s
53*	vivadotcl2F
2synth_design -top my_code -part xc7vx690tffg1157-32default:defaultZ4-113
/

Starting synthesis...

3*	vivadotclZ4-3
—
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
	xc7vx690t2default:defaultZ17-347
‡
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
	xc7vx690t2default:defaultZ17-349
–
%s*synth2†
rStarting Synthesize : Time (s): cpu = 00:00:05 ; elapsed = 00:00:05 . Memory (MB): peak = 327.504 ; gain = 73.996
2default:default
ö
synthesizing module '%s'638*oasys2
my_code2default:default2‰
sC:/Users/Administrator/Desktop/VHDL_Circuit_Design-master/Chapter_10/pro10_2/pro10_2.srcs/sources_1/new/my_code.vhd2default:default2
402default:default8@Z8-638
M
%s*synth2>
*	Parameter n bound to: 2 - type: integer 
2default:default
M
%s*synth2>
*	Parameter n bound to: 2 - type: integer 
2default:default
ˆ
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2

parity_gen2default:default2Š
vC:/Users/Administrator/Desktop/VHDL_Circuit_Design-master/Chapter_10/pro10_2/pro10_2.srcs/sources_1/new/parity_gen.vhd2default:default2
342default:default2
C12default:default2

parity_gen2default:default2‰
sC:/Users/Administrator/Desktop/VHDL_Circuit_Design-master/Chapter_10/pro10_2/pro10_2.srcs/sources_1/new/my_code.vhd2default:default2
472default:default8@Z8-3491
ü
synthesizing module '%s'638*oasys2

parity_gen2default:default2Œ
vC:/Users/Administrator/Desktop/VHDL_Circuit_Design-master/Chapter_10/pro10_2/pro10_2.srcs/sources_1/new/parity_gen.vhd2default:default2
402default:default8@Z8-638
M
%s*synth2>
*	Parameter n bound to: 2 - type: integer 
2default:default
·
%done synthesizing module '%s' (%s#%s)256*oasys2

parity_gen2default:default2
12default:default2
12default:default2Œ
vC:/Users/Administrator/Desktop/VHDL_Circuit_Design-master/Chapter_10/pro10_2/pro10_2.srcs/sources_1/new/parity_gen.vhd2default:default2
402default:default8@Z8-256
±
%done synthesizing module '%s' (%s#%s)256*oasys2
my_code2default:default2
22default:default2
12default:default2‰
sC:/Users/Administrator/Desktop/VHDL_Circuit_Design-master/Chapter_10/pro10_2/pro10_2.srcs/sources_1/new/my_code.vhd2default:default2
402default:default8@Z8-256
–
%s*synth2†
rFinished Synthesize : Time (s): cpu = 00:00:06 ; elapsed = 00:00:06 . Memory (MB): peak = 350.586 ; gain = 97.078
2default:default
™
%s*synth2‰
uStart RTL Optimization : Time (s): cpu = 00:00:06 ; elapsed = 00:00:06 . Memory (MB): peak = 350.586 ; gain = 97.078
2default:default
œ
%s*synth2Œ
xFinished RTL Optimization : Time (s): cpu = 00:00:06 ; elapsed = 00:00:07 . Memory (MB): peak = 350.586 ; gain = 97.078
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
ž
Loading clock regions from %s
13*device2g
SD:/vivado/Vivado/2013.3/data\parts/xilinx/virtex7/virtex7/xc7vx690t/ClockRegion.xml2default:defaultZ21-13
Ÿ
Loading clock buffers from %s
11*device2h
TD:/vivado/Vivado/2013.3/data\parts/xilinx/virtex7/virtex7/xc7vx690t/ClockBuffers.xml2default:defaultZ21-11
š
&Loading clock placement rules from %s
318*place2Z
FD:/vivado/Vivado/2013.3/data/parts/xilinx/virtex7/ClockPlacerRules.xml2default:defaultZ30-318
˜
)Loading package pin functions from %s...
17*device2V
BD:/vivado/Vivado/2013.3/data\parts/xilinx/virtex7/PinFunctions.xml2default:defaultZ21-17
œ
Loading package from %s
16*device2k
WD:/vivado/Vivado/2013.3/data\parts/xilinx/virtex7/virtex7/xc7vx690t/ffg1157/Package.xml2default:defaultZ21-16

Loading io standards from %s
15*device2W
CD:/vivado/Vivado/2013.3/data\./parts/xilinx/virtex7/IOStandards.xml2default:defaultZ21-15
™
+Loading device configuration modes from %s
14*device2U
AD:/vivado/Vivado/2013.3/data\parts/xilinx/virtex7/ConfigModes.xml2default:defaultZ21-14
‘
%s*synth2
mPart Resources:
DSPs: 3600 (col length:200)
BRAMs: 2940 (col length: RAMB8 0 RAMB16 0 RAMB18 200 RAMB36 100)
2default:default
±
%s*synth2¡
ŒFinished Loading Part and Timing Information : Time (s): cpu = 00:00:37 ; elapsed = 00:00:39 . Memory (MB): peak = 626.676 ; gain = 373.168
2default:default
B
%s*synth23
Detailed RTL Component Info : 
2default:default
/
%s*synth2 
+---XORs : 
2default:default
Q
%s*synth2B
.	   3 Input      1 Bit         XORs := 1     
2default:default
F
%s*synth27
#Hierarchical RTL Component report 
2default:default
3
%s*synth2$
Module my_code 
2default:default
B
%s*synth23
Detailed RTL Component Info : 
2default:default
6
%s*synth2'
Module parity_gen 
2default:default
B
%s*synth23
Detailed RTL Component Info : 
2default:default
/
%s*synth2 
+---XORs : 
2default:default
Q
%s*synth2B
.	   3 Input      1 Bit         XORs := 1     
2default:default
©
%s*synth2™
„Finished Cross Boundary Optimization : Time (s): cpu = 00:00:37 ; elapsed = 00:00:39 . Memory (MB): peak = 626.688 ; gain = 373.180
2default:default
¢
%s*synth2’
~---------------------------------------------------------------------------------
Start RAM, DSP and Shift Register Reporting
2default:default
u
%s*synth2f
R---------------------------------------------------------------------------------
2default:default
¦
%s*synth2–
---------------------------------------------------------------------------------
Finished RAM, DSP and Shift Register Reporting
2default:default
u
%s*synth2f
R---------------------------------------------------------------------------------
2default:default
ž
%s*synth2Ž
zFinished Area Optimization : Time (s): cpu = 00:00:38 ; elapsed = 00:00:39 . Memory (MB): peak = 638.523 ; gain = 385.016
2default:default
 
%s*synth2
|Finished Timing Optimization : Time (s): cpu = 00:00:38 ; elapsed = 00:00:39 . Memory (MB): peak = 638.523 ; gain = 385.016
2default:default
Ÿ
%s*synth2
{Finished Technology Mapping : Time (s): cpu = 00:00:38 ; elapsed = 00:00:39 . Memory (MB): peak = 638.531 ; gain = 385.023
2default:default
™
%s*synth2‰
uFinished IO Insertion : Time (s): cpu = 00:00:38 ; elapsed = 00:00:40 . Memory (MB): peak = 638.531 ; gain = 385.023
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
ª
%s*synth2š
…Finished Renaming Generated Instances : Time (s): cpu = 00:00:38 ; elapsed = 00:00:40 . Memory (MB): peak = 638.531 ; gain = 385.023
2default:default
§
%s*synth2—
‚Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:38 ; elapsed = 00:00:40 . Memory (MB): peak = 638.531 ; gain = 385.023
2default:default
¢
%s*synth2’
~---------------------------------------------------------------------------------
Start RAM, DSP and Shift Register Reporting
2default:default
u
%s*synth2f
R---------------------------------------------------------------------------------
2default:default
¦
%s*synth2–
---------------------------------------------------------------------------------
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
9
%s*synth2*
+------+-----+------+
2default:default
9
%s*synth2*
|      |Cell |Count |
2default:default
9
%s*synth2*
+------+-----+------+
2default:default
9
%s*synth2*
|1     |LUT3 |     1|
2default:default
9
%s*synth2*
|2     |IBUF |     3|
2default:default
9
%s*synth2*
|3     |OBUF |     4|
2default:default
9
%s*synth2*
+------+-----+------+
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
"|1     |top      |       |     8|
2default:default
E
%s*synth26
"+------+---------+-------+------+
2default:default
¦
%s*synth2–
Finished Writing Synthesis Report : Time (s): cpu = 00:00:38 ; elapsed = 00:00:40 . Memory (MB): peak = 638.531 ; gain = 385.023
2default:default
i
%s*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 0 warnings.
2default:default
£
%s*synth2“
Synthesis Optimization Complete : Time (s): cpu = 00:00:38 ; elapsed = 00:00:40 . Memory (MB): peak = 638.531 ; gain = 385.023
2default:default
\
-Analyzing %s Unisim elements for replacement
17*netlist2
32default:defaultZ29-17
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
u
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111
L
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83
½
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
162default:default2
12default:default2
02default:default2
02default:defaultZ4-41
U
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42
ü
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:592default:default2
00:01:022default:default2
964.7502default:default2
668.5082default:defaultZ17-268
<
%Done setting XDC timing constraints.
35*timingZ38-35

sreport_utilization: Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.142 . Memory (MB): peak = 964.750 ; gain = 0.000
*common
w
Exiting %s at %s...
206*common2
Vivado2default:default2,
Tue Apr 04 21:39:51 20172default:defaultZ17-206