`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Universidad Autonoma de Zacatecas
// Engineer: Sergio Adad Bernal Adame
// 
// Create Date: 09.09.2020 11:26:32
// Design Name: 
// Module Name: tb_DecoAnillo
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


module tb_DecoAnillo;
    reg i_Clk;
    reg i_Reset;
    wire [1:0] o_Sel;
    wire [3:0] o_Anodos;

    DecoAnillo uut(
        .i_Clk(i_Clk),
        .i_Reset(i_Reset),
        .o_Sel(o_Sel),
        .o_Anodos(o_Anodos)
     );
    initial 
        begin
         i_Clk=0;
         i_Reset=0;
        #2 i_Reset=1;
     end
   always
   #1 i_Clk=!i_Clk; 
    initial 
        begin
            #2 i_Clk=4'b0111;
            #2 i_Clk=4'b1011;
            #2 i_Clk=4'b1101;
            #2 i_Clk=4'b1110;
            #2 i_Clk=2'b00;
            #2 i_Clk=2'b01;
            #2 i_Clk=2'b10;
            #2 i_Clk=2'b11;
     end
endmodule

