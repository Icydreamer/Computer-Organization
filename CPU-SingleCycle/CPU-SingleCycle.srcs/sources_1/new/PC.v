`timescale 1ns / 1ps

module PC(
    input clkIn,
    input resetIn,
    input [31:0] AddressIn,
    output reg[31:0] AddressOut
    );
    always @(posedge clkIn) begin
        if(resetIn) begin
            AddressOut <= 0;
        end
        else begin
            AddressOut <= AddressIn;
        end
    end
endmodule