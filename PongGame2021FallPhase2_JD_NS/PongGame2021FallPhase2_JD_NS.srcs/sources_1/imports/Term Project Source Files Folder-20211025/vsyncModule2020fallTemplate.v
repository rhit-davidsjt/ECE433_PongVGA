`timescale 1ns / 1ps
//File: vsyncModule2020fallTemplate.v
//To be completed by students. Add your name and date after you have revised this file
//Author: Nicholas Snow and Jack Davidson
//Date: 10/25/2021 - 
//ECE433 Fall 2021
//The line increment is synchronized with the hsync pulse
//synch pulse is generated at the end of the line: Active Video-BackPorch-SynchPulse-FrontPorch
//this is how it is done by the video timer of the pong game
//LineEnd and FrameEnd are ANDed to restart frame

module vsyncModule2020fallTemplate#(parameter yresolution=10)(
input [yresolution-1:0] SynchPulse, BackPorch, ActiveVideo, FrontPorch, 
input LineEnd, reset, clock,
output vsync, output [yresolution-1:0] yposition);

wire [yresolution-1:0] ycount;
//synch pulse appears at the end of the line and after front porch to mimic the pong video_timer
//vsync <= ~(ypos == 490 || ypos == 491);  // active for lines 490 and 491


//a counter is needed to generate synch signal and y coordinate
//to be completed by students

endmodule
