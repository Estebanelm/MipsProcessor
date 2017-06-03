`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:48:36 06/03/2017 
// Design Name: 
// Module Name:    Control 
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
module Control(
    input [4:0] Op
    );

reg RegDst = 0;
wire [4:0] Instruction2016;
wire [4:0] Instruction1511;
wire [4:0] WriteRegister;
Mux5bits2entradas MuxRegDst(
	RegDst,
	WriteRegister,
	Instruction2016,
	Instruction1511
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
	
reg MemtoReg = 0;
wire [31:0] salidaMemorydataregister;
wire [31:0] WriteData;
Mux32bits2entradas MuxMemtoReg(
	MemtoReg,
	salidaALUOut,
	salidaMemorydataregister,
	WriteData
);

reg ALUSrcA = 0;
wire [31:0] salidaRegisterA;
wire [31:0] entradaALU1;
Mux32bits2entradas MuxALUSrcA(
	ALUSrcA,
	salidaPC,
	salidaRegisterA,
	entradaALU1
);

reg [1:0] ALUSrcB = 0;
wire [31:0] salidaRegisterB;
reg [31:0] registerBnum4 = 32'b00000000000000000000000000000100;
wire [31:0] salidaSignExtend;
wire [31:0] salidaShiftLeft32;
wire [31:0] entradaALU2;
Mux32bits4entradas MuxALUSrcB(
	ALUSrcB,
	registerBnum4,
	salidaSignExtend,
	salidaShiftLeft32,
	entradaALU2
);

reg [1:0] PCSource = 0;
wire [31:0] ALUResult;
wire [31:0] salidaConcatenador;
wire [31:0] entradaPC;
Mux32bits4entradas MuxPCSource(
	PCSource,
	ALUResult,
	salidaALUOut,
	salidaConcatenador,
	entradaPC
);

reg MemRead = 0;
reg MemWrite = 0;
wire MemData;
Memory Memory(
	MemRead,
	MemWrite,
	Address,
	salidaRegisterB,
	MemData
);

wire salidaShiftLeft26;
Concatenador Concatenador(
   salidaShiftLeft26,
	salidaPC,
	salidaConcatenador
);

wire Zero;
reg PCWriteCond = 0;
reg PCWrite = 0;
wire selPC;
LogicaCombinacionalPC LogicaSelPC(
	Zero,
	PCWriteCond,
	PCWrite,
	selPC
);

endmodule
