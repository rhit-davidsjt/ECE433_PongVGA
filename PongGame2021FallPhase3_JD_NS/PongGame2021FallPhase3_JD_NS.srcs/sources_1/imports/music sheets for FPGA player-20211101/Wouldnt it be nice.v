`timescale 1ns / 1ps
///////////////////////////////////////////////////////////
// File name	: MusicScore2.v
// Written by	: Marcus Willersheidt & Jordan Arnt
// CM				: 934
// Class 		: ECE 130, Dr. Song
// Date        : 2/14/13
// Description : This program plays "Wouldn't it be nice" by the Beach Boys
////////////////////////////////////////////////////////////
//Music score in RAM
module MusicScore2(Address, KeyOutput, TimeOutput,Clock, Reset);
input Clock, Reset;
parameter DataLength=6;
output reg [DataLength-1:0] KeyOutput, TimeOutput;
parameter AddressBits=7;
input [AddressBits-1:0] Address;
parameter MemorySize=70;

reg [DataLength-1:0] Keys [0:MemorySize-1];
reg [DataLength-1:0] Times [0:MemorySize-1];

always@(posedge Clock or posedge Reset)
	if(Reset==1) begin
	Keys[0]<=5'd19; Times[0]<=5'd3;
	Keys[1]<=5'd18; Times[1]<=5'd1;
	Keys[2]<=5'd18; Times[2]<=5'd3;
	Keys[3]<=5'd19; Times[3]<=5'd1;
	Keys[4]<=5'd12; Times[4]<=5'd4;
	Keys[5]<=5'd17; Times[5]<=5'd4;
	Keys[6]<=5'd17; Times[6]<=5'd4;
	Keys[7]<=5'd12; Times[7]<=5'd3;
	Keys[8]<=5'd18; Times[8]<=5'd4;
	Keys[9]<=5'd17; Times[9]<=5'd4;
	Keys[10]<=5'd19; Times[10]<=5'd4;
	Keys[11]<=5'd18; Times[11]<=5'd1;
	Keys[12]<=5'd17; Times[12]<=5'd3;
	Keys[13]<=5'd18; Times[13]<=5'd1;
	Keys[14]<=5'd14; Times[14]<=5'd4;
	Keys[15]<=5'd18; Times[15]<=5'd3;
	Keys[16]<=5'd18; Times[16]<=5'd4;
	Keys[17]<=5'd19; Times[17]<=5'd4;
	Keys[18]<=5'd14; Times[18]<=5'd3;
	Keys[19]<=5'd12; Times[19]<=5'd1;
	Keys[20]<=5'd10; Times[20]<=5'd3;
	Keys[21]<=5'd18; Times[21]<=5'd1;
	Keys[22]<=5'd19; Times[22]<=5'd3;
	Keys[23]<=5'd18; Times[23]<=5'd1;
	Keys[24]<=5'd17; Times[24]<=5'd3; //And wouldn't it...
	Keys[25]<=5'd18; Times[25]<=5'd1;
	Keys[26]<=5'd12; Times[26]<=5'd4;
	Keys[27]<=5'd17; Times[27]<=5'd4;
	Keys[28]<=5'd17; Times[28]<=5'd4;
	Keys[29]<=5'd12; Times[29]<=5'd3;
	Keys[30]<=5'd18; Times[30]<=5'd4;
	Keys[31]<=5'd17; Times[31]<=5'd4;
	Keys[32]<=5'd19; Times[32]<=5'd4;
	Keys[33]<=5'd18; Times[33]<=5'd1;
	Keys[34]<=5'd17; Times[34]<=5'd3;
	Keys[35]<=5'd18; Times[35]<=5'd1;
	Keys[36]<=5'd14; Times[36]<=5'd4;
	Keys[37]<=5'd18; Times[37]<=5'd3;
	Keys[38]<=5'd18; Times[38]<=5'd4;
	Keys[39]<=5'd19; Times[39]<=5'd5;
	Keys[40]<=5'd14; Times[40]<=5'd3;
	Keys[41]<=5'd12; Times[41]<=5'd1;
	Keys[42]<=5'd10; Times[42]<=5'd4;
	Keys[43]<=6'd20; Times[43]<=5'd12;
	Keys[44]<=5'd9; Times[44]<=5'd3;
	Keys[45]<=5'd10; Times[45]<=5'd1;
	Keys[46]<=5'd12; Times[46]<=5'd3;
	Keys[47]<=5'd14; Times[47]<=5'd1;
	Keys[48]<=5'd16; Times[48]<=5'd3;
	Keys[49]<=5'd17; Times[49]<=5'd1;
	Keys[50]<=5'd18; Times[50]<=5'd3;
	Keys[51]<=5'd10; Times[51]<=5'd4;
	Keys[52]<=5'd14; Times[52]<=5'd4;
	Keys[53]<=5'd12; Times[53]<=5'd4;
	Keys[54]<=5'd20; Times[54]<=5'd3;
	Keys[55]<=5'd5; Times[55]<=5'd1;
	Keys[56]<=5'd9; Times[56]<=5'd3;
	Keys[57]<=5'd10; Times[57]<=5'd1;
	Keys[58]<=5'd12; Times[58]<=5'd3;
	Keys[59]<=5'd14; Times[59]<=5'd1;
	Keys[60]<=5'd16; Times[60]<=5'd3;
	Keys[61]<=5'd17; Times[61]<=5'd1;
	Keys[62]<=5'd1; Times[62]<=5'd12;
	Keys[63]<=5'd17; Times[63]<=5'd3;
	Keys[64]<=5'd19; Times[64]<=5'd4;
	Keys[65]<=5'd18; Times[65]<=5'd13;
	Keys[66]<=5'd0; Times[66]<=5'd3;
	end 
	else begin //read memory
		KeyOutput<=Keys[Address]; TimeOutput<=Times[Address];
	end
endmodule
