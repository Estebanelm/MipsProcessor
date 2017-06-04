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
	 input clk,
    input [4:0] Op,
	 output reg PCWriteCond,
	 output reg PCWrite,
	 output reg IorD,
	 output reg MemRead,
	 output reg MemWrite,
	 output reg MemtoReg,
	 output reg IRWrite,
	 output reg [1:0] PCSource,
	 output reg [1:0] ALUOp,
	 output reg [1:0] ALUSrcB,
	 output reg ALUSrcA,
	 output reg RegWrite,
	 output reg RegDst
    );



endmodule
