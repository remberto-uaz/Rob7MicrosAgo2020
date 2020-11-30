`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.11.2020 22:09:47
// Design Name: 
// Module Name: tb_Num_micro
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


module tb_Num_micro;
    reg [7:0] i_instruccion;
    wire [7:0] Num
    ;
    
    Num_micro uut
    (
        .i_instruccion(i_instruccion),
        .Num(Num)
        );
        
        initial
            begin
                i_instruccion = 0;
                #2i_instruccion = 8'b00000001;
                #2i_instruccion = 8'b00001011;
                #2i_instruccion = 8'b11111111;
            end
endmodule
