`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:50:20 11/21/2016 
// Design Name: 
// Module Name:    num_chooser 
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
module num_chooser(
	 output reg [4:0] res_out_code,
	 input wire [2:0] res_in_row,
	 input wire [3:0] num_salida
    );

wire [4:0] d0, d1, d2, d3, d4, d5, d6, d7, d8, d9;

num_0 n0 (
	 .in_row(res_in_row),
	 .out_code(d0)
	 );

num_1 n1 (
	 .in_row(res_in_row),
	 .out_code(d1)
	 );
	 
num_2 n2 (
	 .in_row(res_in_row),
	 .out_code(d2)
	 );
	 
num_3 n3 (
	 .in_row(res_in_row),
	 .out_code(d3)
	 );
	 
num_4 n4 (
	 .in_row(res_in_row),
	 .out_code(d4)
	 );
	 
num_5 n5 (
	 .in_row(res_in_row),
	 .out_code(d5)
	 );
	 
num_6 n6 (
	 .in_row(res_in_row),
	 .out_code(d6)
	 );
	 
num_7 n7 (
	 .in_row(res_in_row),
	 .out_code(d7)
	 );
	 
num_8 n8 (
	 .in_row(res_in_row),
	 .out_code(d8)
	 );
	 
num_9 n9 (
	 .in_row(res_in_row),
	 .out_code(d9)
	 );

always @ *
begin
	case (num_salida)
	4'b0000: res_out_code = d0;
	4'b0001: res_out_code = d1;
	4'b0010: res_out_code = d2;
	4'b0011: res_out_code = d3;
	4'b0100: res_out_code = d4;
	4'b0101: res_out_code = d5;
	4'b0110: res_out_code = d6;
	4'b0111: res_out_code = d7;
	4'b1000: res_out_code = d8;
	4'b1001: res_out_code = d9;
	default: res_out_code = 5'b0;
	endcase
end

endmodule
