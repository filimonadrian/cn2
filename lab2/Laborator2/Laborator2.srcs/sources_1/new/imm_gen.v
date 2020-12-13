`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2020 05:42:47 PM
// Design Name: 
// Module Name: imm_gen
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

// trebuie sa generez out in functie de in
// verific opcode-ul inputului(pentru a vedea de ce tip este)
// apoi in functie de upcode, "construiesc" outputul --> pun bitii
// in ordinea din document

module imm_gen(in, out);
    input [31:0] in;
    output reg [31:0] out;
    
    // LW
    // type I
    always @(in)
    begin

        // addi, andi, ori, xori, slti, sltiu, srli, srai, slli || LW
        // compun tipul I 
        if ((in[6:0] == 7'b0010011) || (in[6:0] == 7'b0000011))
        begin
            out[0] = in[20];
            out[4:1] = in[24:21];
            out[10:5] = in[30:25];   
            out[31:11] = {21{in[31]}};
        end
        // sw
        // compun tipul S
        else if (in[6:0] == 7'b0100011)
        begin
            out[0] = in[7];
            out[4:1] = in[11:8];
            out[10:5] = in[30:25];
            out[31:11] = {21{in[31]}};
        end
        // beq, bne, blt, bge, bltu, bgeu
        // compun tipul B
        else if (in[6:0] == 7'b1100011)
        begin
            out[0] = 0;
            out[4:1] = in[11:8];
            out[10:5] = in[30:25];
            out[11] = in[7];
            out[31:12] = {20{in[31]}};
        end
        else 
            out = 0;
    end

endmodule