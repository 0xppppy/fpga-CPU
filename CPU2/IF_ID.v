`timescale 1ns / 1ps
`include "def.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:39:15 12/30/2018 
// Design Name: 
// Module Name:    IF_ID 
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
module IF_ID(clk,reset,IR,IR_out,wait_ID);
	input clk;
	input reset;
	input [`PC_mem_Bus]IR;
	input wait_ID;
	output reg [`PC_mem_Bus] IR_out;
	
	always@(posedge clk)begin
	if(reset==1)
		IR_out=31'b0;
	else begin
	if(wait_ID==0)
		IR_out=IR;
	end
	end
	
endmodule
