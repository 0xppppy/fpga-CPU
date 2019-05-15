`timescale 1ns / 1ps
`include "def.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:36:02 12/31/2018 
// Design Name: 
// Module Name:    EX 
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
/*module EX(op);



		
		jp_flag_EX,wite_reg_EX,addr3_EX,wite_mem_EX,data_addr_EX);
		
		
		
	input [`PC_mem_Bus]IR;
	output [2:0]ALU_Fun;
	output ALU_flag;
	always@(*)begin
		case(IR[31:30])
			2'b10:begin
				//ALU_flag=IR[28];
				if(IR[29]==0)
					ALU_Fun=IR[`Fun];
				else
					ALU_Fun={{0},IR[27:26]};
			end
			2'b11:begin
				//ALU_flag=0;
				ALU_Fun=3'b010;
			end
			2'b01:begin
				//ALU_flag=0;
				ALU_Fun=3'b001;
			end
		endcase
	end
endmodule*/
