module IMem(
    input [31:0] AddressIn,
    output [31:0] InstructionOut
    );
    wire[31:0] ROM[9:0];         // store test program
    assign ROM[0]=32'h0000008e; // the first instruction
    assign ROM[1]=32'h0000010e;
    assign ROM[2]=32'h00110102;
    assign ROM[3]=32'h0000018e;
    assign ROM[4]=32'h06518182;
    assign ROM[5]=32'h00208081;
    assign ROM[6]=32'h00110102;
    assign ROM[7]=32'hfe310f11;
    assign ROM[8]=32'h00008f82;
    assign ROM[9]=32'h00000012; // the last instruction
    assign InstructionOut = ROM[AddressIn];
endmodule