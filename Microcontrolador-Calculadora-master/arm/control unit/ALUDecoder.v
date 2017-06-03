`timescale 1ns / 1ps
module ALUDecoder(
    output reg[1:0] ALUControl,
    output reg[1:0] FlagW,
    input [4:0] Funct,
    input ALUOp
    );

	always @ (*) begin
		if (ALUOp) begin
			case (Funct[4:1])
				4'b0100: begin
					ALUControl = 2'b00; //Add
					FlagW = (~Funct[0]) ? 2'b00 : 2'b11;
				end
				4'b0010: begin
					ALUControl = 2'b01; //Sub
					FlagW = (~Funct[0]) ? 2'b00 : 2'b11;
				end
				4'b1010: begin
					ALUControl = 2'b01; //Comp
					FlagW = (~Funct[0]) ? 2'b00 : 2'b11;
				end
				4'b0000: begin
					ALUControl = 2'b10; //And
					FlagW = (~Funct[0]) ? 2'b00 : 2'b10;
				end
				4'b1100: begin
					ALUControl = 2'b11; //Or
					FlagW = (~Funct[0]) ? 2'b00 : 2'b10;
				end
				default: begin
					ALUControl = 2'b00; //Default
					FlagW = (~Funct[0]) ? 2'b00 : 2'b11;
				end
			endcase
		end
		else begin
			ALUControl = 2'b0;
			FlagW = 2'b0;
		end
	end

endmodule
