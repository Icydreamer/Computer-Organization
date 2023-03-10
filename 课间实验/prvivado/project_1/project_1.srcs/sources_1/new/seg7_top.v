`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/26 18:48:20
// Design Name: 
// Module Name: seg7_top
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


module seg7_top(
input clk,
input rstn,
output[7:0] disp_seg_o,
output[7:0] disp_an_o
    );
    reg [31:0] i_data;
    initial begin
    i_data=32'b1010_0000_0111_1101_0001_0011_1011_1111 ; end
    
  seg7x16 u_seg7x16(.clk(clk),.rstn(rstn),.i_data(i_data),.o_seg(disp_seg_o),.o_sel(disp_an_o));
endmodule