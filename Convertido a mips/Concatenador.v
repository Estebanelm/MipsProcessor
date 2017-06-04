`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:14:22 06/03/2017 
// Design Name: 
// Module Name:    Concatenador 
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
module Concatenador(
    input [27:0] salidaShiftLeft,
    input [31:0] salidaPC,
    output reg [31:0] salida
    );

	initial begin
		salida <= 32'b0;
	end

	always @ (*) begin
		salida <= {salidaPC[31:28], salidaShiftLeft};
	end

endmodule
