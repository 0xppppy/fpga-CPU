`timescale 1ns / 1ps
`include "def.v"  

module top(in_a,out_b,out_c,out_d);
	input [15:0] in_a;
	output  [31:0] out_b;
	output [`PC_mem_AddrBus]out_c;
	output [31:0]out_d;
	
	reg clk=1;
	always#20 clk=~clk;
	
	wire [`PC_mem_Addr]IR_IF;
	wire [`PC_mem_AddrBus] PC_IF;
	wire [`PC_mem_Bus] IR_ID;

	wire R_read1,R_read2;
	wire [`Rreg_AddrBus]R_addr1,R_addr2;
	wire sign_flag;
	wire [`Imm_Bus_bf]Imm;
	wire [2:0]Mux1,Mux2;
	wire wite_reg_ID;
	wire [`Rreg_AddrBus]wite_reg_addr_ID;
	wire wite_mem_ID;
	wire read_mem_ID;
	wire [1:0]raw_flag_ID;
	wire [1:0]op_ID;
	wire [2:0]fun_ID;
	wire [1:0]jp_flag_ID;
	
	wire [`Rreg_Bus] R_data1,R_data2;
	wire [`PC_mem_Addr]Imm_ID;
	wire [`Bus] ALU_a_ID,ALU_b_ID;

	wire [`Rreg_Bus] ALU_a_EX,ALU_b_EX;
	wire [1:0]op_EX;
	wire [2:0]fun_EX;
	wire [1:0]jp_flag_EX;
	wire wite_reg_EX;
	wire [`Rreg_AddrBus]wite_reg_addr_EX;
	wire wite_mem_EX;
	wire read_mem_EX;
	wire [1:0]raw_flag_EX;
	wire [`Rreg_Bus]wite_mem_data_EX;
	wire [`PC_mem_Addr]Imm_EX;
	
	wire [`Rreg_Bus] ALU0_EX;
	wire ZF;
	
	wire [`PC_mem_AddrBus]NPC;
	
	wire [`Rreg_Bus]ALU0_MEM;
	wire [1:0]op_MEM;
	wire [`Rreg_Bus] wite_mem_data_MEM;
	wire wite_mem_MEM;
	wire read_mem_MEM;
	wire wite_reg_MEM;
	wire [1:0]raw_flag_MEM;
	wire [`Rreg_AddrBus]wite_reg_addr_MEM;
	
	wire [`Rreg_Bus]read_data;
		
	wire wite_reg_WB;
	wire read_mem_WB;
	wire [`Rreg_AddrBus]wite_reg_addr_WB;
	wire [`Rreg_Bus]ALU0_WB;
	wire wite_Rreg;
	wire [`Rreg_AddrBus]wite_Rreg_addr;
	wire [`Rreg_Bus]wite_Rreg_data;
	
	wire reset;
	
	wire wait_ID;
	wire ALU_mov_ID;
	wire ALU_mov_EX;
	
	wire [1:0]Mux3_ID;
   wire [1:0]Mux3_EX;
	wire [`Rreg_Bus]rt_EX;
	
	PC_Mem PC_Mem (
	 .clk(clk), 
    .NPC(NPC),
	 //out
    .IR(IR_IF),
	 .PC_IF(PC_IF)
    );
	 assign out_c=NPC;
	 assign out_d=IR_IF;

	IF_ID IF_ID (
    .clk(clk), 
	 .reset(reset),
    .IR(IR_IF),
	 .wait_ID(wait_ID),
	 //out
    .IR_out(IR_ID)
    );
	 

	 ID ID(
    .IR(IR_ID), 
	 .op_EX(op_EX), 
    .wite_reg_EX(wite_reg_EX), 
    .wite_reg_addr_EX(wite_reg_addr_EX), 
    .op_MEM(op_MEM), 
    .wite_reg_MEM(wite_reg_MEM), 
    .wite_reg_addr_MEM(wite_reg_addr_MEM), 
	 //out
    .read1(R_read1), 
    .addr1(R_addr1), 
    .read2(R_read2), 
    .addr2(R_addr2),  
    .sign_flag(sign_flag), 
    .Imm(Imm), 
    .Mux1(Mux1), 
    .Mux2(Mux2), 
	 .Mux3(Mux3_ID),
    .wite_reg(wite_reg_ID), 
    .wite_reg_addr(wite_reg_addr_ID), 
    .wite_mem(wite_mem_ID), 
    .read_mem(read_mem_ID), 
    .raw_flag(raw_flag_ID), 
    .op(op_ID), 
    .fun(fun_ID), 
    .jp_flag(jp_flag_ID),
    .wait_ID(wait_ID),
	 .ALU_mov(ALU_mov_ID)
    );


	
	Rreg Rreg (
    .read1(R_read1), 
    .addr1(R_addr1), 
    .data1(R_data1), 
	 
    .read2(R_read2), 
    .addr2(R_addr2), 
    .data2(R_data2), 
	 
    .wite(wite_Rreg), 
    .addr3(wite_Rreg_addr), 
    .data3(wite_Rreg_data)
    );
	
	sign_extension sign_extension (
    .flag(sign_flag), 
    .sign_in(Imm), 
	 //out
    .sign_out(Imm_ID)
    );
	 
	 MUX  MUX1 (
    .flag(Mux1), 
    .in_a(R_data1), 
    .in_b(Imm_ID), 
    .in_c(ALU0_EX), 
    .in_d(ALU0_MEM), 
    .in_e(read_data),
    .out(ALU_a_ID)
    );
	 
	 MUX  MUX2 (
    .flag(Mux2), 
    .in_a(R_data2), 
    .in_b(Imm_ID),
    .in_c(ALU0_EX), 
    .in_d(ALU0_MEM),
    .in_e(read_data),
    .out(ALU_b_ID)
    );
	 
	ID_EX ID_EX (
    .clk(clk), 
	 .reset(reset),
    .ALU_a_ID(ALU_a_ID), 
    .ALU_b_ID(ALU_b_ID), 
    .op_ID(op_ID), 
    .fun_ID(fun_ID), 	 
	 .ALU_mov_ID(ALU_mov_ID),
    .jp_flag_ID(jp_flag_ID), 
    .wite_reg_ID(wite_reg_ID), 
    .addr3_ID(wite_reg_addr_ID), 
    .wite_mem_ID(wite_mem_ID), 
    .read_mem_ID(read_mem_ID), 
    .rt_ID(R_data2), 
    .raw_flag_ID(raw_flag_ID), 
    .Imm_ID(Imm_ID),
	 .Mux3_ID(Mux3_ID),
	 //out
    .ALU_a_EX(ALU_a_EX), 
    .ALU_b_EX(ALU_b_EX), 
    .op_EX(op_EX), 
    .fun_EX(fun_EX),
	 .ALU_mov_EX(ALU_mov_EX),
    .jp_flag_EX(jp_flag_EX), 
    .wite_reg_EX(wite_reg_EX), 
    .addr3_EX(wite_reg_addr_EX), 
    .wite_mem_EX(wite_mem_EX), 
    .read_mem_EX(read_mem_EX), 
    .rt_EX(rt_EX), 
    .raw_flag_EX(raw_flag_EX), 
    .Imm_EX(Imm_EX),
	 .Mux3_EX(Mux3_EX)
    );
	
	 ALU ALU (
    .in_a(ALU_a_EX),
    .in_b(ALU_b_EX),
    .fun(fun_EX),
	 .mov(ALU_mov_EX),
	 //out
    .out_c(ALU0_EX),
	 .ZF(ZF_flag)
    );
	 assign out_b=ALU0_EX;
	 
	 MUX_mem  MUX3 (
	 .clk(clk),
    .flag(Mux3_EX), 
    .in_a(rt_EX), 
    .in_b(ALU0_MEM),
    .in_c(read_data),
    .out(wite_mem_data_EX)
    );
	 
	pc_MUX pc_MUX(
    .in(ZF_flag), 
	 .wait_ID(wait_ID),
    .addr_a(PC_IF), 
    .addr_b(Imm_EX),
    .flag(jp_flag_EX), 
    .NPC(NPC),
	 .reset(reset)
    );
	 
	EX_MEM EX_MEM (
    .clk(clk), 
    .ALU0_EX(ALU0_EX), 
    .op_EX(op_EX), 
    .wite_mem_data_EX(wite_mem_data_EX), 
    .wite_mem_EX(wite_mem_EX), 
    .read_mem_EX(read_mem_EX), 
    .wite_reg_EX(wite_reg_EX), 
    .raw_flag_EX(raw_flag_EX), 
    .wite_reg_addr_EX(wite_reg_addr_EX), 
	 //out
    .ALU0_MEM(ALU0_MEM), 
    .op_MEM(op_MEM), 
    .wite_mem_data_MEM(wite_mem_data_MEM), 
    .wite_mem_MEM(wite_mem_MEM), 
    .read_mem_MEM(read_mem_MEM), 
    .wite_reg_MEM(wite_reg_MEM), 
    .raw_flag_MEM(raw_flag_MEM),
	 .wite_reg_addr_MEM(wite_reg_addr_MEM)
    );

	
	 Memory Memory (
    .wite_mem(wite_mem_MEM), 
    .read_mem(read_mem_MEM), 
    .raw_flag(raw_flag_MEM), 
    .raw_addr(ALU0_MEM), 
    .data_in(wite_mem_data_MEM), 
	 //out
    .data_out(read_data)
    );


	 MEM_WB MEM_WB (
    .clk(clk), 
    .wite_reg_MEM(wite_reg_MEM), 
    .wite_reg_addr_MEM(wite_reg_addr_MEM), 
    .ALU0_MEM(ALU0_MEM),
	 .read_mem_MEM(read_mem_MEM),
	 //out
    .wite_reg_WB(wite_reg_WB), 
    .wite_reg_addr_WB(wite_reg_addr_WB), 
    .ALU0_WB(ALU0_WB),
	 .read_mem_WB(wite_reg_mem_WB)
    );

	WB WB (
    .wite_reg_WB(wite_reg_WB), 
    .wite_reg_addr_WB(wite_reg_addr_WB), 
    .ALU0_WB(ALU0_WB), 
	 .read_mem_WB(read_mem_WB),
	 .read_mem_data_WB(read_mem_data_WB),
	 //out 
    .wite_Rreg(wite_Rreg), 
    .wite_Rreg_addr(wite_Rreg_addr), 
    .wite_Rreg_data(wite_Rreg_data)
    );


endmodule
