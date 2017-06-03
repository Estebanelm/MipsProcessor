`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:37:00 11/09/2016 
// Design Name: 
// Module Name:    button_painter 
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
module button_painter(
	 input wire [1:0] row,
	 input wire [2:0] column,
	 input wire [3:0] in_row,
    output reg [11:0] code
    );

wire [4:0] d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, ds, dr, dm, dd, dmod, dsig, di;
reg [4:0] number;
reg [4:0] data;

num_0 n0 (
	 .in_row({in_row-2'b11}[2:0]),
	 .out_code(d0)
	 );

num_1 n1 (
	 .in_row({in_row-2'b11}[2:0]),
	 .out_code(d1)
	 );
	 
num_2 n2 (
	 .in_row({in_row-2'b11}[2:0]),
	 .out_code(d2)
	 );
	 
num_3 n3 (
	 .in_row({in_row-2'b11}[2:0]),
	 .out_code(d3)
	 );
	 
num_4 n4 (
	 .in_row({in_row-2'b11}[2:0]),
	 .out_code(d4)
	 );
	 
num_5 n5 (
	 .in_row({in_row-2'b11}[2:0]),
	 .out_code(d5)
	 );
	 
num_6 n6 (
	 .in_row({in_row-2'b11}[2:0]),
	 .out_code(d6)
	 );
	 
num_7 n7 (
	 .in_row({in_row-2'b11}[2:0]),
	 .out_code(d7)
	 );
	 
num_8 n8 (
	 .in_row({in_row-2'b11}[2:0]),
	 .out_code(d8)
	 );
	 
num_9 n9 (
	 .in_row({in_row-2'b11}[2:0]),
	 .out_code(d9)
	 );
	 
bsuma bsum (
	 .in_row({in_row-2'b11}[2:0]),
	 .out_code(ds)
	 );

bresta bres (
	 .in_row({in_row-2'b11}[2:0]),
	 .out_code(dr)
	 );

bmultip bmul (
	 .in_row({in_row-2'b11}[2:0]),
	 .out_code(dm)
	 );

bdiv bd (
	 .in_row({in_row-2'b11}[2:0]),
	 .out_code(dd)
	 );

bmod bm (
	 .in_row({in_row-2'b11}[2:0]),
	 .out_code(dmod)
	 );

bigual bi (
	 .in_row({in_row-2'b11}[2:0]),
	 .out_code(di)
	 );
	 
bsigno bsig (
	 .in_row({in_row-2'b11}[2:0]),
	 .out_code(dsig)
	 );
	 
always @ *
begin
	number = {(row * 6) + column}[4:0];
	case (number)
	5'b00000: data = d0;
	5'b00001: data = d1;
	5'b00010: data = d2;
	5'b00011: data = d3;
	5'b00100: data = d4;
	5'b00101: data = d5;
	5'b00110: data = d6;
	5'b00111: data = d7;
	5'b01000: data = d8;
	5'b01001: data = d9;
	5'b01010: data = ds;
	5'b01011: data = dr;
	5'b01100: data = dm;
	5'b01101: data = dd;
	5'b01110: data = dmod;
	5'b01111: data = di;
	5'b10000: data = dsig;
	default: data = 5'b0;
	endcase
	code = 12'b0;
	if((in_row > 2) && (in_row < 11))
		code[8:4] = data;
end

endmodule

