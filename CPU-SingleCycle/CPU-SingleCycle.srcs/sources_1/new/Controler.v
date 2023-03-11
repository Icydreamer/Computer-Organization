`include "Defines.v"
`timescale 1ns / 1ps

module Controller(
    input [4:0] OPCode,
    output reg [2:0] AddressSelect,
    output reg MemWrite,
    output reg MemRead,
    output reg [2:0] ALUOperation,
    output reg ALUDataSelect,
    output reg [1:0] RegisterDataSelect,
    output reg RegisterWrite
    );

    always @(*) begin
        case (OPCode)
            `OP_ADD: begin
                AddressSelect = 3'b000;
                MemWrite = 0;
                MemRead = 0;
                ALUOperation = 3'b001;
                ALUDataSelect = 1;
                RegisterDataSelect = 2'b00;
                RegisterWrite = 1;
            end
            `OP_ADDI: begin
                AddressSelect = 3'b000;
                MemWrite = 0;
                MemRead = 0;
                ALUOperation = 3'b001;
                ALUDataSelect = 0;
                RegisterDataSelect = 2'b00;
                RegisterWrite = 1;
            end
            `OP_SUB: begin
                AddressSelect = 3'b000;
                MemWrite = 0;
                MemRead = 0;
                ALUOperation = 3'b010;
                ALUDataSelect = 1;
                RegisterDataSelect = 2'b00;
                RegisterWrite = 1;
            end
            `OP_AND: begin
                AddressSelect = 3'b000;
                MemWrite = 0;
                MemRead = 0;
                ALUOperation = 3'b011;
                ALUDataSelect = 1;
                RegisterDataSelect = 2'b00;
                RegisterWrite = 1;
            end
            `OP_ANDI: begin
                AddressSelect = 3'b000;
                MemWrite = 0;
                MemRead = 0;
                ALUOperation = 3'b011;
                ALUDataSelect = 0;
                RegisterDataSelect = 2'b00;
                RegisterWrite = 1;
            end
            `OP_OR: begin
                AddressSelect = 3'b000;
                MemWrite = 0;
                MemRead = 0;
                ALUOperation = 3'b100;
                ALUDataSelect = 1;
                RegisterDataSelect = 2'b00;
                RegisterWrite = 1;
            end
            `OP_ORI: begin
                AddressSelect = 3'b000;
                MemWrite = 0;
                MemRead = 0;
                ALUOperation = 3'b100;
                ALUDataSelect = 0;
                RegisterDataSelect = 2'b00;
                RegisterWrite = 1;
            end
            `OP_XOR: begin
                AddressSelect = 3'b000;
                MemWrite = 0;
                MemRead = 0;
                ALUOperation = 3'b101;
                ALUDataSelect = 1;
                RegisterDataSelect = 2'b00;
                RegisterWrite = 1;
            end
            `OP_XORI: begin
                AddressSelect = 3'b000;
                MemWrite = 0;
                MemRead = 0;
                ALUOperation = 3'b101;
                ALUDataSelect = 0;
                RegisterDataSelect = 2'b00;
                RegisterWrite = 1;
            end
            `OP_SLL: begin
                AddressSelect = 3'b000;
                MemWrite = 0;
                MemRead = 0;
                ALUOperation = 3'b110;
                ALUDataSelect = 1;
                RegisterDataSelect = 2'b00;
                RegisterWrite = 1;
            end
            `OP_SLLI: begin
                AddressSelect = 3'b000;
                MemWrite = 0;
                MemRead = 0;
                ALUOperation = 3'b110;
                ALUDataSelect = 0;
                RegisterDataSelect = 2'b00;
                RegisterWrite = 1;
            end
            `OP_SRL: begin
                AddressSelect = 3'b000;
                MemWrite = 0;
                MemRead = 0;
                ALUOperation = 3'b111;
                ALUDataSelect = 1;
                RegisterDataSelect = 2'b00;
                RegisterWrite = 1;
            end
            `OP_SRLI: begin
                AddressSelect = 3'b000;
                MemWrite = 0;
                MemRead = 0;
                ALUOperation = 3'b111;
                ALUDataSelect = 0;
                RegisterDataSelect = 2'b00;
                RegisterWrite = 1;
            end
            `OP_LUI: begin
                AddressSelect = 3'b000;
                MemWrite = 0;
                MemRead = 0;
                ALUOperation = 3'b000;
                ALUDataSelect = 0;
                RegisterDataSelect = 2'b01;
                RegisterWrite = 1;
            end
            `OP_LW: begin
                AddressSelect = 3'b000;
                MemWrite = 0;
                MemRead = 1;
                ALUOperation = 3'b001;
                ALUDataSelect = 0;
                RegisterDataSelect = 2'b10;
                RegisterWrite = 1;
            end
            `OP_SW: begin
                AddressSelect = 3'b000;
                MemWrite = 1;
                MemRead = 0;
                ALUOperation = 3'b001;
                ALUDataSelect = 0;
                RegisterDataSelect = 2'b00;
                RegisterWrite = 0;
            end
            `OP_BLT: begin
                AddressSelect = 3'b001;
                MemWrite = 0;
                MemRead = 0;
                ALUOperation = 3'b000;
                ALUDataSelect = 0;
                RegisterDataSelect = 2'b00;
                RegisterWrite = 0;
            end
            `OP_BEQ: begin
                AddressSelect = 3'b010;
                MemWrite = 0;
                MemRead = 0;
                ALUOperation = 3'b010;
                ALUDataSelect = 1;
                RegisterDataSelect = 2'b00;
                RegisterWrite = 0;
            end
            `OP_JAL: begin
                AddressSelect = 3'b011;
                MemWrite = 0;
                MemRead = 0;
                ALUOperation = 3'b000;
                ALUDataSelect = 0;
                RegisterDataSelect = 2'b11;
                RegisterWrite = 1;
            end
            `OP_JALR: begin
                AddressSelect = 3'b100;
                MemWrite = 0;
                MemRead = 0;
                ALUOperation = 3'b001;
                ALUDataSelect = 0;
                RegisterDataSelect = 2'b11;
                RegisterWrite = 1;
            end
        endcase
    end
endmodule