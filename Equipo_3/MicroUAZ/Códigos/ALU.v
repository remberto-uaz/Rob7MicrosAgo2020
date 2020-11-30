`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2020 19:03:21
// Design Name: 
// Module Name: ALU
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

module ALU #(parameter N=8) (
    input [7:0] RY,
    input [7:0] RX,
    input wire [3:0] Sel_ALU,
    output  [7:0] R0,
    output  [2:0] Flags
);

wire[N-1:0]salidasuma;
wire[N-1:0]salidaresta;
wire[N-1:0]salidaDizquierda;
wire[N-1:0]salidaDderecha;
wire[N-1:0]salidanot;
wire[N-1:0]salidaand;
wire[N-1:0]salidaor;
wire[N-1:0]salidaxor;
wire[N-1:0]salidanada;
wire[3:0] Suma_o_Resta;
wire c_out_suma;
wire c_out_resta;


SumadorNbits #(.N(N)) Op0(
    .a(RX),
    .b(RY),
    .c_in(1'b0),
    .sum(salidasuma),
    .c_out(c_out_suma)
);

Op_Resta #(.N(N))Op1(
    .A(RY),
    .B(RX),
    .R(salidaresta)
);

Desplazamiento_Izquierda#(.N(N)) Op2(
    .A(RX),
    .Y(salidaDizquierda)
);

Desplazamiento_Derecha#(.N(N)) Op3(
    .A(RY),
    .Y(salidaDderecha)
);


Op_Not#(.N(N)) Op4(
    .A(RX),
    .Y(salidanot)
);

Op_And#(.N(N)) Op5(
    .A(RX),
    .B(RY),
    .Y(salidaand)
);

Op_Or#(.N(N)) Op6(
    .A(RX),
    .B(RY),
    .Y(salidaor)
);
Nada#(.N(N)) Opeeeee(
    .A(RX),
    .Y(salidanada)
);
Op_Xor#(.N(N)) Op7(
    .A(RX),
    .B(RY),
    .Y(salidaxor)
);

Mux_ALU #(.N(N)) MuxALU(
    .salidasuma(salidasuma),           
    .salidaresta(salidaresta),      
    .salidaDizquierda(salidaDizquierda), 
    .salidaDderecha(salidaDderecha),  
    .salidanot(salidanot),        
    .salidaand(salidaand),      
    .salidaor (salidaor),         
    .salidaxor(salidaxor),       
    .Operador(Sel_ALU),
    .SalidaOp(R0),
    .OperadorSalida(Suma_o_Resta),  
    .salidanada(salidanada)  
);

Flag_Indicator #(.N(N)) Banderas(
    .A(RY),
    .B(RX),
    .SalidaOp(R0),
    .c_out_suma(c_out_suma),   
    .Suma_o_Resta(Suma_o_Resta), 
    .Flags (Flags)    
);

endmodule