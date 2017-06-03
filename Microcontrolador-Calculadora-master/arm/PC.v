`timescale 1ns / 1ps
module PC(
    output reg[31:0] PCnext,
    input [31:0] PCprev,
	 input CLK
    );
	 
	/* Inicio de la maquina */
	initial begin
		PCnext = 32'b0;
	end
	 
	/* En el flanco de subida */
	always @ (CLK) begin
		if (CLK)
			PCnext = PCprev;
	end
	
endmodule
