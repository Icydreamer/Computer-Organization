`timescale 1ns / 1ps

module WriteBackMUX(
    input [31:0] ALUResult,
    input [31:0] Imm32,
    input [31:0] MemData,
    input [31:0] Address,
    input [1:0] RegisterDataSelect,
    output reg [31:0] RegisterData
    );

    always @(ALUResult, Imm32, MemData, Address, RegisterDataSelect) begin
        if (RegisterDataSelect==0) RegisterData <= ALUResult;
        else if (RegisterDataSelect== 1) RegisterData <= Imm32;
        else if (RegisterDataSelect== 2) RegisterData <= MemData;
        else if(RegisterDataSelect == 3)RegisterData <= Address;
    end
endmodule