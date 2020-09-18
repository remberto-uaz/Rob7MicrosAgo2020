`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UAZ
// Engineer: Alfa
// 
// Create Date: 07.09.2020 10:37:39
// Design Name:Controlador_display_7Segmentos_tb 
// Module Name: Controlador_display_7Segmentos_tb
// Project Name: Controlador_display_7Segmentos_tb
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


module Controlador_display_7Segmentos_tb; 
    reg [3:0] i_Datos_0;
    reg [3:0] i_Datos_1;
    reg [3:0] i_Datos_2;
    reg [3:0] i_Datos_3;
    reg i_Reloj;
    reg i_Reset;
    wire [6:0] o_Segmentos;
    wire [3:0] o_Anodo_4_Bits;
    
    Controlador_display_7segmentos uut(
     .i_Datos_0(i_Datos_0),
     .i_Datos_1(i_Datos_1),
     .i_Datos_2(i_Datos_2),
     .i_Datos_3(i_Datos_3),
     .i_Reloj(i_Reloj),
     .i_Reset(i_Reset),
     .o_Segmentos(o_Segmentos),
     .o_Anodo_4_Bits(o_Anodo_4_Bits)
  );
  
initial 
begin 
    i_Reset= 0;
    i_Reloj  = 0;
    i_Datos_0= 4'd0;
    i_Datos_1= 4'd0;
    i_Datos_2= 4'd0;
    i_Datos_3= 4'd0;
    #2 
    i_Datos_0= 4'd1;
    i_Datos_1= 4'd2;
    i_Datos_2= 4'd3;
    i_Datos_3= 4'd4;
    i_Reset = 1;    
     
end 
always
    #1 i_Reloj  = ~i_Reloj ; 
endmodule

