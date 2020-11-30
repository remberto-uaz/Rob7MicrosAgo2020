`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2020 16:30:27
// Design Name: 
// Module Name: Flag_Indicator
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


module Flag_Indicator#(parameter N=8)(
    input [N-1:0] A, //RY
    input [N-1:0] B, //RX
    input [N-1:0] SalidaOp,
    input c_out_suma,
    input [3:0] Suma_o_Resta,
    output [2:0] Flags
    ////////////////////
);
reg FlagZ=1'b0;
reg FlagC=1'b0;
reg FlagN=1'b0;

always@(*)
begin
    case(Suma_o_Resta)
    4'b0000:
    begin
        if(c_out_suma)begin FlagC <= 1'b1;
                            FlagN<= 1'b0;
                            FlagZ<= 1'b0;
                       end
                    else    FlagC<= 1'b0; 
                            FlagZ<= 1'b0;
                            FlagN<= 1'b0;
    end
    
    4'b0001:
    begin
        if(B==A) FlagZ<= 1'b1;
        else FlagZ <= 1'b0; 
             FlagC<= 1'b0;
        if(B>A) FlagN<= 1'b1;
        else FlagN<= 1'b0;
             FlagC<= 1'b0;
        
    end 
    4'b0010:
            begin
                if(SalidaOp==0)begin 
                                FlagZ<= 1'b1;
                                FlagC<= 1'b0;
                                FlagN<= 1'b0;
                                end
                          else  FlagZ<= 1'b0; 
                                FlagC<= 1'b0;
                                FlagN<= 1'b0;
            end
    4'b0011:
             begin
                 if(SalidaOp==0)begin 
                                 FlagZ<= 1'b1;
                                 FlagC<= 1'b0;
                                 FlagN<= 1'b0;
                                 end
                           else  FlagZ<= 1'b0; 
                                 FlagC<= 1'b0;
                                 FlagN<= 1'b0;
             end          
    4'b0100:
        begin
            if(SalidaOp==0)begin 
                                FlagZ<= 1'b1;
                                FlagC<= 1'b0;
                                FlagN<= 1'b0;
                                end
                          else  FlagZ<= 1'b0; 
                                FlagC<= 1'b0;
                                FlagN<= 1'b0;
        end 
    4'b0101:
                begin
            if(SalidaOp==0)begin 
                                FlagZ<= 1'b1;
                                FlagC<= 1'b0;
                                FlagN<= 1'b0;
                                end
                          else  FlagZ<= 1'b0; 
                                FlagC<= 1'b0;
                                FlagN<= 1'b0;
                end 
    4'b0110:
                 begin
                if(SalidaOp==0)begin 
                                FlagZ<= 1'b1;
                                FlagC<= 1'b0;
                                FlagN<= 1'b0;
                                end
                          else  FlagZ<= 1'b0; 
                                FlagC<= 1'b0;
                                FlagN<= 1'b0;
                        end 
    4'b0111:
                      begin
                if(SalidaOp==0)begin 
                                FlagZ<= 1'b1;
                                FlagC<= 1'b0;
                                FlagN<= 1'b0;
                                end
                          else  FlagZ<= 1'b0; 
                                FlagC<= 1'b0;
                                FlagN<= 1'b0;
                        end
    4'b1111: begin
                                        if(SalidaOp==0)begin 
                                                        FlagZ<= 1'b1;
                                                        FlagC<= 1'b0;
                                                        FlagN<= 1'b0;
                                                        end
                                                  else  FlagZ<= 1'b0; 
                                                        FlagC<= 1'b0;
                                                        FlagN<= 1'b0;
                                                end 
   
    
    default: 
    begin
        FlagZ <= FlagZ;
        FlagC <= FlagC;
        FlagN <= FlagN;
    end
    endcase
end  

assign Flags[0]=FlagZ;
assign Flags[1]=FlagC;
assign Flags[2]=FlagN;
  
endmodule
