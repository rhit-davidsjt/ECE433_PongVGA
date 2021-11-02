`timescale 1ns / 1ps
///////////////////////////////////////
// Matt Anderson and Caleb Stoll
// Music score in RAM, Star Wars
///////////////////////////////////////
module MusicScore1(Address, KeyOutput, TimeOutput,Clock, Reset);
input Clock, Reset;
parameter DataLength=5;
output reg [DataLength-1:0] KeyOutput;
output reg [DataLength:0] TimeOutput;
parameter AddressBits=5;
input [AddressBits-1:0] Address;
parameter MemorySize=40;

reg [DataLength-1:0] Keys [0:MemorySize-1];
reg [DataLength:0] Times [0:MemorySize-1];

always@(posedge Clock or posedge Reset)
	if(Reset==1) begin
	Keys[0]<=5'd1; Times[0]<=6'd24;
	Keys[1]<=5'd8; Times[1]<=6'd12;
	Keys[2]<=5'd6; Times[2]<=6'd4;
	Keys[3]<=5'd5; Times[3]<=6'd4;
	Keys[4]<=5'd3; Times[4]<=6'd4;
	Keys[5]<=5'd13; Times[5]<=6'd24;
	Keys[6]<=5'd8; Times[6]<=6'd12;
	Keys[7]<=5'd6; Times[7]<=6'd4;
	Keys[8]<=5'd5; Times[8]<=6'd4;
	Keys[9]<=5'd3; Times[9]<=6'd4;
	Keys[10]<=5'd13; Times[10]<=6'd24;
	Keys[11]<=5'd8; Times[11]<=6'd12;
	Keys[12]<=5'd6; Times[12]<=6'd4;
	Keys[13]<=5'd5; Times[13]<=6'd4;
	Keys[14]<=5'd6; Times[14]<=6'd4;
	Keys[15]<=5'd3; Times[15]<=6'd36;
	end 
	else begin //read memory
		KeyOutput<=Keys[Address]; TimeOutput<=Times[Address];
	end
endmodule
