`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Univrsidad Autonoma De Zacatecas
// Engineer: Alfa
// 
// Create Date: 13.10.2020 15:23:20
// Design Name: 
// Module Name: MicroUAZ8Bits2020V02
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


module MicroUAZ8Bits2020V02(
    input [8:0] i_Instruction,
    input [7:0] i_Dato_Bus,
    output [7:0] o_Addres_Instruction_Bus,
    output [7:0] o_DataOut_Bus,
    output [7:0] o_Addres_Data_Bus,
    output RW,
     output Clk,
     output Rst
    );
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
wire [7:0]W_Num;
wire[2:0] W_Sel_DW;
wire [5:0] W_SelR;
wire [1:0] W_RW;
wire [7:0] W_o_DW;
wire [7:0] W_RX;   
wire [7:0] W_RY;  
wire [2:0] W_sel_OP;  
wire [7:0] W_R0; 
wire [2:0] W_Flags; 
wire [2:0] W_Sel_Op_OutBus;
///////////////////////////////////////////////////////////////////////////////////////////////////////////////    
Control_unit
controlador(
    .i_Instruction( i_Instruction),
    .i_Rx(W_RX),
    .Flags(W_Flags),
    .o_Addres_Instr_Bus(o_Addres_Instruction_Bus),
    .Sel_OP(W_sel_OP),
    .SelR(W_SelR),
    .RW(W_RW),
    .Sel_Op_OutBus(W_Sel_Op_OutBus),
    .Sel_DW(W_Sel_DW)
    .Clk(Clk),
    .Rst(Rst)
    );
    

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
ALU
    operaciones(
    .RX(W_RX),   
    .RY (W_RY),  
    .sel_OP(W_sel_OP),  
    .R0(W_R0), 
    .Flags(W_Flags)    
    );
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Num_Inm
numero(
    .i_Instruction(o_Addres_Instruction_Bus),
    .NUM(W_Num)
);
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Banco_Registros
registros(
    .SelR(W_SelR),
    .RW(W_RW),
    .DW(W_o_DW),
    .Rx(W_RX),
    .Ry(W_RY),
    .Clk(Clk),
    .Rst(Rst)
);
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Sel
selector(
    .Sel_DW(W_Sel_DW),
    .i_R0(W_R0),
    .i_Num(W_Num),
    .i_Dato_Bus(i_Dato_Bus),
    .i_Ry(W_RY),
    .i_Addres_Instr_Bus(o_Addres_Instruction_Bus),
    .o_DW(W_o_DW)
);
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Control_b_o
controlsalida(
    .Sel_Op_OutBus(W_Sel_Op_OutBus),
    .Rx(W_RX),
    .Ry(W_RY),
    .NUM(W_Num),
    .o_DataOut_Bus(o_DataOut_Bus),
    .o_Addres_Data_Bus(o_Addres_Data_Bus),
    .RW(RW),
    .Clk(Clk),
    .Rst(Rst)
);    
endmodule
