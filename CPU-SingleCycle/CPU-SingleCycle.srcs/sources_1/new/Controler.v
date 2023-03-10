`include "Defines.v"
module Controller(
    input [4:0] OPCode;
    output [2:0] AddressSelect;
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
                AddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 1;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_ADDI: begin
                AddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 0;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_SUB: begin
                AddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 1;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_AND: begin
                AddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 1;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_ANDI: begin
                AddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 0;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_OR: begin
                AddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 1;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_ORI: begin
                AddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 0;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_XOR: begin
                AddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 1;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_XORI: begin
                AddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 0;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_SLL: begin
                AddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 1;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_SLLI: begin
                AddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 0;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_SRL: begin
                AddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 1;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_SRLI: begin
                AddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 0;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_LUI: begin
                AddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 0;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_LW: begin
                AddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 0;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_SW: begin
                AddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 0;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_BLT: begin
                AddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 0;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_BEQ: begin
                AddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 1;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_JAL: begin
                AddressSelect = ;
                MenWrite = ;
                MemRead = ;
                ALUOperation = ;
                ALUDataSelect = 0;
                RegisterDataSelect = ;
                RegisterWrite = ;
            end
            OP_JALR: begin
                AddressSelect = ;
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