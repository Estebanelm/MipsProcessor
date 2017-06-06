`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:01:14 06/04/2017 
// Design Name: 
// Module Name:    ShiftLeft26 
// Project Name: 
// Target Devices: 
//
//////////////////////////////////////////////////////////////////////////////////
module ShiftLeft26(in, out, Clk);

	input [25:0]in;
	input Clk;
	output [27:0]out;

	reg [27:0] r_reg;
	
	always @ (posedge Clk)
		begin
			r_reg = in << 2;
		end
	assign out = r_reg;
	
endmodule 