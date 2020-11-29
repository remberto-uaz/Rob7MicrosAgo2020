`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2020 00:21:12
// Design Name: 
// Module Name: Data_Sel_tb
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


module Data_Sel_tb;

    reg [7:0] DataIn;
    reg [7:0] Direccion;
    reg [2:0] NUM;
    reg [7:0] RY;
    reg [7:0] Resultado;
    reg [2:0] SEL;
    wire [7:0] Dato_Registro
  ;
     Data_Sel uut(
    .DataIn(DataIn),
    .Direccion(Direccion),
    .NUM(NUM),
    .RY(RY),
    .Resultado(Resultado),
    .SEL(SEL),
    .Dato_Registro(Dato_Registro)
    );


    initial
    begin
    DataIn = 8'd0;
    Direccion = 8'd1;
    NUM = 3'd2;
    RY = 8'd3;
    Resultado = 8'd4;
    SEL = 3'd3;
  
    
#2
   SEL = 3'd1;
#2
   SEL = 3'd2;
#2
   SEL = 3'd3;
#2
   SEL = 3'd4;


    end
    endmodule

