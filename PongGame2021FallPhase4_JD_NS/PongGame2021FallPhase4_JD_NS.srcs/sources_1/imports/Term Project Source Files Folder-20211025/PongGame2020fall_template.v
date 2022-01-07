`timescale 1ns / 1ps
///File: Pong With Sound.v
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

//Author: Nicholas Snow and Jack Davidson
//CM 513 and CM 3127
//Date Started: November 1, 2021
//Date Finished: November 5, 2021
//Purpose: ECE-433-01 Final Prokect
//Module Name: Final Project: Pong Game Top Level
//Type: Verilog Behaviorial File

module PongwithNewFeatures_JD_NS(
    input rotaLeft, rotbLeft, rotaRight, rotbRight, Reset, Clock, playAgainButton, muteSwitch, 
    increasedLeftDifficultySwitch,increasedRightDifficultySwitch,increasedSpeedSwitch,
    output reg [3:0] red, green, blue,
    output hsync, vsync, Speaker, testLED1, testLED2);

wire [9:0] xpos;
wire [9:0] ypos;

parameter [9:0] NumberofPixels=10'd640, NumberofLines=10'd480;
parameter [9:0] SystemClock=10'd100, CRTClock=10'd25; //MHz 


CRTcontroller2021fall VGAdisplay(SystemClock, CRTClock, NumberofPixels, NumberofLines, Reset, Clock, hsync, vsync, xpos, ypos);
	  

wire [3:0] redGame, greenGame, blueGame;
wire [3:0] rightScore, leftScore;


//Game Unit
NewGame_NS_JD gameUnit(Clock, rotaLeft, rotbLeft, rotaRight, rotbRight, playAgainButton, 
increasedLeftDifficultySwitch,increasedRightDifficultySwitch,increasedSpeedSwitch, muteSwitch, Reset, xpos, ypos, 
leftScore, rightScore, redGame, greenGame, blueGame, Speaker, testLED1, testLED2);


//Seven Segment Display Score Module
wire rightDigit;
wire leftDigit;

Seven_Segment_Display_Module rightSevenSegmentDisplay(601,10, xpos, ypos, rightScore, rightDigit);
Seven_Segment_Display_Module leftSevenSegmentDisplay(10,10, xpos, ypos, leftScore, leftDigit);


//Generate the final output
always @(Clock) begin
if(rightDigit || leftDigit)begin
red <= 3'b111;
blue <= 3'b111;
green <= 3'b111;
end

else begin
red <= redGame;
blue <= blueGame;
green <= greenGame;
end
end
					
endmodule

