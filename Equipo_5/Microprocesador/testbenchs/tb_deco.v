`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// José Alfredo Hernadez Dueñas
//Jesús Francisco Villaseñor Correa
// Create Date: 10.11.2020 22:50:51
// Design Name: 
// Module Name: tb_deco
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


module tb_deco();
reg [8:0] ms_m;
    wire[2:0] fun;
    wire[5:0] b_sel;
    wire[3:0] cond;
    wire LE_sel;
    wire[1:0] outbus;
    wire[2:0] c_sel;
    
    deco uut(
    .ms_m(ms_m),
    .fun(fun),
    .b_sel(b_sel),
    .cond(cond),
    .LE_sel(LE_sel),
    .outbus(outbus),
    .c_sel(c_sel)
    );
    
    initial 
    begin
    ms_m=0;
    
    #2ms_m=9'b000_010_010;
    #2ms_m=9'b001_110_001;
    #2ms_m=9'b010_011_011;
    #2ms_m=9'b011_010_110;
    #2ms_m=9'b100_000_011;
    #2ms_m=9'b101_010_000;
    #2ms_m=9'b110_000_000;
    #2ms_m=9'b111_100_100;
    end
endmodule
