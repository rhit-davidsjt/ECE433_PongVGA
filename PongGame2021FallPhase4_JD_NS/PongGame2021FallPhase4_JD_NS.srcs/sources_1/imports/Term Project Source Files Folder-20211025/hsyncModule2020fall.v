`timescale 1ns / 1ps
//File: hsyncModule2020fall.v
//Author: Jianjian Song
//Date: October 238, 2020
//to generate hsync signal and x position coordinate for VGA video display
//Rose-Hulman Institute of Technology
//PixelClock provides the reference time for pixel duration
//Restart is not synchronized with PixelClock
//synch pulse is generated at the end of the line: Active Video-BackPorch-SynchPulse-FrontPorch
//this is how it is done by the video timer of the pong game
// x coordinate has to cover the whole line from 0 to 800 for the game module to work

module hsyncModule2020fall #(parameter xresolution=10)(
input [xresolution-1:0] SynchPulse, BackPorch, ActiveVideo,FrontPorch,
input PixelClock, reset, clock,
output hsync, LineEnd, output reg [xresolution-1:0] xposition);

wire [xresolution-1:0] xcount;
//module ClockedNegativeOneShot(
//input InputPulse, Reset, CLOCK,
//output reg OneShot) ;
ClockedNegativeOneShot PixelClockUnit(PixelClock, reset, clock, PixelClockOneShot);
assign LineEnd=xcount==EndCount;	//reset counter
wire [xresolution-1:0] EndCount=SynchPulse+FrontPorch+ActiveVideo+BackPorch;
//synch pulse appears at the end of the line and after front porch to mimic the pong video_timer
//hsync <= ~(xpos > 664 && xpos <= 760);  // active for 95 clocks
assign hsync = ~(xcount>=(ActiveVideo+FrontPorch)&&xcount<=(ActiveVideo+FrontPorch+SynchPulse));
always@(*) 
	xposition<=xcount;	//the game circuit does not work if xposition does not run from 0 to 800. JJS
//module UniversalCounter2020fall #(parameter	length = 10) (
//input	[length-1:0] P,BeginCount, EndCount, 
//input S1,S0,Reset, CLOCK,
//output 	reg [length-1:0]	Q,
//output reg TerminalCount);
UniversalCounter2020fall XPositionCounter(10'd0,10'd0, EndCount, LineEnd,LineEnd||PixelClockOneShot, 
 reset, clock, xcount,   ) ;

endmodule
