`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:03:56 11/07/2016 
// Design Name: 
// Module Name:    controller 
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
module controller(
	input wire clk,
	input wire reset,
	inout wire ps2c,
	inout wire ps2d,
	input wire [7:0] switch,
	output wire [2:0] red,	
	output wire [2:0] green,
	output wire [1:0] blue,
	output wire hsync,		
	output wire vsync,
	output wire [4:0] code
    );

wire clk25;
wire [9:0] mouse_x;
wire [8:0] mouse_y;
wire btnm;
wire [31:0] num_a, num_b, result;
wire [32:0] number;

assign num_a[31] = switch[7];
assign num_a[4] = switch[6];
assign num_a[0] = switch[5];
assign num_b[31] = switch[4];
assign num_b[1] = switch[3];
assign result[31] = switch[2];
assign result[5] = switch[1];
assign result[2] = switch[0];

mouse_led m(
	.clk(clk),
	.reset(reset),
   .ps2d(ps2d),
	.ps2c(ps2c),
   .mouse_x(mouse_x),
	.mouse_y(mouse_y),
	.btnm(btnm)
	);
	
clock c(
	.iclk(clk),		//master clock: 100MHz
	.oclk2(clk25)

	);

vga_controller vga(
	.clk(clk25),
	.mouse_x(mouse_x),
   .mouse_y(mouse_y), 
	.number(number),
	.red(red),	
	.green(green),
	.blue(blue),	
	.hsync(hsync),	
	.vsync(vsync)	
	);

mouse_out mo(
    .mouse_x(mouse_x),
    .mouse_y(mouse_y), 
    .btnm(btnm),
    .code(code)
	 );
	 
number_in ni(
	 .num_a(num_a),
    .num_b(num_b),
    .result(result),
    .num_out(number)
	 );
	 
endmodule
