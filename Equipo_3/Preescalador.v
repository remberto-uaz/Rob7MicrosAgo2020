`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2020 10:26:59
// Design Name: 
// Module Name: Prescalador
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


module Preescalador #(parameter lim=416666) (
    input i_Clk,
    input i_Reset,
    output reg o_Clk_120Hz
);
reg [19:0] cuent; // registro para almacenar la cuenta interna del preescalador

    always @ ( posedge i_Clk, negedge i_Reset)

        if (~i_Reset)
    begin
        cuent <= 0;
        o_Clk_120Hz <= 0;
    end
    
 else if (cuent < lim) //aumenta la cuenta en uno mintras no llegue al limite
     begin
         cuent <= cuent + 1'd1;
         o_Clk_120Hz <= 0;
     end
     
 else // manda un pulso a la salida cuando llega al limite y la cuenta regresa a cero
     begin
         cuent <= 0;
         o_Clk_120Hz <= 1;
     end
endmodule
