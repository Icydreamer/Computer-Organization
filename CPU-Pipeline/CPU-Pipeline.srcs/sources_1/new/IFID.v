module IFID(
    input clkIn,
    input resetIn,
    input [31:0] InstructionIn, //from IMem
<<<<<<< HEAD
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
=======
    input 31:0] AddressIn, //from PC
    output reg [31:0] InstructionOut, //to Controller,Reg,ImmGen,IDEX
    output reg [31:0] AddressOut //to IDEX
);
    always @(posedge clk, negedge resetIn) begin
        if (!resetIn) begin
            InsOut <= 0;
            AddrOut <= 0;
        end
        else begin
            InsOut <= InsIn;
            AddrOut <= AddrIn;
>>>>>>> e7caab919607f42aac18ce0c961f2bf754f465d5
        end
    end
endmodule