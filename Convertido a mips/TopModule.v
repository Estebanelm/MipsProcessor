`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Digilent Inc.
// 
// 
// Creator: Esteban Calvo, Frander Granados
// Design Name: 
// Module Name: top
// Project Name: MipsProcessos
// 
////////////////////////////////////////////////////////////////////////////////// 


module TopModule(
    input clk,
	 input rst,
    input PS2_CLK,
    input PS2_DATA,
    output [6:0]SEG,
    output [3:0]AN,
    output DP
    );
    
reg CLK50MHZ=0;    
wire [15:0]keycode;
wire newchar;

PS2Receiver keyboard(
clk,
CLK50MHZ,
PS2_CLK,
PS2_DATA,
keycode,
newchar
);

seg7decimal sevenSeg(
keycode,
clk,
SEG,
AN,
DP
);

MIPSProcessor procesador(
clk,
rst,
newchar,
keycode[15:0]
);



always @(posedge(clk))begin
    CLK50MHZ<=~CLK50MHZ;
end

endmodule
