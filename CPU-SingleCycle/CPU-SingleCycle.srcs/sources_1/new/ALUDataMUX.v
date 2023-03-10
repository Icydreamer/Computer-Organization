module ALUDataMUX(
    input [31:0] RegisterData2;
    input [31:0] Imm32;
    input ALUDataSelect;
    output [31:0] ALUData2;
);
    assign ALUData2 = ALUDataSelect? RegisterData2: Imm32;
endmodule