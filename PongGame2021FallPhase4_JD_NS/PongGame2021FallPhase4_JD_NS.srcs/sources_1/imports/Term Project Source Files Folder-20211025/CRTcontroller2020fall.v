`timescale 1ns / 1ps
//File Name: CRTcontroller2020fall.v
//Author: Jianjian Song
//Date: October 28, 2020
//ECE433 Fall 2020
//Test: On Nexys 3 board successfully
//Purpose: generate VGA timing signals hsync and vsync
// and synchronized(x,y) coordinates.
//inputs: resolution (x,y) and system clock in MHz
////active videos are Xresolution and Yresolution
//x ranges from 600 to 800 pixels. y ranges from 400 to 600 pixels
//synch pulse, back porch and front porch are defined within this module
//xpos, ypos are x and y position coordinates
// hsync <= ~(xposos > 664 && xposos <= 760);  // active for 95 clocks
// vsync <= ~(yposos == 490 || yposos == 491);   // active for lines 490 and 491

module CRTcontroller2020fall #(parameter ResolutionSize=10, SystemClockSize=10) (
input [SystemClockSize-1:0] SystemClockFreq, CRTClockFreq, 
input [ResolutionSize-1:0] Xresolution, Yresolution,
input reset, clock, output hsync, vsync, 
output [ResolutionSize-1:0] xpos, ypos);

//vsync is generated after active video and front porch from =>490 to >=491 
parameter vSynchPulse=10'd2, vFrontPorch=10'd10, vBackPorch=10'd29; //vsynch=520
//following are simulation parameters for vsynch
//parameter vSynchPulse=10'd1, vFrontPorch=10'd2, vBackPorch=10'd3; //vsynch=10 yresolution=4

//hsync is generated after active video and front porch from >664 to >=760 
parameter hSynchPulse=10'd95, hFrontPorch=10'd25, hBackPorch=10'd40; //hsynch=800

//following are simulation parameters for hsynch
//parameter hSynchPulse=10'd2, hFrontPorch=10'd1, hBackPorch=10'd1; //hsynch=12, xresolution=8

wire LineEnd, PixelClock;
//module hsyncModule2020fall #(parameter xresolution=10)(
//input [xresolution-1:0] SynchPulse, FrontPorch, ActiveVideo, BackPorch,
//input PixelClock, reset, clock,
//output hsync, LineEnd, output reg [xresolution-1:0] xposition);

hsyncModule2020fall hsyncModule(hSynchPulse, hBackPorch,  Xresolution, hFrontPorch, 
PixelClock, reset, clock, hsync, LineEnd, xpos);

//module vsyncModule2020fall #(parameter yresolution=10)(
//input [yresolution-1:0] SynchPulse, FrontPorch, ActiveVideo, BackPorch, 
//input LineEnd, reset, clock,
//output vsync, output [yresolution-1:0] yposition);

vsyncModule2020fallTemplate vsyncUnit(vSynchPulse, vBackPorch, Yresolution, 
vFrontPorch, LineEnd, reset, clock, vsync, ypos);

//module CRTClock2020fall #(parameter SystemClockSize=10)(
//input [SystemClockSize-1:0] SystemClockFreq, CRTClockFreq, 
//input Reset, Clock,
//output reg PixelClock);
CRTClock2020Template CRTclockUnit(SystemClockFreq, CRTClockFreq, reset, clock, PixelClock);
endmodule
