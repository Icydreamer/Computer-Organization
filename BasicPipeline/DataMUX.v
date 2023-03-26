module DataMUX(
  input[31:0]      ResultIn,     //from MAWB
  input[31:0]      Imm32In,      //from MAWB
  input[31:0]      DataIn,       //from MAWB
  input[31:0]      AddrIn,       //from MAWB
  input[1:0]       SelectorIn,   //from MAWB
  output reg[31:0] DataOut       //to Reg
);

  always @(*) begin
    if (SelectorIn==0) DataOut<=ResultIn;
    else if (SelectorIn==1) DataOut<=Imm32In;
    else if (SelectorIn==2) DataOut<=DataIn;
    else DataOut<=AddrIn;
  end
endmodule

