`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2020 15:21:11
// Design Name: 
// Module Name: Decov2
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


module Decov2(
           input [8:0] i_Instruction,
           
           output reg [2:0] ControlJump,
           output reg [2:0] Sel_Mux,
           output reg [2:0] Sel_RY,
           output reg [2:0] Sel_RX,
           output reg Load_Store,
           output reg [3:0] Sel_ALU,
           output reg [1:0] Sel_Salidas
    );

             always@(i_Instruction)
             begin
                case (i_Instruction[8:6])
                   3'b001:  
                   begin
                            Sel_Mux=3'b100; 
                            Sel_RY=3'b000; 
                            Sel_RX=i_Instruction[5:3]; 
                            Load_Store=1'b1; 
                            Sel_ALU=4'b1111;
                            Sel_Salidas=2'b00;
                            ControlJump=3'b000;
                            
                            end
                   3'b010: 
                   begin 
                            Sel_Mux=3'b000;
                            Sel_RY=i_Instruction[5:3];
                            Sel_RX=i_Instruction[2:0];
                            Load_Store=1'b1;
                            Sel_ALU=4'b1111;
                            Sel_Salidas=2'b01;
                            ControlJump=3'b000;
                            
                            end
                   3'b011:  
                   begin
                             Sel_Mux=3'b100;
                             Sel_RY=3'b000;
                             Sel_RX=i_Instruction[5:3];
                             Load_Store=1'b0;
                             Sel_ALU=4'b1111;
                             Sel_Salidas=2'b10;
                             ControlJump=3'b000;
                             end
                   3'b100:
                   begin 
                             Sel_Mux=3'b010;
                             Sel_RY=i_Instruction[2:0];
                             Sel_RX=i_Instruction[5:3];
                             Load_Store=1'b0;
                             Sel_ALU=4'b1111;
                             Sel_Salidas=2'b11;
                             ControlJump=3'b000;
                             end
                   3'b101:
                   begin  
                             Sel_Mux=3'b010;
                             Sel_RY=i_Instruction[5:3];
                             Sel_RX=i_Instruction[2:0];
                             Load_Store=1'b1;
                             Sel_ALU=4'b1111;
                             Sel_Salidas=2'b00;
                             ControlJump=3'b000;
                             end
                   3'b110:
                   begin  
                             Sel_Mux=3'b010;
                             Sel_RY=3'b000;
                             Sel_RX=i_Instruction[5:3];
                             Load_Store=1'b0;
                             Sel_ALU={1'b0,i_Instruction[2:0]};
                             Sel_Salidas=2'b00;
                             ControlJump=3'b000;
                             
                             end
                   3'b111:
                   begin  
                             Sel_Mux=3'b101;
                             Sel_RY=3'b000;
                             Sel_RX=i_Instruction[5:3];
                             Load_Store=1'b0;
                             Sel_ALU=4'b1111;
                             Sel_Salidas=2'b00;
                             ControlJump=i_Instruction[2:0];
                             end
                   default:
                   begin  
                             Sel_Mux=0;
                             Sel_RY=0;
                             Sel_RX=0;
                             Load_Store=0;
                             Sel_ALU=4'b1111;
                             Sel_Salidas=0;
                             ControlJump=0;
                             end
                endcase
            end

endmodule
