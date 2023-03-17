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
    input [31:0] Data2In.
    input [31:0] Imm32In,
    input [31:0] PCRelAddressIn,
    input [31:0] retAddressIn,
    input [4:0] rdIn,
    //control
    output reg [2:0] AddressSelectOut,
    output reg MemWriteOut,
    output reg MemReadOut,
    output reg [1:0] RegisterDataSelectOut,
    output reg RegisterWriteOut,

    output reg ALULessOut,
    output reg ALUZeroOut,
    output reg [31:0] ALUResultOut,
    output reg [31:0] Data2Out,
    output reg [31:0] Imm32Out,
    output reg [31:0] PCRelAddressOut,
    output reg [31:0] retAddressOut,
    output reg [4:0] rdIn
    );
    always @(posedge clk, negedge resetIn) begin
        if (!resetIn) begin
            //control
            AddressSelectOut <= 0;
            MemWriteOut <= 0;
            MemReadOut <= 0;
            RegisterDataSelectOut <= 0;
            RegisterWriteOut <= 0;

            ALULessOut <= 0;
            ALUZeroOut <= 0;
            ALUResultOut <= 0;
            Data2Out <= 0;
            Imm32Out <= 0;
            PCRelAddressOut <= 0;
            retAddressOut <= 0;
            rdOut <= 0;
        end
        else begin
            //control
            AddressSelectOut <= AddressSelectIn;
            MemWriteOut <= MemWriteIn;
            MemReadOut <= MemReadIn;
            RegisterDataSelectOut <= RegisterDataSelectIn;
            RegisterWriteOut <= RegisterWriteIn;

            ALULessOut <= ALULessIn;
            ALUZeroOut <= ALUZeroIn;
            ALUResultOut <= ALUResultIn;
            Data2Out <= Data2In;
            Imm32Out <= Imm32In;
            PCRelAddressOut <= PCRelAddressIn;
            retAddressOut <= retAddressIn;
            rdOut <= rdIn;
        end
    end
endmodule
