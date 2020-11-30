`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2020 00:04:30
// Design Name: 
// Module Name: Complemento2
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


module Complemento2 #(parameter N=8)(
    input [N-1:0] X,
    output[N-1:0]Y
);

wire [N-1:0] w_comp1_to_sumador;

Complemento1 c1(
    .X(X),
    .Y(w_comp1_to_sumador)
);

SumadorNbits s1(
    .a(w_comp1_to_sumador),
    .b(8'b00000001),
    //.b(1'b1),
    .c_in(1'b0),
    .sum(Y)
);

endmodule
