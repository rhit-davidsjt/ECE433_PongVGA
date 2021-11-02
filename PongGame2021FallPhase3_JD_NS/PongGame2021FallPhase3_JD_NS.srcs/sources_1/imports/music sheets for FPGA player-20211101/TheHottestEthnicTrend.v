`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Rose-Hulman Institute of Technology
// Engineer: Zheng Wang CM2903  Reynolds Dillon CM1964
// Create Date:    13:54:07 11/03/2012 
// 50MHz Nexys 2 Board
// Module Name:    The Hottest Ethnic Trend 
////////////////////////////////////////////////////////////
module Sheet(
    input [3:0] KeyInput,
	 input [5:0] TimeInput,
    input Mode,
	 input [8:0] Address,
	 input CLOCK,
	 input reset,
	 output reg [3:0] KeyOutput,
	 output reg [5:0] TimeOutput
    );
reg [3:0] Keys [0:280];
reg [5:0] Times[0:280];
always@(posedge CLOCK)
if (reset==1) begin
Keys[0]<=6;  Times[0]<=16;//.6
Keys[1]<=15; Times[1]<=1;
Keys[2]<=6;  Times[2]<=8;//.6
Keys[3]<=15; Times[3]<=1;
Keys[4]<=5;  Times[4]<=8;//.5
Keys[5]<=15; Times[5]<=1;
Keys[6]<=6;  Times[6]<=16;//.6
Keys[7]<=15; Times[7]<=1;
Keys[8]<=6;  Times[8]<=8;//.6
Keys[9]<=15; Times[9]<=1;
Keys[10]<=8; Times[10]<=8;//1
Keys[11]<=15;Times[11]<=1;
Keys[12]<=8; Times[12]<=16;//1
Keys[13]<=15;Times[13]<=1;
Keys[14]<=9; Times[14]<=8;//2
Keys[15]<=8; Times[15]<=8;//1
Keys[16]<=15;Times[16]<=1;
Keys[17]<=6; Times[17]<=32;//.6
Keys[18]<=15;Times[18]<=1;
Keys[19]<=8; Times[19]<=16;//1
Keys[20]<=15; Times[20]<=1;
Keys[21]<=8; Times[21]<=8;//1
Keys[22]<=15; Times[22]<=1;
Keys[23]<=5; Times[23]<=8;//.5
Keys[24]<=15; Times[24]<=1;
Keys[25]<=8; Times[25]<=8;//1
Keys[26]<=15; Times[26]<=1;
Keys[27]<=9; Times[27]<=8;//2
Keys[28]<=15; Times[28]<=1;
Keys[29]<=10; Times[29]<=8;//3
Keys[30]<=15; Times[30]<=1;
Keys[31]<=12; Times[31]<=8;//5
Keys[32]<=15; Times[32]<=1;
Keys[33]<=12; Times[33]<=8;//5
Keys[34]<=10; Times[34]<=8;//3
Keys[35]<=15; Times[35]<=1;
Keys[36]<=9; Times[36]<=16;//2
Keys[37]<=15; Times[37]<=1;
Keys[38]<=10; Times[38]<=32;//3
Keys[39]<=15; Times[39]<=1;

Keys[40]<=13; Times[40]<=8;//6
Keys[41]<=15; Times[41]<=1;
Keys[42]<=13; Times[42]<=8;//6
Keys[43]<=15; Times[43]<=1;
Keys[44]<=13; Times[44]<=8;//6
Keys[45]<=15; Times[45]<=1;
Keys[46]<=12; Times[46]<=8;//5
Keys[47]<=15; Times[47]<=1;
Keys[48]<=10; Times[48]<=8;//3
Keys[49]<=15; Times[49]<=1;
Keys[50]<=10; Times[50]<=16;//3
Keys[51]<=15; Times[51]<=1;
Keys[52]<=8;  Times[52]<=8;//1
Keys[53]<=15; Times[53]<=1;
Keys[54]<=6;  Times[54]<=8;//.6
Keys[55]<=15; Times[55]<=1;
Keys[56]<=6;  Times[56]<=8;//.6
Keys[57]<=15; Times[57]<=1;
Keys[58]<=6;  Times[58]<=8;//.6
Keys[59]<=15; Times[59]<=1;
Keys[60]<=10; Times[60]<=8;//3
Keys[61]<=15; Times[61]<=1;
Keys[62]<=9;  Times[62]<=32;//2
Keys[63]<=15; Times[63]<=1;
Keys[64]<=10;  Times[64]<=8;//3
Keys[65]<=15; Times[65]<=1;
Keys[66]<=10;  Times[66]<=8;//3
Keys[67]<=15; Times[67]<=1;
Keys[68]<=12;  Times[68]<=8;//5
Keys[69]<=15; Times[69]<=1;
Keys[70]<=10; Times[70]<=8;//3
Keys[71]<=15; Times[71]<=1;
Keys[72]<=9;  Times[72]<=8;//2
Keys[73]<=15; Times[73]<=1;
Keys[74]<=10;  Times[74]<=8;//3
Keys[75]<=15; Times[75]<=1;
Keys[76]<=9;  Times[76]<=8;//2
Keys[77]<=15; Times[77]<=1;
Keys[78]<=8;  Times[78]<=8;//1
Keys[79]<=15; Times[79]<=1;
Keys[80]<=6; Times[80]<=16;//.6
Keys[81]<=15; Times[81]<=1;
Keys[82]<=5;  Times[82]<=16;//.5
Keys[83]<=15; Times[83]<=1;
Keys[84]<=6;  Times[84]<=32;//.6
Keys[85]<=15; Times[85]<=1;
Keys[86]<=10;  Times[86]<=8;//3
Keys[87]<=15; Times[87]<=1;
Keys[88]<=10;  Times[88]<=8;//3
Keys[89]<=15; Times[89]<=1;
Keys[90]<=12; Times[90]<=8;//5
Keys[91]<=15; Times[91]<=1;
Keys[92]<=10;  Times[92]<=8;//3
Keys[93]<=15; Times[93]<=1;
Keys[94]<=10;  Times[94]<=8;//3
Keys[95]<=15; Times[95]<=1;
Keys[96]<=12;  Times[96]<=8;//5
Keys[97]<=15; Times[97]<=1;
Keys[98]<=12;  Times[98]<=8;//5
Keys[99]<=15; Times[99]<=1;
Keys[100]<=13; Times[100]<=8;//6
Keys[101]<=15; Times[101]<=1;
Keys[102]<=13;  Times[102]<=16;//6
Keys[103]<=15; Times[103]<=1;
Keys[104]<=12;  Times[104]<=16;//5
Keys[105]<=15; Times[105]<=1;
Keys[106]<=13;  Times[106]<=32;//6
Keys[107]<=15; Times[107]<=1;

Keys[108]<=6;  Times[108]<=16;//.6
Keys[109]<=15; Times[109]<=1;
Keys[110]<=6;  Times[110]<=8;//.6
Keys[111]<=15; Times[111]<=1;
Keys[112]<=5; Times[112]<=8;//.5
Keys[113]<=15; Times[113]<=1;
Keys[114]<=6;  Times[114]<=16;//.6
Keys[115]<=15; Times[115]<=1;
Keys[116]<=8;  Times[116]<=16;//1
Keys[117]<=15; Times[117]<=1;
Keys[118]<=9;  Times[118]<=8;//2
Keys[119]<=15; Times[119]<=1;
Keys[120]<=10;  Times[120]<=8;//3
Keys[121]<=15; Times[121]<=1;
Keys[122]<=8; Times[122]<=8;//1
Keys[123]<=15; Times[123]<=1;
Keys[124]<=9;  Times[124]<=8;//2
Keys[125]<=15; Times[125]<=1;
Keys[126]<=10;  Times[126]<=32;//3
Keys[127]<=15; Times[127]<=1;
Keys[128]<=6;  Times[128]<=8;//.6
Keys[129]<=15; Times[129]<=1;
Keys[130]<=13;  Times[130]<=8;//6
Keys[131]<=15; Times[131]<=1;
Keys[132]<=13; Times[132]<=8;//6
Keys[133]<=15; Times[133]<=1;
Keys[134]<=12;  Times[134]<=8;//5
Keys[135]<=15; Times[135]<=1;
Keys[136]<=10;  Times[136]<=8;//3
Keys[137]<=15; Times[137]<=1;
Keys[138]<=9;  Times[138]<=8;//2
Keys[139]<=15; Times[139]<=1;
Keys[140]<=8;  Times[140]<=8;//1
Keys[141]<=15; Times[141]<=1;
Keys[142]<=9; Times[142]<=8;//2
Keys[143]<=15; Times[143]<=1;
Keys[144]<=10;  Times[144]<=63;//3
Keys[145]<=15; Times[145]<=0;//3
Keys[146]<=15;  Times[146]<=0;//3
Keys[147]<=15; Times[147]<=1;

Keys[148]<=8;  Times[148]<=16;//1
Keys[149]<=15; Times[149]<=1;
Keys[150]<=6;  Times[150]<=8;//.6
Keys[151]<=15; Times[151]<=1;
Keys[152]<=6; Times[152]<=8;//.6
Keys[153]<=15; Times[153]<=1;
Keys[154]<=9;  Times[154]<=16;//2
Keys[155]<=15; Times[155]<=1;
Keys[156]<=5;  Times[156]<=8;//.5
Keys[157]<=15; Times[157]<=1;
Keys[158]<=5;  Times[158]<=8;//.5
Keys[159]<=15; Times[159]<=1;
Keys[160]<=10;  Times[160]<=8;//3
Keys[161]<=15; Times[161]<=1;
Keys[162]<=12; Times[162]<=8;//5
Keys[163]<=15; Times[163]<=1;
Keys[164]<=10;  Times[164]<=8;//3
Keys[165]<=15; Times[165]<=1;
Keys[166]<=9;  Times[166]<=8;//2
Keys[167]<=15; Times[167]<=1;
Keys[168]<=8;  Times[168]<=32;//1
Keys[169]<=15; Times[169]<=1;

Keys[170]<=6;  Times[170]<=8;//.6
Keys[171]<=15; Times[171]<=1;
Keys[172]<=8; Times[172]<=8;//1
Keys[173]<=15; Times[173]<=1;
Keys[174]<=9;  Times[174]<=8;//2
Keys[175]<=15; Times[175]<=1;
Keys[176]<=10;  Times[176]<=8;//3
Keys[177]<=15; Times[177]<=1;
Keys[178]<=9;  Times[178]<=8;//2
Keys[179]<=15; Times[179]<=1;
Keys[180]<=8;  Times[180]<=8;//1
Keys[181]<=15; Times[181]<=1;
Keys[182]<=5; Times[182]<=8;//.5
Keys[183]<=15; Times[183]<=1;
Keys[184]<=3;  Times[184]<=8;//.3
Keys[185]<=15; Times[185]<=1;
Keys[186]<=6;  Times[186]<=63;//.6
Keys[187]<=15; Times[187]<=0;//.6
Keys[188]<=15; Times[188]<=0;//.6
Keys[189]<=15; Times[189]<=1;

Keys[190]<=6;  Times[190]<=16;//.6
Keys[191]<=15; Times[191]<=1;
Keys[192]<=6;  Times[192]<=8;//.6
Keys[193]<=15; Times[193]<=1;
Keys[194]<=5; Times[194]<=8;//.5
Keys[195]<=15; Times[195]<=1;
Keys[196]<=6;  Times[196]<=16;//.6
Keys[197]<=15; Times[197]<=1;
Keys[198]<=8;  Times[198]<=16;//1
Keys[199]<=15; Times[199]<=1;
Keys[200]<=9;  Times[200]<=8;//2
Keys[201]<=15; Times[201]<=1;
Keys[202]<=10;  Times[202]<=8;//3
Keys[203]<=15; Times[203]<=1;
Keys[204]<=8; Times[204]<=8;//1
Keys[205]<=15; Times[205]<=1;
Keys[206]<=9;  Times[206]<=8;//2
Keys[207]<=15; Times[207]<=1;
Keys[208]<=10;  Times[208]<=32;//3
Keys[209]<=15; Times[209]<=1;
Keys[210]<=6;  Times[210]<=8;//.6
Keys[211]<=15; Times[211]<=1;
Keys[212]<=13;  Times[212]<=8;//6
Keys[213]<=15; Times[213]<=1;
Keys[214]<=13; Times[214]<=8;//6
Keys[215]<=15; Times[215]<=1;
Keys[216]<=12;  Times[216]<=8;//5
Keys[217]<=15; Times[217]<=1;
Keys[218]<=10;  Times[218]<=8;//3
Keys[219]<=15; Times[219]<=1;
Keys[220]<=9;  Times[220]<=8;//2
Keys[221]<=15; Times[221]<=1;
Keys[222]<=8;  Times[222]<=8;//1
Keys[223]<=15; Times[223]<=1;
Keys[224]<=9; Times[224]<=8;//2
Keys[225]<=15; Times[225]<=1;
Keys[226]<=10;  Times[226]<=63;//3
Keys[227]<=15; Times[227]<=0;//3
Keys[228]<=15;  Times[228]<=0;//3
Keys[229]<=15; Times[229]<=1;

Keys[230]<=8;  Times[230]<=16;//1
Keys[231]<=15; Times[231]<=1;
Keys[232]<=6;  Times[232]<=8;//.6
Keys[233]<=15; Times[233]<=1;
Keys[234]<=6; Times[234]<=8;//.6
Keys[235]<=15; Times[235]<=1;
Keys[236]<=9;  Times[236]<=16;//2
Keys[237]<=15; Times[237]<=1;
Keys[238]<=5;  Times[238]<=8;//.5
Keys[239]<=15; Times[239]<=1;
Keys[240]<=5;  Times[240]<=8;//.5
Keys[241]<=15; Times[241]<=1;
Keys[242]<=10;  Times[242]<=8;//3
Keys[243]<=15; Times[243]<=1;
Keys[244]<=12; Times[244]<=8;//5
Keys[245]<=15; Times[245]<=1;
Keys[246]<=10;  Times[246]<=8;//3
Keys[247]<=15; Times[247]<=1;
Keys[248]<=9;  Times[248]<=8;//2
Keys[249]<=15; Times[249]<=1;
Keys[250]<=8;  Times[250]<=24;//1
Keys[251]<=15; Times[251]<=1;

Keys[252]<=8;  Times[252]<=8;//1
Keys[253]<=15; Times[253]<=1;
Keys[254]<=6; Times[254]<=8;//.6
Keys[255]<=15; Times[255]<=1;
Keys[256]<=8;  Times[256]<=8;//1
Keys[257]<=15; Times[257]<=1;
Keys[258]<=9;  Times[258]<=8;//2
Keys[259]<=15; Times[259]<=1;
Keys[260]<=10;  Times[260]<=8;//3
Keys[261]<=15; Times[261]<=1;
Keys[262]<=12;  Times[262]<=8;//5
Keys[263]<=15; Times[263]<=1;
Keys[264]<=10; Times[264]<=8;//3
Keys[265]<=15; Times[265]<=1;
Keys[266]<=10;  Times[266]<=8;//3
Keys[267]<=15; Times[267]<=1;
Keys[268]<=12;  Times[268]<=8;//5
Keys[269]<=15; Times[269]<=1;
Keys[270]<=13;  Times[270]<=63;//6
Keys[271]<=15; Times[271]<=0;//6
Keys[272]<=15;  Times[272]<=0;//6
Keys[273]<=0;  Times[273]<=0;//6
end
else if (Mode==1) begin
KeyOutput<=Keys[Address]; TimeOutput<=Times[Address];end
else begin
Keys[Address]<=KeyInput; Times[Address]<=TimeInput;end
endmodule
