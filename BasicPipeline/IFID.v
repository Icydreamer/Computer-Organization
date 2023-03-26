module IFID(
  input            clkIn,   
  input            resetIn,
  input[31:0]      InsIn,   //from IMem
  input[31:0]      AddrIn,  //from PC
  output reg[31:0] InsOut,  //to   Controller,Reg,ImmGen,IDEX
  output reg[31:0] AddrOut  //to   IDEX
);
  always @(posedge clkIn) begin
    if (~resetIn) begin InsOut<=0; AddrOut<=0; end
    else begin InsOut<=InsIn; AddrOut<=AddrIn; end
  end
endmodule
