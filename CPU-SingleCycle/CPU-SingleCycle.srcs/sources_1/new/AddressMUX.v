module AddressMUX(
    input ALULess;
    input ALUZero;
    input ALUResult;
    input [31:0] PCPlusOffset;
    input [31:0] PCPlusOne;
    output reg [31:0] Address;
);

endmodule