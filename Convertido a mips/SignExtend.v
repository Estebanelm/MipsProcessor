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

module SignExtend(out, in,ExtendSign);
	 
	 /* A 32-Bit output word */
    output  [31:0] out;
    
    /* A 16-Bit input word */
    input   [15:0] in;
	 input ExtendSign;
	 reg [31:0] out;

    always@(in,ExtendSign)
	 begin
		if (ExtendSign == 0) begin
			out <= {16'h0000 , in};
		end else begin
			if (in[15]==1)
			begin
			  out <= {16'hffff , in};
			end
			else 
			begin
			  out <= in;
			end
		end
	 end

endmodule
