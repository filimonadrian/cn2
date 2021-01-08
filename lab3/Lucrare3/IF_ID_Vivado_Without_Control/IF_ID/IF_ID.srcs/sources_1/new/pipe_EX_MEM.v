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

module IF_ID_reg(clk,reset,write,pc_in,instruction_in,pc_out,instruction_out);
  
  input clk,write,reset;
  input [31:0] pc_in;
  input [31:0] instruction_in;
  
  output reg [31:0] pc_out;
  output reg [31:0] instruction_out;
  
  always@(posedge clk) begin
    if (reset) begin
      pc_out<=32'b0;
      instruction_out<=32'b0;
    end
    else begin
      if(write) begin
        pc_out <= pc_in;
        instruction_out <= instruction_in;
      end
    end
  end

endmodule


module pipe_EX_MEM(input clk,
                  // semnale pentru scriere
                   input MemWrite_EX,
                   input RegWrite_EX,
                   // semnale pentru citire
                   input MemtoReg_EX,
                   input MemRead_EX,
                   
                   input ZERO_EX,
                   input [31:0] Branch_EX,
                   input [31:0] ALU_OUT_EX,
                   input [31:0] REG_DATA2_EX_FINAL,
                   
                   // semnale pentru scriere
                   output MemWrite_MEM,
                   output RegWrite_MEM,
                   // semnale pentru citire
                   output MemtoReg_MEM,
                   output MemRead_MEM,
                   
                   output ZERO_MEM,
                   output [31:0] Branch_MEM,
                   output [31:0] ALU_OUT_MEM,
                   output [31:0] REG_DATA2_MEM_FINAL   
    );
    
    always@(posedge clk) begin
        
                
        MemWrite_MEM = MemWrite_MEM;
        RegWrite_MEM = 
        MemtoReg_MEM = 
        MemRead_MEM = 
        ZERO_MEM = 
        Branch_MEM = 
        ALU_OUT_MEM = 
        REG_DATA2_MEM_FINAL = 
    end    
    
    
endmodule

















