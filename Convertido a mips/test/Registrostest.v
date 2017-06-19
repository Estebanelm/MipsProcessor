`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:28:09 06/18/2017
// Design Name:   Registers
// Module Name:   C:/Users/Pelo/Documents/Proyectos taller/Proyecto 4/Convertido a mips/test/Registrostest.v
// Project Name:  Proyecto4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Registers
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Registrostest;

	// Inputs
	reg Clk;
	reg [4:0] ReadRegister1;
	reg [4:0] ReadRegister2;
	reg [4:0] WriteRegister;
	reg [31:0] WriteData;
	reg RegWrite;

	// Outputs
	wire [31:0] ReadData1;
	wire [31:0] ReadData2;

	// Instantiate the Unit Under Test (UUT)
	Registers uut (
		.Clk(Clk), 
		.ReadRegister1(ReadRegister1), 
		.ReadRegister2(ReadRegister2), 
		.WriteRegister(WriteRegister), 
		.WriteData(WriteData), 
		.RegWrite(RegWrite), 
		.ReadData1(ReadData1), 
		.ReadData2(ReadData2)
	);

	initial begin
		// Initialize Inputs
		Clk = 0;
		ReadRegister1 = 0;
		ReadRegister2 = 0;
		WriteRegister = 0;
		WriteData = 0;
		RegWrite = 0;

		// Wait 100 ns for global reset to finish
		#5 RegWrite = 1;
		WriteData = 5;
		WriteRegister = 1;
		#2 RegWrite = 0;
		#2 ReadRegister1 = 1;
		
		// Add stimulus here

	end
      
		always begin
		#2 Clk <= ~Clk;
		end
endmodule

