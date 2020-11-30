`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2020 20:21:47
// Design Name: 
// Module Name: Tb_Registros
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

module Tb_Registros;
    reg [7:0] Mux_a_Reg;
    reg [2:0] Sel_RX;
    reg [2:0] Sel_RY;
    reg [7:0] R0;
    reg Load_Store;
    reg i_Clk;
    reg i_Reset;
    wire [7:0] RX;
    wire [7:0] RY;
    
    Registros uut(
    .Mux_a_Reg(Mux_a_Reg),
    .Sel_RX(Sel_RX),
    .Sel_RY(Sel_RY),
    .R0(R0),
    .Load_Store(Load_Store),
    .i_Clk(i_Clk),
    .i_Reset(i_Reset),
    .RX(RX),
    .RY(RY)
    );
    
    initial
        begin
            i_Reset=1;
            i_Clk=0;
            Sel_RX=0;
            Sel_RY=0;
            Load_Store=0;
            R0=0;
            Mux_a_Reg=0;
            #2 i_Reset=0; Load_Store=0; Mux_a_Reg=8'b00000000;
            #2 Sel_RX=3'b000; Load_Store=1; Mux_a_Reg=8'b00000010;
            #2 Sel_RX=3'b001; Load_Store=1; Mux_a_Reg=8'b00000011;
            #2 Sel_RX=3'b010; Load_Store=1; Mux_a_Reg=8'b00000100;
            #2 Sel_RX=3'b011; Load_Store=1; Mux_a_Reg=8'b00000101;
            #2 Sel_RX=3'b100; Load_Store=1; Mux_a_Reg=8'b00000110;
            #2 Sel_RX=3'b101; Load_Store=1; Mux_a_Reg=8'b00000111;
            #2 Sel_RX=3'b110; Load_Store=1; Mux_a_Reg=8'b00001000;
            #2 Sel_RX=3'b111; Load_Store=1; Mux_a_Reg=8'b00001001;
            
            #2 Sel_RX=3'b011; Load_Store=0;
            #2 Sel_RY=3'b111; Load_Store=0;
        end
        always
            #1 i_Clk = !i_Clk;
endmodule