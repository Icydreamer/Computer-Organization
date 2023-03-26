module EXMA(
  input            clkIn,
  input            resetIn,
  input            flushIn,       //from Flush
  input[7:0]       ctrSignalsIn, 
  input            LessIn,
  input            ZeroIn,
  input[31:0]      ResultIn,
  input[31:0]      DataIn,
  input[31:0]      Imm32In,
  input[31:0]      PCRelAddrIn,
  input[31:0]      retAddrIn, 
  input[4:0]       rdIn,
  output reg[7:0]  ctrSignalsOut, 
  output reg       LessOut,
  output reg       ZeroOut,
  output reg[31:0] ResultOut,
  output reg[31:0] DataOut,
  output reg[31:0] Imm32Out,
  output reg[31:0] PCRelAddrOut,
  output reg[31:0] retAddrOut,
  output reg[4:0]  rdOut
);

  always @(posedge clkIn) begin
    if (~resetIn) begin ctrSignalsOut<=0;LessOut<=0;ZeroOut<=0;ResultOut<=0;DataOut<=0;Imm32Out<=0;PCRelAddrOut<=0;retAddrOut<=0;rdOut<=0; end
    else if (flushIn) begin ctrSignalsOut<=0;LessOut<=0;ZeroOut<=0;ResultOut<=0;DataOut<=0;Imm32Out<=0;PCRelAddrOut<=0;retAddrOut<=0;rdOut<=0; end
    else begin
      ctrSignalsOut<=ctrSignalsIn; LessOut<=LessIn; ZeroOut<=ZeroIn; ResultOut<=ResultIn;
      DataOut<=DataIn; Imm32Out<=Imm32In; PCRelAddrOut<=PCRelAddrIn; retAddrOut<=retAddrIn; rdOut<=rdIn;
    end
  end
endmodule
