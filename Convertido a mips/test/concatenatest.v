`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:51:56 06/17/2017
// Design Name:   Concatenador
// Module Name:   C:/Users/Pelo/Documents/Proyectos taller/Proyecto 4/Convertido a mips/test/concatenatest.v
// Project Name:  Proyecto4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Concatenador
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module concatenatest;

	// Inputs
	reg [27:0] salidaShiftLeft;
	reg [31:0] salidaPC;

	// Outputs
	wire [31:0] salida;

	// Instantiate the Unit Under Test (UUT)
	Concatenador uut (
		.salidaShiftLeft(salidaShiftLeft), 
		.salidaPC(salidaPC), 
		.salida(salida)
	);

	initial begin
		// Initialize Inputs
		salidaShiftLeft = 32'b0000001111111111111111111111;
		salidaPC = 32'b11111111111111111000000000000000;

		// Wait 100 ns for global reset to finish
		#10;
		#5 salidaPC = 32'b10101111111111111000000000000000;
        
		// Add stimulus here

	end
      
endmodule

