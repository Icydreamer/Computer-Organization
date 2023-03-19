`timescale 1ns / 1ps

module Computer(
    input clk, //from outside
    input rstn, //from outside
    output [7:0] disp_seg_o,
    output [7:0] disp_an_o
    );
    
    reg[31:0]clkdiv;
    wire Clk_CPU;
    
    always @(posedge clk or negedge rstn) begin
    if(!rstn) clkdiv <= 0;
    else clkdiv <= clkdiv + 1'b1;
    end
    
<<<<<<< HEAD
    assign Clk_CPU = clkdiv[0];
=======
    assign Clk_CPU = clkdiv[20];
>>>>>>> e7caab919607f42aac18ce0c961f2bf754f465d5
    
    // PC
    wire[31:0] AddressMUX_AddressOut; 
    wire[31:0] PC_AddressOut;
    PC myPC(
        .clkIn(Clk_CPU),
        .resetIn(rstn),
        .AddressIn(AddressMUX_AddressOut),
        .AddressOut(PC_AddressOut)
        );

    // IMem
    wire[31:0] IMem_InsOut;
    IMem myIMem(
        .AddressIn(PC_AddressOut),
        .InstructionOut(IMem_InsOut)
        );
<<<<<<< HEAD
    
    // SeqAddressAdder
    wire[31:0] SeqAddressAdder_AddressOut;
    PCPlusOne SeqAddressAdder(
        .AddressIn(PC_AddressOut),
        .AddressOut(SeqAddressAdder_AddressOut)
        );
    
    // IF/ID
    wire [31:0] IFID_InsOut;
    wire [31:0] IFID_AddressOut;
    IFID myIFID(
        .clkIn(Clk_CPU),
        .resetIn(rstn),
        .InstructionIn(IMem_InsOut),
        .AddressIn(PC_AddressOut),
        .InstructionOut(IFID_InsOut),
        .AddressOut(IFID_AddressOut)
        );
    
    
    // Controller
    wire [2:0] Controller_AddressSelectOut;
    wire Controller_MemWriteOut;
    wire Controller_MemReadOut;
    wire [2:0] Controller_ALUOperationOut;
    wire Controller_ALUDataSelectOut;
    wire [1:0] Controller_RegisterDataSelectOut;
    wire Controller_RegisterWriteOut;

    Controller myController (
        .OPCode(IFID_InsOut),
        .AddressSelect(Controller_AddressSelectOut),
        .MemWrite(Controller_MemWriteOut),
        .MemRead(Controller_MemReadOut),
        .ALUOperation(Controller_ALUOperationOut),
        .ALUDataSelect(Controller_ALUDataSelectOut),
        .RegisterDataSelect(Controller_RegisterDataSelectOut),
        .RegisterWrite(Controller_RegisterWriteOut)
=======

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
>>>>>>> e7caab919607f42aac18ce0c961f2bf754f465d5
        );

    
    // RegisterFile
<<<<<<< HEAD
    wire [31:0] WriteBackMUX_DataOut;
    wire [4:0] MEMWB_rdOut;
    wire MEMWB_RegisterWriteOut;
    wire [31:0] RegisterFile_Data1Out;
    wire [31:0] RegisterFile_Data2Out;
=======
    wire[31:0] WriteBackMUX_DataOut;
    wire[31:0] ALUDataMUX_DataOut;
    wire[31:0] RegisterFile_Data1Out;
    wire[31:0] RegisterFile_Data2Out;
>>>>>>> e7caab919607f42aac18ce0c961f2bf754f465d5
    wire [31:0] portOut;
    RegisterFile myRegisterFile(
        .clkIn(Clk_CPU),
        .resetIn(rstn),
<<<<<<< HEAD
        .Register1(IFID_InsOut[19:15]),
        .Register2(IFID_InsOut[24:20]),
        .RegisterDestination(MEMWB_rdOut),
        .WriteData(WriteBackMUX_DataOut),
        .RegisterWrite(MEMWB_RegisterWriteOut),
=======
        .Register1(IMem_InsOut[19:15]),
        .Register2(IMem_InsOut[24:20]),
        .RegisterDestination(IMem_InsOut[11:7]),
        .WriteData(WriteBackMUX_DataOut),
        .RegisterWrite(Controller_RegisterWrite),
>>>>>>> e7caab919607f42aac18ce0c961f2bf754f465d5
        .ReadData1(RegisterFile_Data1Out),
        .ReadData2(RegisterFile_Data2Out),
        .portOut(portOut)
        );

    // ImmGen
    wire[31:0] ImmGen_Imm32Out;
    ImmGen myImmGen(
<<<<<<< HEAD
        .Instruction(IFID_InsOut),
        .Imm32Out(ImmGen_Imm32Out)
        );
    
    // ID/EX
    // Control
    wire [2:0] IDEX_AddressSelectOut;
    wire IDEX_MemWriteOut;
    wire IDEX_MemReadOut;
    wire [2:0] IDEX_ALUOperationOut;
    wire IDEX_ALUDataSelectOut;
    wire [1:0] IDEX_RegisterDataSelectOut;
    wire IDEX_RegisterWriteOut;
    // Data
    wire [31:0] IDEX_Data1Out;
    wire [31:0] IDEX_Data2Out;
    wire [31:0] IDEX_Imm32Out;
    wire [31:0] IDEX_AddressOut;
    wire [4:0] IDEX_rdOut;
    IDEX myIDEX(
        .clkIn(Clk_CPU),
        .resetIn(rstn),
        
        // ControlIn
        .AddressSelectIn(Controller_AddressSelectOut),
        .MemWriteIn(Controller_MemWriteOut),
        .MemReadIn(Controller_MemReadOut),
        .ALUOperationIn(Controller_ALUOperationOut),
        .ALUDataSelectIn(Controller_ALUDataSelectOut),
        .RegisterDataSelectIn(Controller_RegisterDataSelectOut),
        .RegisterWriteIn(Controller_RegisterWriteOut),
        
        // DataIn
        .Data1In(RegisterFile_Data1Out),
        .Data2In(RegisterFile_Data2Out),
        .Imm32In(ImmGen_Imm32Out),
        .AddressIn(IFID_AddressOut),
        .rdIn(),//?
        
        // ControlOut
        .AddressSelectOut(IDEX_AddressSelectOut),
        .MemWriteOut(IDEX_MemWriteOut),
        .MemReadOut(IDEX_MemReadOut),
        .ALUOperationOut(IDEX_ALUOperationOut),
        .ALUDataSelectOut(IDEX_ALUDataSelectOut),
        .RegisterDataSelectOut(IDEX_RegisterDataSelectOut),
        .RegisterWriteOut(IDEX_RegisterWriteOut),
        
        // DataOut
        .Data1Out(IDEX_Data1Out),
        .Data2Out(IDEX_Data2Out),
        .Imm32Out(IDEX_Imm32Out),
        .AddressOut(IDEX_AddressOut),
        .rdOut(IDEX_rdOut)
        );
    
    //ALUDataMUX
    wire [31:0] ALUDataMUX_DataOut;
    ALUDataMUX myALUDataMUX(
        .RegisterData2(IDEX_Data2Out),
        .Imm32(IDEX_Imm32Out),
        .ALUDataSelect(IDEX_ALUDataSelectOut),
=======
        .Instruction(IMem_InsOut),
        .Imm32Out(ImmGen_Imm32Out)
        );

    //ALUDataMUX
    ALUDataMUX myALUDataMUX(
        .RegisterData2(RegisterFile_Data2Out),
        .Imm32(ImmGen_Imm32Out),
        .ALUDataSelect(Controller_ALUDataSelect),
>>>>>>> e7caab919607f42aac18ce0c961f2bf754f465d5
        .ALUData2Out(ALUDataMUX_DataOut)
        );

    // ALU
    wire ALU_LessOut;
    wire ALU_ZeroOut;
    wire[31:0] ALU_ResultOut;
    ALU myALU(
<<<<<<< HEAD
        .ALUData1(IDEX_Data1Out),
        .ALUDtat2(ALUDataMUX_DataOut),
        .ALUOperation(IDEX_ALUOperationOut),
=======
        .ALUData1(RegisterFile_Data1Out),
        .ALUDtat2(ALUDataMUX_DataOut),
        .ALUOperation(Controller_ALUOperation),
>>>>>>> e7caab919607f42aac18ce0c961f2bf754f465d5
        .ALULess(ALU_LessOut),
        .ALUZero(ALU_ZeroOut),
        .ALUResult(ALU_ResultOut)
        );

    // PCPlusOffset
    wire[31:0] PCPlusOffset_AddressOut;
    PCPlusOffset myPCPlusOffset(
<<<<<<< HEAD
        .offsetIn(IDEX_Imm32Out),
        .AddressIn(IDEX_AddressOut),
=======
        .offsetIn(ImmGen_Imm32Out),
        .AddressIn(PC_AddressOut),
>>>>>>> e7caab919607f42aac18ce0c961f2bf754f465d5
        .AddressOut(PCPlusOffset_AddressOut)
        );

    // PCPlusOne
<<<<<<< HEAD
    wire[31:0] RetAddressAdder_AddressOut;
    PCPlusOne myRetAddressAdder(
        .AddressIn(IDEX_AddressOut),
        .AddressOut(RetAddressAdder_AddressOut)
        );
    
    //EX/MEM
    // Control
    wire [2:0] EXMEM_AddressSelectOut;
    wire EXMEM_MemWriteOut;
    wire EXMEM_MemReadOut;
    wire [1:0] EXMEM_RegisterDataSelectOut;
    wire EXMEM_RegisterWriteOut;
    // Data
    wire EXMEM_LessOut;
    wire EXMEM_ZeroOut;
    wire [31:0] EXMEM_ResultOut;
    wire [31:0] EXMEM_DataOut;
    wire [31:0] EXMEM_Imm32Out;
    wire [31:0] EXMEM_PCRelAddressOut;
    wire [31:0] EXMEM_RetAddressOut;
    wire [4:0] EXMEM_rdOut;
    EXMEM myEXMEM(
        .clkIn(Clk_CPU),
        .resetIn(rstn),
        
        // ControlIn
        .AddressSelectIn(IDEX_AddressSelectOut),
        .MemWriteIn(IDEX_MemWriteOut),
        .MemReadIn(IDEX_MemReadOut),
        .RegisterDataSelectIn(IDEX_RegisterDataSelectOut),
        .RegisterWriteIn(IDEX_RegisterWriteOut),
        
        // DataIn
        .ALULessIn(ALU_LessOut),
        .ALUZeroIn(ALU_ZeroOut),
        .ALUResultIn(ALU_ResultOut),
        .Data2In(IDEX_Data2Out),
        .Imm32In(IDEX_Imm32Out),
        .PCRelAddressIn(PCPlusOffset_AddressOut),
        .retAddressIn(RetAddressAdder_AddressOut),
        .rdIn(IDEX_rdOut),
        
        // ControlOut
        .AddressSelectOut(EXMEM_AddressSelectOut),
        .MemWriteOut(EXMEM_MemWriteOut),
        .MemReadOut(EXMEM_MemReadOut),
        .RegisterDataSelectOut(EXMEM_RegisterDataSelectOut),
        .RegisterWriteOut(EXMEM_RegisterWriteOut),
        
        // DataOut
        .ALULessOut(EXMEM_LessOut),
        .ALUZeroOut(EXMEM_ZeroOut),
        .ALUResultOut(EXMEM_ResultOut),
        .DataOut(EXMEM_DataOut),
        .Imm32Out(EXMEM_Imm32Out),
        .PCRelAddressOut(EXMEM_PCRelAddressOut),
        .retAddressOut(EXMEM_RetAddressOut),
        .rdOut(EXMEM_rdOut)
        );
    
    // AddressMUX
    // assign PC_AddrIn = AddressMUX_AddressOut;
    AddressMUX myAddressMUX(
        .ALULess(EXMEM_LessOut),
        .ALUZero(EXMEM_ZeroOut),
        .ALUResult(EXMEM_ResultOut),
        .PCPlusOffset(EXMEM_PCRelAddressOut),
        .PCPlusOne(SeqAddressAdder_AddressOut),
        .AddressSelect(EXMEM_AddressSelectOut),
=======
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
>>>>>>> e7caab919607f42aac18ce0c961f2bf754f465d5
        .AddressOut(AddressMUX_AddressOut)
        );

    // DataMemory
    wire[31:0] DataMemory_DataOut;
    DataMemory myDataMemory(
        .clkIn(Clk_CPU),
        .resetIn(rstn),
<<<<<<< HEAD
        .AddressIn(EXMEM_ResultOut),
        .WriteData(EXMEM_DataOut),
        .MemRead(EXMEM_MemReadOut),
        .MemWrite(EXMEM_MemWriteOut),
        .ReadData(DataMemory_DataOut)
        );
    
    // MEM/WB
    wire [1:0] MEMWB_RegisterDataSelectOut;
    
    wire [31:0] MEMWB_ResultOut;
    wire [31:0] MEMWB_DataOut;
    wire [31:0] MEMWB_Imm32Out;
    wire [31:0] MEMWB_RetAddressOut;
    
    MEMWB myMEMWB(
        .clkIn(Clk_CPU),
        .resetIn(rstn),
        
        // ControlIn
        .RegisterDataSelectIn(EXMEM_RegisterDataSelectOut),
        .RegisterWriteIn(EXMEM_RegisterWriteOut),
        
        // DataIn
        .ALUResultIn(EXMEM_ResultOut),
        .DataIn(DataMemory_DataOut),
        .Imm32In(EXMEM_Imm32Out),
        .retAddressIn(EXMEM_RetAddressOut),
        .rdIn(EXMEM_rdOut),
        
        // ControlOut
        .RegisterDataSelectOut(MEMWB_RegisterDataSelectOut),
        .RegisterWriteOut(MEMWB_RegisterWriteOut),
        
        // DataOut
        .ALUResultOut(MEMWB_ResultOut),
        .DataOut(MEMWB_DataOut),
        .Imm32Out(MEMWB_Imm32Out),
        .retAddressOut(MEMWB_RetAddressOut),
        .rdOut(MEMWB_rdOut)
        );
    
    
    // WriteBackMUX
    WriteBackMUX myWriteBackMUX(
        .ALUResult(MEMWB_ResultOut),
        .Imm32(MEMWB_Imm32Out),
        .MemData(MEMWB_DataOut),
        .Address(MEMWB_RetAddressOut),
        .RegisterDataSelect(MEMWB_RegisterDataSelectOut),
=======
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
>>>>>>> e7caab919607f42aac18ce0c961f2bf754f465d5
        .RegisterData(WriteBackMUX_DataOut)
        );
        
    // seg7x16
    seg7x16 mySeg7x16(
        .clk(clk),
        .rstn(rstn),
        .disp_mode(1'b0),
        .i_data(portOut),
        .o_seg(disp_seg_o),
        .o_sel(disp_an_o)
        );
endmodule
