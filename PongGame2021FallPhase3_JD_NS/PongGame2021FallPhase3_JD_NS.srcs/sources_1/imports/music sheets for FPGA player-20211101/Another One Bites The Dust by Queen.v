`timescale 1ns / 1ps
//Another One Bites The Dust by Queen
module MusicScore2(Address, KeyOutput, TimeOutput,Clock, Reset);
input Clock, Reset;
parameter DataLength=5;
output reg [DataLength-1:0] KeyOutput, TimeOutput;
parameter AddressBits=5;
input [AddressBits-1:0] Address;
parameter MemorySize=27;

reg [DataLength-1:0] Keys [0:MemorySize-1];
reg [DataLength-1:0] Times [0:MemorySize-1];

always@(posedge Clock or posedge Reset)
	if(Reset==1) begin
	Keys[0]<=5'd7; Times[0]<=5'd1;
	Keys[1]<=5'd8; Times[1]<=5'd1;
	Keys[2]<=5'd4; Times[2]<=5'd1;
	Keys[3]<=5'd18; Times[3]<=5'd1;
	Keys[4]<=5'd4; Times[4]<=5'd1;
	Keys[5]<=5'd18; Times[5]<=5'd1;
	Keys[6]<=5'd4; Times[6]<=5'd1;
	Keys[7]<=5'd18; Times[7]<=5'd2;
	Keys[8]<=5'd4; Times[8]<=5'd3;
	Keys[9]<=5'd8; Times[9]<=5'd1;
	Keys[10]<=5'd4; Times[10]<=5'd1;
	Keys[11]<=5'd7; Times[11]<=5'd1;
	Keys[12]<=5'd18; Times[12]<=5'd4;
	Keys[13]<=5'd7; Times[13]<=5'd1;
	Keys[14]<=5'd8; Times[14]<=5'd1;
	Keys[15]<=5'd4; Times[15]<=5'd1;
	Keys[16]<=5'd18; Times[16]<=5'd1;
	Keys[17]<=5'd4; Times[17]<=5'd1;
	Keys[18]<=5'd18; Times[18]<=5'd1;
	Keys[19]<=5'd4; Times[19]<=5'd1;
	Keys[20]<=5'd18; Times[20]<=5'd2;
	Keys[21]<=5'd4; Times[21]<=5'd3;
	Keys[22]<=5'd8; Times[22]<=5'd1;
	Keys[23]<=5'd4; Times[23]<=5'd1;
	Keys[24]<=5'd7; Times[24]<=5'd1;
	Keys[25]<=5'd0; Times[25]<=5'd0;
			end 
	else begin //read memory
		KeyOutput<=Keys[Address]; TimeOutput<=Times[Address];
	end
endmodule
