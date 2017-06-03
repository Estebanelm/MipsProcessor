`timescale 1ns / 1ps
module PCplus4(
    output reg[31:0] PCp4, /* PC plus 4*/
    input [31:0] PC
    );

	initial begin PCp4 = 32'b0; end
	
	always @ (*) begin
		PCp4 = PC + 4;
	end

endmodule
