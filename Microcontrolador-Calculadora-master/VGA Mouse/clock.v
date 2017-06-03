`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:55:30 09/29/2016 
// Design Name: 
// Module Name:    clock 
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
module clock( 
	input wire iclk,		//master clock: 100MHz
	output reg oclk2		//pixel clock: 25MHz
	);

reg q;

always @(posedge iclk)
begin
		q = ~q;
end

always @(posedge q)
begin
		oclk2 = ~oclk2;
end

endmodule

