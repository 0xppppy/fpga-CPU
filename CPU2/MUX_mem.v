`timescale 1ns / 1ps
`include "def.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:16:47 01/03/2019 
// Design Name: 
// Module Name:    MUX2 
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
module MUX_mem(clk,flag,in_a,in_b,in_c,in_d,out);
	input clk;
	input [1:0]flag;
	input [`Bus] in_a;
	input [`Bus] in_b;
	input [`Bus] in_c;
	output reg [`Bus] out;
	always@(*)begin
		case(flag)
		2'b00:out=in_a;
		2'b01:out=in_b;
		2'b10:out=in_c;
		endcase
	end
endmodule
