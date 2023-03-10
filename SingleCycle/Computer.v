module Computer(clkIn,resetIn,portOut);
  input clkIn; //from outside
  input resetIn; //from outside
  output[15:0] portOut; //to outside

  //module PC(clkIn,resetIn,AddrIn,AddrOut);
 
  wire[31:0] AddrMUX_AddrOut; 
  wire[31:0] PC_AddrOut;
  PC myPC(clkIn,resetIn,AddrMUX_AddrOut,PC_AddrOut);

  //module IMem(AddrIn,InsOut);
  wire[31:0] IMem_InsOut;
  Imem myIMem(PC_AddrOut,IMem_InsOut);

  //module Controller(opcodeIn,ctrSignalsOut);
  wire[11:0] Controller_ctrSignalsOut;
  Controller myController (IMem_InsOut[4:0],Controller_ctrSignalsOut);

  //module Reg(clkIn,resetIn,rs1In,rs2In,rdIn,DataIn,WriteIn,
  //Data1Out,Data2Out,portOut);
  wire[31:0] DataMUX_DataOut;
  wire[31:0] Reg_Data1Out;
  wire[31:0] Reg_Data2Out;
  Reg myReg(clkIn,resetIn,IMem_InsOut[19:15],IMem_InsOut[24:20],IMem_InsOut[11:7],DataMUX_DataOut,Controller_ctrSignalsOut[11],Reg_Data1Out,Reg_Data2Out,portOut);

  //module ImmGen(InsIn,Imm32Out);
  wire[31:0] ImmGen_Imm32Out;
  ImmGen myImmGen(IMem_InsOut,ImmGen_Imm32Out);

  //module ALUMUX(DataIn,Imm32In,SelectorIn,DataOut);
  wire[31:0] ALUMUX_DataOut;
  ALUMUX myALUMUX(Reg_Data2Out,ImmGen_Imm32Out,Controller_ctrSignalsOut[0],ALUMUX_DataOut);

  //module ALU(Data1In,Data2In,OperatorIn,LessOut,ZeroOut,ResultOut);
  wire ALU_LessOut;
  wire ALU_ZeroOut;
  wire[31:0] ALU_ResultOut;
  ALU myALU(Reg_Data1Out,ALUMUX_DataOut,Controller_ctrSignalsOut[3:1],ALU_LessOut,ALU_ZeroOut,ALU_ResultOut);

  //module PCRelAddrAdder(OffsetIn,AddrIn,AddrOut);
  wire[31:0] PCRelAddrAdder_AddrOut;
  PCRelAddrAdder myPCRelAddrAdder(ImmGen_Imm32Out,PC_AddrOut,PCRelAddrdder_AddrOut);

  //module SeqAddrAdder(AddrIn,AddrOut);
  wire[31:0] SeqAddrAdder_AddrOut;
  SeqAddrAdder mySeqAddrAdder(PC_AddrOut,SeqAddrAdder_AddrOut);


  //module AddrMUX(LessIn,ZeroIn,RegRelAddrIn,PCRelAddrIn,SeqAddrIn,SelectorIn,AddrOut);
  assign PC_AddrIn=AddrMUX_AddrOut;
  AddrMUX myAddrMUX(ALU_LessOut,ALU_ZeroOut,ALU_ResultOut,PCRelAddrAdder_AddrOut,SeqAddrAdder_AddrOut,Controller_ctrSignalsOut[6:4],AddrMUX_AddrOut);


  //module DMem(clkIn,AddrIn,DataIn,ReadIn,WriteIn,DataOut);
  wire[31:0] DMem_DataOut;
  DMem myDMem(clkIn,ALU_ResultOut,Reg_Data2Out,Controller_ctrSignalsOut[8],Controller_ctrSignalsOut[7],DMem_DataOut);

  //module DataMUX(ResultIn,Imm32In,DataIn,SeqAddrIn,SelectorIn,DataOut); 
  DataMUX myDataMUX(ALU_ResultOut,ImmGen_Imm32Out,DMem_DataOut,SeqAddrAdder_AddrOut,Controller_ctrSignalsOut[10:9],DataMUX_DataOut);

endmodule





