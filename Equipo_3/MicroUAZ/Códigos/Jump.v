`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.10.2020 13:11:56
// Design Name: 
// Module Name: Modulo_de_Control
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

module Jump(
           input i_Reset,
 	       input i_Clk,
           input [7:0] RX,
           input [2:0] Flags,
           input [2:0] ControlJump,
           output reg [8:0] o_Addressinstruction_Bus
    ); 
    
    
             always@(posedge i_Clk, posedge i_Reset)
             begin
             if (i_Reset)
                begin
                    o_Addressinstruction_Bus=0;
                end
                else
                    case(ControlJump)
                        3'b000: o_Addressinstruction_Bus=o_Addressinstruction_Bus+9'b000000001;
                        3'b001:
                               o_Addressinstruction_Bus=RX;
                        3'b010:
                            begin
                                if (Flags[0])
                                    o_Addressinstruction_Bus=o_Addressinstruction_Bus+9'b000000001;
                                else
                                    o_Addressinstruction_Bus=RX;
                            end
                        3'b011:
                            begin
                                if (~Flags[0])
                                   o_Addressinstruction_Bus=RX;
                                else
                                    o_Addressinstruction_Bus=o_Addressinstruction_Bus+9'b000000001;
                            end
                        3'b100:
                            begin
                                if (Flags[1])
                                   o_Addressinstruction_Bus=o_Addressinstruction_Bus+9'b000000001;
                                else
                                    o_Addressinstruction_Bus=RX;
                            end
                        3'b101:
                            begin
                                if (~Flags[1])
                                    o_Addressinstruction_Bus=RX;
                                else
                                    o_Addressinstruction_Bus=o_Addressinstruction_Bus+9'b000000001;
                            end
                            
                        3'b110:
                            begin
                                if (Flags[2])
                                o_Addressinstruction_Bus=o_Addressinstruction_Bus+9'b000000001;
                                else
                                o_Addressinstruction_Bus=RX;
                                    
                            end
                        3'b111:
                            begin
                                if (~Flags[2])
                                o_Addressinstruction_Bus=RX;
                                else
                                o_Addressinstruction_Bus=o_Addressinstruction_Bus+9'b000000001;
                                                                
                                                                    
                            end
                    endcase
            end
endmodule
