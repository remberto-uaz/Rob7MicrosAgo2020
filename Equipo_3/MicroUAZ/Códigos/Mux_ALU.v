`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2020 01:26:29
// Design Name: 
// Module Name: Mux_ALU
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

module Mux_ALU#(parameter N=8)(
    input[N-1:0]salidasuma,
    input[N-1:0]salidaresta,
    input[N-1:0]salidaDizquierda,
    input[N-1:0]salidaDderecha,
    input[N-1:0]salidanot,
    input[N-1:0]salidaand,
    input[N-1:0]salidaor,
    input[N-1:0]salidaxor,
    input[N-1:0]salidanada,
    input[3:0] Operador,
    output[3:0] OperadorSalida,
    output reg [N-1:0] SalidaOp

    );
    reg anterior;
    assign OperadorSalida=Operador;
    always@(*)
    case (Operador)
        4'b0000: SalidaOp <= salidasuma;
        4'b0001: SalidaOp <= salidaresta;
        4'b0010: SalidaOp <= salidaDizquierda;
        4'b0011: SalidaOp <= salidaDderecha;
        4'b0100: SalidaOp <= salidaand;
        4'b0101: SalidaOp <= salidaor;
        4'b0110: SalidaOp <= salidanot;
        4'b0111: SalidaOp <= salidaxor;
        4'b1111: SalidaOp <= salidanada;
        default: SalidaOp <= salidanada;
    endcase
    
endmodule