module Reg(
  input        clkIn,     
  input        resetIn,
  input[4:0]   rs1In,     //from IFID
  input[4:0]   rs2In,     //from IFID
  input[4:0]   rdIn,      //from MAWB
  input[31:0]  DataIn,    //from DataMUX
  input        WriteIn,   //from MAWB
  output[31:0] Data1Out,  //to IDEX
  output[31:0] Data2Out,  //to IDEX
  output[31:0] portOut    
);
  
  (* dont_touch="TRUE" *) reg[31:0] Reg[31:0];    //general registers
  integer k;
  assign Data1Out=Reg[rs1In];
  assign Data2Out=Reg[rs2In];
  always @(posedge clkIn) begin
    if (~resetIn) begin
      for (k=0;k<32;k=k+1) Reg[k]<=31;
    end
    else if (WriteIn) Reg[rdIn]<=DataIn;
  end
  assign portOut=Reg[31];
endmodule

