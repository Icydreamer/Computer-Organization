module ALUMUX(
  input[31:0]  DataIn,     //from IDEX
  input[31:0]  Imm32In,    //from IDEX
  input        SelectorIn, //from IDEX
  output[31:0] DataOut     //to   ALU
);

  assign DataOut=SelectorIn?DataIn:Imm32In;
endmodule
