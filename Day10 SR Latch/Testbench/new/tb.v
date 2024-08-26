// Code your testbench here
// or browse Examples
`timescale 1ns/1ps

module tb_sr_latch();
  reg s, r, en;
  wire q, qbar;
  
  sr_latch dut(
    .s(s),
    .r(r),
    .en(en),
    .q(q),
    .qbar(qbar)
  );
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1, tb_sr_latch);
    en = 1'b1;
    forever #30 en = ~en;
  end
  
  initial begin
   #10 s = 0; r = 0;  // No change state
    #10 s = 1; r = 0;  // Set state
    #10 s = 0; r = 1;  // Reset state
    #10 s = 1; r = 1;  // Invalid state
    #10 s = 0; r = 0;  // No change state
    #20;
    $finish();
  end
  
  initial begin
    $monitor("s = %d, r = %d, q = %d, qbar = %d", s, r, q, qbar);
  end 
  
endmodule
