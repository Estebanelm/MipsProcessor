`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2015 09:08:56 PM
// Design Name: 
// Module Name: debouncer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module debouncer(
    input clk,
    input I0,
    input I1,
    output reg O0,
    output reg O1,
	 output reg [4:0] cnt1
    );
    
    reg [4:0] cnt1;
    reg Iv0=0,Iv1=0;
    reg out0, out1;
    
always@(posedge(clk))begin
    if (I1==Iv1)begin
            if (cnt1==19)O1<=I1;
            else cnt1<=cnt1+1;
          end
        else begin
            cnt1<=5'b00000;
            Iv1<=I1;
        end
    end
    
endmodule