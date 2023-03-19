`timescale 1ns / 1ps

module PC(
    input clkIn,
    input resetIn,
    input [31:0] AddressIn,
    output reg[31:0] AddressOut
    );
<<<<<<< HEAD
    always @(posedge clkIn, negedge resetIn) begin
=======
    always @(posedge clkIn) begin
>>>>>>> e7caab919607f42aac18ce0c961f2bf754f465d5
        if(!resetIn) begin
            AddressOut <= 0;
        end
        else begin
            AddressOut <= AddressIn;
        end
    end
endmodule