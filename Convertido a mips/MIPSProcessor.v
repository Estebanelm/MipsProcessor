`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:20:40 06/03/2017 
// Design Name: 
// Module Name:    MIPSProcessor 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module MIPSProcessor(
    input clk,
	 input rst
    );

wire RegDst;
wire [31:0] Instruction;
wire [4:0] WriteRegister;
Mux5bits2entradas MuxRegDst(
	RegDst,
	WriteRegister,
	Instruction[20:16],
	Instruction[15:11]
);

wire IorD;
wire [31:0] salidaPC;
wire [31:0] salidaALUOut;
wire [31:0] Address;
Mux32bits2entradas MuxIorD(
	IorD,
   salidaPC,
   salidaALUOut,
   Address
);
	
wire MemtoReg;
wire [31:0] salidaMemorydataregister;
wire [31:0] WriteData;
Mux32bits2entradas MuxMemtoReg(
	MemtoReg,
	salidaALUOut,
	salidaMemorydataregister,
	WriteData
);

wire ALUSrcA;
wire [31:0] salidaRegisterA;
wire [31:0] entradaALU1;
Mux32bits2entradas MuxALUSrcA(
	ALUSrcA,
	salidaPC,
	salidaRegisterA,
	entradaALU1
);

wire [1:0] ALUSrcB;
wire [31:0] salidaRegisterB;
reg [31:0] registerBnum4 = 32'b00000000000000000000000000000100;
wire [31:0] salidaSignExtend;
wire [31:0] salidaShiftLeft32;
wire [31:0] entradaALU2;
Mux32bits4entradas MuxALUSrcB(
	ALUSrcB,
	salidaRegisterB,
	registerBnum4,
	salidaSignExtend,
	salidaShiftLeft32,
	entradaALU2
);

wire [1:0] PCSource;
wire [31:0] salidaConcatenador;
wire [31:0] entradaPC;
wire [31:0] salidaALU;
reg [31:0] num0 = 32'b00000000000000000000000000000000;
Mux32bits4entradas MuxPCSource(
	PCSource,
	salidaALU,
	salidaALUOut,
	salidaConcatenador,
	num0,
	entradaPC
);

wire MemRead;
wire MemWrite;
wire [31:0] MemData;
Memory Memory(
	MemRead,
	MemWrite,
	Address,
	salidaRegisterB,
	MemData
);

wire [27:0] salidaShiftLeft26;
Concatenador Concatenador(
   salidaShiftLeft26,
	salidaPC,
	salidaConcatenador
);

wire Zero;
wire PCWriteCond;
wire PCWriteCondN;
wire PCWrite;
wire selPC;
wire selPCN;
LogicaCombinacionalPC LogicaSelPC(
	Zero,
	PCWriteCond,
	PCWriteCondN,
	PCWrite,
	selPC,
	selPCN
);

wire [3:0] salidaALUcontrol;
ALU ALU(
	entradaALU1,
	entradaALU2,
	salidaALUcontrol,
	Zero,
	salidaALU
);

wire [2:0] ALUOp;
ALUcontrol ALUcontrol(
	Instruction[5:0],
	ALUOp,
	salidaALUcontrol
);

wire IRWrite;
wire RegWrite;
Control Control(
	clk,
	Instruction[31:26],
	PCWriteCond,
	PCWriteCondN,
	PCWrite,
	IorD,
	MemRead,
	MemWrite,
	MemtoReg,
	IRWrite,
	PCSource,
	ALUOp,
	ALUSrcB,
	ALUSrcA,
	RegWrite,
	RegDst
);

PC PC(
	clk,
	rst,
	entradaPC,
	selPC,
	selPCN,
	salidaPC
);

wire [31:0] ReadData1;
wire [31:0] ReadData2;
Registers Registers(
	clk,
	Instruction[25:21],
	Instruction[20:16],
	WriteRegister,
	WriteData,
	RegWrite,
	ReadData1,
	ReadData2
);

SignExtend SignExtend(
	Instruction[15:0],
	salidaSignExtend
);

Register32bitsconEn Instructionregister(
	clk,
	MemData,
	IRWrite,
	Instruction
);

Register32bitssinEn Memorydataregister(
	clk,
	MemData,
	salidaMemorydataregister
);

ShiftLeft32 Shiftleft32(
	salidaSignExtend,
	salidaShiftLeft32
);

Register32bitssinEn A(
	clk,
	ReadData1,
	salidaRegisterA
);

Register32bitssinEn B(
	clk,
	ReadData2,
	salidaRegisterB
);

Register32bitssinEn ALUOut(
	clk,
	salidaALU,
	salidaALUOut
);

ShiftLeft26 Shiftlef26(
	Instruction[25:0],
	salidaShiftLeft26
);

endmodule
