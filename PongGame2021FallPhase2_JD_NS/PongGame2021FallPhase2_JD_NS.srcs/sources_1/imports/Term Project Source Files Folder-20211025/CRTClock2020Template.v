`timescale 1ns / 1ps
//File: CRTClock2020Template.v
//Generate 25MHz VGA clock from a SystemClock
//SystemClockFreq and CRTClockFreq are input parameters in MHz
//Nicholas Snow, Jack Davidson
//ECE433-01 Fall 2020
//Term Project on Pong game on VGA
//this is a template to be completed by students

module CRTClock2020Template #(parameter SystemClockSize=10)(
input [SystemClockSize-1:0] SystemClockFreq, CRTClockFreq, 
input Reset, Clock,
output reg PixelClock);

initial PixelClock <= 1;
wire Overflow;


//      a counter is needed to generate PixelClock
//module UniversalCounter2020fall #(parameter	length = 10) (
//input	[length-1:0] P,BeginCount, EndCount, 
//input S1,S0,Reset, CLOCK,
//output 	reg [length-1:0]	Q,
//output reg TerminalCount);
UniversalCounter2020fall pixelClockCounter(.P(10'd0), .BeginCount(10'd0), .EndCount((SystemClockFreq/CRTClockFreq)-1),
 .S1(1'b0), .S0(1'b1), .Reset(Reset), .CLOCK(Clock), .TerminalCount(Overflow));
    
always @(posedge Overflow)
//if(Overflow==1)
//PixelClock =~PixelClock;
PixelClock <= PixelClock ? 0 : 1;
endmodule

