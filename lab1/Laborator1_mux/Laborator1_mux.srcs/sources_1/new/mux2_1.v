`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2020 03:47:30 PM
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
   
    mynot i0(sel, not_sel);
    myand i1(a, not_sel, w1);
    myand i2(b, sel, w2);
    myor i3(w1, w2, out);
    
endmodule
