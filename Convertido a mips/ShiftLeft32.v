`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:51:31 06/04/2017 
// Design Name: 
// Module Name:    ShiftLeft32 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module ShiftLeft32(in, out, Clk);

	input [31:0]in;
	input Clk;
	output [31:0]out;

	reg [31:0] r_reg, r_next;
	

	always @ (posedge Clk)
		begin
			r_reg = in << 2;
			//r_next = {r_reg[31:0], in};
		end
	assign out = r_reg;
	
endmodule 
