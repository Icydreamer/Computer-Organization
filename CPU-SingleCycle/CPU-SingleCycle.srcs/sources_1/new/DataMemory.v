module DataMemory(
    input clkIn,
    input resetIn,
    input [31:0] AddressIn,//from alu
    input [31:0] WriteData,// from register
    input MemRead,//control
    input MenWrite,
    output [31:0] ReadData
    );
    reg [31:0] Memory[31:0];
    integer i;
    assign ReadData = MemRead? Memory[AddressIn]: 0;
    always @(posedge clkIn) begin
        if(resetIn) begin
            for(i = 0; i < 32; i = i + 1) begin
                Memory[i] = 0;
            end
        end
        else if(MenWrite) begin
            Memory[AddressIn] <= WriteData;
        end
    end
endmodule