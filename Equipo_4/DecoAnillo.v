`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Universidad Autonoma de Zacatecas
// Engineer: Sergio A. Bernal Adame
// 
// Create Date: 07.09.2020 10:17:12
// Design Name: 
// Module Name: DecoAnillo
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
module DecoAnillo(
   input i_Reset,
   input i_Clk,
   output [1:0] o_Sel,
   output [3:0] o_Anodos      //Declaramos el bus de salida an, para controlar los andos.
   );

wire [3:0]in;  //Declaramos el bus auxiliar tipo wire de 4 bits in.
wire [15:0]x;
reg [1:0]Clk;  //Declaramos el bus auxiliar tipo reg de 2 bits sel.

//Contador de corrida libre de 2 bits.
always @(posedge i_Clk or posedge i_Reset)   //Siempre que ocurra el flanco positivo de i_Clk o i_Reset.
   if(i_Reset)Clk<=0;    //Si se activa Clk el siguiente valor de sel sera 0.
   else Clk<=Clk+1;  //De lo contrario el siguiente valor de o_Sel sera sel+1.

//Multiplexor Quadruple de 4 entradas 1 salidas.
assign in=x[Clk*4+:4]; //Si sel=2 entonces in=x[2*4+3+:4] o in=x[11:8].
                           //Por lo tanto se seleccionan las 4 entradas correspondientes al display a encender.
   

//Decodificador de 2 a 4. Selecciona el bit de salida correspondiente.
assign o_Anodos=(Clk==0)?4'b0111:   //Si sel es igual a 0 an sera igual a 4'b0111
          (Clk==1)?4'b1011:   //Si sel es igual a 1 an sera igual a 4'b1011
          (Clk==2)?4'b1101:   //Si sel es igual a 2 an sera igual a 4'b1101
                   4'b1110;   //Si sel es igual a 3 an sera igual a 4'b1110
assign o_Sel=(Clk==0)?2'b00:
           (Clk==1)?2'b01:
           (Clk==2)?2'b10:
                    2'b11;
           
           
//module DecoAnillo
//#(parameter dataW = 2, m=4 )
//(
//    input  [1:0] i_Clk,
//    input  i_Reset,
//    output reg [m-1:0] o_Anodos,
//    output reg [(dataW -1) : 0] o_Sel
//    );
//   always@(i_Clk)
//        begin
//            case(i_Clk)
//                0: begin o_Anodos<= 4'b0001; o_Sel<=2'b00; end
//                1: begin o_Anodos<= 4'b0010; o_Sel<=2'b01; end
//                2: begin o_Anodos<=4'b0100; o_Sel<=2'b10; end
//                default: begin o_Anodos<=4'b1000; o_Sel<=2'b11; end

//            endcase

//        end
//    always@(*)
//        begin
//        if (i_Clk) 
//            case(i_Clk)
//                4'd0: begin o_Anodos <= 4'b0111; end
//                4'd1: begin o_Anodos <= 4'b1011; end
//                4'd2: begin o_Anodos <= 4'b1101; end
//                default: begin o_Anodos <= 4'b1110; end
//        endcase
//            case(i_Clk)
//                2'd0: begin o_Sel <= 2'b00; end
//                2'd1: begin o_Sel <= 2'b01; end
//                2'd2: begin o_Sel <= 2'b10; end
//                default: begin o_Sel <=2'b11;end
//        endcase
//      end
 endmodule
