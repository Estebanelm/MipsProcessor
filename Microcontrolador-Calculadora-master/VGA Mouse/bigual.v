`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:25:07 11/22/2016 
// Design Name: 
// Module Name:    bigual 
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
module bigual(
	 input [2:0] in_row,
    output reg [4:0] out_code
    );

parameter [4:0] d_1 = 5'b11111; // XXXXX


always @ *
begin
	if (in_row == 3'b001 || in_row == 3'b011)
		out_code = d_1;
	else
		out_code = 5'b0;
end

endmodule
