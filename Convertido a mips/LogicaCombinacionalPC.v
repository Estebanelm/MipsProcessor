`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:23:00 06/03/2017 
// Design Name: 
// Module Name:    LogicaCombinacionalPC 
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
module LogicaCombinacionalPC(
    input Zero,
    input PCWriteCond,
    input PCWrite,
    output reg selPC
    );

	initial begin
		selPC <= 0;
	end
	
	always @ (*) begin
		selPC <= (Zero & PCWriteCond) | PCWrite;
	end
	
endmodule
