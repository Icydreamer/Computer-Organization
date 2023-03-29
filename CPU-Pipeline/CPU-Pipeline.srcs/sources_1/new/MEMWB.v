module MEMWB(
    input clkIn,
    input resetIn,

    // control
    input [1:0] RegisterDataSelectIn,
    input RegisterWriteIn,

    input [31:0] ALUResultIn,
    input [31:0] DataIn,
    input [31:0] Imm32In,
    input [31:0] retAddressIn,
    input [4:0] rdIn,
    //control
    output reg [1:0] RegisterDataSelectOut,
    output reg RegisterWriteOut,

    output reg [31:0] ALUResultOut,
    output reg [31:0] DataOut,
    output reg [31:0] Imm32Out,
    output reg [31:0] retAddressOut,
    output reg [4:0] rdOut
    );
    reg [1:0] RegisterDataSelect;
    reg RegisterWrite;

    reg [31:0] ALUResult;
    reg [31:0] Data;
    reg [31:0] Imm32;
    reg [31:0] retAddress;
    reg [4:0] rd;
    always @(posedge clkIn, negedge resetIn) begin
        if (!resetIn) begin
            //control
            RegisterDataSelect <= 0;
            RegisterWrite <= 0;


            ALUResult <= 0;
            Data <= 0;
            Imm32 <= 0;
            retAddress <= 0;
            rd <= 0;
        end
        else begin
            //control
            RegisterDataSelect <= RegisterDataSelectIn;
            RegisterWrite <= RegisterWriteIn;

            ALUResult <= ALUResultIn;
            Data <= DataIn;
            Imm32 <= Imm32In;
            retAddress <= retAddressIn;
            rd <= rdIn;
        end
    end
    always @(negedge clkIn) begin
        //control
        RegisterDataSelectOut <= RegisterDataSelect;
        RegisterWriteOut <= RegisterWrite;

        ALUResultOut <= ALUResult;
        DataOut <= Data;
        Imm32Out <= Imm32;
        retAddressOut <= retAddress;
        rdOut <= rd;
    end
endmodule
