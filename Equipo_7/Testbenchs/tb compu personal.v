`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2020 12:47:25
// Design Name: 
// Module Name: tb_compu_personal
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


module tb_compu_personal;
    reg rst;
    reg clk;
    
    proyecto_pc uut (
     .rst(rst),
     .clk(clk)
    );
    
    initial
        begin
            rst = 1;
            clk = 0;
            
            #2 rst = 0;
            #20 $finish;
        end
    always
        #1 clk = !clk;
endmodule
