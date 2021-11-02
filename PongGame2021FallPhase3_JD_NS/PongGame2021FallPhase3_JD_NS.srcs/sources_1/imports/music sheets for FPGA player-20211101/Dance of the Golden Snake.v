`timescale 1ns / 1ps
//Tingyu Zhang Jiusan Zheng
//CM2946 
//Name of the song: Dance of the Golden Snake
module MusicScore1(Address, KeyOutput, TimeOutput,Clock, Reset);

input Clock, Reset;
parameter DataLength=8;

output reg [DataLength-1:0] KeyOutput, TimeOutput;
parameter AddressBits=5;
input [AddressBits-1:0] Address;
parameter MemorySize=40;

reg [DataLength-1:0] Keys [0:MemorySize-1];
reg [DataLength-1:0] Times [0:MemorySize-1];

always@(posedge Clock or posedge Reset)
	if(Reset==1) begin
	
	Keys[0]<=5'd3; Times[0]<=5'd1;
	Keys[1]<=5'd3; Times[1]<=5'd9;
	Keys[2]<=5'd6; Times[2]<=5'd9;
	Keys[3]<=5'd1; Times[3]<=5'd9;
	Keys[4]<=5'd3; Times[4]<=5'd9;
	Keys[5]<=5'd6; Times[5]<=5'd19;
	Keys[6]<=5'd13; Times[6]<=5'd9;
	Keys[7]<=5'd15; Times[7]<=5'd9;
	Keys[8]<=5'd11; Times[8]<=5'd9;
	Keys[9]<=5'd10; Times[9]<=5'd9;
	Keys[10]<=5'd8; Times[10]<=5'd19;
	Keys[11]<=5'd8; Times[11]<=5'd9;
	Keys[12]<=5'd13; Times[12]<=5'd9;
	Keys[13]<=5'd13; Times[13]<=5'd9;
	Keys[14]<=5'd8; Times[14]<=5'd9;
	Keys[15]<=5'd11; Times[15]<=5'd9;
	Keys[16]<=5'd10; Times[16]<=5'd9;
	Keys[17]<=5'd8; Times[17]<=5'd9;
	Keys[18]<=5'd6; Times[18]<=5'd5;
	Keys[19]<=5'd8; Times[19]<=5'd5;
	Keys[20]<=5'd11; Times[20]<=5'd9;
	Keys[21]<=5'd11; Times[21]<=5'd9;
	Keys[22]<=5'd3; Times[22]<=5'd9;
	Keys[23]<=5'd6; Times[23]<=5'd9;
	Keys[24]<=5'd8; Times[24]<=5'd9;
	Keys[25]<=5'd11; Times[25]<=5'd9;
	Keys[26]<=5'd8; Times[26]<=5'd5;
	Keys[27]<=5'd6; Times[27]<=5'd5;
	Keys[28]<=5'd3; Times[28]<=5'd5;
	Keys[29]<=5'd6; Times[29]<=5'd5;
	Keys[30]<=5'd1; Times[30]<=5'd19;
	Keys[31]<=5'd3; Times[31]<=5'd8;
	Keys[32]<=5'd3; Times[32]<=5'd1;
	Keys[33]<=5'd3; Times[33]<=5'd9;
	Keys[34]<=5'd1; Times[34]<=5'd19;
	Keys[35]<=5'd1; Times[35]<=5'd19;
	

	end 
	else begin //read memory
		KeyOutput<=Keys[Address]; TimeOutput<=Times[Address];
	end
endmodule
