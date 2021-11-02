`timescale 1ns / 1ps
//Name: Raymond Zheng and Erin Miller
//Date: 2/15/2012
//CM 2948
//Song Name: Final Fantasy X Battle Theme
//Music score in RAM
module MusicScore2(Address, KeyOutput, TimeOutput,Clock, Reset);
input Clock, Reset;
parameter DataLength=6;
output reg [DataLength-1:0] KeyOutput, TimeOutput;
parameter AddressBits=6;
input [AddressBits-1:0] Address;
parameter MemorySize=64;

reg [DataLength-1:0] Keys [0:MemorySize-1];
reg [DataLength-1:0] Times [0:MemorySize-1];

always@(posedge Clock or posedge Reset)
	if(Reset==1) begin
	Keys[0]<=5'd8; Times[0]<=6;
	Keys[1]<=5'd16; Times[1]<=1;
	Keys[2]<=5'd10; Times[2]<=6;
	Keys[3]<=5'd16; Times[3]<=2;
	Keys[4]<=5'd11; Times[4]<=6;
	Keys[5]<=5'd16; Times[5]<=1;
	Keys[6]<=5'd10; Times[6]<=6;
	Keys[7]<=5'd16; Times[7]<=1;
	Keys[8]<=5'd8; Times[8]<=6;
	Keys[9]<=5'd6; Times[9]<=6;
	Keys[10]<=5'd5; Times[10]<=20;
	Keys[11]<=5'd6; Times[11]<=6;
	Keys[12]<=5'd16; Times[12]<=1;
	Keys[13]<=5'd8; Times[13]<=6;
	Keys[14]<=5'd16; Times[14]<=2;
	Keys[15]<=5'd10; Times[15]<=6;
	Keys[16]<=5'd16; Times[16]<=1;
	Keys[17]<=5'd8; Times[17]<=6;
	Keys[18]<=5'd16; Times[18]<=2;
	Keys[19]<=5'd6; Times[19]<=6;
	Keys[20]<=5'd10; Times[20]<=6;
	Keys[21]<=5'd3; Times[21]<=20;
	Keys[22]<=5'd16; Times[22]<=6;
	Keys[23]<=5'd5; Times[23]<=6;
	Keys[24]<=5'd16; Times[24]<=1;
	Keys[25]<=5'd6; Times[25]<=6;
	Keys[26]<=5'd16; Times[26]<=2;
	Keys[27]<=5'd8; Times[27]<=6;
	Keys[28]<=5'd16; Times[28]<=1;
	Keys[29]<=5'd6; Times[29]<=6;
	Keys[30]<=5'd16; Times[30]<=2;
	Keys[31]<=5'd5; Times[31]<=6;
	Keys[32]<=5'd3; Times[32]<=6;
	Keys[33]<=5'd1; Times[33]<=20;
//	Keys[34]<=5'd11; Times[34]<=6;
//	Keys[32]<=5'd5; Times[32]<=6;
	end 
	else begin //read memory
		KeyOutput<=Keys[Address]; TimeOutput<=Times[Address];
	end
endmodule
