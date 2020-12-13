`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2020 08:42:37 PM
// Design Name: 
// Module Name: test_multifunc_reg
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


module test_multifunc_reg();
    reg clk, enable, reset, inc, dec, shl, shr;
    reg [3:0] in;
    wire[3:0] out;

multifunc_reg uut (clk, in, enable, reset, inc, dec, shl, shr, out);

always #25 clk = ~clk;

initial
begin
    clk = 0;
    in = 16;
    enable = 0;
    reset = 0;
    inc = 0;
    dec = 0;
    shl = 0;
    shr = 0;
    #50
    inc = 1;
    #50
    enable = 1;
    inc = 1;
    shl = 1;
    #50
    inc = 0;
    shl = 0;
    dec = 1;
    #50
    shr = 1;
    dec = 0;
    #50
    shr = 1;
    #50
    inc = 1;
    shr = 0;
end

endmodule
