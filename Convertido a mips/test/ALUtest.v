`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:25:20 06/17/2017
// Design Name:   ALU
// Module Name:   C:/Users/Pelo/Documents/Proyectos taller/Proyecto 4/Convertido a mips/test/ALUtest.v
// Project Name:  Proyecto4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALUtest;

	// Inputs
	reg [31:0] entradaA;
	reg [31:0] entradaB;
	reg [3:0] entradaControl;

	// Outputs
	wire Zero;
	wire [31:0] ALUresult;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.entradaA(entradaA), 
		.entradaB(entradaB), 
		.entradaControl(entradaControl), 
		.Zero(Zero), 
		.ALUresult(ALUresult)
	);

	initial begin
		// Initialize Inputs
		entradaA = 3;
		entradaB = 2;
		entradaControl = 9;

		// Wait 100 ns for global reset to finish
		#10;
		#5 entradaControl = 0;
		#5 entradaControl = 1;
		#5 entradaControl = 2;
		#5 entradaControl = 6;
		#5 entradaControl = 12;
		#5 entradaControl = 9;
        
		// Add stimulus here

	end
      
endmodule

