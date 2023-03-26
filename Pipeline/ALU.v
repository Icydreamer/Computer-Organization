module ALU(
  input[31:0]      data1In,    //from IDEX
  input[31:0]      data2In,    //from ALUMUX
  input[2:0]       operatorIn, //from IDEX
  output           lessOut,    //to   EXMA
  output           zeroOut,    //to   EXMA
  output reg[31:0] resultOut   //to   EXMA
);

  always @(data1In,data2In,operatorIn) begin
    case (operatorIn)
      3'b001: resultOut<=data1In+data2In; // add, addi
      3'b010: resultOut<=data1In-data2In; // sub
      3'b011: resultOut<=data1In&data2In; // and, andi
      3'b100: resultOut<=data1In|data2In; // or, or
      3'b101: resultOut<=data1In^data2In; // xor��xori
      3'b110: if (data2In>31) resultOut<=32'h00000000;
              else if (data2In>0) resultOut<=data1In<<data2In; // sll, slli
              else resultOut<=data1In;
      3'b111: if (data2In>31) resultOut<=32'h00000000;
              else if (data2In>0) resultOut<=data1In>>data2In; // srl, srli
              else resultOut<=data1In;
      default: resultOut<=0; 
    endcase
  end
  assign lessOut=(data1In<data2In)?1:0;
  assign zeroOut=(resultOut==0)?1:0;
endmodule
