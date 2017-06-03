`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:14:05 10/17/2016 
// Design Name: 
// Module Name:    num_4 
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
module num_4(
    input [2:0] in_row,
    output reg [4:0] out_code
    );

parameter [4:0] d_0 = 5'b01000; //  X
parameter [4:0] d_1 = 5'b01100; //  XX
parameter [4:0] d_2 = 5'b01010; //  X X 
parameter [4:0] d_3 = 5'b11111; // XXXXX


always @ *
begin
	case (in_row)
		3'b000:
			out_code = d_0;
		3'b001:
			out_code = d_1;
		3'b010:
			out_code = d_2;
		3'b011:
			out_code = d_3;
		3'b100:
			out_code = d_0;
		3'b101:
			out_code = d_0;
		default:
			out_code = 5'b0;
	endcase
end


endmodule
