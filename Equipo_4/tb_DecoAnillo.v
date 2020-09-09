`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UAZ-IRM
// Engineer: Guillermo Cruz Fernandez
// 
// Create Date: 09.09.2020 12:13:07
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
reg [1:0] i_Clk;
reg i_Reset;
wire [3:0] o_Anodos;
wire [1:0] o_Sel;

//instanciamiento
DecoAnillo uut(
    .i_Clk(i_Clk),
    .i_Reset(i_Reset),
    .o_Anodos(o_Anodos),
    .o_Sel(o_Sel)
);

//inicializacion de las entradas

    initial
        begin
        i_Clk=0;
        i_Reset=0;
        
        
        #2 i_Clk=2'd0; 
        #2 i_Clk=2'd1; 
        #2 i_Clk=2'd2; 
        #2 i_Clk=2'd3; 
        #2 i_Reset=1;
        
      end
endmodule
