`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2020 19:03:21
// Design Name: 
// Module Name: Administrador_de_salidas
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


module Administrador_de_salidas(
    input [2:0] RY,
    input [7:0] RX,
    input [2:0] Num,
    input [1:0] Sel_Salidas,
    output reg [7:0] o_Dataout,
    output reg [7:0] o_Addressdata,
    output reg ReadWrite
);

always@*
    begin
        case(Sel_Salidas)
            2'b00:
                begin
                    o_Dataout <= 0;
                    o_Addressdata <= 0;
                    ReadWrite <= 0;
                end
             2'b01:
                begin
                    o_Dataout <= 0;
                    o_Addressdata <= {5'b00000,RY};
                    ReadWrite <= 0;
                end
            2'b10:
                begin
                    o_Dataout <= {5'b00000,Num};
                    o_Addressdata <= RX;
                    ReadWrite <= 1;
                end
            2'b11:
                
                begin
                    o_Dataout <= RX;
                    o_Addressdata <= RY;
                    ReadWrite <= 1;
                end
            default
                begin
                    o_Dataout <= 0;
                    o_Addressdata <= 0;
                    ReadWrite <= 0;
                end
        endcase
    end

endmodule

