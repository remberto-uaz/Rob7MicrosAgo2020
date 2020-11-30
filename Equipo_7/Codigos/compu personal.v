`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2020 12:24:04
// Design Name: 
// Module Name: compu_personal
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


module proyecto_pc
    (
     input rst,
     input clk 
    );
    
    wire [8:0] i_instruccion;
    wire [7:0] i_dato;
    wire [7:0] o_direccion_instruccion;
    wire [7:0] o_salida_datos;
    wire [7:0] o_direccion_datos;
    wire RW;
    
    Micro8bits_Harvard compu (
         .clk(clk),
         .rst(rst),
         .i_instruccion(i_instruccion),
         .i_dato(i_dato),
         .o_direccion_instruccion(o_direccion_instruccion),
         .o_salida_datos(o_salida_datos),
         .o_direccion_datos(o_direccion_datos),
         .RW(RW)
         );
         
         M_Ram #(8,8,256) memDts (
            .e(o_salida_datos),
            .a(o_direccion_datos),
            .RW(RW),
            .s(i_dato)
            );
            
         M_Rom #(9,8,256) memInstr (
            .a(o_direccion_instruccion),
            .s(i_instruccion)
            );   
endmodule
