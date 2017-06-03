`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:11:22 11/09/2016 
// Design Name: 
// Module Name:    background_painter 
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
module background_painter(
	 input wire [9:0] hpos,
    input wire [8:0] vpos,
	 input wire [11:0] code,
//	 input wire [32:0] num_a,
//	 input wire [32:0] num_b,
	 input wire [32:0] resultado,
	 input wire [4:0] res_out_code,
	 output reg [2:0] res_in_row,
	 output reg [3:0] num_salida,
	 output reg [3:0] out_row,
	 output reg [1:0] row,
	 output reg [2:0] column,
	 output reg [7:0] rgb
    );

parameter [7:0]white = 8'b11111111;
parameter [7:0]gray  = 8'b10010010;
parameter [7:0]blue  = 8'b00000011;
parameter [7:0]black = 8'b00000000;

reg [3:0] col;
reg [3:0] exponente;
reg [29:0] tmp;

always @(*)
begin
	if (vpos >= 204 && vpos < 228)		//fila 0
	begin
		row = 0;
		out_row = {(vpos - 204) / 2}[3:0];
	end
	else if(vpos >= 248 && vpos < 272)	//fila 1
	begin
		row = 1;
		out_row = {(vpos - 248) / 2}[3:0];
	end
	else if(vpos >= 292 && vpos < 316)	//fila 2
	begin
		row = 2;
		out_row = {(vpos - 292) / 2}[3:0];
	end
	else
	begin
		row = 3;
		out_row = 0;
	end
	if (hpos >= 220 && hpos < 244)		//columna 0
	begin
		column = 0;
		col = {(hpos - 220) / 2}[3:0];
	end
	else if(hpos >= 264 && hpos < 288)	//columna 1
	begin
		column = 1;
		col = {(hpos - 264) / 2}[3:0];
	end
	else if(hpos >= 308 && hpos < 332)	//columna 2
	begin
		column = 2;
		col = {(hpos - 308) / 2}[3:0];
	end
	else if(hpos >= 352 && hpos < 376)	//columna 3
	begin
		column = 3;
		col = {(hpos - 352) / 2}[3:0];
	end
	else if(hpos >= 396 && hpos < 420)	//columna 4
	begin
		column = 4;
		col = {(hpos - 396) / 2}[3:0];
	end
	else if(hpos >= 440 && hpos < 462)	//columna 5
	begin
		column = 5;
		col = {(hpos - 440) / 2}[3:0];
	end
	else											//ninguna fila
	begin
		column = 6;
		col = 0;
	end
end

always @(*)
begin	
	if ((hpos >= 260 && hpos < 420) && (vpos >= 172 && vpos < 184))
	begin
		res_in_row = {(vpos - 172)/2}[2:0];
		exponente = {(9 - ((hpos - 260)/16))}[3:0];
		case (exponente)
		4'b0000: tmp = 1;
		4'b0001: tmp = 10;
		4'b0010: tmp = 100;
		4'b0011: tmp = 1000;
		4'b0100: tmp = 10000;
		4'b0101: tmp = 100000;
		4'b0110: tmp = 1000000;
		4'b0111: tmp = 10000000;
		4'b1000: tmp = 100000000;
		4'b1001: tmp = 1000000000;
		default: tmp = 1;
		endcase
		/*if(vpos >= 124 && vpos < 136)
		begin
			num_salida = (num_a[31:0] / tmp) % 10;
			if(((hpos - 260)%16 < 10) && res_out_code[((hpos - 260)%16)/2])
				rgb = black;
			else
				rgb = gray;
		end
		else if(vpos >= 148 && vpos < 160)
		begin
			num_salida = (num_b[31:0] / tmp) % 10;
			if(((hpos - 260)%16 < 10) && res_out_code[((hpos - 260)%16)/2])
				rgb = black;
			else
				rgb = gray;
		end
		else*/ //if(vpos >= 172 && vpos < 184)
		//begin
			num_salida = (resultado[31:0] / tmp) % 10;
			if(((hpos - 260)%16 < 10) && res_out_code[((hpos - 260)%16)/2])
				rgb = black;
			else
				rgb = gray;
		/*end
		else
		begin
			num_salida = 0;
			rgb = gray;
		end*/
	end
	else if(hpos >= 250 && hpos < 256)
	begin
		num_salida = 0;
		res_in_row = 0;
		if (/*(vpos >= 124 && vpos < 136 && num_a[32])
		 || (vpos >= 148 && vpos < 160 && num_b[32])
		 || */(vpos >= 176 && vpos < 178 && resultado[32]))
			rgb = black;
		else
			rgb = gray;
	end
	else if((row < 2 && column < 6) || (row == 2 && column < 5))
	begin
		res_in_row = 0;
		if(code[col])
		begin
			rgb = white;
		end
		else
		begin
			rgb = blue;
		end
		num_salida = 0;
	end
	else
	begin
		num_salida = 0;
		res_in_row = 0;
		rgb = gray;
	end
end
endmodule
