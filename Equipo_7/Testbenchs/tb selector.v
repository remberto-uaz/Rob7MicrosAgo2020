`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.11.2020 21:55:08
// Design Name: 
// Module Name: tb_selector_micro
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


module tb_selector_micro;

    reg [2:0] Sel_DW;
    reg [7:0] R0;
    reg [7:0] i_dato;
    reg [7:0] Num;
    reg [7:0] o_direccion_instruccion;
    reg [7:0] Ry;
    wire [7:0] DW
    ;
    
    selector_micro uut
    (
         .Sel_DW(Sel_DW),                  
         .R0(R0),                     
         .i_dato(i_dato),                  
         .Num(Num),                     
         .o_direccion_instruccion(o_direccion_instruccion),
         .Ry(Ry),                      
         .DW(DW)
    );
    
  initial
    begin
        Sel_DW = 3'd0;
        R0 = 8'd0;
        Num = 8'd2;
        i_dato= 8'd1;
        Ry =8'd4;
        o_direccion_instruccion = 8'd3;


        #2
          Sel_DW = 3'd1;
        #2
          Sel_DW = 3'd2;
        #2
          Sel_DW = 3'd3;
        #2
          Sel_DW = 3'd4;
    end                            
endmodule
