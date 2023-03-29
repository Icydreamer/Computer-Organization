module EXMEM(
    input clkIn,
    input resetIn,

    // control
    input [2:0] AddressSelectIn,
    input MemWriteIn,
    input MemReadIn,
    input [1:0] RegisterDataSelectIn,
    input RegisterWriteIn,

    input ALULessIn,
    input ALUZeroIn,
    input [31:0] ALUResultIn,
    input [31:0] Data2In,
    input [31:0] Imm32In,
    input [31:0] PCRelAddressIn,
    input [31:0] retAddressIn,
    input [4:0] rdIn,

    input FlushIn,
    //control
    output reg [2:0] AddressSelectOut,
    output reg MemWriteOut,
    output reg MemReadOut,
    output reg [1:0] RegisterDataSelectOut,
    output reg RegisterWriteOut,

    output reg ALULessOut,
    output reg ALUZeroOut,
    output reg [31:0] ALUResultOut,
    output reg [31:0] DataOut,
    output reg [31:0] Imm32Out,
    output reg [31:0] PCRelAddressOut,
    output reg [31:0] retAddressOut,
    output reg [4:0] rdOut
    );
    reg [2:0] AddressSelect;
    reg MemWrite;
    reg MemRead;
    reg [1:0] RegisterDataSelect;
    reg RegisterWrite;
    
    reg ALULess;
    reg ALUZero;
    reg [31:0] ALUResult;
    reg [31:0] Data;
    reg [31:0] Imm32;
    reg [31:0] PCRelAddress;
    reg [31:0] retAddress;
    reg [4:0] rd;
    always @(posedge clkIn, negedge resetIn) begin
        if (!resetIn) begin
            //control
            AddressSelect <= 0;
            MemWrite <= 0;
            MemRead <= 0;
            RegisterDataSelect <= 0;
            RegisterWrite <= 0;

            ALULess <= 0;
            ALUZero <= 0;
            ALUResult <= 0;
            Data <= 0;
            Imm32 <= 0;
            PCRelAddress <= 0;
            retAddress <= 0;
            rd <= 0;
        end
        else if(FlushIn == 1) begin
            //control
            AddressSelect <= 0;
            MemWrite <= 0;
            MemRead <= 0;
            RegisterDataSelect <= 0;
            RegisterWrite <= 0;

            ALULess <= 0;
            ALUZero <= 0;
            ALUResult <= 0;
            Data <= 0;
            Imm32 <= 0;
            PCRelAddress <= 0;
            retAddress <= 0;
            rd <= 0;
        end
        else begin
            //control
            AddressSelect <= AddressSelectIn;
            MemWrite <= MemWriteIn;
            MemRead <= MemReadIn;
            RegisterDataSelect <= RegisterDataSelectIn;
            RegisterWrite <= RegisterWriteIn;

            ALULess <= ALULessIn;
            ALUZero <= ALUZeroIn;
            ALUResult <= ALUResultIn;
            Data <= Data2In;
            Imm32 <= Imm32In;
            PCRelAddress <= PCRelAddressIn;
            retAddress <= retAddressIn;
            rd <= rdIn;
        end
    end
    always @(negedge clkIn) begin
         //control
            AddressSelectOut <= AddressSelect;
            MemWriteOut <= MemWrite;
            MemReadOut <= MemRead;
            RegisterDataSelectOut <= RegisterDataSelect;
            RegisterWriteOut <= RegisterWrite;

            ALULessOut <= ALULess;
            ALUZeroOut <= ALUZero;
            ALUResultOut <= ALUResult;
            DataOut <= Data;
            Imm32Out <= Imm32;
            PCRelAddressOut <= PCRelAddress;
            retAddressOut <= retAddress;
            rdOut <= rdIn;
    end
endmodule
