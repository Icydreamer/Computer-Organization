module IDEX(
  input            clkIn,
  input            resetIn,
  input[11:0]      ctrSignalsIn,  //from Controller
  input[31:0]      Data1In,       //from Reg
  input[31:0]      Data2In,       //from Reg
  input[31:0]      Imm32In,       //from ImmGen
  input[31:0]      AddrIn,        //from IFID
  input[4:0]       rdIn,          //from IFID
  output reg[11:0] ctrSignalsOut, //to   ALU,ALUMUX,EXMA
  output reg[31:0] Data1Out,      //to   ALU
  output reg[31:0] Data2Out,      //to   ALUMUX,EXMA
  output reg[31:0] Imm32Out,      //to   ALUMUX,PCRelAddrAdder,EXMA
  output reg[31:0] AddrOut,       //to   PCRelAddrAdder,RetAddrAdder
  output reg[4:0]  rdOut          //to   EXMA
);

  always @(posedge clkIn) begin
    if (~resetIn) begin
      ctrSignalsOut<=0; Data1Out<=0; Data2Out<=0; Imm32Out<=0; AddrOut<=0; rdOut<=0; 
    end
    else begin
      ctrSignalsOut<=ctrSignalsIn; Data1Out<=Data1In; Data2Out<=Data2In; Imm32Out<=Imm32In; AddrOut<=AddrIn; rdOut<=rdIn;
    end
  end
endmodule

