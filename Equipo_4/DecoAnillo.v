`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.09.2020 09:36:26
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
always @(posedge i_Clk or negedge i_Reset)   //Siempre que ocurra el flanco positivo de i_Clk o i_Reset.
   if(~i_Reset)Clk<=0;    //Si se activa Clk el siguiente valor de sel sera 0.
   else Clk<=Clk+1;  //De lo contrario el siguiente valor de o_Sel sera sel+1.
 
//Multiplexor Quadruple de 4 entradas 1 salidas.
assign in=x[Clk*4+:4]; //Si sel=2 entonces in=x[2*4+3+:4] o in=x[11:8].
                           //Por lo tanto se seleccionan las 4 entradas correspondientes al display a encender.
   

//Decodificador de 2 a 4. Selecciona el bit de salida correspondiente.
   assign o_Anodos=(Clk==0)?4'b1000:   //Si sel es igual a 0 an sera igual a 4'b1000
      (Clk==1)?4'b0100:   //Si sel es igual a 1 an sera igual a 4'b0100
      (Clk==2)?4'b0010:   //Si sel es igual a 2 an sera igual a 4'b0010
                   4'b0001;   //Si sel es igual a 3 an sera igual a 4'b0001
assign o_Sel=(Clk==0)?2'b00:
           (Clk==1)?2'b01:
           (Clk==2)?2'b10:
                    2'b11;
           
 endmodule
