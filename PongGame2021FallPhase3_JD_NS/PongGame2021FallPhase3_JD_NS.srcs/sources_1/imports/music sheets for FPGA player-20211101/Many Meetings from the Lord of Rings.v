`timescale 1ns / 1ps
//Made by Matt MacLaren and Heather Lothamer
//ECE130-10, Winter 2012-2013
//"Many Meetings" from the Lord of the Rings soundtrack.
module MusicScore1(Address, KeyOutput, TimeOutput, Clock, Reset);
input Clock, Reset;
parameter DataLength=5;
output reg [DataLength-1:0] KeyOutput, TimeOutput;
parameter AddressBits=8;
input [AddressBits-1:0] Address;
parameter MemorySize=57;

reg [DataLength-1:0] Keys [0:MemorySize-1];
reg [DataLength-1:0] Times [0:MemorySize-1];

always@(posedge Clock or posedge Reset)
	if(Reset==1) begin
	//line 1
	Keys[0]<=10; Times[0]<=1;
	Keys[1]<=10; Times[1]<=1;
	Keys[2]<=10; Times[2]<=2;
	Keys[3]<=12; Times[3]<=2;
	Keys[4]<=11; Times[4]<=4;
	Keys[5]<=12; Times[5]<=4;
	Keys[6]<=13; Times[6]<=2;
	Keys[7]<=10; Times[7]<=12;
	Keys[8]<=17; Times[8]<=2;
	Keys[9]<=10; Times[9]<=1;
	Keys[10]<=10; Times[10]<=1;
	Keys[11]<=10; Times[11]<=2;
	Keys[12]<=12; Times[12]<=2;
	Keys[13]<=11; Times[13]<=4;
	Keys[14]<=14; Times[14]<=4;
	Keys[15]<=16; Times[15]<=8;
	Keys[16]<=13; Times[16]<=8;
	
	//line 2
	Keys[17]<=15; Times[17]<=8;
	Keys[18]<=13; Times[18]<=8;
	Keys[19]<=15; Times[19]<=12;
	Keys[20]<=17; Times[20]<=2;
	Keys[21]<=12; Times[21]<=1;
	Keys[22]<=12; Times[22]<=1;
	Keys[23]<=13; Times[23]<=12;
	Keys[24]<=13; Times[24]<=12;
	
	//line 3
	Keys[25]<=10; Times[25]<=8;
	Keys[26]<=9; Times[26]<=6;
	Keys[27]<=9; Times[27]<=1;
	Keys[28]<=9; Times[28]<=1;
	Keys[29]<=10; Times[29]<=12;
	Keys[30]<=17; Times[30]<=2;
	Keys[31]<=13; Times[31]<=1;
	Keys[32]<=14; Times[32]<=1;
	Keys[33]<=15; Times[33]<=6;
	Keys[34]<=14; Times[34]<=1;
	Keys[35]<=13; Times[35]<=1;
	Keys[36]<=12; Times[36]<=6;
	Keys[37]<=13; Times[37]<=1;
	Keys[38]<=14; Times[38]<=1;
	Keys[39]<=13; Times[39]<=8;
	Keys[40]<=12; Times[40]<=4;
	Keys[41]<=11; Times[41]<=4;
	
	//line 4
	Keys[42]<=10; Times[42]<=8;
	Keys[43]<=9; Times[43]<=6;
	Keys[44]<=9; Times[44]<=1;
	Keys[45]<=9; Times[45]<=1;
	Keys[46]<=10; Times[46]<=12;
	Keys[47]<=17; Times[47]<=2;
	Keys[48]<=5; Times[48]<=1;
	Keys[49]<=6; Times[49]<=1;
	Keys[50]<=7; Times[50]<=6;
	Keys[51]<=6; Times[51]<=1;
	Keys[52]<=7; Times[52]<=1;
	Keys[53]<=9; Times[53]<=6;
	Keys[54]<=7; Times[54]<=1;
	Keys[55]<=9; Times[55]<=1;
	Keys[56]<=10; Times[56]<=15;

	end 
	else begin //read memory
		KeyOutput<=Keys[Address]; TimeOutput<=Times[Address];
	end
endmodule