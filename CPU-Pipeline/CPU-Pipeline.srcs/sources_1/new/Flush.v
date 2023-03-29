module Flush(
    input ALULessIn,
    input ALUZeroIn,
    input [2:0] EXMEMAddressSelectorIn,
    output reg FlushOut //
);
    always @(*) begin
        if(EXMEMAddressSelectorIn == 1) begin // blt
            if(ALULessIn == 1) begin
                FlushOut <= 1;
            end
            else begin
                FlushOut <= 0;
            end
        end
        else if(EXMEMAddressSelectorIn == 2) begin //beq
            if(ALUZeroIn == 1) begin 
                FlushOut <= 1;
            end
            else begin
                FlushOut <= 0;
            end
        end
        else if(EXMEMAddressSelectorIn == 3) begin //jal
            FlushOut <= 1;
        end
        else if(EXMEMAddressSelectorIn == 4) begin //jalr
            FlushOut <= 1;
        end
        else begin
            FlushOut <= 0;
        end
    end
endmodule