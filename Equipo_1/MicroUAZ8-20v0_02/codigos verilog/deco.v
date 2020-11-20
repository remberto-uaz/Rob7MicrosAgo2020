`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:UAZ 
// Engineer: TEAM ALFA
// 
// Create Date: 13.10.2020 16:18:51
// Design Name: 
// Module Name: Control_unit
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


module deco(
    input Rst,
    input Clk,
    input [8:0] i_Instruction,
    output reg [3:0] CJ,
    output reg [2:0] Sel_OP,
    output reg [5:0] SelR,
    output reg RW,
    output reg [1:0] Sel_Op_OutBus,
    output reg [2:0] Sel_DW
    );
   
    
    parameter //OpCode 3 bits mas significativos de la intruccion de entrada: i_Intruction[8:6]
    LoadRxNum =3'b000,
    LoadRxARy =3'b001,
    StoreARxNum =3'b010,
    StoreARxRy =3'b011,
    MoveRxRy =3'b100,
    MathRxOp =3'b101,
    JumpRxCond =3'b110,
    NOP =3'b111;
        
    always @(i_Instruction) begin
        case (i_Instruction[8:6])
        LoadRxNum:begin   CJ<=4'b0001; Sel_OP<=0; SelR<={3'b000,i_Instruction[5:3]}; RW<=1; Sel_Op_OutBus<=0; Sel_DW<=3'b010; end
        LoadRxARy:begin   CJ<=4'b0001; Sel_OP<=0; SelR<={i_Instruction[2:0],i_Instruction[5:3]}; RW<=1; Sel_Op_OutBus<=2'b01; Sel_DW<=3'b001; end
        StoreARxNum:begin CJ<=4'b0001; Sel_OP<=0; SelR<={3'b000,i_Instruction[5:3]}; RW<=0; Sel_Op_OutBus<=2'b10; Sel_DW<=3'b111; end
        StoreARxRy:begin  CJ<=4'b0001; Sel_OP<=0; SelR<={i_Instruction[2:0],i_Instruction[5:3]}; RW<=0; Sel_Op_OutBus<=2'b11; Sel_DW<=3'b111; end
        MoveRxRy:begin    CJ<=4'b0001; Sel_OP<=0; SelR<={i_Instruction[2:0],i_Instruction[5:3]}; RW<=1; Sel_Op_OutBus<=0; Sel_DW<=3'b100; end
        MathRxOp:begin    CJ<=4'b0001; Sel_OP<=i_Instruction[2:0]; SelR<={i_Instruction[5:3],3'b000}; RW<=1; Sel_Op_OutBus<=0; Sel_DW<=3'b000; end
        JumpRxCond:begin 
            if(i_Instruction[2:0]==3'b001) // jump sin condicion y guardar pc en R7
                begin  CJ<={1'b1,i_Instruction[2:0]}; Sel_OP<=0; SelR<={i_Instruction[5:3],3'b111}; RW<=1; Sel_Op_OutBus<=0; Sel_DW<=3'b011;  end
            else //las demas condiciones de jump
                begin  CJ<={1'b1,i_Instruction[2:0]}; Sel_OP<=0; SelR<={i_Instruction[5:3],3'b000}; RW<=0; Sel_Op_OutBus<=0; Sel_DW<=3'b111;  end
            end                                   
        NOP:begin      CJ<=4'b0001; Sel_OP<=0; SelR<=0; RW<=0; Sel_Op_OutBus<=0; Sel_DW<=3'b111; end
        default:begin  CJ<=4'b0001; Sel_OP<=0; SelR<=0; RW<=0; Sel_Op_OutBus<=0; Sel_DW<=3'b111; end
        endcase
    end
   
endmodule
