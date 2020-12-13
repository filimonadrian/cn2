`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2020 04:37:38 PM
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
    input [31:0] a, b;
    input sel;
    output [31:0] out;
    reg [31:0] out;
    
    always @(*)
    begin 
        if (sel == 0)
        begin
            out = a;
        end
        else
        begin
            out = b;
        end
    end
    //mynot i0(sel, not_sel);
    //myand i1(a, not_sel, w1);
    //myand i2(b, sel, w2);
    //myor i3(w1, w2, out);
    
endmodule

