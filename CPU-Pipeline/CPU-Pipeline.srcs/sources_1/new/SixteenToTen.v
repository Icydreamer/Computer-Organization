`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/14 07:58:58
// Design Name: 
// Module Name: SixteenToTen
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


module SixteenToTen(//只负责16位数转换，输入的后16位不管
    input [31:0]num,
    output [31:0]numConverted
    );
    
    reg [15:0]res;
    always@(num)begin
        res[15:12]=num/1000;
        res[11:8]=(num-1000*res[15:12])/100;
        res[7:4]=(num-res[15:12]*1000-res[11:8]*100)/10;
        res[3:0]=num-res[15:12]*1000-res[11:8]*100-res[7:4]*10;
    end
    assign numConverted={16'h0000,res};
endmodule
