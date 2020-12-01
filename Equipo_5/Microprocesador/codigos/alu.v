`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2020 16:31:36
// Design Name: 
// Module Name: alu
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


module alu(
    input [2:0] fun,
    input [7:0] Ry,
    input [7:0] Rx,
    output [7:0] Result,
    output [2:0] band
    );
    reg [8:0] resultado;
    always@*
    begin
    case(fun)
    3'b000: begin resultado<=Ry+Rx; end
    3'b001: begin resultado<=Ry-Rx; end
    3'b010: begin resultado<=Ry<<Rx; end
    3'b011: begin resultado<=Ry>>Rx; end
    3'b100: begin resultado<=~Rx; end
    3'b101: begin resultado<=Ry&Rx; end
    3'b110: begin resultado<=Ry|Rx; end
    3'b111: begin resultado<=Ry^Rx; end
    
    endcase
    end
    assign Result=resultado[7:0];
    
    assign band[0]=&(~resultado);
    assign band[1]=resultado[7];
    assign band[2]=resultado[8];
endmodule
