`timescale 1ns / 1ps
module ConditionCheck(
    output reg CondEx,
    input [3:0] Cond,
    input [3:0] Flags //{N,Z,C,V}
    );

	wire N, Z, C, V;
	
	assign N = Flags[3];
	assign Z = Flags[2];
	assign C = Flags[1];
	assign V = Flags[0];

	always @ (*) begin
		case (Cond)
			4'b0000: CondEx = Z; 			//Equal
			4'b0001: CondEx = ~Z; 			//Not Equal
			4'b0010: CondEx = C; 			//Carry Set
			4'b0011: CondEx = ~C;			//Carry Clear
			4'b0100: CondEx = N;				//Minus
			4'b0101: CondEx = ~N;			//Plus
			4'b0110: CondEx = V;				//Overflow
			4'b0111: CondEx = ~V;			//Not Overflow
			4'b1000: CondEx = ~Z & C;		//Unsigned Higer
			4'b1001: CondEx = Z | ~C;		//Unsigned Lower
			4'b1010: CondEx = ~(N^V);		//Signed greater than or equal
			4'b1011: CondEx = (N^V);		//Signed less than
			4'b1100: CondEx = ~Z & ~(N^V);//Signed greater than
			4'b1101: CondEx = Z | (N^V);//Signed less than or equal
			4'b1110: CondEx = 1;				//Always 
			// CondEx es 1 en Always?? 
			default: CondEx = 0;
		endcase
	end
	
endmodule
