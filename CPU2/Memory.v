`timescale 1ns / 1ps
`include "def.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:38:15 12/27/2018 
// Design Name: 
// Module Name:    Memary 
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
module Memory(
	wite_mem,read_mem,
	raw_flag,raw_addr,
	data_in,data_out);
	
	
	input wite_mem;
	input read_mem;
	input [1:0]raw_flag;
	input [`Rreg_Bus]raw_addr;
	input [`Rreg_Bus]data_in;
	output reg [`Rreg_Bus]data_out;
	
	
	reg [`mem_Bus] mem [`mem_Addr];
	initial begin
		$readmemb("data2",mem);
	end
	
	always@(*)begin
		if(wite_mem==1)begin
		case(raw_flag)
			2'b00: mem[raw_addr]=data_in;
			2'b01:begin
				case(raw_addr[0])
				1'b0: mem[raw_addr[6:1]][31:16]=data_in[15:0];
				1'b1: mem[raw_addr[6:1]][15:0]=data_in[15:0];
				endcase
			end
			2'b10:begin
				case(raw_addr[1:0])
				2'b00: mem[raw_addr[7:2]][7:0]=data_in[7:0];
				2'b01: mem[raw_addr[7:2]][15:8]=data_in[7:0];
				2'b10: mem[raw_addr[7:2]][23:16]=data_in[7:0];
				2'b11: mem[raw_addr[7:2]][31:24]=data_in[7:0];
				endcase
			end
			2'b11: mem[raw_addr]=data_in;
		endcase
		end
	end
	
	always@(*)begin
		if(read_mem==1)begin
			case(raw_flag)
			2'b00:data_out=mem[raw_addr];
			2'b01:data_out=mem[raw_addr];
			2'b10:data_out=mem[raw_addr];
			2'b11:data_out=mem[raw_addr];
			endcase
		end
	end
	
endmodule



	/*integer k,handle;
	
	always@(posedge clk)begin
		handle=$fopen("data");
		for(k=0;k<=15;k=k+1)begin
			$fdisplay(handle,"%b",mem[k]);
		end
		$fclose(handle);
	end*/