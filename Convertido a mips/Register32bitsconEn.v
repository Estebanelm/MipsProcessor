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
module Register32bitsconEn(Clk, in, en, out);

	input [31:0]in;
	input Clk;
	input en;
	output reg [31:0]out;
	
	initial begin
		out <= 32'b00000000000000000000000000000000;
	end

	always @ (posedge Clk)
		begin
			if (en)
				out <= in;
		end
		
endmodule 