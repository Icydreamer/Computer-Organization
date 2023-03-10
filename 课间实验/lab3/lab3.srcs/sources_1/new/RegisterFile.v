`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/25 22:55:17
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(
    input clk,
    input rstn,
    input RFWr,//RFwrite = men2reg
    input [15:0] sw_i,
    input [4:0] A1, A2, A3,//Register Num
    input [31:0] WD,//Write data
    output [31:0] RD1, RD2//Data output port
    );
    
    reg [31:0] rf [31:0];
    integer i = 0;
    
    //³õÊ¼»¯¼Ä´æÆ÷
    initial begin
        for(i = 0; i < 32; i = i + 1) begin
            rf[i] = i;
        end
    end
    
    //Ð´
    always @(negedge clk or negedge rstn) begin
        if(!rstn) begin
            
        end
        else if(RFWr && (!sw_i[1])) begin
            rf[A3] <= WD;
        end
        
    end
    
    assign RD1 = (A1 != 0) ? rf[A1] : 0;
    assign RD2 = (A2 != 0) ? rf[A2] : 0;
endmodule
