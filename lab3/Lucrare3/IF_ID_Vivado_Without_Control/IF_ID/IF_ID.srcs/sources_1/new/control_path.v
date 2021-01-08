`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/06/2021 07:25:06 PM
// Design Name: 
// Module Name: control_path
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


module control_path(input [6:0] opcode,
                    input control_sel,
                    output reg MemRead, MemtoReg, MemWrite, RegWrite, Branch, ALUSrc,
                    output reg [1:0] ALUop);
                    
    always @(control_sel) begin
        if (control_sel == 0) begin
            case (opcode)
            // R-format
            7'b0111011: begin 
                ALUop[1] = 1;
                ALUop[0] = 0;
                MemRead = 0;
                MemtoReg = 0;
                MemWrite = 0;
                RegWrite = 1;
                Branch = 0;
                ALUSrc = 0;
            end
            // load - I format
            7'b0000011: begin
                ALUop[1] = 0;
                ALUop[0] = 0;
                MemRead = 1;
                MemtoReg = 1;
                MemWrite = 0;
                RegWrite = 1;
                Branch = 0;
                ALUSrc = 1;
            end
            // store - S-format 
            7'b0100011: begin
                ALUop[1] = 0;
                ALUop[0] = 0;
                MemRead = 0;
                MemtoReg = 0;
                MemWrite = 1;
                RegWrite = 0;
                Branch = 0;
                ALUSrc = 1;
            end
            // branch --B format
            7'b1100011: begin
                ALUop[1] = 0;
                ALUop[0] = 1;
                MemRead = 0;
                MemtoReg = 0;
                MemWrite = 0;
                RegWrite = 0;
                Branch = 1;
                ALUSrc = 0;
            end
            endcase
        end
        else begin
            ALUop[1] = 0;
            ALUop[0] = 0;
            MemRead = 0;
            MemtoReg = 0;
            MemWrite = 0;
            RegWrite = 0;
            Branch = 0;
            ALUSrc = 0;
        end 
    end
    
    
endmodule
