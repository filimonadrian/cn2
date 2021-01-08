`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/08/2021 03:34:19 PM
// Design Name: 
// Module Name: pipe_MEM_WB
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


module pipe_MEM_WB(input clk, reset,
                    // semnale pentru wb
                    input MemtoReg_MEM,
                    input RegWrite_MEM,
    
                    input [4:0] RD_MEM,

                    input [31:0] address_MEM,
                    input [31:0] read_data_MEM,

                    // semnale pentru wb
                    output reg MemtoReg_WB,
                    output reg RegWrite_WB,
    
                    output reg [4:0] RD_WB,

                    output reg [31:0] address_WB,
                    output reg [31:0] read_data_WB

);

  always@(posedge clk) begin
    if (reset) begin

        MemtoReg_WB = 0;
        RegWrite_WB = 0;
        RD_WB = 0;
        address_WB = 0;
        read_data_WB = 0;      

    end
    else begin
        MemtoReg_WB = MemtoReg_MEM;
        RegWrite_WB = RegWrite_MEM;
        RD_WB = RD_MEM;
        address_WB = address_MEM;
        read_data_WB = read_data_MEM;

    end
  end

endmodule
