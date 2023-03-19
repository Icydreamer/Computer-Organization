`include "Defines.v"
`timescale 1ns / 1ps

module ImmGen(
    input [31:0] Instruction,
    output reg [31:0] Imm32Out
    );

    wire [4:0] opcode;
    assign opcode = Instruction[4:0];
    wire[4:0] imm5;
    assign imm5=Instruction[11:7];
    wire[5:0] imm6;
    assign imm6=Instruction[25:20];
    wire[6:0] imm7;
    assign imm7=Instruction[31:25];
    wire[11:0] imm12;
    assign imm12=Instruction[31:20];
    wire[19:0] imm20;
    assign imm20=Instruction[31:12];

    always @(Instruction) begin
        case (opcode) 
            `OP_ADDI: begin
                if (imm12[11]) Imm32Out<={20'hfffff,imm12[11:0]};
                else Imm32Out<={20'h00000,imm12[11:0]};
            end
            `OP_ANDI: begin
                Imm32Out<={20'h00000,imm12[11:0]};
            end
            `OP_ORI: begin
                Imm32Out<={20'h00000,imm12[11:0]};
            end
            `OP_XORI: begin
                Imm32Out<={20'h00000,imm12[11:0]};
            end
            `OP_SLLI: begin
                Imm32Out<={26'h0000000,imm6[5:0]};
            end
            `OP_SRLI: begin
                Imm32Out<={26'h0000000,imm6[5:0]};
            end
            `OP_LUI: begin
                Imm32Out<={imm20,12'h000};
            end
            `OP_LW: begin
                if (imm12[11]) Imm32Out<={20'hfffff,imm12[11:0]};
                else Imm32Out<={20'h00000,imm12[11:0]};
            end
            `OP_SW: begin
                if (imm7[6]) Imm32Out<={20'hfffff,imm7[6:0],imm5[4:0]};
                else Imm32Out<={20'h00000,imm7[6:0],imm5[4:0]};
            end
            `OP_BLT: begin
                if (imm7[6]) Imm32Out<={20'hfffff,imm7[6:0],imm5[4:0]};
                else Imm32Out<={20'h00000,imm7[6:0],imm5[4:0]};
            end
            `OP_BEQ: begin
                if (imm7[6]) Imm32Out<={20'hfffff,imm7[6:0],imm5[4:0]};
                else Imm32Out<={20'h00000,imm7[6:0],imm5[4:0]};
            end
            `OP_JAL: begin
                if (imm20[19]) Imm32Out<={12'hfff,imm20[19:0]};
                else Imm32Out<={12'h000,imm20[19:0]};
            end
            `OP_JALR: begin
                if (imm12[11]) Imm32Out<={20'hfffff,imm12[11:0]};
                else Imm32Out<={20'h00000,imm12[11:0]};
            end
            default: Imm32Out <= 32'h00000000;
        endcase
    end
endmodule