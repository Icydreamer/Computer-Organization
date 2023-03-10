`include "xgriscv_defines.v"
module xgriscv_sc(clk, reset, pc);
  input             clk, reset;
  output [31:0]     pc;

  wire [31:0]       instr;
  wire              memwrite;
  wire [3:0]        amp;
  wire [31:0]       addr, writedata, readdata;
   
  imem U_imem(pc, instr);

  dmem U_dmem(clk, memwrite, addr, writedata, readdata);
  
  xgriscv U_xgriscv(clk, reset, pc, instr, memwrite, amp, addr, writedata, readdata);
  
endmodule

// xgriscv: a single cycle riscv processor
module xgriscv(input         			        clk, reset,
               output [31:0] 			        pc,
               input  [`INSTR_SIZE-1:0]   instr,
               output					            memwrite,
               output [3:0]  			        amp,
               output [`ADDR_SIZE-1:0] 	  daddr, 
               output [`XLEN-1:0] 		    writedata,
               input  [`XLEN-1:0] 		    readdata);
	
  wire [6:0]  op;
 	wire [2:0]  funct3;
	wire [6:0]  funct7;
  wire [4:0]  rd, rs1;
  wire [11:0] imm;
  wire        zero, lt;
  wire [4:0]  immctrl;
  wire        itype, jal, jalr, bunsigned, pcsrc;
  wire [3:0]  aluctrl;
  wire [1:0]  alusrca;
  wire        alusrcb;
  wire        memwrite, lunsigned;
  wire        memtoreg, regwrite;

  controller  c(clk, reset, op, funct3, funct7, rd, rs1, imm, zero, lt,
              immctrl, itype, jal, jalr, bunsigned, pcsrc, 
              aluctrl, alusrca, alusrcb, 
              memwrite, lunsigned, 
              memtoreg, regwrite);


  datapath    dp(clk, reset,
              instr, pc,
              readdata, daddr, writedata, memwrite,
              immctrl, itype, jal, jalr, bunsigned, pcsrc, 
              aluctrl, alusrca, alusrcb, 
              memwrite, lunsigned,
              memtoreg, regwrite, 
              op, funct3, funct7, rd, rs1, imm, zero, lt);

endmodule
