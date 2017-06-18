`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:19:03 06/17/2017
// Design Name:   Memory
// Module Name:   C:/Users/Pelo/Documents/Proyectos taller/Proyecto 4/Convertido a mips/test/Memorytest.v
// Project Name:  Proyecto4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Memorytest;

	// Inputs
	reg MemRead;
	reg MemWrite;
	reg [31:0] Address;
	reg [31:0] WriteData;

	// Outputs
	wire [31:0] MemData;

	// Instantiate the Unit Under Test (UUT)
	Memory uut (
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.Address(Address), 
		.WriteData(WriteData), 
		.MemData(MemData)
	);

	initial begin
		// Initialize Inputs
		MemRead = 0;
		MemWrite = 0;
		Address = 0;
		WriteData = 0;

		// Wait 100 ns for global reset to finish
		#10;
		#5 MemWrite = 1;
		#5 Address = 10;
		#5 WriteData = 32'b10101010101010101010101010101010;
		#5 Address = 5;
		#5 MemWrite = 0;
		MemRead = 1;
		#5 Address = 10;
        
		// Add stimulus here

	end
      
endmodule

