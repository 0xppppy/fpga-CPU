`timescale 1ns / 1ps
`include "def.v"
//////////////////////////////////////////////////////////////////////////////////
//fun
//	001 加
//	010 减
//	011 乘
//	100 除
//	101 与
//	110 或
//	111 或非
//////////////////////////////////////////////////////////////////////////////////
module ALU(mov,in_a,in_b,fun,out_c,ZF);
	input[`Rreg_Bus] in_a;
	input[`Rreg_Bus] in_b;
	input [2:0] fun;
	input mov;
	
	output reg[`Rreg_Bus] out_c;
	reg [15:0]flag;
	output reg ZF;
	
	always@(*)begin
	if(mov==1)begin
	case(fun)
			3'b001:out_c=in_a << in_b;
			3'b010:out_c=in_a >> in_b;
			3'b011:out_c=in_a<<in_b;
			3'b100:out_c=(in_a>>in_b)|({32{in_a[31]}}<<in_b);
			3'b101:out_c=(in_a<<in_b)|(in_a>>(32-in_b));
			3'b110:out_c=(in_a>>in_b)|(in_a<<(32-in_b));
	endcase
	end else begin
	case(fun)
			3'b001:out_c=in_a+in_b;
			3'b010:out_c=in_a-in_b;
//			3'b011:out_c=in_a*in_b;
//			3'b100:out_c=in_a/in_b;// 除 ??
			3'b101:out_c=in_a&in_b;
			3'b110:out_c=in_a|in_b;
			3'b111:out_c=~(in_a|in_b);
		endcase
	end
	ZF=(out_c===0);
	end
	
endmodule
