`timescale 1ns / 1ps
module ControlUnit(
    output PCSrc,
    output RegWrite,
    output MemWrite,
    output MemtoReg,
    output ALUSrc,
    output [1:0] ImmSrc,
    output [1:0] RegSrc,
    output [1:0] ALUControl,
    input [3:0] Cond,
    input [3:0] ALUFlags,
    input [1:0] Op,
    input [5:0] Funct,
    input [3:0] Rd,
	 input CLK
    );

	wire PCS, RegW, MemW;
	wire [1:0] FlagW;

	Decoder d (PCS, RegW, MemW, MemtoReg, ALUSrc, ImmSrc, 
		RegSrc, ALUControl, FlagW, Rd, Op, Funct);

	ConditionalLogic cl (PCSrc, RegWrite, MemWrite, PCS, RegW,
		MemW, FlagW, Cond, ALUFlags, CLK);

endmodule
