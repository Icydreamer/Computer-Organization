module PC(
    input clkIn,
    input resetIn,
    input [31:0] AddrIn,
    output reg[31:0] AddrOut
);
    always @(posedge clkIn) begin
        if(resetIn) begin
            AddrOut <= 0;
        end
        else begin
            AddrOut <= AddrIn;
        end
    end
endmodule