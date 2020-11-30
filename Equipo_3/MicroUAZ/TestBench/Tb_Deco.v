`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2020 12:25:01
// Design Name: 
// Module Name: Tb_Deco
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

module Tb_Deco;
           reg [8:0] i_Instruction;
           
           wire [2:0] ControlJump;
           wire [2:0] Sel_Mux;
           wire [2:0] Sel_RY;
           wire [2:0] Sel_RX;
           
           wire Load_Store;
           
           wire [2:0] Sel_ALU;
           wire [1:0] Sel_Salidas;
    
    Decov2 uut(
        .i_Instruction(i_Instruction),
        .ControlJump(ControlJump),
        .Sel_Mux(Sel_Mux),
        .Sel_RY(Sel_RY),
        .Sel_RX(Sel_RX),
        .Load_Store(Load_Store),
        .Sel_ALU(Sel_ALU),
        .Sel_Salidas(Sel_Salidas)
    );
    
    initial
        begin
            
            i_Instruction=0;
        
            #2 i_Instruction=9'b000101001;
            #2 i_Instruction=9'b001111011;
            #2 i_Instruction=9'b010111011;
            #2 i_Instruction=9'b011101001;
            #2 i_Instruction=9'b100101111;
            #2 i_Instruction=9'b101101001;
            #2 i_Instruction=9'b110111101;
            #2 i_Instruction=9'b111111101;
            
        end
endmodule

