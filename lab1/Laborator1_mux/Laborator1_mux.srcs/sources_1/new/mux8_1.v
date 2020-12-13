`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2020 04:10:55 PM
// Design Name: 
// Module Name: mux8_1
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


module mux8_1(a, b, c, d, e, f, g, h, sel, out);
    input a, b, c, d, e, f, g, h;
    input[2:0] sel;
    output out;
    
    mux4_1 m1(a, b, c, d, sel[1:0], w1);
    mux4_1 m2(e, f, g, h, sel[1:0], w2);
    
    mux2_1 m3(w1, w2, sel[2], out);
    
endmodule
