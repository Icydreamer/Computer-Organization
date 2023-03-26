module PC(
  input            clkIn,    //from outside
  input            resetIn,  //from outside
  input            flushIn,  //from Flush
  input            stallIn,  //from Stall
  input[31:0]      AddrIn,   //from AddrMUX
  output reg[31:0] AddrOut   //to   IM,IFID
);

  always @(posedge clkIn) begin
    if (~resetIn) AddrOut<=0;
    else if (flushIn) AddrOut<=AddrIn;
    else if (stallIn==0) AddrOut<=AddrIn;
  end
endmodule
