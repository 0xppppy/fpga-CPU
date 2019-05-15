`timescale 1ns / 1ps
`include "def.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:00:36 01/02/2019 
// Design Name: 
// Module Name:    EX_MEM 
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
module EX_MEM(clk,
	ALU0_EX,op_EX,wite_mem_data_EX,
	wite_mem_EX,read_mem_EX,wite_reg_EX,raw_flag_EX,wite_reg_addr_EX,
	ALU0_MEM,op_MEM,wite_mem_data_MEM,wite_reg_addr_MEM,
	wite_mem_MEM,read_mem_MEM,wite_reg_MEM,raw_flag_MEM
   );
	input clk;
	input [`Rreg_Bus]ALU0_EX;
	input [1:0]op_EX;
	input [`Rreg_Bus]wite_mem_data_EX;
	input wite_mem_EX;
	input read_mem_EX;
	input wite_reg_EX;
	input [1:0]raw_flag_EX;
	input [`Rreg_AddrBus]wite_reg_addr_EX;
	
	output reg [`Rreg_Bus]ALU0_MEM;
	output reg [1:0]op_MEM;
	output reg [`Rreg_Bus] wite_mem_data_MEM;
	output reg wite_mem_MEM;
	output reg read_mem_MEM;
	output reg wite_reg_MEM;
	output reg [1:0]raw_flag_MEM;
	output reg [`Rreg_AddrBus]wite_reg_addr_MEM;
	always@(posedge clk)begin
		ALU0_MEM=ALU0_EX;
		op_MEM=op_EX;
		wite_mem_data_MEM=wite_mem_data_EX;
		wite_mem_MEM=wite_mem_EX;
		read_mem_MEM=read_mem_EX;
		wite_reg_MEM=wite_reg_EX;
		raw_flag_MEM=raw_flag_EX;
		wite_reg_addr_MEM=wite_reg_addr_EX;
	end
endmodule
