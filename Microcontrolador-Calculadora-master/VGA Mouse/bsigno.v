`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:26:30 11/21/2016 
// Design Name: 
// Module Name:    bsigno 
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
module bsigno(
	 input [2:0] in_row,
    output reg [4:0] out_code
    );

parameter [4:0] d_0 = 5'b00100; //   X
parameter [4:0] d_1 = 5'b01110; //  XXX


always @ *
begin
	case (in_row)
		3'b000:
			out_code = d_0;
		3'b001:
			out_code = d_1;
		3'b010:
			out_code = d_0;
		3'b011:
			out_code = 5'b0;
		3'b100:
			out_code = d_1;
		default:
			out_code = 5'b0;
	endcase
end

endmodule
