`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UAZ
// Engineer: TEAM ALFA 
// 
// Create Date: 13.10.2020 16:18:51
// Design Name: 
// Module Name: Control_unit
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


module Control_unit(
    input Rst,
    input Clk,
    input [8:0] i_Instruction,
    input [7:0] i_Rx,
    input [2:0] Flags,
    output [2:0] Sel_OP,
    output [5:0] SelR,
    output RW,
    output [1:0] Sel_Op_OutBus,
    output [2:0] Sel_DW,
    output [7:0] o_Addres_Instr_Bus
    );
    
    wire [3:0] w_CJ;//señal de control para brincos, une el deco y Jump 
    reg [2:0] RFlags;//registro almacena las banderas cuando se hace intruccion MATH
    
    deco c_deco(
        .Rst(Rst),
        .Clk(Clk),
        .i_Instruction(i_Instruction),
        .CJ(w_CJ),
        .Sel_OP(Sel_OP),
        .SelR(SelR),
        .RW(RW),
        .Sel_Op_OutBus(Sel_Op_OutBus),
        .Sel_DW(Sel_DW)
        );
        
    jump c_jump(
        .Rst(Rst),
        .Clk(Clk),
        .CJ(w_CJ),
        .i_Rx(i_Rx),
        .Flags(RFlags),
        .o_Addres_Instr_Bus(o_Addres_Instr_Bus)
        );
          
    always @(posedge Clk, posedge Rst) begin // bloque para registro de banderas
        if(Rst) 
            begin
                RFlags<=0;
            end
        else
            if (i_Instruction[8:6]==3'b101)
                RFlags<=Flags;
    end
    
endmodule
