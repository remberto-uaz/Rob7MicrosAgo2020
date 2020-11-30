`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2020 00:04:30
// Design Name: 
// Module Name: SumadorNbits
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


module SumadorNbits#(parameter N=8)(
    input [N-1:0] a,
    input [N-1:0] b,
    input c_in,
    output [N-1:0] sum,
    output c_out
);

wire [0:N-1] carry;
genvar i; 

Sumador1bit sumador0(
    .a(a[0]),
    .b(b[0]),
    .c_in(1'b0),
    .sum(sum[0]),
    .c_out(carry[0])
);

generate for (i=0;i<N;i=i+1)
    begin: add_bit
    Sumador1bit sumador_medio(
        .a(a[i+1]),
        .b(b[i+1]),
        .c_in(carry[i]),
        .sum(sum[i+1]),
        .c_out(carry[i+1])
    );

    end
endgenerate

Sumador1bit sumadorN(
    .a(a[N-1]),
    .b(b[N-1]),
    .c_in(carry[N-2]),
    .sum(sum[N-1]),
    .c_out(c_out)
);


endmodule
