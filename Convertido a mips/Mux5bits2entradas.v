`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:54:29 06/03/2017 
// Design Name: 
// Module Name:    MuxRegDst 
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
module Mux5bits2entradas(
    input RegDst,
    output reg [4:0] WriteRegister,
    input [4:0] Instruction2016,
    input [4:0] Instruction1511
    );

	initial begin WriteRegister <= 5'b0; end

	always @ (*) begin
		if (~RegDst)
			WriteRegister <= Instruction2016;
		else
			WriteRegister <= Instruction1511;
	end
	

endmodule
