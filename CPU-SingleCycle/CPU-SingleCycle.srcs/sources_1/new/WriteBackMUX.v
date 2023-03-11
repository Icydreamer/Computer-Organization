module WriteBackMUX(
    input [31:0] ALUResult,
    input [31:0] Imm32,
    input [31:0] MemData,
    input [31:0] Address,
    input RegisterWrite,
    output reg [31:0] RegisterData
);

    always @(*) begin
        if (RegisterWrite==0) RegisterData <= ALUResult;
        else if (RegisterWrite== 2'b01) RegisterData <= Imm32;
        else if (RegisterWrite== 2'b10) RegisterData <= MemData;
        else if(RegisterWrite == 2'b11)RegisterData <= Address;
    end
endmodule