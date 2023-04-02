`timescale 1ns / 1ps

module retAddrAdder(AddrIn,AddrOut);
  input[31:0] AddrIn;
  output[31:0] AddrOut;
  assign AddrOut=AddrIn+1;
endmodule
