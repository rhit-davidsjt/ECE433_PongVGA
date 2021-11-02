`timescale 1ns / 1ps
//Name: Raymond Zheng and Erin Miller
//Date: 2/15/2012
//CM 2948
//Song Name: Jingle Bell
//Music score in RAM
module MusicScore1(Address, KeyOutput, TimeOutput,Clock, Reset);
input Clock, Reset;
parameter DataLength=7;
output reg [DataLength-1:0] KeyOutput, TimeOutput;
parameter AddressBits=7;
input [AddressBits-1:0] Address;
parameter MemorySize=64;

reg [DataLength-1:0] Keys [0:MemorySize-1];
reg [DataLength-1:0] Times [0:MemorySize-1];

always@(posedge Clock or posedge Reset)
	if(Reset==1) begin
	Keys[0]<=5'd9; Times[0]<=10;
	Keys[1]<=5'd16; Times[1]<=1;
	Keys[2]<=5'd9; Times[2]<=10;
	Keys[3]<=5'd16; Times[3]<=1;
	Keys[4]<=5'd9; Times[4]<=20;
	Keys[5]<=5'd16; Times[5]<=1;
	Keys[6]<=5'd9; Times[6]<=10;
	Keys[7]<=5'd16; Times[7]<=1;
	Keys[8]<=5'd9; Times[8]<=10;
	Keys[9]<=5'd16; Times[9]<=1;	
	Keys[10]<=5'd9; Times[10]<=20;
	Keys[11]<=5'd16; Times[11]<=1;
	Keys[12]<=5'd9; Times[12]<=10;
	Keys[13]<=5'd12; Times[13]<=10;
	Keys[14]<=5'd5; Times[14]<=15;
	Keys[15]<=5'd7; Times[15]<=5;
	Keys[16]<=5'd9; Times[16]<=30;
	Keys[17]<=5'd10; Times[17]<=10;
	Keys[18]<=5'd16; Times[18]<=1;	
	Keys[19]<=5'd10; Times[19]<=10;
	Keys[20]<=5'd16; Times[20]<=1;
	Keys[21]<=5'd10; Times[21]<=15;
	Keys[22]<=5'd16; Times[22]<=1;
	Keys[23]<=5'd10; Times[23]<=5;
	Keys[24]<=5'd16; Times[24]<=1;
	Keys[25]<=5'd10; Times[25]<=10;
	Keys[26]<=5'd9; Times[26]<=10;
	Keys[27]<=5'd16; Times[27]<=1;
	Keys[28]<=5'd9; Times[28]<=10;
	Keys[29]<=5'd16; Times[29]<=1;
	Keys[30]<=5'd9; Times[30]<=5;
	Keys[31]<=5'd16; Times[31]<=1;
	Keys[32]<=5'd9; Times[32]<=5;
	Keys[33]<=5'd16; Times[33]<=1;
	Keys[34]<=5'd9; Times[34]<=10;
	Keys[35]<=5'd7; Times[35]<=10;
	Keys[36]<=5'd16; Times[36]<=1;
	Keys[37]<=5'd7; Times[37]<=10;
	Keys[38]<=5'd9; Times[38]<=10;
	Keys[39]<=5'd7; Times[39]<=20;
	Keys[40]<=5'd12; Times[40]<=20;
	Keys[41]<=5'd9; Times[41]<=10;
	Keys[42]<=5'd16; Times[42]<=1;
	Keys[43]<=5'd9; Times[43]<=10;
	Keys[44]<=5'd16; Times[44]<=1;
	Keys[45]<=5'd9; Times[45]<=20;
	Keys[46]<=5'd16; Times[46]<=1;
	Keys[47]<=5'd9; Times[47]<=10;
	Keys[48]<=5'd16; Times[48]<=1;
	Keys[49]<=5'd9; Times[49]<=10;
	Keys[50]<=5'd16; Times[50]<=1;
	Keys[51]<=5'd9; Times[51]<=20;
	end 
	else begin //read memory
		KeyOutput<=Keys[Address]; TimeOutput<=Times[Address];
	end
endmodule
