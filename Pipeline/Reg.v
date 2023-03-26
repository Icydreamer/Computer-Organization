module Reg(
  input        clkIn,    //from
  input        resetIn,
  input[4:0]   rs1In,    //from IFID
  input[4:0]   rs2In,    //from IFID
  input[4:0]   rdIn,     //from IFID
  input[31:0]  dataIn,   //from DataMUX
  input        writeIn,  //from MAWB
  output[31:0] data1Out, //to   IDEX
  output[31:0] data2Out, //to   IDEX
  output[31:0] portOut   //to   LEDs
);

  reg[31:0] Reg[31:0]; // general registers
  integer k;
  assign data1Out=Reg[rs1In];
  assign data2Out=Reg[rs2In];
  assign portOut=Reg[3];
  always @(posedge clkIn) begin
    if (~resetIn) begin
      for (k=0;k<32;k=k+1) Reg[k]<=0;
    end
    else if (writeIn) Reg[rdIn]<=dataIn;
  end
endmodule
