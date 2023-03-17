module MEMWB(
    input clkIn,
    input resetIn,

    // control
    input [1:0] RegisterDataSelectIn,
    input RegisterWriteIn,

    input [31:0] ALUResultIn,
    input [31:0] Data2In.
    input [31:0] Imm32In,
    input [31:0] retAddressIn,
    input [4:0] rdIn,
    //control
    output reg [1:0] RegisterDataSelectOut,
    output reg RegisterWriteOut,

    output reg [31:0] ALUResultOut,
    output reg [31:0] Data2Out,
    output reg [31:0] Imm32Out,
    output reg [31:0] retAddressOut,
    output reg [4:0] rdIn
    );
    always @(posedge clk, negedge resetIn) begin
        if (!resetIn) begin
            //control
            RegisterDataSelectOut <= 0;
            RegisterWriteOut <= 0;


            ALUResultOut <= 0;
            Data2Out <= 0;
            Imm32Out <= 0;
            retAddressOut <= 0;
            rdOut <= 0;
        end
        else begin
            //control
            RegisterDataSelectOut <= RegisterDataSelectIn;
            RegisterWriteOut <= RegisterWriteIn;

            ALUResultOut <= ALUResultIn;
            Data2Out <= Data2In;
            Imm32Out <= Imm32In;
            retAddressOut <= retAddressIn;
            rdOut <= rdIn;
        end
    end
endmodule
