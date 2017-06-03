`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:57:00 09/29/2016 
// Design Name: 
// Module Name:    vga_controller 
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
module vga_controller(
	input wire clk,			//master clock = 50MHz
	input wire [9:0] mouse_x,
   input wire [8:0] mouse_y, 
	input wire [32:0] number,
	output wire [2:0] red,	//red vga output - 3 bits
	output wire [2:0] green,//green vga output - 3 bits
	output wire [1:0] blue,	//blue vga output - 2 bits
	output wire hsync,		//horizontal sync out
	output wire vsync			//vertical sync out
	);
	
wire [9:0] hc;										//
wire [9:0] vc;										//
wire [9:0] hpos;									//
wire [8:0] vpos;									//
wire [7:0] rgb, rgb_back;						//
wire [4:0] line_number;							//
wire [7:0] line_code;							//
wire [1:0] row;
wire [3:0] in_row;
wire [2:0] column;
wire [11:0] code;
wire [4:0] res_out_code;
wire [2:0] res_in_row;
wire [3:0] num_salida;

// VGA controller
vga640x480 vga(
	.clk(clk),
	.redin(rgb[7:5]),
	.greenin(rgb[4:2]),
	.bluein(rgb[1:0]),
	.hc(hc),
	.vc(vc),
	.hsync(hsync),
	.vsync(vsync),
	.red(red),
	.green(green),
	.blue(blue)
	);


// Mouse painter
mouse_painter mouse(
	.line_number(line_number),
	.line_code(line_code)
	);

// Button painter
button_painter button(
	 .row(row),
	 .column(column),
	 .in_row(in_row),
    .code(code)
    );

// Background painter
background_painter background(
	 .hpos(hpos),
    .vpos(vpos),
	 .code(code),
//	 .num_a(33'b000000000000000000000000000001010),
//	 .num_b(33'b100000000000000000000000000011010),
	 .resultado(number),
	 .res_out_code(res_out_code),
	 .res_in_row(res_in_row),
	 .num_salida(num_salida),
	 .out_row(in_row),
	 .row(row),
	 .column(column),
	 .rgb(rgb_back)
    );

// Number chooser
num_chooser nc(
	 .res_out_code(res_out_code),
	 .res_in_row(res_in_row),
	 .num_salida(num_salida)
    );

// Painter chooser
painter_chooser pc(
    .hc(hc),
    .vc(vc),
	 .mouse_x(mouse_x),
	 .mouse_y(mouse_y),
	 .rgb_background(rgb_back),
	 .line_code(line_code),
    .hpos(hpos),
    .vpos(vpos),
	 .line_number(line_number),
    .rgb(rgb)
    );
	 
endmodule
