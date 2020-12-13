`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2020 05:19:24 PM
// Design Name: 
// Module Name: memory_instruction
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


module memory_instruction(address, instruction);
    input [9:0] address;
    output reg [31:0] instruction;
    reg [31:0] codeMemory [0:1023];
    
    initial begin
        $display("Loading rom..");
        $readmemh("code.mem", codeMemory);
    end
    always @(address)
    begin
        instruction = codeMemory[address];
    end
endmodule
