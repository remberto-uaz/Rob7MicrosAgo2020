`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.11.2020 21:39:40
// Design Name: 
// Module Name: alu_micro
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


module alu_micro
(
    input [7:0] Rx,
    input [7:0] Ry,
    input [2:0] Sel_op,
    output [7:0] R0,
    output [2:0] Ban
    );
    
    reg [8:0] F;
    
        always@*
            begin
                case(Sel_op)
                     0: F <= Rx+Ry;
                     1: F <= Rx-Ry;
                     2: F <= Rx<<Ry;
                     3: F <= Rx>>Ry;
                     4: F <= ~Rx;
                     5: F <= Rx&Ry;
                     6: F <= Rx|Ry;
                     7: F <= Rx^Ry;
                endcase
            end
    assign R0 = F[7:0];
    assign Ban [0] = &(~F);
    assign Ban [1] = F[8];
    assign Ban [2] = F[7];
endmodule
