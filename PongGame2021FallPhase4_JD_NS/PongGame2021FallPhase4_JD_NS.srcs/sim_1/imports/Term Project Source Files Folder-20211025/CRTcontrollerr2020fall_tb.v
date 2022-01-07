`timescale 1ns / 1ps

module CRTcontroller2020fall_tb;

	reg [9:0] Xresolution, Yresolution;
	reg [9:0] SystemClock, CRTClock;
	reg reset, clock;

	wire hsync, vsync;
	wire [9:0] xposition, yposition;
	wire PixelClock=uut.PixelClock;

//module CRTcontroller2019fall #(parameter ResolutionSize=10, SystemClockSize=10) (
//input [SystemClockSize-1:0] SystemClockFreq, CRTClockFreq, input [ResolutionSize-1:0] Xresolution, Yresolution,
//input reset, clock, output hsync, vsync, output [ResolutionSize-1:0] xpos, ypos);
	CRTcontroller2021fall uut (
	SystemClock, CRTClock, Xresolution, Yresolution, reset, clock, hsync, 
	vsync, xposition, yposition);

	initial begin
		// Initialize Inputs
		Xresolution = 8;
		Yresolution = 4;
		SystemClock = 12;
		CRTClock=3;
		reset = 0;
		clock=0;
	end
	always #1 clock=~clock;
	initial fork
	#0 reset=1; 	#5 reset=0; 
   #1200 $stop;
	join
      
endmodule

