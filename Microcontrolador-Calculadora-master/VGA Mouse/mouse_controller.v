`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:11:59 09/30/2016 
// Design Name: 
// Module Name:    mouse_controller 
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
module mouse_controller(
	 input clk,
    input [8:0] xm,
    input [8:0] ym,
    output reg[9:0] mouse_x,
    output reg[8:0] mouse_y
    );

initial mouse_x = 320;
initial mouse_y = 240;
reg[9:0] result;
always @(posedge clk)
begin
	mouse_x = mouse_x + {xm[8], xm};
	if(mouse_x > 639)
		mouse_x = 0;
	result = mouse_y - {ym[8], ym};
	mouse_y = result[8:0];
	if(mouse_y > 479)
		mouse_y = 0;
end
endmodule
