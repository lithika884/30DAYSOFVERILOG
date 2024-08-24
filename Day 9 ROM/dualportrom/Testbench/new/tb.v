`timescale 1ns / 1ps

module tb_dualport_rom();
  reg clk;
  reg [3:0] a_addr, b_addr;
  wire [3:0] dout_a, dout_b;
  
  // Instantiate the dual-port ROM
  dualport_rom dut (
    .clk(clk),
    .a_addr(a_addr),
    .b_addr(b_addr),
    .dout_a(dout_a),
    .dout_b(dout_b)
  );
  
  // Clock generation
  initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
  end
  
  integer i;
  
  // Test sequence
  initial begin
    
    
    a_addr = 4'b0000;
    b_addr = 4'b0000;
    
    for(i = 0; i < 16; i = i + 1) begin
      a_addr = $urandom_range(0, 7);
      b_addr = $urandom_range(8, 15);
      #10;
    end
    
    #10;
    $finish();
  end
  
  // Monitor output
  initial begin
    $monitor("time: %0t | dout_a: %d | dout_b: %d", $time, dout_a, dout_b);
    $dumpfile("dump.vcd");
    $dumpvars(1, tb_dualport_rom);
  end
  
endmodule

