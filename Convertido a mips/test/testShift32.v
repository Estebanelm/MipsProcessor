`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:52:50 06/05/2017
// Design Name:   ShiftLeft32
// Module Name:   C:/Xilinx/projects/MIPS/testShift32.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ShiftLeft32
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testShift32;

	// Inputs
	reg [31:0] in;
	reg Clk;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	ShiftLeft32 uut (
		.in(in), 
		.out(out), 
		.Clk(Clk)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		Clk = 0;
		
		#10 in = 32'b11011100111111111111111111111111;
	end
	
	always
		begin
			#10 Clk <= ~Clk;
		end
      
endmodule

