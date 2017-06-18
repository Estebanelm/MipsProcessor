`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:10:36 06/17/2017
// Design Name:   Mux32bits4entradas
// Module Name:   C:/Users/Pelo/Documents/Proyectos taller/Proyecto 4/Convertido a mips/test/muxtest.v
// Project Name:  Proyecto4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mux32bits4entradas
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module muxtest;

	// Inputs
	reg [1:0] sel;
	reg [31:0] entradaA;
	reg [31:0] entradaB;
	reg [31:0] entradaC;
	reg [31:0] entradaD;

	// Outputs
	wire [31:0] salida;

	// Instantiate the Unit Under Test (UUT)
	Mux32bits4entradas uut (
		.sel(sel), 
		.entradaA(entradaA), 
		.entradaB(entradaB), 
		.entradaC(entradaC), 
		.entradaD(entradaD), 
		.salida(salida)
	);

	initial begin
		// Initialize Inputs
		sel = 0;
		entradaA = 10;
		entradaB = 20;
		entradaC = 30;
		entradaD = 40;

		// Wait 100 ns for global reset to finish
		#10;
		#5 sel = 1;
		#5 sel = 2;
		#5 sel = 3;
		#5 sel = 4;
        
		// Add stimulus here

	end
      
endmodule

