`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2020 21:05:07
// Design Name: 
// Module Name: ms_m
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


module ms_m
#(parameter n = 8 )
(
    input [n-1:0] Instruction,
    output reg [n-1:0] num
    ); 
    reg [n-1:0]NC; 
 always@* 
        begin  
        NC = 8'b0;
        num <= {NC[7:3],Instruction[2:0]};  
        end  
endmodule
   
