`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.11.2020 20:52:20
// Design Name: 
// Module Name: Bus_micro
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


module Bus_micro
    (
    input [1:0] Sel_outbus,
    input [7:0] Rx,
    input [7:0] Ry,
    input [7:0] Num,
    output reg [7:0] o_salida_datos,
    output reg [7:0] o_direccion_datos,
    output reg RW,
    input rst,
    input clk
    );
    
    always@(posedge clk, posedge rst)
        begin
            if(rst)
                begin
                    o_salida_datos <= 0;
                    o_direccion_datos <= 0;
                    RW <= 0;
                end
            else
                case(Sel_outbus)
                    2'b00: begin o_salida_datos <= 0; end
                    2'b00: begin o_direccion_datos <= 0; end
                    2'b00: begin RW <=0; 
                    end
                    2'b01: begin o_salida_datos <= 0; end
                    2'b01: begin o_direccion_datos <= Ry; end
                    2'b01: begin RW <=0; 
                    end
                    2'b10: begin o_salida_datos <= Num; end
                    2'b10: begin o_direccion_datos <= Rx; end
                    2'b10: begin RW <=1; 
                    end
                    2'b11: begin o_salida_datos <= Ry; end
                    2'b11: begin o_direccion_datos <= Rx; end
                    2'b11: begin RW <= 1; 
                    end
                    default: 
                        begin
                            o_salida_datos <= 0;
                            o_direccion_datos <= 0;
                            RW <= 0;
                        end       
                endcase
        end 
endmodule
