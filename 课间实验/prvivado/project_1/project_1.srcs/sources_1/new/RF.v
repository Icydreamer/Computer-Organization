`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/26 21:11:32
// Design Name: 
// Module Name: RF
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


module RF(
input clk,			
input rstn,			
input RFWr,			//Rfwrite = mem2reg  
input[15:0] sw_i, 	//sw_i[15]---sw_i[0]
input[4:0] A1, A2, A3,		
input[31:0] WD,					
output[31:0] RD1, RD2	
);
 
 //初始化
reg[31:0] regfile[31:0];
integer i ;
initial begin
    for (i=0; i<=31; i=i+1) begin
     regfile[i]=i;   
    end
end

reg[4:0]rs1;
reg[4:0]rs2;
 always@(posedge clk, negedge rstn) begin
       if(!rstn) begin  //重置
       for (i=0; i<=31; i=i+1) begin regfile[i]=i;  end
       end
       else if(sw_i[1]==1'b0)//非调试模式可写入
       begin
           if(RFWr==1'b1) begin //写入
           regfile[A3]={A3!=0}?WD:0; 
           rs1=A1; rs2 = A2;end
           else rs1=A1; rs2 = A2;
       end 
      else rs1=A1; rs2 = A2; end

assign  RD1 = {rs1!=0}?regfile[rs1]:0;
assign  RD2 = {rs2!=0}?regfile[rs2]:0;

endmodule
