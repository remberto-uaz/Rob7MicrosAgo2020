`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2020 21:20:32
// Design Name: 
// Module Name: C_jump
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


module jump
(
    input [3:0] condJ,
    input [7:0] Rx,
    input [2:0] Ban,
    output [7:0] o_direccion_instruccion,
    input rst,
    input clk
    );
    
    reg [7:0] PC;
    
    always @(posedge clk, posedge rst)
        begin
            if(rst)
                PC <= 0;
            else
              case (condJ)
                4'b0000:
                    PC <= PC;
                4'b0001: // etapa de decodificacion de intruccion
                    PC <= PC+1'b1;
                4'b1000:
                    PC <= Rx;
                4'b1001:
                    PC <= Rx;
                4'b1010:
                    if(Ban[0])
                        PC <= Rx;
                    else
                        PC <= PC+1'b1;
                4'b1011:
                    if(~Ban[0])
                        PC <= Rx;
                    else
                            PC <= PC+1'b1;                        
                4'b1100:
                    if(Ban[2])
                        PC <= Rx;
                    else
                            PC <= PC+1'b1;                        
                4'b1101:
                    if(~Ban[2])
                        PC <= Rx;
                    else
                            PC <= PC+1'b1;                        
                4'b1110:
                    if(Ban[1])
                        PC <= Rx;
                    else
                            PC <= PC+1'b1;
                4'b1111:
                    if(~Ban[1])
                        PC <= Rx;
                    else
                            PC <= PC+1'b1;
                default: PC <= PC+1'b1;
            endcase
    end
    assign o_direccion_instruccion = PC;
    
endmodule
