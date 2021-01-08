`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/06/2021 07:27:17 PM
// Design Name: 
// Module Name: ALUcontrol
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


module ALUcontrol(input [1:0] ALUop,
                  input [6:0] funct7,
                  input [2:0] funct3,
                  output reg [3:0] ALUinput);
    
  always @(*) begin
        casex ({ALUop, funct3, funct7})
            // ld and sd -- funct3 and funct7 are random
            2'b000000000000: 
                ALUinput = 0010;
            // R type -- funct 3 and funct7 are defined
            // add
            12'b100000000000:
                ALUinput = 0010;
            // sub
            12'b100000100000:
                ALUinput = 0110;
            // and
            12'b101110000000:
                ALUinput = 0000;
            // or
            12'b101100000000:
                ALUinput = 0001;
                
            // xor 10 100 0000000
            12'b101000000000:
                ALUinput = 0011;
            // srl 10 101 0000000
            12'b101010000000:
                ALUinput = 1010;
                
            // sll and slli 10 001 0000000
            12'b100010000000:
                ALUinput = 0100;
            // sra and srai 10 101 0100000
            12'b101010100000:
                ALUinput = 1001;
                
            // sltu 10 011 0000000
            12'b100110000000:
                ALUinput = 0111;
            // slt 10 010 0000000
            12'b100100000000:
                ALUinput = 1000;
                
            // branch instructions -- functx is xxxxxx
            // beq 01 000 0000000
            12'b010000000000:
                ALUinput = 0110;
            // bne 01 001 0000000
            12'b010000000000:
                ALUinput = 0110;
            // blt 01 100 0000000
            12'b011000000000:
                ALUinput = 1000;
            // bge 01 101 0000000
            12'b011010000000:
                ALUinput = 1000;
            // bltu 01 110 0000000
            12'b011100000000:
                ALUinput = 0111;
            // bgeu 01 111 0000000
            12'b011110000000:
                ALUinput = 0111;                                                                                                                                                                                                           
        endcase
    end
       
endmodule
