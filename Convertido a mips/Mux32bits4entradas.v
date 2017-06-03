`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:33:55 06/03/2017 
// Design Name: 
// Module Name:    Mux32bits4entradas 
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
module Mux32bits4entradas(
    input [1:0] sel,
    input [31:0] entradaA,
    input [31:0] entradaB,
	 input [31:0] entradaC,
	 input [31:0] entradaD,
    output reg [31:0] salida
    );

	initial begin salida = 32'b0; end
	
	always @ (*) begin
		case(sel)
			0:
				salida = entradaA;
			1: 
				salida = entradaB;
			2:
				salida = entradaC;
			3:
				salida = entradaD;
			default:
				salida = entradaD;
		endcase
	end
	
endmodule
