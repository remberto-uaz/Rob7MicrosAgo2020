`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//Agustin Antonio Palafox Molina
//Jose Alfredo Hernadez Dueñas
//Jesus Francisco Villaseñor Correa
//José Roberto Novoa López
//Julio Ángel Pérez Dávila 
// Create Date: 07.09.2020 10:23:49
// Design Name: 
//Deco_Bin_7Seg
// Module Name: Deco_Bin_7Seg
// Project Name: 
//Controlador_display_7segmentos
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


module Deco_Bin_7Seg
 (
    input [3:0] i_deco,
    output reg [6:0] o_segmentos
    );
    
    always@*
        begin
            case(i_deco)
                4'd0: begin  o_segmentos <= 7'b0000001; end
                4'd1: begin  o_segmentos <= 7'b1001111; end
                4'd2: begin  o_segmentos <= 7'b0010010; end
                4'd3: begin  o_segmentos <= 7'b0000110; end
                4'd4: begin  o_segmentos <= 7'b1001100; end
                4'd5: begin  o_segmentos <= 7'b0100100; end
                4'd6: begin  o_segmentos <= 7'b0100000; end
                4'd7: begin  o_segmentos <= 7'b0001111; end
                4'd8: begin  o_segmentos <= 7'b0000000; end
                4'd9: begin  o_segmentos <= 7'b0000100; end
                4'd10: begin o_segmentos <= 7'b0001001; end
                4'd11: begin o_segmentos <= 7'b1100000; end
                4'd12: begin o_segmentos <= 7'b0110001; end
                4'd13: begin o_segmentos <= 7'b1000010; end
                4'd14: begin o_segmentos <= 7'b0110000; end
                default : begin  o_segmentos <= 7'b0111000; end
            endcase
        end
endmodule

