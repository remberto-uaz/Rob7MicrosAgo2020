`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2020 23:31:40
// Design Name: 
// Module Name: Deco_TB
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


module Deco_TB;
    reg [8:0] i_Instruction;
    wire [2:0] o_AddrR1;
    wire [2:0] o_AddrR2;
    wire [2:0] o_AddrW;
    wire [3:0] o_COND;
    wire [2:0] o_Data_SEL;
    wire [2:0] o_SEL_ALU;
    wire [2:0] o_SEL_BIU;
    wire o_R_W;
   
   Deco uut(
        .i_Instruction(i_Instruction),
        .o_AddrR1(o_AddrR1),
        .o_AddrR2(o_AddrR2),
        .o_AddrW(o_AddrW),
        .o_COND(o_COND),
        .o_Data_SEL(o_Data_SEL),
        .o_SEL_ALU(o_SEL_ALU),
        .o_SEL_BIU(o_SEL_BIU),
        .o_R_W(o_R_W)
   );
   
   initial
        begin
            
            i_Instruction= 9'b000101110;
            
            #2
            i_Instruction = 9'b001101110;
            
            #2 
            i_Instruction= 9'b010101110;
            
            #2 
            i_Instruction= 9'b011101110;
            
            #2 
            i_Instruction= 9'b100101110;
            
            #2 
            i_Instruction= 9'b101101110;
            
            #2 
            i_Instruction= 9'b110101110;
            #2
            i_Instruction= 9'b111101110;
        end
endmodule
