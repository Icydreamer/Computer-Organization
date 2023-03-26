module MAWB(
  input            clkIn,
  input            resetIn,       
  input[2:0]       ctrSignalsIn,  //from EXMA
  input[31:0]      ResultIn,      //from EXMA
  input[31:0]      Imm32In,       //from EXMA
  input[31:0]      DataIn,        //from DMem
  input[31:0]      AddrIn,        //from EXMA
  input[4:0]       rdIn,          //from EXMA
  output reg[2:0]  ctrSignalsOut, //to   Reg,DataMUX
  output reg[31:0] ResultOut,     //to   DataMUX
  output reg[31:0] Imm32Out,      //to   DataMUX
  output reg[31:0] DataOut,       //to   DataMUX
  output reg[31:0] AddrOut,       //to   DataMUX
  output reg[4:0]  rdOut          //to   Reg
);
  
  always @(posedge clkIn) begin
    if (~resetIn) begin
      ctrSignalsOut<=0; ResultOut<=0; DataOut<=0;
      Imm32Out<=0; AddrOut<=0; rdOut<=0;
    end
    else begin
      ctrSignalsOut<=ctrSignalsIn; ResultOut<=ResultIn; DataOut<=DataIn;
      Imm32Out<=Imm32In; AddrOut<=AddrIn; rdOut<=rdIn;
    end
  end
endmodule
