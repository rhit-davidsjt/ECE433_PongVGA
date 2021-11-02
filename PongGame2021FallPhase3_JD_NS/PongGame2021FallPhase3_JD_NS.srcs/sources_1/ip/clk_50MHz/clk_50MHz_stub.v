// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Tue Oct 26 12:10:25 2021
// Host        : snownp-stg4 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {C:/Users/snownp/ECE433/Final
//               Project/ECE433_PongVGA/PongGame2020fallpahse1_JD_NS/PongGame2020fallpahse1_JD_NS.srcs/sources_1/ip/clk_50MHz/clk_50MHz_stub.v}
// Design      : clk_50MHz
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_50MHz(clk50MHz, locked, clk100MHz)
/* synthesis syn_black_box black_box_pad_pin="clk50MHz,locked,clk100MHz" */;
  output clk50MHz;
  output locked;
  input clk100MHz;
endmodule
