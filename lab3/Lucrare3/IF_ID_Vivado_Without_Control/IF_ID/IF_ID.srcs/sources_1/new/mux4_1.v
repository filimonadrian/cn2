`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/07/2021 11:49:45 PM
// Design Name: 
// Module Name: mux4_1
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


module mux4_1(input [31:0] ina, inb, inc, ind,
              input [1:0] sel,
              output [31:0] out);
    
    assign out = sel[1] ? (sel[0] ? ind : inc) : (sel[0] ? inb : ina);
      
endmodule
