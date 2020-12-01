`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2020 23:07:22
// Design Name: 
// Module Name: salidas
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


module salidas(
 input Rst,
    input Clk,
    input [7:0] Rx,
    input [7:0] Ry,
    input [7:0] num,
    input [1:0] outbus,
    output reg [7:0] DataOut_Bus,
    output reg [7:0] Addres_Data_Bus,
    output reg LE
    );
    
    always @(posedge Clk, posedge Rst) begin
        if(Rst) 
            begin
                DataOut_Bus<=0;
                Addres_Data_Bus<=0;
                LE<=0;
            end
        else
            case (outbus)
                2'b00: 
                    begin
                        DataOut_Bus<=0;
                        Addres_Data_Bus<=0;
                        LE<=0;
                    end
                2'b01:
                    begin
                        DataOut_Bus<=0;
                        Addres_Data_Bus<=Ry;
                        LE<=0;
                    end
                2'b10:
                    begin
                        DataOut_Bus<=num;
                        Addres_Data_Bus<=Rx;
                        LE<=1;
                    end
                2'b11:
                    begin
                        DataOut_Bus<=Ry;
                        Addres_Data_Bus<=Rx;
                        LE<=1;
                    end
            endcase
            end
   
endmodule
