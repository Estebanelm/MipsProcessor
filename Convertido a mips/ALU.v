`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:15:05 06/03/2017 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [31:0] entradaA,
    input [31:0] entradaB,
    input [3:0] entradaControl,
    output reg Zero,
    output reg [31:0] ALUresult
    );

	initial begin
		Zero <= 0;
		ALUresult <= 32'b0;
	end

	always @(*) begin
	case(entradaControl)
		0:
			begin
				ALUresult <= entradaA & entradaB;
			end
		1:
			begin
				ALUresult <= entradaA | entradaB;
			end
		2:
			begin
				ALUresult <= entradaA + entradaB;
			end
		6:
			begin
				ALUresult <= entradaA + (~entradaB + 1);
			end
		7: 
			begin
				if (entradaA[31] != entradaB[31]) begin
					if (entradaA[31] > entradaB[31]) begin
						ALUresult <= 1;
					end else begin
						ALUresult <= 0;
					end
				end else begin
					if (entradaA < entradaB)
						begin
							ALUresult <= 1;
						end
					else
						begin
							ALUresult <= 0;
						end
				end
			end
		12:
			begin
				ALUresult <= !(entradaA|entradaB);
			end
		default:
			begin
				ALUresult <= 0;
			end
		endcase
	end

	always @(ALUresult) begin
		if (ALUresult == 0) begin
			Zero <= 1;
		end else begin
			Zero <= 0;
		end
	
	end

endmodule
