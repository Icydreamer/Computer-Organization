`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/30 14:59:36
// Design Name: 
// Module Name: imm
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


module imm(
    input[3:0]A,
    input[3:0]B,
    output reg[31:0]ex_A,
    output reg[31:0]ex_B
    );
    
    always@(*)
    begin
    if(A[3]==0) ex_A={29'b0_0000_0000_0000_0000_0000_0000_0000,A[2:0]};
    else ex_A={29'b1_1111_1111_1111_1111_1111_1111_1111,A[2:0]};
    if(B[3]==0) ex_B={29'b0_0000_0000_0000_0000_0000_0000_0000,B[2:0]};
    else ex_B={29'b1_1111_1111_1111_1111_1111_1111_1111,B[2:0]};
    end
    
endmodule
