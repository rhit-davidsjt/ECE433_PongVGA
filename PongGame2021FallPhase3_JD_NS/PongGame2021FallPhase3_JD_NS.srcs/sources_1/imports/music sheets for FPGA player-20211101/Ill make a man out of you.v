`timescale 1ns / 1ps
///////////////////////////////////////////////////////////
// File name	: MusicScore1.v
// Written by	: Marcus Willersheidt & Jordan Arnt
// CM				: 934
// Class 		: ECE 130, Dr. Song
// Date        : 2/14/13
// Description : This program plays "I'll make a man out of you" from Disney's Mulan
////////////////////////////////////////////////////////////
//Music score in RAM
module MusicScore1(Address, KeyOutput, TimeOutput,Clock, Reset);
input Clock, Reset;
parameter DataLength=6;
output reg [DataLength-1:0] KeyOutput, TimeOutput;
parameter AddressBits=7;
input [AddressBits-1:0] Address;
parameter MemorySize=50;

reg [DataLength-1:0] Keys [0:MemorySize-1];
reg [DataLength-1:0] Times [0:MemorySize-1];

always@(posedge Clock or posedge Reset)
	if(Reset==1) begin
	Keys[0]<=5'd17; Times[0]<=5'd1;
	Keys[1]<=5'd18; Times[1]<=5'd2;
	Keys[2]<=5'd19; Times[2]<=5'd2;
	Keys[3]<=5'd12; Times[3]<=5'd1;
	Keys[4]<=5'd12; Times[4]<=5'd1;
	Keys[5]<=5'd12; Times[5]<=5'd1;
	Keys[6]<=5'd14; Times[6]<=5'd1;
	Keys[7]<=5'd11; Times[7]<=5'd1;
	Keys[8]<=5'd7; Times[8]<=5'd1;
	Keys[9]<=5'd17; Times[9]<=5'd2;
	Keys[10]<=5'd16; Times[10]<=5'd2;
	Keys[11]<=5'd14; Times[11]<=5'd2;
	Keys[12]<=5'd12; Times[12]<=5'd4;
	Keys[13]<=5'd12; Times[13]<=5'd1;
	Keys[14]<=5'd12; Times[14]<=5'd1;
	Keys[15]<=5'd12; Times[15]<=5'd1;
	Keys[16]<=5'd14; Times[16]<=5'd1;
	Keys[17]<=5'd11; Times[17]<=5'd1;
	Keys[18]<=5'd7; Times[18]<=5'd1;
	Keys[19]<=5'd17; Times[19]<=5'd2;
	Keys[20]<=5'd16; Times[20]<=5'd2;
	Keys[21]<=5'd14; Times[21]<=5'd2;
	Keys[22]<=5'd12; Times[22]<=5'd4;
	Keys[23]<=5'd12; Times[23]<=5'd1;
	Keys[24]<=5'd12; Times[24]<=5'd1;
	Keys[25]<=5'd12; Times[25]<=5'd1;
	Keys[26]<=5'd14; Times[26]<=5'd1;
	Keys[27]<=5'd11; Times[27]<=5'd1;
	Keys[28]<=5'd7; Times[28]<=5'd1;
	Keys[29]<=5'd17; Times[29]<=5'd2;
	Keys[30]<=5'd16; Times[30]<=5'd2;
	Keys[31]<=5'd14; Times[31]<=5'd2;
	Keys[32]<=5'd12; Times[32]<=5'd3;
	Keys[33]<=5'd9; Times[33]<=5'd1;
	Keys[34]<=5'd12; Times[34]<=5'd1;
	Keys[35]<=5'd12; Times[35]<=5'd1;
	Keys[36]<=5'd12; Times[36]<=5'd3;
	Keys[37]<=5'd16; Times[37]<=5'd1;
	Keys[38]<=5'd14; Times[38]<=5'd2;
	Keys[39]<=5'd12; Times[39]<=5'd2;
	Keys[40]<=5'd11; Times[40]<=5'd3;
	Keys[41]<=5'd18; Times[41]<=5'd1;
	Keys[42]<=5'd19; Times[42]<=5'd8;
	Keys[43]<=5'd0; Times[43]<=5'd3;
	end 
	else begin //read memory
		KeyOutput<=Keys[Address]; TimeOutput<=2*Times[Address];
	end
endmodule
