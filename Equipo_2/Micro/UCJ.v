`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:39:13 10/20/2020 
// Design Name: 
// Module Name:    UCJ 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module UCJ(
    input [3:0]cond,
    input clk,
    input rst,
    input [7:0]Rx,
    input [2:0]F,
	 output reg [7:0] o_Address_Instruction_Bus
    );
    always@(posedge clk)
	 begin
	  if(rst)
			o_Address_Instruction_Bus <=0;
        else
            case(cond)
                0: o_Address_Instruction_Bus <= Rx;
                1: o_Address_Instruction_Bus <= Rx;
                
                2:
                begin 
                    if(F[0])
                    o_Address_Instruction_Bus <= Rx;
                        else
                     o_Address_Instruction_Bus = o_Address_Instruction_Bus+1;
                    end
                3:
                begin 
                    if(~F[0])
                    o_Address_Instruction_Bus <= Rx;
                        else
                     o_Address_Instruction_Bus = o_Address_Instruction_Bus+1;
                    end
                4:
                begin 
                    if(F[1])
                    o_Address_Instruction_Bus <= Rx;
                        else
                     o_Address_Instruction_Bus = o_Address_Instruction_Bus+1;
                       end	
                5:
                begin 
                    if(~F[1])
                    o_Address_Instruction_Bus <= Rx;
                        else
                     o_Address_Instruction_Bus = o_Address_Instruction_Bus+1;
                       end	
                6:
                begin 
                    if(F[2])
                    o_Address_Instruction_Bus <= Rx;
                        else
                     o_Address_Instruction_Bus = o_Address_Instruction_Bus+1;
                       end				
                7:
                begin 
                    if(~F[2])
                    o_Address_Instruction_Bus <= Rx;
                        else
                     o_Address_Instruction_Bus = o_Address_Instruction_Bus+1;
                       end				
                default: o_Address_Instruction_Bus<=o_Address_Instruction_Bus+1;
                endcase
        end				 
endmodule
