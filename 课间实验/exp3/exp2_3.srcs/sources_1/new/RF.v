`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/20 13:33:22
// Design Name: 
// Module Name: RF
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

module RF(  
    input clk,  
    input rstn,
      // дʹ���ź�  \
    input RFWr, 
    input [15:0] sw_i, 
    // ����ַ  
    input[4:0] rf_addr_r1,  //rs
    input[4:0] rf_addr_r2,  //rt
    // д���ַ��д������?  
    input[4:0] rf_addr_w,  //rd
    input[31:0] WD,  
    // ����˿�?  
    output[31:0] rf_data_r1,  
    output[31:0] rf_data_r2,  
    output reg  [31:0] reg_disp_data
  );  
 reg[31:0] file[31:0];


 integer init_index;
 initial begin
 for(init_index = 0; init_index < 32; init_index=init_index+1) file[init_index] = init_index;
 end

reg [4:0]reg_address;
initial begin 
    reg_address=0;
    end
    
always@(negedge clk)begin 
        if(reg_address<31)begin
        reg_disp_data=file[reg_address];
        reg_address=reg_address+1'b1;
            end
    else begin reg_address=0;
    reg_disp_data=16'hffff;
    end
end

 
 always@(negedge clk)
 begin
	if(RFWr&&!sw_i[1])file[rf_addr_w]=WD;
 end 
 
 assign rf_data_r1=file[rf_addr_r1];
 assign rf_data_r2=file[rf_addr_r2];
 
 endmodule