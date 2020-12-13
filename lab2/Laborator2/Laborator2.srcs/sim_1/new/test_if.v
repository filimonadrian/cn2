`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2020 09:16:38 PM
// Design Name: 
// Module Name: test_if
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


module test_if();
    
  reg clk,reset;
reg PCSrc, PC_write;
reg [31:0] PC_Branch;
wire [31:0] PC_IF, INSTRUCTION_IF;

IF iff(
clk,reset,
PCSrc, PC_write,
PC_Branch,
PC_IF, INSTRUCTION_IF
    );

always #10 clk = ~clk;

  initial begin
    #0 clk=1'b0;
       reset=1'b1;

       PCSrc = 1'b0;
       PC_write = 1'b1;
       PC_Branch = 32'b0;




  end
endmodule
