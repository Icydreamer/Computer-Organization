module PCPlusOffset(
    input [31:0] offsetIn;
    input [31:0] AddressIn;
    output [31:0] AddressOut;
);
    assign AddressOut = AddressIn + offsetIn;
endmodule