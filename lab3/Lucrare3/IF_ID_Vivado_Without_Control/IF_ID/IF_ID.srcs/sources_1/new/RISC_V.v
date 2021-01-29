`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/08/2021 03:33:37 PM
// Design Name: 
// Module Name: RISC_V
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


module RISC_V(input clk,
              input reset,
              
              output [31:0] PC_EX,
              output [31:0] ALU_OUT_EX,
              output [31:0] PC_MEM,
              output PCSrc,
              output [31:0] DATA_MEMORY_MEM,
              output [31:0] ALU_DATA_WB,
              output [1:0] forwardA, forwardB,
              output pipeline_stall
             );

    // output

    wire [31:0] PC_EX_out, ALU_OUT_EX_out, PC_MEM_out, DATA_MEMORY_MEM_out, ALU_DATA_WB_out;
    wire [1:0] forwardA_out, forwardB_out;
    wire PCSrc_out, pipeline_stall_out;
            
    // Control unit
    wire [6:0] opcode;
    wire control_sel;
    wire MemRead, MemtoReg, MemWrite, RegWrite, Branch, ALUSrc;
    wire [1:0] ALUop;

    // hazard detection
    wire [4:0] rd_EX, rs1_ID, rs2_ID;
    wire PCwrite, IF_IDwrite;

    // forwarding
    wire RegWrite_MEM, RegWrite_WB;
    wire [4:0] rs1_EX, rs2_EX, rd_MEM, rd_WB;

    // IF_ID
    wire IF_ID_write;
    wire [31:0] PC_Branch, PC_ID, INSTRUCTION_ID, IMM_ID, REG_DATA1_ID, REG_DATA2_ID;
    wire [2:0] FUNCT3_ID;
    wire [6:0] FUNCT7_ID;
    wire [4:0] rd_ID;

    // EXECUTE
    wire [31:0] IMM_EX, REG_DATA1_EX, REG_DATA2_EX;
    wire [2:0] FUNCT3_EX;
    wire [6:0] FUNCT7_EX;
    wire RegWrite_EX, MemtoReg_EX, MemRead_EX, MemWrite_EX;
    wire [1:0] ALUop_EX;
    wire ALUSrc_EX, Branch_EX;
    wire ZERO_EX;
    wire [31:0] PC_Branch_EX, REG_DATA2_EX_FINAL;
    wire [6:0] OPCODE_EX;


    // MEMORY
    wire MemtoReg_MEM, RegWrite_MEM, Branch_MEM, MemWrite_MEM, MemRead_MEM, ZERO_MEM;
    wire [31:0] ALU_OUT_MEM, PC_Branch_MEM, REG_DATA2_MEM_FINAL, read_data_MEM;  

    // WB
    wire MemtoReg_WB, RegWrite_WB;
    wire [31:0] read_data_WB, ALU_OUT_WB;


    control_path CONTROL_unit(opcode, control_sel, MemRead, MemtoReg, MemWrite, RegWrite, Branch, ALUSrc, ALUop);
    
    hazard_detection HD_unit(rd_EX, rs1_ID, rs2_ID, MemRead, PCwrite, IF_IDwrite, control_sel);

    forwarding FORWARDING_unit(rs1_EX, rs2_EX, rd_MEM, rd_WB, RegWrite_MEM, RegWrite_WB, forwardA_out, forwardB_out);


    RISC_V_IF_ID IF_ID(clk, reset,
                        IF_IDwrite,
                        PCSrc_out, PCwrite,
                        PC_Branch_EX,
                        RegWrite_WB,
                        ALU_DATA_WB_out,
                        rd_WB,

                        PC_ID,
                        INSTRUCTION_ID,
                        IMM_ID,
                        REG_DATA1_ID,
                        REG_DATA2_ID,
                        FUNCT3_ID,
                        FUNCT7_ID,
                        opcode,
                        rd_ID,
                        rs1_ID,
                        rs2_ID);


    pipe_ID_EX ID_EX_pipe(clk, reset,
                            MemRead, MemtoReg, MemWrite, RegWrite, Branch, ALUSrc,
                            ALUop, 
                            IMM_ID,
                            REG_DATA1_ID,
                            REG_DATA2_ID,
                            FUNCT3_ID,
                            FUNCT7_ID,
                            opcode,
                            rd_ID,
                            rs1_ID,
                            rs2_ID,
                            PC_ID,

                            MemRead_EX, MemtoReg_EX, MemWrite_EX, RegWrite_EX, Branch_EX, ALUSrc_EX,
                            ALUop_EX,
                            IMM_EX,
                            REG_DATA1_EX,
                            REG_DATA2_EX,
                            FUNCT3_EX,
                            FUNCT7_EX,
                            OPCODE_EX, // problem, apare doar de 2 ori -- useless
                            rd_EX,
                            rs1_EX,
                            rs2_EX,
                            PC_EX_out);


    EX execute(IMM_EX,
                REG_DATA1_EX,
                REG_DATA2_EX,
                PC_EX_out,
                FUNCT3_EX,
                FUNCT7_EX,
                rd_EX,
                rs1_EX,
                rs2_EX,
                RegWrite_EX, MemtoReg_EX, MemRead_EX, MemWrite_EX,
                ALUop_EX,
                ALUSrc_EX,
                Branch_EX,
                forwardA_out, forwardB_out,
                ALU_DATA_WB_out,
                ALU_OUT_MEM,
                
                ZERO_EX,
                ALU_OUT_EX_out,
                PC_Branch_EX,
                REG_DATA2_EX_FINAL);


    pipe_EX_MEM EX_MEM_pipe(clk,
                            reset,
                            MemtoReg_EX,
                            RegWrite_EX,
                            Branch_EX,
                            MemWrite_EX,
                            MemRead_EX,
                            ZERO_EX,
                            rd_EX,
                            ALU_OUT_EX_out,
                            PC_Branch_EX,
                            REG_DATA2_EX_FINAL,
                            
                            MemtoReg_MEM,
                            RegWrite_MEM,
                            Branch_MEM,
                            MemWrite_MEM,
                            MemRead_MEM,
                            ZERO_MEM,
                            rd_MEM,
                            ALU_OUT_MEM,
                            PC_Branch_MEM,
                            REG_DATA2_MEM_FINAL);

    // din figura: alu_Result este address
    // write_Data este iesirea din al doilea mux 4:1
    // iesirea din modulul de memorie este read_data
    data_memory data_mem(clk, MemRead_MEM, MemWrite_MEM, ALU_OUT_MEM, REG_DATA2_MEM_FINAL, read_data_MEM);

    // trebuie adaugata poarta and
    assign PCSrc_out = ZERO_MEM & Branch_MEM;

    // acesta este complet
    pipe_MEM_WB MEM_WB_pipe(clk, reset,
        	                MemtoReg_MEM, RegWrite_MEM, rd_MEM, ALU_OUT_MEM, read_data_MEM,
                            MemtoReg_WB, RegWrite_WB, rd_WB, ALU_OUT_WB, read_data_WB);

    // trebuie adaugat un multiplexor
    mux2_1 mux_WB(ALU_OUT_WB, read_data_WB, MemtoReg_WB, ALU_DATA_WB_out);

    assign PC_EX = PC_EX_out;
    assign ALU_OUT_EX = ALU_OUT_EX_out;
    assign PC_MEM = PC_Branch_MEM;
    assign PCSrc = PCSrc_out;
    assign DATA_MEMORY_MEM = read_data_MEM;
    assign ALU_DATA_WB = ALU_DATA_WB_out;
    assign forwardA = forwardA_out;
    assign forwardB = forwardB_out;
    assign pipeline_stall = control_sel;

endmodule
