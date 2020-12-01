`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.11.2020 23:26:41
// Design Name: 
// Module Name: jump
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


module jump(
  input Rst,
  input Clk,
  input [3:0] cond,
  input [7:0] DataOut_Bus,
  input [2:0]band,
  output [7:0] Address_Instruction_Bus
    );
   
    reg [7:0] PC;
    
    always @(posedge Clk, posedge Rst) begin
        if(Rst)
            PC<=0;
        else
            case (cond)
                4'b0000:
                    PC<=PC;
                4'b0001: // etapa de decodificacion de intruccion
                    PC<=PC+1'b1;
                4'b1000:
                    PC<=DataOut_Bus;
                4'b1001:
                    PC<=DataOut_Bus;
                4'b1010:
                    if(band[0])
                        PC<=DataOut_Bus;
                    else
                        PC<=PC+1'b1;
                4'b1011:
                    if(~band[0])
                        PC<=DataOut_Bus;
                    else
                            PC<=PC+1'b1;                        
                4'b1100:
                    if(band[2])
                        PC<=DataOut_Bus;
                    else
                            PC<=PC+1'b1;                        
                4'b1101:
                    if(~band[2])
                        PC<=DataOut_Bus;
                    else
                            PC<=PC+1'b1;                        
                4'b1110:
                    if(band[1])
                        PC<=DataOut_Bus;
                    else
                            PC<=PC+1'b1;
                4'b1111:
                    if(~band[1])
                        PC<=DataOut_Bus;
                    else
                            PC<=PC+1'b1;
                default: PC<=PC+1'b1;
            endcase
    end
    assign Address_Instruction_Bus=PC;
    
endmodule

    
 
