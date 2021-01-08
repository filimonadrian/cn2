`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/08/2021 04:29:14 PM
// Design Name: 
// Module Name: pipe_ID_EX
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


module pipe_ID_EX(input clk, reset,
                  input MemRead, MemtoReg, MemWrite, RegWrite, Branch, ALUSrc,
                  input [1:0] ALUop,
                  input [31:0] IMM_ID,
                  input [31:0] REG_DATA1_ID,REG_DATA2_ID,
                  input [2:0] FUNCT3_ID,
                  input [6:0] FUNCT7_ID,
                  input [6:0] OPCODE_ID,
                  input [4:0] RD_ID,
                  input [4:0] RS1_ID,
                  input [4:0] RS2_ID,
                  input [31:0] PC_ID,

                  output reg MemRead_EX, MemtoReg_EX, MemWrite_EX, RegWrite_EX, Branch_EX, ALUSrc_EX,
                  output reg [1:0] ALUop_EX,
                  output reg [31:0] IMM_EX,
                  output reg [31:0] REG_DATA1_EX, REG_DATA2_EX,
                  output reg [2:0] FUNCT3_EX,
                  output reg [6:0] FUNCT7_EX,
                  output reg [6:0] OPCODE_EX,
                  output reg [4:0] RD_EX,
                  output reg [4:0] RS1_EX,
                  output reg [4:0] RS2_EX,
                  output reg [31:0] PC_EX 
    );


  always@(posedge clk) begin
    if (reset) begin
        MemRead_EX = 0;
        MemtoReg_EX = 0;
        MemWrite_EX = 0;
        RegWrite_EX = 0;
        Branch_EX = 0;
        ALUSrc_EX = 0;
        ALUop_EX = 0;
        IMM_EX = 0;
        REG_DATA1_EX = 0;
        REG_DATA2_EX = 0;
        FUNCT3_EX = 0;
        FUNCT7_EX = 0;
        OPCODE_EX = 0;
        RD_EX = 0;
        RS1_EX = 0;
        RS2_EX = 0;
        PC_EX = 0;
    end
    else begin
        MemRead_EX = MemRead;
        MemtoReg_EX = MemtoReg;
        MemWrite_EX = MemWrite;
        RegWrite_EX = RegWrite;
        Branch_EX = Branch;
        ALUSrc_EX = ALUSrc;
        ALUop_EX = ALUop;
        IMM_EX = IMM_ID;
        REG_DATA1_EX = REG_DATA1_ID;
        REG_DATA2_EX = REG_DATA2_ID;
        FUNCT3_EX = FUNCT3_ID;
        FUNCT7_EX = FUNCT7_ID;
        OPCODE_EX = OPCODE_ID;
        RD_EX = RD_ID;
        RS1_EX = RS1_ID;
        RS2_EX = RS2_ID;
        PC_EX = PC_ID;

    end
  end
endmodule
