`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:56:12 12/19/2018
// Design Name:   top
// Module Name:   C:/Users/py/Desktop/ise_project/test/test_top.v
// Project Name:  test
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

module test_top;

	// Inputs
	reg [15:0] in_a;

	// Outputs
	wire [15:0] out_b;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.in_a(in_a), 
		.out_b(out_b)
	);

	initial begin
		// Initialize Inputs
		in_a = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

