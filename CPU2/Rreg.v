`timescale 1ns / 1ps
`include "def.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:04:44 12/30/2018 
// Design Name: 
// Module Name:    Rreg 
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
module Rreg(
	read1,addr1,data1,
	read2,addr2,data2,
	wite,addr3,data3);
	
	input read1,read2,wite;
	input [`Rreg_AddrBus] addr1,addr2;
	output reg [`Rreg_Bus] data1,data2;
	
	input [`Rreg_AddrBus] addr3;
	input [`Rreg_Bus] data3;
	
	reg [`Rreg_Bus] Rreg[`Rreg_Addr];

	initial begin
		$readmemb("R",Rreg);
	end
	
	always@(*)begin
	if(read1==1)
		data1=Rreg[addr1];
	end
	
	always@(*)begin
	if(read2==1)
		data2=Rreg[addr2];
	end
	
	always@(*)begin
	if(wite==1)
		Rreg[addr3]=data3;
	end 
	
endmodule
