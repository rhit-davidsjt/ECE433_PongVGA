`timescale 1ns / 1ps
///////////////////////////////////////
// Matt Anderson and Caleb Stoll
// Music score in RAM, Iron Man
///////////////////////////////////////
module MusicScore2(Address, KeyOutput, TimeOutput,Clock, Reset);
input Clock, Reset;
parameter DataLength=5;
output reg [DataLength-1:0] KeyOutput, TimeOutput;
parameter AddressBits=5;
input [AddressBits-1:0] Address;
parameter MemorySize=40;

reg [DataLength-1:0] Keys [0:MemorySize-1];
reg [DataLength:0] Times [0:MemorySize-1];

always@(posedge Clock or posedge Reset)
	if(Reset==1) begin
	Keys[0]<=5'd5; Times[0]<=5'd24;
	Keys[1]<=5'd8; Times[1]<=5'd20;
	Keys[2]<=5'd2; Times[2]<=5'd2;
	Keys[3]<=5'd8; Times[3]<=5'd12;
	Keys[4]<=5'd10; Times[4]<=5'd7;
	Keys[5]<=5'd2; Times[5]<=5'd4;
	Keys[6]<=5'd10; Times[6]<=5'd7;
	Keys[7]<=5'd2; Times[7]<=5'd18;
	Keys[8]<=5'd13; Times[8]<=5'd6;
	Keys[9]<=5'd12; Times[9]<=5'd6;
	Keys[10]<=5'd13; Times[10]<=5'd6;
	Keys[11]<=5'd12; Times[11]<=5'd6;
	Keys[12]<=5'd13; Times[12]<=5'd12;
	Keys[13]<=5'd8; Times[13]<=5'd8;
	Keys[14]<=5'd2; Times[14]<=5'd4;
	Keys[15]<=5'd8; Times[15]<=5'd8;
	Keys[16]<=5'd2; Times[16]<=5'd4;
	Keys[17]<=5'd10; Times[17]<=5'd8;
	Keys[18]<=5'd2; Times[18]<=5'd4;
	Keys[19]<=5'd10; Times[19]<=5'd8;
	Keys[20]<=5'd2; Times[20]<=5'd12;
	end 
	else begin //read memory
		KeyOutput<=Keys[Address]; TimeOutput<=Times[Address];
	end
endmodule
