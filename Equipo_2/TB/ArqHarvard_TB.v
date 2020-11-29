`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2020 22:32:38
// Design Name: 
// Module Name: ArqHarvard_TB
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


module ArqHarvard_TB;
    reg clk;
    reg reset;

    ArqHarvard uut(
    .clk(clk),
    .reset(reset)
    );
    
    initial
       begin
       reset=1;
       clk=0;
       #2
       reset=0;
       end
       always
       #1 clk = !clk;
endmodule
