`timescale 1ns / 1ps
module ConditionalLogic(
    output reg PCSrc,
    output reg RegWrite,
    output reg MemWrite,
    input PCS,
    input RegW,
    input MemW,
    input [1:0] FlagW,
    input [3:0] Cond,
    input [3:0] ALUFlags,
	 input CLK
    );

	wire CondEx;

	reg [3:0] Flags;
	reg [1:0] FlagWrite;

	ConditionCheck cc (CondEx, Cond, Flags);

	always @ (*) begin
		if (CLK) begin
			FlagWrite[1] = FlagW[1] & CondEx;
			FlagWrite[0] = FlagW[0] & CondEx;
		end
		else begin
			if ((FlagWrite[1] | FlagWrite[0]) & CondEx) begin
				if (FlagWrite[1]) Flags[3:2] = ALUFlags[3:2];
				if (FlagWrite[0]) Flags[1:0] = ALUFlags[1:0];
			end
		end
	end

	always @ (*) begin
		PCSrc = CondEx & PCS;
		RegWrite = CondEx & RegW;
		MemWrite = CondEx & MemW;
	end

endmodule
