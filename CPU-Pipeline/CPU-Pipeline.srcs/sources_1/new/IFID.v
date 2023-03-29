module IFID(
    input clkIn,
    input resetIn,
    input [31:0] InstructionIn,
    input [31:0] AddressIn,
    input FlushIn,
    input StallIn,
    output reg [4:0] rs1Out,
    output reg [4:0] rs2Out,
    output reg [31:0] InstructionOut,
    output reg [31:0] AddressOut
);
    reg [4:0] rs1;
    reg [4:0] rs2;
    reg [31:0] Instruction;
    reg [31:0] Address;
    always @(posedge clkIn, negedge resetIn) begin
        if (!resetIn) begin
            Instruction <= 0;
            Address <= 0;
            rs1 <= 0;
            rs2 <= 0;
        end
        else if(FlushIn == 1)begin
            Instruction <= 0;
            Address <= 0;
            rs1 <= 0;
            rs2 <= 0;
        end
        else if(StallIn == 0) begin
            Instruction <= InstructionIn;
            Address <= AddressIn;
            rs1 <= InstructionIn[19:15];
            rs2 <= InstructionIn[24:20];
        end
    end
    always @(negedge clkIn) begin
        InstructionOut <= Instruction;
        AddressOut <= Address;
        rs1Out <= rs1;
        rs2Out <= rs2;
    end
endmodule