`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/08/2021 03:33:11 PM
// Design Name: 
// Module Name: pipe_EX_MEM
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

module pipe_EX_MEM(input clk, reset,
                  // semnale pentru wb
                  input MemtoReg_EX,
                  input RegWrite_EX,

                  // semnale pentru mem
                   input Branch_EX,
                   input MemWrite_EX,
                   input MemRead_EX,                  
                   input ZERO_EX,
                  
                  // adresa registrului destinatie in etapa EX
                   input [4:0] RD_EX,
                  
                   input [31:0] ALU_OUT_EX,
                   input [31:0] PC_Branch_EX,
                   input [31:0] REG_DATA2_EX_FINAL,

                  // semnale pentru wb
                   output reg MemtoReg_MEM,
                   output reg RegWrite_MEM,

                  // semnale pentru mem
                   output reg Branch_MEM,
                   output reg MemWrite_MEM,
                   output reg MemRead_MEM,
                   output reg ZERO_MEM,

                   // adresa registrului destinatie in etapa EX
                   output reg [4:0] RD_MEM,

                   output reg [31:0] ALU_OUT_MEM,
                   output reg [31:0] PC_Branch_MEM,
                   output reg [31:0] REG_DATA2_MEM_FINAL   
    );

    always@(posedge clk) begin
      if (reset) begin

        MemtoReg_MEM = 0;
        RegWrite_MEM = 0;
        Branch_MEM = 0;
        MemWrite_MEM = 0;
        MemRead_MEM = 0;
        RegWrite_MEM = 0;
        ZERO_MEM = 0;
        RD_MEM = 0;
        ALU_OUT_MEM = 0;
        PC_Branch_MEM = 0;
        REG_DATA2_MEM_FINAL = 0;

      end
      else begin

        MemtoReg_MEM = MemtoReg_EX;
        RegWrite_MEM = RegWrite_EX;
        Branch_MEM = Branch_EX;
        MemWrite_MEM = MemWrite_EX;
        MemRead_MEM = MemRead_EX;
        ZERO_MEM = ZERO_EX;
        RD_MEM = RD_EX;
        ALU_OUT_MEM = ALU_OUT_EX;
        PC_Branch_MEM = PC_Branch_EX;
        REG_DATA2_MEM_FINAL = REG_DATA2_EX_FINAL;

      end
    end
    
    
endmodule

















