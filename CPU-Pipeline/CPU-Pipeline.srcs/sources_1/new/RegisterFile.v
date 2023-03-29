`timescale 1ns / 1ps

module RegisterFile(
    input clkIn,
    input resetIn,
    input [4:0] Register1,
    input [4:0] Register2,
    input [4:0] RegisterDestination,
    input [31:0] WriteData,
    input RegisterWrite,
    input [31:0] AddressIn,
    input [15:0] sw_i,
    output reg [31:0] ReadData1,
    output reg [31:0] ReadData2,
    output reg [31:0] portOut
    );
    reg [31:0] Registers [31:0];
    integer i;
    initial begin
        for(i = 0; i < 32; i = i + 1) begin
            Registers[i] = 0;
        end
    end
    always @(posedge clkIn, negedge resetIn) begin
        if(!resetIn) begin
            for(i = 0; i < 32; i = i + 1) begin
                Registers[i] <= 0;
            end
        end
        else 
        if(RegisterWrite) begin
            Registers[RegisterDestination] <= WriteData;
        end
    end
    always @(negedge clkIn) begin
        ReadData1 = Registers[Register1];
        ReadData2 = Registers[Register2];
        portOut = sw_i[0]? Registers[3][31:0]: AddressIn;
    end
endmodule