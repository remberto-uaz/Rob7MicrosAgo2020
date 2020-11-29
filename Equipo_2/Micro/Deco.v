`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2020 14:37:16
// Design Name: 
// Module Name: Deco
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


module Deco(
    input [8:0] i_Instruction,
    output reg [2:0] o_AddrR1,
    output reg [2:0] o_AddrR2,
    output reg [2:0] o_AddrW,
    output reg [3:0] o_COND,
    output reg [2:0] o_Data_SEL,
    output reg [3:0] o_SEL_ALU,
    output reg [1:0] o_SEL_BIU,
    output reg o_R_W
    );
    
    always@(i_Instruction)
    begin
        case(i_Instruction[8:6])
            0: 
                begin
                    o_AddrR1 <= 0;
                    o_AddrR2 <= 0;
                    o_AddrW <= i_Instruction[5:3];
                    o_COND <= 4'hF;                                 // LOAD RX, #NUM
                    o_Data_SEL <= 3'd2;
                    o_SEL_ALU <= 4'h8;
                    o_SEL_BIU <= 3'd7;
                     o_R_W <= 1;
                 end
            1:
                 begin
                    o_AddrR1 <= 0;
                    o_AddrR2 <= i_Instruction[2:0];
                    o_AddrW <= i_Instruction[5:3];
                    o_COND <= 4'hF;                                 // LOAD RX, [RY]
                    o_Data_SEL <= 3'd0;
                    o_SEL_ALU <= 4'h8;
                    o_SEL_BIU <= 3'd0;
                     o_R_W <= 1;
                 end   
            2:
                 begin
                    o_AddrR1 <= 0;
                    o_AddrR2 <= i_Instruction[5:3];
                    o_AddrW <=0;
                    o_COND <= 4'hF;                                 // STORE #NUM
                    o_Data_SEL <= 3'd5;
                    o_SEL_ALU <= 4'h8;
                    o_SEL_BIU <= 3'd1;
                     o_R_W <= 0;
                 end
            3:
                 begin
                    o_AddrR1 <= i_Instruction[5:3];
                    o_AddrR2 <= i_Instruction[2:0];
                    o_AddrW <= 0;
                    o_COND <= 4'hF;
                    o_Data_SEL <= 3'd0;                             // STORE [RX], RY
                    o_SEL_ALU <= 4'h8;
                    o_SEL_BIU <= 3'd2;
                     o_R_W <= 0;
                 end      
            4:
                 begin
                    o_AddrR1 <= 0;
                    o_AddrR2 <= i_Instruction[2:0];
                    o_AddrW <= i_Instruction[5:3];
                    o_COND <= 4'hF;                                 // MOVE  RX, RY
                    o_Data_SEL <= 3'd3;
                    o_SEL_ALU <= 4'h8;
                    o_SEL_BIU <= 3'd7;
                     o_R_W <= 1;
                 end  
            5:
                 begin
                    o_AddrR1 <= 0;
                    o_AddrR2 <= i_Instruction[5:3];
                    o_AddrW <= 0;
                    o_COND <= 4'hF;
                    o_Data_SEL <= 3'd4;                             // MATH  RX, OP
                    o_SEL_ALU <= i_Instruction[2:0];
                     o_SEL_BIU <= 3'd7;
                    o_R_W <= 1;
                 end  
            6:
                 begin
                    o_AddrR1 <= i_Instruction[5:3];
                    o_AddrR2 <= 0;
                    o_SEL_ALU <= 4'h8;
                    o_COND = {1'b0,i_Instruction[2:0]};             // JMP  RX, COND
                    o_SEL_BIU <= 3'd7;
                    if (i_Instruction[2:0]==3'b001)
                    begin
                        o_Data_SEL <= 3'd2;
                        o_AddrW <= 7;
                        o_R_W <= 1;
                    end
                    else
                    begin
                        o_Data_SEL <= 3'd3;
                        o_AddrW <= 0;
                        o_R_W <= 0;
                    end
                 end  
            7:
                 begin
                    o_AddrR1 <= 0;
                    o_AddrR2 <= 0;
                    o_AddrW <= 0;
                    o_COND <= 4'hF;
                    o_Data_SEL <= 3'd0;                             // NOP
                    o_SEL_ALU <= 4'h8;
                    o_SEL_BIU <= 3'd7;
                    o_R_W <= 0;
                 end 
        endcase
    end             
endmodule
