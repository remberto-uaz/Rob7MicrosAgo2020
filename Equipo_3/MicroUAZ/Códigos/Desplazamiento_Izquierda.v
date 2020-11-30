`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2020 01:16:21
// Design Name: 
// Module Name: Desplazamiento_Izquierda
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


module Desplazamiento_Izquierda #(parameter N=8) (
    input[N-1:0]A,
    output [N-1:0]Y
);
assign Y=A<<1;
endmodule
