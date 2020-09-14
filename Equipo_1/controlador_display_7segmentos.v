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


module controlador_display_7segmentos(
    input [3:0] i_Datos_0,
    input [3:0] i_Datos_1,
    input [3:0] i_Datos_2,
    input [3:0] i_Datos_3,
    input i_Reloj,
    input i_Reset,
    output [6:0] o_Segmentos,
    output [3:0] o_Anodo_4_Bits
    );
    wire [1:0]sel_w;
    wire [3:0]demux_w;
    wire preesc_w;
  
        Demux4_a_1 mux(
        .i_Datos_0(i_Datos_0),
        .i_Datos_1(i_Datos_1),
        .i_Datos_2(i_Datos_2),
        .i_Datos_3(i_Datos_3),
        .i_sel(sel_w),
        .o_demux(demux_w)
        );
     
        DecoBin_a_7Seg dec_BCD (
        .i_deco(demux_w),
        .o_segmentos(o_Segmentos)
        );
      
        DecoAnillo dec_anillo (
        .i_clk(preesc_w),
        .i_reset(i_Reset),
        .o_anodos(o_Anodo_4_Bits),
        .o_sel(sel_w)
        );

        Preescalador preesc (
        .i_clk(i_Reloj),
        .i_rst(i_Reset),
        .o_clk_120Hz(preesc_w)
        );
   
    endmodule
