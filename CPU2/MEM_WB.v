`timescale 1ns / 1ps
`include "def.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:53:29 01/02/2019 
// Design Name: 
// Module Name:    MEM_WB 
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
module MEM_WB(clk,
	wite_reg_MEM,read_mem_MEM,wite_reg_addr_MEM,ALU0_MEM,read_mem_data_MEM,
	wite_reg_WB,wite_reg_addr_WB,read_mem_WB,ALU0_WB,read_mem_data_WB);
	
	input clk;
	input wite_reg_MEM;
	input read_mem_MEM;
	input [`Rreg_AddrBus]wite_reg_addr_MEM;
	input [`Rreg_Bus]ALU0_MEM;
	input [`Rreg_Bus]read_mem_data_MEM;
	
	output reg wite_reg_WB;
	output reg read_mem_WB;
	output reg [`Rreg_AddrBus]wite_reg_addr_WB;
	output reg [`Rreg_Bus]ALU0_WB;
	output reg [`Rreg_Bus]read_mem_data_WB;
	always@(posedge clk)begin
		wite_reg_WB=wite_reg_MEM;
		wite_reg_addr_WB=wite_reg_addr_MEM;
		read_mem_WB=read_mem_MEM;
		ALU0_WB=ALU0_MEM;
		read_mem_data_WB=read_mem_data_MEM;
	end


endmodule
