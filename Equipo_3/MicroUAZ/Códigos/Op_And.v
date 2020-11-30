`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2020 12:11:01
// Design Name: 
// Module Name: Op_And
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

module Op_And#(parameter N=8)(
    input[N-1:0]A,
    input[N-1:0]B,
    output [N-1:0]Y
);

assign Y=A&B;
endmodule
