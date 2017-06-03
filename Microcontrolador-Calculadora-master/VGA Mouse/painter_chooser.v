`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:45:15 09/30/2016 
// Design Name: 
// Module Name:    painter_chooser 
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
module painter_chooser(
    input [9:0] hc,
    input [9:0] vc,
	 input [9:0] mouse_x,
	 input [8:0] mouse_y,
	 input [7:0] rgb_background,
	 input [7:0] line_code,
    output reg [9:0] hpos,
    output reg [8:0] vpos,
	 output reg [4:0] line_number,
    output reg [7:0] rgb
    );

parameter [7:0]hbp = 144; 	// Fin del    "back-porch"  horizontal
parameter [4:0]vbp = 31; 		// Fin del    "back-porch"  vertical
parameter [7:0]black = 8'b00000000;
parameter [7:0]lblue = 8'b00001011;
parameter [7:0]lred  = 8'b10000000;

always @(*)
begin
	vpos = {vc - vbp}[8:0];
	hpos = hc - hbp;
	line_number = 0;
	
	rgb = rgb_background;
	
	if( hpos >= mouse_x && hpos < (mouse_x + 8)			// Inicio: dibuja mouse
	 && vpos >= mouse_y && vpos < (mouse_y + 11))
	begin
		line_number = {vpos - mouse_y}[4:0];
		if(line_code[hpos-mouse_x])
			rgb = black;
	end																// Fin: dibuja mouse
end

endmodule
