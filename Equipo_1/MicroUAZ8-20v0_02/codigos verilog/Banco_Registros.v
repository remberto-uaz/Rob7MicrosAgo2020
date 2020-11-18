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


module Banco_Registros(
    input Rst,
    input Clk,
    input wire[5:0] SelR, // SelR[2:0]->Rx, SelR[5:3]->Ry  
    input wire RW, // 0->leer, 1->escribir
    input wire[7:0] DW,
    output reg [7:0] Rx,
    output reg [7:0] Ry
    );
    
    reg [7:0] Rgs [7:0];
    
    always @(posedge Clk, posedge Rst) begin
        if(Rst) 
            begin
                Rgs[0]<=0;
                Rgs[1]<=0;
                Rgs[2]<=0;
                Rgs[3]<=0;
                Rgs[4]<=0;
                Rgs[5]<=0;
                Rgs[6]<=0;
                Rgs[7]<=0; 
                Rx<=0;
                Ry<=0;
            end
        else
            if (RW)
                begin
                    Rgs[SelR[2:0]]<=DW;
                end
            else
                begin
                    Rx<=Rgs[SelR[2:0]];
                    Ry<=Rgs[SelR[5:3]];
                end
    end
endmodule
