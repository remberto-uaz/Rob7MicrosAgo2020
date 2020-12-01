`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Univercidad Autonoma de Zacatecas
// Engineer: Equipo N
// 
// Create Date:
// Design Name: 
// Module Name:
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


module Microprocesador_Equipo_N(
    input [8:0] Instruction,
    input [7:0] Datain_Bus,
    output [7:0] Address_Instruction_Bus,
    output [7:0] DataOut_Bus,
    output [7:0] Addres_Data_Bus,
    output LE,
   input Clk,
    input Rst
    );
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
wire [7:0] W_num;
wire [2:0] W_c_sel;
wire [5:0] W_b_sel;
wire [1:0] W_LE_sel;
wire [7:0] W_selector;
wire [7:0] W_RX;   
wire [7:0] W_RY;  
wire [2:0] W_fun;  
wire [7:0] W_Result; 
wire [2:0] W_band; 
wire [2:0] W_outbus;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////    
control
controlador(
    .ms_m(Instruction),
    .DataOut_Bus(W_RX),
    .band(W_band),
    .Address_Instruction_Bus(Address_Instruction_Bus),
    .outbus(W_outbus),
    .b_sel(W_b_sel),
    .LE_sel(W_LE_sel),
    .c_sel(W_c_sel),
    .Clk(Clk),
    .Rst(Rst),
    .fun( W_fun)
    );
    

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
alu
    operaciones(
    .Rx(W_RX),   
    .Ry (W_RY),  
    .fun(W_fun),  
    .Result(W_Result), 
    .band(W_band)    
    );
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
ms_m
numero(
    .Instruction(Instruction),
    
    .num(W_num)
);
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
b_reg
registros(
    .b_sel(W_b_sel),
    .LE_sel(W_LE_sel),
    .Selector(W_selector),
    .Rx(W_RX),
    .Ry(W_RY),
    .Clk(Clk),
    .Rst(Rst)
);
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
selector
sel(
    .c_sel(W_c_sel),
    .Result(W_Result),
    .num(W_num),
    .Datain_Bus(Datain_Bus),
    .Ry(W_RY),
    .Adress_Instruction_Bus(Address_Instruction_Bus),
    .selector(W_selector)
);
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
salidas
controlsalidas(
    .outbus(W_outbus),
    .Rx(W_RX),
    .Ry(W_RY),
    .num(W_num),
    .DataOut_Bus(DataOut_Bus),
    .Addres_Data_Bus(Addres_Data_Bus),
    .LE(LE),
    .Clk(Clk),
    .Rst(Rst)
);    
endmodule