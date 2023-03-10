`include "xgriscv_defines.v"

module xgriscv_tb();
    
   reg                  clk, rstn;
   wire[`ADDR_SIZE-1:0] pc;
    
   // instantiation of xgriscv_sc
   xgriscv_sc xgriscv(clk, rstn, pc);

   integer counter = 0;
   
   initial begin
      $readmemh("riscv32_sim1.hex", xgriscv.U_imem.RAM);
      clk = 1;
      rstn = 1;
      #5 ;
      rstn = 0;
   end
   
   always begin
      #(50) clk = ~clk;
     
      if (clk == 1'b1) 
      begin
         counter = counter + 1;
         //comment out the display line(s) for online judge
         //$display("pc:\t\t%h", pc);
         if (pc == 32'h0000001c) // set to the address of the last instruction
          begin
            //$display("pc:\t\t%h", pc);
            //$finish;
            $stop;
          end
      end
      
   end //end always
   
endmodule
