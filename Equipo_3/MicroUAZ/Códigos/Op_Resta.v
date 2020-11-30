`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2020 18:49:52
// Design Name: 
// Module Name: Op_Resta
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


module Op_Resta #(parameter N=8)(
    input [N-1:0] A,
    input [N-1:0] B,
    output wire [N-1:0] R
    //output wire Cout
);
wire [N-1:0] w_to_complemento_2;
    SumadorNbits  #(.N(N)) SS1(
        .c_in(1'b0),
        .a(w_to_complemento_2),
        .sum(R),
        .b(A)
    );
    
    Complemento2 #(.N(N)) CC1(
        .X(B),
        .Y(w_to_complemento_2)
    );
     
endmodule
