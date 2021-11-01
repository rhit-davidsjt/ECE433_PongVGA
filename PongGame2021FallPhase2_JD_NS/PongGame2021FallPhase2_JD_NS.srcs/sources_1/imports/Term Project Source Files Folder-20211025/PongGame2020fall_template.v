`timescale 1ns / 1ps
///File: PongGame2020fall_template.v
//pong game with new controller template
//ECE433-01 Fall 2020
//Term Project VGA driver template
//Date: October 28, 2020
//the video controller uses synch timings from the pong game
//the system clock should be 100MHz
//the VGA pixel clock is 25MHz
//this is a template for students to complete
//try to match the video_timer
//based on pong from http://www.bigmessowires.com/2009/06/21/fpga-pong/. 

module PongGame2020fall_template(
    input rota, rotb, Reset, Clock, 
    output [3:0] red, green, blue,
    output hsync, vsync
    );

wire [9:0] xpos;
wire [9:0] ypos;

parameter [9:0] NumberofPixels=10'd640, NumberofLines=10'd480;
parameter [9:0] SystemClock=10'd100, CRTClock=10'd25; //MHz 

//module CRTcontroller2020fall #(parameter ResolutionSize=10, SystemClockSize=10) (
//input [SystemClockSize-1:0] SystemClockFreq, CRTClockFreq, input [ResolutionSize-1:0] Xresolution, Yresolution,
//input reset, clock, output hsync, vsync, output [ResolutionSize-1:0] xpos, ypos);

CRTcontroller2020fall VGAdisplay(SystemClock, CRTClock, NumberofPixels, NumberofLines, Reset, Clock, hsync, vsync, xpos, ypos);
	  
//module game2020fall(input clk25, rota, rotb, input [9:0] xpos, ypos,
//output [3:0] red, green, blue);

////change the game module to add your name initials	
game2020fall gameUnit(clock, rota, rotb,xpos, ypos, red, green, blue);
					
endmodule
