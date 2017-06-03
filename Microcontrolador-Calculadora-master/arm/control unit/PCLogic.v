`timescale 1ns / 1ps
module PCLogic(
    output reg PCS,
    input RegW,
    input [3:0] Rd,
    input Branch
    );

	always @ (*) begin
		PCS = ((Rd==15)&RegW)|Branch;
	end

endmodule
