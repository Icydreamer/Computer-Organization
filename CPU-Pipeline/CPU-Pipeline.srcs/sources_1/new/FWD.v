module FWD(
    input [4:0] IDEXrs1In,
    input [4:0] IDEXrs2In,
    input [4:0] EXMEMrdIn,
    input EXMEMRegisterWriteIn,
    input [1:0] EXMEMDataSelectorIn,
    input MEMWBrdIn,
    input MEMWBRegisterWriteIn,
    output reg [2:0] ForwardAOut,
    output reg [2:0] ForwardBOut //
);
    // rs1
    always @(*) begin
        // EX
        if(EXMEMRegisterWriteIn && (EXMEMrdIn == IDEXrs1In)) begin
            if(EXMEMDataSelectorIn == 0) begin // ALUResult
                ForwardAOut <= 1;
            end
            else if(EXMEMDataSelectorIn == 1) begin // Imm
                ForwardAOut <= 2;
            end
            else if(EXMEMDataSelectorIn == 3) begin // Address
                ForwardAOut <= 3;
            end
            else begin
                ForwardAOut <= 5;
            end
        end
        // MEM
        else if(MEMWBRegisterWriteIn) begin
            //if(!(EXMEMRegisterWriteIn && (EXMEMrdIn == IDEXrs1In))) begin
            if(MEMWBrdIn == IDEXrs1In) begin
                ForwardAOut <= 4;
            end
            //end
        end
        else begin
            ForwardAOut <= 0;
        end
    end

    // rs2
    always @(*) begin
        // EX
        if(EXMEMRegisterWriteIn && EXMEMrdIn == IDEXrs2In) begin
            if(EXMEMDataSelectorIn == 0) begin
                ForwardBOut <= 1;
            end
            else if (EXMEMDataSelectorIn == 1) begin
                ForwardBOut <= 2;
            end
            else if (EXMEMDataSelectorIn == 3) begin
                ForwardBOut <= 3;
            end
            else begin
                ForwardBOut<=5;
            end
        end
        // MEM
        else if(MEMWBRegisterWriteIn) begin
            //if(!(EXMEMRegisterWriteIn && (EXMEMrdIn == IDEXrs2In))) begin
            if(MEMWBrdIn == IDEXrs2In) begin
                ForwardBOut <= 4;
            end
            //end
        end
        else begin
            ForwardBOut <= 0;
        end
    end
endmodule