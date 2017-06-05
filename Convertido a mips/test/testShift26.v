`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:16:03 06/05/2017
// Design Name:   ShiftLeft26
// Module Name:   C:/Xilinx/projects/MIPS/testShift26.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ShiftLeft26
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testShift26;

	// Inputs
	reg [25:0] in;
	reg Clk;

	// Outputs
	wire [27:0] out;

	// Instantiate the Unit Under Test (UUT)
	ShiftLeft26 uut (
		.in(in), 
		.out(out), 
		.Clk(Clk)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		Clk = 0;


		#10 in = 26'b01111111111111111111111111;
	end
	
	always
		begin
			#10 Clk <= ~Clk;
		end
		
endmodule

