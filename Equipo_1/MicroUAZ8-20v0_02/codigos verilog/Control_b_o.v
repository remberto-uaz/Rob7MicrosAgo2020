`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:uaz 
// Engineer:team alfa
// 
// Create Date: 09.10.2020 19:41:26
// Design Name: 
// Module Name: Control_b_o
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


module Control_b_o(
    input Rst,
    input Clk,
    input [7:0] Rx,
    input [7:0] Ry,
    input [7:0] NUM,
    input [1:0] Sel_Op_OutBus,
    output reg [7:0] o_DataOut_Bus,
    output reg [7:0] o_Addres_Data_Bus,
    output reg RW
    );
    
    always @(posedge Clk, posedge Rst) begin
        if(Rst) 
            begin
                o_DataOut_Bus<=0;
                o_Addres_Data_Bus<=0;
                RW<=0;
            end
        else
            case (Sel_Op_OutBus)
                2'b00: 
                    begin
                        o_DataOut_Bus<=0;
                        o_Addres_Data_Bus<=0;
                        RW<=0;
                    end
                2'b01:
                    begin
                        o_DataOut_Bus<=0;
                        o_Addres_Data_Bus<=Ry;
                        RW<=0;
                    end
                2'b10:
                    begin
                        o_DataOut_Bus<=NUM;
                        o_Addres_Data_Bus<=Rx;
                        RW<=1;
                    end
                2'b11:
                    begin
                        o_DataOut_Bus<=Ry;
                        o_Addres_Data_Bus<=Rx;
                        RW<=1;
                    end
                default: 
                    begin
                        o_DataOut_Bus<=0;
                        o_Addres_Data_Bus<=0;
                        RW<=0;
                    end                
            endcase
            end
            
// nesecario para load RX [RY] con memorias          
    always @(Rx,Ry,NUM,Sel_Op_OutBus) begin
         if (Sel_Op_OutBus==2'b01)
             begin
                 o_DataOut_Bus<=0;
                o_Addres_Data_Bus<=Ry;
             end
         end
endmodule
