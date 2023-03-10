module ALU(
    input [31:0] ReadData1;
    input [31:0] ReadData2;
    input [2:0] ALUOperation;
    output LessOut;
    output ZeroOut;
    output reg[31:0] ResultOut;
);
    always @(*) begin
        case (ALUOperation)
            3'b001: ResultOut<=Data1In+Data2In; //add,addi
            3'b010: ResultOut<=Data1In-Data2In; //sub
            3'b011: ResultOut<=Data1In&Data2In; //and, andi
            3'b100: ResultOut<=Data1In|Data2In; //or, or
            3'b101: ResultOut<=Data1In^Data2In; //xor xori
            3'b110: if (Data2In>31) begin
                        ResultOut<=32'h00000000;
                    end
                    else if (Data2In>0) begin
                        ResultOut<=Data1In<<Data2In; //sll,slli
                    end
                    else begin
                        ResultOut<=Data1In;
                    end
            3'b111: if (Data2In>31) begin
                        ResultOut<=32'h00000000;
                    end
                    else if (Data2In>0) begin
                        ResultOut<=Data1In>>Data2In; //srl,srli
                    end
                    else begin
                        ResultOut<=Data1In;
                    end
            default: ResultOut<=32'h00000000; //other cases
        endcase
    end
    assign LessOut = (ReadData1 < ReadData2)? 1: 0;
    assign ZeroOut = (ResultOut == 0)? 1: 0;
endmodule