`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.11.2020 20:01:10
// Design Name: 
// Module Name: Num_micro
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


module Num_micro
#(parameter DW = 8)
    (
    input [(DW -1) : 0] i_instruccion,
    output reg [(DW -1) : 0] Num 
    );
    
    reg [(DW -1) : 0] NM;
        
        always@*
            begin
            NM = 8'b0;
                Num <= {NM[7:3], i_instruccion[2:0]};
            end
endmodule
