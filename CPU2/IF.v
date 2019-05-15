`timescale 1ns / 1ps
`include "def.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:01:10 12/30/2018 
// Design Name: 
// Module Name:    IF 
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
module IF(clk,NPC,PC_out);
	input clk;
	input [`PC_mem_AddrBus]NPC;
	
	output reg [`PC_mem_AddrBus] PC_out=0;
	
	reg [`PC_mem_AddrBus] PC=-1;
	
	always@(posedge clk)begin
		PC=NPC;
		PC_out=PC;
	end


endmodule
