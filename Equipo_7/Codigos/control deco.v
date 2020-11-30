`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2020 21:18:57
// Design Name: 
// Module Name: C_deco
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


module deco(
    input [8:0] i_instruccion,
    output reg [3:0] condJ,
    output reg [2:0] Sel_op,
    output reg [5:0] Sel_reg,
    output reg W,
    output reg [1:0] Sel_outbus,
    output reg [2:0] Sel_DW,
    input rst,
    input clk
    );
   
    
    parameter 
    LoadRxNum =3'b000,
    LoadRxARy =3'b001,
    StoreARxNum =3'b010,
    StoreARxRy =3'b011,
    MoveRxRy =3'b100,
    MathRxOp =3'b101,
    JumpRxCond =3'b110,
    NOP =3'b111;
        
    always @(i_instruccion) 
        begin
        case (i_instruccion[8:6])
        LoadRxNum: begin   condJ <= 4'b0001; Sel_op <= 0; Sel_reg <= {3'b000,i_instruccion[5:3]}; W <= 1; Sel_outbus <= 0; Sel_DW <= 3'b010; end
        LoadRxARy: begin   condJ <= 4'b0001; Sel_op <= 0; Sel_reg <= {i_instruccion[2:0],i_instruccion[5:3]}; W <= 1; Sel_outbus <= 2'b01; Sel_DW<=3'b001; end
        StoreARxNum: begin condJ <= 4'b0001; Sel_op <= 0; Sel_reg <= {3'b000,i_instruccion[5:3]}; W <= 0; Sel_outbus <= 2'b10; Sel_DW <= 3'b111; end
        StoreARxRy: begin  condJ <= 4'b0001; Sel_op <= 0; Sel_reg <= {i_instruccion[2:0],i_instruccion[5:3]}; W <= 0; Sel_outbus <= 2'b11; Sel_DW <= 3'b111; end
        MoveRxRy: begin    condJ <= 4'b0001; Sel_op <= 0; Sel_reg <= {i_instruccion[2:0],i_instruccion[5:3]}; W <= 1; Sel_outbus <= 0; Sel_DW <= 3'b100; end
        MathRxOp: begin    condJ <= 4'b0001; Sel_op <= i_instruccion[2:0]; Sel_reg <= {i_instruccion[5:3],3'b000}; W <= 1; Sel_outbus <= 0; Sel_DW <= 3'b000; end
        JumpRxCond: begin 
            if(i_instruccion[2:0]==3'b001) // jump sin condicion y guardar pc en R7
                begin  condJ <= {1'b1,i_instruccion[2:0]}; Sel_op <= 0; Sel_reg <= {i_instruccion[5:3],3'b111}; W <= 1; Sel_outbus <= 0; Sel_DW <= 3'b011;  end
            else //las demas condiciones de jump
                begin  condJ <= {1'b1,i_instruccion[2:0]}; Sel_op <= 0; Sel_reg <= {i_instruccion[5:3],3'b000}; W <= 0; Sel_outbus <= 0; Sel_DW <= 3'b111;  end
            end                                   
        NOP:begin      condJ <= 4'b0001; Sel_op <= 0; Sel_reg <= 0; W <= 0; Sel_outbus <= 0; Sel_DW <= 3'b111; end
        default:begin  condJ <= 4'b0001; Sel_op <= 0; Sel_reg <= 0; W <= 0; Sel_outbus <= 0; Sel_DW <= 3'b111; end
        endcase
    end
   
endmodule
