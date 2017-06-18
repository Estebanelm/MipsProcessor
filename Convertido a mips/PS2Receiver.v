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
    input clk,
    input kclk,
    input kdata,
    output [15:0] keycodeout
    );
    
    
    wire kclkf, kdataf;
	 
	 wire kclkf1, kdataf1;
	 assign kclkf1 = kclkf;
	 assign kdataf1 = kdataf;
    reg [7:0]datacur;
    reg [7:0]dataprev;
    reg [3:0]cnt;
    reg [15:0]keycode;
    reg flag;
    
    initial begin
        keycode[15:0]<=16'h0000;
        cnt<=4'b0000;
        flag<=1'b0;
    end
    
debouncer debounce(
    .clk(clk),
    .I0(kclk),
    .I1(kdata),
    .O0(kclkf),
    .O1(kdataf)
);
    
always@(negedge(kclkf1))begin
    case(cnt)
    0:;//Start bit
    1:datacur[0]<=kdataf1;
    2:datacur[1]<=kdataf1;
    3:datacur[2]<=kdataf1;
    4:datacur[3]<=kdataf1;
    5:datacur[4]<=kdataf1;
    6:datacur[5]<=kdataf1;
    7:datacur[6]<=kdataf1;
    8:datacur[7]<=kdataf1;
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
    
assign keycodeout=keycode;
    
endmodule