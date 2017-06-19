`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Digilent Inc.
// Engineer: Thomas Kappenman
// 
// Create Date: 03/03/2015 09:06:31 PM
// Design Name: 
// Module Name: top
// Project Name: Nexys4DDR Keyboard Demo
// Target Devices: Nexys4DDR
// Tool Versions: 
// Description: This project takes keyboard input from the PS2 port,
//  and outputs the keyboard scan code to the 7 segment display on the board.
//  The scan code is shifted left 2 characters each time a new code is
//  read.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
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
