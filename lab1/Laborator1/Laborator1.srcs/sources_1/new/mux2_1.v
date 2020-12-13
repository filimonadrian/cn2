`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2020 03:21:11 PM
// Design Name: 
// Module Name: mux2_1
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

module mux2_1(a, b, sel, out);
    input a, b, sel;
    output out;
    wire out;
   
    myNot i0(sel, not_sel);
    myAnd i1(a, not_sel, w1);
    myAnd i2(b, sel, w2);
    myor i3(w1, w2, out);
    
endmodule
