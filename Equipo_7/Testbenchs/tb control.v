`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2020 21:48:23
// Design Name: 
// Module Name: tb_Control_micro
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


module tb_Contro_micro;
    reg [8:0] i_instruccion;
    reg [7:0] Rx;
    reg [2:0] Ban;
    wire [2:0] Sel_op;
    wire [5:0] Sel_reg;
    wire W;
    wire [1:0] Sel_outbus;
    wire [2:0] Sel_DW;
    wire [7:0] o_direccion_instruccion;
    reg rst;
    reg clk;
    
    Control_micro uut
    ( 
    .i_instruccion(i_instruccion),
    .Rx(Rx),
    .Ban(Ban),
    .Sel_op(Sel_op),
    .Sel_reg(Sel_reg),
    .W(W),
    .Sel_outbus(Sel_outbus),
    .Sel_DW(Sel_DW),
    .o_direccion_instruccion(o_direccion_instruccion),
    .rst(rst),
    .clk(clk)
    );
    
    initial
        begin
        i_instruccion=0;
        Rx=0;
        Ban=0;
        rst=1;
        clk=0;
        
        #1 rst = 0; i_instruccion = 9'b000_001_100; //load Rx Num
        #2 i_instruccion = 9'b001_010_001; // load Rx [Ry]
        #2 i_instruccion = 9'b010_011_010; // store [Rx] Num
        #2 i_instruccion = 9'b011_111_110; // store [Rx] Ry
        #2 i_instruccion = 9'b100_001_010; // move Rx Ry
        #2 i_instruccion = 9'b101_011_001; // Math Rx OP
        #2 i_instruccion = 9'b110_100_001; // Jump [Rx] Cond
        #2 i_instruccion = 9'b111_100_001; // Nop
         
        end
    
    always
        #1 clk = !clk;
    
endmodule
