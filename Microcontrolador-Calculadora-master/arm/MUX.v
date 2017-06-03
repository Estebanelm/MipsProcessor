`timescale 1ns / 1ps
module MUX(
    output reg [31:0] OUT,
    input [31:0] A,
    input [31:0] B,
    input SEL
    );
	
	initial begin OUT = 32'b0; end
	
	always @ (*) begin
		if (~SEL)
			OUT = A;
		else
			OUT = B;
	end

endmodule
