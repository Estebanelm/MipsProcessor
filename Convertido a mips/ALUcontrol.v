`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:42:23 06/03/2017 
// Design Name: 
// Module Name:    ALUcontrol 
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
module ALUcontrol(
    input [5:0] func,
    input [1:0] ALUOp,
    output reg [3:0] salida
    );

	initial begin
		salida <= 4'b1111;
	end

	always @ (*) begin
		case(ALUOp)
			0:	begin
					salida <= 4'b0010;
				end
			1:	begin
					salida <= 4'b0110;
				end
			2:	begin
					case(func)
						32:begin
								salida <= 4'b0010;
							end
						34:begin
								salida <= 4'b0110;
							end
						36:begin
								salida <= 4'b0000;
							end
						37:begin
								salida <= 4'b0001;
							end
						42:begin
								salida <= 4'b0111;
							end
					endcase
				end
			default:	begin
					salida <= 4'b1111;
				end
		endcase
	end

endmodule
