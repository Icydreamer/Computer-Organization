module IFID(
  input            clkIn,   
  input            resetIn,
  input            flushIn, //from Flush
  input            stallIn, //from Stall
  input[31:0]      InsIn,   //from IMem
  input[31:0]      AddrIn,  //from PC
  output reg[31:0] InsOut,  //to   Controller,Reg,ImmGen
  output reg[31:0] AddrOut  //to   IDEX
);
  always @(posedge clkIn) begin
    if (~resetIn) begin InsOut<=0; AddrOut<=0; end
    else if (flushIn) begin InsOut<=0; AddrOut<=0; end 
    else if (stallIn==0) begin InsOut<=InsIn; AddrOut<=AddrIn; end
  end
endmodule
