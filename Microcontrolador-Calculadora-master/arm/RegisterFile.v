`timescale 1ns / 1ps
module RegisterFile(
    output reg [31:0] ReadDataA,
    output reg [31:0] ReadDataB,
	 output reg [31:0] StackPointer,
    input [3:0] DirA,
    input [3:0] DirB,
    input [3:0] DirC,
    input [31:0] WriteData,
    input WriteEnable,
    input CLK
    );
	 
	reg [31:0] register [0:15];

	always @ (*) begin
		if (CLK) begin
			ReadDataA = register[DirA];
			ReadDataB = register[DirB];
			StackPointer = register[13];
		end
		else begin
			if (WriteEnable)
				register[DirC] = WriteData;
		end
	end

	/* que es mas eficiente, initial (Cual?) o no initial*/
	integer i = 0;
	initial begin 
		for (i=0;i<16;i=i+1)
			register[i] = 32'b0;
	end

endmodule
