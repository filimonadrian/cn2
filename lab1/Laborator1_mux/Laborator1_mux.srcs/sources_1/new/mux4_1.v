`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2020 03:33:36 PM
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


module mux4_1(a, b, c, d, sel, out);
    input a, b, c, d;
    input [1:0] sel;
    output out;
   
    mux2_1 m1(a, b, sel[0], w1);
    mux2_1 m2(c, d, sel[0], w2);
    
    mux2_1 m3(w1, w2, sel[1], out);
   
endmodule
