`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2020 21:12:38
// Design Name: 
// Module Name: Banco_Registros
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


module Registros(
    input i_Reset,
    input i_Clk,
    input [7:0] R0,
    input [2:0] Sel_RX,
    input [2:0] Sel_RY,
    input  Load_Store, // 0->leer, 1->escribir
    input [7:0] Mux_a_Reg,
    output [7:0] RX,
    output [7:0] RY
    );
    
    reg [7:0] Registros [0:7];
    reg [7:0]ry;
    reg [7:0]rx;
    always @(posedge i_Clk, posedge i_Reset) begin
        if(i_Reset) 
            begin
                Registros[0]<=0;
                Registros[1]<=0;
                Registros[2]<=0;
                Registros[3]<=0;
                Registros[4]<=0;
                Registros[5]<=0;
                Registros[6]<=0;
                Registros[7]<=0; 
            end
        else
            if (Load_Store)
                    Registros[Sel_RX[2:0]]<=Mux_a_Reg;
                    else
                    Registros[0]=R0;
    end   
    assign RX=Registros[Sel_RX[2:0]];
    assign RY=Registros[Sel_RY[2:0]];
endmodule