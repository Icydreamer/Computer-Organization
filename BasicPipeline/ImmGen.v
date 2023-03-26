module ImmGen(
  (* dont_touch="TRUE" *) input[31:0]      InsIn,   //from IFID
  output reg[31:0] Imm32Out //to IDEX
);

  wire[4:0]  opcode;
  assign     opcode=InsIn[4:0];
  wire[4:0]  imm5;
  assign     imm5=InsIn[11:7];
  wire[5:0]  imm6;
  assign     imm6=InsIn[25:20];
  wire[6:0]  imm7;
  assign     imm7=InsIn[31:25];
  wire[11:0] imm12;
  assign     imm12=InsIn[31:20];
  wire[19:0] imm20;
  assign     imm20=InsIn[31:12];

  always @(InsIn,opcode,imm5,imm6,imm7,imm12,imm20) begin
    case (opcode)
      5'h02: if (imm12[11]) Imm32Out<={20'hfffff,imm12[11:0]};
             else Imm32Out<={20'h00000,imm12[11:0]};
      5'h05: Imm32Out<={20'h00000,imm12[11:0]};
      5'h07: Imm32Out<={20'h00000,imm12[11:0]};
      5'h09: Imm32Out<={20'h00000,imm12[11:0]};
      5'h0b: Imm32Out<={26'h0000000,imm6[5:0]};
      5'h0d: Imm32Out<={26'h0000000,imm6[5:0]};
      5'h0e: Imm32Out<={imm20[19:0],12'h000};
      5'h0f: if (imm12[11]) Imm32Out<={20'hfffff,imm12[11:0]};
             else Imm32Out<={20'h00000,imm12[11:0]};
      5'h10: if (imm7[6]) Imm32Out<={20'hfffff,imm7[6:0],imm5[4:0]};
             else Imm32Out<={20'h00000,imm7[6:0],imm5[4:0]};
      5'h11: if (imm7[6]) Imm32Out<={20'hfffff,imm7[6:0],imm5[4:0]};
             else Imm32Out<={20'h00000,imm7[6:0],imm5[4:0]};
      5'h12: if (imm7[6]) Imm32Out<={20'hfffff,imm7[6:0],imm5[4:0]};
             else Imm32Out<={20'h00000,imm7[6:0],imm5[4:0]};
      5'h13: if (imm20[19]) Imm32Out<={12'hfff,imm20[19:0]};
             else Imm32Out<={12'h000,imm20[19:0]};
      5'h14: if (imm12[11]) Imm32Out<={20'hfffff,imm12[11:0]};
             else Imm32Out<={20'h00000,imm12[11:0]};
    default: Imm32Out<=32'h00000000;
    endcase
  end
endmodule

