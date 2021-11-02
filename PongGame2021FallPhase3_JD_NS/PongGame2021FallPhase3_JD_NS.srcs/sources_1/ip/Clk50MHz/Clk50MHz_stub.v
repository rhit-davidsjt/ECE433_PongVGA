// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Mon Nov  1 21:27:34 2021
// Host        : snownp-stg4 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {c:/Users/snownp/ECE433/Final
//               Project/ECE433_PongVGA/PongGame2021FallPhase3_JD_NS/PongGame2021FallPhase3_JD_NS.srcs/sources_1/ip/Clk50MHz/Clk50MHz_stub.v}
// Design      : Clk50MHz
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module Clk50MHz(Clock50MHz, reset, locked, Clock100MHz)
/* synthesis syn_black_box black_box_pad_pin="Clock50MHz,reset,locked,Clock100MHz" */;
  output Clock50MHz;
  input reset;
  output locked;
  input Clock100MHz;
endmodule
