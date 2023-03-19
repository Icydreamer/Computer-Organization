module MEMWB(
    input clkIn,
    input resetIn,

    // control
    input [1:0] RegisterDataSelectIn,
    input RegisterWriteIn,

    input [31:0] ALUResultIn,
<<<<<<< HEAD
    input [31:0] DataIn,
=======
    input [31:0] Data2In.
>>>>>>> e7caab919607f42aac18ce0c961f2bf754f465d5
    input [31:0] Imm32In,
    input [31:0] retAddressIn,
    input [4:0] rdIn,
    //control
    output reg [1:0] RegisterDataSelectOut,
    output reg RegisterWriteOut,

    output reg [31:0] ALUResultOut,
<<<<<<< HEAD
    output reg [31:0] DataOut,
    output reg [31:0] Imm32Out,
    output reg [31:0] retAddressOut,
    output reg [4:0] rdOut
    );
    always @(posedge clkIn, negedge resetIn) begin
=======
    output reg [31:0] Data2Out,
    output reg [31:0] Imm32Out,
    output reg [31:0] retAddressOut,
    output reg [4:0] rdIn
    );
    always @(posedge clk, negedge resetIn) begin
>>>>>>> e7caab919607f42aac18ce0c961f2bf754f465d5
        if (!resetIn) begin
            //control
            RegisterDataSelectOut <= 0;
            RegisterWriteOut <= 0;


            ALUResultOut <= 0;
<<<<<<< HEAD
            DataOut <= 0;
=======
            Data2Out <= 0;
>>>>>>> e7caab919607f42aac18ce0c961f2bf754f465d5
            Imm32Out <= 0;
            retAddressOut <= 0;
            rdOut <= 0;
        end
        else begin
            //control
            RegisterDataSelectOut <= RegisterDataSelectIn;
            RegisterWriteOut <= RegisterWriteIn;

            ALUResultOut <= ALUResultIn;
<<<<<<< HEAD
            DataOut <= DataIn;
=======
            Data2Out <= Data2In;
>>>>>>> e7caab919607f42aac18ce0c961f2bf754f465d5
            Imm32Out <= Imm32In;
            retAddressOut <= retAddressIn;
            rdOut <= rdIn;
        end
    end
endmodule
