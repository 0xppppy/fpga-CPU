`timescale 1ns / 1ps
`include "def.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:55:28 12/30/2018 
// Design Name: 
// Module Name:    MUX 
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
module MUX(flag,in_a,in_b,in_c,in_d,in_e,out);
	input [2:0]flag;
	input [`Bus] in_a;
	input [`Bus] in_b;
	input [`Bus] in_c;
	input [`Bus] in_d;
	input [`Bus] in_e;
	output reg [`Bus] out;
	
	always@(*)begin
		case(flag)
		3'b00:out=in_a;
		3'b01:out=in_b;
		3'b10:out=in_c;
		3'b11:out=in_d;
		3'b100:out=in_e;
		endcase
	end
endmodule
