`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:29:01 01/03/2019
// Design Name:   top
// Module Name:   C:/Users/ppppy/Desktop/ISE_Project/CPU2/top_test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top_test;

	// Inputs
	reg [15:0] in_a;

	// Outputs
	wire [31:0] out_b;
	wire [5:0]out_c;
	wire [31:0]out_d;
	// Instantiate the Unit Under Test (UUT)
	top uut (
		.in_a(in_a), 
		.out_b(out_b),
		.out_c(out_c),
		.out_d(out_d)
	);

	initial begin
		// Initialize Inputs
		in_a = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		#1000 $stop;
		// Add stimulus here

	end
      
endmodule

