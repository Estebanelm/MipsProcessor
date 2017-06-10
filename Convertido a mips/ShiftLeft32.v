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
module ShiftLeft32(in, out);

	input [31:0]in;
	output reg [31:0]out;

	initial begin
		out <= 32'b00000000000000000000000000000000;
	end
	
	always @ (*)
		begin
			out <= in << 2;
		end
	
endmodule 
