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

wire selPC;
wire [31:0] salidaPC;
wire [31:0] salidaALUOut;
wire [31:0] Address;
Mux32bits2entradas MuxPCSource(
	selPC,
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

endmodule
