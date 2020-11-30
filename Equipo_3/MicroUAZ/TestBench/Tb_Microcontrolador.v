`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.11.2020 22:56:21
// Design Name: 
// Module Name: Tb_Microcontrolador
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


module Tb_Microcontrolador(

    );
    
    reg  i_Clk;
    reg  i_Reset;
    wire [7:0] o_Dataout_Bus;
    
    Microcontrolador uut(       
        .i_Clk(i_Clk),        
        .i_Reset(i_Reset),      
        .o_Dataout_Bus(o_Dataout_Bus)
    );
    
   initial
        begin
            i_Clk<=0;
            i_Reset<=1;
            #1 i_Reset<=0;
            #1 i_Clk<=1;
        end
        always@(*)
        begin
            #1 i_Clk <= ~i_Clk; //clk invierte su valor
        end                
endmodule