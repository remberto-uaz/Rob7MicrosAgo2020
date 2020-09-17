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
    input i_clk,
    input i_reset,
    output reg o_clk_120Hz
);
reg [19:0] cuent; // registro para almacenar la cuenta interna del preescalador

always @ ( posedge i_clk, negedge i_reset)

    if (~i_reset)
    begin
        cuent <= 0;
        o_clk_120Hz <= 0;
    end
    
 else if (cuent < lim) //aumenta la cuenta en uno mintras no llegue al limite
     begin
         cuent <= cuent + 1'd1;
         o_clk_120Hz <= 0;
     end
     
 else // manda un pulso a la salida cuando llega al limite y la cuenta regresa a cero
     begin
         cuent <= 0;
         o_clk_120Hz <= 1;
     end
endmodule
