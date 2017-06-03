`timescale 1ns / 1ps
module Extend(
    output reg[31:0] ExtImm,
	 input [1:0] ImmSrc,
    input [23:0] Imm
    );

	always @ (*) begin
		case (ImmSrc) 
			2'b00: ExtImm = {24'b0,Imm[7:0]};
			2'b01: ExtImm = {20'b0,Imm[11:0]};
			2'b10: ExtImm = {{6{Imm[23]}},Imm, 2'b0};
			default: ExtImm = Imm;
		endcase
	end

endmodule
