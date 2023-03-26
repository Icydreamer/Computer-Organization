module PCRelAddrAdder(
  input[31:0] OffsetIn, //from IDEX
  input[31:0] AddrIn,   //from IDEX
  output[31:0] AddrOut //to EXMA
);

  assign AddrOut=AddrIn+OffsetIn;
endmodule

