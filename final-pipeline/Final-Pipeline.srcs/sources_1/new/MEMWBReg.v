`timescale 1ns / 1ps

module MEMWBReg(clkIn,resetn,rdIn,retAddrIn,ImmIn,Data2In,ResultIn,Ctrl_signalIn,rdOut,retAddrOut,ImmOut,Data2Out,ResultOut,ctrSignalsOut);
input clkIn;
input resetn;
input[4:0] rdIn;
input[31:0] retAddrIn;
input[31:0] ImmIn;
input[31:0] Data2In;
input[31:0] ResultIn;
input[11:0] Ctrl_signalIn;
output reg [4:0] rdOut;
output reg [31:0] retAddrOut;
output reg [31:0] ImmOut;
output reg [31:0] Data2Out;
output reg [31:0] ResultOut;
output reg [11:0] ctrSignalsOut;

always @(posedge clkIn) begin
   if(~resetn)begin
      rdOut<=5'b0;
      retAddrOut<=32'b0;
      ImmOut<=32'b0;
      Data2Out<=32'b0;
      ResultOut<=32'b0;
      ctrSignalsOut<=12'b0;
   end
   else begin
      rdOut<=rdIn;
      retAddrOut<=retAddrIn;
      ImmOut<=ImmIn;
      Data2Out<=Data2In;
      ResultOut<=ResultIn;
      ctrSignalsOut<=Ctrl_signalIn;
   end
end

endmodule
