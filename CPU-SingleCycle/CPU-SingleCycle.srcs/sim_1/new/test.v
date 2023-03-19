`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/13 10:15:36
// Design Name: 
// Module Name: test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test(

    );
    reg clkIn;
    reg resetIn;
    wire[7:0] disp_seg_o;
    wire[7:0] disp_an_o;
    Computer myComputer(clkIn,resetIn,disp_seg_o,disp_an_o);
    initial begin clkIn=0; forever #1 clkIn=~clkIn; end
    initial begin resetIn=1; #0.5 resetIn=0; #1 resetIn=1; end
endmodule
