`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:04:07 06/03/2017 
// Design Name: 
// Module Name:    Mux32bits2entradas 
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
module Mux32bits2entradas(
    input sel,
    input [31:0] entradaA,
    input [31:0] entradaB,
    output reg [31:0] salida
    );

	initial begin salida <= 32'b0; end
	
	always @ (*) begin
		if (~sel)
			salida <= entradaA;
		else
			salida <= entradaB;
	end





endmodule
