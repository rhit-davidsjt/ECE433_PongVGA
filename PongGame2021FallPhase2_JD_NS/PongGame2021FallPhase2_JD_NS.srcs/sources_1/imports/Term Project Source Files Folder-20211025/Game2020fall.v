`timescale 1ns / 1ps
//Source: http://www.bigmessowires.com/2009/06/21/fpga-pong/
//modified to run on the new CRT driver
//and 100MHz system clock
//ECE433 Fall 2020
// -----------------------------------------------
// updates the ball and paddle positions, and
// determines the output video image
// -----------------------------------------------
//change the game module to add your name initials	

module game2020fall(input clk25, rota, rotb, input [9:0] xpos, ypos,
output [3:0] red, green, blue);
		
// paddle movement		
reg [8:0] paddlePosition;
reg [2:0] quadAr, quadBr;
always @(posedge clk25) quadAr <= {quadAr[1:0], rota};
always @(posedge clk25) quadBr <= {quadBr[1:0], rotb};

always @(posedge clk25)
if(quadAr[2] ^ quadAr[1] ^ quadBr[2] ^ quadBr[1])
begin
	if(quadAr[2] ^ quadBr[1]) begin
		if(paddlePosition < 508)        // make sure the value doesn't overflow
			paddlePosition <= paddlePosition + 4;
	end
	else begin
		if(paddlePosition > 3)        // make sure the value doesn't underflow
			paddlePosition <= paddlePosition - 4;
	end
end
		
// ball movement	
reg [9:0] ballX;
reg [8:0] ballY;
reg ballXdir, ballYdir;
reg bounceX, bounceY;
	
wire endOfFrame = (xpos == 0 && ypos == 480);
	
always @(posedge clk25) begin
	if (endOfFrame) begin // update ball position at end of each frame
		if (ballX == 0 && ballY == 0) begin // cheesy reset handling, assumes initial value of 0
			ballX <= 480;
			ballY <= 300;
		end
		else begin
			if (ballXdir ^ bounceX) 
				ballX <= ballX + 2;
			else 
				ballX <= ballX - 2;	

			if (ballYdir ^ bounceY) 
				ballY <= ballY + 2;
			else
				ballY <= ballY - 2;	
		end
	end	
end		
		
// pixel color	
reg [5:0] missTimer;	
wire visible = (xpos < 640 && ypos < 480);
wire top = (visible && ypos <= 3);
wire bottom = (visible && ypos >= 476);
wire left = (visible && xpos <= 3);
wire right = (visible && xpos >= 636);
wire border = (visible && (left || right || top));
wire paddle = (xpos >= paddlePosition+4 && xpos <= paddlePosition+124 && ypos >= 440 && ypos <= 447);
wire ball = (xpos >= ballX && xpos <= ballX+7 && ypos >= ballY && ypos <= ballY+7);
wire background = (visible && !(border || paddle || ball));
wire checkerboard = (xpos[5] ^ ypos[5]);
wire missed = visible && missTimer != 0;

assign red   = { missed || border || paddle, 3'b000 };
assign green = { !missed && (border || paddle || ball), 3'b000 };
assign blue  = { !missed && (border || ball), background && checkerboard, background && !checkerboard, background && !checkerboard  }; 
		
// ball collision	
always @(posedge clk25) begin
	if (!endOfFrame) begin
		if (ball && (left || right))
			bounceX <= 1;
		if (ball && (top || bottom || (paddle && ballYdir)))
			bounceY <= 1;
		if (ball && bottom)
			missTimer <= 63;
	end
	else begin
		if (ballX == 0 && ballY == 0) begin // cheesy reset handling, assumes initial value of 0
			ballXdir <= 1;
			ballYdir <= 1;
			bounceX <= 0;
			bounceY <= 0;
		end 
		else begin
			if (bounceX)
				ballXdir <= ~ballXdir;
			if (bounceY)
				ballYdir <= ~ballYdir;			
			bounceX <= 0;
			bounceY <= 0;
			if (missTimer != 0)
				missTimer <= missTimer - 1;
		end
	end
end
		
endmodule
