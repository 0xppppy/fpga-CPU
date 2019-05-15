`timescale 1ns / 1ps
`include "def.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:52:28 12/27/2018 
// Design Name: 
// Module Name:    ID 
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
module ID(IR,
	op_EX,wite_reg_EX,wite_reg_addr_EX,
	op_MEM,wite_reg_MEM,wite_reg_addr_MEM,
	//ID
	read1,addr1,
	read2,addr2,
	sign_flag,Imm,
	Mux1,Mux2,
	//WB
	wite_reg,wite_reg_addr,
	//MEM
	wite_mem,read_mem,raw_flag,
	
	op,fun,jp_flag,wait_ID,ALU_mov,Mux3
	);
	input [`PC_mem_Bus]IR;
	
	input [1:0]op_EX;
	input wite_reg_EX;
	input [`Rreg_AddrBus]wite_reg_addr_EX;
	input [1:0]op_MEM;
	input wite_reg_MEM;
	input [`Rreg_AddrBus]wite_reg_addr_MEM;
	
	output reg read1,read2;
	output reg [`Rreg_AddrBus]addr1,addr2;
	output reg sign_flag;
	output reg [`Imm_Bus_bf]Imm;
	output reg [2:0]Mux1,Mux2;
	output reg wite_reg;
	output reg [`Rreg_AddrBus]wite_reg_addr;
	output reg wite_mem;
	output reg read_mem;
	output reg [1:0]raw_flag;
	
	output reg [1:0]op;
	output reg [2:0]fun;
	output reg [1:0]jp_flag;
	
	output reg wait_ID;
	output reg ALU_mov;
	
	output reg [1:0]Mux3;
	reg flag=0;
	
	initial begin
		wait_ID=0;
		Mux3=2'b0;
	end
	always@(*)begin
		addr1=IR[`rs];
		addr2=IR[`rt];
		Imm=IR[`Imm];
		op=IR[31:30];
		
		wite_reg=0;
		wite_mem=0;
		read_mem=0;
		jp_flag=2'b00;
		ALU_mov=0;
		Mux3=0;
		case(op)
		2'b10:begin
			sign_flag=IR[28];
			if(IR[29]==0)begin
				if(IR[3]==1)
					ALU_mov=1;
				fun=IR[2:0];
				Mux1=3'b0;
				Mux2=3'b0;
				read1=1;
				read2=1;
				wite_reg=1;
				wite_reg_addr=IR[`rd];
			end else begin
				fun={{0},IR[27:26]};
				if(IR[28:26]==3'b0)begin
					ALU_mov=1;
					Imm=IR[`mov_Imm];
					fun=IR[2:0];
				end
				Mux1=3'b0;
				Mux2=3'b1;
				read1=1;
				read2=0;
				wite_reg=1;
				wite_reg_addr=IR[`rt];
			end
		end
		2'b11:begin
			sign_flag=0;
			fun=3'b010;
			Mux1=3'b0;
			Mux2=3'b0;
			read1=1;
			read2=1;
			jp_flag=IR[27:26];
		end
		2'b01:begin
			sign_flag=1;
			fun=3'b001;
			Mux1=3'b0;
			Mux2=3'b1;
			read1=1;
			read2=1;
			if(IR[29]==1)begin
				wite_mem=1;
				raw_flag=IR[27:26];
			end else begin
				wite_reg=1;
				wite_reg_addr=IR[`rt];
				
				read_mem=1;
				raw_flag=IR[27:26];
			end
		end
		endcase
		
		if(IR[31:29]==3'b011)begin
			if(wite_reg_EX==1&wite_reg_addr_EX==addr2)begin
				if(op_EX==2'b10)
					Mux3=2'b1;
				if(op_EX==2'b1)begin
					Mux3=2'b10;
				end
			end
		end
		
		if(wite_reg_EX==1)begin
			if(wite_reg_addr_EX==addr1&Mux1==3'b0)begin
				flag=1;
				read1=0;
				if(op_EX==2'b10)
					Mux1=3'b10;
				if(op_EX==2'b1)begin
					wait_ID=1;
					flag=0;
				end
			end
			if(wite_reg_addr_EX==addr2&Mux2==3'b0)begin
				read2=0;
				if(op_EX==2'b10)
					Mux2=3'b10;
				if(op_EX==2'b1)begin
					wait_ID=1;
					flag=0;
				end
			end
		end 

		if(wite_reg_MEM==1&flag==0)begin
			if(wite_reg_addr_MEM==addr1&Mux1==3'b0)begin
				read1=0;
				wait_ID=0;
				if(op_MEM==2'b10)
					Mux1=3'b011;
				if(op_MEM==2'b1)
					Mux1=3'b100;
			end
			if(wite_reg_addr_MEM==addr2&Mux2==3'b0)begin
				read2=0;
				wait_ID=0;
				if(op_MEM==2'b10)
					Mux2=3'b011;
				if(op_MEM==2'b1)
					Mux2=3'b011;
			end
		end
		
		
	end
endmodule
