`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2020 19:13:20
// Design Name: 
// Module Name: Tb_Micro
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

module Tb_Mux;
    reg [7:0] I_DataInBus;
    reg [7:0] RY;
    reg [7:0] RX;
    reg [2:0] Num;
    reg [7:0]SaveR7;
    reg [2:0] Sel_Mux;
    wire [7:0] Mux_a_Reg;
    
    Mux uut(
        .i_DataInBus(I_DataInBus),
        .RY(RY),
        .RX(RX),
        .Num(Num),
        .SaveR7(SaveR7),
        .Sel_Mux(Sel_Mux),
        .Mux_a_Reg(Mux_a_Reg)
    );
    initial
        begin
            I_DataInBus=0;
            RY=0;
            RX=0;
            Num=0;
            SaveR7=0;
            Sel_Mux=3'b000;
            #2 I_DataInBus=8'b00001001; RY=8'b00000111; RX=8'b00000110; Num=8'b00000101; SaveR7=8'b00000100;
            #2 Sel_Mux=3'b000;
            #2 Sel_Mux=3'b010;
            #2 Sel_Mux=3'b011;
            #2 Sel_Mux=3'b100;
            #2 Sel_Mux=3'b101;
        end
endmodule
