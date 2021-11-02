`timescale 1ns / 1ps
//Music score in RAM
//Made by Matt MacLaren and Heather Lothamer
//ECE130-10, Winter 2012-2013
//"Forth Eorlingas" from the Lord of the Rings soundtrack.

module MusicScore2(Address, KeyOutput, TimeOutput,Clock, Reset);
input Clock, Reset;
parameter DataLength=5;
output reg [DataLength-1:0] KeyOutput, TimeOutput;
parameter AddressBits=8;
input [AddressBits-1:0] Address;
parameter MemorySize=91;

reg [DataLength-1:0] Keys [0:MemorySize-1];
reg [DataLength-1:0] Times [0:MemorySize-1];

always@(posedge Clock or posedge Reset)
	if(Reset==1) begin
	//line 1
	Keys[0]<=1; Times[0]<=1;
	Keys[1]<=2; Times[1]<=1;
	Keys[2]<=3; Times[2]<=4;
	Keys[3]<=5; Times[3]<=4;
	Keys[4]<=3; Times[4]<=3;
	Keys[5]<=2; Times[5]<=1;
	Keys[6]<=3; Times[6]<=1;
	Keys[7]<=2; Times[7]<=1;
	Keys[8]<=1; Times[8]<=10;
	Keys[9]<=3; Times[9]<=4;
	Keys[10]<=5; Times[10]<=2;
	Keys[11]<=6; Times[11]<=8;
	Keys[12]<=9; Times[12]<=2;
	Keys[13]<=8; Times[13]<=4;
	Keys[14]<=5; Times[14]<=2;
	
	//line 2
	Keys[15]<=3; Times[15]<=6;
	Keys[16]<=4; Times[16]<=1;
	Keys[17]<=3; Times[17]<=1;
	Keys[18]<=2; Times[18]<=4;
	Keys[19]<=17; Times[19]<=2;
	Keys[20]<=1; Times[20]<=1;
	Keys[21]<=2; Times[21]<=1;
	Keys[22]<=3; Times[22]<=4;
	Keys[23]<=5; Times[23]<=4;
	Keys[24]<=3; Times[24]<=1;
	Keys[25]<=2; Times[25]<=3;
	Keys[26]<=1; Times[26]<=3;
	Keys[27]<=2; Times[27]<=1;
	Keys[28]<=1; Times[28]<=10;
	Keys[29]<=3; Times[29]<=4;
	Keys[30]<=5; Times[30]<=2;
	
	//line 3
	Keys[31]<=6; Times[31]<=8;
	Keys[32]<=5; Times[32]<=4;
	Keys[33]<=3; Times[33]<=4;
	Keys[34]<=3; Times[34]<=5;
	Keys[35]<=4; Times[35]<=1;
	Keys[36]<=3; Times[36]<=1;
	Keys[37]<=2; Times[37]<=8;
	Keys[38]<=1; Times[38]<=1;
	Keys[39]<=2; Times[39]<=1;
	Keys[40]<=3; Times[40]<=14;
	Keys[41]<=3; Times[41]<=12;
	Keys[42]<=17; Times[42]<=1;
	Keys[43]<=3; Times[43]<=1;
	Keys[44]<=6; Times[44]<=1;
	Keys[45]<=8; Times[45]<=1;
	
	//line 4
	Keys[46]<=9; Times[46]<=6;
	Keys[47]<=8; Times[47]<=8;
	Keys[48]<=6; Times[48]<=2;
	Keys[49]<=3; Times[49]<=6;
	Keys[50]<=4; Times[50]<=1;
	Keys[51]<=3; Times[51]<=1;
	Keys[52]<=2; Times[52]<=6;
	Keys[53]<=1; Times[53]<=1;
	Keys[54]<=2; Times[54]<=1;
	Keys[55]<=3; Times[55]<=10;
	
	//line 5
	Keys[56]<=3; Times[56]<=8;
	Keys[57]<=17; Times[57]<=4;
	Keys[58]<=1; Times[58]<=1;
	Keys[59]<=2; Times[59]<=1;
	Keys[60]<=3; Times[60]<=2;
	Keys[61]<=3; Times[61]<=1;
	Keys[62]<=6; Times[62]<=1;
	Keys[63]<=8; Times[63]<=2;
	Keys[64]<=9; Times[64]<=6;
	Keys[65]<=8; Times[65]<=8;
	Keys[66]<=6; Times[66]<=2;
	Keys[67]<=5; Times[67]<=8;
	Keys[68]<=2; Times[68]<=8;
	
	//line 6
	Keys[69]<=1; Times[69]<=1;
	Keys[70]<=2; Times[70]<=1;
	Keys[71]<=3; Times[71]<=4;
	Keys[72]<=5; Times[72]<=4;
	Keys[73]<=3; Times[73]<=3;
	Keys[74]<=2; Times[74]<=1;
	Keys[75]<=3; Times[75]<=1;
	Keys[76]<=2; Times[76]<=1;
	Keys[77]<=1; Times[77]<=10;
	Keys[78]<=3; Times[78]<=4;
	Keys[79]<=5; Times[79]<=2;
	Keys[80]<=6; Times[80]<=8;
	Keys[81]<=9; Times[81]<=2;
	Keys[82]<=8; Times[82]<=4;
	Keys[83]<=5; Times[83]<=2;
	
	//line 7
	Keys[84]<=3; Times[84]<=6;
	Keys[85]<=4; Times[85]<=1;
	Keys[86]<=3; Times[86]<=1;
	Keys[87]<=2; Times[87]<=6;
	Keys[88]<=1; Times[88]<=1;
	Keys[89]<=2; Times[89]<=1;
	Keys[90]<=1; Times[90]<=16;
	
	
	end 
	else begin //read memory
		KeyOutput<=Keys[Address]; TimeOutput<=Times[Address];
	end
endmodule
