`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.11.2020 12:30:18
// Design Name: 
// Module Name: Micro8bits_Harvard
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


module Micro8bits_Harvard
(
    input clk,
    input rst,
    input [8:0] i_instruccion,
    input [7:0] i_dato,
    output [7:0] o_direccion_instruccion,
    output [7:0] o_salida_datos,
    output [7:0] o_direccion_datos,
    output RW
    );
    
    /////Conexiones internas del microposesador 8 bits harvard////
    wire [7:0] c_Num;
    wire [2:0] c_DW;
    wire [5:0] c_Sel_reg;
    wire c_W;
    wire [7:0] c_o_DW;
    wire [7:0] c_Rx;
    wire [7:0] c_Ry;
    wire [2:0] c_Sel_op;
    wire [7:0] c_R0;
    wire [2:0] c_Ban;
    wire [1:0] c_Sel_outbus;
    
    ////////// modulo de Control_micro.v /////////
    Control_micro
    Control(
          .i_instruccion(i_instruccion),
          .Rx(c_Ry),
          .Ban(c_Ban),
          .Sel_op(c_Sel_op),
          .Sel_reg(c_Sel_reg),
          .W(c_W),
          .Sel_outbus(c_Sel_outbus),
          .Sel_DW(c_o_DW),
          .o_direccion_instruccion(o_direccion_instruccion),
          .rst(rst),
          .clk(clk)
        );
    ////////// modulo de alu_micro /////////////
    alu_micro
    Alu (
        .Rx(c_Rx),    
       .Ry(c_Ry),    
       .Sel_op(c_Sel_op),
       .R0(c_R0),    
       .Ban(c_Ban)
     );
    ////////// modulo de Num_mirco /////////////
    Num_micro
        numero (
            .i_instruccion(i_instruccion),
            .Num(c_Num)
            );
    ////////// modulo de selector_micro ////////
    selector_micro
    selector (
        .Sel_DW(c_o_DW),                  
         .R0(c_R0),                     
         .i_dato(i_dato),                  
         .Num(c_Num),                     
         .o_direccion_instruccion(o_direccion_instruccion),
         .Ry(c_Ry),                      
         .DW(c_DW)
         );
    ////////// modulo de ban_reg_micro /////////
    ban_reg_micro
        banco_registros (
            .Sel_reg(c_Sel_reg),
            .W(c_W),
            .DW(c_DW),
            .Rx(c_Rx),
            .Ry(c_Ry),
            .rst(rst),
            .clk(clk)
            ); 
    ////////// modulo de Bus_micro /////////////
    Bus_micro
        Bus(
         .Sel_outbus(c_Sel_outbus),
         .Rx(c_Rx),
         .Ry(c_Ry),
         .Num(c_Num),
         .o_salida_datos(o_salida_datos),
         .o_direccion_datos(o_direccion_datos),
         .RW(RW),
         .rst(rst),
         .clk(clk)
         );
            
endmodule
