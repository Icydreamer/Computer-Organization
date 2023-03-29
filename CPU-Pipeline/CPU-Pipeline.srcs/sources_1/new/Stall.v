module Stall(
    input [4:0] IFIDrs1In,
    input [4:0] IFIDrs2In,
    input [4:0] IDEXrdIn,
    input IDEXMemReadIn,
    
    input EXMEMRegisterWriteIn,
    input [4:0] EXMEMrdIn,

    output reg StallOut 
);
    
    always @(*) begin
        if(IDEXMemReadIn) begin
            if((IDEXrdIn == IFIDrs1In) || (IDEXrdIn == IFIDrs2In)) begin
                StallOut <= 1;
            end
        end
        else if(EXMEMRegisterWriteIn) begin
            if(EXMEMrdIn == IFIDrs1In || EXMEMrdIn == IFIDrs2In) begin
                StallOut <= 1;
            end
        end
        else begin
            StallOut <= 0;
        end
    end
endmodule