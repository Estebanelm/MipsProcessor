`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:01:24 06/04/2017 
// Design Name: 
// Module Name:    SignExtend 
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

module SignExtend(in, out);
	 
	 /* A 32-Bit output word */
    output reg  [31:0] out;
    
    /* A 16-Bit input word */
    input   [15:0] in;

	 initial begin
		out <= 32'b00000000000000000000000000000000;
	 end

    always @(*)
	 begin
		if (in[15] == 0) begin
			out <= {16'b0000000000000000 , in};
		end else begin
			 out <= {16'b1111111111111111 , in};
			end
	 end

endmodule
