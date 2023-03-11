module AddressMUX(
    input ALULess,
    input ALUZero,
    input [31:0] ALUResult,
    input [31:0] PCPlusOffset,
    input [31:0] PCPlusOne,
    input [2:0] AddressSelect,
    output reg [31:0] AddressOut
    );

    always @(*) begin
        if(AddressSelect == 0) begin
            AddressOut <= PCPlusOne;
        end
        else if(AddressSelect == 1) begin //blt
            if(ALULess == 1) begin
                AddressOut <= PCPlusOffset;
            end
            else begin
                AddressOut <= PCPlusOne;
            end
        end
        else if(AddressSelect == 2) begin //beq
            if(ALUZero == 1) begin 
                AddressOut <= PCPlusOffset;
            end
            else begin
                AddressOut <= PCPlusOne;
            end
        end
        else if(AddressSelect == 3) begin //jal
            AddressOut <= PCPlusOffset;
        end
        else if(AddressSelect == 4) begin //jalr
            AddressOut <= ALUResult;
        end
        else begin //reset
            AddressOut <= 0;
        end
    end
endmodule