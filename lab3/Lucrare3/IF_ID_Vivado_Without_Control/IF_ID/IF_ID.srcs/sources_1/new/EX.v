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
    
    wire [31:0] out_mux1;
    wire [31:0] out_mux2;
    wire [31:0] out_mux_reg_or_imm;
    wire [3:0] out_alu_control;

    // alegerea valorii corecte in cazul unui hazard
    mux4_1 mux1(REG_DATA1_EX, ALU_DATA_WB, ALU_OUT_MEM, 0, forwardA, out_mux1);    
    mux4_1 mux2(REG_DATA2_EX, ALU_DATA_WB, ALU_OUT_MEM, 0, forwardB, out_mux2);

    // mux 2_1: alege valoarea imediata sau valoarea unui registru, selectia este alu_src
    // DACA ALUSrc_EX este 1 returnez prima valoare ====?>  trebuie sa fie valoarea imediata
    mux2_1 reg_or_imm(out_mux2, IMM_EX, ALUSrc_EX, out_mux_reg_or_imm);
    
    assign REG_DATA2_EX_FINAL = out_mux2;
        
    ALUcontrol alucontrol(ALUop_EX, FUNCT7_EX, FUNCT3_EX, out_alu_control);
    ALU alu(out_alu_control, out_mux1, out_mux_reg_or_imm, ZERO_EX, ALU_OUT_EX);
    
    // adauga la PC-ul curent offsetul de salt
    adder calculate_addr(PC_EX, IMM_EX, PC_Branch_EX);        
    
endmodule
