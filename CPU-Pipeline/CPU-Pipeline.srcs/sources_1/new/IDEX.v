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
    input [4:0] rs1In,
    input [4:0] rs2In,
    input [4:0] rdIn,

    input FlushIn,
    input StallIn,
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
    output reg [4:0] rs1Out,
    output reg [4:0] rs2Out,
    output reg [4:0] rdOut
    );
    reg [2:0] AddressSelect;
    reg MemWrite;
    reg MemRead;
    reg [2:0] ALUOperation;
    reg ALUDataSelect;
    reg [1:0] RegisterDataSelect;
    reg RegisterWrite;
    
    reg [31:0] Data1;
    reg [31:0] Data2;
    reg [31:0] Imm32;
    reg [31:0] Address;
    reg [4:0] rs1;
    reg [4:0] rs2;
    reg [4:0] rd;
    always @(posedge clkIn, negedge resetIn) begin
        if (!resetIn) begin
            //control
            AddressSelect <= 0;
            MemWrite <= 0;
            MemRead <= 0;
            ALUOperation <= 0;
            ALUDataSelect <= 0;
            RegisterDataSelect <= 0;
            RegisterWrite <= 0;

            Data1 <= 0;
            Data2 <= 0;
            Imm32 <= 0;
            Address <= 0;
            rs1 <= 0;
            rs2 <= 0;
            rd <= 0;
        end
        else if(FlushIn == 1) begin
            //control
            AddressSelect <= 0;
            MemWrite <= 0;
            MemRead <= 0;
            ALUOperation <= 0;
            ALUDataSelect <= 0;
            RegisterDataSelect <= 0;
            RegisterWrite <= 0;

            Data1 <= 0;
            Data2 <= 0;
            Imm32 <= 0;
            Address <= 0;
            rs1 <= 0;
            rs2 <= 0;
            rd <= 0;
        end
        else if(StallIn == 0) begin
            //control
            AddressSelect <= AddressSelectIn;
            MemWrite <= MemWriteIn;
            MemRead <= MemReadIn;
            ALUOperation <= ALUOperationIn;
            ALUDataSelect <= AddressSelectIn;
            RegisterDataSelect <= RegisterDataSelectIn;
            RegisterWrite <= RegisterWriteIn;

            Data1 <= Data1In;
            Data2 <= Data2In;
            Imm32 <= Imm32In;
            Address <= AddressIn;
            rs1 <= rs1In;
            rs2 <= rs2In;
            rd <= rdIn;
        end
        else begin
            AddressSelect <= 0;
            MemWrite <= 0;
            MemRead <= 0;
            ALUOperation <= 0;
            ALUDataSelect <= 0;
            RegisterDataSelect <= 0;
            RegisterWrite <= 0;
            
            Data1 <= 0;
            Data2 <= 0;
            Imm32 <= 0;
            Address <= 0;
            rs1 <= 0;
            rs2 <= 0;
            rd <= 0;
        end
    end
    always @(negedge clkIn) begin
        AddressSelectOut <= AddressSelect;
        MemWriteOut <= MemWrite;
        MemReadOut <= MemRead;
        ALUOperationOut <= ALUOperation;
        ALUDataSelectOut <= AddressSelect;
        RegisterDataSelectOut <= RegisterDataSelect;
        RegisterWriteOut <= RegisterWrite;

        Data1Out <= Data1;
        Data2Out <= Data2;
        Imm32Out <= Imm32;
        AddressOut <= Address;
        rs1Out <= rs1;
        rs2Out <= rs2;
        rdOut <= rd;
    end
endmodule
