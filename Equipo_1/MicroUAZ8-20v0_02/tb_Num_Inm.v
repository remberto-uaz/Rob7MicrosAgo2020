`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.10.2020 10:05:00
// Design Name: 
// Module Name: tb_Num_Inm
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


module tb_Num_Inm;
    reg [7:0] i_Instruction;
    wire [7:0] NUM;
   Num_Inm uut(
   .i_Instruction(i_Instruction),
   .NUM(NUM)
   );
   initial 
   begin
   
    i_Instruction = 0; 
    
    
    #2i_Instruction = 8'b00000001;
    
   
    #2i_Instruction = 8'b00001011;
    
    
    #2i_Instruction = 8'b11111111; 
   end 
endmodule
