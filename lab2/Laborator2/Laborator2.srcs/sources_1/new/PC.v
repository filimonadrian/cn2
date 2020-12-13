`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2020 04:46:39 PM
// Design Name: 
// Module Name: PC
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

module PC(clk, res, write, in, out);
          
    input clk, res, write;
    input [31:0] in;
    output reg [31:0] out;
    
    always @(posedge clk)
    begin
        if (res)
        begin
            out = 0;
        end
        else if (write)
        begin
            out = in;
        end

    end
    
endmodule
