`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UAZ
// Engineer: TEAM ALFA
// 
// Create Date: 13.10.2020 16:25:14
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
    input [3:0] CJ,
    input [7:0] i_Rx,
    input [2:0] Flags,
    output [7:0] o_Addres_Instr_Bus
    );
    
    reg [7:0] PC;
    
    always @(posedge Clk, posedge Rst) begin
        if(Rst)
            PC<=0;
        else
            case (CJ)
                4'b0000:
                    PC<=PC;
                4'b0001: // etapa de decodificacion de intruccion
                    PC<=PC+1'b1;
                4'b1000:
                    PC<=i_Rx;
                4'b1001:
                    PC<=i_Rx;
                4'b1010:
                    if(Flags[0])
                        PC<=i_Rx;
                    else
                        PC<=PC+1'b1;
                4'b1011:
                    if(~Flags[0])
                        PC<=i_Rx;
                    else
                            PC<=PC+1'b1;                        
                4'b1100:
                    if(Flags[2])
                        PC<=i_Rx;
                    else
                            PC<=PC+1'b1;                        
                4'b1101:
                    if(~Flags[2])
                        PC<=i_Rx;
                    else
                            PC<=PC+1'b1;                        
                4'b1110:
                    if(Flags[1])
                        PC<=i_Rx;
                    else
                            PC<=PC+1'b1;
                4'b1111:
                    if(~Flags[1])
                        PC<=i_Rx;
                    else
                            PC<=PC+1'b1;
                default: PC<=PC+1'b1;
            endcase
    end
    assign o_Addres_Instr_Bus=PC;
    
endmodule
