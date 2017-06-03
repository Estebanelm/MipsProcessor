`timescale 1ns / 1ps
module MainDecoder(
    output reg Branch,
    output reg RegW,
    output reg MemW,
    output reg MemtoReg,
    output reg ALUSrc,
    output reg [1:0] ImmSrc,
    output reg [1:0] RegSrc,
    output reg ALUOp,
    input [1:0] Op,
    input [1:0] Funct
    );

	always @ (*) begin
		Branch = Op[1] & ~Op[0];
		MemtoReg = ~Op[1] & Op[0];
		MemW = ~Op[1] & Op[0] & ~Funct[0];
		ALUSrc = Funct[1] | Op[0] | Op[1];
		ImmSrc[1] = Op[1] & ~Op[0];
		ImmSrc[0] = ~Op[1] & Op[0];
		RegW = (~Op[1] & ~Op[0]) | (~Op[1] & Funct[0]);
		RegSrc[1] = ~Op[1] & Op[0];
		RegSrc[0] = Op[1] & ~Op[0];
		ALUOp = ~Op[1] & ~Op[0];
	end


endmodule
