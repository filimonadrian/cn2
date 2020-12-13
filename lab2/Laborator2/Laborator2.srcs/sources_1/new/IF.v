`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2020 02:57:55 PM
// Design Name: 
// Module Name: IF
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


module IF(clk, reset, PCSrc, PC_write, PC_Branch, PC_IF, INSTRUCTION_IF);
    input clk, reset, PCSrc, PC_write;
    input [31:0] PC_Branch;
    output [31:0] PC_IF, INSTRUCTION_IF;
    wire [31:0] out_add, out_mux, out_pc, in_instruction, instr_if;
    
    mux2_1 mux(out_add, PC_Branch, PCSrc, out_mux);
    PC pc(clk, reset, PC_write, out_mux, out_pc);
    adder add(out_pc, 4, out_add); 
    
    assign in_instruction = out_pc>>2;
    memory_instruction mem(out_pc[11:2], instr_if);
    assign PC_IF = out_pc;
    assign INSTRUCTION_IF = instr_if;
    
endmodule
