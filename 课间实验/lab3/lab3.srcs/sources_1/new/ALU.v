`timescale 1ns / 1ps
`define ALUOp_add 5'b00001
`define ALUOp_sub 5'b00010
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/27 10:17:23
// Design Name: 
// Module Name: ALU
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


module ALU(
    input signed [31:0] A, B, //alu input num
    input [4:0] ALUOp,      //alu how to do
    output reg signed [31:0] C, //alu result
    output reg [7:0] Zero
    );
    
    always @(*) begin
        case(ALUOp)
            `ALUOp_add: C = A + B;
            `ALUOp_sub: C = A - B;
            5'b00100: C = A & B;
            5'B01000: C = A | B;
        endcase
        Zero = (C == 0)? 1: 0;
    end
    
endmodule
