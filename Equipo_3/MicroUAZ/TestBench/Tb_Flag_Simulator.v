`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2020 20:14:37
// Design Name: 
// Module Name: Tb_Flag_Simulator
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

module Tb_Flag_Simulator #(parameter N=8)( );
        reg [N-1:0] A; //RY
        reg [N-1:0] B; //RX
        reg c_out_suma;
        reg Suma_o_Resta;
        wire[2:0] Flags;
        
    Flag_Indicator uut (
            .A(A),
            .B(B),
            .c_out_suma(c_out_suma),
            .Suma_o_Resta(Suma_o_Resta),
            .Flags(Flags)
        );
        
            initial 
            begin 
            //Inicialización de las entradas
                A=0; // A
                B=0; // B
                c_out_suma=1; 
                Suma_o_Resta=0;
     
                #2
                A= 4'd4; 
                B= 4'd4;
                Suma_o_Resta=3'b001;
                #2
                A= 4'd4; 
                B= 4'd5;
                Suma_o_Resta=3'b001;
                #2
                A= 4'd3; 
                B= 4'd3;
                Suma_o_Resta=3'b000;
            
            end 
        
   
endmodule
