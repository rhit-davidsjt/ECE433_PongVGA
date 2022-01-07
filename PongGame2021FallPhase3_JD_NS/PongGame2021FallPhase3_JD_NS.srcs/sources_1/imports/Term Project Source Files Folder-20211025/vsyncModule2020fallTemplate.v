`timescale 1ns / 1ps
//File: vsyncModule2020fallTemplate.v
//To be completed by students. Add your name and date after you have revised this file
//Author: Nicholas Snow and Jack Davidson
//Date: October 28, 2020
//ECE433 Fall 2020
//The line increment is synchronized with the hsync pulse
//synch pulse is generated at the end of the line: Active Video-BackPorch-SynchPulse-FrontPorch
//this is how it is done by the video timer of the pong game
//LineEnd and FrameEnd are ANDed to restart frame

//Author: Nicholas Snow and Jack Davidson
//CM 513 and CM 3127
//Date Started: October 27, 2021
//Date Finished: November 1, 2021
//Purpose: ECE-433-01 Final Project
//Module Name: Final Project: Vysnc Module
//Type: Verilog Behaviorial File 

module vsyncModule2021fall#(parameter yresolution=10)(
input [yresolution-1:0] SynchPulse, BackPorch, ActiveVideo, FrontPorch, 
input LineEnd, reset, clock,
output vsync, output reg [yresolution-1:0] yposition);

wire [yresolution-1:0] ycount;
wire [yresolution-1:0] EndCount=SynchPulse+FrontPorch+ActiveVideo+BackPorch;

//vsync <= ~(ypos==490 || ypos==491);  // active for 95 clocks
//SynchPulse piece would need to be changed if we want to attempt other resolutions
assign vsync = ~(ycount == ActiveVideo + FrontPorch + (SynchPulse-1) || ycount == ActiveVideo + FrontPorch + (SynchPulse));
//a counter is needed to generate synch signal and y coordinate
//to be completed by students

//assign LineEnd=ycount==EndCount;
ClockedNegativeOneShot LineEndOneShotUnit(LineEnd, reset, clock, LineEndOneShot);
//module UniversalCounter2020fall #(parameter	length = 10) (
//input	[length-1:0] P,BeginCount, EndCount, 
//input S1,S0,Reset, CLOCK,
//output 	reg [length-1:0]	Q,
//output reg TerminalCount);
UniversalCounter2020fall YPositionCounter(10'd0,10'd0,EndCount, ycount==EndCount && LineEndOneShot, LineEndOneShot || ycount==EndCount, reset, clock, ycount, );

always @(*) yposition <= ycount;
endmodule 
