module AddrMUX(
  input            LessIn,        //from EXMA
  input            ZeroIn,        //from EXMA
  input[31:0]      RegRelAddrIn,  //from EXMA
  input[31:0]      PCRelAddrIn,   //from EXMA
  input[31:0]      SeqAddrIn,     //from SeqAddrAdder
  input[2:0]       selectorIn,    //from EXMA
  output reg[31:0] AddrOut        //to   PC
);

  always @(*) begin
    if (selectorIn==0) AddrOut<=SeqAddrIn; //
    else if (selectorIn==1) begin //
      if (LessIn==1) AddrOut<=PCRelAddrIn; // blt
      else AddrOut<=SeqAddrIn; 
    end
    else if (selectorIn==2) begin //
      if (ZeroIn==1) AddrOut<=PCRelAddrIn; // beq
      else AddrOut<=SeqAddrIn;
    end
    else if (selectorIn==3) AddrOut<=PCRelAddrIn; // jal
    else if (selectorIn==4) AddrOut<=RegRelAddrIn; // jalr
    else AddrOut<=0;  //reset
  end
endmodule
