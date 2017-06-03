`timescale 1ns / 1ps
module MUX_4(
    output reg[3:0] OUT,
    input [3:0] A,
    input [3:0] B,
    input SEL
    );

	always @ (*) begin
		if (~SEL)
			OUT = A;
		else
			OUT = B;
	end

endmodule
