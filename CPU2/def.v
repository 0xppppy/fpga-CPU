`define NOP     6'b000000
//Ö¸Áî¼Ä´æÆ÷
`define PC_mem_Bus  31:0
`define PC_mem_Addr 31:0
`define PC_mem_AddrBus 5:0
`define PC_mem_AddrBus_n 6
`define PC_mem_Addr_n 32
//¼Ä´æÆ÷
`define Rreg_Bus 31:0
`define Rreg_Addr 31:0
`define Rreg_AddrBus 4:0
`define Rreg_AddrBus_n 5
//
`define Bus 31:0
`define mem_Bus 31:0
`define mem_Addr 31:0
//other
`define IR_n 5
`define rs 25:21
`define rt 20:16
`define rd 15:11
`define Imm 15:0
`define Fun 2:0

`define Imm_Bus_bf 15:0
`define Imm_Bus_af 31:0
`define rs_n 5
`define rt_n 5
`define rd_n 5
`define Imm_n 16


//ALUÖ¸Áî
	//R fun R
//ALU rs rt rd |00000| ADD
//rd <- rs + rt 
`define ALU		 6'b10_0001
`define ALUU	 6'b10_0101

`define ADD 	 6'b000_001
`define SUB	    6'b000_010
`define MUI     6'b000_011
`define AND     6'b000_101
`define OR      6'b000_110
`define NOR     6'b000_111

`define SAL 	6'b001_001
`define SAR 	6'b001_010
`define SHL 	6'b001_011
`define SHR 	6'b001_100
`define ROL 	6'b001_101
`define ROR 	6'b001_110

	//Imm
//ADDI rs rt Imm|
// rt <- rs & (zero-extend)immediate  
`define ADDI    6'b10_1001
`define SUBI    6'b10_1010

`define ADDIU   6'b10_1101
`define SUBIU   6'b10_1110

//ADDI rs   rt  Imm  00  fun
// 6    5    5   8        6
`define MOVI 	6'b10_1000
`define mov_Imm 15:8



//Ìø×ªÖ¸Áî
//BEQ rs rt Imm|
`define JMP    6'b11_0011
`define BEQ    6'b11_0001
`define BNQ    6'b11_0010

//´æ´¢Ö¸Áî
// SH  rs rt Imm|
// memory[rs + (sign-extend)immediate] <- rt 
// LH  rs,rt,Imm
// rt <- memory[rs + (sign-extend)immediate] 
`define LH    6'b01_0011 //4
`define LB    6'b01_0010 //8
`define LW    6'b01_0001 //16
`define LOD   6'b01_0000 //32

`define SH    6'b01_1011 //4
`define SB    6'b01_1010 //8
`define SW    6'b01_1001 //16
`define SD    6'b01_1000 //32

/*
`define LHU   6'b01_0111 //4
`define LBU   6'b01_0110 //8
`define LWU   6'b01_0101 //16
*/

//R
`define R0      4'b0000
`define R1      4'b0001
`define R2      4'b0010
`define R3      4'b0011
`define R4      4'b0100
`define R5      4'b0101
`define R6      4'b0110
`define R7      4'b0111
`define R8      4'b1000
`define R9      4'b1001
`define R10     4'b1010
`define R11     4'b1011
`define R12     4'b1100
`define R13     4'b1101
`define R14     4'b1110
`define R15     4'b1111

