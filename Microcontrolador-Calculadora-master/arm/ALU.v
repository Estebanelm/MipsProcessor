`timescale 1ns / 1ps
module ALU(
    output reg signed [31:0] RESULT,
    output reg N,
    output reg Z,
    output reg V,
    output reg C,
    input signed [31:0] OPERA,
    input signed [31:0] OPERB,
    input [1:0] FUNC
    );

	reg Carry;

	always @ (*) begin
		Carry = 1'b0;
		case (FUNC)
			2'b00: {Carry,RESULT} = OPERA + OPERB;
			2'b01: {Carry,RESULT} = OPERA - OPERB;
			2'b10: RESULT = OPERA & OPERB;
			2'b11: RESULT = OPERA | OPERB;
			default: RESULT = 32'b0;
		endcase
		
		N = RESULT[31];
		Z = (RESULT == 0);
		C = ~FUNC[1] & Carry;
		V = (RESULT[31] | OPERA[31]) & ~FUNC[1] & ~(FUNC[0] | OPERA[31] | OPERB[31]);
		
	end

endmodule
