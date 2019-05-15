`timescale 1ns / 1ps
`include "def.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:18:53 12/27/2018 
// Design Name: 
// Module Name:    WB 
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
module WB(
	wite_reg_WB,wite_reg_addr_WB,ALU0_WB,read_mem_WB,read_mem_data_WB,
	wite_Rreg,wite_Rreg_addr,wite_Rreg_data
	);
	input wite_reg_WB;
	input [`Rreg_AddrBus]wite_reg_addr_WB;
	input [`Rreg_Bus]ALU0_WB;
	input read_mem_WB;
	input [`Rreg_Bus]read_mem_data_WB;
	
	output reg wite_Rreg;
	output reg [`Rreg_AddrBus]wite_Rreg_addr;
	output reg [`Rreg_Bus]wite_Rreg_data;
 
	always@(*)begin
		if(wite_reg_WB==1)begin
			wite_Rreg=1;
			wite_Rreg_addr=wite_reg_addr_WB;
			if(read_mem_WB==1)
				wite_Rreg_data=read_mem_data_WB;
			else
				wite_Rreg_data=ALU0_WB;
		end else
		wite_Rreg=0;
	end
	
endmodule
