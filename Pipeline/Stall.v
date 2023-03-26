module Stall(
  input[4:0] IFIDrs1In,    //from IFID
  input[4:0] IFIDrs2In,    //from IFID
  input      IDEXMemReadIn,   //from IDEX
  input[4:0] IDEXrdIn,     //from IDEX
  input      MAWBRegWriteIn,
  input[4:0] MAWBrdIn,  
  output reg stallOut  //to   PC,IFID,IDEX
);

  always @(*) begin
    if ((IDEXMemReadIn)&&(IDEXrdIn==IFIDrs1In||IDEXrdIn==IFIDrs2In)) stallOut<=1;
    else if ((MAWBRegWriteIn)&&(MAWBrdIn==IFIDrs1In||MAWBrdIn==IFIDrs2In)) stallOut<=1;
    else stallOut<=0;
  end
endmodule
