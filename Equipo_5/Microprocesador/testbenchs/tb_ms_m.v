`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2020 21:18:38
// Design Name: 
// Module Name: tb_ms_m
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


module tb_ms_m();
reg [7:0] Instruction;
    wire [7:0] num;
    wire [7:0] Instruction2;
   ms_m uut(
   .Instruction(Instruction),
   .Instruction2(Instruction2),
   .num(num)
   );
   initial 
   begin
   
    Instruction = 0; 
    
    
    #2Instruction = 8'b00000001;
    
   
    #2Instruction = 8'b00001011;
    
    
    #2Instruction = 8'b11000001; 
   
   
    #2Instruction = 8'b11000001;
    
   
    #2Instruction = 8'b11101011;
    
    
    #2Instruction = 8'b11111111;
   end 
   
endmodule
