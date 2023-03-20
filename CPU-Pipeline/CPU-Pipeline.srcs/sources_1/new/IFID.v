module IFID(
    input clkIn,
    input resetIn,
    input [31:0] InstructionIn, //from IMem
    input [31:0] AddressIn, //from PC
    output reg [31:0] InstructionOut, //to Controller,Reg,ImmGen,IDEX
    output reg [31:0] AddressOut //to IDEX
);
    always @(posedge clkIn, negedge resetIn) begin
        if (!resetIn) begin
            InstructionOut <= 0;
            AddressOut <= 0;
        end
        else begin
            InstructionOut <= InstructionIn;
            AddressOut <= AddressIn;
        end
    end
endmodule