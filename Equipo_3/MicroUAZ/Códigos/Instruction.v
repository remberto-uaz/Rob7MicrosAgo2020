`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.12.2019 20:48:44
// Design Name: 
// Module Name: memoria
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


module Instruction(
input [8:0] i_Instruction,
output reg [8:0] o_Addressinstruction_Bus
);
reg [8:0] mem [0:255];

initial
$readmemb("Instruction.mem",mem,0,255);
always@(i_Instruction)
o_Addressinstruction_Bus <= mem[i_Instruction];
        
endmodule