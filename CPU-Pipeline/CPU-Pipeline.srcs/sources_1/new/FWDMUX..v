module FWDMUX(
    input [31:0] IDEXRegisterData1In,
    input [31:0] IDEXRegisterData2In,
    input [31:0] EXMEMALUResultIn,
    input [31:0] EXMEMImm32In,
    input [31:0] EXMEMRetAddressIn,
    input [31:0] WriteBackMUXIn,

    input [2:0] ForwardAIn,
    input [2:0] ForwardBIn,
    
    output reg [31:0] RegisterData1Out,
    output reg [31:0] RegisterData2Out //
);
    //ALUData1
    always @(IDEXRegisterData1In,EXMEMALUResultIn,EXMEMImm32In,
                EXMEMRetAddressIn,WriteBackMUXIn,ForwardAIn) begin
        if(ForwardAIn == 0) begin // IDEXALUResult
            RegisterData1Out = IDEXRegisterData1In;
        end
        else if(ForwardAIn == 1) begin // EXMEM ALUResult
            RegisterData1Out = EXMEMALUResultIn;
        end
        else if(ForwardAIn == 2) begin // IMM
            RegisterData1Out = EXMEMImm32In;
        end
        else if(ForwardAIn == 3) begin // Address
            RegisterData1Out = EXMEMRetAddressIn;
        end
        else if(ForwardAIn == 4) begin // WBData
            RegisterData1Out = WriteBackMUXIn;
        end
        else begin
            RegisterData1Out = 0;
        end
    end

    //ALUData2
    always @(IDEXRegisterData2In,EXMEMALUResultIn,EXMEMImm32In,
                EXMEMRetAddressIn,WriteBackMUXIn,ForwardBIn) begin
        if(ForwardBIn == 0) begin
            RegisterData2Out = IDEXRegisterData2In;
        end
        else if(ForwardBIn == 1) begin
            RegisterData2Out = EXMEMALUResultIn;
        end
        else if(ForwardBIn == 2) begin
            RegisterData2Out = EXMEMImm32In;
        end
        else if(ForwardBIn == 3) begin
            RegisterData2Out = EXMEMRetAddressIn;
        end
        else if(ForwardBIn == 4) begin
            RegisterData2Out = WriteBackMUXIn;
        end
        else begin
            RegisterData2Out = 0;
        end
    end
endmodule