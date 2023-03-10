`include "xgriscv_defines.v"

module imem(input  [`ADDR_SIZE-1:0]   a,
            output [`INSTR_SIZE-1:0]  rd);

  reg  [`INSTR_SIZE-1:0] RAM[`IMEM_SIZE-1:0];

  assign rd = RAM[a[11:2]]; // instruction size aligned
endmodule


module dmem(input                     clk, we,
            input  [`XLEN-1:0]        a, wd,
            input  [`ADDR_SIZE-1:0]   pc,
            output [`XLEN-1:0]        rd);

  reg  [31:0] RAM[1023:0];

  assign rd = RAM[a[11:2]]; // word aligned

  always @(posedge clk)
    if (we)
      begin
        RAM[a[11:2]] <= wd;          	  // sw
        // DO NOT CHANGE THIS display LINE!!!
        // 不要修改下面这行display语句！！！
        // 对于所有的store指令，都输出位于写入目标地址四字节对齐处的32位数据，不需要修改下面的display语句
        /**********************************************************************/
        $display("pc = %h: dataaddr = %h, memdata = %h", pc, {a[31:2],2'b00}, wd);
        /**********************************************************************/
  	  end
endmodule
