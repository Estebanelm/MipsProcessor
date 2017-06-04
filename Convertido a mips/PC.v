`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Description - 32-Bit program counter (PC) register.
// 
// INPUTS:-
// Address: 32-Bit address input port.
// Reset: 1-Bit input control signal.
// Clk: 1-Bit input clock signal.
//
// OUTPUTS:-
// PCResult: 32-Bit registered output port.
//
////////////////////////////////////////////////////////////////////////////////

module PC(PCNext, PCResult, Reset, Clk,PCWrite);

	input [31:0] PCNext;
	input Reset, Clk,PCWrite;
	output reg [31:0]  PCResult;

	initial begin
	
		PCResult <= 32'h00000000;
	end

    always @(posedge Clk)
    begin
    	if (Reset == 1)
    	begin
    		PCResult <= 32'h00000000;
    	end
    	else
    	begin
			if (PCWrite == 1) 
			begin
				PCResult <= PCNext;
			end
    	end
    end

endmodule
