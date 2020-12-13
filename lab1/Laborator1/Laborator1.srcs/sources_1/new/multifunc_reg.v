`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2020 04:26:20 PM
// Design Name: 
// Module Name: multifunc_reg
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


module multifunc_reg(clk, in, enable, reset, inc, dec, shl, shr, out);
    input clk, enable, reset, inc, dec, shl, shr;
    input [3:0] in;
    output[3:0] out;
    reg[3:0] out;

    always @(posedge clk or reset) 
    begin
        if (reset) 
        begin
            out = 0;
        end
        else if (enable)
        begin
            if (inc)
            begin 
                out = out + 1;
            end
            else if (dec)
            begin
                out = out - 1;
            end
            else if (shr)
            begin
                out = out>>1;    
            end
            else if (shl)
            begin
                out = out<<1;
            end
        end
        else 
        begin
            out = in;
        end
    end
endmodule










