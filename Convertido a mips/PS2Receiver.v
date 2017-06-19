`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Digilent Inc.
// Engineer: Thomas Kappenman
// 
// Create Date: 03/03/2015 09:33:36 PM
// Design Name: 
// Module Name: PS2Receiver
// Project Name: Nexys4DDR Keyboard Demo
// Target Devices: Nexys4DDR
// Tool Versions: 
// Description: PS2 Receiver module used to shift in keycodes from a keyboard plugged into the PS2 port
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PS2Receiver(
	 input clkorig,
    input clk,
    input kclk,
    input kdata,
    output [15:0] keycodeout,
	 output reg newchar
    );
    
	 
    reg [7:0]datacur;
    reg [7:0]dataprev;
    reg [3:0]cnt;
    reg [15:0]keycode;
    reg flag;
	 
	 assign keycodeout=keycode;
    
    initial begin
        keycode[15:0]<=16'h0000;
        cnt<=4'b0000;
        flag<=1'b0;
		  newchar = 0;
    end
    
always@(negedge(kclk))begin
    case(cnt)
    0:;//Start bit
    1:datacur[0]<=kdata;
    2:datacur[1]<=kdata;
    3:datacur[2]<=kdata;
    4:datacur[3]<=kdata;
    5:datacur[4]<=kdata;
    6:datacur[5]<=kdata;
    7:datacur[6]<=kdata;
    8:datacur[7]<=kdata;
    9:flag<=1'b1;
    10:flag<=1'b0;
    
    endcase
        if(cnt<=9) cnt<=cnt+1;
        else if(cnt==10) cnt<=0;
        
end

always @(posedge flag)begin
    if (dataprev!=datacur)begin
        keycode[15:8]<=dataprev;
        keycode[7:0]<=datacur;
        dataprev<=datacur;
    end
end

always @ (posedge clk)begin
	if (dataprev!=datacur && flag==1)
		newchar <= 1;
	else
		newchar <= 0;
end

    
endmodule