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
    input dispmode,
    output [31:0] ReadData1,
    output [31:0] ReadData2,
    output [31:0] portOut
    );
    reg [31:0] Registers [31:0];
    integer i;
    initial begin
        for(i = 0; i < 32; i = i + 1) begin
            Registers[i] = i;
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
    assign ReadData1 = Registers[Register1];
    assign ReadData2 = Registers[Register2];
    assign portOut = dispmode? Registers[31][31:0]: AddressIn; //display result through R31
endmodule