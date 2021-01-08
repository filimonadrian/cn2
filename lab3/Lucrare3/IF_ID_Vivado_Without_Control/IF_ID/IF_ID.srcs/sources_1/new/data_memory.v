`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/08/2021 10:56:59 AM
// Design Name: 
// Module Name: data_memory
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


module data_memory(input clk,       
                   input mem_read,
                   input mem_write,
                   input [31:0] address,
                   input [31:0] write_data,
                   output reg [31:0] read_data
                   );
     reg [31:0] regs [0:1024];               
     wire [9:0] in_address = address[11:2];
     integer i;
     
    initial begin
        for (i = 0; i < 1024; i = i + 1)
        begin
            regs[i] = i;
        end
    end
    
    // mem_read is async
    always@(*) begin
        if(mem_read == 1) begin
            read_data = regs[in_address];
        end
    end
    
    // mem_write is sync
    always@(posedge clk) begin
        if (mem_write == 1) begin
            regs[in_address] = write_data;
        end
    end
                           
endmodule
