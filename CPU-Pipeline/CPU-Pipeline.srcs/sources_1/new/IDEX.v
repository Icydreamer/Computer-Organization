module IDEX(
    input clkIn,
    input resetIn,

    // control
    input [2:0] AddressSelectIn,
    input MemWriteIn,
    input MemReadIn,
    input [2:0] ALUOperationIn,
    input ALUDataSelectIn,
    input [1:0] RegisterDataSelectIn,
    input RegisterWriteIn,

    input [31:0] Data1In,
    input [31:0] Data2In,
    input [31:0] Imm32In,
    input [31:0] AddressIn,
    input [4:0] rdIn,

    //control
    output reg [2:0] AddressSelectOut,
    output reg MemWriteOut,
    output reg MemReadOut,
    output reg [2:0] ALUOperationOut,
    output reg ALUDataSelectOut,
    output reg [1:0] RegisterDataSelectOut,
    output reg RegisterWriteOut,

    output reg [31:0] Data1Out,
    output reg [31:0] Data2Out,
    output reg [31:0] Imm32Out,
    output reg [31:0] AddressOut,
    output reg [4:0] rdOut//
    );
    always @(posedge clk, negedge resetIn) begin
        if (!resetIn) begin
            //control
            AddressSelectOut <= 0;
            MemWriteOut <= 0;
            MemReadOut <= 0;
            ALUOperationOut <= 0;
            ALUDataSelectOut <= 0;
            RegisterDataSelectOut <= 0;
            RegisterWriteOut <= 0;

            Data1Out <= 0;
            Data2Out <= 0;
            Imm32Out <= 0;
            AddressOut <= 0;
            rdOut <= 0;
        end
        else begin
            //control
            AddressSelectOut <= AddressSelectIn;
            MemWriteOut <= MemWriteIn;
            MemReadOut <= MemReadIn;
            ALUOperationOut <= ALUOperationIn;
            ALUDataSelectOut <= AddressSelectIn;
            RegisterDataSelectOut <= RegisterDataSelectIn;
            RegisterWriteOut <= RegisterWriteIn;

            Data1Out <= Data1In;
            Data2Out <= Data2In;
            Imm32Out <= Imm32In;
            AddressOut <= AddressIn;
            rdOut <= rdIn;
        end
    end
endmodule
