`timescale 1ns / 1ps

module IFIDReg(clkIn,resetn,AddrIn,InsIn,flushIn,stallIn,AddrOut,InsOut);
input clkIn;
input resetn;
input [31:0]AddrIn;
input [31:0]InsIn;
input flushIn;
input stallIn;
output reg [31:0] AddrOut;
output reg [31:0] InsOut;

always @(posedge clkIn) begin
   if(~resetn)begin
      InsOut<=32'b0;
      AddrOut<=32'b0;
   end
   else if(flushIn) begin
       AddrOut<=32'b0;
       InsOut<=32'b0;
   end
   else if(stallIn==0)begin
      InsOut<=InsIn;
      AddrOut<=AddrIn;
   end
end

endmodule
