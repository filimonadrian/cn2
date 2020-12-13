`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2020 06:24:55 PM
// Design Name: 
// Module Name: test_pipeline
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


module test_pipeline();
    reg clk;
    reg[7:0] a, b, c, d, e, f;
    wire[7:0] out;
    
    pipeline uut(clk, a, b, c, d, e, f, out);
    
    always #20 clk = ~clk;
    
    initial
    begin
        clk = 0;
        // 9/3 * 12/3 - 25/5 = 12 - 5 = 7
        a = 9;
        b = 3;
        c = 12;
        d = 3;
        e = 25;
        f = 5;
        # 40
        //  2 * 2 - 3 = 1
        a = 9 + 2;
        b = 3 + 2;
        c = 12 + 2;
        d = 3 + 2;
        e = 25 + 2;
        f = 5 + 2;
        #40
        // 1 * 1 - 2 = -1
        a = 9 + 15;
        b = 3 + 15;
        c = 12 + 15;
        d = 3 + 15;
        e = 25 + 15;
        f = 5 + 15;
        #40
        // 3 * 3 - 5 = 4
        a = 10;
        b = 3;
        c = 11;
        d = 3;
        e = 28;
        f = 5;
        #40
        // 1 * 1 - 4 = -3
        a = 25;
        b = 18;
        c = 26;
        d = 18;
        e = 43;
        f = 10;
    end
                
endmodule
