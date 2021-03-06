`timescale 1ns / 1ps

module vsyncModule2020fall_tb;

	reg LineEnd, reset, clock;
	reg [9:0] SynchPulse, FrontPorch, ActiveVideo, BackPorch;

	wire vsync;
	wire [9:0] yposition;
//module vsyncModule2019fall #(parameter yresolution=10)(
//input [yresolution-1:0] SynchPulse, FrontPorch, ActiveVideo, BackPorch, 
//input LineEnd, reset, clock,
//output vsync, output [yresolution-1:0] yposition);

	vsyncModule2020fallTemplate uut (SynchPulse, FrontPorch, ActiveVideo, 
	BackPorch, LineEnd, reset, clock, vsync, yposition);
	
	initial begin
		SynchPulse = 2;  BackPorch = 3;  ActiveVideo = 5;
		FrontPorch = 2;   reset = 0; clock = 0;    LineEnd=0; end
	always #1 clock=~clock;
	always #6 LineEnd=~LineEnd;
	initial fork
	#0 reset=1; 	#12 reset=0; 
   #300 $stop;
	join
endmodule

