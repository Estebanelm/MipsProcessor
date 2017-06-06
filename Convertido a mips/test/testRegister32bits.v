`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:54:05 06/06/2017
// Design Name:   Register32bits
////////////////////////////////////////////////////////////////////////////////

module testRegister32bits;

	// Inputs
	reg [31:0] in;
	reg Clk;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	Register32bits uut (
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

