`include "xgriscv_defines.v"

module datapath(
	input						clk, reset,

	input [`INSTR_SIZE-1:0]		instr,
	output[`ADDR_SIZE-1:0]		pc,

	input [`XLEN-1:0]			readdata, 	// from data memory: read data
	output[`XLEN-1:0]			aluout,		// to data memory: address
 	output[`XLEN-1:0]			writedata, 	// to data memory: write data
	output						memwrite,	// to data memory: write enable
	
	// from controller
	input [4:0]		            immctrl,
	input			            itype, jal, jalr, bunsigned, pcsrc,
	input [3:0]		            aluctrl,
	input [1:0]		            alusrca,
	input			            alusrcb,
	input						memwrite, lunsigned,
	input          		        memtoreg, regwrite,
	
  	// to controller
	output [6:0]				op,
	output [2:0]				funct3,
	output [6:0]				funct7,
	output [4:0]				rd, rs1,
	output [11:0]  		        immD,
	output 	       		        zero, lt
	);


	wire [`RFIDX_WIDTH-1:0] 	rs2;
	assign  op		= instrD[6:0];
	assign  rd		= instrD[11:7];
	assign  funct3	= instrD[14:12];
	assign  rs1		= instrD[19:15];
	assign  rs2   	= instrD[24:20];
	assign  funct7	= instrD[31:25];
	assign  imm		= instrD[31:20];

	// immediate generation
	wire [11:0]				iimm = instr[31:20];
	wire [11:0]				simm	= 12'b0;
	wire [11:0]  			bimm	= 20'b0;
	wire [19:0]				uimm	= instr[31:12];
	wire [19:0]  			jimm	= 20'b0;
	wire [`XLEN-1:0]		immout, shftimm;
	wire [`XLEN-1:0]		rdata1, rdata2, wdata;
	wire [`RFIDX_WIDTH-1:0]	waddr;

	imm 	im(iimm, simm, bimm, uimm, jimm, immctrl, immout);

	// register file
	regfile rf();

	// alu
	alu 	alu();


endmodule