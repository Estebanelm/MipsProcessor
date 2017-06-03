`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:10:24 11/22/2016 
// Design Name: 
// Module Name:    mouse_out 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mouse_out(
    input wire [9:0] mouse_x,
    input wire [8:0] mouse_y,
    input btnm,
    output reg [4:0]code
    );
	 
reg [1:0] row;
reg [2:0] column;

always @(*)
begin
	if (mouse_y >= 204 && mouse_y < 228)		//fila 0
	begin
		row = 0;
	end
	else if(mouse_y >= 248 && mouse_y < 272)	//fila 1
	begin
		row = 1;
	end
	else if(mouse_y >= 292 && mouse_y < 316)	//fila 2
	begin
		row = 2;										//ninguna fila
	end
	else
	begin
		row = 3;
	end
	if (mouse_x >= 220 && mouse_x < 244)		//columna 0
	begin
		column = 0;
	end
	else if(mouse_x >= 264 && mouse_x < 288)	//columna 1
	begin
		column = 1;
	end
	else if(mouse_x >= 308 && mouse_x < 332)	//columna 2
	begin
		column = 2;
	end
	else if(mouse_x >= 352 && mouse_x < 376)	//columna 3
	begin
		column = 3;
	end
	else if(mouse_x >= 396 && mouse_x < 420)	//columna 4
	begin
		column = 4;
	end
	else if(mouse_x >= 440 && mouse_x < 462)	//columna 5
	begin
		column = 5;
	end
	else											//ninguna fila
	begin
		column = 6;
	end
end

always @(*)
begin
	if(btnm && row < 3 && column < 6)
	begin
		code = {(row * 6) + column}[4:0];
	end
	else
	begin
		code = 5'b10010;
	end
end

endmodule
