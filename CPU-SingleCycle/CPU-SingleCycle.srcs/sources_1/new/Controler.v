`include "Defines.v"
module Controller(
    input [4:0] OPCode;
    output [2:0] InstantAddressSelect;
    output MenWrite;
    output MemRead;
    output [2:0] ALUOperation;
    output ALUDataSelect;
    output [1:0] RegisterDataSelect;
    output RegisterWrite;
);
// 未完成
    always @(*) begin
        case (OPCode)
            OP_ADD: begin
                InstantAddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 1;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_ADDI: begin
                InstantAddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 0;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_SUB: begin
                InstantAddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 1;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_AND: begin
                InstantAddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 1;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_ANDI: begin
                InstantAddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 0;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_OR: begin
                InstantAddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 1;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_ORI: begin
                InstantAddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 0;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_XOR: begin
                InstantAddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 1;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_XORI: begin
                InstantAddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 0;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_SLL: begin
                InstantAddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 1;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_SLLI: begin
                InstantAddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 0;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_SRL: begin
                InstantAddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 1;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_SRLI: begin
                InstantAddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 0;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_LUI: begin
                InstantAddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 0;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_LW: begin
                InstantAddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 0;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_SW: begin
                InstantAddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 0;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_BLT: begin
                InstantAddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 0;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_BEQ: begin
                InstantAddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 1;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_JAL: begin
                InstantAddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 0;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_JALR: begin
                InstantAddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 0;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
        endcase
    end
endmodule