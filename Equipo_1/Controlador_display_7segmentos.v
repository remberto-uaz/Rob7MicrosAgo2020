`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UAZ
// Engineer: Alfa
// 
// Create Date: 07.09.2020 10:37:39
// Design Name:controlador_display_7segmentos 
// Module Name: controlador_display_7segmentos
// Project Name: controlador_display_7segmentos
// Target Devices: Basys 3 
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


module Controlador_display_7segmentos(
    input [3:0] i_Datos_0,
    input [3:0] i_Datos_1,
    input [3:0] i_Datos_2,
    input [3:0] i_Datos_3,
    input i_Reloj,
    input i_Reset,
    output [6:0] o_Segmentos,
    output [3:0] o_Anodo_4_Bits
    );
    wire [1:0]Sel_w;
    wire [3:0]Demux_w;
    wire Preesc_w;
  
        Demux4_a_1 mux(
        .i_Datos_0(i_Datos_0),
        .i_Datos_1(i_Datos_1),
        .i_Datos_2(i_Datos_2),
        .i_Datos_3(i_Datos_3),
        .i_Sel(Sel_w),
        .o_Demux(Demux_w)
        );
     
        DecoBin_7Seg dec_BCD (
        .i_Deco(Demux_w),
        .o_Segmentos(o_Segmentos)
        );
      
        DecoAnillo dec_anillo (
        .i_Clk(Preesc_w),
        .i_Reset(i_Reset),
        .o_Anodos(o_Anodo_4_Bits),
        .o_Sel(Sel_w)
        );

        Preescalador preesc (
        .i_Clk(i_Reloj),
        .i_Reset(i_Reset),
        .o_Clk_120Hz(Preesc_w)
        );
   
    endmodule
