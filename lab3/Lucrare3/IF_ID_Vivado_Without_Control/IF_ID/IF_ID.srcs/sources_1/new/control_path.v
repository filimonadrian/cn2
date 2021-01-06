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
        case (opcode)
            2'b0111011: 
                ALUop = 1;
            
        endcase
    end
    
    
endmodule
