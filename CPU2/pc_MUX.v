`timescale 1ns / 1ps
`include "def.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:43:40 01/02/2019 
// Design Name: 
// Module Name:    pc_MUX 
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
module pc_MUX(in,addr_a,addr_b,flag,NPC,reset,wait_ID);
	input in;
	input [`PC_mem_AddrBus]addr_a;
	input [`PC_mem_Addr]addr_b;
	input [1:0]flag;
	output reg [`PC_mem_AddrBus]NPC=0;
	output reg reset;
	input wait_ID;

	initial begin
		NPC=0;
	end
	always@(*)begin
	if(wait_ID==0)begin
		case(flag)
			2'b00:NPC=addr_a+1;
			2'b01:NPC=in?addr_b[`PC_mem_AddrBus]:(addr_a+1);
			2'b10:NPC=in?(addr_a+1):addr_b[`PC_mem_AddrBus];
			2'b11:NPC=addr_b;
		endcase
		reset=(NPC==addr_b&NPC!==(addr_a+1));
	end
	end
endmodule
