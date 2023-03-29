`timescale 1ns / 1ps

module Computer(
    input clk, //from outside
    input rstn, //from outside
    input [15:0] sw_i,
    output [7:0] disp_seg_o,
    output [7:0] disp_an_o
    );
    
    reg[31:0]clkdiv;
    wire Clk_CPU;
    
    always @(posedge clk or negedge rstn) begin
    if(!rstn) clkdiv <= 0;
    else clkdiv <= clkdiv + 1'b1;
    end
    
    assign Clk_CPU = sw_i[15]? clkdiv[25]: clkdiv[0];
    
    // PC
    wire[31:0] AddressMUX_AddressOut; 
    wire[31:0] PC_AddressOut;
    wire Stall_StallOut;
    wire Flush_FlushOut;
    PC myPC(
        .clkIn(Clk_CPU),
        .resetIn(rstn),
        .AddressIn(AddressMUX_AddressOut),
        .StallIn(Stall_StallOut),
        .FlushIn(Flush_FlushOut),
        .AddressOut(PC_AddressOut)
        );

    // IMem
    wire[31:0] IMem_InsOut;
    IMem myIMem(
        .AddressIn(PC_AddressOut),
        .InstructionOut(IMem_InsOut)
        );
    
    // SeqAddressAdder
    wire[31:0] SeqAddressAdder_AddressOut;
    PCPlusOne SeqAddressAdder(
        .AddressIn(PC_AddressOut),
        .AddressOut(SeqAddressAdder_AddressOut)
        );
    
    // IF/ID
    wire [31:0] IFID_InsOut;
    wire [31:0] IFID_AddressOut;
    wire [4:0] IFID_rs1;
    wire [4:0] IFID_rs2;
    IFID myIFID(
        .clkIn(Clk_CPU),
        .resetIn(rstn),
        .InstructionIn(IMem_InsOut),
        .AddressIn(PC_AddressOut),
        
        .StallIn(Stall_StallOut),
        .FlushIn(Flush_FlushOut),
        .rs1Out(IFID_rs1),
        .rs2Out(IFID_rs2),
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
        );

    
    // RegisterFile
    wire [31:0] WriteBackMUX_DataOut;
    wire [4:0] MEMWB_rdOut;
    wire MEMWB_RegisterWriteOut;
    wire [31:0] RegisterFile_Data1Out;
    wire [31:0] RegisterFile_Data2Out;
    wire [31:0] portOut;
    RegisterFile myRegisterFile(
        .clkIn(Clk_CPU),
        .resetIn(rstn),
        .Register1(IFID_InsOut[19:15]),
        .Register2(IFID_InsOut[24:20]),
        .RegisterDestination(MEMWB_rdOut),
        .WriteData(WriteBackMUX_DataOut),
        .RegisterWrite(MEMWB_RegisterWriteOut),
        .AddressIn(PC_AddressOut),
        .sw_i(sw_i),
        .ReadData1(RegisterFile_Data1Out),
        .ReadData2(RegisterFile_Data2Out),
        .portOut(portOut)
        );

    // ImmGen
    wire[31:0] ImmGen_Imm32Out;
    ImmGen myImmGen(
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
    wire [4:0] IDEX_rs1Out;
    wire [4:0] IDEX_rs2Out;
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
        .rs1In(IFID_InsOut[19:15]),
        .rs2In(IFID_InsOut[24:20]),
        .rdIn(IFID_InsOut[11:7]),
        
        .StallIn(Stall_StallOut),
        .FlushIn(Flush_FlushOut),
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
        .rs1Out(IDEX_rs1Out),
        .rs2Out(IDEX_rs2Out),
        .rdOut(IDEX_rdOut)
        );
    
    
    //ALUDataMUX
    wire [31:0] ALUDataMUX_DataOut;
    wire [31:0] FWDMUX_Data2Out;
    ALUDataMUX myALUDataMUX(
        .RegisterData2(FWDMUX_Data2Out),
        .Imm32(IDEX_Imm32Out),
        .ALUDataSelect(IDEX_ALUDataSelectOut),
        .ALUData2Out(ALUDataMUX_DataOut)
        );

    // ALU
    wire ALU_LessOut;
    wire ALU_ZeroOut;
    wire[31:0] ALU_ResultOut;
    wire [31:0] FWDMUX_Data1Out;
    ALU myALU(
        .ALUData1(FWDMUX_Data1Out),
        .ALUDtat2(ALUDataMUX_DataOut),
        .ALUOperation(IDEX_ALUOperationOut),
        .ALULess(ALU_LessOut),
        .ALUZero(ALU_ZeroOut),
        .ALUResult(ALU_ResultOut)
        );

    // PCPlusOffset
    wire[31:0] PCPlusOffset_AddressOut;
    PCPlusOffset myPCPlusOffset(
        .offsetIn(IDEX_Imm32Out),
        .AddressIn(IDEX_AddressOut),
        .AddressOut(PCPlusOffset_AddressOut)
        );

    // PCPlusOne
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
        
        .FlushIn(Flush_FlushOut),
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
        .AddressOut(AddressMUX_AddressOut)
        );

    // DataMemory
    wire[31:0] DataMemory_DataOut;
    DataMemory myDataMemory(
        .clkIn(Clk_CPU),
        .resetIn(rstn),
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
        .RegisterData(WriteBackMUX_DataOut)
        );
        
    // FWD
    wire [2:0] FWD_ForwardAOut;
    wire [2:0] FWD_ForwardBOut;
    FWD myFWD(
        .IDEXrs1In(IDEX_rs1Out),
        .IDEXrs2In(IDEX_rs2Out),
        .EXMEMrdIn(EXMEM_rdOut),
        .EXMEMRegisterWriteIn(EXMEM_RegisterWriteOut),
        .EXMEMDataSelectorIn(EXMEM_RegisterDataSelectOut),
        .MEMWBrdIn(MEMWB_rdOut),
        .MEMWBRegisterWriteIn(MEMWB_RegisterWriteOut),
        .ForwardAOut(FWD_ForwardAOut),
        .ForwardBOut(FWD_ForwardBOut)
        );

    // FWDMUX
    FWDMUX myFWDMUX(
        .IDEXRegisterData1In(IDEX_Data1Out),
        .IDEXRegisterData2In(IDEX_Data2Out),
        .EXMEMALUResultIn(EXMEM_ResultOut),
        .EXMEMImm32In(EXMEM_Imm32Out),
        .EXMEMRetAddressIn(EXMEM_RetAddressOut),
        .WriteBackMUXIn(WriteBackMUX_DataOut),
        .ForwardAIn(FWD_ForwardAOut),
        .ForwardBIn(FWD_ForwardBOut),
        .RegisterData1Out(FWDMUX_Data1Out),
        .RegisterData2Out(FWDMUX_Data2Out)
        );
        
    // Stall
    Stall myStall(
        .IFIDrs1In(IFID_rs1),
        .IFIDrs2In(IFID_rs2),
        .IDEXrdIn(IDEX_rdOut),
        .IDEXMemReadIn(IDEX_MemReadOut),
        .EXMEMRegisterWriteIn(EXMEM_RegisterWriteOut),
        .EXMEMrdIn(EXMEM_rdOut),
        .StallOut(Stall_StallOut)
        );
        
    // Flush
    Flush myFlush(
        .ALULessIn(EXMEM_LessOut),
        .ALUZeroIn(EXMEM_ZeroOut),
        .EXMEMAddressSelectorIn(EXMEM_AddressSelectOut),
        .FlushOut(Flush_FlushOut)
        );
        
    //16to10
    wire [31:0] DataTen;
    SixteenToTen mySixteenToTen(
        .num(portOut),
        .numConverted(DataTen)
        );
    // seg7x16
    seg7x16 mySeg7x16(
        .clk(clk),
        .rstn(rstn),
        .disp_mode(1'b0),
        .i_data(DataTen),
        .sw_i(sw_i),
        .o_seg(disp_seg_o),
        .o_sel(disp_an_o)
        );
endmodule
