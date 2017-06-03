`timescale 1ns / 1ps
module Rotate(
    output reg[31:0] OUT,
	 input [1:0] SH,
    input [31:0] A,
    input [4:0] B
    );
	 
	always @ (*) begin
		case (SH)
			2'b00: OUT = A << B;
			2'b01: OUT = A >> B;
			default: OUT = 32'b0;
		endcase
	end
	
	initial begin OUT = 32'b0; end
	
endmodule
