`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2020 11:20:02 PM
// Design Name: 
// Module Name: test_ex3
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


module test_ex3();

    reg clk, reg_write;
    reg [4:0] read_reg1, read_reg2, write_reg;
    reg [31:0] write_data; 
    wire [31:0] read_data1, read_data2;

    registers regs (clk,
                    reg_write,
                    read_reg1,
                    read_reg2,
                    write_reg,
                    write_data,
                    read_data1,
                    read_data2);
    
    always #20 clk = ~clk;
    
    initial
    begin
        clk = 0;
        reg_write = 1;
        read_reg1 = 5'b10000;
        read_reg2 = 5'b01000;
        write_reg = 5'b11000;
        write_data = 3;
        #40
        reg_write = 1;
        read_reg1 = 5'b00001;
        read_reg2 = 5'b00011;
        write_reg = 5'b00010;
        write_data = 5;
        #40
        reg_write = 1;
        read_reg1 = 5'b00001;
        read_reg2 = 5'b01111;
        write_reg = 5'b00010;
        write_data = 8;
    end
    
endmodule
