`timescale 1ns / 1ps

module PC(
    input clkIn,
    input resetIn,
    input [31:0] AddressIn,
    input FlushIn,
    input StallIn,
    output reg [31:0] AddressOut
    );
    reg [31:0] Address;
    always @(posedge clkIn, negedge resetIn) begin
        if(!resetIn) begin
            Address <= 0;
        end
        else if(FlushIn) begin
            Address <= AddressIn;
        end
        else if(StallIn == 0) begin
            Address <= AddressIn;
        end
    end
    always @(negedge clkIn) begin
        AddressOut <= Address;
    end
endmodule