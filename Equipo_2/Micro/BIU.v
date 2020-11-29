`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2020 23:41:19
// Design Name: 
// Module Name: BIU
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


module BIU(

    input [2:0] NUM,
    input [7:0] RX,
    input [7:0] RY,
    input [1:0] SEL_BIU,
    input reset,
    input clk,
    output reg [7:0]o_Address_Data_Bus,
    output reg [7:0]o_DataOut_Bus,
    output reg W_R
    );
    
    always@(posedge clk, posedge reset)

    begin

        if(reset)

        begin
            o_DataOut_Bus <= 0;
            o_Address_Data_Bus <= 0;
            W_R <= 0;

        end
        else
            case(SEL_BIU)
                0: begin    //Para la instrucción LOAD (Dato cargado de [RY])
                    o_DataOut_Bus <= 0;
                    o_Address_Data_Bus <= RY;
                    W_R <= 0;

                end

                1: begin    //Para la instrucción STORE (NUM será almacenado en [RX])
                    o_DataOut_Bus <= {5'b00000,NUM};
                    o_Address_Data_Bus <= RX;
                    W_R <= 1;

                end

                2: begin    // Para la instrucción STORE (Almacenará datos del registro RY en [RX])
                    o_DataOut_Bus <= RY;
                    o_Address_Data_Bus <= RX;
                    W_R <= 1;

                end

                3: begin    //NOP (NO OPERATION)
                    o_DataOut_Bus <= 0;
                    o_Address_Data_Bus <= 0;
                    W_R <= 0;

                end

            endcase
    end
endmodule
