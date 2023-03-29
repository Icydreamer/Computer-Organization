`timescale 1ns / 1ps

module ALU(
    input [31:0] ALUData1,
    input [31:0] ALUDtat2,
    input [2:0] ALUOperation,
    output ALULess,
    output ALUZero,
    output reg[31:0] ALUResult
    );
    always @(ALUData1, ALUDtat2, ALUOperation) begin
        case (ALUOperation)
            3'b001: ALUResult<=ALUData1+ALUDtat2; //add,addi
            3'b010: ALUResult<=ALUData1-ALUDtat2; //sub
            3'b011: ALUResult<=ALUData1&ALUDtat2; //and, andi
            3'b100: ALUResult<=ALUData1|ALUDtat2; //or, or
            3'b101: ALUResult<=ALUData1^ALUDtat2; //xor xori
            3'b110: if (ALUDtat2>31) begin //sll,slli
                        ALUResult <= 32'h00000000;
                    end
                    else if (ALUDtat2>0) begin
                        ALUResult <= ALUData1 << ALUDtat2;
                    end
                    else begin
                        ALUResult <= ALUData1;
                    end
            3'b111: if (ALUDtat2>31) begin //srl,srli
                        ALUResult <= 32'h00000000;
                    end
                    else if (ALUDtat2>0) begin
                        ALUResult <= ALUData1 >> ALUDtat2;
                    end
                    else begin
                        ALUResult <= ALUData1;
                    end
            default: ALUResult <= 32'h00000000; //other cases
        endcase
    end
    assign ALULess = (ALUData1 < ALUDtat2)? 1: 0;
    assign ALUZero = (ALUResult == 0)? 1: 0;
endmodule