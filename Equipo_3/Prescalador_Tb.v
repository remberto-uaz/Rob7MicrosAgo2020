`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Universidad Autonoma Zacatecas
// Engineer: Jorge Manuel de Avila Reveles, Geovanni López Macias, Gerardo Frías Donlucas, César Rodolfo Salazar Rodríguez
// 
// Create Date: 09.09.2020 10:38:22
// Design Name: 
// Module Name: Prescalador
// Project Name: Controlador_Display_7Segmentos
// Target Devices: Basys 3
// Tool Versions: Vivado 2018.2
// Description: Modulo encargado de convertir la señal base de la tarjeta en una mas pequeña
// 
// Dependencies: 
// 
// Revision: 0.2
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Preescalador_Tb;
    reg i_reset;
    reg i_clk;
    wire o_clk_120Hz;
    Prescalador uut(
        .i_reset(i_reset),
        .i_clk(i_clk),
        .o_clk_120Hz(o_clk_120Hz)
    );
    initial
    begin
        i_reset<=1;
        i_clk<=0; //inicializa las entradas
        
        #20 i_reset<=1; // cuando se activa el reset empieza el prescalador
    end
    always@(*)
    begin
        #1 i_clk <= ~i_clk; //clk invierte su valor para que el reloj este en constante cambio
    end
    
endmodule
