`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/08/2021 11:48:16 AM
// Design Name: 
// Module Name: forwarding
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


module forwarding(input [4:0] rs1,
                  input [4:0] rs2,
                  input [4:0] ex_mem_rd,
                  input [4:0] mem_wb_rd,
                  input ex_mem_regwrite,
                  input mem_wb_regwrite,
                  output reg [1:0] forwardA,forwardB);
                  
               
    always@(*) begin
        
        forwardA = 2'b00;
        forwardB = 2'b00;
        
        // hazard in stagiul EX
        if ((ex_mem_regwrite == 1) &&
            (ex_mem_rd[4:0] != 0) && 
            (ex_mem_rd[4:0] == rs1[4:0])) begin
                
            forwardA = 10;
        
        end
        
        if ((ex_mem_regwrite == 1) &&
            (ex_mem_rd[4:0] != 0) && 
            (ex_mem_rd[4:0] == rs2[4:0])) begin
                
            forwardB = 10;
        
        end
        
        // hazard in stagiul MEM
        if ((mem_wb_regwrite == 1) &&
            (mem_wb_rd[4:0] != 0) && 
            !((ex_mem_regwrite == 1) && (ex_mem_rd != 0) &&
                (ex_mem_rd[4:0] == rs1[4:0])) &&
            (mem_wb_rd == rs1[4:0])) begin
                
            forwardA = 01;        
        end
        
        if ((mem_wb_regwrite == 1) &&
            (mem_wb_rd[4:0] != 0) && 
            !((ex_mem_regwrite == 1) && (ex_mem_rd != 0) &&
                (ex_mem_rd[4:0] == rs2[4:0])) &&
            (mem_wb_rd == rs2[4:0])) begin
                
            forwardB = 01;        
        end       
    end                   
endmodule
