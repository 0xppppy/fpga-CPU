`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:49:02 01/02/2019 
// Design Name: 
// Module Name:    Mem 
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
/*module Mem(op,rt,
	wite_mem,read_mem,raw_addr,wite_data);
	
	always@(*)begin
		if(wite_mem==1)begin
			raw_addr=ALU0;
			wite_data=rt;
		end
		if(read_mem==1)begin
			raw_addr=ALU0;
			wite_data=rt;
		end
	end

endmodule
