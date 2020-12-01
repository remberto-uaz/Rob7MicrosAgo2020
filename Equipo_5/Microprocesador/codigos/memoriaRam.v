`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// José Alfredo Hernadez Dueñas
//Jesús Francisco Villaseñor Correa
// Create Date: 18.11.2020 09:50:29
// Design Name: 
// Module Name: memoriaRam
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


module memoriaRam
#(parameter Ld=256, m=8)(
    input LE,
    input [m-1:0] address_data,
    input [m-1:0] i_data,
    output reg [m-1:0] o_data
    );
    
      reg [(m-1):0]mem[0:(Ld-1)];
      
      initial
          begin
              $readmemh("RAM.mem",mem);
          end    
      
      always @(address_data,i_data,LE) begin
          if(LE) 
              begin
                  mem[address_data]<=i_data;
                  o_data<=mem[address_data];
              end
          else
              o_data<=mem[address_data];
      end
endmodule

