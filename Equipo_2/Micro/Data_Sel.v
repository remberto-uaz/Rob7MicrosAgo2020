`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2020 16:11:49
// Design Name: 
// Module Name: Data_Sel
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


module Data_Sel(
    input [7:0] DataIn,
    input [7:0] Direccion,
    input [2:0] NUM,
    input [7:0] RY,
    input [7:0] Resultado,
    input [2:0] SEL,
    output reg [7:0] Dato_Registro
    );
    
    always@(*)
        case(SEL)
            0: Dato_Registro <= DataIn;
            1: Dato_Registro <= Direccion;
            2: Dato_Registro <= NUM;
            3: Dato_Registro <= RY;
            4: Dato_Registro <= Resultado;
            default Dato_Registro <= 0;
        endcase
endmodule
