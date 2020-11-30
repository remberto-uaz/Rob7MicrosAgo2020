`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2020 23:10:06
// Design Name: 
// Module Name: Tb_Jump
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

module Tb_Jump(

    );
    reg i_Clk;
    reg i_Reset;
    reg [7:0] RX;
    reg [2:0] Flags;
    reg [2:0] ControlJump;
    wire [8:0] o_Addressinstruction_Bus;
    
    Jump uut (
        .i_Reset(i_Reset),
        .i_Clk(i_Clk),
        .RX(RX),
        .Flags(Flags),
        .ControlJump(ControlJump),
        .o_Addressinstruction_Bus(o_Addressinstruction_Bus)
    );
    
    initial 
    begin
    
            i_Reset=1;
            i_Clk=0;
            RX=0;         
            Flags=3'b000;      
            ControlJump=3'b000;
 
            #2
            i_Reset=0;
            RX=6;         
            Flags=3'b111;      
            ControlJump=3'b001;
            
            #2
            RX=6;         
            Flags=3'b111;      
            ControlJump=3'b010;
            
            #2
            RX=6;         
            Flags=3'b111;      
            ControlJump=3'b011;
            
            #2
            RX=6;         
            Flags=3'b111;      
            ControlJump=3'b100;
            
            #2
            RX=6;         
            Flags=3'b111;      
            ControlJump=3'b101;
           
            #2
            RX=6;        
            Flags=3'b111;     
            ControlJump=3'b110;
           
            #2
            RX=6;         
            Flags=3'b111;      
            ControlJump=3'b111;
            
        end
     always
                    #1 i_Clk = !i_Clk;
    endmodule

