`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// José Alfredo Hernadez Dueñas
//Jesús Francisco Villaseñor Correa
// Create Date: 18.11.2020 19:43:18
// Design Name: 
// Module Name: tb_Micropromemorias_Equipo_N
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


module tb_Micropromemorias_Equipo_N;
reg Clk;
    reg Rst;
    
    Micropromemorias_Equipo_N uut(
        .Clk(Clk),
        .Rst(Rst)
        );
    
    initial 
        begin
        Rst=1;
        Clk=0;
        
        #2 Rst=0;
        
        end
        
    always
        #1 Clk = !Clk;
endmodule


