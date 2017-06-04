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
    output reg [31:0] MemData
    );

	reg [31:0] block [0:199];

	integer i = 0;
	initial begin 
		for (i=0;i<200;i=i+1)
			block[i] <= 32'b0;
		MemData <= 32'b0;
	end

	always @ (*) begin
		if (MemRead)
			MemData <= block[Address];
		else if (MemWrite)
			block[Address] <= WriteData;
		else
			MemData <= 32'b0;
	end

endmodule
