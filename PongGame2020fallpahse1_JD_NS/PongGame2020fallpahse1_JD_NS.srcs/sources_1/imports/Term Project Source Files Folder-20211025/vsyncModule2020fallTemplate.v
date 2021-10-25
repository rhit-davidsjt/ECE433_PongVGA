`timescale 1ns / 1ps
//File: vsyncModule2020fallTemplate.v
//To be completed by students. Add your name and date after you have revised this file
//Author: 
//Date: October 28, 2020
//ECE433 Fall 2020
//The line increment is synchronized with the hsync pulse
//synch pulse is generated at the end of the line: Active Video-BackPorch-SynchPulse-FrontPorch
//this is how it is done by the video timer of the pong game
//LineEnd and FrameEnd are ANDed to restart frame

module vsyncModule2020fallTemplate#(parameter yresolution=10)(
input [yresolution-1:0] SynchPulse, BackPorch, ActiveVideo, FrontPorch, 
input LineEnd, reset, clock,
output vsync, output [yresolution-1:0] yposition);

wire [yresolution-1:0] ycount;


//a counter is needed to generate synch signal and y coordinate
//to be completed by students

endmodule
