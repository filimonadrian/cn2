`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2020 07:46:18 PM
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

module pipeline(clk, reset, load, PC_IF, INSTR_IF, PC_ID, INSTR_ID);
    input clk, reset, load;
    input [31:0] PC_IF, INSTR_IF;
    output reg [31:0] PC_ID, INSTR_ID;
   
    always @(posedge clk)
    begin
        if (reset == 1)
        begin 
            PC_ID = 0;
            INSTR_ID = 0;
        end
        else if (load == 1)
        begin
            PC_ID <= PC_IF;
            INSTR_ID <= INSTR_IF;
        end
    end
    
endmodule
