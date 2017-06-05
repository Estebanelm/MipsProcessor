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
    input [5:0] Op,
	 output reg PCWriteCond,
	 output reg PCWriteCondN,
	 output reg PCWrite,
	 output reg IorD,
	 output reg MemRead,
	 output reg MemWrite,
	 output reg MemtoReg,
	 output reg IRWrite,
	 output reg [1:0] PCSource,
	 output reg [2:0] ALUOp,
	 output reg [1:0] ALUSrcB,
	 output reg ALUSrcA,
	 output reg RegWrite,
	 output reg RegDst
    );
	
	parameter Instructionfetch=0, Instructiondecode=1, Memoryaddresscomp=2;
	parameter Memoryaccess1=3, Memoryread=4, Memoryaccess2=5, Execution=6;
	parameter Rtypecompletion=7, Branchcompletion=8, Jumpcompletion=9;
	parameter ImmExecution=10;
	reg [3:0] EstadoActual;

	initial begin
		PCWriteCond <= 0;
		PCWrite <= 0;
		IorD <= 1;
		MemRead <= 0;
		MemWrite <= 0;
		MemtoReg <= 1;
	   IRWrite <= 0;
	   PCSource <= 2'b11;
	   ALUOp <= 3'b011;
	   ALUSrcB <= 2'b11;
		ALUSrcA <= 1;
		RegWrite <= 0;
		RegDst <= 1;
		EstadoActual <= Instructionfetch;
	end
	
	always @ (posedge clk) begin
			case(EstadoActual)
				Instructionfetch:
					begin
						PCWriteCond <= 0;
						PCWriteCondN <= 0;
						RegWrite <= 0;
						MemWrite <= 0;
						MemRead <= 1;
						ALUSrcA <= 0;
						IorD <= 0;
						IRWrite <= 1;
						ALUSrcB <= 2'b01;
						ALUOp <= 3'b000;
						PCWrite <= 1;
						PCSource <= 2'b00;
						EstadoActual <= Instructiondecode;
					end
				Instructiondecode:
					begin
						MemRead <= 0;
						IRWrite <= 0;
						PCWrite <= 0;
						ALUSrcA <= 0;
						ALUSrcB <= 2'b11;
						ALUOp <= 3'b000;
						case(Op)
							0: //Tipo R
								EstadoActual <= Execution;
							6'b100111, 6'b101011: //lw o sw
								EstadoActual <= Memoryaddresscomp;
							4, 5: //Beq o bne
								EstadoActual <= Branchcompletion;
							2: //jump
								EstadoActual <= Jumpcompletion;
							8, 6'b001100, 6'b001101: //addi, andi, ori
								EstadoActual <= ImmExecution;
							default:
								EstadoActual <= Instructionfetch;
						endcase
					end
				Memoryaddresscomp:
					begin
						ALUSrcA <= 1;
						ALUSrcB <= 2'b10;
						ALUOp <= 3'b000;
						if (Op == 6'b100111) //lw
							EstadoActual <= Memoryaccess1;
						else if (Op == 6'b101011) //sw
							EstadoActual <= Memoryaccess2;
					end
				Memoryaccess1:
					begin
						MemRead <= 0;
						IorD <= 1;
						EstadoActual <= Memoryread;
					end
				Memoryread:
					begin
						MemRead <= 0;
						RegDst <= 0;
						RegWrite <= 1;
						MemtoReg <= 1;
						EstadoActual <= Instructionfetch;
					end
				Memoryaccess2:
					begin
						MemWrite <= 1;
						IorD <= 1;
						EstadoActual <= Instructionfetch;
					end
				Execution:
					begin
						ALUSrcA <= 1;
						ALUSrcB <= 2'b00;
						ALUOp <= 3'b010;
						EstadoActual <= Rtypecompletion;
					end
				Rtypecompletion:
					begin
						RegDst <= 1;
						RegWrite <= 1;
						MemtoReg <= 0;
						EstadoActual <= Instructionfetch;
					end
				Branchcompletion:
					begin
						ALUSrcA <= 1;
						ALUSrcB <= 2'b00;
						ALUOp <= 3'b001;
						PCSource <= 2'b01;
						EstadoActual <= Instructionfetch;
						if (Op == 4)
							PCWriteCond <= 1;
						else if (Op == 5)
							PCWriteCondN <= 1;
					end
				Jumpcompletion:
					begin
						PCWrite <= 1;
						PCSource <= 2'b10;
						EstadoActual <= Instructionfetch;
					end
				ImmExecution:
					begin
						ALUSrcA <= 1;
						ALUSrcB <= 2'b10;
						EstadoActual <= Rtypecompletion;
						if (Op == 8)
							ALUOp <= 3'b100;
						else if (Op == 6'b001100)
							ALUOp <= 3'b101;
						else if (Op == 6'b001101)
							ALUOp <= 3'b110;
					end
			endcase
	end

endmodule
