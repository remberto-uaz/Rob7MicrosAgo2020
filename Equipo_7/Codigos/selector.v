`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.11.2020 21:26:41
// Design Name: 
// Module Name: selector_micro
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


module selector_micro
(
    input [2:0] Sel_DW,
    input [7:0] R0,
    input [7:0] i_dato,
    input [7:0] Num,
    input [7:0] o_direccion_instruccion,
    input [7:0] Ry,
    output reg [7:0] DW
    );
    
    always@*
        begin
            case(Sel_DW)
                3'b000 : begin DW <= R0; end
                3'b001 : begin DW <= i_dato; end
                3'b010 : begin DW <= Num; end
                3'b011 : begin DW <= o_direccion_instruccion; end
                3'b011 : begin DW <= Ry; end
                default : begin DW <= 0; end
            endcase
        end
endmodule
