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

module GamewithSound(input Clock100MHZ, rotaLeft, rotbLeft, rotaRight, rotbRight, playAgainButton, muteSwitch, Reset, input [9:0] xpos, ypos,
output [3:0] red, green, blue, 
output Speaker);
		
// Left paddle movement		
reg [8:0] leftpaddlePosition;
reg [2:0] leftquadAr, leftquadBr;
always @(posedge Clock100MHZ) leftquadAr <= {leftquadAr[1:0], rotaLeft};
always @(posedge Clock100MHZ) leftquadBr <= {leftquadBr[1:0], rotbLeft};

always @(posedge Clock100MHZ)
if(leftquadAr[2] ^ leftquadAr[1] ^ leftquadBr[2] ^ leftquadBr[1])
begin
	if(leftquadAr[2] ^ leftquadBr[1]) begin
		if(leftpaddlePosition < 352)        // make sure the value doesn't overflow
			leftpaddlePosition <= leftpaddlePosition + 4;
	end
	else begin
		if(leftpaddlePosition > 3)        // make sure the value doesn't underflow
			leftpaddlePosition <= leftpaddlePosition - 4;
	end
end
		
// Right paddle movement		
reg [8:0] rightpaddlePosition;
reg [2:0] rightquadAr, rightquadBr;
always @(posedge Clock100MHZ) rightquadAr <= {rightquadAr[1:0], rotaRight};
always @(posedge Clock100MHZ) rightquadBr <= {rightquadBr[1:0], rotbRight};

always @(posedge Clock100MHZ)
if(rightquadAr[2] ^ rightquadAr[1] ^ rightquadBr[2] ^ rightquadBr[1])
begin
	if(rightquadAr[2] ^ rightquadBr[1]) begin
		if(rightpaddlePosition > 3)        // make sure the value doesn't underflow
			rightpaddlePosition <= rightpaddlePosition - 4;
	end
	else begin
	   if(rightpaddlePosition < 352)        // make sure the value doesn't overflow
			rightpaddlePosition <= rightpaddlePosition + 4;
	end
end
		
		
		
		
// ball movement	
reg [9:0] ballX;
reg [8:0] ballY;
reg ballXdir, ballYdir;
reg bounceX, bounceY;
	
wire endOfFrame = (xpos == 0 && ypos == 480);
	
always @(posedge Clock100MHZ) begin
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
//Resolution is 640 x 480	
// 799 x 520 is the actual range
reg [5:0] missTimer;
reg [5:0] paddleTimer;	
reg [5:0] wallTimer;

wire visible = (xpos < 640 && ypos < 480);
wire top = (visible && ypos <= 5);
wire bottom = (visible && ypos >= 475);
wire left = (visible && xpos <= 5);
wire right = (visible && xpos >= 635);
wire border = (visible && (bottom || top));



wire leftpaddle = (ypos >= leftpaddlePosition+4 && ypos <= leftpaddlePosition+124 && xpos >= 10 && xpos <= 15);
wire rightpaddle = (ypos >= rightpaddlePosition+4 && ypos <= rightpaddlePosition+124 && xpos >= 625 && xpos <= 630);

wire ball = (xpos >= ballX && xpos <= ballX+7 && ypos >= ballY && ypos <= ballY+7);
wire background = (visible && !(border || leftpaddle || rightpaddle || ball));
wire checkerboard = (xpos[5] ^ ypos[5]);
wire missed = visible && missTimer != 0;
wire hitWall = wallTimer != 0;
wire hitPaddle = paddleTimer != 0;

assign red   = { missed || border || leftpaddle || rightpaddle, 3'b000 };
assign green = { !missed && (border || leftpaddle || rightpaddle || ball), 3'b000 };
assign blue  = { !missed && (border || ball), background && checkerboard, background && !checkerboard, background && !checkerboard  }; 
		
// ball collision	
always @(posedge Clock100MHZ) begin
	if (!endOfFrame) begin
		if (ball && (left || right  || (leftpaddle && !ballXdir) || (rightpaddle && ballXdir)))begin
			bounceX <= 1;
			paddleTimer <= 63;
			end
			
		if (ball && (top || bottom))begin
			bounceY <= 1;
			wallTimer <= 63;
			end
			
		if (ball && (left || right))
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
			if (paddleTimer != 0)
				paddleTimer <= paddleTimer - 1;
				
			if (wallTimer != 0)
				wallTimer <= wallTimer - 1;
				
			if (missTimer != 0)
				missTimer <= missTimer - 1;
		end
	end
end

//Setup of the Game Sounds
reg [4:0] musicAddress;
reg playSound = 0;

always @(posedge Clock100MHZ)begin
if(missed == 1) begin
musicAddress <= 0;
playSound <=1;
end

else if(hitWall == 1) begin
musicAddress <= 12;
playSound <=1;
end

else if(hitPaddle == 1) begin
musicAddress <= 15;
playSound <=1;
end

else begin
musicAddress <= 0;
playSound <=0;
end

end

PlaySoundNexysA7 soundUnit(playAgainButton || (playSound && ~muteSwitch), Reset, Clock100MHZ, musicAddress, Speaker);

endmodule
