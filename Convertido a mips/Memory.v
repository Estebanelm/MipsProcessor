`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:58:01 06/03/2017 
// Design Name: 
// Module Name:    Memory 
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
module Memory(
    input MemRead,
    input MemWrite,
    input [31:0] Address,
    input [31:0] WriteData,
	 input newchar,
	 input [15:0] char,
    output reg [31:0] MemData,
	 output wire [31:0] a3
    );

	reg [31:0] block [0:499];
	assign a3 = block[7];
	
	reg [1:0] contador = 0; //se utiliza para saber si viene operacion, num1 o num2

	integer i = 0;
	initial begin 
		for (i=0;i<500;i=i+1)
			block[i] <= 32'b0;
		MemData <= 32'b0;
	end

	always @ (*) begin
		if (newchar)
			if (char[15:8] != 8'hF0) begin
				contador = contador + 1;
				if (contador == 0) begin
					block[35] <= {24'b000000000000000000000000,char[7:0]};
				end
				else if (contador == 1) begin
					block[33] <= {24'b000000000000000000000000,char[7:0]};
					block[36] <= 1;
				end
				else if (contador == 2) begin
					block[34] <= {24'b000000000000000000000000,char[7:0]};
					block[37] <= 1;
				end
			end
		else
			begin
				if (MemRead)
					MemData <= block[Address];
				else if (MemWrite)
					block[Address] <= WriteData;
				else
					MemData <= 32'b0;
			end
	end

endmodule
