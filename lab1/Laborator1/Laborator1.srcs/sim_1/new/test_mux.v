`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2020 11:40:24 PM
// Design Name: 
// Module Name: test_mux
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


module test_mux();
    reg clk;
    reg a, b, c, d, e, f, g, h;
    reg[2:0] sel;
    wire out;
    
    mux8_1 uut(a, b, c, d, e, f, g, h, sel, out);
    
    always #20 clk = ~clk;
    
    initial
    begin
        clk = 0;
        a = 1;
        b = 0;
        c = 1;
        d = 1;
        e = 0;
        f = 1;
        g = 1;
        h = 0;
        sel = 0;
        #40
        a = 1;
        b = 0;
        c = 1;
        d = 1;
        e = 0;
        f = 1;
        g = 1;
        h = 0;
        sel = 1;
        # 40
        a = 1;
        b = 0;
        c = 1;
        d = 1;
        e = 0;
        f = 1;
        g = 1;
        h = 0;
        sel = 2;
        # 40
        a = 1;
        b = 0;
        c = 1;
        d = 1;
        e = 0;
        f = 1;
        g = 1;
        h = 0;
        sel = 3;
        # 40
        a = 1;
        b = 0;
        c = 1;
        d = 1;
        e = 0;
        f = 1;
        g = 1;
        h = 0;
        sel = 4;
        # 40
        a = 1;
        b = 0;
        c = 1;
        d = 1;
        e = 0;
        f = 1;
        g = 1;
        h = 0;
        sel = 5;
        # 40
        a = 1;
        b = 0;
        c = 1;
        d = 1;
        e = 0;
        f = 1;
        g = 1;
        h = 0;
        sel = 6;
        # 40
        a = 1;
        b = 0;
        c = 1;
        d = 1;
        e = 0;
        f = 1;
        g = 1;
        h = 0;
        sel = 7;
    end
           
endmodule
