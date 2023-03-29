`timescale 1ns / 1ps

module IMem(
    input [31:0] AddressIn,
    output [31:0] InstructionOut
    );
    wire[31:0] ROM[31:0];
    assign ROM[0]=32'h00000f0e;
    assign ROM[1]=32'h0000008e;
    assign ROM[2]=32'h00808082;
    assign ROM[3]=32'h00003113;
    assign ROM[4]=32'h00018f82;
    assign ROM[5]=32'h00000012;
    assign ROM[6]=32'h0000018e;
    assign ROM[7]=32'h00118182;
    assign ROM[8]=32'h0000020e;
    assign ROM[9]=32'h00320202;
    assign ROM[10]=32'h00408911;
    assign ROM[11]=32'h002f0010;
    assign ROM[12]=32'h001f0f02;
    assign ROM[13]=32'hfff08082;
    assign ROM[14]=32'h001f0010;
    assign ROM[15]=32'h001f0f02;
    assign ROM[16]=32'hffff6113;
    assign ROM[17]=32'hffff0f02;
    assign ROM[18]=32'h000f008f;
    assign ROM[19]=32'h003f0010;
    assign ROM[20]=32'h001f0f02;
    assign ROM[21]=32'hfff08082;
    assign ROM[22]=32'hffff0113;
    assign ROM[23]=32'hffff0f02;
    assign ROM[24]=32'h000f028f;
    assign ROM[25]=32'h00518181;
    assign ROM[26]=32'hffff0f02;
    assign ROM[27]=32'h000f010f;
    assign ROM[28]=32'h00010014;
    assign ROM[29]=32'h00000000;
    assign ROM[30]=32'h00000000;
    assign ROM[31]=32'h00000000;
    assign InstructionOut = ROM[AddressIn];
endmodule