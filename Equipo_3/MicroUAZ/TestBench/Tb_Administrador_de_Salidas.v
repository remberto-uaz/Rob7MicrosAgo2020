`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2020 16:43:13
// Design Name: 
// Module Name: Tb_Administrador_de_Salidas
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

module Tb_Administrador_de_Salidas();
    reg [2:0] RY;
    reg [7:0] RX;
    reg [2:0] Num; 
    reg [1:0] Sel_Salidas;
    wire [7:0] o_Dataout;
    wire [7:0] o_Addressdata;
    wire ReadWrite;
    
    Administrador_de_salidas uut (
        .RY(RY),
        .RX(RX),
        .Num(Num),
        .Sel_Salidas(Sel_Salidas),
        .o_Dataout(o_Dataout),
        .o_Addressdata(o_Addressdata),
        .ReadWrite(ReadWrite)
    );
    initial 
        begin 
        
            RY=0;// Inicialización de las entradas
            RX=0;
            Num=0;
            Sel_Salidas=0;
 
            #2
            RY= 4'd4; //Se asigna valor a las entradas
            RX= 4'd5;
            Num= 4'd6;
            
            #2 Sel_Salidas = 0; // Se actualiza el selector cada 2 tiempos
            #2 Sel_Salidas = 1;
            #2 Sel_Salidas = 2;
            #2 Sel_Salidas = 3;
            
            #2 Sel_Salidas = 0;
            #2 Sel_Salidas = 1;
            #2 Sel_Salidas = 2;
            #2 Sel_Salidas = 3;
            #2 Sel_Salidas = 0;
            
            #2 Sel_Salidas = 1;
            #2 Sel_Salidas = 2;
            #2 Sel_Salidas = 3;
        
        end 
   
endmodule
