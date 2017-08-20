set C_TypeInfoList {{ 
"MatrixMultiply" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"AA": [[], {"array": ["0", [25]]}] }, {"bb": [[], {"array": ["0", [5]]}] }, {"cc": [[], {"array": ["0", [5]]}] }],[],""], 
"0": [ "data_type", {"typedef": [[[], {"scalar": "int"}],""]}]
}}
set moduleName MatrixMultiply
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {MatrixMultiply}
set C_modelType { void 0 }
set C_modelArgList {
	{ AA_0 int 32 regular {pointer 0}  }
	{ AA_1 int 32 regular {pointer 0}  }
	{ AA_2 int 32 regular {pointer 0}  }
	{ AA_3 int 32 regular {pointer 0}  }
	{ AA_4 int 32 regular {pointer 0}  }
	{ AA_5 int 32 regular {pointer 0}  }
	{ AA_6 int 32 regular {pointer 0}  }
	{ AA_7 int 32 regular {pointer 0}  }
	{ AA_8 int 32 regular {pointer 0}  }
	{ AA_9 int 32 regular {pointer 0}  }
	{ AA_10 int 32 regular {pointer 0}  }
	{ AA_11 int 32 regular {pointer 0}  }
	{ AA_12 int 32 regular {pointer 0}  }
	{ AA_13 int 32 regular {pointer 0}  }
	{ AA_14 int 32 regular {pointer 0}  }
	{ AA_15 int 32 regular {pointer 0}  }
	{ AA_16 int 32 regular {pointer 0}  }
	{ AA_17 int 32 regular {pointer 0}  }
	{ AA_18 int 32 regular {pointer 0}  }
	{ AA_19 int 32 regular {pointer 0}  }
	{ AA_20 int 32 regular {pointer 0}  }
	{ AA_21 int 32 regular {pointer 0}  }
	{ AA_22 int 32 regular {pointer 0}  }
	{ AA_23 int 32 regular {pointer 0}  }
	{ AA_24 int 32 regular {pointer 0}  }
	{ bb_0 int 32 regular {pointer 0}  }
	{ bb_1 int 32 regular {pointer 0}  }
	{ bb_2 int 32 regular {pointer 0}  }
	{ bb_3 int 32 regular {pointer 0}  }
	{ bb_4 int 32 regular {pointer 0}  }
	{ cc_0 int 32 regular {pointer 1}  }
	{ cc_1 int 32 regular {pointer 1}  }
	{ cc_2 int 32 regular {pointer 1}  }
	{ cc_3 int 32 regular {pointer 1}  }
	{ cc_4 int 32 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "AA_0", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "AA","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "AA_1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "AA","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}]} , 
 	{ "Name" : "AA_2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "AA","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]}]} , 
 	{ "Name" : "AA_3", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "AA","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 3,"up" : 3,"step" : 2}]}]}]} , 
 	{ "Name" : "AA_4", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "AA","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 4,"up" : 4,"step" : 2}]}]}]} , 
 	{ "Name" : "AA_5", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "AA","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 5,"up" : 5,"step" : 2}]}]}]} , 
 	{ "Name" : "AA_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "AA","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 6,"up" : 6,"step" : 2}]}]}]} , 
 	{ "Name" : "AA_7", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "AA","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 7,"up" : 7,"step" : 2}]}]}]} , 
 	{ "Name" : "AA_8", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "AA","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 8,"up" : 8,"step" : 2}]}]}]} , 
 	{ "Name" : "AA_9", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "AA","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 9,"up" : 9,"step" : 2}]}]}]} , 
 	{ "Name" : "AA_10", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "AA","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 10,"up" : 10,"step" : 2}]}]}]} , 
 	{ "Name" : "AA_11", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "AA","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 11,"up" : 11,"step" : 2}]}]}]} , 
 	{ "Name" : "AA_12", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "AA","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 12,"up" : 12,"step" : 2}]}]}]} , 
 	{ "Name" : "AA_13", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "AA","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 13,"up" : 13,"step" : 2}]}]}]} , 
 	{ "Name" : "AA_14", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "AA","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 14,"up" : 14,"step" : 2}]}]}]} , 
 	{ "Name" : "AA_15", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "AA","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 15,"up" : 15,"step" : 2}]}]}]} , 
 	{ "Name" : "AA_16", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "AA","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 16,"up" : 16,"step" : 2}]}]}]} , 
 	{ "Name" : "AA_17", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "AA","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 17,"up" : 17,"step" : 2}]}]}]} , 
 	{ "Name" : "AA_18", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "AA","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 18,"up" : 18,"step" : 2}]}]}]} , 
 	{ "Name" : "AA_19", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "AA","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 19,"up" : 19,"step" : 2}]}]}]} , 
 	{ "Name" : "AA_20", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "AA","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 20,"up" : 20,"step" : 2}]}]}]} , 
 	{ "Name" : "AA_21", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "AA","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 21,"up" : 21,"step" : 2}]}]}]} , 
 	{ "Name" : "AA_22", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "AA","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 22,"up" : 22,"step" : 2}]}]}]} , 
 	{ "Name" : "AA_23", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "AA","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 23,"up" : 23,"step" : 2}]}]}]} , 
 	{ "Name" : "AA_24", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "AA","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 24,"up" : 24,"step" : 2}]}]}]} , 
 	{ "Name" : "bb_0", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "bb","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "bb_1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "bb","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}]} , 
 	{ "Name" : "bb_2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "bb","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]}]} , 
 	{ "Name" : "bb_3", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "bb","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 3,"up" : 3,"step" : 2}]}]}]} , 
 	{ "Name" : "bb_4", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "bb","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 4,"up" : 4,"step" : 2}]}]}]} , 
 	{ "Name" : "cc_0", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "cc","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "cc_1", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "cc","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}]} , 
 	{ "Name" : "cc_2", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "cc","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]}]} , 
 	{ "Name" : "cc_3", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "cc","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 3,"up" : 3,"step" : 2}]}]}]} , 
 	{ "Name" : "cc_4", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "cc","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 4,"up" : 4,"step" : 2}]}]}]} ]}
# RTL Port declarations: 
set portNum 46
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ AA_0 sc_in sc_lv 32 signal 0 } 
	{ AA_1 sc_in sc_lv 32 signal 1 } 
	{ AA_2 sc_in sc_lv 32 signal 2 } 
	{ AA_3 sc_in sc_lv 32 signal 3 } 
	{ AA_4 sc_in sc_lv 32 signal 4 } 
	{ AA_5 sc_in sc_lv 32 signal 5 } 
	{ AA_6 sc_in sc_lv 32 signal 6 } 
	{ AA_7 sc_in sc_lv 32 signal 7 } 
	{ AA_8 sc_in sc_lv 32 signal 8 } 
	{ AA_9 sc_in sc_lv 32 signal 9 } 
	{ AA_10 sc_in sc_lv 32 signal 10 } 
	{ AA_11 sc_in sc_lv 32 signal 11 } 
	{ AA_12 sc_in sc_lv 32 signal 12 } 
	{ AA_13 sc_in sc_lv 32 signal 13 } 
	{ AA_14 sc_in sc_lv 32 signal 14 } 
	{ AA_15 sc_in sc_lv 32 signal 15 } 
	{ AA_16 sc_in sc_lv 32 signal 16 } 
	{ AA_17 sc_in sc_lv 32 signal 17 } 
	{ AA_18 sc_in sc_lv 32 signal 18 } 
	{ AA_19 sc_in sc_lv 32 signal 19 } 
	{ AA_20 sc_in sc_lv 32 signal 20 } 
	{ AA_21 sc_in sc_lv 32 signal 21 } 
	{ AA_22 sc_in sc_lv 32 signal 22 } 
	{ AA_23 sc_in sc_lv 32 signal 23 } 
	{ AA_24 sc_in sc_lv 32 signal 24 } 
	{ bb_0 sc_in sc_lv 32 signal 25 } 
	{ bb_1 sc_in sc_lv 32 signal 26 } 
	{ bb_2 sc_in sc_lv 32 signal 27 } 
	{ bb_3 sc_in sc_lv 32 signal 28 } 
	{ bb_4 sc_in sc_lv 32 signal 29 } 
	{ cc_0 sc_out sc_lv 32 signal 30 } 
	{ cc_0_ap_vld sc_out sc_logic 1 outvld 30 } 
	{ cc_1 sc_out sc_lv 32 signal 31 } 
	{ cc_1_ap_vld sc_out sc_logic 1 outvld 31 } 
	{ cc_2 sc_out sc_lv 32 signal 32 } 
	{ cc_2_ap_vld sc_out sc_logic 1 outvld 32 } 
	{ cc_3 sc_out sc_lv 32 signal 33 } 
	{ cc_3_ap_vld sc_out sc_logic 1 outvld 33 } 
	{ cc_4 sc_out sc_lv 32 signal 34 } 
	{ cc_4_ap_vld sc_out sc_logic 1 outvld 34 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "AA_0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AA_0", "role": "default" }} , 
 	{ "name": "AA_1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AA_1", "role": "default" }} , 
 	{ "name": "AA_2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AA_2", "role": "default" }} , 
 	{ "name": "AA_3", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AA_3", "role": "default" }} , 
 	{ "name": "AA_4", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AA_4", "role": "default" }} , 
 	{ "name": "AA_5", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AA_5", "role": "default" }} , 
 	{ "name": "AA_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AA_6", "role": "default" }} , 
 	{ "name": "AA_7", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AA_7", "role": "default" }} , 
 	{ "name": "AA_8", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AA_8", "role": "default" }} , 
 	{ "name": "AA_9", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AA_9", "role": "default" }} , 
 	{ "name": "AA_10", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AA_10", "role": "default" }} , 
 	{ "name": "AA_11", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AA_11", "role": "default" }} , 
 	{ "name": "AA_12", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AA_12", "role": "default" }} , 
 	{ "name": "AA_13", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AA_13", "role": "default" }} , 
 	{ "name": "AA_14", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AA_14", "role": "default" }} , 
 	{ "name": "AA_15", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AA_15", "role": "default" }} , 
 	{ "name": "AA_16", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AA_16", "role": "default" }} , 
 	{ "name": "AA_17", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AA_17", "role": "default" }} , 
 	{ "name": "AA_18", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AA_18", "role": "default" }} , 
 	{ "name": "AA_19", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AA_19", "role": "default" }} , 
 	{ "name": "AA_20", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AA_20", "role": "default" }} , 
 	{ "name": "AA_21", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AA_21", "role": "default" }} , 
 	{ "name": "AA_22", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AA_22", "role": "default" }} , 
 	{ "name": "AA_23", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AA_23", "role": "default" }} , 
 	{ "name": "AA_24", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AA_24", "role": "default" }} , 
 	{ "name": "bb_0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bb_0", "role": "default" }} , 
 	{ "name": "bb_1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bb_1", "role": "default" }} , 
 	{ "name": "bb_2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bb_2", "role": "default" }} , 
 	{ "name": "bb_3", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bb_3", "role": "default" }} , 
 	{ "name": "bb_4", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bb_4", "role": "default" }} , 
 	{ "name": "cc_0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cc_0", "role": "default" }} , 
 	{ "name": "cc_0_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "cc_0", "role": "ap_vld" }} , 
 	{ "name": "cc_1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cc_1", "role": "default" }} , 
 	{ "name": "cc_1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "cc_1", "role": "ap_vld" }} , 
 	{ "name": "cc_2", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cc_2", "role": "default" }} , 
 	{ "name": "cc_2_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "cc_2", "role": "ap_vld" }} , 
 	{ "name": "cc_3", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cc_3", "role": "default" }} , 
 	{ "name": "cc_3_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "cc_3", "role": "ap_vld" }} , 
 	{ "name": "cc_4", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cc_4", "role": "default" }} , 
 	{ "name": "cc_4_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "cc_4", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5"],
		"CDFG" : "MatrixMultiply",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "AlignedPipeline" : "0", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"VariableLatency" : "1",
		"Port" : [
			{"Name" : "AA_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "AA_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "AA_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "AA_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "AA_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "AA_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "AA_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "AA_7", "Type" : "None", "Direction" : "I"},
			{"Name" : "AA_8", "Type" : "None", "Direction" : "I"},
			{"Name" : "AA_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "AA_10", "Type" : "None", "Direction" : "I"},
			{"Name" : "AA_11", "Type" : "None", "Direction" : "I"},
			{"Name" : "AA_12", "Type" : "None", "Direction" : "I"},
			{"Name" : "AA_13", "Type" : "None", "Direction" : "I"},
			{"Name" : "AA_14", "Type" : "None", "Direction" : "I"},
			{"Name" : "AA_15", "Type" : "None", "Direction" : "I"},
			{"Name" : "AA_16", "Type" : "None", "Direction" : "I"},
			{"Name" : "AA_17", "Type" : "None", "Direction" : "I"},
			{"Name" : "AA_18", "Type" : "None", "Direction" : "I"},
			{"Name" : "AA_19", "Type" : "None", "Direction" : "I"},
			{"Name" : "AA_20", "Type" : "None", "Direction" : "I"},
			{"Name" : "AA_21", "Type" : "None", "Direction" : "I"},
			{"Name" : "AA_22", "Type" : "None", "Direction" : "I"},
			{"Name" : "AA_23", "Type" : "None", "Direction" : "I"},
			{"Name" : "AA_24", "Type" : "None", "Direction" : "I"},
			{"Name" : "bb_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "bb_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "bb_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "bb_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "bb_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "cc_0", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "cc_1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "cc_2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "cc_3", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "cc_4", "Type" : "Vld", "Direction" : "O"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.MatrixMultiply_mubkb_U0", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.MatrixMultiply_mubkb_U1", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.MatrixMultiply_mubkb_U2", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.MatrixMultiply_mubkb_U3", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.MatrixMultiply_mubkb_U4", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	MatrixMultiply {
		AA_0 {Type I LastRead 2 FirstWrite -1}
		AA_1 {Type I LastRead 2 FirstWrite -1}
		AA_2 {Type I LastRead 2 FirstWrite -1}
		AA_3 {Type I LastRead 2 FirstWrite -1}
		AA_4 {Type I LastRead 2 FirstWrite -1}
		AA_5 {Type I LastRead 2 FirstWrite -1}
		AA_6 {Type I LastRead 2 FirstWrite -1}
		AA_7 {Type I LastRead 2 FirstWrite -1}
		AA_8 {Type I LastRead 2 FirstWrite -1}
		AA_9 {Type I LastRead 2 FirstWrite -1}
		AA_10 {Type I LastRead 2 FirstWrite -1}
		AA_11 {Type I LastRead 2 FirstWrite -1}
		AA_12 {Type I LastRead 2 FirstWrite -1}
		AA_13 {Type I LastRead 2 FirstWrite -1}
		AA_14 {Type I LastRead 2 FirstWrite -1}
		AA_15 {Type I LastRead 2 FirstWrite -1}
		AA_16 {Type I LastRead 2 FirstWrite -1}
		AA_17 {Type I LastRead 2 FirstWrite -1}
		AA_18 {Type I LastRead 2 FirstWrite -1}
		AA_19 {Type I LastRead 2 FirstWrite -1}
		AA_20 {Type I LastRead 2 FirstWrite -1}
		AA_21 {Type I LastRead 2 FirstWrite -1}
		AA_22 {Type I LastRead 2 FirstWrite -1}
		AA_23 {Type I LastRead 2 FirstWrite -1}
		AA_24 {Type I LastRead 2 FirstWrite -1}
		bb_0 {Type I LastRead 3 FirstWrite -1}
		bb_1 {Type I LastRead 3 FirstWrite -1}
		bb_2 {Type I LastRead 3 FirstWrite -1}
		bb_3 {Type I LastRead 3 FirstWrite -1}
		bb_4 {Type I LastRead 3 FirstWrite -1}
		cc_0 {Type O LastRead -1 FirstWrite 6}
		cc_1 {Type O LastRead -1 FirstWrite 6}
		cc_2 {Type O LastRead -1 FirstWrite 6}
		cc_3 {Type O LastRead -1 FirstWrite 6}
		cc_4 {Type O LastRead -1 FirstWrite 6}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "31", "Max" : "31"}
	, {"Name" : "Interval", "Min" : "32", "Max" : "32"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	AA_0 { ap_none {  { AA_0 in_data 0 32 } } }
	AA_1 { ap_none {  { AA_1 in_data 0 32 } } }
	AA_2 { ap_none {  { AA_2 in_data 0 32 } } }
	AA_3 { ap_none {  { AA_3 in_data 0 32 } } }
	AA_4 { ap_none {  { AA_4 in_data 0 32 } } }
	AA_5 { ap_none {  { AA_5 in_data 0 32 } } }
	AA_6 { ap_none {  { AA_6 in_data 0 32 } } }
	AA_7 { ap_none {  { AA_7 in_data 0 32 } } }
	AA_8 { ap_none {  { AA_8 in_data 0 32 } } }
	AA_9 { ap_none {  { AA_9 in_data 0 32 } } }
	AA_10 { ap_none {  { AA_10 in_data 0 32 } } }
	AA_11 { ap_none {  { AA_11 in_data 0 32 } } }
	AA_12 { ap_none {  { AA_12 in_data 0 32 } } }
	AA_13 { ap_none {  { AA_13 in_data 0 32 } } }
	AA_14 { ap_none {  { AA_14 in_data 0 32 } } }
	AA_15 { ap_none {  { AA_15 in_data 0 32 } } }
	AA_16 { ap_none {  { AA_16 in_data 0 32 } } }
	AA_17 { ap_none {  { AA_17 in_data 0 32 } } }
	AA_18 { ap_none {  { AA_18 in_data 0 32 } } }
	AA_19 { ap_none {  { AA_19 in_data 0 32 } } }
	AA_20 { ap_none {  { AA_20 in_data 0 32 } } }
	AA_21 { ap_none {  { AA_21 in_data 0 32 } } }
	AA_22 { ap_none {  { AA_22 in_data 0 32 } } }
	AA_23 { ap_none {  { AA_23 in_data 0 32 } } }
	AA_24 { ap_none {  { AA_24 in_data 0 32 } } }
	bb_0 { ap_none {  { bb_0 in_data 0 32 } } }
	bb_1 { ap_none {  { bb_1 in_data 0 32 } } }
	bb_2 { ap_none {  { bb_2 in_data 0 32 } } }
	bb_3 { ap_none {  { bb_3 in_data 0 32 } } }
	bb_4 { ap_none {  { bb_4 in_data 0 32 } } }
	cc_0 { ap_vld {  { cc_0 out_data 1 32 }  { cc_0_ap_vld out_vld 1 1 } } }
	cc_1 { ap_vld {  { cc_1 out_data 1 32 }  { cc_1_ap_vld out_vld 1 1 } } }
	cc_2 { ap_vld {  { cc_2 out_data 1 32 }  { cc_2_ap_vld out_vld 1 1 } } }
	cc_3 { ap_vld {  { cc_3 out_data 1 32 }  { cc_3_ap_vld out_vld 1 1 } } }
	cc_4 { ap_vld {  { cc_4 out_data 1 32 }  { cc_4_ap_vld out_vld 1 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
