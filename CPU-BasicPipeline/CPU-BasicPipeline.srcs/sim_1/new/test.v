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
    reg [15:0] sw_i;
    wire[7:0] disp_seg_o;
    wire[7:0] disp_an_o;
    
    initial begin 
        clkIn=0;
        forever
            #1 clkIn=~clkIn;
    end
    initial begin
        resetIn=1;
        #0.5 resetIn=0;
        #1 resetIn=1; 
    end
    initial begin
        sw_i = 16'b0000_0000_0000_0001;
    end
    Computer myComputer(clkIn,resetIn,sw_i,disp_seg_o,disp_an_o);
/*
    initial begin 
        clkIn=0; 
        resetIn = 1;
        #1 resetIn = 0;
        forever 
            #1 clkIn=~clkIn; 
    end*/
endmodule
