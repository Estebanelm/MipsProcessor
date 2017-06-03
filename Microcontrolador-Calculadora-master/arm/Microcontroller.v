`timescale 1ns / 1ps
module Microcontroller(
	output [31:0] DATO1,
	output [31:0] DATO2, 
	output [31:0] RESULTADO, 
	input [31:0] MouseData,
	input CLK, 
	input MOUSECLICK
    );
	
	/* First of all, let's talk about wires */
	
	wire [1:0] RegSrc, ImmSrc, ALUControl; /* ControlUnit */
	wire PCSrc, RegWrite, MemWrite, MemtoReg, ALUSrc;
	
	wire [31:0] INSTR; /* Instruction memory */
	wire [31:0] PC, PCp4, PCp8; /* PC */
	wire [3:0] MUXRB; /* RegisterFile MUXES */
	wire [31:0] OPERA, OPERB, ReadDataA, ReadDataB, StackPointer; /* Register File */
	wire [31:0] ExtImm; /* Extend unit */
	wire [31:0] ALUResult, RotateResult; /* ALU */
	wire N, Z, C, V;
	
	wire [31:0] ReadData; /* DataMemory */
	wire [31:0] Result; /* MEM/ALU MUX */
	wire [31:0] PCPrev1, PCPrev2; //PCPrev2; /* MEM/ALU/PC MUXES */
	
	/* Last but not less important the conections */
	
	ControlUnit cu (PCSrc, RegWrite, MemWrite, MemtoReg, ALUSrc,
		ImmSrc, RegSrc, ALUControl, INSTR[31:28], {N,Z,C,V}, INSTR[27:26], INSTR[25:20], INSTR[15:12], CLK);
	
	PC pc (PC, PCPrev2, CLK);
	
	InstructionMemory	im (INSTR, PC);
	
	PCplus4 pcp4 (PCp4, PC);
	
	PCplus4 pcp8 (PCp8, PCp4);
	
	MUX_4 muxRB (MUXRB, INSTR[3:0], INSTR[15:12], RegSrc[1]);
	
	/* EXTRA */
	reg NotCompare;
	always @ (*) begin 
		if (RegWrite & INSTR[24:21]!=4'b1010) NotCompare = 1; 
		else NotCompare = 0;
	end
	
	RegisterFile rf (ReadDataA, ReadDataB, StackPointer, INSTR[19:16], MUXRB, INSTR[15:12], Result,
		NotCompare, CLK);

	Extend e (ExtImm, ImmSrc, INSTR[23:0]);
	
	MUX muxALUB (OPERB, ReadDataB, ExtImm, ALUSrc);
	
	MUX muxALUA (OPERA, ReadDataA, PCp8, RegSrc[0]);
	
	ALU alu (ALUResult, N, Z, V, C, OPERA, OPERB, ALUControl);
	
	Rotate rot (RotateResult, INSTR[6:5], ReadDataB, INSTR[11:7]);
	
	/* */
	wire [31:0] RESULT;
	reg ShiftSrc;
	always @ (*) begin ShiftSrc = (INSTR[27:26]==2'b00 & INSTR[24:21]==4'b1101 & ~INSTR[25]); end  
	MUX muxResult (RESULT, ALUResult, RotateResult, ShiftSrc);
	/* */
	
	//DataMemory dm (ReadData, RESULT, ReadDataB, MemWrite, CLK);

	DataMemory dm (ReadData, DATO1, DATO2, RESULTADO, RESULT, 
		ReadDataB, MouseData, MOUSECLICK, MemWrite, CLK);

	MUX muxRESULT (Result, RESULT, ReadData, MemtoReg);

	MUX muxPC (PCPrev1, PCp4, Result, PCSrc);

	MUX muxPC2 (PCPrev2, PCPrev1, StackPointer, MOUSECLICK);

endmodule
