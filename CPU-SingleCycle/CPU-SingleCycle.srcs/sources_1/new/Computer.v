`timescale 1ns / 1ps

module Computer(
    input clkIn, //from outside
    input resetIn, //from outside
    output [15:0] portOut //to outside
    );

    // PC
    wire[31:0] AddressMUX_AddressOut; 
    wire[31:0] PC_AddressOut;
    PC myPC(
        .clkIn(clkIn),
        .resetIn(resetIn),
        .AddressIn(AddressMUX_AddressOut),
        .AddressOut(PC_AddressOut)
        );

    // IMem
    wire[31:0] IMem_InsOut;
    IMem myIMem(
        .AddressIn(PC_AddressOut),
        .InstructionOut(IMem_InsOut)
        );

    // Controller
    wire [2:0] Controller_AddressSelect;
    wire Controller_MemWrite;
    wire Controller_MemRead;
    wire [2:0] Controller_ALUOperation;
    wire Controller_ALUDataSelect;
    wire [1:0] Controller_RegisterDataSelect;
    wire Controller_RegisterWrite;

    Controller myController (
        .OPCode(IMem_InsOut[4:0]),
        .AddressSelect(Controller_AddressSelect),
        .MemWrite(Controller_MemWrite),
        .MemRead(Controller_MemRead),
        .ALUOperation(Controller_ALUOperation),
        .ALUDataSelect(Controller_ALUDataSelect),
        .RegisterDataSelect(Controller_RegisterDataSelect),
        .RegisterWrite(Controller_RegisterWrite)
        );

    
    // RegisterFile
    wire[31:0] WriteBackMUX_DataOut;
    wire[31:0] ALUDataMUX_DataOut;
    wire[31:0] RegisterFile_Data1Out;
    wire[31:0] RegisterFile_Data2Out;
    RegisterFile myRegisterFile(
        .clkIn(clkIn),
        .resetIn(resetIn),
        .Register1(IMem_InsOut[19:15]),
        .Register2(IMem_InsOut[24:20]),
        .RegisterDestination(IMem_InsOut[11:7]),
        .WriteData(WriteBackMUX_DataOut),
        .RegisterWrite(Controller_RegisterWrite),
        .ReadData1(RegisterFile_Data1Out),
        .ReadData2(RegisterFile_Data2Out),
        .portOut(portOut)
        );

    // ImmGen
    wire[31:0] ImmGen_Imm32Out;
    ImmGen myImmGen(
        .Instruction(IMem_InsOut),
        .Imm32Out(ImmGen_Imm32Out)
        );

    //ALUDataMUX
    ALUDataMUX myALUDataMUX(
        .RegisterData2(RegisterFile_Data2Out),
        .Imm32(ImmGen_Imm32Out),
        .ALUDataSelect(Controller_ALUDataSelect),
        .ALUData2Out(ALUDataMUX_DataOut)
        );

    // ALU
    wire ALU_LessOut;
    wire ALU_ZeroOut;
    wire[31:0] ALU_ResultOut;
    ALU myALU(
        .ALUData1(RegisterFile_Data1Out),
        .ALUDtat2(ALUDataMUX_DataOut),
        .ALUOperation(Controller_ALUOperation),
        .ALULess(ALU_LessOut),
        .ALUZero(ALU_ZeroOut),
        .ALUResult(ALU_ResultOut)
        );

    // PCPlusOffset
    wire[31:0] PCPlusOffset_AddressOut;
    PCPlusOffset myPCPlusOffset(
        .offsetIn(ImmGen_Imm32Out),
        .AddressIn(PC_AddressOut),
        .AddressOut(PCPlusOffset_AddressOut)
        );

    // PCPlusOne
    wire[31:0] PCPlusOne_AddressOut;
    PCPlusOne myPCPlusOne(
        .AddressIn(PC_AddressOut),
        .AddressOut(PCPlusOne_AddressOut)
        );

    // AddressMUX
    // assign PC_AddrIn = AddressMUX_AddressOut;
    AddressMUX myAddressMUX(
        .ALULess(ALU_LessOut),
        .ALUZero(ALU_ZeroOut),
        .ALUResult(ALU_ResultOut),
        .PCPlusOffset(PCPlusOffset_AddressOut),
        .PCPlusOne(PCPlusOne_AddressOut),
        .AddressSelect(Controller_AddressSelect),
        .AddressOut(AddressMUX_AddressOut)
        );

    // DataMemory
    wire[31:0] DataMemory_DataOut;
    DataMemory myDataMemory(
        .clkIn(clkIn),
        .resetIn(resetIn),
        .AddressIn(ALU_ResultOut),
        .WriteData(RegisterFile_Data2Out),
        .MemRead(Controller_MemRead),
        .MemWrite(Controller_MemWrite),
        .ReadData(DataMemory_DataOut)
        );

    // WriteBackMUX
    WriteBackMUX myWriteBackMUX(
        .ALUResult(ALU_ResultOut),
        .Imm32(ImmGen_Imm32Out),
        .MemData(DataMemory_DataOut),
        .Address(PCPlusOne_AddressOut),
        .RegisterDataSelect(Controller_RegisterDataSelect),
        .RegisterData(WriteBackMUX_DataOut)
        );

endmodule
