`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2020 19:40:01
// Design Name: 
// Module Name: tb_micro_mem
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


module tb_Computadora;
    reg Clk;
    reg Rst;
    
    Computadora uut(
        .Clk(Clk),
        .Rst(Rst)
        );
    
    initial 
        begin
        Rst=1;
        Clk=0;
        
        #2 Rst=0;
        #200 $finish;
        end
        
    always
        #1 Clk = !Clk;
endmodule
