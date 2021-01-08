`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/06/2021 07:29:52 PM
// Design Name: 
// Module Name: EX
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module EX(input [31:0] IMM_EX,         
          input [31:0] REG_DATA1_EX,
          input [31:0] REG_DATA2_EX,
          input [31:0] PC_EX,
          input [2:0] FUNCT3_EX,
          input [6:0] FUNCT7_EX,
          input [4:0] RD_EX,
          input [4:0] RS1_EX,
          input [4:0] RS2_EX,
          input RegWrite_EX,
          input MemtoReg_EX,
          input MemRead_EX,
          input MemWrite_EX,
          input [1:0] ALUop_EX,
          input ALUSrc_EX,
          input Branch_EX,
          input [1:0] forwardA,forwardB,
          
          input [31:0] ALU_DATA_WB,
          input [31:0] ALU_OUT_MEM,
          
          output ZERO_EX,
          output [31:0] ALU_OUT_EX,
          output [31:0] PC_Branch_EX,
          output [31:0] REG_DATA2_EX_FINAL
          );
    
    // alegerea valorii corecte in cazul unui hazard
    // mux 1 : primeste rs1 
    // mux 2 : primeste rs2 sau valoarea imediata
    mux4_1 mux1();    
    mux4_1 mux2();

    // mux 2_1: alege valoarea imediata sau valoarea unui registru, selectia este alu_src    
    mux2_1 reg_or_imm(rs1, rs2, ALUSrc_EX, !!!!OUT_mux);
    
    
    
endmodule
