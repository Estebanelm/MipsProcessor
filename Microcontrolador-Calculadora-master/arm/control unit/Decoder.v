`timescale 1ns / 1ps
module Decoder(
    output PCS,
    output RegW,
    output MemW,
    output MemtoReg,
    output ALUSrc,
    output [1:0] ImmSrc,
    output [1:0] RegSrc,
    output [1:0] ALUControl,
    output [1:0] FlagW,
    input [3:0] Rd,
    input [1:0] Op,
    input [5:0] Funct
    );

	wire Branch, ALUOp;

	MainDecoder md (Branch, RegW, MemW, MemtoReg, 
		ALUSrc, ImmSrc, RegSrc, ALUOp, Op, {Funct[5],Funct[0]});

	PCLogic pcl (PCS, RegW, Rd, Branch);
	
	ALUDecoder ad (ALUControl, FlagW, Funct[4:0], ALUOp);

endmodule
