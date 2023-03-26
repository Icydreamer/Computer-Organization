module PC(
  input clkIn,
  input resetIn,
  input[31:0] addrIn,      //from AddrMUX
  output reg[31:0] addrOut  //to IMem,IFID
);

  always @(posedge clkIn) begin
    if (~resetIn) addrOut<=0;
    else addrOut<=addrIn;
  end
endmodule  