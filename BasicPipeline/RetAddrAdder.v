module RetAddrAdder(
  input[31:0] AddrIn,   //from PC
  output[31:0] AddrOut  //to AddrMUX
);

  assign AddrOut=AddrIn+1;
endmodule

