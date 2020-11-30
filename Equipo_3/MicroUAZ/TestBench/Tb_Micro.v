`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2020 11:55:47
// Design Name: 
// Module Name: Tb_Micro
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


module Tb_Micro;
    reg [7:0] i_DataInbus;
    reg [8:0] i_Instruction;
    reg  i_Clk;
    reg  i_Reset;
    wire [8:0] o_Addressinstruction_Bus;
    wire [7:0] o_Dataout_Bus;
    wire [7:0] o_Addressdata_Bus;
    wire ReadWrite;
    
    MicroUAZ uut(
        .i_DataInbus(i_DataInbus),              
        .i_Instruction(i_Instruction),            
        .i_Clk(i_Clk),                         
        .i_Reset(i_Reset),                       
        .o_Addressinstruction_Bus(o_Addressinstruction_Bus),
        .o_Dataout_Bus(o_Dataout_Bus),           
        .o_Addressdata_Bus(o_Addressdata_Bus),       
        .ReadWrite(ReadWrite)
    );
    
    initial
        begin
            i_DataInbus=0;
            i_Instruction=0;          
            i_Reset=1;
            i_Clk=0;
            #2 i_Reset=0;i_DataInbus=8'b00000011; i_Instruction=9'b000000000;
            #2 i_DataInbus=8'b10000011; i_Instruction=9'b001000111;
            #2 i_DataInbus=8'b01000011; i_Instruction=9'b010001001;
            #2 i_DataInbus=8'b00001111; i_Instruction=9'b011010010;
            #2 i_DataInbus=8'b00000010; i_Instruction=9'b100011011;
            #2 i_DataInbus=8'b00100001; i_Instruction=9'b101000000;
            #2 i_DataInbus=8'b00010011; i_Instruction=9'b110011001;
            #2 i_DataInbus=8'b00010011; i_Instruction=9'b111010110;
            #2 i_DataInbus=8'b00000111; i_Instruction=9'b000000000;
            
                   
        end
            initial
    begin
        i_Clk<=0;
        i_Reset<=1;
        #1 i_Reset<=0;
        #1 i_Clk<=1;
    end
    always@(*)
    begin
        #1 i_Clk <= ~i_Clk; //clk invierte su valor
    end
initial
    begin
        i_Clk<=0;
        i_Reset<=1;
        #1 i_Reset<=0;
        #1 i_Clk<=1;
    end
    always@(*)
    begin
        #1 i_Clk <= ~i_Clk; //clk invierte su valor
    end                              
endmodule   
