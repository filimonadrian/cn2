`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2020 05:02:06 PM
// Design Name: 
// Module Name: pipeline
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


module reg_div(clk, div1, div2, div3, out1, out2, out3);
    input clk;
    input[7:0] div1, div2, div3;
    output[7:0] out1, out2, out3;
    reg[7:0] out1, out2, out3;
    
    always @(posedge clk)
    begin
        out1 <= div1;
        out2 <= div2;
        out3 <= div3;
    end
endmodule

module simple_reg1(clk, in1, in2, out1, out2);
    input clk;
    input[7:0] in1, in2;
    output[7:0] out1, out2;
    reg[7:0] out1, out2;
    
    always @(posedge clk)
    begin
        out1 <= in1;
        out2 <= in2;
    end
endmodule

module simple_reg2(clk, in, out);
    input clk;
    input[7:0] in;
    output[7:0] out;
    reg[7:0] out;
    
    always @(posedge clk)
    begin
        out <= in;
    end
endmodule


module pipeline(clk, a, b, c, d, e, f, out);
    input[7:0] clk, a, b, c, d, e, f;
    output[7:0] out;
    
    wire[7:0] w_div1, w_div2, w_div3, w_mul, w_subst;
    wire [7:0] out_div1, out_div2, out_div3, out_div4, out_mul;
    
    assign w_div1 = a / b;
    assign w_div2 = c / d;
    assign w_div3 = e / f;
    
    reg_div r1(clk, w_div1, w_div2, w_div3, out_div1, out_div2, out_div3);

    assign w_mul = out_div1 * out_div2;
     
    simple_reg1 r2(clk, w_mul, out_div3, out_mul, out_div4);
    
    assign w_subst = out_mul - out_div4;
    
    simple_reg2 r3(clk, w_subst, out);
    
endmodule




