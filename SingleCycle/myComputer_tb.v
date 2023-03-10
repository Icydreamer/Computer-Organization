module myComputer();
  reg clkIn;
  reg resetIn;
  wire[15:0] portOut;
  Computer myComputer(clkIn,resetIn,portOut);

  initial begin clkIn=0; forever #1 clkIn=~clkIn; end
  initial begin resetIn=0; #0.5 resetIn=1; #1 resetIn=0; end
endmodule
