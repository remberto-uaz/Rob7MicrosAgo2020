`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.11.2020 22:10:21
// Design Name: 
// Module Name: tb_Bus_micro
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


module tb_Bus_micro;
     reg [1:0] Sel_outbus;
     reg [7:0] Rx;
     reg [7:0] Ry;
     reg [7:0] Num;
     wire [7:0] o_salida_datos;
     wire [7:0] o_direccion_datos;
     wire RW;
     reg rst;
     reg clk
     ;
     
     Bus_micro uut 
        (
         .Sel_outbus(Sel_outbus),
         .Rx(Rx),
         .Ry(Ry),
         .Num(Num),
         .o_salida_datos(o_salida_datos),
         .o_direccion_datos(o_direccion_datos),
         .RW(RW),
         .rst(rst),
         .clk(clk)
         );
         
         initial
            begin
                Sel_outbus = 0;
                Rx = 0;         
                Ry = 0;        
                Num = 0;
                rst = 1;
                clk = 0;
                
                #2 rst = 0; Rx = 8'd5; Ry = 8'd6; Num = 8'd2; Sel_outbus = 0;
                #2 Sel_outbus = 2'b01;
                #2 Sel_outbus = 2'b10;
                #2 Sel_outbus = 2'b11;
            end
            
        always
            #1 clk = !clk;       
endmodule
