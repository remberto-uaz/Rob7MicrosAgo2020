`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UAZ-IRM
// Engineer: Guillermo Cruz Fernandez
// 
// Create Date: 07.09.2020 10:17:37
// Design Name: 
// Module Name: DecoAnillo
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


module DecoAnillo
#(parameter n=2, m=4)
(
    input [(n-1):0] i_Clk,
    input   i_Reset,
    output reg[(m-1):0] o_Anodos,
    output reg[(n-1):0] o_Sel
    );
    always@(*)
        begin
            if(i_Reset)
            begin
                o_Anodos<= 4'b0111; o_Sel<=2'b00; end
                
            else begin 
                case(i_Clk)
                   2'd0: begin o_Anodos<= 4'b0111; o_Sel<=2'b00; end
                    2'd1: begin o_Anodos<= 4'b1011; o_Sel<=2'b01; end
                    2'd2: begin o_Anodos<=4'b1101; o_Sel<=2'b10; end
                    default; 2'd3: begin o_Anodos<=4'b1110; o_Sel<=2'b11; end
                    
                endcase  
             end
        end
        
endmodule
