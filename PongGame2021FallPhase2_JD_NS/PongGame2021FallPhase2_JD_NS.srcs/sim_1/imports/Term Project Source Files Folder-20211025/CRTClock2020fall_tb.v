`timescale 1ns / 1ps
//ECE433 Fall 2020
module CRTClock2020fall_tb;

	reg [9:0] SystemClock, CRTclock;
	reg Reset, Clock;

	wire pixelclock;
//module CRTClock2020fall #(parameter SystemClockSize=10)(
//input [SystemClockSize-1:0] SystemClockFreq, CRTClockFreq, 
//input Reset, Clock,
//output reg PixelClock);

	CRTClock2020Template uut (SystemClock, CRTclock, Reset, Clock, pixelclock);

	initial begin SystemClock = 100; CRTclock=25; Reset = 0; Clock = 0; end
 
	initial fork
	#0 Reset=1; #20 Reset=0;
	#800 $stop;
	join
	always #4 Clock=~Clock;   
endmodule

