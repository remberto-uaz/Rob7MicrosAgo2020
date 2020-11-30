`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2020 00:04:30
// Design Name: 
// Module Name: Sumador1bit
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


module Sumador1bit(
    input a,b,c_in,
    output sum,c_out
);
    wire s1,s2,c1;
    xor (s1,a,b);
    and(c1,a,b);
    xor(sum,s1,c_in);
    and(s2,s1,c_in);
    xor(c_out,s2,c1);
endmodule
