`timescale 1ns / 1ps
`include "def.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:53:24 12/27/2018 
// Design Name: 
// Module Name:    Memory 
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
module PC_Mem(clk,NPC,IR,PC_IF);
	
	input clk;
	input [`PC_mem_AddrBus] NPC;
	output reg [`PC_mem_Addr]IR=0;
	output reg [`PC_mem_AddrBus] PC_IF;
	
	reg [`PC_mem_Bus] pc_mem [`PC_mem_Addr];
	
	initial begin
		//pc_mem[0]={`SD,5'b0,5'b111,16'b1};
		pc_mem[0]={`LOD,5'b0,5'b1,16'b110};//R1=mem[R0+16'b101]=101
		pc_mem[1]={`ALU,5'b0,5'b1,5'b10,5'b0,`ADD};//R2=R0+R1=101
		pc_mem[2]={`ALU,5'b10,5'b1,5'b100,5'b0,`SUB};//R4=R2-R1=1
		pc_mem[3]={`ADDI,5'b0,5'b101,16'b1111111111111111};//R5=R0+16'b1111111111111111=1111111111111111
		pc_mem[4]={`MOVI,5'b101,5'b111,8'b1000,2'b0,`ROR};//R7=R5>>8
		pc_mem[5]={`ALU,5'b101,5'b11,5'b101,5'b0,`ROL};//R5=R5<<R4
		pc_mem[6]={`SD,5'b0,5'b111,16'b1};//mem[R[0]+1]=R[7]
		pc_mem[7]={`BNQ,5'b0,5'b1,16'b0};//if(R[0]==R[1])JMP(0)
		pc_mem[8]={`ADDI,5'b1,5'b10,16'b1011010};//R[2]=R[1]+1011010
	end
	
	always@(posedge clk)begin
		IR=pc_mem[NPC];
		PC_IF=NPC;
	end
endmodule
