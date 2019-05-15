`timescale 1ns / 1ps
`include "def.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:42:35 12/30/2018 
// Design Name: 
// Module Name:    sign_extension 
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
module sign_extension(flag,sign_in,sign_out);
	input flag;
	input [`Imm_Bus_bf]sign_in;
	output reg [`PC_mem_Addr]sign_out;
	always @(*)begin
		if(flag==0)
			sign_out={{(`PC_mem_Addr_n-`Imm_n){0}},sign_in};
		else
			sign_out={{(`PC_mem_Addr_n-`Imm_n){sign_in[`Imm_n-1]}},sign_in};
	end
endmodule
