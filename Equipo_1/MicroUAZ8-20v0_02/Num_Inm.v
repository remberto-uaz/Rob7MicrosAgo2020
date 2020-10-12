`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.10.2020 14:29:48
// Design Name: 
// Module Name: Num_Inm
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


module Num_Inm
#(parameter n = 8 )
(
    input [n-1:0] i_Instruction,
    output reg [n-1:0] NUM
    ); 
    reg [n-1:0]NC; 
 always@* 
        begin  
        NC = 8'b0;
        NUM <= {NC[7:3],i_Instruction[2:0]};  
        end  
endmodule
