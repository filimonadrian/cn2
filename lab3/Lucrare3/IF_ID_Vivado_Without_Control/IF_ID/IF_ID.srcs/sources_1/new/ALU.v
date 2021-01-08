`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/06/2021 07:29:08 PM
// Design Name: 
// Module Name: ALU
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

// https://riscv.org/wp-content/uploads/2017/05/riscv-spec-v2.2.pdf
// ADD and SUB perform addition and subtraction respectively. Overflows are ignored and the low
// XLEN bits of results are written to the destination. SLT and SLTU perform signed and unsigned
// compares respectively, writing 1 to rd if rs1 < rs2, 0 otherwise. Note, SLTU rd, x0, rs2 sets rd to 1
// if rs2 is not equal to zero, otherwise sets rd to zero (assembler pseudo-op SNEZ rd, rs). AND, OR,
// and XOR perform bitwise logical operations.
// SLL, SRL, and SRA perform logical left, logical right, and arithmetic right shifts on the value in
// register rs1 by the shift amount held in the lower 5 bits of register rs2

// Branch instructions compare two registers. BEQ and BNE take the branch if registers rs1 and rs2
// are equal or unequal respectively. BLT and BLTU take the branch if rs1 is less than rs2, using
// signed and unsigned comparison respectively. BGE and BGEU take the branch if rs1 is greater
// than or equal to rs2, using signed and unsigned comparison respectively. Note, BGT, BGTU,
// BLE, and BLEU can be synthesized by reversing the operands to BLT, BLTU, BGE, and BGEU,
// respectively


module ALU(input [3:0] ALUop,
           input [31:0] ina,inb,
           output reg zero,
           output reg [31:0] out);
           
  always @(*) begin
        case (ALUop)
            // ld, sd and add
            4'b0010: 
                out = ina + inb;
            // sub, beq, bne
            4'b0110: 
                out = ina - inb;
            // and 
            4'b0000: 
                out = ina & inb;
            // or 
            4'b0001: 
                out = ina | inb;
            // xor 
            4'b0011: 
                out = ina ^ inb;
            // srl, srli 
            4'b0101: 
                out = ina >> inb;
            // sll, slli 
            4'b0100: 
                out = ina << inb;
            // sra, srai 
            4'b1001: 
                out = ina >>> inb;
            // sltu, bltu, bgeu 
            4'b0111: 
                if (ina < inb) begin
                    out = 32'b1;
                    end
                    else begin
                        out = 32'b0;
                    end
            // slt, blt, bge
            4'b1000:     // este posibil ca if-ul  sa fie inversat
                if ($signed(ina) < $signed(inb)) begin
                    out = 32'b1;
                    end
                    else begin
                        out = 32'b0;
                    end         
                                                                                                                                                                                                                                                                                                                                                                                                     
        endcase
        
        zero = 0;
        if (out[32:0] == 32'b00000000000000000000000000000000) begin
            zero = 1;
        end     
    end
    
              
           
endmodule
