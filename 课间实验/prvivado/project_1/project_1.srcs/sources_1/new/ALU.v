`timescale 1ns / 1ps
`define ALUOp_add 5'b00001
`define ALUOp_sub 5'b00010
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/29 15:35:48
// Design Name: 
// Module Name: alu
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


module alu(
    input signed [31:0] 	A, B,  //alu input num
    input [4:0]  			ALUOp, //alu how to do 
    output reg signed [31:0] 	C, // alu result 
    output reg [7:0] 		Zero
    );
    always@(A or B) begin
        case(ALUOp)
            `ALUOp_add: C=A+B;
            `ALUOp_sub: C=A-B;
        endcase
        
        Zero=(C==0)?1:0;
    end
endmodule
