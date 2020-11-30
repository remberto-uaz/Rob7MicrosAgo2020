`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2020 19:03:21
// Design Name: 
// Module Name: Mux
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

module Mux(
    input [7:0] i_DataInBus,
    input [7:0] RY,
    input [7:0] RX,
    input [2:0] Num,
    input [8:0] SaveR7,
    input [2:0] Sel_Mux,
    output reg [7:0] Mux_a_Reg
    );
    
    always@(*)
    begin
        case (Sel_Mux)
        3'b000: Mux_a_Reg = i_DataInBus;
        3'b010: Mux_a_Reg = RY;
        3'b011: Mux_a_Reg = RX;
        3'b100: Mux_a_Reg = Num;
        3'b101: Mux_a_Reg = SaveR7;
        default:Mux_a_Reg <= 0;
        endcase
    end
endmodule

