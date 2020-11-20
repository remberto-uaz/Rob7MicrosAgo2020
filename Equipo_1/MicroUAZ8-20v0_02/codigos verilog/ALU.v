`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2020 14:33:15
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


module ALU(
    input [7:0] Rx,
    input [7:0] Ry,
    input [2:0] Sel_OP,
    output [7:0] R0,
    output [2:0] Flags
    );
        
reg [8:0] R;
    
    always@(*)
    begin
        case(Sel_OP)
            0: R <= Rx+Ry;
            1: R <= Rx-Ry;
            2: R <= Rx<<Ry;
            3: R <= Rx>>Ry;
            4: R <= ~Rx;
            5: R <= Rx&Ry;
            6: R <= Rx|Ry;
            7: R <= Rx^Ry;
        endcase
    end
    assign R0 = R[7:0];
    assign Flags[0] = &(~R);
    assign Flags[1] = R[8];
    assign Flags[2] = R[7];
endmodule
