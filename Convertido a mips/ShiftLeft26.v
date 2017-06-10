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
module ShiftLeft26(in, out);

	input [25:0]in;
	output reg [27:0] out;
	
	initial begin
		out <= 28'b0000000000000000000000000000;
	end
	
	always @ (*)
		begin
			out <= in << 2;
		end
	
endmodule 