`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// José Alfredo Hernadez Dueñas
//Jesús Francisco Villaseñor Correa
// Create Date: 18.11.2020 09:52:11
// Design Name: 
// Module Name: memoriaROM
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


module memoriaROM
#(parameter Ld=256, m=8, n=9)(
    input [m-1:0] address,
    output reg [n-1:0] d_out
    );
     reg [(n-1):0]mem[0:(Ld-1)];
       
       initial
           begin
               $readmemb("ROM.mem",mem);
           end    
       
       always @(address) begin
           d_out<=mem[address];
       end
endmodule
