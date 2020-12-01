`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2020 19:55:02
// Design Name: 
// Module Name: selector
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


module selector(
 input [2:0] c_sel,
    input [7:0] Result,
     input [7:0] Datain_Bus,
     input [7:0] num,
     input [7:0] Adress_Instruction_Bus,
      input [7:0] Ry,
    output reg [7:0] selector
    );
    
   
    
    always@*
       begin
       case (c_sel)
       3'b000 :begin selector<=Result;end
       3'b001 :begin  selector<=Datain_Bus;end
       3'b010 :begin  selector<=num;end
       3'b011 :begin  selector<=Adress_Instruction_Bus;end
       3'b100 :begin  selector<=Ry;end
       default: begin  selector<=0;end       
       endcase
       
 end  
endmodule
