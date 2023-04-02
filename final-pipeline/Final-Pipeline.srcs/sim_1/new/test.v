`timescale 1ns / 1ps

module test(

    );
    reg clkIn;
    reg resetIn;
    reg [15:0] sw_i;
    wire[7:0] disp_seg_o;
    wire[7:0] disp_an_o;
    
    initial begin 
        clkIn=0;
        sw_i = 16'b1000_0000_0000_0001;
        forever 
            #1 clkIn=~clkIn;
     end

    initial begin resetIn=1; #3 resetIn=0; #1 resetIn=1; end
    
    Computer myComputer(clkIn,resetIn,sw_i,disp_seg_o,disp_an_o);
    
endmodule
