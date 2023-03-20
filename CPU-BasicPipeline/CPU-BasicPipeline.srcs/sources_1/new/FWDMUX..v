module FWDMUX(
    input [31:0] RegisterData1In,
    input [31:0] RegisterData2In,
    input [31:0] ALUResultIn,
    input [31:0] Imm32In,
    input [31:0] RetAddressIn,
    input [31:0] RegisterDataIn,

    input Forward1In,
    input Forward2In,
    
    output RegisterData1Out,
    output RegisterData2Out //
);
    
endmodule