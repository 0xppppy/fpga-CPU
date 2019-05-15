`timescale 1ns / 1ps
`include "def.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:02:46 12/30/2018 
// Design Name: 
// Module Name:    ID_EX 
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
module ID_EX(clk,reset,
		ALU_a_ID,ALU_b_ID,op_ID,fun_ID,
		jp_flag_ID,wite_reg_ID,addr3_ID,
		wite_mem_ID,read_mem_ID,rt_ID,
		raw_flag_ID,Imm_ID,ALU_mov_ID,Mux3_ID,
		//out
		ALU_a_EX,ALU_b_EX,op_EX,fun_EX,
		jp_flag_EX,wite_reg_EX,addr3_EX,
		wite_mem_EX,read_mem_EX,rt_EX,
		raw_flag_EX,Imm_EX,ALU_mov_EX,Mux3_EX);
		
	input clk;
	input reset;
	
	input  [`Rreg_Bus] ALU_a_ID,ALU_b_ID;

	input [1:0]op_ID;
	input [2:0]fun_ID;
	input ALU_mov_ID;
	input [1:0]jp_flag_ID;
	input wite_reg_ID;
	input [`Rreg_AddrBus]addr3_ID;
	input wite_mem_ID;
	input read_mem_ID;
	input [1:0]raw_flag_ID;
	input [`PC_mem_Addr]Imm_ID;
	input [`Rreg_Bus]rt_ID;
	input [1:0]Mux3_ID;
	
	output reg[`Rreg_Bus] ALU_a_EX,ALU_b_EX;
	output reg [1:0]op_EX;
	output reg [2:0]fun_EX;
	output reg ALU_mov_EX;
	output reg [1:0]jp_flag_EX;
	output reg wite_reg_EX;
	output reg [`Rreg_AddrBus]addr3_EX;
	output reg wite_mem_EX;
	output reg read_mem_EX;
	output reg [1:0]raw_flag_EX;
	output reg [`Rreg_Bus]rt_EX;
	output reg [`PC_mem_Addr]Imm_EX;
	output reg [1:0] Mux3_EX;

	always@(posedge clk)begin
			if(reset==1)begin
			op_EX=2'b0;
			fun_EX=3'b0;
			wite_reg_EX=0;
			wite_mem_EX=0;
			read_mem_EX=0;
			raw_flag_EX=2'b0;
			ALU_mov_EX=0;
			Mux3_EX=0;
			jp_flag_EX=0;
		end else begin
		ALU_a_EX=ALU_a_ID;
		ALU_b_EX=ALU_b_ID;
		op_EX=op_ID;
		fun_EX=fun_ID;
		jp_flag_EX=jp_flag_ID;
		wite_reg_EX=wite_reg_ID;
		addr3_EX=addr3_ID;
		wite_mem_EX=wite_mem_ID;
		read_mem_EX=read_mem_ID;
		raw_flag_EX=raw_flag_ID;
		rt_EX=rt_ID;
		Imm_EX=Imm_ID;
		ALU_mov_EX=ALU_mov_ID;
		Mux3_EX=Mux3_ID;
		end
	end
	
endmodule
