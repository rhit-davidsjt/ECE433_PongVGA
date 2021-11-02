`timescale 1ns / 1ps
//Tingyu Zhang  Jiusan Zheng 
//Name of the song: SuperMario
//Music score in RAM
module MusicScore2(Address, KeyOutput, TimeOutput,Clock, Reset);
input Clock, Reset;
parameter DataLength=8;
output reg [DataLength-1:0] KeyOutput, TimeOutput;
parameter AddressBits=5;
input [AddressBits-1:0] Address;
parameter MemorySize=100;

reg [DataLength-1:0] Keys [0:MemorySize-1];
reg [DataLength-1:0] Times [0:MemorySize-1];

always@(posedge Clock or posedge Reset)
	if(Reset==1) begin
   Keys[0]<=5'd10; Times[0]<=5'd7;
	Keys[1]<=5'd10; Times[1]<=5'd7;
	Keys[2]<=5'd10; Times[2]<=5'd1;
	Keys[3]<=5'd10; Times[3]<=5'd7;
	Keys[4]<=5'd10; Times[4]<=5'd7;
	Keys[5]<=5'd6; Times[5]<=5'd7;
	Keys[6]<=5'd10; Times[6]<=5'd14;
	Keys[7]<=5'd13; Times[7]<=5'd14;
	Keys[8]<=5'd13; Times[8]<=5'd1;
	Keys[9]<=5'd1; Times[9]<=5'd14;
	Keys[10]<=5'd1; Times[10]<=5'd1;
	Keys[11]<=5'd6; Times[11]<=5'd14;
	Keys[12]<=5'd1; Times[12]<=5'd7;
	Keys[13]<=5'd1; Times[13]<=5'd1;
	Keys[14]<=5'd17; Times[14]<=5'd14;
	Keys[15]<=5'd17; Times[15]<=5'd7;
	Keys[16]<=5'd3; Times[16]<=5'd14;
	Keys[17]<=5'd5; Times[17]<=5'd14;
	Keys[18]<=5'd4; Times[18]<=5'd7;
	Keys[19]<=5'd3; Times[19]<=5'd14;
	Keys[20]<=5'd1; Times[20]<=5'd7;
	Keys[21]<=5'd10; Times[21]<=5'd7;
	Keys[22]<=5'd13; Times[22]<=5'd7;
	Keys[23]<=5'd15; Times[23]<=5'd14;
	Keys[24]<=5'd11; Times[24]<=5'd7;
	Keys[25]<=5'd13; Times[25]<=5'd7;
	Keys[26]<=5'd13; Times[26]<=5'd1;
	Keys[27]<=5'd10; Times[27]<=5'd14;
	Keys[28]<=5'd6; Times[28]<=5'd7;
	Keys[29]<=5'd8; Times[29]<=5'd7;
	Keys[30]<=5'd5; Times[30]<=5'd14;
	Keys[31]<=5'd6; Times[31]<=5'd19;
	Keys[32]<=5'd1; Times[32]<=5'd14;
	Keys[33]<=5'd1; Times[33]<=5'd1;
	Keys[34]<=5'd17; Times[34]<=5'd14;
	Keys[35]<=5'd17; Times[35]<=5'd7;
	Keys[36]<=5'd3; Times[36]<=5'd14;
	Keys[37]<=5'd5; Times[37]<=5'd14;
	Keys[38]<=5'd4; Times[38]<=5'd7;
	Keys[39]<=5'd3; Times[39]<=5'd14;
	Keys[40]<=5'd1; Times[40]<=5'd7;
	Keys[41]<=5'd10; Times[41]<=5'd7;
	Keys[42]<=5'd13; Times[42]<=5'd7;
	Keys[43]<=5'd15; Times[43]<=5'd14;
	Keys[44]<=5'd11; Times[44]<=5'd7;
	Keys[45]<=5'd13; Times[45]<=5'd7;
	Keys[46]<=5'd13; Times[46]<=5'd1;
	Keys[47]<=5'd10; Times[47]<=5'd14;
	Keys[48]<=5'd6; Times[48]<=5'd7; 
	Keys[49]<=5'd8; Times[49]<=5'd7;
	Keys[50]<=5'd2; Times[50]<=5'd19;
   Keys[51]<=5'd2; Times[51]<=5'd1;
	Keys[52]<=5'd13; Times[52]<=5'd7;
	Keys[53]<=5'd12; Times[53]<=5'd7;
	Keys[54]<=5'd11; Times[54]<=5'd7;
	Keys[55]<=5'd9; Times[55]<=5'd14;
	Keys[56]<=5'd10; Times[56]<=5'd7;
	Keys[57]<=5'd10; Times[57]<=5'd1;
	Keys[58]<=5'd1; Times[58]<=5'd7;
	Keys[59]<=5'd3; Times[59]<=5'd7;
	Keys[60]<=5'd6; Times[60]<=5'd7;
	Keys[61]<=5'd6; Times[61]<=5'd7;
	Keys[62]<=5'd3; Times[62]<=5'd7;
	Keys[63]<=5'd6; Times[63]<=5'd7;
	Keys[64]<=5'd8; Times[64]<=5'd7;
	Keys[65]<=5'd8; Times[65]<=5'd1;
	Keys[66]<=5'd13; Times[66]<=5'd7;
	Keys[67]<=5'd12; Times[67]<=5'd7;
	Keys[68]<=5'd11; Times[68]<=5'd7;
	Keys[69]<=5'd9; Times[69]<=5'd14;
	Keys[70]<=5'd10; Times[70]<=5'd7;
	Keys[71]<=5'd10; Times[71]<=5'd1;
	Keys[72]<=5'd18; Times[72]<=5'd7;
	Keys[73]<=5'd18; Times[73]<=5'd7;
	Keys[74]<=5'd18; Times[74]<=5'd19;
	Keys[75]<=5'd18; Times[75]<=5'd1;
	Keys[76]<=5'd13; Times[76]<=5'd7;
	Keys[77]<=5'd12; Times[77]<=5'd7;
	Keys[78]<=5'd11; Times[78]<=5'd7;
	Keys[79]<=5'd9; Times[79]<=5'd14;
	Keys[80]<=5'd10; Times[80]<=5'd7;
	Keys[81]<=5'd10; Times[81]<=5'd7;
	Keys[82]<=5'd1; Times[82]<=5'd7;
	Keys[83]<=5'd3; Times[83]<=5'd7;
	Keys[84]<=5'd6; Times[84]<=5'd7;
	Keys[85]<=5'd6; Times[85]<=5'd7;
	Keys[86]<=5'd3; Times[86]<=5'd7;
	Keys[87]<=5'd6; Times[87]<=5'd7;
	Keys[88]<=5'd8; Times[88]<=5'd7;
	Keys[89]<=5'd8; Times[89]<=5'd7;
	Keys[90]<=5'd9; Times[90]<=5'd19;
	Keys[91]<=5'd9; Times[91]<=5'd1;
	Keys[92]<=5'd8; Times[92]<=5'd19;
	Keys[93]<=5'd6; Times[93]<=5'd14;
	
	
	
	end 
	else begin //read memory
		KeyOutput<=Keys[Address]; TimeOutput<=Times[Address];
	end
endmodule
